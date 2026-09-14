/*
================================================================================================================
Script Name: Stored Procedue Loading Bronze Layer
================================================================================================================
Script Purpose: 
  - Script ini digunakan untuk loading data ke bronze layer dengan menggunakan truncated data (no preserving historical data / SDC1)
  - loading duration, dan 
  - evaluasi error message
================================================================================================================
*/


CREATE OR ALTER PROCEDURE bronze_load_bronze AS
BEGIN
	DECLARE @start_time DATETIME, @end_time DATETIME, @batch_start_time DATETIME, @batch_end_time DATETIME;	-- buat variable 
	BEGIN TRY
		PRINT 'LOAD bronze layer data ke database dengan BULK LOADING'
		PRINT '========================================'
		PRINT 'Loading CRM Table'
		PRINT '========================================'

		-- Data 01
		SET @batch_start_time = GETDATE();
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze_crm_cust_info'
		TRUNCATE TABLE bronze_crm_cust_info;   -- pastikan table kosong dulu sebelum loading
		PRINT '>> Inserting Table: bronze_crm_cust_info'
		BULK INSERT bronze_crm_cust_info
		FROM 'C:\Users\Omen\OneDrive - Bank Indonesia\00. Edhec Campus\Edhec\00. External Training\SQL bootcamp by Bara\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
		WITH (
			FIRSTROW = 2,			-- skip first row karena isinya nama kolom
			FIELDTERMINATOR = ',',	-- delimiter
			TABLOCK					-- spec loadingnya
		);
		SET @end_time = GETDATE();
		PRINT '>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'second';
		PRINT '--------------'
		PRINT''

		-- Data 02
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze_crm_prd_info'
		TRUNCATE TABLE bronze_crm_prd_info;
		PRINT '>> Inserting Table: bronze_crm_prd_info'
		BULK INSERT bronze_crm_prd_info 
		FROM 'C:\Users\Omen\OneDrive - Bank Indonesia\00. Edhec Campus\Edhec\00. External Training\SQL bootcamp by Bara\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
		WITH (
			FIRSTROW = 2,			-- skip first row karena isinya nama kolom
			FIELDTERMINATOR = ',',	-- delimiter
			TABLOCK					-- spec loadingnya
		);
		SET @end_time = GETDATE();
		PRINT '>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'second';
		PRINT '--------------'
		PRINT ''


		-- Data 03
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze_crm_sales_details'
		TRUNCATE TABLE bronze_crm_sales_details;
		PRINT '>> Inserting Table: bronze_crm_sales_details'
		BULK INSERT bronze_crm_sales_details 
		FROM 'C:\Users\Omen\OneDrive - Bank Indonesia\00. Edhec Campus\Edhec\00. External Training\SQL bootcamp by Bara\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
		WITH (
			FIRSTROW = 2,			-- skip first row karena isinya nama kolom
			FIELDTERMINATOR = ',',	-- delimiter
			TABLOCK					-- spec loadingnya
		);
		SET @end_time = GETDATE();
		PRINT '>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'second';
		PRINT '--------------'
		PRINT ''

		PRINT '========================================'
		PRINT 'Loading ERP Table'

		-- Data 04
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze_erp_CUST_AZ12'
		TRUNCATE TABLE bronze_erp_CUST_AZ12;
		PRINT '>> Inserting Table: bronze_erp_CUST_AZ12'
		BULK INSERT bronze_erp_CUST_AZ12 
		FROM 'C:\Users\Omen\OneDrive - Bank Indonesia\00. Edhec Campus\Edhec\00. External Training\SQL bootcamp by Bara\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
		WITH (
			FIRSTROW = 2,			-- skip first row karena isinya nama kolom
			FIELDTERMINATOR = ',',	-- delimiter
			TABLOCK					-- spec loadingnya
		);
		SET @end_time = GETDATE();
		PRINT '>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'second';
		PRINT '--------------'
		PRINT ''


		-- Data 05
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze_erp_LOC_A101'
		TRUNCATE TABLE bronze_erp_LOC_A101;
		PRINT '>> Inserting Table: bronze_erp_LOC_A101'
		BULK INSERT bronze_erp_LOC_A101 
		FROM 'C:\Users\Omen\OneDrive - Bank Indonesia\00. Edhec Campus\Edhec\00. External Training\SQL bootcamp by Bara\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
		WITH (
			FIRSTROW = 2,			-- skip first row karena isinya nama kolom
			FIELDTERMINATOR = ',',	-- delimiter
			TABLOCK					-- spec loadingnya
		);
		SET @end_time = GETDATE();
		PRINT '>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'second';
		PRINT '--------------'
		PRINT ''


		-- Data 06
		SET @start_time = GETDATE();
		PRINT '>> Truncating Table: bronze_erp_PX_CAT_G1V2'
		TRUNCATE TABLE bronze_erp_PX_CAT_G1V2;
		PRINT '>> Inserting Table: bronze_erp_PX_CAT_G1V2'
		BULK INSERT bronze_erp_PX_CAT_G1V2 
		FROM 'C:\Users\Omen\OneDrive - Bank Indonesia\00. Edhec Campus\Edhec\00. External Training\SQL bootcamp by Bara\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
		WITH (
			FIRSTROW = 2,			-- skip first row karena isinya nama kolom
			FIELDTERMINATOR = ',',	-- delimiter
			TABLOCK					-- spec loadingnya
		);
		SET @end_time = GETDATE();
		PRINT '>> Load duration: ' + CAST(DATEDIFF(second, @start_time, @end_time) AS NVARCHAR) + 'second';
		SET @batch_end_time = GETDATE();

		PRINT '========================================'
		PRINT 'Loading Bronze Layer is Completed'
		PRINT '>> Load duration: ' + CAST(DATEDIFF(second, @batch_start_time, @batch_end_time) AS NVARCHAR) + 'second';
		PRINT '========================================'


	END TRY
	BEGIN CATCH
		PRINT ''
		PRINT ''
		PRINT '========================================'
		PRINT 'ERROR OCCURED DURING LOADING BRONZE LAYER'
		PRINT 'Error Message' + ERROR_MESSAGE();
		PRINT 'Error Message' + CAST (ERROR_NUMBER() AS NVARCHAR);
		PRINT 'Error Message' + CAST (ERROR_STATE() AS NVARCHAR);
		PRINT '========================================'
	END CATCH

END

GO
--EXECUTE stored procedure
EXEC bronze_load_bronze
