-- ============================================================
-- MARKETING CAMPAIGN ANALYTICS
-- SQL BUSINESS ANALYSIS | MySQL 8.0+
-- Database: marketing_campaigns
-- ============================================================

USE marketing_campaigns;

-- QUERY 1: Campaign-wise Performance
SELECT c.campaign_id, c.campaign_name, c.objective, c.planned_budget_inr,
       SUM(d.impressions) AS total_impressions,
       SUM(d.clicks) AS total_clicks,
       ROUND(SUM(d.ad_spend_inr), 2) AS total_spend,
       ROUND(SUM(d.clicks) * 100.0 / NULLIF(SUM(d.impressions), 0), 2) AS CTR_Percent
FROM campaigns c
LEFT JOIN daily_performance d ON c.campaign_id = d.campaign_id
GROUP BY c.campaign_id, c.campaign_name, c.objective, c.planned_budget_inr
ORDER BY total_spend DESC;

-- QUERY 2: Channel-wise Performance
SELECT mc.channel_name, COUNT(DISTINCT c.campaign_id) AS total_campaigns,
       SUM(d.impressions) AS total_impressions, SUM(d.clicks) AS total_clicks,
       ROUND(SUM(d.ad_spend_inr), 2) AS total_spend,
       ROUND(SUM(d.clicks) * 100.0 / NULLIF(SUM(d.impressions), 0), 2) AS CTR_Percent,
       ROUND(SUM(d.ad_spend_inr) / NULLIF(SUM(d.clicks), 0), 2) AS Average_CPC
FROM marketing_channels mc
JOIN campaigns c ON mc.channel_id = c.channel_id
LEFT JOIN daily_performance d ON c.campaign_id = d.campaign_id
GROUP BY mc.channel_id, mc.channel_name
ORDER BY CTR_Percent DESC;

-- QUERY 3: Objective-wise Performance
SELECT c.objective, COUNT(DISTINCT c.campaign_id) AS total_campaigns,
       SUM(d.impressions) AS total_impressions, SUM(d.clicks) AS total_clicks,
       ROUND(SUM(d.ad_spend_inr), 2) AS total_spend,
       ROUND(SUM(d.clicks) * 100.0 / NULLIF(SUM(d.impressions), 0), 2) AS CTR_Percent,
       ROUND(SUM(d.ad_spend_inr) / NULLIF(SUM(d.clicks), 0), 2) AS Average_CPC
FROM campaigns c
LEFT JOIN daily_performance d ON c.campaign_id = d.campaign_id
GROUP BY c.objective
ORDER BY total_spend DESC;

-- QUERY 4: Daily Performance Trend
SELECT performance_date, SUM(impressions) AS total_impressions,
       SUM(clicks) AS total_clicks, ROUND(SUM(ad_spend_inr), 2) AS total_spend,
       ROUND(SUM(clicks) * 100.0 / NULLIF(SUM(impressions), 0), 2) AS CTR_Percent
FROM daily_performance
GROUP BY performance_date
ORDER BY performance_date;

-- QUERY 5: Campaign-wise Lead Generation
SELECT c.campaign_name, c.objective, COUNT(l.lead_id) AS total_leads
FROM campaigns c
LEFT JOIN leads l ON c.campaign_id = l.campaign_id
GROUP BY c.campaign_id, c.campaign_name, c.objective
ORDER BY total_leads DESC;

-- QUERY 6: Customer Segment Analysis
SELECT customer_segment, COUNT(*) AS total_leads
FROM leads
GROUP BY customer_segment
ORDER BY total_leads DESC;

-- QUERY 7: Age Group Analysis
SELECT customer_age_group, COUNT(*) AS total_leads
FROM leads
GROUP BY customer_age_group
ORDER BY total_leads DESC;

-- QUERY 8: Device-wise Lead Analysis
SELECT device, COUNT(*) AS total_leads
FROM leads
GROUP BY device
ORDER BY total_leads DESC;

-- QUERY 9: City-wise Lead Analysis (Top 10)
SELECT city, COUNT(*) AS total_leads
FROM leads
GROUP BY city
ORDER BY total_leads DESC
LIMIT 10;

-- QUERY 10: Conversion Type Analysis
SELECT conversion_type, COUNT(*) AS total_conversions,
       ROUND(SUM(order_value_inr), 2) AS total_revenue,
       ROUND(AVG(order_value_inr), 2) AS average_order_value
FROM conversions
GROUP BY conversion_type
ORDER BY total_revenue DESC;

-- QUERY 11: Product Category Revenue
SELECT product_category, COUNT(*) AS total_conversions,
       ROUND(SUM(order_value_inr), 2) AS total_revenue,
       ROUND(AVG(order_value_inr), 2) AS average_order_value
FROM conversions
GROUP BY product_category
ORDER BY total_revenue DESC;

-- QUERY 12: Monthly Revenue Trend
SELECT DATE_FORMAT(conversion_date, '%Y-%m') AS revenue_month,
       COUNT(*) AS total_conversions,
       ROUND(SUM(order_value_inr), 2) AS monthly_revenue
FROM conversions
GROUP BY DATE_FORMAT(conversion_date, '%Y-%m')
ORDER BY revenue_month;

-- QUERY 13: Campaign-wise Conversion Rate
SELECT c.campaign_name, COUNT(DISTINCT l.lead_id) AS total_leads,
       COUNT(DISTINCT cv.lead_id) AS converted_leads,
       ROUND(COUNT(DISTINCT cv.lead_id) * 100.0 /
             NULLIF(COUNT(DISTINCT l.lead_id), 0), 2) AS conversion_rate
FROM campaigns c
LEFT JOIN leads l ON c.campaign_id = l.campaign_id
LEFT JOIN conversions cv ON l.lead_id = cv.lead_id
GROUP BY c.campaign_id, c.campaign_name
ORDER BY conversion_rate DESC;

-- QUERY 14: Campaign-wise Revenue and Ad-spend ROI
-- ROI = (Revenue - Ad Spend) / Ad Spend * 100; not net-profit ROI.
WITH campaign_spend AS (
    SELECT campaign_id, SUM(ad_spend_inr) AS total_spend
    FROM daily_performance GROUP BY campaign_id
),
campaign_revenue AS (
    SELECT l.campaign_id, SUM(cv.order_value_inr) AS total_revenue
    FROM leads l JOIN conversions cv ON l.lead_id = cv.lead_id
    GROUP BY l.campaign_id
)
SELECT c.campaign_name, ROUND(COALESCE(s.total_spend, 0), 2) AS total_spend,
       ROUND(COALESCE(r.total_revenue, 0), 2) AS total_revenue,
       ROUND((COALESCE(r.total_revenue, 0) - COALESCE(s.total_spend, 0)) /
             NULLIF(s.total_spend, 0) * 100, 2) AS ROI_Percent
FROM campaigns c
LEFT JOIN campaign_spend s ON c.campaign_id = s.campaign_id
LEFT JOIN campaign_revenue r ON c.campaign_id = r.campaign_id
ORDER BY ROI_Percent DESC;

-- QUERY 15: Budget Utilization
WITH actual_spend AS (
    SELECT campaign_id, SUM(ad_spend_inr) AS total_spend
    FROM daily_performance GROUP BY campaign_id
)
SELECT c.campaign_name, c.planned_budget_inr,
       ROUND(COALESCE(a.total_spend, 0), 2) AS actual_spend,
       ROUND(COALESCE(a.total_spend, 0) /
             NULLIF(c.planned_budget_inr, 0) * 100, 2) AS budget_utilization_percent
FROM campaigns c
LEFT JOIN actual_spend a ON c.campaign_id = a.campaign_id
ORDER BY budget_utilization_percent DESC;

-- QUERY 16: Region-wise Performance
SELECT region, SUM(impressions) AS total_impressions,
       SUM(clicks) AS total_clicks, ROUND(SUM(ad_spend_inr), 2) AS total_spend,
       ROUND(SUM(clicks) * 100.0 / NULLIF(SUM(impressions), 0), 2) AS CTR_Percent
FROM daily_performance
GROUP BY region
ORDER BY total_clicks DESC;

-- QUERY 17: Campaign Performance Classification (CTE + CASE)
WITH campaign_ctr AS (
    SELECT c.campaign_id, c.campaign_name,
           SUM(d.impressions) AS impressions, SUM(d.clicks) AS clicks,
           ROUND(SUM(d.clicks) * 100.0 / NULLIF(SUM(d.impressions), 0), 2) AS CTR
    FROM campaigns c
    JOIN daily_performance d ON c.campaign_id = d.campaign_id
    GROUP BY c.campaign_id, c.campaign_name
)
SELECT campaign_name, CTR,
       CASE WHEN CTR >= 3 THEN 'High Performance'
            WHEN CTR >= 2 THEN 'Medium Performance'
            ELSE 'Low Performance' END AS performance_category
FROM campaign_ctr
ORDER BY CTR DESC;

-- QUERY 18: Channel Ranking (Window Function)
WITH channel_performance AS (
    SELECT mc.channel_id, mc.channel_name,
           SUM(d.impressions) AS impressions, SUM(d.clicks) AS clicks,
           ROUND(SUM(d.clicks) * 100.0 / NULLIF(SUM(d.impressions), 0), 2) AS CTR
    FROM marketing_channels mc
    JOIN campaigns c ON mc.channel_id = c.channel_id
    JOIN daily_performance d ON c.campaign_id = d.campaign_id
    GROUP BY mc.channel_id, mc.channel_name
)
SELECT channel_name, CTR, RANK() OVER (ORDER BY CTR DESC) AS channel_rank
FROM channel_performance
ORDER BY channel_rank;

-- QUERY 19: Monthly Running Revenue (Window Function)
WITH monthly_revenue AS (
    SELECT DATE_FORMAT(conversion_date, '%Y-%m') AS revenue_month,
           SUM(order_value_inr) AS revenue
    FROM conversions
    GROUP BY DATE_FORMAT(conversion_date, '%Y-%m')
)
SELECT revenue_month, ROUND(revenue, 2) AS monthly_revenue,
       ROUND(SUM(revenue) OVER (ORDER BY revenue_month), 2) AS cumulative_revenue
FROM monthly_revenue
ORDER BY revenue_month;

-- QUERY 20: Top 5 Campaigns by Revenue (CTE + DENSE_RANK)
WITH campaign_revenue AS (
    SELECT c.campaign_id, c.campaign_name,
           COUNT(cv.conversion_id) AS total_conversions,
           SUM(cv.order_value_inr) AS total_revenue
    FROM campaigns c
    JOIN leads l ON c.campaign_id = l.campaign_id
    JOIN conversions cv ON l.lead_id = cv.lead_id
    GROUP BY c.campaign_id, c.campaign_name
),
ranked_campaigns AS (
    SELECT *, DENSE_RANK() OVER (ORDER BY total_revenue DESC) AS revenue_rank
    FROM campaign_revenue
)
SELECT campaign_name, total_conversions, ROUND(total_revenue, 2) AS total_revenue,
       revenue_rank
FROM ranked_campaigns
WHERE revenue_rank <= 5
ORDER BY revenue_rank;
