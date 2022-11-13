use bank;

-- Activity 1

-- In the loan table (which is part of the bank database), there's column status A, B, C, and D. 
-- Using the case statement we will create a new column with the values there with a brief description:

select status from loan;

alter table loan
add column status_description text;

-- Error 1175 solution:
SET SQL_SAFE_UPDATES = 0;

update loan
set status_description = case
	when status = 'A' then 'Good - Contract Finished'
    when status = 'B' then 'Defaulter - Contract Finished'
    when status = 'C' then 'Good - Contract Running'
    when status = 'D' then 'In Debt - Contract Running'
    else null
end; 

-- -------------------------------

-- Activity 2
-- DATA ANOMALIES
-- https://beginnersbook.com/2015/05/normalization-in-dbms/

	-- INSERTION anomalies
		-- when we want to add new rows, not have all the data, but the DB does not accept nulls.
        
	-- UPDATION anomalies
		-- When there are 2 rows for the same subject (ie an employee assigned to 2 departments), when info gets updated in 1 row, data becomes alter
        -- incosistent for that employee
        
        -- DELETION anomalies
        -- When removing rows containing outdated info, we remove also all info about that subject (that's why we don't want to just remove NaNs
        -- rows in python)
        

-- -------------------------------


-- Activity 3
-- What could be possible anomalies in a table?
-- 1) empty strings in place of nulls, because the DB does not accept nulls in that cell, but we still needed to add a row
-- 2) Two rows about same subject having unmatching data
-- 3) Missing data because of complete rows deletion, caused by a simple missing value

