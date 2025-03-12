#43 Write a query to get language wise top 3 longest runtime moves?
SELECT Title, LanguageID, Runtime_mins
FROM boxoffice
ORDER BY Runtime_mins DESC
LIMIT 3;

#44 Write a query to get language wise bottom 5 shortest runtime moves?
SELECT 
    LanguageID,
    Title,
    Runtime_mins
FROM boxoffice
ORDER BY Runtime_mins ASC
LIMIT 5;

#45 Write a query to get language wise top 5 films based first day collections?
SELECT Title, LanguageID, First_Day_Collection_Worldwide
FROM (
    SELECT Title, LanguageID, First_Day_Collection_Worldwide,
           RANK() OVER (PARTITION BY LanguageID ORDER BY First_Day_Collection_Worldwide DESC) AS rnk
    FROM boxoffice
) AS ranked
WHERE rnk <= 5;

#46 Write a query to get language wise top 5 films based India gross collections?
SELECT Title, LanguageID, India_Gross_Collection
FROM boxoffice
ORDER BY India_Gross_Collection DESC
LIMIT 5;

#47 Write a query to get language, Director wise films count?
SELECT 
    LanguageID,
    DirectorID,
    COUNT(*) AS Film_Count
FROM 
    boxoffice
GROUP BY 
    LanguageID, DirectorID
ORDER BY 
    LanguageID, Film_Count DESC;

#48 Write a query to get language wise OTT platofrm wise fims count?
SELECT 
    LanguageID, 
    OTT_Platform, 
    COUNT(*) AS Film_Count
FROM 
    boxoffice
GROUP BY 
    LanguageID, OTT_Platform
ORDER BY 
    LanguageID, OTT_Platform;
#49 What are top 10 fimns based language and first day collection?
SELECT 
    LanguageID,
    Title,
    First_Day_Collection_Worldwide
FROM 
    boxoffice
WHERE 
    First_Day_Collection_Worldwide IS NOT NULL
ORDER BY 
    LanguageID,
    First_Day_Collection_Worldwide DESC
LIMIT 10;

#50 Write a query to get director wise number of fims released in from year 2017 to 2019
SHOW COLUMNS FROM boxoffice;
SELECT 
    DirectorID, 
    COUNT(*) AS Number_of_Films
FROM 
    boxoffice
WHERE 
    YEAR(STR_TO_DATE(Release_Date, '%Y-%m-%d')) BETWEEN 2017 AND 2019
GROUP BY 
    DirectorID
ORDER BY 
    Number_of_Films DESC;

#51 Write a query to get director wise world wide collections?
SELECT 
    DirectorID,
    SUM(Worldwide_Collection_in_Crores) AS Total_Worldwide_Collection
FROM 
    boxoffice
GROUP BY 
    DirectorID
ORDER BY 
    Total_Worldwide_Collection DESC;

#52 Write a query to get director wise first day world wide collections?
SELECT 
    DirectorID,
    SUM(First_Day_Collection_Worldwide) AS Total_First_Day_Collection
FROM 
    boxoffice
GROUP BY 
    DirectorID
ORDER BY 
    Total_First_Day_Collection DESC;

#53 Write a query to get director wise India gross collections?
SELECT 
    DirectorID,
    SUM(India_Gross_Collection) AS Total_India_Gross_Collection
FROM 
    boxoffice
GROUP BY 
    DirectorID
ORDER BY 
    Total_India_Gross_Collection DESC;

#54 Write a query to get director wise overseas collections?
SELECT 
    DirectorID,
    SUM(Overseas_Collection) AS Total_Overseas_Collection
FROM 
    boxoffice
GROUP BY 
    DirectorID
ORDER BY 
    Total_Overseas_Collection DESC;

#55 Write a query to get director, lead actor/actress and number of films?
SELECT 
    DirectorID,
    Lead_Actor_Actress,
    COUNT(*) AS Number_of_Films
FROM 
    boxoffice
GROUP BY 
    DirectorID, Lead_Actor_Actress
ORDER BY 
    Number_of_Films DESC;

#56 Write a query to get films which is having budget on between 150 crores and 277 crores?
SELECT *
FROM boxoffice
WHERE Budget BETWEEN 150 AND 277;

#57 Write a query to get director, week name wise films released?
SELECT 
    DirectorID,
    Week_Name,
    COUNT(FilmID) AS Total_Films
FROM 
    boxoffice
GROUP BY 
    DirectorID, Week_Name
ORDER BY 
    DirectorID, Week_Name;

#58 Write a query to get OTT platofrm and director wise films released?
SELECT OTT_Platform, DirectorID, COUNT(*) AS Total_Films
FROM boxoffice
GROUP BY OTT_Platform, DirectorID
ORDER BY OTT_Platform, Total_Films DESC;

#59 Write a query to get director wise films released on Friday only?
SELECT 
    DirectorID,
    Title,
    Release_Date
FROM 
    boxoffice
WHERE 
    Week_Name = 'Friday'
ORDER BY 
    DirectorID, Release_Date;

#60 Write a query to get films based on IMDb reating between 6.5 and 7.7?
SELECT *
FROM boxoffice
WHERE IMDb_Rating BETWEEN 6.5 AND 7.7;

 #61 Write a query to get director, films and IMDb ratings?
 SELECT f.DirectorID, f.Title, f.IMDb_Rating
FROM boxoffice f
WHERE f.IMDb_Rating IS NOT NULL;

#62 Write a query to get films with highest budget based flop verdict?
SELECT Title, Budget, Verdict
FROM boxoffice
WHERE Verdict = 'Flop'
ORDER BY Budget DESC
LIMIT 5;

## Batch 2 

#63 Write a query to get total number of directors?
SELECT COUNT(DISTINCT DirectorID) AS Total_Directors
FROM boxoffice;

#64 Write a query to get vedridct wise total films released?
SELECT Verdict, COUNT(*) AS Total_Films
FROM boxoffice
GROUP BY Verdict
ORDER BY Total_Films DESC;

#65 Write a query to get top 10 directors based number of films?
SELECT 
    DirectorID,
    COUNT(FilmID) AS Number_of_Films
FROM 
    boxoffice
GROUP BY 
    DirectorID
ORDER BY 
    Number_of_Films DESC
LIMIT 10;

#66 Write a query to get top 5 directors based on world wide collections and also industry wise?
SELECT 
    DirectorID,
    Industry,
    SUM(Worldwide_Collection_in_Crores) AS Total_Worldwide_Collection
FROM 
    boxoffice
GROUP BY 
    Industry, DirectorID
ORDER BY 
    Industry, Total_Worldwide_Collection DESC
LIMIT 5;

#67 Write a query to get top 3 directors based on India gross collections in Bollowood industry?
SELECT 
    DirectorID,
    SUM(India_Gross_Collection) AS Total_India_Gross
FROM 
    boxoffice
WHERE 
    Industry = 'Bollywood'
GROUP BY 
    DirectorID
ORDER BY 
    Total_India_Gross DESC
LIMIT 3;

#68 Write a query to get top 3 directors based on India gross collections in Tollowood industry?
SELECT 
    DirectorID,
    SUM(India_Gross_Collection) AS Total_India_Gross
FROM 
    boxoffice
WHERE 
    Industry = 'Tollywood'
GROUP BY 
    DirectorID
ORDER BY 
    Total_India_Gross DESC
LIMIT 3;

#69 Write a query to get top 3 directors based on India gross collections in Kollowood industry?
SELECT 
    DirectorID,
    SUM(India_Gross_Collection) AS Total_India_Gross
FROM 
    boxoffice
WHERE 
    Industry = 'kollywood'
GROUP BY 
    DirectorID
ORDER BY 
    Total_India_Gross DESC
LIMIT 3;

#70 Write a query to get top 3 directors based on India gross collections in Mollowood industry?
SELECT 
    DirectorID,
    SUM(India_Gross_Collection) AS Total_India_Gross
FROM 
    boxoffice
WHERE 
    Industry = 'Mollywood'
GROUP BY 
    DirectorID
ORDER BY 
    Total_India_Gross DESC
LIMIT 3;

# 71 Write a query to get top 3 directors based on India gross collections in Sandalwood industry?
SELECT 
    DirectorID,
    SUM(India_Gross_Collection) AS Total_India_Gross
FROM 
    boxoffice
WHERE 
    Industry = 'Sandalwood'
GROUP BY 
    DirectorID
ORDER BY 
    Total_India_Gross DESC
LIMIT 3;

#72 Write to get total number of generes?
SELECT COUNT(DISTINCT GenreID) AS total_genres FROM boxoffice;

#73 Write query to get director, language, genere films count?
SELECT 
    DirectorID, 
    LanguageID, 
    GenreID, 
    COUNT(FilmID) AS FilmCount
FROM boxoffice
GROUP BY DirectorID, LanguageID, GenreID
ORDER BY FilmCount DESC;

#74 Write a query to genere wise budget?
SELECT GenreID AS Genre, SUM(Budget) AS Total_Budget
FROM boxoffice
GROUP BY GenreID
ORDER BY Total_Budget DESC;

#75 Write a query to get genere wise first day worldwide collections?
WITH RankedMovies AS (
    SELECT 
        GenreID, 
        Title, 
        Runtime_mins,
        ROW_NUMBER() OVER (PARTITION BY GenreID ORDER BY Runtime_mins) AS rn
    FROM 
        boxoffice
)
SELECT 
    GenreID, 
    Title, 
    Runtime_mins AS ShortestRuntime
FROM 
    RankedMovies
WHERE 
    rn = 1
ORDER BY 
    GenreID;
    
#76 Write a query to get genere wise overseas collections?
SELECT 
    GenreID, 
    SUM(Overseas_Collection) AS Total_Overseas_Collection
FROM 
    boxoffice
GROUP BY 
    GenreID
ORDER BY 
    GenreID;
    
#77 Write a query to get genere wise India gross collections?
SELECT GenreID, SUM(India_Gross_Collection) AS Total_India_Gross
FROM boxoffice
GROUP BY GenreID
ORDER BY Total_India_Gross DESC;

#78 Write a query to get genere wise top 2 longest run time movies?
SELECT Title, Runtime_mins 
FROM boxoffice 
ORDER BY Runtime_mins DESC 
LIMIT 2;

#79 Write a query to get genere wise bottom shortest runtime movies?
WITH RankedMovies AS (
    SELECT 
        GenreID, 
        Title, 
        Runtime_mins,
        ROW_NUMBER() OVER (PARTITION BY GenreID ORDER BY Runtime_mins) AS rn
    FROM 
        boxoffice
)
SELECT 
    GenreID, 
    Title, 
    Runtime_mins AS ShortestRuntime
FROM 
    RankedMovies
WHERE 
    rn = 1
ORDER BY 
    GenreID;
    
#80 Write a query to get verdict, genere wise films released?
SELECT 
    GenreID, 
    Verdict, 
    COUNT(FilmID) AS Total_Films
FROM boxoffice
GROUP BY GenreID, Verdict
ORDER BY GenreID, Verdict;

#81 Write a query to get genere, OTT platform wise films count?
SELECT GenreID, OTT_Platform, COUNT(*) AS Film_Count
FROM boxoffice
GROUP BY GenreID, OTT_Platform
ORDER BY GenreID, Film_Count DESC;

#82 Write a query to get genere wise films count?
SELECT GenreID, COUNT(*) AS film_count
FROM boxoffice
GROUP BY GenreID
ORDER BY film_count DESC;

#83 Write a query to get genere wise films count in Tollowood Industry?
SELECT GenreID, COUNT(*) AS Film_Count
FROM boxoffice
WHERE Industry = 'Tollywood'
GROUP BY GenreID
ORDER BY Film_Count DESC;

#84 Write a query to get genere wise films count in Kollowood Industry?
SELECT GenreID, COUNT(*) AS Film_Count
FROM boxoffice
WHERE Industry = 'Kollywood'
GROUP BY GenreID
ORDER BY Film_Count DESC;

#85 Write a query to get genere wise films count in Mollowood Industry?
SELECT GenreID, COUNT(FilmID) AS Film_Count
FROM boxoffice
WHERE Industry = 'Mollywood'
GROUP BY GenreID
ORDER BY Film_Count DESC;

#86 Write a query to get genere wise films count in Bollowood Industry?
SELECT GenreID, COUNT(FilmID) AS Film_Count
FROM boxoffice
WHERE Industry = 'Bollywood'
GROUP BY GenreID
ORDER BY Film_Count DESC;

#87 Write a query to get genere wise films count in Sandalwood Industry?
SELECT 
    GenreID, COUNT(*) AS Film_Count
FROM
    boxoffice
WHERE
    Industry = 'Sandalwood'
GROUP BY GenreID
ORDER BY Film_Count DESC;

#88 Write a query to get lead actors/actress wise, genere and films count?
SELECT 
    Lead_Actor_Actress, 
    GenreID, 
    COUNT(FilmID) AS Film_Count
FROM boxoffice
GROUP BY Lead_Actor_Actress, GenreID
ORDER BY Lead_Actor_Actress, Film_Count DESC;

#89 Write a query to get 5th rank movie based on Worldwide total collections?
SELECT Title, (Overseas_Collection + India_Gross_Collection) AS Worldwide_Total
FROM boxoffice
ORDER BY Worldwide_Total DESC
LIMIT 1 OFFSET 4;

#90 Write a query to get 5th rank movie by industry wise based on First day worldwide collections?
WITH RankedMovies AS (
    SELECT 
        Title, 
        Industry, 
        First_Day_Collection_Worldwide,
        RANK() OVER (PARTITION BY Industry ORDER BY First_Day_Collection_Worldwide DESC) AS MovieRank
    FROM boxoffice
) 
SELECT Title, Industry, First_Day_Collection_Worldwide
FROM RankedMovies
WHERE MovieRank = 5;

#91 Write a query to get 3rd rank movie by industry wise based on IMDb Ratings?
WITH RankedMovies AS (
    SELECT 
        Title, 
        Industry, 
        IMDb_Rating, 
        RANK() OVER (PARTITION BY Industry ORDER BY IMDb_Rating DESC) AS `rank`
    FROM boxoffice
)
SELECT Title, Industry, IMDb_Rating 
FROM RankedMovies 
WHERE `rank` = 3;

#92 Write a stored procedure to get top 5 films based on India gross colelctions?
DROP PROCEDURE IF EXISTS GetTop5FilmsByIndiaGross;

DELIMITER //


CREATE PROCEDURE GetTop5FilmsByIndiaGross()
BEGIN
   
    SELECT Title, India_Gross_Collection
    FROM boxoffice
    ORDER BY India_Gross_Collection DESC
    LIMIT 5;
END //

-- Step 4: Reset the delimiter to default
DELIMITER ;

CALL GetTop5FilmsByIndiaGross();

#93 Write a stored procdure to get industry Budget and Worldwide total collections? If we call any industry it will display industry, budget and wordwide total
DROP PROCEDURE IF EXISTS GetIndustryBudgetAndCollections;

DELIMITER $$
SELECT 
    Industry,
    SUM(Budget) AS Total_Budget,
    SUM(India_Gross_Collection + Overseas_Collection) AS Worldwide_Total_Collections
FROM boxoffice
WHERE Industry = 'Bollywood'
GROUP BY Industry;

#94 Calculate YoY% Budget growth?
WITH BudgetData AS (
    SELECT 
        Year, 
        SUM(Budget) AS TotalBudget
    FROM boxoffice
    GROUP BY Year
),
YoYGrowth AS (
    SELECT 
        b1.Year, 
        b1.TotalBudget, 
        b2.TotalBudget AS PrevYearBudget,
        CASE 
            WHEN b2.TotalBudget IS NOT NULL THEN 
                ((b1.TotalBudget - b2.TotalBudget) / b2.TotalBudget) * 100
            ELSE NULL
        END AS YoY_Percentage_Growth
    FROM BudgetData b1
    LEFT JOIN BudgetData b2 
        ON b1.Year = b2.Year + 1
)
SELECT * FROM YoYGrowth
ORDER BY Year;

#95 Calculate YoY% Worldwide total collelctions growth?
WITH yearly_collections AS (
    SELECT 
        Year,
        SUM(Worldwide_Collection_in_Crores) AS total_collection
    FROM boxoffice
    GROUP BY Year
)
SELECT 
    c1.Year,
    c1.total_collection,
    c2.total_collection AS prev_year_collection,
    ROUND(((c1.total_collection - c2.total_collection) / c2.total_collection) * 100, 2) AS YoY_Growth_Percentage
FROM yearly_collections c1
LEFT JOIN yearly_collections c2
ON c1.Year = c2.Year + 1
ORDER BY c1.Year;

#96 Calculate YoY%  indian gross collelctions growth?
WITH yearly_collections AS (
    SELECT 
        Year,
        SUM(India_Gross_Collection) AS total_gross
    FROM boxoffice
    GROUP BY Year
)
SELECT 
    a.Year,
    a.total_gross,
    b.total_gross AS prev_year_gross,
    ROUND(((a.total_gross - b.total_gross) / b.total_gross) * 100, 2) AS YoY_Percentage_Growth
FROM yearly_collections a
LEFT JOIN yearly_collections b
ON a.Year = b.Year + 1
ORDER BY a.Year;

#97 Create a stored procedure to get Total films count, world wide total colelctions?
DROP PROCEDURE IF EXISTS GetTotalFilmsAndCollections;

DELIMITER $$

CREATE PROCEDURE GetTotalFilmsAndCollections()
BEGIN
    SELECT 
        COUNT(FilmID) AS Total_Films,
        SUM(Worldwide_Collection_in_Crores) AS Total_Worldwide_Collections
    FROM boxoffice;
END $$


DELIMITER ;


CALL GetTotalFilmsAndCollections();

