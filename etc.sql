# Count of players making a major league appearance by year

SELECT yearID, COUNT(playerID)
FROM (
	SELECT playerID, yearID
	FROM batting
	UNION
	SELECT playerID, yearID
	FROM pitching p) as t
GROUP BY yearID
ORDER BY yearID DESC;
