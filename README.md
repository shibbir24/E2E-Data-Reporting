# End-to-End Data Reporting Project

### Project Overview

This Azure-based project aims to simulate a real-world data reporting workflow from start to finish, utilizing Azure services for a comprehensive end-to-end solution.

![image](https://github.com/hannah0wang/end-to-end-data-reporting/assets/43276816/1a305141-ea20-467e-a200-936e29ca0068)

Workflow used in this project.


### Data Sources

This project uses the Adventure Works LT 2017 sample database provided by Microsoft.

### Tools

- Microsoft SQL Server Management Studio - On-premise database
- Azure Data Factory - Data Ingestion
- Azure Data Lake Gen2 - Data Storage
- Azure Databricks - Data Transformation
- Azure Synapse Analytics - Data Loading
- Power BI - Data Reporting
- Microsoft Entra ID (formerly known as Azure Active Directory) - Manage/Create Security Groups
- Azure Key Vault - Store and Access Secrets

### Workflow

- Data Ingestion: bridge connection with on-premise database by creating pipelines to copy data from on-prem database to Data Lake (raw data in bronze container). Also used to create pipelines to run the bronze to silver and silver to gold data transformations on a regular basis.
- Data Storage: store database as well as resulting levels of transformations in the bronze, silver, and gold containers. Parquet format is used to store data in the bronze container and Delta format in the silver and gold containers for version tracking.
- Data Transformation: mounting of the Data Lake through clusters, creating a mount point for accessing all data in the bronze container (original data). Data is then loaded into PySpark Dataframes for transformation. The bronze-to-silver transformation involves formatting all date columns to display only the date without the time component. the silver to gold transformation includes modifying all column names from pascal format (ColumnName) to snake case (Column_Name).
- Data Loading: create a new serverless SQL database and load the most recent and curated form of data that exists in the gold container as a form of views in the database. Create pipeline that dynamically creates the views for all tables.
- Data Reporting: connect to the serverless SQL database and fetch all the views that exist in the database to create the reports as an interactive dashboard.
- Security and Governance: utilized Key Vault for secure storage and management of sensitive information like authentication codes, storage account keys, and other confidential data. Use Microsoft Entra ID to create and manage security groups, which helps in organizing team members and controlling their access permissions within the Azure environment.

### Testing

Comprehensive end-to-end testing validated the functionality of the entire data processing pipeline, ensuring smooth integration, accurate data flow, and reliability at every stage, from data ingestion to transformation and deployment. The intentional addition of two rows to the SalesLT.Customer table in the on-premise SQL Server database (AdventureWorksLT2017) prompted Azure Data Factory pipelines to copy all data, including the new rows, to the bronze container in Azure Data Lake. Following this, Azure Databricks handled data retrieval from the bronze layer, executing two levels of transformation before placing the refined data into the silver and gold layers successively. The final transformed data from the gold layer was loaded into the Azure Synapse Analytics database. Upon completion, Power BI integrated seamlessly with Azure Synapse Analytics, displaying visuals that accurately reflected the new rows added to the source data. To ensure ongoing updates, a trigger was configured within the pipelines, running on a daily basis, mirroring real-time environments' common approach for scheduled daily pipeline execution.

<img width="593" alt="image" src="https://github.com/hannah0wang/end-to-end-data-reporting/assets/43276816/27ef5e61-4a1a-4b90-8e8e-c726c5e8f416">

Example interactive dashboard created in Power BI using data from integrated database from Synapse Analytics. According to the Key Performance Indicator (KPI) specifications, the visuals can be adjusted to highlight the most relevant information based on the context.

