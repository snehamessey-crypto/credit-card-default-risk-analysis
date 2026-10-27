# Credit Card Default Risk & Branch Profitability Analysis

![Tools](https://img.shields.io/badge/Tools-Excel%20|%20MySQL%20|%20Python%20|%20PowerBI-green)
![Domain](https://img.shields.io/badge/Domain-Banking%20%26%20Finance-blue)
![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)(https://opensource.org/license/MIT)

---

## Executive Summary
This project analyzes payment histories, balance metrics, and branch allocations across 30,000 credit card accounts to identify default patterns and evaluate their impact on budgeted bad-debt provisions. By deploying logistic regression and DAX-driven financial variance modeling, this project surfaces actionable risk indicators that safeguard portfolio yield and maintain statutory liquidity.

## Business Context & Core Problem
Unmanaged credit defaults cause unrecoverable write-offs, capital allocation penalties, and negative branch variances against operational financial forecasts. 

Key Business Questions Addressed:
1. Which customer behaviors serve as early indicators of default risk?
2. How does credit limit utilization correlate with customer non-payment probability?
3. Did the bank's allocated risk provisions absorb actual default losses across regional branches?

## Tech Stack & Workflow
- **Microsoft Excel (Legacy Compatible):** Data audit, data cleaning, and vectorized feature derivation (`UTILIZATION_RATE`).
- **MySQL Workbench:** Relational schema design, filtering delinquent accounts (`PAY_0 >= 2`), and multi-tier utilization aggregations.
- **Python (Pandas, Scikit-Learn):** Data pipeline design and baseline Logistic Regression default risk scoring.
- **Microsoft Power BI & DAX:** Star-schema data modeling, budget vs. actual variance analysis, and interactive executive reporting.

## Key Analytical Insights
- **The Delinquency Inflection Point:** Customers delaying payments by 2 months (`PAY_0 = 2`) display a default probability exceeding 54%, making two-month arrears the primary early warning trigger.
- **Utilization Saturation:** Accounts operating above 80% credit utilization generate over 63% of aggregate default balance losses.
- **Provisioning Budget Deficit:** High-delinquency branches exhausted their 5% statutory bad-debt reserve, creating a negative budget variance of 14.2% against original quarterly projections.

## Strategic Recommendations
1. **Dynamic Credit Throttle:** Automatically reduce available credit lines by 35% when an account's revolving utilization crosses 75% for two consecutive billing cycles.
2. **Early Intervention Protocol:** Flag any account with a 30-day delay for automated soft reminders before payment delinquency advances to 60 days.
3. **Regional Risk Reallocation:** Reallocate bad-debt provisioning allowances toward under-reserved regional branches showing elevated default rates.

## Repository Structure
```text
├── data/              <- Raw and cleaned datasets
├── sql/               <- Modular SQL queries for extraction and aggregations
├── notebooks/         <- Python preprocessing and logistic regression code
├── dashboard/         <- Power BI (.pbix) files and dashboard snapshots
└── README.md          <- Project summary and findings
