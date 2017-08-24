-- tables required before generating the data matters tables

\echo 'Step 1 of 3: Generating the mimic-code concepts required'
\i ../mimic-code/concepts/firstday/height-first-day.sql
\i ../mimic-code/concepts/firstday/weight-first-day.sql

\echo 'Step 2 of 3: Generating the mortality-prediction concepts required'
-- these two must be run first
\i ../mortality-prediction/queries/cohort.sql
\i ../mortality-prediction/queries/hourly-cohort.sql
-- order doesn't matter for the rest
\i ../mortality-prediction/queries/bg.sql
\i ../mortality-prediction/queries/code-status.sql
\i ../mortality-prediction/queries/colloid-bolus.sql
\i ../mortality-prediction/queries/crystalloid-bolus.sql
\i ../mortality-prediction/queries/gcs.sql
\i ../mortality-prediction/queries/lab.sql
\i ../mortality-prediction/queries/static_data.sql
\i ../mortality-prediction/queries/uo.sql
\i ../mortality-prediction/queries/vital.sql
\i ../mortality-prediction/queries/data.sql

\echo 'Step 3 of 3: Generating reproducibility concepts present here'
-- here order matters
\i dm_word_count.sql
\i dm_cohort.sql
\i dm_intime_outtime.sql
-- for the rest of the queries order is unimportant
\i dm_braindeath.sql
\i dm_dialysis_start.sql
\i dm_static_data.sql
\i dm_obs_count.sql
\i dm_service.sql
\i dm_number_of_notes.sql
