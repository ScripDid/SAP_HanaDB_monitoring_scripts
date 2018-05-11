--Display memory usage by components
SELECT
        host,
        component,
        sum(used_memory_size) used_mem_size
FROM PUBLIC.M_SERVICE_COMPONENT_MEMORY
group by host,
        component
ORDER BY sum(used_memory_size) desc;
