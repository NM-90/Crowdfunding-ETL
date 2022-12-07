--DELIVERABLE 4: SQL ANALYSIS

--  Retrieve all the number of backer_counts in descending order for each `cf_id` for the "live" campaigns. 

SELECT backers.cf_id, 
COUNT(backers.backer_id) 
FROM backers	
INNER JOIN campaign ON campaign.cf_id=backers.cf_id
WHERE campaign.outcome='live'
GROUP BY backers.cf_id

ORDER BY backers.cf_id DESC


-- New table that contains the first, last name, email address, and remaining goal amount in descending order
--for each live campaign. 

SELECT
backers.first_name,
backers.last_name,
backers.email,
(campaign.goal-campaign.pledged) as " Remaining Goal Amount"
INTO email_contacts_remaining_goal_amount
FROM campaign
INNER JOIN backers
ON campaign.cf_id=backers.cf_id
WHERE campaign.outcome='live'

ORDER BY campaign.goal-campaign.pledged DESC

SELECT * FROM  email_contacts_remaining_goal_amount 

DROP TABLE   email_contacts_remaining_goal_amount 

--5. New table, email addresses of the backers in descending order, 
--the first and the last name of each backer, 
--the cf_id, the company name, 
--the description, 
--the end date of the campaign, and the remaining amount 
--of the campaign goal as "Left of Goal".

SELECT
backers.email,
backers.first_name,
backers.last_name,
backers.cf_id,
campaign.company_name,
campaign.description,
campaign.end_date,
(campaign.goal-campaign.pledged) as "Left of Goal"
INTO email_backers_remaining_goal_amount
FROM campaign
INNER JOIN backers
ON campaign.cf_id=backers.cf_id
WHERE campaign.outcome='live'

ORDER BY backers.last_name DESC

