*** Settings ***
Resource    ../../../../../keywords/import.robot
Test Setup    Common.Login Polygon
Test Teardown    Close All Browsers

*** Test Cases ***
TC59 APMC TMMIN Receive (RM : Actual = Plan, B (Qty): Actual = Plan, B(Type) Actual <> Plan )
    Inventory Upload Interface And Check API Response APP ID    file    BDN93070
    STR Receive, Dummy    file
    Common 2.1.4 Excel Download Screen    VW_STD_MOVEMENT_TRANS
    1.7.10 Main Server Receiving Interface Upload & Validation Batch
    1.3.6 R-Package Movement Updating Batch
    1.3.12 Discrepancy Calculation Batch
    1.3.8 Inventory Updating Batch
    1.2.12 Forecasting Process Batch - Daily
    1.6.4 Daily Inventory Management Report
    Common 2.1.4 Excel Download Screen    VW_DISC_BOX