# Count of batters by handedness from 1925 to present
SELECT yearID AS 'YEAR_ID', bats AS 'HANDEDNESS', COUNT(BATS) AS 'COUNT'
FROM batting b
JOIN people p
ON b.playerID = p.playerID
WHERE yearID >= 1925 AND AB > 0
GROUP BY yearID, bats;
