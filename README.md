# Investment Intelligence Platform

A long-term PostgreSQL + Python project focused on building an end-to-end investment and market analytics system using realistic financial datasets.

## Current Status
Phase 1: Schema Design and SQL Exploration

## Tech Stack
- PostgreSQL
- pgAdmin
- SQL
- Git + GitHub
- Python (upcoming)
- Pandas (upcoming)

## Project Goal

Build a scalable investment intelligence system capable of:

- storing large financial datasets
- performing SQL analytics
- exploring market trends
- creating ETL pipelines
- integrating Python and Pandas
- generating dashboards and investor insights

## Database Structure

Current tables:

### companies
Stores company-level information:

- company_id
- company_name
- sector
- country

### stock_prices
Stores stock market activity:

- company_id
- trade_date
- close_price
- volume

## Dataset

Current dataset:

- ~5000 generated companies
- ~3500+ unique company names
- ~250,000+ stock records

Designed to simulate realistic market data for large-scale SQL practice.

## Roadmap

Phase 1:
- Database schema design
- SQL exploration
- Data generation

Phase 2:
- Advanced SQL
- Joins
- Window functions
- Analytics queries

Phase 3:
- PostgreSQL + Python integration

Phase 4:
- Pandas workflows
- ETL pipelines

Phase 5:
- Dashboards and analytics

## Repository Structure

setup.sql → database schema

seed_data.sql → generated sample data

---

Learning in public and building progressively.
