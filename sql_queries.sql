-- 1
-- World Bank's international debt data

select sub_table."Country Code" as "Country Code", sub_table."Country Name" as Country, 
sub_table."Series Code" as Code, sub_table."Total Debt" as "Total Debt"
from
(
          select ecd."Country Code", ecd."Country Name", ecd."Series Code", 
         (sum(Cast("1970" as decimal)) + sum(cast("1971" as decimal)) + sum(cast("1972" as decimal)) + sum(cast("1973" as decimal)) + 
          sum(cast("1974" as decimal)) + sum(cast("1975" as decimal)) + sum(cast("1976" as decimal)) + sum(cast("1977" as decimal)) + 
          sum(cast("1978" as decimal)) + sum(cast("1979" as decimal)) + sum(cast("1980" as decimal)) + sum(cast("1981" as decimal)) + 
          sum(cast("1982" as decimal)) + sum(cast("1983" as decimal)) + sum(cast("1984" as decimal)) + sum(cast("1985" as decimal)) + 
          sum(cast("1986" as decimal)) + sum(cast("1987" as decimal)) + sum(cast("1988" as decimal)) + sum(cast("1989" as decimal)) + 
          sum(cast("1990" as decimal)) + sum(cast("1991" as decimal)) + sum(cast("1992" as decimal)) + sum(cast("1993" as decimal)) +  
          sum(cast("1994" as decimal)) + sum(cast("1995" as decimal)) + sum(cast("1996" as decimal)) + sum(cast("1997" as decimal)) + 
          sum(cast("1998" as decimal)) + sum(cast("1999" as decimal)) + sum(cast("2000" as decimal)) + sum(cast("2001" as decimal)) + 
          sum(cast("2002" as decimal)) + sum(cast("2003" as decimal)) + sum(cast("2004" as decimal)) + sum(cast("2005" as decimal)) + 
          sum(cast("2006" as decimal)) + sum(cast("2007" as decimal)) + sum(cast("2008" as decimal)) + sum(cast("2009" as decimal)) + 
          sum(cast("2010" as decimal)) + sum(cast("2011" as decimal)) + sum(cast("2012" as decimal)) + sum(cast("2013" as decimal)) + 
          sum(cast("2014" as decimal)) + sum(cast("2015" as decimal)) + sum(cast("2016" as decimal)) + sum(cast("2017" as decimal)) + 
          sum(cast("2018" as decimal)) + sum(cast("2019" as decimal)) + sum(cast("2020" as decimal)) + sum(cast("2021" as decimal)) + 
          sum(cast("2022" as decimal)) + sum(cast("2023" as decimal)) + sum(cast("2024" as decimal)) + sum(cast("2025" as decimal)) + 
          sum(cast("2026" as decimal)) + sum(cast("2027" as decimal)) + sum(cast("2028" as decimal)) + sum(cast("2029" as decimal)) 
          ) as "Total Debt"
         from exported_countriesdata ecd
         group by ecd."Country Code", ecd."Country Name", ecd."Series Code"
) sub_table
where "Total Debt" is not null
limit 50;







-- 2
-- Number of distinct countries

select count(distinct("Country Name")) as "No. Of Countries" from exported_countriesdata;








-- 3 
-- Distinct Debt Indicators

select distinct "Series Code", "Series Name" 
from exported_countriesdata;








-- 4
-- Total Debt Owned By The Countries
select round(sum(sub_table."Total Debt") / 1000000, 2) as "Total Debt Owned"
from
        (
         select ecd."Country Code", 
         (sum(Cast("1970" as decimal)) + sum(cast("1971" as decimal)) + sum(cast("1972" as decimal)) + sum(cast("1973" as decimal)) + 
         sum(cast("1974" as decimal)) + sum(cast("1975" as decimal)) + sum(cast("1976" as decimal)) + sum(cast("1977" as decimal)) + 
         sum(cast("1978" as decimal)) + sum(cast("1979" as decimal)) + sum(cast("1980" as decimal)) + sum(cast("1981" as decimal)) + 
         sum(cast("1982" as decimal)) + sum(cast("1983" as decimal)) + sum(cast("1984" as decimal)) + sum(cast("1985" as decimal)) + 
         sum(cast("1986" as decimal)) + sum(cast("1987" as decimal)) + sum(cast("1988" as decimal)) + sum(cast("1989" as decimal)) + 
         sum(cast("1990" as decimal)) + sum(cast("1991" as decimal)) + sum(cast("1992" as decimal)) + sum(cast("1993" as decimal)) +  
         sum(cast("1994" as decimal)) + sum(cast("1995" as decimal)) + sum(cast("1996" as decimal)) + sum(cast("1997" as decimal)) + 
         sum(cast("1998" as decimal)) + sum(cast("1999" as decimal)) + sum(cast("2000" as decimal)) + sum(cast("2001" as decimal)) + 
         sum(cast("2002" as decimal)) + sum(cast("2003" as decimal)) + sum(cast("2004" as decimal)) + sum(cast("2005" as decimal)) + 
         sum(cast("2006" as decimal)) + sum(cast("2007" as decimal)) + sum(cast("2008" as decimal)) + sum(cast("2009" as decimal)) + 
         sum(cast("2010" as decimal)) + sum(cast("2011" as decimal)) + sum(cast("2012" as decimal)) + sum(cast("2013" as decimal)) + 
         sum(cast("2014" as decimal)) + sum(cast("2015" as decimal)) + sum(cast("2016" as decimal)) + sum(cast("2017" as decimal)) + 
         sum(cast("2018" as decimal)) + sum(cast("2019" as decimal)) + sum(cast("2020" as decimal)) + sum(cast("2021" as decimal)) + 
         sum(cast("2022" as decimal)) + sum(cast("2023" as decimal)) + sum(cast("2024" as decimal)) + sum(cast("2025" as decimal)) + 
         sum(cast("2026" as decimal)) + sum(cast("2027" as decimal)) + sum(cast("2028" as decimal)) + sum(cast("2029" as decimal)) 
         )  as "Total Debt"
from exported_countriesdata ecd
group by ecd."Country Code"
) sub_table;









-- 5
-- Average Amount Of Debt Owned by the Countries Across Different Indicators


Select sub_table.Country as Country, sub_table.indicators as indicators, sub_table."Average Debt" as "Average Debt"
from
          (
select distinct ecd."Country Name" as Country, ecd."Series Code" as indicators,
              (avg(Cast("1970" as decimal)) + avg(cast("1971" as decimal)) + avg(cast("1972" as decimal)) + avg(cast("1973" as decimal)) + 
               avg(cast("1974" as decimal)) + avg(cast("1975" as decimal)) + avg(cast("1976" as decimal)) + avg(cast("1977" as decimal)) + 
               avg(cast("1978" as decimal)) + avg(cast("1979" as decimal)) + avg(cast("1980" as decimal)) + avg(cast("1981" as decimal)) + 
               avg(cast("1982" as decimal)) + avg(cast("1983" as decimal)) + avg(cast("1984" as decimal)) + avg(cast("1985" as decimal)) + 
               avg(cast("1986" as decimal)) + avg(cast("1987" as decimal)) + avg(cast("1988" as decimal)) + avg(cast("1989" as decimal)) + 
               avg(cast("1990" as decimal)) + avg(cast("1991" as decimal)) + avg(cast("1992" as decimal)) + avg(cast("1993" as decimal)) +  
               avg(cast("1994" as decimal)) + avg(cast("1995" as decimal)) + avg(cast("1996" as decimal)) + avg(cast("1997" as decimal)) + 
               avg(cast("1998" as decimal)) + avg(cast("1999" as decimal)) + avg(cast("2000" as decimal)) + avg(cast("2001" as decimal)) + 
               avg(cast("2002" as decimal)) + avg(cast("2003" as decimal)) + avg(cast("2004" as decimal)) + avg(cast("2005" as decimal)) + 
               avg(cast("2006" as decimal)) + avg(cast("2007" as decimal)) + avg(cast("2008" as decimal)) + avg(cast("2009" as decimal)) + 
               avg(cast("2010" as decimal)) + avg(cast("2011" as decimal)) + avg(cast("2012" as decimal)) + avg(cast("2013" as decimal)) + 
               avg(cast("2014" as decimal)) + avg(cast("2015" as decimal)) + avg(cast("2016" as decimal)) + avg(cast("2017" as decimal)) + 
               avg(cast("2018" as decimal)) + avg(cast("2019" as decimal)) + avg(cast("2020" as decimal)) + avg(cast("2021" as decimal)) + 
               avg(cast("2022" as decimal)) + avg(cast("2023" as decimal)) + avg(cast("2024" as decimal)) + avg(cast("2025" as decimal)) + 
               avg(cast("2026" as decimal)) + avg(cast("2027" as decimal)) + avg(cast("2028" as decimal)) + avg(cast("2029" as decimal)) 
               ) as "Average Debt"
               from
               exported_countriesdata as  ecd
               group by "Country Name", "Series Code"
) sub_table
where sub_table."Average Debt" is not null
order by sub_table."Average Debt" desc;







--6
-- Country with the highest debt
select sub_table."Country Name" as Country, max(sub_table."Highest Debt") as "Highest Debt" from
(
	select distinct ecd."Country Name", 
                (sum(Cast("1970" as decimal)) + sum(cast("1971" as decimal)) + sum(cast("1972" as decimal)) + sum(cast("1973" as decimal)) + 
                 sum(cast("1974" as decimal)) + sum(cast("1975" as decimal)) + sum(cast("1976" as decimal)) + sum(cast("1977" as decimal)) + 
                 sum(cast("1978" as decimal)) + sum(cast("1979" as decimal)) + sum(cast("1980" as decimal)) + sum(cast("1981" as decimal)) + 
                 sum(cast("1982" as decimal)) + sum(cast("1983" as decimal)) + sum(cast("1984" as decimal)) + sum(cast("1985" as decimal)) + 
                 sum(cast("1986" as decimal)) + sum(cast("1987" as decimal)) + sum(cast("1988" as decimal)) + sum(cast("1989" as decimal)) + 
                 sum(cast("1990" as decimal)) + sum(cast("1991" as decimal)) + sum(cast("1992" as decimal)) + sum(cast("1993" as decimal)) +  
                 sum(cast("1994" as decimal)) + sum(cast("1995" as decimal)) + sum(cast("1996" as decimal)) + sum(cast("1997" as decimal)) + 
                 sum(cast("1998" as decimal)) + sum(cast("1999" as decimal)) + sum(cast("2000" as decimal)) + sum(cast("2001" as decimal)) + 
                 sum(cast("2002" as decimal)) + sum(cast("2003" as decimal)) + sum(cast("2004" as decimal)) + sum(cast("2005" as decimal)) + 
                 sum(cast("2006" as decimal)) + sum(cast("2007" as decimal)) + sum(cast("2008" as decimal)) + sum(cast("2009" as decimal)) + 
                 sum(cast("2010" as decimal)) + sum(cast("2011" as decimal)) + sum(cast("2012" as decimal)) + sum(cast("2013" as decimal)) + 
                 sum(cast("2014" as decimal)) + sum(cast("2015" as decimal)) + sum(cast("2016" as decimal)) + sum(cast("2017" as decimal)) + 
                 sum(cast("2018" as decimal)) + sum(cast("2019" as decimal)) + sum(cast("2020" as decimal)) + sum(cast("2021" as decimal)) + 
                 sum(cast("2022" as decimal)) + sum(cast("2023" as decimal)) + sum(cast("2024" as decimal)) + sum(cast("2025" as decimal)) + 
                 sum(cast("2026" as decimal)) + sum(cast("2027" as decimal)) + sum(cast("2028" as decimal)) + sum(cast("2029" as decimal)) 
                ) as "Highest Debt"
                from exported_countriesdata as ecd
               group by "Country Name"
) sub_table
group by Country, sub_table."Highest Debt"
order by sub_table."Highest Debt" desc
limit 5;








-- 7
-- Average Amount Of Debt  Across Different Indicators
select  sub_table.Code as Indicators, sub_table."Average Debt" as "Average Debt"
from
(
select ecd."Series Code" as Code,
                 (avg(Cast("1970" as decimal)) + avg(cast("1971" as decimal)) + avg(cast("1972" as decimal)) + avg(cast("1973" as decimal)) + 
                  avg(cast("1974" as decimal)) + avg(cast("1975" as decimal)) + avg(cast("1976" as decimal)) + avg(cast("1977" as decimal)) + 
                  avg(cast("1978" as decimal)) + avg(cast("1979" as decimal)) + avg(cast("1980" as decimal)) + avg(cast("1981" as decimal)) + 
                  avg(cast("1982" as decimal)) + avg(cast("1983" as decimal)) + avg(cast("1984" as decimal)) + avg(cast("1985" as decimal)) + 
                  avg(cast("1986" as decimal)) + avg(cast("1987" as decimal)) + avg(cast("1988" as decimal)) + avg(cast("1989" as decimal)) + 
                  avg(cast("1990" as decimal)) + avg(cast("1991" as decimal)) + avg(cast("1992" as decimal)) + avg(cast("1993" as decimal)) +  
                  avg(cast("1994" as decimal)) + avg(cast("1995" as decimal)) + avg(cast("1996" as decimal)) + avg(cast("1997" as decimal)) + 
                  avg(cast("1998" as decimal)) + avg(cast("1999" as decimal)) + avg(cast("2000" as decimal)) + avg(cast("2001" as decimal)) + 
                  avg(cast("2002" as decimal)) + avg(cast("2003" as decimal)) + avg(cast("2004" as decimal)) + avg(cast("2005" as decimal)) + 
                  avg(cast("2006" as decimal)) + avg(cast("2007" as decimal)) + avg(cast("2008" as decimal)) + avg(cast("2009" as decimal)) + 
                  avg(cast("2010" as decimal)) + avg(cast("2011" as decimal)) + avg(cast("2012" as decimal)) + avg(cast("2013" as decimal)) + 
                  avg(cast("2014" as decimal)) + avg(cast("2015" as decimal)) + avg(cast("2016" as decimal)) + avg(cast("2017" as decimal)) + 
                  avg(cast("2018" as decimal)) + avg(cast("2019" as decimal)) + avg(cast("2020" as decimal)) + avg(cast("2021" as decimal)) + 
                  avg(cast("2022" as decimal)) + avg(cast("2023" as decimal)) + avg(cast("2024" as decimal)) + avg(cast("2025" as decimal)) + 
                  avg(cast("2026" as decimal)) + avg(cast("2027" as decimal)) + avg(cast("2028" as decimal)) + avg(cast("2029" as decimal)) 
                 ) as "Average Debt"
                 from exported_countriesdata ecd
                 group by ecd."Series Code"
) sub_table
where sub_table."Average Debt" is not null
Group by sub_table.Code,  sub_table."Average Debt"
order by sub_table."Average Debt" desc; 








-- 8
-- The highest amount of principal repayments

select sub_table_1.indicators as indicators, sub_table_1.Country as Country, sub_table_1."Highest Debt" as "Highest Debt" from
(
	select  sub_table.Code as indicators, sub_table.Country as Country, max(sub_table."Highest Debt") as "Highest Debt"
          from	
                 (
                      select ecd."Series Code" as Code, ecd."Country Name" as Country,
                      (sum(Cast("1970" as decimal)) + sum(cast("1971" as decimal)) + sum(cast("1972" as decimal)) + sum(cast("1973" as decimal)) + 
                       sum(cast("1974" as decimal)) + sum(cast("1975" as decimal)) + sum(cast("1976" as decimal)) + sum(cast("1977" as decimal)) + 
                       sum(cast("1978" as decimal)) + sum(cast("1979" as decimal)) + sum(cast("1980" as decimal)) + sum(cast("1981" as decimal)) + 
                       sum(cast("1982" as decimal)) + sum(cast("1983" as decimal)) + sum(cast("1984" as decimal)) + sum(cast("1985" as decimal)) + 
                       sum(cast("1986" as decimal)) + sum(cast("1987" as decimal)) + sum(cast("1988" as decimal)) + sum(cast("1989" as decimal)) + 
                       sum(cast("1990" as decimal)) + sum(cast("1991" as decimal)) + sum(cast("1992" as decimal)) + sum(cast("1993" as decimal)) +  
                       sum(cast("1994" as decimal)) + sum(cast("1995" as decimal)) + sum(cast("1996" as decimal)) + sum(cast("1997" as decimal)) + 
                       sum(cast("1998" as decimal)) + sum(cast("1999" as decimal)) + sum(cast("2000" as decimal)) + sum(cast("2001" as decimal)) + 
                       sum(cast("2002" as decimal)) + sum(cast("2003" as decimal)) + sum(cast("2004" as decimal)) + sum(cast("2005" as decimal)) + 
                       sum(cast("2006" as decimal)) + sum(cast("2007" as decimal)) + sum(cast("2008" as decimal)) + sum(cast("2009" as decimal)) + 
                       sum(cast("2010" as decimal)) + sum(cast("2011" as decimal)) + sum(cast("2012" as decimal)) + sum(cast("2013" as decimal)) + 
                       sum(cast("2014" as decimal)) + sum(cast("2015" as decimal)) + sum(cast("2016" as decimal)) + sum(cast("2017" as decimal)) + 
                       sum(cast("2018" as decimal)) + sum(cast("2019" as decimal)) + sum(cast("2020" as decimal)) + sum(cast("2021" as decimal)) + 
                       sum(cast("2022" as decimal)) + sum(cast("2023" as decimal)) + sum(cast("2024" as decimal)) + sum(cast("2025" as decimal)) + 
                       sum(cast("2026" as decimal)) + sum(cast("2027" as decimal)) + sum(cast("2028" as decimal)) + sum(cast("2029" as decimal)) 
                       ) as "Highest Debt"
                      from exported_countriesdata ecd
                      where ecd."Series Code" = 'DT.TDS.DECT.CD'
                      group by ecd."Series Code", ecd."Country Name"
                 ) sub_table	
                  where sub_table."Highest Debt" is not null
                  group by sub_table.Country, sub_table.Code, sub_table."Highest Debt"
                 order by "Highest Debt" desc
) sub_table_1
limit 5;







-- 9
-- The most common debt indicator

select  "Series Code" as Indicator, count(*) as "Count"  from country_seriesmetadata
group by "Series Code"
order by "Count" desc; 







-- 10
-- Other viable debt issues and conclusion

-- Total Amount Of Debt Owned by the Different Countries & Indicators

with cte as
(select ecd."Country Name", ecd."Series Code",
                   (sum(Cast("1970" as decimal)) + sum(cast("1971" as decimal)) + sum(cast("1972" as decimal)) + sum(cast("1973" as decimal)) + 
                    sum(cast("1974" as decimal)) + sum(cast("1975" as decimal)) + sum(cast("1976" as decimal)) + sum(cast("1977" as decimal)) + 
                    sum(cast("1978" as decimal)) + sum(cast("1979" as decimal)) + sum(cast("1980" as decimal)) + sum(cast("1981" as decimal)) + 
                    sum(cast("1982" as decimal)) + sum(cast("1983" as decimal)) + sum(cast("1984" as decimal)) + sum(cast("1985" as decimal)) + 
                    sum(cast("1986" as decimal)) + sum(cast("1987" as decimal)) + sum(cast("1988" as decimal)) + sum(cast("1989" as decimal)) + 
                    sum(cast("1990" as decimal)) + sum(cast("1991" as decimal)) + sum(cast("1992" as decimal)) + sum(cast("1993" as decimal)) +  
                    sum(cast("1994" as decimal)) + sum(cast("1995" as decimal)) + sum(cast("1996" as decimal)) + sum(cast("1997" as decimal)) + 
                    sum(cast("1998" as decimal)) + sum(cast("1999" as decimal)) + sum(cast("2000" as decimal)) + sum(cast("2001" as decimal)) + 
                    sum(cast("2002" as decimal)) + sum(cast("2003" as decimal)) + sum(cast("2004" as decimal)) + sum(cast("2005" as decimal)) + 
                    sum(cast("2006" as decimal)) + sum(cast("2007" as decimal)) + sum(cast("2008" as decimal)) + sum(cast("2009" as decimal)) + 
                    sum(cast("2010" as decimal)) + sum(cast("2011" as decimal)) + sum(cast("2012" as decimal)) + sum(cast("2013" as decimal)) + 
                    sum(cast("2014" as decimal)) + sum(cast("2015" as decimal)) + sum(cast("2016" as decimal)) + sum(cast("2017" as decimal)) + 
                    sum(cast("2018" as decimal)) + sum(cast("2019" as decimal)) + sum(cast("2020" as decimal)) + sum(cast("2021" as decimal)) + 
                    sum(cast("2022" as decimal)) + sum(cast("2023" as decimal)) + sum(cast("2024" as decimal)) + sum(cast("2025" as decimal)) + 
                    sum(cast("2026" as decimal)) + sum(cast("2027" as decimal)) + sum(cast("2028" as decimal)) + sum(cast("2029" as decimal)) 
                   ) as "Total Debt"
                   from exported_countriesdata as ecd
                   group by "Country Name", "Series Code"
) 


select cte."Country Name" as Country, cte."Series Code" as Code, max(cte."Total Debt") as "Highest Debt"
from cte
where cte."Total Debt" is not null
group by cte."Country Name", cte."Series Code", cte."Total Debt"
order by cte."Total Debt" desc
limit 10;





/*

Conclusion

The Number Of Unique Indicators Is "136"


The Total Debt Owed By the Countries Is "2546920451.0"


The Highest Average Amount Of Debt is is "2711570294032.8" Owed By the Countries Is "China" Across Different Indicators Is "DT.DIS.DLXF.CD" 


The Country With The Highest Debt Is "China" whose debt is "505840890884961.19"


The Highest Average Amount Is "198971192924.05"  Across The Different Indicator Is "DT.TDS.DECT.CD"


The Highest Amount Of Principal Repayments the Country Owns is "Brazil" Across "DT.TDS.DECT.CD" is "2597720550626.7"
(Since The Indicator "DT.TDS.DECT.CD" Tops The The Highest Average Amount)


The Most Common Indicator Name is "Foreign direct investment, net inflows in reporting economy (DRS, current US$) (BX.KLT.DINV.CD.DT)"
which has been repeated "130" Times and tops the list

*/
























