// Exceptions Query //

SELECT
    SPLIT_PART(PRODUCING_LOCATION, ' - ', 1) AS Plant,
    SPLIT_PART(PRODUCING_LOCATION, ' - ', 2) AS Plant_Name,
    ITEM_CODE AS Material,
    ITEM_DESCRIPTION AS Material_Description,
    CONCAT(ITEM_CODE, ' - ', ITEM_DESCRIPTION) AS Material_String,
    ITEM_TYPE,
    ITEM_GROUP,
    SPLIT_PART(SUPPLIER, ' - ', 1) AS Supplier_Name,
    SPLIT_PART(SUPPLIER, ' - ', 2) AS Supplier_Code,
    CASE
        WHEN LENGTH(SPLIT_PART(SUPPLIER, ' - ', 2)) = 6 THEN 'External Supplier'
        ELSE 'Internal Company'
    END AS Supplier_Type,
    EXCEPTION_MESSAGE,
    PO_NUMBER,
    PO_LINE,
    OPEN_PO_VALUE_STANDARD_PRICE AS Open_PO_Value,
    BUYER,
    PLANNER,
    MATERIAL_TYPE,
    BUSINESS_UNIT AS Region,
    EXPORT_DATE,
    YEAR,
    MONTH,
    DAY,
    REQUESTED_DATE,
    RESCHEDULE_DATE,
    CASE
        WHEN RESCHEDULE_DATE != '1970-01-01' THEN RESCHEDULE_DATE
        ELSE REQUESTED_DATE
    END AS RESOLUTION_DATE,
    DATEDIFF(
        DAY,
        CASE
            WHEN RESCHEDULE_DATE != '1970-01-01' THEN RESCHEDULE_DATE
            ELSE REQUESTED_DATE
        END,
        CURRENT_DATE
    ) AS RESOLUTION_DELTA
FROM XXXXX
WHERE (DELIVERY_STATUS = 'Open - Behind Schedule' 
       OR DELIVERY_STATUS = 'Open')
    AND YEAR = 2025;

//
//

SELECT
    SPLIT_PART(PRODUCING_LOCATION, ' - ', 1) AS Plant,
    SPLIT_PART(PRODUCING_LOCATION, ' - ', 2) AS Plant_Name,
    ITEM_CODE AS Material,
    ITEM_DESCRIPTION AS Material_Description,
    CONCAT(ITEM_CODE, ' - ', ITEM_DESCRIPTION) AS Material_String,
    ITEM_TYPE,
    ITEM_GROUP,
    SPLIT_PART(SUPPLIER, ' - ', 1) AS Supplier_Name,
    SPLIT_PART(SUPPLIER, ' - ', 2) AS Supplier_Code,
    CASE
        WHEN LENGTH(SPLIT_PART(SUPPLIER, ' - ', 2)) = 6 THEN 'External Supplier'
        ELSE 'Internal Company'
    END AS Supplier_Type,
    EXCEPTION_MESSAGE,
    PO_NUMBER,
    PO_LINE,
    OPEN_PO_VALUE_STANDARD_PRICE AS Open_PO_Value,
    BUYER,
    PLANNER,
    MATERIAL_TYPE,
    BUSINESS_UNIT AS Region,
    EXPORT_DATE,
    YEAR,
    MONTH,
    DAY,
    REQUESTED_DATE,
    RESCHEDULE_DATE
FROM OBJECT_LAYER.OBJECT_LAYER.OL__LEANDNA_PURCHASE_ORDERS
WHERE (DELIVERY_STATUS = 'Open - Behind Schedule' 
       OR DELIVERY_STATUS = 'Open')
    AND YEAR = 2025;
