WITH region_CTE AS

(SELECT
  r.name AS region_name,
  COUNT(DISTINCT e.id) AS employee_count,
  COALESCE(SUM(s.amount),0) AS total_sales
FROM regions AS r
  LEFT JOIN states AS st
    ON r.id = st.regionId
      LEFT JOIN employees AS e
        ON st.id = e.stateId
          LEFT JOIN sales AS s
            ON e.id = s.employeeId
GROUP BY region_name)

SELECT
  region_name,
  CASE
    WHEN total_sales = 0 THEN 0
    ELSE total_sales/employee_count 
  END AS avg_sales,
  MAX(
      CASE 
        WHEN total_sales = 0 THEN 0
        ELSE total_sales/employee_count
      END) OVER () - 
              CASE
                WHEN total_sales = 0 THEN 0
                ELSE total_sales/employee_count 
              END AS sales_diff
FROM region_cte
ORDER BY avg_sales DESC

//
//

SELECT
  userId,
  AVG(duration)
FROM sessions
GROUP BY userId
HAVING count(*) > 1

//
//

SELECT
  i.name,
  s.name
FROM items AS i
  LEFT JOIN sellers AS s
    ON i.sellerId = s.id
WHERE rating > 4
