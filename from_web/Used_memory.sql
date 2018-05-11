--Display the current size of the Used Memory. you can use the following SQL statement
SELECT

        ROUND(SUM(TOTAL_MEMORY_USED_SIZE/1024/1024/1024),

        2) AS "Used Memory GB"

FROM SYS.M_SERVICE_MEMORY;
