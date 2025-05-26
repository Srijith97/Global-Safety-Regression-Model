# Global Safety Regression Model

This project investigates how national-level socioeconomic indicators relate to homicide rates across countries. We use regression analysis and association testing to explore the influence of GDP, internet access, population growth, and more on public safety outcomes. The project applies rigorous statistical techniques to global data and interprets their real-world implications for policy and development.

---

## 🧑‍🏫 Course Info
- **Course**: STA 9750 – Tools for Data Analysis (Fall 2024)
- **Instructor**: Professor Chung Eun Lee
- **Team**: Group 11  
  - Saadullah (Intro, Conclusion, Proofreading)  
  - Taylor (VIF, Multicollinearity, Data Cleaning)  
  - Robert (Plots, Association Analysis)  
  - Saisrijith (Regression & Multi-regression)

---

## 📊 Dataset
- **Source**: [Kaggle Country-Level Dataset](https://www.kaggle.com/)
- **Observations**: 169 countries
- **Key Variables**:
  - `homicide_rate` (per 100,000 people)
  - `gdp`  
  - `gdp_per_capita`
  - `urban_population_growth`
  - `population_growth`
  - `internet_users`
  - `refugees`

---

## 🧼 Data Cleaning
- Removed rows with missing homicide rates
- Dropped duplicate countries
- Transformed key predictors (log(x + 1)) to address skewness
- Standardized data for multicollinearity checks

---

## 🔍 Exploratory Analysis
- **Visuals**: Scatter plots before and after transformations
- **Transformations**: Log applied where necessary to linearize relationships
- **Correlation**:
  - Significant negative correlation between log(homicide rate) and:
    - `log(GDP)`
    - `Internet Users`
    - `log(GDP per capita)`
  - No significant correlation with:
    - `Urban Population Growth`
    - `Population Growth`
    - `Refugees`

---

## 📈 Statistical Modeling

### ✅ Simple Linear Regression
| Model                           | R²     | p-value   | Insight                                 |
|--------------------------------|--------|-----------|-----------------------------------------|
| Homicide ~ GDP                 | 0.006  | 0.318     | Not significant                         |
| Homicide ~ Urban Pop Growth    | 0.0008 | 0.714     | Not significant                         |
| Homicide ~ Internet Users      | 0.029  | **0.027** | Significant negative relationship       |
| Homicide ~ GDP Per Capita      | 0.046  | **0.005** | Significant negative relationship       |
| Homicide ~ Refugees            | 0.01   | 0.205     | Not significant                         |

### ✅ ANOVA
- Only `Internet Users` showed statistical significance (p = 0.0279)

### ✅ Multivariate Regression
- All predictors: p > 0.05  
- **Conclusion**: No predictor has a strong independent effect when modeled together

---

## 🔁 Multicollinearity Check
- **VIF** values: All < 3.5 → acceptable
- **Condition Number**: 14.65 → no multicollinearity

---

## 🧠 Key Takeaways
- Internet usage, GDP, and GDP per capita show significant associations with lower homicide rates (after transformation).
- Other demographic variables (urban population growth, refugees, population growth) had weak or no associations.
- Multiple regression revealed that no predictor retained significance when considered jointly.
- Model improvement could be explored via interaction terms or non-linear approaches.

---

## 🧰 Tools Used
- **Language**: R  
- **Libraries**: `ggplot2`, `dplyr`, `car`
- **Techniques**: Linear regression, ANOVA, Pearson/Spearman correlation, log transformations, VIF diagnostics

---

## 📂 Files Included
- `country_data.csv` – Raw dataset
- `Full R code.Rmd` – Complete analysis in R
- `Report #1.docx` – Final project report
- `P1.pptx` – Summary presentation

---

## 🔚 Conclusion
This project demonstrates how socioeconomic variables can inform models of public safety. While simple regressions indicate significant relationships, multivariate results suggest the need for deeper modeling to uncover causal mechanisms behind homicide rates globally.

---

