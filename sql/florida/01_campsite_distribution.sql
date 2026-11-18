-- Query 1: Camp Site Locations
-- The first query should extract or filter a set of features from one OSM layer.
-- looks at camp site distribution

SELECT
    geom
FROM
    pois
WHERE
    fclass = 'camp_site';

-- shows geoms for resturants
--SELECT fclass
--FROM pois;