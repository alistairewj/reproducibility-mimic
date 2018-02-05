-- tables required before generating the data matters tables

\echo 'Step 1 of 3: Generating the mimic-code concepts required'
\i ../mimic-code/concepts/firstday/height-first-day.sql
\i ../mimic-code/concepts/firstday/weight-first-day.sql

\echo 'Step 2 of 3: Generating the mortality-prediction concepts required'
-- these two must be run first
\i mp/cohort.sql
\i mp/hourly-cohort.sql
-- order doesn't matter for the rest (except data)
\i mp/bg.sql
\i mp/code-status.sql
\i mp/colloid-bolus.sql
\i mp/crystalloid-bolus.sql
\i mp/gcs.sql
\i mp/lab.sql
\i mp/static_data.sql
\i mp/uo.sql
\i mp/vital.sql
-- data query needs to be last
\i mp/data.sql

\echo 'Step 3 of 3: Generating reproducibility concepts present here'
-- here order matters
\i dm_word_count.sql
\i dm_obs_count.sql
\i dm_cohort.sql
\i dm_intime_outtime.sql
-- for the rest of the queries order is unimportant
\i dm_braindeath.sql
\i dm_dialysis_start.sql
\i dm_static_data.sql
\i dm_service.sql
\i dm_number_of_notes.sql
