# Investment Intelligence Platform

## Executive Summary

The Investment Intelligence Platform is a financial analytics project designed to simulate the workflow of an investment research and market intelligence team. The project combines market data, company fundamentals, analyst ratings, and market events into a centralized analytical environment that can be explored using SQL, Python, and Power BI.

Rather than focusing only on stock prices, the project aims to understand how different factors such as company performance, analyst sentiment, and market events influence investment decisions. The platform serves as both a learning project and a practical demonstration of data engineering, analytics, and business intelligence skills.

---

## Problem Statement

Financial markets generate large volumes of structured and unstructured information every day. Investors, analysts, and business stakeholders often need to combine data from multiple sources to evaluate company performance, identify investment opportunities, and monitor market trends.

The challenge is not the availability of data, but the ability to organize, analyze, and derive meaningful insights from it efficiently.

This project addresses that challenge by building a centralized investment intelligence database capable of supporting exploratory analysis, financial performance tracking, analyst sentiment analysis, and market event monitoring.

---

## Project Objectives

The primary objective of this project is to create a structured analytical environment for financial market analysis.

The platform is designed to support:

* Company-level performance analysis
* Sector and country-level comparisons
* Stock price trend analysis
* Analyst recommendation analysis
* Financial statement analysis
* Market event impact analysis
* Dashboard development and business reporting

---

## Data Model

The project consists of multiple related datasets that represent different aspects of the financial ecosystem.

### Companies

Stores master information about listed companies including:

* Company name
* Sector
* Country
* Founded year
* Market capitalization category

### Stock Prices

Captures daily market activity for each company.

Key attributes include:

* Open price
* Close price
* High price
* Low price
* Trading volume
* Trade date

### Financials

Stores quarterly company fundamentals.

Key metrics include:

* Revenue
* Net profit
* Earnings per share (EPS)
* Price-to-Earnings (P/E) ratio

### Analyst Ratings

Represents analyst sentiment and recommendations.

Key attributes include:

* Analyst firm
* Rating category
* Target price
* Rating date

### Market Events

Tracks major events that may influence market behavior.

Examples include:

* Earnings announcements
* Mergers and acquisitions
* Dividend declarations
* Regulatory developments
* Macroeconomic events

---

## Methodology

The project follows a structured analytics workflow.

### 1. Database Design

A relational PostgreSQL database was designed to support multiple financial datasets while maintaining referential integrity through primary and foreign key relationships.

### 2. Data Generation and Population

Synthetic financial data was generated to simulate real-world market conditions and support analytical exploration.

### 3. Data Validation

Before performing analysis, the dataset is evaluated for:

* Missing values
* Duplicate records
* Invalid stock prices
* Constraint violations
* Referential integrity issues

### 4. Exploratory Data Analysis

The platform is used to explore:

* Company distributions
* Sector distributions
* Market activity trends
* Financial performance metrics
* Analyst coverage patterns

### 5. Advanced SQL Analysis

Business-oriented SQL queries are developed to answer investment-related questions such as:

* Which companies outperform their sector?
* Which sectors show stronger growth?
* Which companies receive the strongest analyst support?
* How do financial metrics vary across industries?

---

## Technology Stack

The project is being developed using:

* PostgreSQL
* SQL
* Git & GitHub
* Visual Studio Code

Future phases will include:

* Python
* Pandas
* Power BI

---

## Current Project Status

### Phase 1 – Database Design and SQL Analytics (In Progress)

Completed:

* Relational schema design
* Primary and foreign key implementation
* Constraints and indexes
* Data population scripts
* Initial SQL exploration
* Analytical query development

Upcoming:

* Data quality framework
* Advanced SQL analysis
* Python integration
* Dashboard development
* Business intelligence reporting

---

## Repository Structure

```text
investment-intelligence-platform/

│
├── setup.sql
├── seed_data.sql
├── queries_day1.sql
├── queries_day2.sql
├── README.md
│
└── future/
    ├── python_analysis/
    ├── dashboards/
    └── reports/
```
