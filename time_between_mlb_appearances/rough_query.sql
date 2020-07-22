SELECT	playerID, min(yearID), max(yearID), 
		max(yearID) - min(yearID) AS "career span",
		count(yearID) as "count seasons",
		(max(yearID) - min(yearID)) - count(yearID) as "diff"
FROM pitching
WHERE yearID > 1970 && yearID < 2019
GROUP BY playerID
HAVING max(yearID)-min(yearID) > 0
ORDER BY (max(yearID)-min(yearID))-count(yearID) DESC;
