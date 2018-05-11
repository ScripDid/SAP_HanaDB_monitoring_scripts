-- find which node your session is connected to
SELECT

        HOST,

        PORT,

        CONNECTION_ID

FROM M_CONNECTIONS

WHERE OWN = 'TRUE';
