# Miscellany #

# What share of hitters hit and throw with different hands? How has this changed over time?
SELECT a.yearID, a.DIFF_HAND, b.TOTAL_PLAYERS, A.DIFF_HAND/b.TOTAL_PLAYERS
FROM (
	SELECT yearID, COUNT(DIFF_HAND) AS "DIFF_HAND"
	FROM (
		SELECT DISTINCT(b.playerID), yearID, bats, throws, (bats != throws) AS "DIFF_HAND"
		FROM batting b
		JOIN people m
		ON b.playerID = m.playerID
		WHERE yearID > 1924 AND (bats != throws) = 1) as t
	GROUP BY yearID
	ORDER BY yearID) as a
JOIN (
	SELECT yearID, COUNT(playerID) AS "TOTAL_PLAYERS"
	FROM (
		SELECT DISTINCT(b.playerID), yearID, bats, throws, (bats != throws) AS "DIFF_HAND"
		FROM batting b
		JOIN people m
		ON b.playerID = m.playerID
		WHERE yearID > 1924) as t
	GROUP BY yearID
	ORDER BY yearID) as b
ON a.yearID = b.yearID;
