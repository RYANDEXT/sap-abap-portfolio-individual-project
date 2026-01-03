# Challenge 1: Sales Order Reporting (Header & Item Data)

## 📌 Project Overview
This project demonstrates the ability to manage and report relational data within SAP. It involves creating custom database tables for Sales Order Headers and Items, populating them, and generating a formatted report with discount logic and data aggregation.

## 🛠 Business Logic Criteria
* **Database Setup:** Created `ZCHAL1_H` (Header) and `ZCHAL1_I` (Item) tables with proper Primary Key (PK) relationships.
* **Data Retrieval:** Integrated data from multiple sources using `FOR ALL ENTRIES` and `INNER JOIN` to ensure optimal performance.
* **Discount Logic:** Applied a 10% discount for orders exceeding a specific total price threshold.
* **Calculations:** Real-time calculation of total price per item (Quantity * Price).
* **Output:** Generated a structured report using `WRITE` statements, including `SY-TABIX` for row numbering and total transaction summing.

## 💻 Technical Highlights
* **Keywords used:** `SELECT`, `INNER JOIN`, `FOR ALL ENTRIES`, `LOOP AT`, `sy-datum`, `sy-subrc`, `sy-tabix`.
* **Data Dictionary:** Defined custom Types (`TYPES`) and used specific SAP Data Elements for fields like `MEINS` (Unit), `NETPR` (Price), and `WAERS` (Currency).

## 📸 Output Preview
*(Recommendation: Insert a screenshot here of your SAP GUI WRITE report output)*
![Sales Order Report Output](path-to-your-screenshot.png)

## 📁 Files in this Folder
* `ZCHAL1_PRG.abap`: Main report source code.
* `Table_Structures.txt`: Definition of fields and data elements used in SE11.
