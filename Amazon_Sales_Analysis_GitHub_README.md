# Amazon Sales Data Analysis | Python, SQL & Power BI

An end-to-end data analytics project exploring Amazon-style sales transactions using **Python (Pandas and NumPy)**, **MySQL**, and **Microsoft Power BI**. Prepared as a **BCA Semester 5** academic project at **Uttaranchal University**.

## Project overview

The project examines sales performance, product categories, brands, customers, geographic distribution, payment methods, order statuses, and monthly trends. The workflow covers data inspection and cleaning in Jupyter Notebook, SQL-based business analysis, and interactive reporting in Power BI.

> **Dataset note:** `Amazon.csv` is the provided project dataset; this repository does not establish that it is an official Amazon corporate dataset. Treat findings as pertaining to the supplied data only.

## Live Power BI dashboard

**[View the interactive Amazon Sales Analysis dashboard in Power BI](https://app.powerbi.com/view?r=eyJrIjoiNmVmZDg4N2MtZjVkYS00Y2ZhLWEwNjgtYzJmYzRhMGNkMjExIiwidCI6IjhmZDJmZGRkLWNjMTQtNDJkYy1hNThlLWRmYWUxNzI0ZjM0NCJ9)**

Explore the published interactive report online, including sales KPIs, category and product performance, geographic insights, and order trends. You can also open the `.pbix` file locally using Power BI Desktop.

## Tools and technologies

| Tool | Purpose |
|---|---|
| Python | Data preparation and exploratory analysis |
| Pandas & NumPy | Data manipulation, missing-value checks and aggregation |
| Matplotlib | Visual exploration |
| Jupyter Notebook | Reproducible Python workflow |
| MySQL | SQL queries and business questions |
| SQLAlchemy & PyMySQL | Loading cleaned data into MySQL |
| Power BI | Data modeling, DAX measures and interactive dashboards |

## Dataset

- **File:** `Amazon.csv`
- **Records:** 100,000
- **Columns:** 20
- **Order dates:** 2020-01-01 through 2024-12-29
- **Missing values in the supplied CSV:** None

Fields include `OrderID`, `OrderDate`, `CustomerID`, `CustomerName`, `ProductID`, `ProductName`, `Category`, `Brand`, `Quantity`, `UnitPrice`, `Discount`, `Tax`, `ShippingCost`, `TotalAmount`, `PaymentMethod`, `OrderStatus`, `City`, `State`, `Country`, and `SellerID`.

## Repository structure

```text
Amazon-Sales-Analysis/
├── Amazon.csv
├── Code.ipynb
├── Sql_code.sql
├── Amazon_Sales_Analysis_Dashboard.pbix
├── Project_Screenshots/
│   ├── P01_01_Dataset_Preview.PNG
│   ├── ...
│   └── PBI_13_Order_Fulfillment_Analysis.PNG
├── BCA Sysnopsis Guidelines.pdf
└── README.md
```

If screenshots are supplied as `Project_Screenshots.zip`, extract them into `Project_Screenshots/` before committing to GitHub.

## Workflow

1. **Import and inspect:** Load the CSV with Pandas; review shape, data types, missing values and duplicates.
2. **Clean and validate:** Check categories, payment methods and country names; convert order dates; validate transaction fields. The notebook also includes logic to fill missing `TotalAmount` values when needed.
3. **Explore:** Analyze category, payment, brand, product, customer, country, state and city performance; calculate monthly sales trends.
4. **Query in SQL:** Load the data into a MySQL `Orders` table and run queries for sales, order counts, quantity, discounts, taxes, shipping costs, repeat customers and month-over-month growth.
5. **Visualize in Power BI:** Use DAX measures, a date table, relationships, KPI cards, charts and slicers to build an interactive report.

## Questions explored

- Which categories, brands and products contribute the most sales?
- How do sales and order counts vary by month and location?
- How do payment methods and order statuses compare?
- Which customers contribute the highest sales, and who orders repeatedly?
- How do discounts, tax and shipping costs vary across categories?
- What is the month-over-month sales growth rate?

## Getting started

### 1. Clone the repository

```bash
git clone https://github.com/saroj-sutar/Amazon-Sales-Analysis.git
cd Amazon-Sales-Analysis
```

GitHub username: [`saroj-sutar`](https://github.com/saroj-sutar).

### 2. Set up Python

```bash
python -m venv .venv
# Windows:
.venv\Scripts\activate
# macOS/Linux:
# source .venv/bin/activate
pip install pandas numpy matplotlib jupyter sqlalchemy pymysql
jupyter notebook Code.ipynb
```

Run notebook cells in order. The notebook reads `Amazon.csv` from its working directory and contains a CSV export step, so keep a backup of the original file.

### 3. Run SQL analysis

Install MySQL and open `Sql_code.sql` in MySQL Workbench or another compatible SQL client. The script starts with:

```sql
CREATE DATABASE sales_analysis_db;
USE sales_analysis_db;
```

**Important:** The SQL script expects a populated table named `Orders`; creating the database alone does not create or import the table. Use the notebook's SQLAlchemy/MySQL export step or import the CSV into an appropriately typed `Orders` table before executing the analytical queries. Configure your own local database credentials securely; do not commit passwords.

### 4. Open the dashboard

Open `Amazon_Sales_Analysis_Dashboard.pbix` using Power BI Desktop. If its data source points to a different local path, update the data-source settings and refresh. The dashboard includes executive KPIs, category and product analysis, geographic analysis, order fulfillment and interactive slicers.

## Screenshots

The `Project_Screenshots/` directory contains evidence of the data-inspection, cleaning, Python analysis, SQL analysis and Power BI dashboard stages. Examples:

![Dataset preview](Project_Screenshots/P01_01_Dataset_Preview.PNG)

![Monthly sales trend](Project_Screenshots/P04_08_Monthly_Sales_Trend.PNG)

![Power BI executive overview](Project_Screenshots/PBI_08_Executive_Overview_KPIs.PNG)

![Power BI category analysis](Project_Screenshots/PBI_11_Product_Category_Analysis.PNG)

## Limitations and future scope

- Results describe the supplied transaction dataset, not independently verified Amazon business performance.
- Dashboard refresh may require local file-path and database configuration.
- Future work could include automated data refresh, predictive forecasting, customer segmentation and additional data-quality tests.

## Academic information

**Program:** Bachelor of Computer Applications (BCA), Semester V  
**University:** Uttaranchal University, Dehradun  
**GitHub profile:** [saroj-sutar](https://github.com/saroj-sutar)  
**Student name:** *To be added*  
**Learner ID:** *To be added*  
**Project guide:** *To be added*

## License and attribution

Dataset provenance and redistribution rights should be verified before publishing the CSV publicly. No open-source license is implied for the dataset or other uploaded materials.
