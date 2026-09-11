/* 
====================================================================
Script Purpose:
  - script ini digunakan untuk membuat data warehouse baru di SQL server
  - Untuk membuat database baru dari nol selalu pilih database master
  - Layer database terbagi menjadi 3 Schema: bronze layer, solver layer, dan gold layer
  - 
Warning:
  - 
*/


USE master
GO
  
CREATE DATABASE asep_warehouse
GO
  
USE asep_warehouse
GO
  
-- membuat schema sebagai folder
CREATE SCHEMA bronze;
GO
CREATE SCHEMA silver;
GO
CREATE SCHEMA gold:
GO
