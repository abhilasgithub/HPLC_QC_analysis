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
