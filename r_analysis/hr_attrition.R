# ============================================
# HR Attrition Analysis - R Script
# Project: Employee Attrition Dashboard
# Tech Stack: R, ggplot2, dplyr, tidyr
# ============================================

# Install packages if needed
# install.packages(c("tidyverse", "ggplot2", "dplyr", "corrplot"))

library(tidyverse)
library(ggplot2)
library(dplyr)
library(corrplot)

# ─── Load Data ───────────────────────────────────────────────
df <- read.csv("../data/hr_data.csv")
df$attrition_flag <- ifelse(df$attrition == "Yes", 1, 0)

cat("=== HR Dataset Overview ===\n")
cat("Rows:", nrow(df), "| Cols:", ncol(df), "\n")
cat("Attrition Rate:", round(mean(df$attrition_flag)*100, 1), "%\n")

# ─── 1. Attrition by Department ──────────────────────────────
dept_attr <- df %>%
  group_by(department) %>%
  summarise(attrition_rate = mean(attrition_flag) * 100) %>%
  arrange(desc(attrition_rate))

p1 <- ggplot(dept_attr, aes(x = reorder(department, attrition_rate),
                              y = attrition_rate, fill = attrition_rate)) +
  geom_bar(stat = "identity", width = 0.6, show.legend = FALSE) +
  coord_flip() +
  scale_fill_gradient(low = "#f9c784", high = "#c0392b") +
  geom_text(aes(label = paste0(round(attrition_rate, 1), "%")),
            hjust = -0.2, size = 4) +
  labs(title = "Attrition Rate by Department",
       x = "Department", y = "Attrition Rate (%)") +
  theme_minimal(base_size = 13) +
  ylim(0, max(dept_attr$attrition_rate) * 1.2)

ggsave("../dashboard/r_dept_attrition.png", p1, width = 8, height = 5, dpi = 150)
cat("Saved: r_dept_attrition.png\n")

# ─── 2. Age Distribution by Attrition ───────────────────────
p2 <- ggplot(df, aes(x = age, fill = attrition)) +
  geom_histogram(binwidth = 3, position = "dodge", alpha = 0.85) +
  scale_fill_manual(values = c("No" = "#2ecc71", "Yes" = "#e74c3c")) +
  labs(title = "Age Distribution by Attrition",
       x = "Age", y = "Count", fill = "Attrition") +
  theme_minimal(base_size = 13)

ggsave("../dashboard/r_age_distribution.png", p2, width = 9, height = 5, dpi = 150)
cat("Saved: r_age_distribution.png\n")

# ─── 3. Income vs Years at Company ──────────────────────────
p3 <- ggplot(df, aes(x = years_at_company, y = monthly_income,
                      color = attrition)) +
  geom_point(size = 3, alpha = 0.8) +
  geom_smooth(method = "lm", se = FALSE) +
  scale_color_manual(values = c("No" = "#2980b9", "Yes" = "#e74c3c")) +
  labs(title = "Monthly Income vs Years at Company",
       x = "Years at Company", y = "Monthly Income (₹)", color = "Attrition") +
  theme_minimal(base_size = 13)

ggsave("../dashboard/r_income_scatter.png", p3, width = 9, height = 5, dpi = 150)
cat("Saved: r_income_scatter.png\n")

# ─── 4. Summary Stats ────────────────────────────────────────
cat("\n=== Attrition Summary by Department ===\n")
print(dept_attr)

cat("\n=== Avg Income by Attrition ===\n")
df %>%
  group_by(attrition) %>%
  summarise(avg_income = mean(monthly_income),
            avg_age = mean(age),
            avg_tenure = mean(years_at_company)) %>%
  print()
