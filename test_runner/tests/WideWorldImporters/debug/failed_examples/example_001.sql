-- Example "WideWorldImporters reference table: Application.People contains PersonID == 1 as a template"
-- ./spec/reference_data/application_People.rb:2
-- Executed at 2017-08-16 17:41:54 -0700

-- Initiate the example script
begin transaction;

-- Set default options
set textsize 2147483647;
set language us_english;
set dateformat mdy;
set datefirst 7;
set lock_timeout -1;
set quoted_identifier on;
set arithabort on;
set ansi_null_dflt_on on;
set ansi_warnings on;
set ansi_padding on;
set ansi_nulls on;
set concat_null_yields_null on;


-- query '/WideWorldImporters/reference_data/check_personid.sql.erb', options = {:id=>1}
select 
p.PersonID,
p.FullName,
p.PreferredName,
p.SearchName
from Application.People p
where p.PersonID = '1'

-- Rollback the changes made by the example script
if @@trancount > 0 rollback transaction;

--               SLACKER RESULTS
-- *******************************************
-- Failure/Error: expect(sql.WideWorldImporters.reference_data.check_personid(:id => 1)).to match('WideWorldImporters/reference_data/match/application_people_personid_1.csv')
-- 
-- TinyTds::Error:
--   Invalid object name 'Application.People'.
-- ./spec/reference_data/application_People.rb:3:in `block (2 levels) in <top (required)>'
-- *******************************************