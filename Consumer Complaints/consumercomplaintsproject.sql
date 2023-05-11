SELECT * FROM sqlsample.consumercomplaints;
-- 
select *
from sqlsample.consumercomplaints 
where `Date Received` = `Date Sent to Company`;

-- count of how many complaints were received and sent on the same day 
select count(*) as samedaycomplaints
from sqlsample.consumercomplaints 
where `Date Received` = `Date Sent to Company`;
 
-- complaints received in New York
select `issue`
from sqlsample.consumercomplaints 
where `state name` = 'NY';

-- all the columns returned
select * 
from sqlsample.consumercomplaints 
where `state name` = 'NY';

-- complaints received in New York and california
select `issue`, `State Name`
from sqlsample.consumercomplaints 
where `state name` in('NY', 'CA');

-- all fields returned
select *
from sqlsample.consumercomplaints 
where `state name` in('NY', 'CA');

-- finding the word 'credit' in the product name field
select * 
from sqlsample.consumercomplaints 
where `Product Name` like '%credit%';

-- in the sub product field
select * 
from sqlsample.consumercomplaints 
where `Sub Product` like '%credit%';

-- word 'Late' in the issue field
select * 
from sqlsample.consumercomplaints 
where `Issue` like '%late%';



