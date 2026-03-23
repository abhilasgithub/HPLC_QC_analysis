<<<<<<< HEAD
# 👥 HR Attrition Analysis Dashboard

## Overview
A complete HR analytics project analyzing employee attrition patterns across departments, salary, job satisfaction, and demographics using Python, R, SQL, and JavaScript.

## Tech Stack
- **Python** — EDA, Visualization (Pandas, Matplotlib, Seaborn)
- **R** — Statistical Analysis (ggplot2, dplyr, tidyverse)
- **SQL** — Data querying and aggregation
- **JavaScript** — Interactive HTML dashboard (Chart.js)

## Project Structure
```
project2_hr_attrition/
├── data/
│   └── hr_data.csv             # HR employee dataset
├── sql/
│   └── hr_analysis.sql         # SQL queries for attrition analysis
├── python/
│   └── hr_eda.py               # Python EDA & visualization
├── r_analysis/
│   └── hr_attrition.R          # R statistical analysis
├── dashboard/
│   └── index.html              # Interactive JS dashboard
└── README.md
```

## Key Insights
- Overall Attrition Rate: 45%
- Sales department has highest attrition (71%)
- Employees working overtime are 3x more likely to leave
- Low job satisfaction (score 1) leads to 100% attrition
- Attrited employees earn 48% less than retained employees

## How to Run

### Python
```bash
cd python
pip install pandas matplotlib seaborn
python hr_eda.py
```

### R
```r
# Open in RStudio
source("r_analysis/hr_attrition.R")
```

### SQL
```bash
mysql -u root -p < sql/hr_analysis.sql
```

### Dashboard
```bash
open dashboard/index.html
```

## Skills Demonstrated
- HR Analytics & People Analytics
- Statistical Analysis in R
- Python Data Visualization
- SQL Aggregations
- Interactive Dashboard Design
=======
# HPLC Column QC Statistical Analysis
## Role Relevance: RiKi Global Data Analyst (Lifescience Focus)

### Objective
Perform statistical quality control analysis on HPLC column performance data,
detect batch failures, generate SPC charts, and flag columns failing USP specifications.

### Tools Used
- Python (pandas, scipy, numpy, matplotlib)
- Statistical Methods: Shewhart Control Charts, ANOVA, Cpk/Ppk analysis
- Excel dashboards

### Dataset
Simulated HPLC performance test data for columns from ACE, Hichrom, and Cogent brands.
Parameters: Plate count (N), Tailing factor (Tf), Resolution (Rs), Back pressure (psi).

### Key Insights Delivered
- Batch-level Cpk/Ppk performance indices
- SPC (Statistical Process Control) X-bar & R charts
- Out-of-Spec (OOS) detection with root cause flags
- Brand vs brand comparative performance report

### Files
- `data/hplc_qc_data.csv` — Raw column performance test data
- `qc_analysis.py` — Main QC statistical analysis
- `report/qc_report.xlsx` — Final QC report with charts
>>>>>>> ef9053e6383d8ae50c71debb8cc652269000f428
