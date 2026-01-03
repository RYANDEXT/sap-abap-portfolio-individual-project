# Challenge 2: Material Stock & Reorder Report

## 📌 Project Overview
This project simulates a warehouse management scenario where raw material data is processed, sanitized, and summarized for management review. It demonstrates proficiency in string manipulation, conditional logic, and data aggregation using the `COLLECT` statement.

## 🛠 Business Logic Criteria
* **Data Cleaning:** Utilized `CONDENSE` to remove irregular leading/trailing spaces in material names and `TRANSLATE` to standardize categories into uppercase.
* **Inventory Monitoring:** Developed logic to automatically flag materials for reordering by comparing `STOCK_QTY` against the `MIN_STOCK` threshold.
* **Data Aggregation:** Implemented a summary report using the `COLLECT` statement to calculate the total stock quantity per category across all warehouse items.

## 💻 Technical Highlights
* **Key Statements:** `SELECT`, `LOOP AT`, `CONDENSE`, `TRANSLATE`, `IF/ELSE`, `COLLECT`.
* **Internal Table Management:** Used a secondary internal table for aggregation purposes, ensuring a clean separation between detail and summary data.
* **Reporting:** Two-part report output showing both granular item details and high-level categorical summaries.

## 📸 Output Preview
<img width="1392" height="850" alt="Screenshot 2026-01-04 at 01 11 14" src="https://github.com/user-attachments/assets/df1ddc17-1b54-4128-8909-90e0a4cab596" />


## 📁 Files in this Folder
* `ZCHAL2_PRG.abap`: Main report source code.
* `Table_Structure.txt`: Technical definition of the `ZCHAL2_MATSTOCK` table.
