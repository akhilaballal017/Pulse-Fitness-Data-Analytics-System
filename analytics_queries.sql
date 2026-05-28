USE Pulse_fitness;

-- Query 1: Class demand and scheduling Effeciency( Operational Effeciency)
-- Solution for Query 1: Identify the most scheduled fitness classes
SELECT fc.Name, COUNT(cs.Schedule_ID) AS Total_Sessions
FROM Fitness_class fc
JOIN Class_Schedule cs ON fc.Class_ID = cs.Class_ID
GROUP BY fc.Name
ORDER BY Total_Sessions DESC;


-- Query 2: Resource utilization
-- Solution for Query 2: Determine trainer workload distribution
SELECT t.Name, COUNT(cs.Schedule_ID) AS Scheduled_Classes
FROM Trainer t
JOIN Class_Schedule cs ON t.Trainer_ID = cs.Trainer_ID
GROUP BY t.Name
ORDER BY Scheduled_Classes DESC;

-- Query 3: Pricing Strategies (Revenue Genertaion) 
-- Solution for Query 3 : Average price per membership type
SELECT Plan_Type, AVG(Price) AS Avg_Price
FROM Membership_plan
GROUP BY Plan_Type;

-- Query 4: Popularity of the Plan 
-- Solution for Query 4: Number of members per membership plan
SELECT mp.Plan_Type, COUNT(m.Member_ID) AS Total_Members
FROM Membership_plan mp
JOIN Member m ON mp.Membership_ID = m.Membership_ID
GROUP BY mp.Plan_Type;

-- Query 5: Membership Distribution Analysis
-- Identify the number of members enrolled in each membership plan
SELECT 
    mp.Plan_Type,
    COUNT(m.Member_ID) AS Total_Members,
    ROUND(AVG(mp.Price), 2) AS Average_Plan_Price
FROM Membership_plan mp
LEFT JOIN Member m
ON mp.Membership_ID = m.Membership_ID
GROUP BY mp.Plan_Type
ORDER BY Total_Members DESC;

-- Query 6: Customer Growth rate
-- Solution for Query 5: Recent member signups 
SELECT * 
FROM Member
WHERE Membership_stsrt_date >= CURDATE() - INTERVAL 30 DAY;

-- Query 7: Trainer Performance 
-- Solution for Query 6 : Compare average personal training sessions per trainer
SELECT t.Name, COUNT(ps.Session_ID) AS PT_Sessions
FROM Trainer t
JOIN PT_session ps ON t.Trainer_ID = ps.Trainer_ID
GROUP BY t.Name
ORDER BY PT_Sessions DESC;

-- Query 8: Revenue Tracking
-- Solution for Query 7: Revenue forecast from personal training sessions
SELECT 
    COUNT(ps.Session_ID) AS Total_Sessions,
    SUM(t.Hourly_rate) AS Estimated_PT_Revenue
FROM PT_session ps
JOIN Trainer t 
ON ps.Trainer_ID = t.Trainer_ID;


