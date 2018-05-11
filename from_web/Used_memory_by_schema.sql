--Display current memory used breakdown by Schema
SELECT
        SCHEMA_NAME AS "Schema",
        ROUND(SUM(MEMORY_SIZE_IN_TOTAL) /1024/1024) AS "MB Used"
FROM M_CS_TABLES
GROUP BY SCHEMA_NAME
ORDER BY "MB Used" DESC;
