-- This is your Cortex Project.
-----------------------------------------------------------
-- SETUP
-----------------------------------------------------------
use role ACCOUNTADMIN;
use warehouse COMPUTE_WH;
use database ETSY;
use schema PUBLIC;

-- Inspect the first 10 rows of your training data. This is the data we'll use to create your model.
select * from SALES limit 10;

-- Prepare your training data. Timestamp_ntz is a required format. Also, only include select columns.
CREATE VIEW SALES_v1 AS SELECT
    to_timestamp_ntz(ORDER_DATE) as ORDER_DATE_v1,
    NET_AMOUNT
FROM SALES;



-----------------------------------------------------------
-- CREATE PREDICTIONS
-----------------------------------------------------------
-- Create your model.
CREATE SNOWFLAKE.ML.FORECAST my_model(
    INPUT_DATA => SYSTEM$REFERENCE('VIEW', 'SALES_v1'),
    TIMESTAMP_COLNAME => 'ORDER_DATE_v1',
    TARGET_COLNAME => 'NET_AMOUNT'
);

-- Generate predictions and store the results to a table.
BEGIN
    -- This is the step that creates your predictions.
    CALL my_model!FORECAST(
        FORECASTING_PERIODS => 14,
        -- Here we set your prediction interval.
        CONFIG_OBJECT => {'prediction_interval': 0.95}
    );
    -- These steps store your predictions to a table.
    LET x := SQLID;
    CREATE TABLE My_forecasts_2025_05_26 AS SELECT * FROM TABLE(RESULT_SCAN(:x));
END;

-- View your predictions.
SELECT * FROM My_forecasts_2025_05_26;

-- Union your predictions with your historical data, then view the results in a chart.
SELECT ORDER_DATE, NET_AMOUNT AS actual, NULL AS forecast, NULL AS lower_bound, NULL AS upper_bound
    FROM SALES
UNION ALL
SELECT ts as ORDER_DATE, NULL AS actual, forecast, lower_bound, upper_bound
    FROM My_forecasts_2025_05_26;

-----------------------------------------------------------
-- INSPECT RESULTS
-----------------------------------------------------------

-- Inspect the accuracy metrics of your model. 
CALL my_model!SHOW_EVALUATION_METRICS();

-- Inspect the relative importance of your features, including auto-generated features. 
CALL my_model!EXPLAIN_FEATURE_IMPORTANCE();
