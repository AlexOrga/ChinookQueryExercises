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

