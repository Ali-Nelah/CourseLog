# CourseLog Database Project

---

# Project Files

## 1. `tables.sql`
Contains the complete SQL script for:
- Creating the database tables
- Defining Primary Keys (PK)
- Defining Foreign Keys (FK)
- Adding constraints such as:
  - `NOT NULL`
  - `UNIQUE`
  - `CHECK`

This file is useful if someone wants to manually recreate the database structure.

---

## 2. `dump-CourseLog-....sql`
Full exported database dump generated from MySQL.

Includes:
- Database schema
- Tables
- Relationships
- Constraints
- Sample data records

This is the easiest file to import directly into MySQL Workbench or DBeaver.

---

## 3. `CourseLog.mwb`
MySQL Workbench model file.

Contains:
- EER Diagram
- Visual database design
- Relationships between tables

Can be opened directly using MySQL Workbench.

---

## 4. `er diagram.png`
Exported image version of the EER Diagram.

Useful for:
- Reports
- Presentations
- Documentation

---

## 5. `CourseLog System Definition.docx`
Contains:
- System overview
- Purpose of the system
- Main features
- Problems solved by the platform

---

## 6. `System Relationships.docx`
Contains:
- Entity relationships
- Relationship types
- Cardinalities (1:M, M:N, etc.)

---

## 7. `Queries.docx`
Contains:
- Basic SQL queries
- Advanced SQL queries
- Business questions related to each query

Demonstrates:
- Filtering
- Sorting
- Joins
- Aggregations
- Subqueries

---

# Recommended Import Method

## Using MySQL Workbench or DBeaver
Import:
```text
dump-CourseLog-....sql
```

This will automatically recreate:
- all tables
- relationships
- constraints
- sample records

without needing to run scripts manually.
