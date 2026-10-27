CREATE DATABASE IF NOT EXISTS credit_risk_db;

USE credit_risk_db;
DROP TABLE IF EXISTS credit_clients;

USE credit_risk_db;
CREATE TABLE credit_clients (
customer_id INT PRIMARY KEY,
limit_bal DECIMAL(12, 2),
sex INT,
education INT,
marriage INT,
age INT,
pay_0 INT,
bill_amt1 DECIMAL(12, 2),
pay_amt1 DECIMAL(12, 2),
branch_region VARCHAR(20),
default_payment INT 
);

SELECT * FROM credit_clients;

-- Identify customers with 2 or more months of payment delays?
SELECT customer_id,
limit_bal,
bill_amt1,
pay_0 AS delay_months,
ROUND((bill_amt1 / limit_bal) * 100, 2) AS utilization_pct
FROM credit_clients
WHERE pay_0 >= 2
ORDER BY bill_amt1 DESC
LIMIT 100;

-- Segment customers into utilization buckets?
SELECT 
CASE 
WHEN (bill_amt1 / limit_bal) > 0.8 THEN 'High (>80%)'
WHEN (bill_amt1 / limit_bal) BETWEEN 0.3 AND 0.8 THEN 'Medium (30-80%)'
ELSE 'Low (<30%)'
END AS utilization_tier,
COUNT(customer_id) AS Total_customers,
SUM(default_payment) AS Total_defaults,
ROUND((SUM(default_payment) / COUNT(customer_id)) * 100, 2) AS Default_rate_pct
FROM credit_clients
GROUP BY utilization_tier;

-- Evaluate regional default exposure?
SELECT 
    branch_region,
    COUNT(customer_id) AS total_accounts,
    SUM(default_payment) AS defaulted_accounts,
    ROUND(SUM(CASE WHEN default_payment = 1 THEN bill_amt1 ELSE 0 END), 2) AS actual_default_loss,
    ROUND((SUM(default_payment) / COUNT(customer_id)) * 100, 2) AS default_rate_pct
FROM credit_clients
GROUP BY branch_region
ORDER BY actual_default_loss DESC;
