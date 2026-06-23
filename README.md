👥 HR Attrition Analytics Dashboard


An end-to-end HR Analytics project analyzing employee attrition patterns using Power BI and Excel — uncovering key drivers of employee turnover to support strategic workforce decisions.




📌 Project Overview :

Employee attrition is one of the most costly challenges faced by organizations. This project leverages HR data to identify why employees leave, who is most at risk, and
what factors influence retention — enabling HR teams and leadership to take data-driven action.

The dashboard was built using Power BI with an underlying dataset containing 1,470 employee records across departments like R&D, Sales, and HR, covering demographics, job roles, satisfaction scores, compensation, and work-life balance.


🎯 Objectives :


Analyze overall attrition rate across the organization
Identify departments, age groups, and job roles with highest attrition
Understand the impact of overtime, business travel, and job satisfaction on employee exit
Compare active vs. ex-employees across key dimensions
Deliver actionable insights via interactive Power BI dashboard



📊 Dataset Description :

File: HR_Data.xlsx

Records: 1,470 employees

Source: IBM HR Analytics (structured HR dataset)


Key Columns :

Column                                                     Description

Attrition                                   -              Whether the employee left (Yes/No),
CF_attrition label                          -             Current Employee / Ex-Employee,
Department                                  -              R&D, Sales, HR,
Job Role                                    -              Sales Executive, Research Scientist, Lab Technician, etc.,
Age / CF_age band                           -              Employee age and age group,
Gender                                      -              Male / Female,
Marital Status                              -              Single, Married, Divorced,
Monthly Income                              -              Employee monthly salary,
Job Satisfaction                            -              Rating 1–4,
Environment Satisfaction                    -              Rating 1–4,
Work Life Balance                           -              Rating 1–4,
Over Time                                   -              Yes / No,
Business Travel                             -              Non-Travel / Travel_Rarely / Travel_Frequently,
Years At Company                            -              Total tenure,
Distance From Home                          -              Commute distance,
Education                                   -              Associates / Bachelor's / Master's / PhD,
Education Field                             -              Life Sciences, Medical, Marketing, Technical Degree, etc.,
Performance Rating                          -              Employee performance score,
Stock Option Level                          -              0–3


🛠️ Tools & Technologies :

Tool                               Usage
Power BI        :               Dashboard creation & data visualization,
Power Query     :               Data transformation & cleaning,
Microsoft Excel :               Data exploration & pre-processing,
DAX             :               Calculated measures & KPIs,
Snowflake       :               Cloud Data Warehouse,
SQL             :               Writing Queries,
Tableau         :               Data Visualization

📈 Key KPIs & Measures :


Attrition Rate (%) — Total employees who left / Total employee count,
Active Employees Count — Current headcount,
Average Age — Mean age across workforce,
Average Monthly Income — Compensation analysis by role/department,
Attrition by Department — Department-wise turnover breakdown,
Attrition by Age Band — Identifies high-risk age groups,
Attrition by Job Role — Role-level exit patterns,
Attrition by Gender — Gender-based attrition comparison,
Overtime Impact — Attrition rate among employees working overtime vs. not,
Job Satisfaction vs. Attrition — Correlation between satisfaction scores and exit



📂 Project Structure :

HR-Attrition-Analytics/
│
├── HR_Data.xlsx                    # Raw dataset (1,470 employee records)
├── HR_Dashboard_project_powerbi.pbix  # Power BI dashboard file
└── README.md                       # Project documentation


🔍 Key Insights :


📉 Employees working overtime show significantly higher attrition rates
🚀 Sales Representatives and Laboratory Technicians have the highest role-level attrition
👤 Single employees and those in the 25–34 age band are most likely to leave
🏢 The Sales department records the highest attrition compared to R&D and HR
💰 Employees with lower monthly income and no stock options are more prone to exit
✈️ Frequent business travelers experience higher burnout and attrition



🖥️ Dashboard Preview :


Open HR_Dashboard_project_powerbi.pbix in Power BI Desktop to explore the interactive dashboard.



Dashboard includes :


Attrition Overview (KPI cards)
Department & Job Role Breakdown
Age Band & Gender Analysis
Satisfaction Score vs. Attrition Matrix
Overtime, Travel & Work-Life Balance Impact



🚀 How to Run :


Clone or download this repository
Open HR_Data.xlsx to explore the raw dataset
Open HR_Dashboard_project_powerbi.pbix in Power BI Desktop
Refresh the data source if prompted
Interact with slicers and filters to explore attrition patterns



👩‍💻 Author

A. Chandhana

B.Tech Computer Science (AI & ML) | Data Analyst Intern @ AI Variant

📧 LinkedIn : https://www.linkedin.com/in/arungolam-chandhana-71007a2bb/?skipRedirect=true   | 🐙 GitHub : https://github.com/Chandhana1234


📜 License

This project is for educational and portfolio purposes only.

Dataset sourced from IBM HR Analytics public dataset.
