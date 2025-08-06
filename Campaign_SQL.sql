create database Marketing_Data;
use Marketing_Data;

select * from campaign;
-- What are the top 5 campaigns by ROI in each customer segment?
select Campaign_ID, Customer_Segment, Max(ROI) as MaxROI from campaign
group by Campaign_ID, Customer_Segment
order by MaxROI desc limit 5;

-- What is the average conversion rate and ROI for each campaign type?
select Campaign_Type, round(avg(Conversion_Rate),2) as Avg_Conversion_Rate, round(avg(ROI),2) as Avg_ROI from campaign
group by Campaign_Type;

-- Which location has the highest number of high-ROI campaigns (> 6)?
select Location, ROI from campaign
where ROI > 6
group by Location, ROI;

-- Which target audience groups have average conversion rates above 0.1?
select Target_Audience, round(Avg(Conversion_Rate),2) as Avg_Conversion_Rate from campaign
where Conversion_Rate > 0.1
group by Target_Audience
order by Avg_Conversion_Rate;

select * from campaign;

-- How many campaigns used each marketing channel, and what's their average engagement score?
select Channel_Used, count( distinct Campaign_ID) as total_campaigns, round(avg(Engagement_Score),0) as Avg_Engagement_Score from campaign
group by Channel_Used
order by Avg_Engagement_Score;

-- What’s the distribution of campaigns based on engagement score (1 to 10)?
select Engagement_Score, count(distinct Campaign_ID) as campaign_count from campaign
where Engagement_Score between 1 and 10
group by Engagement_Score
order by campaign_count desc;

-- Which companies have the lowest average acquisition cost but above-average ROI?
select Company, round(avg(Acquisition_Cost),0) as Avg_Cost, round(avg(ROI),0) as Avg_ROI from campaign
group by Company
having avg(ROI) > (select round(avg(ROI),0) from campaign)
order by Avg_Cost asc;

