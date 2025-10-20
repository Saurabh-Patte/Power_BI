-- Fabric notebook source

-- METADATA ********************

-- META {
-- META   "kernel_info": {
-- META     "name": "synapse_pyspark"
-- META   },
-- META   "dependencies": {
-- META     "lakehouse": {
-- META       "default_lakehouse": "841c8d82-2183-4b16-813a-e97630c914bf",
-- META       "default_lakehouse_name": "SQL_LKHS",
-- META       "default_lakehouse_workspace_id": "f6f37e29-3a0a-4113-b788-41558f43c488",
-- META       "known_lakehouses": [
-- META         {
-- META           "id": "841c8d82-2183-4b16-813a-e97630c914bf"
-- META         }
-- META       ]
-- META     }
-- META   }
-- META }

-- CELL ********************

-- Welcome to your new notebook
-- Type here in the cell editor to add code!


-- METADATA ********************

-- META {
-- META   "language": "sparksql",
-- META   "language_group": "synapse_pyspark"
-- META }

-- CELL ********************



SELECT * FROM SQL_LKHS.EMEA_DRT_FW10 LIMIT 1000

-- METADATA ********************

-- META {
-- META   "language": "sparksql",
-- META   "language_group": "synapse_pyspark"
-- META }
