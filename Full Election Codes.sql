-- Clusters Based on Longitude and Latitude

SELECT  CAST(Geolocation AS varchar(50)) AS Geolocation, Address, APC, LP, PDP, NNPP,  
DENSE_RANK() OVER(ORDER BY CAST(Geolocation AS varchar(50)) ) AS Clusters 
FROM complete$
ORDER BY Clusters


--DETERMINATION OF THE OUTLIER POLLING UNITS PER POLITICAL PARTY(PDP)
  
  WITH t1 AS 
  (SELECT  Address, APC,LP,PDP,NNPP , STDEV(PDP) OVER(ORDER BY PDP) Standard_Deviation
  FROM complete$)
  
  SELECT *
  FROM 
  t1
  WHERE Standard_Deviation>2
  ORDER BY Standard_Deviation desc


  --OUTLIER SCORE COMPUTATION FOR SELECTED TOP 3 OUTLIER POLLING UNITS COMPARED TO NEIGHBOURING POLLING UNITS WITHIN 1 KILOMETER RADIUS

DECLARE @LocStart GEOGRAPHY 
SELECT @LocStart = Geolocation
FROM complete$
WHERE Address = 'AMA-OKPOGBA, ANAMBRA EAST, ANAMBRA';

SELECT  CAST(Geolocation AS varchar(50)) Geolocation, Address, APC, LP, PDP, NNPP, @LocStart.STDistance (Geolocation) AS Distance_metres,
STDEV(LP) OVER (ORDER BY LP ) Standard_Deviation
FROM complete$
WHERE @LocStart.STDistance (Geolocation) <= 1000
ORDER BY Standard_Deviation desc


WITH t1 AS 
(SELECT Address, CAST(Geolocation AS varchar(50)) Geolocation , APC, LP, PDP, NNPP, 
COUNT(CAST(Geolocation AS varchar(50))) OVER(PARTITION BY Address, CAST(Geolocation AS varchar(50)) ORDER BY CAST(Geolocation AS varchar(50))) lat
FROM complete$
GROUP BY Address, CAST(Geolocation AS varchar(50)), APC, LP, PDP, NNPP)

SELECT  *,  DENSE_RANK() OVER(ORDER BY CAST(Geolocation AS varchar(50)) ) Clusters
FROM t1
--WHERE LP<APC
GROUP BY Address, CAST(Geolocation AS varchar(50)), APC, LP, PDP, NNPP, lat