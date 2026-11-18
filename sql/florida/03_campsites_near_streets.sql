-- Query 3: Camp sites within 0.5 miles of streets
-- The third query should use a spatial relationship or derived spatial metric, such as proximity, clipped area, clipped length, or density.
-- 3216 means 2 miles, showing only if greater than 10 camp sites within distance (2 miles)

WITH camps AS (
    SELECT
        geom
    FROM
        pois
    WHERE
        fclass = 'camp_site'
)

SELECT
    rds.name AS street_name,
    COUNT(DISTINCT c.geom) AS nearby_camp_sites_count,
    ST_Union(rds.geom) AS geom
FROM
    roads AS rds
JOIN
    camps AS c ON ST_DWithin(c.geom::geography, rds.geom::geography, 3216)
WHERE
    rds.name IS NOT NULL
    AND rds.fclass = 'cycleway'
GROUP BY
    rds.name
HAVING
    COUNT(DISTINCT c.geom) > 10
ORDER BY
    nearby_camp_sites_count DESC;

--select DISTINCT fclass from pois
--order by fclass