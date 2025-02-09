# **Tech Layoffs Dashboard (2020-2024)**  

## **Overview**  
This repository contains an interactive Tableau dashboard that analyzes global tech layoffs from 2020 to 2024. The project focuses on identifying trends in workforce reductions across industries, companies, and countries. By leveraging SQL for data cleaning and preprocessing and Tableau for visualization, this dashboard provides insights into the scale and impact of layoffs in the technology sector.  

**Live Dashboard:** [Tech Layoffs Dashboard on Tableau Public](https://public.tableau.com/app/profile/abhirup.chattaraj/viz/TechLayoffs_2020-2024/Dashboard1)  

## **Data and Methodology**  

### **Dataset**  
The dataset consists of layoff records from multiple companies in the technology sector between 2020 and 2024. It includes:  
- **Company Information:** Name, headquarters location, industry, and business stage  
- **Layoff Details:** Number of employees laid off, percentage of workforce affected  
- **Company Size:** Workforce before and after layoffs  
- **Financial Data:** Money raised by the company  
- **Geographical Information:** Country, state, region, and continent  
- **Time-Series Data:** Layoff dates and the corresponding year  

### **Data Cleaning and Preprocessing**  
The raw dataset contained missing values, duplicates, and inconsistencies, which were addressed using SQL queries.  
- **Missing values** in key fields such as company size before/after layoffs were handled through imputation techniques.  
- **Data standardization** was performed for country and industry names to maintain consistency.  
- **Outliers** were examined to ensure accurate reporting of layoff figures.  
- **Date formats** were corrected for proper time-series analysis.  

## **Dashboard Overview**  

### **Key Visualizations**  
The dashboard consists of four primary charts that provide insights into different aspects of tech layoffs:  

1. **Layoffs by Country Over Time (2020-2024)**  
   - A **map visualization** that displays layoffs across various countries each year.  
   - Helps in understanding geographical patterns and identifying the most affected regions.  

2. **Top 10 Affected Industries by Year**  
   - A **bar chart** ranking industries by the number of layoffs.  
   - Provides insights into which sectors experienced the most workforce reductions each year.  

3. **Companies with the Most Layoffs (Top 5 Yearly)**  
   - A **horizontal bar chart** showing the top five companies with the highest layoffs each year.  
   - Allows comparison of layoff trends among major companies over time.  

4. **Layoff Trends Over Time (Month-by-Month Analysis)**  
   - A **line chart** showing monthly layoff trends from 2020 to 2024.  
   - Highlights peak layoff periods and potential correlations with economic downturns or industry-specific challenges.  

### **Interactivity and Filters**  
The dashboard includes interactive filters that allow users to:  
- Select a **specific year** to analyze trends dynamically.  
- Filter layoffs by **industry, company, or country** for a focused view.  
- Compare layoffs across different **regions and business stages** to assess broader impacts.  

## **Technologies Used**  
- **SQL:** Data cleaning, preprocessing, and exploratory data analysis.  
- **Tableau:** Data visualization and interactive dashboard creation.  
- **CSV Dataset:** Raw data storage and processing.  

## **Key Insights**  
- **The highest layoffs occurred in the technology sector, with certain industries disproportionately affected each year.**  
- **Some companies repeatedly appeared in the top layoffs list, indicating recurring workforce reductions.**  
- **Layoffs showed clear geographical patterns, with North America and specific regions being impacted more than others.**  
- **Layoff trends varied by year, correlating with global economic conditions and company-specific challenges.**  

## **Usage Instructions**  
1. Access the dashboard via the **Tableau Public link** provided above.  
2. Use interactive filters to explore layoffs **by year, country, industry, and company**.  
3. Analyze workforce trends and industry-wide impacts for data-driven decision-making.  

## **Contributions and Feedback**  
Contributions are welcome to enhance the dataset or improve the dashboard features. For any feedback, feel free to reach out.  

## **License**  
This project is for educational and analytical purposes. The dataset used is publicly available and has been processed for visualization.  
