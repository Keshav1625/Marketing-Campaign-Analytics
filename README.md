# Marketing Campaign Analytics

An end-to-end Data Analytics project focused on evaluating marketing campaign performance, advertising spend, customer conversions, channel effectiveness, and revenue generation using Python, MySQL, Excel, and Power BI.

## Project Overview

Marketing campaigns generate large amounts of data across different advertising channels, customer segments, locations, and devices. Analysing this data helps businesses understand campaign effectiveness, optimize advertising expenditure, and improve conversion performance.

This project analyses marketing campaign data to identify revenue trends, evaluate advertising performance, compare marketing channels, understand customer behaviour, and generate actionable business insights.

The project follows a complete data analytics workflow, from raw data inspection and cleaning to SQL analysis, spreadsheet analysis, and interactive Power BI dashboard development.

## Project Objectives

- Analyse overall marketing campaign performance.
- Evaluate revenue generated against advertising expenditure.
- Measure campaign effectiveness using impressions, clicks, CTR, and conversions.
- Compare marketing channel performance.
- Identify high-performing campaigns and campaign objectives.
- Analyse customer segments, age groups, cities, and devices.
- Understand customer conversion behaviour.
- Identify opportunities to improve marketing investment and campaign efficiency.

## Tools & Technologies

| Tool | Purpose |
|---|---|
| Python | Data cleaning, preprocessing, and EDA |
| Pandas | Data manipulation and analysis |
| NumPy | Numerical operations |
| Matplotlib | Data visualization |
| Seaborn | Exploratory data visualization |
| MySQL | Database management and SQL analysis |
| Excel / LibreOffice Calc | Spreadsheet analysis and Pivot Tables |
| Power BI | Interactive dashboards and business reporting |
| DAX | Measures, KPIs, and calculations |
| Jupyter Notebook | Python development environment |

## Dataset Description

The project uses a marketing campaign dataset containing five interconnected CSV files.

| Dataset | Description |
|---|---|
| campaigns.csv | Campaign details, objectives, target locations, dates, and planned budgets |
| daily_performance.csv | Daily impressions, clicks, advertising expenditure, devices, and regions |
| leads.csv | Customer leads, age groups, segments, cities, and lead sources |
| conversions.csv | Conversion records, conversion types, order values, and product categories |
| marketing_channels.csv | Marketing channel information and channel-level reference metrics |

### Final Cleaned Dataset

| Dataset | Final Records |
|---|---:|
| campaigns | 60 |
| daily_performance | 4,183 |
| leads | 3,000 |
| conversions | 1,200 |
| marketing_channels | 6 |
| **Total** | **8,449** |

The cleaned datasets were validated before being used for analysis.

## Project Workflow

### 1. Python – Data Cleaning & Exploratory Data Analysis

- Imported and inspected all five CSV files.
- Checked missing values and duplicate records.
- Validated data types and date columns.
- Standardized and cleaned inconsistent records.
- Performed data quality checks.
- Validated relationships between datasets.
- Calculated relevant analytical metrics.
- Conducted Exploratory Data Analysis (EDA).
- Created visualizations to understand trends and patterns.
- Exported final cleaned datasets for further analysis.

**Output:** Cleaned CSV datasets and Python EDA notebook.

### 2. MySQL – Database Management & SQL Analysis

The cleaned datasets were imported into a MySQL database named `marketing_campaigns`.

Five tables were used:
- campaigns
- daily_performance
- leads
- conversions
- marketing_channels

Key activities:
- Database and table management.
- Primary and foreign key relationship validation.
- Data integrity checks.
- Joins across multiple tables.
- Aggregation and grouping.
- Revenue and advertising spend analysis.
- Campaign and channel performance analysis.
- Customer segment and conversion analysis.
- Business-focused SQL queries.

**Output:** 20 SQL business analysis queries.

### 3. Excel – Spreadsheet Analysis

- Imported cleaned datasets.
- Organized and reviewed tabular data.
- Created Pivot Tables.
- Analysed campaign objectives.
- Compared regional performance.
- Created charts for business insights.

**Output:** Marketing Campaign Excel Analysis workbook.

### 4. Power BI – Interactive Dashboard

Developed a four-page interactive dashboard with KPI cards, charts, comparisons, slicers, and business insights.

## Dashboard Preview

### Page 1 – Marketing Campaign Performance

Executive overview of marketing performance, revenue trends, campaign objectives, top campaigns, and channel-wise revenue contribution.

![Marketing Campaign Performance Dashboard](image/Screenshot%202026-11-26%20125206.png)

### Page 2 – Campaign Performance Analysis

Evaluates campaign investment, planned budgets, reach, engagement, CTR, and budget variance.

![Campaign Performance Analysis Dashboard](image/Screenshot%202026-11-26%20125217.png)

### Page 3 – Marketing Channel Analysis

Compares advertising channels based on spend, revenue, CTR, CPC, and engagement.

![Marketing Channel Analysis Dashboard](image/Screenshot%202026-11-26%20125225.png)

### Page 4 – Audience & Conversion Analysis

Analyses customer demographics, conversion behaviour, product categories, cities, and device-wise revenue.

![Audience and Conversion Analysis Dashboard](image/Screenshot%202026-11-26%20125233.png)

### Dashboard Interactivity

The dashboard includes common slicers:
- Date Range
- Region
- Marketing Channel
- Campaign Objective

These filters allow users to explore marketing performance across different dimensions.

## Key Business Metrics

| KPI | Result |
|---|---:|
| Total Campaigns | 60 |
| Total Marketing Channels (original IDs) | 6 |
| Total Revenue | ₹7.19M |
| Total Advertising Spend | ₹5.78M |
| Total Impressions | 123.31M |
| Total Clicks | 2.60M |
| Total Leads | 3,000 |
| Total Conversions | 1,200 |
| Overall CTR | 2.11% |
| Lead-to-Conversion Rate | 40% |
| Average CPC | ₹2.23 |
| Average Order Value | ₹5,995.41 |
| Revenue-based Ad-Spend ROI | 24.53% |

## Key Business Insights

### 1. Campaign Objective Performance

- Sales campaigns generated approximately ₹2.98M in revenue.
- Lead Generation campaigns generated 489 conversions, the highest among campaign objectives.
- Awareness campaigns recorded a negative revenue-based ad-spend ROI of approximately -11.46%.

### 2. Top Performing Campaigns

- Monsoon Essentials 32 generated approximately ₹349.84K in revenue.
- Smart Tech Week 44 generated approximately ₹316.87K.
- Weekend Flash Sale 23 generated approximately ₹290.16K.

### 3. Marketing Channel Performance

- Facebook Ads generated approximately ₹1.59M in revenue.
- Email Marketing generated approximately ₹1.34M.
- Display Ads generated approximately ₹1.32M.
- Email Marketing recorded the highest channel CTR at approximately 6.94%.

### 4. Customer Segment Analysis

- Young Professionals generated the highest revenue among customer segments, approximately ₹2.12M.
- Premium Shoppers recorded the highest Average Order Value at approximately ₹9,473.79.

### 5. Device Performance

- Mobile generated approximately ₹5.32M in revenue.
- Desktop generated approximately ₹1.58M.
- Tablet generated approximately ₹0.30M.

Mobile contributed the largest share of total revenue.

## Important Metric Definitions

**Click-Through Rate (CTR)**

CTR = (Total Clicks / Total Impressions) × 100

**Average Cost per Click (CPC)**

CPC = Total Advertising Spend / Total Clicks

**Conversion Rate**

Conversion Rate = (Total Conversions / Total Leads) × 100

**Average Order Value (AOV)**

AOV = Total Revenue / Total Conversions

**Revenue-based Ad-Spend ROI**

Ad-Spend ROI = ((Total Revenue − Total Advertising Spend) / Total Advertising Spend) × 100

*Note: Revenue-based Ad-Spend ROI is not net profit ROI. It does not account for product costs, operating expenses, or other business costs.*

## Project Folder Structure

```text
Marketing_Campaign_Analytics/
│
├── data/
│   ├── raw/
│   └── cleaned/
│
├── documentation/
│
├── Excel/
│   └── Marketing_Campaign_Excel_Analysis.xlsx
│
├── image/
│   ├── Screenshot 2026-11-26 125206.png
│   ├── Screenshot 2026-11-26 125217.png
│   ├── Screenshot 2026-11-26 125225.png
│   └── Screenshot 2026-11-26 125233.png
│
├── Power Bi/
│   └── Project 3 Dashboard.pbix
│
├── python/
│   └── notebooks/
│       └── Marketing_Campaign_EDA.ipynb
│
├── SQL_Analysis/
│   └── Marketing_Campaign_Analysis.sql
│
└── README.md
```

## Skills Demonstrated

- Data Cleaning & Preprocessing
- Exploratory Data Analysis (EDA)
- Python Data Analysis
- SQL Queries & Joins
- Relational Database Management
- Excel Pivot Tables
- Data Visualization
- Power BI Dashboard Development
- DAX Measures & KPI Development
- Business Intelligence
- Marketing Performance Analysis
- Data Interpretation & Business Insights

## Conclusion

This project demonstrates an end-to-end data analytics workflow using Python, MySQL, Excel, and Power BI.

By analysing campaign performance, advertising expenditure, customer conversions, marketing channels, and revenue trends, the project transforms raw marketing data into meaningful business insights.

The interactive dashboard provides a consolidated view of marketing performance and helps identify opportunities for better campaign planning, advertising efficiency, and customer engagement.

---

**Project Category:** Data Analytics | Marketing Analytics | Business Intelligence

**Tools:** Python | MySQL | Excel | Power BI | DAX

**Project Status:** Completed