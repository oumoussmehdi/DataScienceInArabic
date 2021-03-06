/** get all the columns and rows from the database */
SELECT [Education_Level]
      ,[Age]
      ,[Age_Range]
      ,[Employment_Status]
      ,[Gender]
      ,[Children]
      ,[Weekly_Earnings]
      ,[Year]
      ,[Weekly_Hours_Worked]
      ,[Sleeping]
      ,[Grooming]
      ,[Housework]
      ,[Food_Drink_Prep]
      ,[Caring_for_Children]
      ,[Playing_with_Children]
      ,[Job_Searching]
      ,[Shopping]
      ,[Eating_and_Drinking]
      ,[Socializing_and_Relaxing]
      ,[Television]
      ,[Golfing]
      ,[Running]
      ,[Volunteering]
  FROM [sql_server_db].[dbo].[American-Time-Use-Survey]

/* get all the columns and rows */
/* الحصول على كل الاعمدة و الصفوف*/
Select *
FROM [sql_server_db].[dbo].[American-Time-Use-Survey]

/*get only the top 10 rows of a given query */
/*الحصول على الصفوف العشر الاوائل  */
Select top(10) *
FROM [sql_server_db].[dbo].[American-Time-Use-Survey]

Select *
FROM [sql_server_db].[dbo].[American-Time-Use-Survey]
limit 10

--  Where Clause --
-- العبارة حيث --
/** get all the columns and rows from the database */

/* numeric field */
/* حقل رقمي  */
select *
from [sql_server_db].[dbo].[American-Time-Use-Survey]
where Age = 25

/* categorical field*/
/* حقل غير رقمي  */
select *
from [sql_server_db].[dbo].[American-Time-Use-Survey]
where Education_Level = 'Bachelor'

/* and */
/* و  */
select *
from [sql_server_db].[dbo].[American-Time-Use-Survey]
where Children >= 1 and Children < 3

/* */
select *
from [sql_server_db].[dbo].[American-Time-Use-Survey]
where Children >= 5 and Weekly_Earnings = 0

/* in  */
select *
from [sql_server_db].[dbo].[American-Time-Use-Survey]
where Education_Level in ('Bachelor','Master','Doctoral Degree')

select *
from [sql_server_db].[dbo].[American-Time-Use-Survey]
where Education_Level not in ('Bachelor','Master','Doctoral Degree')

/* Between */
select *
from [sql_server_db].[dbo].[American-Time-Use-Survey]
where Children between 5 and 7

/* or  */
/* أو  */


/* like */
/* مثل   */
select *
from [sql_server_db].[dbo].[American-Time-Use-Survey]
where Gender like '%le'

select *
from [sql_server_db].[dbo].[American-Time-Use-Survey]
where Employment_Status like '%mploy%'

select *
from [sql_server_db].[dbo].[American-Time-Use-Survey]
where Employment_Status not like '%mploy%'


-- distinct مختلف --
select count(*)
FROM [sql_server_db].[dbo].[American-Time-Use-Survey]
# 44461

select distinct *
FROM [sql_server_db].[dbo].[American-Time-Use-Survey]
# 44461 - no duplicate متكررة نصوص لا

/*مختلف القيم على صعيد عمود ما*/
select distinct Age_Range
FROM [sql_server_db].[dbo].[American-Time-Use-Survey]

select distinct Education_Level
FROM [sql_server_db].[dbo].[American-Time-Use-Survey]


-- Order by - الترتيب ب --
Select *
FROM [sql_server_db].[dbo].[American-Time-Use-Survey]
Order by Education_Level 

/* الترتيب حسب ترتيب الاعمدة - لا ينصح به */
Select *
FROM [sql_server_db].[dbo].[American-Time-Use-Survey]
Order by 1 


Select *
FROM [sql_server_db].[dbo].[American-Time-Use-Survey]
Order by Age desc

/*يمكن استعمال اعمدة متعددة */
Select *
FROM [sql_server_db].[dbo].[American-Time-Use-Survey]
where Age_Range = '20-29'
Order by Gender, Age

/* ترتيب تصاعدي او تنازلي */
Select *
FROM [sql_server_db].[dbo].[American-Time-Use-Survey]
where Age_Range = '20-29'
Order by Age,  Gender desc -- age is in ascending order

Select *
FROM [sql_server_db].[dbo].[American-Time-Use-Survey]
where Age_Range = '20-29'
Order by Gender desc, Age desc

                                    -- Group by - التجميع ب --

/* عدد الصفوف حسب الدراسة */
select Education_Level, count(*)
from sql_server_db.dbo.[American-Time-Use-Survey]
group by Education_Level


/* عدد الصفوف حسب الجنس */
select Gender, count(*)
from sql_server_db.dbo.[American-Time-Use-Survey]
group by Gender

/*always after where - بعد العبارة حيث */
select Gender, count(*)
from [sql_server_db].[dbo].[American-Time-Use-Survey]
where Children >= 5 and Weekly_Earnings = 0
group by Gender

/* من هم اغلب المجيبين على الاستفتاء */
select Education_Level, count(*) as nb_rec
from [sql_server_db].[dbo].[American-Time-Use-Survey]
group by Education_Level
order by nb_rec desc


/*  */
select Employment_Status, count(*) as nb_rec
from [sql_server_db].[dbo].[American-Time-Use-Survey]
group by Employment_Status

/* min, average, max */
select Employment_Status, min(Children) as min_children, avg(Children) asaverage_age , max(Children) as max_children
from [sql_server_db].[dbo].[American-Time-Use-Survey]
group by Employment_Status

select min(Age) min_age, avg(Age) average_age, max(Age) as max_age
from [sql_server_db].[dbo].[American-Time-Use-Survey]

/*مجموع الاطفال حسب الفئة العمرية*/
select Age_Range, sum(Children) children_total_count
from [sql_server_db].[dbo].[American-Time-Use-Survey]
group by Age_Range
order by children_total_count desc

/* */
select Gender, count(*)
from [sql_server_db].[dbo].[American-Time-Use-Survey]
where Children >= 5 and Weekly_Earnings = 0
group by Gender



/*using having*/
select Gender, count(*)
from [sql_server_db].[dbo].[American-Time-Use-Survey]
group by Employment_Status
having Employment_Status = 'Unemployed'


/* the max and min age in our survey */
select min(Age) as youngest , max(Age) as older
from [sql_server_db].[dbo].[American-Time-Use-Survey]

/* get an idea about the different values in a given column : Example Education_Level */
select distinct	Education_Level
from [sql_server_db].[dbo].[American-Time-Use-Survey]

/* the number of males and females in our survey */
select Gender, count(*) as gender_count
from [sql_server_db].[dbo].[American-Time-Use-Survey]
group by Gender; 

/** order the result of a query */
Select *
FROM [sql_server_db].[dbo].[American-Time-Use-Survey]
order by Weekly_Earnings


Select *
FROM [sql_server_db].[dbo].[American-Time-Use-Survey]
order by Weekly_Earnings desc

/* what is the min, average and max weekly_earning for a given Education_Level */
select Education_Level, 
min(Weekly_Earnings) as min_Weekly_Earnings, 
avg(Weekly_Earnings) as avg_Weekly_Earnings, 
max(Weekly_Earnings) as max_Weekly_Earnings
from [sql_server_db].[dbo].[American-Time-Use-Survey]
group by Education_Level
