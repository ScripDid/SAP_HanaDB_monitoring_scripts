/* To see what tables are loaded to memory at any given time. If a report is running slow see if the table is loaded to memory though the tables goes on lazy loading it is a best practice to have the table loaded to memory. */
SELECT
        LOADED,
       TABLE_NAME,
        RECORD_COUNT,
        RAW_RECORD_COUNT_IN_DELTA ,
        MEMORY_SIZE_IN_TOTAL,
        MEMORY_SIZE_IN_MAIN,
        MEMORY_SIZE_IN_DELTA
from M_CS_TABLES
where schema_name = 'SCHEMA'
order by RAW_RECORD_COUNT_IN_DELTA Desc
