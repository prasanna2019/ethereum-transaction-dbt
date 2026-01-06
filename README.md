# Ethereum dbt Project

A dbt project for transforming and analyzing Ethereum blockchain transaction data from BigQuery's public dataset.

## Overview

This project extracts, transforms, and loads Ethereum transaction data using a modern data engineering approach. It processes raw blockchain data into clean, analytics-ready models following dbt best practices.

## Data Source

- **Source**: BigQuery Public Dataset (`bigquery-public-data.crypto_ethereum.transactions`)
- **Data Warehouse**: BigQuery
- **Incremental Loading**: Last 30 days of transaction data

## Project Structure

```
models/
├── raw/              # Incremental raw data extraction
├── stg/              # Staging layer with data cleaning and transformations
└── fct_dim/          # Analytics-ready aggregated models
|__ marts/            # metrics
```

## Key Models

- **`raw.transactions`**: Incremental extraction of Ethereum transactions
- **`stg.stg_transactions`**: Cleaned transactions with normalized units (gwei) and date fields
- **`marts.transactions_by_type`**: Aggregated transaction counts by type

## Getting Started

1. Install dbt and configure your BigQuery profile
2. Run `dbt deps` to install dependencies
3. Run `dbt run` to build all models
4. Run `dbt test` to validate data quality

## Features

- ✅ Incremental data loading for efficiency
- ✅ Partitioned by timestamp for optimal query performance
- ✅ Data quality tests and documentation
- ✅ Clean, readable SQL with proper formatting
