select * from Credit_card$
select * from Credit_card_label$

--1.Group the customers based on their income type and find the average of their annual income.
select Type_Income, Floor(AVG(Annual_income)) from Credit_card$
group by Type_Income

--2.Find the female owners of cars and property.
select count(Car_Owner) as C_owner,Count(Propert_Owner) as P_owner,GENDER  from Credit_card$
group by GENDER
having GENDER='F'

--3.Find the male customers who are staying with their families.
select Count(GENDER) as Males_Families, Housing_type from Credit_card$
where Housing_type='With parents' and GENDER='M'
Group by GENDER,Housing_type

--4.Please list the top five people having the highest income.
Select top(5) max(Annual_Income) as Highest_Income,Ind_ID from Credit_card$
group by Annual_income,Ind_ID

--5.How many married people are having bad credit?

select count(Credit_card$.Marital_status)as No_Bad_Credit from Credit_card_label$
join Credit_card$
on Credit_card$.Ind_ID = Credit_card_label$.Ind_ID
where Marital_status= 'Married' and label=1

--6.What is the highest education level and what is the total count?

select EDUCATION,COUNT(EDUCATION) as Count_Edu_Type from Credit_card$
group by EDUCATION
order by Count_Edu_Type Desc

--7.Between married males and females, who is having more bad credit?
select top(2)  Count (GENDER) as gender_cnt,GENDER from Credit_card_label$
join Credit_card$
on Credit_card$.Ind_ID = Credit_card_label$.Ind_ID
where Marital_status= 'Married' and label=1
group by GENDER
order by gender_cnt DESC