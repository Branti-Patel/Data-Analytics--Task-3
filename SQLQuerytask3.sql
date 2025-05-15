SELECT TOP (1000) [Unique id]
      ,[channel_name]
      ,[category]
      ,[Sub-category]
      ,[Customer Remarks]
      ,[Order_id]
      ,[order_date_time]
      ,[Issue_reported at]
      ,[issue_responded]
      ,[Survey_response_Date]
      ,[Customer_City]
      ,[Product_category]
      ,[Item_price]
      ,[connected_handling_time]
      ,[Agent_name]
      ,[Supervisor]
      ,[Manager]
      ,[Tenure Bucket]
      ,[Agent Shift]
      ,[CSAT Score]
  FROM [akshitadb].[dbo].[Customer_support_data (1)]

SELECT Agent_name, COUNT(*) AS Ticket_Count
FROM [akshitadb].[dbo].[Customer_support_data (1)]
GROUP BY Agent_name;

SELECT COUNT(*) AS Unique_id FROM [akshitadb].[dbo].[Customer_support_data (1)];

SELECT Agent_name, COUNT(*) AS issue_responded
FROM [akshitadb].[dbo].[Customer_support_data (1)]
GROUP BY Agent_name
ORDER BY issue_responded DESC;

      
      
SELECT category , COUNT(*) AS Count
FROM [akshitadb].[dbo].[Customer_support_data (1)]
GROUP BY category
ORDER BY Count DESC;

SELECT 
    A.[Agent_name],
    A.[Manager],
    B.[Agent_name] AS Other_Agent,
    B.[Manager] AS Other_Manager
FROM [akshitadb].[dbo].[Customer_support_data (1)] A
INNER JOIN [akshitadb].[dbo].[Customer_support_data (1)] B
    ON A.[Manager] = B.[Manager]
    AND A.[Agent_name] <> B.[Agent_name];

SELECT 
    A.[Agent_name],
    A.[Manager],
    B.[Agent_name] AS Colleague
FROM [akshitadb].[dbo].[Customer_support_data (1)] A
LEFT JOIN [akshitadb].[dbo].[Customer_support_data (1)] B
    ON A.[Manager] = B.[Manager]
    AND A.[Agent_name] <> B.[Agent_name];


	SELECT 
    B.[Agent_name],
    B.[Manager],
    A.[Agent_name] AS Colleague
FROM [akshitadb].[dbo].[Customer_support_data (1)] A
RIGHT JOIN [akshitadb].[dbo].[Customer_support_data (1)] B
    ON A.[Manager] = B.[Manager]
    AND A.[Agent_name] <> B.[Agent_name];


	SELECT *
FROM [akshitadb].[dbo].[Customer_support_data (1)]
WHERE [CSAT Score] = (
    SELECT MAX([CSAT Score])
    FROM [akshitadb].[dbo].[Customer_support_data (1)]
);


CREATE VIEW Manager_Ticket_Summary AS
SELECT 
    [Manager],
    COUNT(*) AS Total_Tickets
FROM [akshitadb].[dbo].[Customer_support_data (1)]
GROUP BY [Manager];

SELECT * FROM Manager_Ticket_Summary;

