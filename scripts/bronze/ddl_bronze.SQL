/*
===============================================================================================================
DDL Script: Create Bronze Tables
===============================================================================================================
Script Purpose: 
    Script ini digunakan untuk membuat tables di bronze layer, menimpa data lama (no version history) SDC1, 
===============================================================================================================

*/


-- LOAD data ke database dengan BULK LOADING

-- Data 01
TRUNCATE TABLE bronze_crm_cust_info;   -- pastikan table kosong dulu sebelum loading
BULK INSERT bronze_crm_cust_info
FROM 'C:\Users\Omen\OneDrive - Bank Indonesia\00. Edhec Campus\Edhec\00. External Training\SQL bootcamp by Bara\sql-data-warehouse-project\datasets\source_crm\cust_info.csv'
WITH (
	FIRSTROW = 2,			-- skip first row karena isinya nama kolom
	FIELDTERMINATOR = ',',	-- delimiter
	TABLOCK					-- spec loadingnya
);

-- Data 02
TRUNCATE TABLE bronze_crm_prd_info;
BULK INSERT bronze_crm_prd_info 
FROM 'C:\Users\Omen\OneDrive - Bank Indonesia\00. Edhec Campus\Edhec\00. External Training\SQL bootcamp by Bara\sql-data-warehouse-project\datasets\source_crm\prd_info.csv'
WITH (
	FIRSTROW = 2,			-- skip first row karena isinya nama kolom
	FIELDTERMINATOR = ',',	-- delimiter
	TABLOCK					-- spec loadingnya
);

-- Data 03
TRUNCATE TABLE bronze_crm_sales_details;
BULK INSERT bronze_crm_sales_details 
FROM 'C:\Users\Omen\OneDrive - Bank Indonesia\00. Edhec Campus\Edhec\00. External Training\SQL bootcamp by Bara\sql-data-warehouse-project\datasets\source_crm\sales_details.csv'
WITH (
	FIRSTROW = 2,			-- skip first row karena isinya nama kolom
	FIELDTERMINATOR = ',',	-- delimiter
	TABLOCK					-- spec loadingnya
);

-- Data 04
TRUNCATE TABLE bronze_erp_CUST_AZ12;
BULK INSERT bronze_erp_CUST_AZ12 
FROM 'C:\Users\Omen\OneDrive - Bank Indonesia\00. Edhec Campus\Edhec\00. External Training\SQL bootcamp by Bara\sql-data-warehouse-project\datasets\source_erp\CUST_AZ12.csv'
WITH (
	FIRSTROW = 2,			-- skip first row karena isinya nama kolom
	FIELDTERMINATOR = ',',	-- delimiter
	TABLOCK					-- spec loadingnya
);

-- Data 05
TRUNCATE TABLE bronze_erp_LOC_A101;
BULK INSERT bronze_erp_LOC_A101 
FROM 'C:\Users\Omen\OneDrive - Bank Indonesia\00. Edhec Campus\Edhec\00. External Training\SQL bootcamp by Bara\sql-data-warehouse-project\datasets\source_erp\LOC_A101.csv'
WITH (
	FIRSTROW = 2,			-- skip first row karena isinya nama kolom
	FIELDTERMINATOR = ',',	-- delimiter
	TABLOCK					-- spec loadingnya
);

-- Data 06
TRUNCATE TABLE bronze_erp_PX_CAT_G1V2;
BULK INSERT bronze_erp_PX_CAT_G1V2 
FROM 'C:\Users\Omen\OneDrive - Bank Indonesia\00. Edhec Campus\Edhec\00. External Training\SQL bootcamp by Bara\sql-data-warehouse-project\datasets\source_erp\PX_CAT_G1V2.csv'
WITH (
	FIRSTROW = 2,			-- skip first row karena isinya nama kolom
	FIELDTERMINATOR = ',',	-- delimiter
	TABLOCK					-- spec loadingnya
);
