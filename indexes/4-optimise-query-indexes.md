Concepts: index fragmentation and page density
What is index fragmentation and how it impacts performance:

Note Documentation uses the term B-tree generally in reference to indexes. In rowstore indexes, the Database Engine implements a B+ tree. This does not apply to columnstore indexes or indexes on memory-optimized tables.

In B-tree (rowstore) indexes, fragmentation exists when indexes have pages in which the logical ordering within the index, based on the key values of the index, does not match the physical ordering of index pages.

The Database Engine automatically modifies indexes whenever insert, update, or delete operations are made to the underlying data. For example, the addition of rows in a table can cause existing pages in rowstore indexes to split, making room for the insertion of new rows. Over time these modifications can cause the data in the index to become scattered in the database (fragmented).

For queries that read many pages using full or range index scans, heavily fragmented indexes can degrade query performance when additional I/O is required to read the data. Instead of a small number of large I/O requests, the query would require a larger number of small I/O requests to read the same amount of data.

When the storage subsystem provides better sequential I/O performance than random I/O performance, index fragmentation can degrade performance because more random I/O is required to read fragmented indexes.

What is page density (also known as page fullness) and how it impacts performance:

Each page in the database can contain a variable number of rows. If rows take all space on a page, page density is 100%. If a page is empty, page density is 0%. If a page with 100% density is split in two pages to accommodate a new row, the density of the two new pages is approximately 50%.

When page density is low, more pages are required to store the same amount of data. This means that more I/O is necessary to read and write this data, and more memory is necessary to cache this data. When memory is limited, fewer pages required by a query are cached, causing even more disk I/O. Consequently, low page density negatively impacts performance.

When Database Engine adds rows to a page during index creation, rebuild, or reorganization, it will not fill the page fully if the fill factor for the index is set to a value other than 100 (or 0, which is equivalent in this context). This causes lower page density, and similarly adds I/O overhead and negatively impacts performance.

Low page density can increase the number of intermediate B-tree levels. This moderately increases CPU and I/O cost of finding leaf level pages in index scans and seeks.

When the Query Optimizer compiles a query plan, it considers the cost of I/O needed to read the data required by the query. With low page density, there are more pages to read, therefore the cost of I/O is higher. This can impact query plan choice. For example, as page density decreases over time due to page splits, the optimizer can compile a different plan for the same query, with a different performance and resource consumption profile.

Resource : https://learn.microsoft.com/en-us/sql/relational-databases/indexes/reorganize-and-rebuild-indexes?view=sql-server-ver16