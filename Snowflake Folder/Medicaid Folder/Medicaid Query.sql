// Medicaid Database //

SELECT 
    PRODUCT_NAME,
    COUNT(*)
FROM DRUG_UTIL
GROUP BY PRODUCT_NAME
ORDER BY COUNT(*) DESC

//
//

SELECT 
    PRODUCT_NAME,
    SUM(NUMBER_OF_PRESCRIPTIONS),
    SUM(total_amount_reimbursed),
    SUM(medicaid_amount_reimbursed)
FROM DRUG_UTIL
GROUP BY PRODUCT_NAME
ORDER BY SUM(total_amount_reimbursed) DESC

//
//

SELECT 
    YEAR,
    SUM(total_amount_reimbursed),
    SUM(number_of_prescriptions)
FROM DRUG_UTIL
GROUP BY YEAR
ORDER BY SUM(total_amount_reimbursed) DESC

//
//

SELECT 
    PRODUCT_NAME,
    SUM(total_amount_reimbursed),
    SUM(MEDICAID_AMOUNT_REIMBURSED),
    SUM(number_of_prescriptions)
FROM DRUG_UTIL
GROUP BY PRODUCT_NAME
ORDER BY SUM(total_amount_reimbursed) DESC
LIMIT 10
