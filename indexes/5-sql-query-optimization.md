Optimization Goals :
 -> improve performance
 -> reduce response time 
 -> conserve technology resources
 -> save money


 The right tool makes all the differnce

 -> select only the columns you need [ coz selecting all will consume more resources ]
 -> use limit to preview query results [ LIMIT / TOP ]
 -> use wildcards only at the end of a phrase [%a% VS A% COZ WILDCARDS generate wide searches ]
 -> avoid select distinct if possible [coz it requires lot of resources to group ]
 -> run large queries during off peak hours
 -> Use indexes effectively
 -> Use appropriate data types and layouts
 -> Use EXIST() instead of COUNT() queries for checking 
 ->  Avoid subqueries : When subqueries are used in WHERE or HAVING clauses, they can slow down the performance of the query. This is because they can return large numbers of rows, making them difficult to execute.

JOIN clauses are often a better choice.
-> Monitor query performace : Query profiling is one way of monitoring the performance of your queries. This involves analyzing statistics such as run time and amount of rows returned, looking at server speeds, database logs, and external factors to identify problem areas.

