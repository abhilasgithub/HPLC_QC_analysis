"""
HR Attrition Analysis - Python EDA
Project: Employee Attrition Dashboard
Tech Stack: Python, Pandas, Matplotlib, Seaborn
"""

import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import warnings
warnings.filterwarnings('ignore')

sns.set_theme(style='whitegrid')

# ─── Load Data ───────────────────────────────────────────────
df = pd.read_csv('../data/hr_data.csv')
df['attrition_flag'] = df['attrition'].map({'Yes': 1, 'No': 0})

print("=== HR Dataset Overview ===")
print(df.shape)
print(df['attrition'].value_counts())
print(f"\nAttrition Rate: {df['attrition_flag'].mean()*100:.1f}%")

# ─── 1. Attrition by Department ──────────────────────────────
dept = df.groupby('department')['attrition_flag'].mean().sort_values(ascending=False) * 100

plt.figure(figsize=(9, 5))
bars = sns.barplot(x=dept.index, y=dept.values, palette='Reds_r')
plt.title('Attrition Rate by Department', fontsize=16, fontweight='bold')
plt.ylabel('Attrition Rate (%)')
plt.xlabel('Department')
for i, v in enumerate(dept.values):
    plt.text(i, v + 0.5, f'{v:.1f}%', ha='center', fontsize=11)
plt.tight_layout()
plt.savefig('../dashboard/dept_attrition.png', dpi=150)
plt.close()
print("Saved: dept_attrition.png")

# ─── 2. Overtime vs Attrition ────────────────────────────────
ot = df.groupby('overtime')['attrition_flag'].mean() * 100

plt.figure(figsize=(7, 5))
ot.plot(kind='bar', color=['#2ecc71','#e74c3c'], edgecolor='white', width=0.5)
plt.title('Attrition Rate: Overtime vs No Overtime', fontsize=15, fontweight='bold')
plt.ylabel('Attrition Rate (%)')
plt.xlabel('Overtime')
plt.xticks(rotation=0)
plt.tight_layout()
plt.savefig('../dashboard/overtime_attrition.png', dpi=150)
plt.close()
print("Saved: overtime_attrition.png")

# ─── 3. Income Distribution ──────────────────────────────────
plt.figure(figsize=(9, 5))
sns.boxplot(data=df, x='attrition', y='monthly_income',
            palette={'Yes': '#e74c3c', 'No': '#2ecc71'})
plt.title('Monthly Income: Attrited vs Retained', fontsize=15, fontweight='bold')
plt.ylabel('Monthly Income (₹)')
plt.tight_layout()
plt.savefig('../dashboard/income_attrition.png', dpi=150)
plt.close()
print("Saved: income_attrition.png")

# ─── 4. Job Satisfaction Heatmap ─────────────────────────────
pivot = df.pivot_table(values='attrition_flag', index='department',
                       columns='job_satisfaction', aggfunc='mean') * 100

plt.figure(figsize=(10, 6))
sns.heatmap(pivot, annot=True, fmt='.0f', cmap='YlOrRd',
            linewidths=0.5, cbar_kws={'label': 'Attrition Rate (%)'})
plt.title('Attrition Rate by Department & Job Satisfaction', fontsize=14, fontweight='bold')
plt.xlabel('Job Satisfaction (1=Low, 4=High)')
plt.tight_layout()
plt.savefig('../dashboard/satisfaction_heatmap.png', dpi=150)
plt.close()
print("Saved: satisfaction_heatmap.png")

# ─── Summary Report ──────────────────────────────────────────
print("\n=== HR Attrition Summary ===")
print(f"Total Employees   : {len(df)}")
print(f"Overall Attrition : {df['attrition_flag'].mean()*100:.1f}%")
print(f"Highest Dept Risk : {dept.idxmax()} ({dept.max():.1f}%)")
print(f"Avg Income (Left) : ₹{df[df.attrition=='Yes']['monthly_income'].mean():,.0f}")
print(f"Avg Income (Stay) : ₹{df[df.attrition=='No']['monthly_income'].mean():,.0f}")
