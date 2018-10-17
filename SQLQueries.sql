-- non_usa_customers.sql: Provide a query showing Customers (just their full names, customer ID and country)
-- who are not in the US.

SELECT 
	FullName = c.FirstName + '' + c.LastName,
	c.CustomerId, 
	c.Country 
FROM Customer c
WHERE c.Country != 'USA'

-- brazil_customers.sql: Provide a query only showing the Customers from Brazil.

SELECT *
FROM Customer c
WHERE c.Country = 'Brazil'

--brazil_customers_invoices.sql: Provide a query showing the Invoices of customers who are from Brazil. 
--The resultant table should show the customer's full name, Invoice ID, Date of the invoice and billing country.

SELECT 
	FullName = c.FirstName + '' + c.LastName,
	i.InvoiceId,
	i.InvoiceDate,
	i.BillingCountry
FROM Customer c 
INNER JOIN Invoice i
ON c.CustomerId = i.CustomerId
WHERE Country = 'Brazil'

-- sales_agents.sql: Provide a query showing only the Employees who are Sales Agents.

SELECT *
FROM Employee e
WHERE e.Title = 'Sales Support Agent'

--unique_invoice_countries.sql: Provide a query showing a unique/distinct list of billing countries from the Invoice table.

SELECT DISTINCT 
	i.BillingCountry
FROM Invoice i

-- sales_agent_invoices.sql: Provide a query that shows the invoices associated with each sales agent. 
-- The resultant table should include the Sales Agent's full name.

SELECT
	FullName = e.FirstName + '' + e.LastName,
	i.*
FROM Employee e
INNER JOIN Customer c ON c.SupportRepId = e.EmployeeId
INNER JOIN Invoice i ON i.CustomerId = c.CustomerId
WHERE e.Title = 'Sales Support Agent'
ORDER BY FullName

--invoice_totals.sql: Provide a query that shows the Invoice Total, Customer name, Country 
-- and Sale Agent name for all invoices and customers.

SELECT
	CustomerName = c.FirstName + '' + c.LastName,
	i.Total,
	SalesAgent = e.FirstName + '' + e.LastName,
	c.Country
FROM Customer c
INNER JOIN Invoice i ON i.CustomerId = c.CustomerId
INNER JOIN Employee e ON e.EmployeeId = c.SupportRepId
WHERE e.Title = 'Sales Support Agent'
ORDER BY CustomerName

 --total_invoices_{year}.sql: How many Invoices were there in 2009 and 2011?

 SELECT 
	Count(*) AS invoices_in_2009
 FROM Invoice i
 WHERE i.InvoiceDate LIKE '%2009%'

 Select 
	COUNT(*) AS invoices_in_2011
FROM Invoice i
WHERE i.InvoiceDate LIKE '%2011%'

-- total_sales_{year}.sql: What are the respective total sales for each of those years?

SELECT
	SUM(i.Total) as total_sales_2009
FROM Invoice i
WHERE i.InvoiceDate LIKE '%2009%'

Select 
	SUM(i.Total) AS total_sales_in_2011
FROM Invoice i
WHERE i.InvoiceDate LIKE '%2011%'

-- invoice_37_line_item_count.sql: Looking at the InvoiceLine table, provide a query that 
-- COUNTs the number of line items for Invoice ID 37.

SELECT 
	LineItems = Count(*)
FROM InvoiceLine
WHERE InvoiceId = 37

-- line_items_per_invoice.sql: Looking at the InvoiceLine table, provide a query that 
-- COUNTs the number of line items for each Invoice. HINT: GROUP BY

SELECT
	LineItemsPerInvoice = COUNT(*)
FROM InvoiceLine
GROUP BY InvoiceId

-- line_item_track.sql: Provide a query that includes the purchased track name with each invoice line item.

SELECT
	il.InvoiceLineId,
	TrackName = t.Name,
	il.InvoiceId,
	il.TrackId,
	il.UnitPrice,
	il.Quantity
FROM InvoiceLine il
INNER JOIN Track t ON il.TrackId = t.TrackId
ORDER BY InvoiceLineId