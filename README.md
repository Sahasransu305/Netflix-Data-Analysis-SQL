# 📊 Netflix Data Analysis (SQL)

## 🚀 Overview  
This project analyzes a Netflix dataset using **MySQL** to uncover key business insights. The dataset contains information on movies, TV shows, directors, countries, genres, and ratings. The goal is to understand content trends, production patterns, and Netflix's content strategy.  

---

## 📂 Dataset Overview  
The dataset consists of multiple rows and columns covering Netflix's content library.  

### **Key Columns in the Dataset:**  
- **show_id** → Unique identifier for each content  
- **type** → Movie or TV Show  
- **title** → Name of the content  
- **director** → Director's name  
- **cast** → Actors featured in the content  
- **country** → Country of origin  
- **date_added** → Date content was added to Netflix  
- **release_year** → Year of release  
- **rating** → Content rating (e.g., PG, TV-MA, etc.)  
- **duration** → Length of movie (in minutes) or number of seasons  
- **listed_in** → Genre(s) of the content  

---

## 📊 Steps Involved in Analysis  

### **1️⃣ Data Cleaning & Preparation in Microsoft Excel**  
- Removed duplicate records.  
- Handled missing values by replacing or removing them.  
- Standardized column names for better readability.  
- Converted `date_added` to proper date format.  
- Extracted numeric values from `duration` for easier analysis.  

### **2️⃣ Data Exploration & Analysis (Using SQL)**  
The following SQL queries were used to derive business insights:  

#### ✅ **Total Number of Movies and TV Shows**  
```sql
SELECT type, COUNT(*) AS total_count  
FROM netflix_titles  
GROUP BY type;
```
📌 Insight: Shows how many Movies and TV Shows are available on Netflix.  

#### ✅ **Top 5 Countries Producing the Most Content**  
```sql
SELECT country, COUNT(*) AS content_count  
FROM netflix_titles  
WHERE country IS NOT NULL  
GROUP BY country  
ORDER BY content_count DESC  
LIMIT 5;
```
📌 Insight: Identifies the leading content-producing countries.  

#### ✅ **Trend of Content Additions Over the Years**  
```sql
SELECT YEAR(date_added) AS year, COUNT(*) AS total_added  
FROM netflix_titles  
WHERE date_added IS NOT NULL  
GROUP BY YEAR(date_added)  
ORDER BY year ASC;
```
📌 Insight: Helps track how Netflix has expanded its content library over time.  

#### ✅ **Most Common Ratings on Netflix**  
```sql
SELECT rating, COUNT(*) AS rating_count  
FROM netflix_titles  
WHERE rating IS NOT NULL  
GROUP BY rating  
ORDER BY rating_count DESC;
```
📌 Insight: Shows the distribution of content across different ratings.  

#### ✅ **Top 5 Most Popular Genres**  
```sql
SELECT listed_in AS genre, COUNT(*) AS total_count  
FROM netflix_titles  
GROUP BY listed_in  
ORDER BY total_count DESC  
LIMIT 5;
```
📌 Insight: Highlights the most preferred genres among Netflix content.  

#### ✅ **Average Duration of Movies on Netflix**  
```sql
SELECT AVG(duration) AS avg_movie_duration  
FROM netflix_titles  
WHERE type = 'Movie';
```
📌 Insight: Provides an idea of how long movies typically are.  

#### ✅ **Directors with the Most Content on Netflix**  
```sql
SELECT director, COUNT(*) AS total_content  
FROM netflix_titles  
WHERE director != 'Unknown'  
GROUP BY director  
ORDER BY total_content DESC  
LIMIT 5;
```
📌 Insight: Identifies the most frequently featured directors.  

#### ✅ **TV Shows with More Than 5 Seasons**  
```sql
SELECT title, duration  
FROM netflix_titles  
WHERE type = 'TV Show' AND duration > 5;
```
📌 Insight: Lists TV shows that have had extended seasons.  

#### ✅ **Year with the Highest Number of Content Additions**  
```sql
SELECT YEAR(date_added) AS year, COUNT(*) AS total_count  
FROM netflix_titles  
WHERE date_added IS NOT NULL  
GROUP BY YEAR(date_added)  
ORDER BY total_count DESC  
LIMIT 1;
```
📌 Insight: Shows which year had the most content added.  

#### ✅ **Movies Added in the Last 5 Years**  
```sql
SELECT title, date_added  
FROM netflix_titles  
WHERE type = 'Movie' AND date_added >= DATE_SUB(CURDATE(), INTERVAL 5 YEAR);
```
📌 Insight: Helps track recent additions to the Netflix library.  

---

## 📈 Key Insights & Business Impact  
📌 **Total Movies & TV Shows:** Provides a breakdown of content types.  
📌 **Top Content-Producing Countries:** Helps understand regional content trends.  
📌 **Content Addition Trends:** Shows Netflix’s growth over the years.  
📌 **Most Popular Genres:** Helps identify audience preferences.  
📌 **Highest Content Addition Year:** Shows peak content expansion periods.  
📌 **Movies with Longest Duration:** Useful for audience engagement analysis.  

These insights can help:  
✅ **Content Creators** identify trending genres and high-performing content.  
✅ **Marketing Teams** target promotions based on user preferences.  
✅ **Business Analysts** understand Netflix's global content strategy.  
✅ **Netflix Executives** make data-driven content acquisition decisions.  

---
