-- top selling items by quantity
SELECT item, SUM(quantity) AS quantity
FROM sales_data
GROUP BY item
ORDER BY quantity DESC;

-- top selling items by revenue
SELECT item, SUM(total_spent) AS total_spent
FROM sales_data
GROUP BY item
ORDER BY total_spent DESC;

-- total transactions over months
SELECT EXTRACT(MONTH FROM transaction_date) AS month, COUNT(*) AS total_orders,SUM(total_spent) AS total_revenue
FROM sales_data
GROUP BY EXTRACT(MONTH FROM transaction_date)
ORDER BY total_revenue DESC, total_orders DESC;

-- most commonly used methods of payment
SELECT payment_method, COUNT(*) AS transactions
FROM sales_data
GROUP BY payment_method
ORDER BY transactions DESC;

-- sales breakdown by location
SELECT location, ROUND(SUM(total_spent)*100.0/(SELECT SUM(total_spent) FROM sales_data),0) AS sales_breakdown
FROM sales_data 
GROUP BY location;

-- revenue share per item
SELECT item, ROUND(SUM(total_spent)*100/(SELECT SUM(total_spent) FROM sales_data),0) AS revenue_share_per_item
FROM sales_data
GROUP BY item
ORDER BY revenue_share_per_item DESC;

-- popular days of sales
SELECT DAYNAME(transaction_date) AS day, SUM(total_spent) AS total_revenue
FROM sales_data
GROUP BY DAYNAME(transaction_date)
ORDER BY total_revenue DESC;