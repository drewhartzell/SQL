SELECT
    r.CUSTOMER_ID,
    r.INSTRUMENT:"instrumentType"::STRING   AS instrument_type,
    r.INSTRUMENT:"model"::STRING            AS instrument_model,
    r.INSTRUMENT:"firmwareVersion"::STRING  AS firmware_version,
    r.INSTRUMENT:"serialNumber"::STRING     AS instrument_serial,
    sr.value:gasType::STRING                AS sensor_gas_type,
    sr.value:gasUnit::STRING                AS sensor_gas_unit,
    sr.value:AsFound::NUMBER                AS sensor_as_found,
    sr.value:Target::NUMBER                 AS sensor_target,
    sr.value:spanValue::NUMBER              AS sensor_span_value,
    sr.value:zeroValue::NUMBER              AS sensor_zero_value,
    sr.value:zeroCompensatorValue::NUMBER   AS sensor_zero_comp_value,
    sr.value:status::STRING                 AS sensor_status,
    sr.value:sensorLifeHealth::STRING       AS sensor_life_health,
    sr.value:testType::STRING               AS sensor_test_type,
    sr.value:beadState::BOOLEAN              AS sensor_bead_state

FROM object_layer.object_layer.ol__grid__calibration_records r,
     LATERAL FLATTEN(input => r.SENSOR_RESULTS) sr
WHERE r.grid_source = 'grid_prod_data'
  AND r.INSTRUMENT_TYPE = 'io4'
  AND r.IS_DELETED = 'false';
