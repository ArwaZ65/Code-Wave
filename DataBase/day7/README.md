# Differences Between View, Function, and Stored Procedure

Database management systems (DBMS) provide various tools and constructs to enhance data manipulation and querying. Among these, **Views**, **Functions**, and **Stored Procedures** serve distinct purposes and have unique characteristics. This document explains their differences in terms of purpose, structure, usage, and performance.

---

## 1. View

A **View** is a virtual table that provides a specific, predefined way of presenting data from one or more tables.

### Key Characteristics:
- **Definition:** A saved SQL query that retrieves data dynamically from underlying tables.
- **Data Retrieval:** Always reflects the current state of the underlying tables. Any changes in the base tables are reflected in the View.
- **Usage:** Mainly used for simplifying complex queries, securing data (by exposing only specific columns or rows), and providing data abstraction.
- **Execution:** Executed only when queried. It does not store data physically; instead, it runs the query and retrieves data at runtime.
- **Limitations:** Cannot include procedural logic (e.g., loops or conditions).

### Limitations:
- Cannot accept parameters.
- Typically read-only, unless certain conditions allow for updates.

### Example:
```sql
CREATE VIEW ActiveUsers AS
SELECT UserID, UserName, Email
FROM Users
WHERE IsActive = 1;
```
---

## 2. Function

A **Function** is a database object that performs a specific calculation or operation and returns a value. Functions are used for modular, reusable code.

### Key Characteristics:
- **Definition:** A precompiled set of SQL statements designed to return a single value (scalar function) or a table (table-valued function).
- **Data Manipulation:** Limited to read-only operations; it cannot modify database objects or data.
- **Usage:** Ideal for encapsulating calculations or logic that needs to be reused, such as formatting or aggregations.
- **Execution:** Can be called within a query, and the result integrates seamlessly with the query.
- **Limitations:** Cannot perform actions such as INSERT, UPDATE, or DELETE.

### Limitations:
- Cannot modify database state (read-only).
- Must return a value or table.

### Example:
```sql
CREATE FUNCTION GetTotalSales (@ProductID INT)
RETURNS DECIMAL(10,2)
AS
BEGIN
    DECLARE @TotalSales DECIMAL(10,2);
    SELECT @TotalSales = SUM(Amount) FROM Sales WHERE ProductID = @ProductID;
    RETURN @TotalSales;
END;

```
---

## 3. Stored Procedure

A **Stored Procedure** A Stored Procedure is a set of SQL statements and logic stored in the database. It is designed to perform a sequence of operations, including data manipulation and transaction control.

### Key Characteristics:
- **Definition:** A precompiled set of SQL statements and optional procedural code stored in the database.
- **Data Manipulation:** Can perform both read and write operations, including INSERT, UPDATE, DELETE, and transaction control.
- **Usage:** Often used for complex operations, batch processing, or enforcing business rules. It can also accept input parameters and return output parameters.
- **Execution:** Invoked explicitly by calling its name, often with parameters.
- **Flexibility:** Allows procedural logic, such as loops and conditions.
  
### Limitations:
- Cannot be embedded directly in SQL queries.
- Typically more resource-intensive than Views or Functions.
  
### Example:
```sql
CREATE PROCEDURE UpdateUserStatus
    @UserID INT,
    @IsActive BIT
AS
BEGIN
    UPDATE Users
    SET IsActive = @IsActive
    WHERE UserID = @UserID;
END;

```

## Key Differences

```plaintext
Feature             | View                            | Function                         | Stored Procedure
--------------------|---------------------------------|----------------------------------|-----------------------------------
Purpose             | Data presentation and abstraction | Reusable logic returning a value | Executing a sequence of operations
Data Manipulation   | Read-only                      | Read-only                        | Read and write
Execution           | Used in queries                | Called in queries                | Explicitly invoked
Output              | Virtual table                  | Scalar or table value            | No direct return (can use output parameters)
Procedural Logic    | Not allowed                    | Not allowed                      | Fully supported
Performance         | Dynamic execution at query time | Optimized for specific logic     | Optimized for procedural tasks
```

## Conclusion
Views, Functions, and Stored Procedures serve distinct roles in a database system. Views focus on presenting data, Functions encapsulate reusable logic, and Stored Procedures provide a framework for executing complex operations. Choosing the right tool depends on the specific requirements of the task, such as data retrieval, modularization, or operational complexity.
