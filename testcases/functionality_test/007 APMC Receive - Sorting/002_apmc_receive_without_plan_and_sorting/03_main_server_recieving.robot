*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
TC01 Main Server Recieving : Receive Plant Data From Scan Sorting Without Scanned RCV For M, B

    1.7.10 Main Server Receiving Interface Upload & Validation Batch
    Common 2.1.4 Excel Download Screen    VW_STD_MOVEMENT
    1.3.6 R-Package Movement Updating Batch
    1.6.15 Transaction Raw Data Report
    1.3.12 Discrepancy Calculation Batch
    1.3.8 Inventory Updating Batch
    1.2.13 Average Leadtime Calculation Process
    1.6.21 Average Lead Time Report
    1.2.12 Forecasting Process Batch - Daily
    1.4.4.1 Daily Inventory Simulation Batch
    1.6.14 Aging Stock & Usage Raw Data Report
    1.6.20 Aging Stock Report
    1.6.19 Stock Visualization Report
    1.6.12 Stock Summary Report by status
    1.6.6 Stock IN OUT Report
    1.4.4.1 Daily Inventory Simulation Batch
    1.6.4 Daily Inventory Management Report
    

TC02 Main Server Recieving : Receive Plant Data From Scan Sorting With Scanned RCV For M, B

    1.7.10 Main Server Receiving Interface Upload & Validation Batch
    Common 2.1.4 Excel Download Screen    VW_STD_MOVEMENT
    1.3.6 R-Package Movement Updating Batch
    1.6.15 Transaction Raw Data Report
    1.3.12 Discrepancy Calculation Batch
    1.3.8 Inventory Updating Batch
    1.2.13 Average Leadtime Calculation Process
    1.6.21 Average Lead Time Report
    1.2.12 Forecasting Process Batch - Daily
    1.4.4.1 Daily Inventory Simulation Batch
    1.6.14 Aging Stock & Usage Raw Data Report
    1.6.20 Aging Stock Report
    1.6.19 Stock Visualization Report
    1.6.12 Stock Summary Report by status
    1.6.6 Stock IN OUT Report
    1.4.4.1 Daily Inventory Simulation Batch
    1.6.4 Daily Inventory Management Report
    
