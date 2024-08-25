*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
TC01 Plant Receive Data Deliver Module and Box
    [Tags]    receieve
    common.Log In
    1.7.11 R-Package Scan Screen - APMC Receive
    #Receive UMWT
    Upload File to PGN API    ${data_text.FQF3DN03_DELIVERYUMWT}
    Upload File And Check API Response APP ID    ${data_text.transpot_leadtime_umwt}
    Add Shipping Information Maintenance And Update Container API
    #Receive UMWT2
    Upload File to PGN API    ${data_text.FQF3DN03_DELIVERYUMWT2}
    Upload File And Check API Response APP ID    ${data_text.transpot_leadtime_umwt2}
    Add Shipping Information Maintenance And Update Container API
    #Receive TMP
    Upload File to PGN API    TMP
    Upload File And Check API Response APP ID    ${data_text.transpot_leadtime_tmp}
    Add Shipping Information Maintenance And Update Container API
    #Receive TMMIN
    Upload File to PGN API    TMMIN
    Upload File And Check API Response APP ID    TMMIN
    Add Shipping Information Maintenance And Update Container API
    #Receive KUOZUI
    Upload File to PGN API    KUOZUI
    Upload File And Check API Response APP ID    KUOZUI
    Add Shipping Information Maintenance And Update Container API
    1.7.7 Plant Server Receiving interface Upload & Validation Batch
    #Scan Receive Process
    APMC Scan Receive : Scan Receive Module only
    APMC Scan Receive : Scan Receive Box (Scan Module, auto Retreive Box)
    APMC Scan Receive : Scan Receive Box with DLV Dummy (Scan Module, auto Retreive Box)
    APMC Scan Receive : Scan Receive Box with different default destination (Muti Devan)
    # Execute Main Server Receive and Daily Inventory batch
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
    [Teardown]    Close Browser
