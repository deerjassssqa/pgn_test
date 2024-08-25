*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser

*** Test Cases ***
S2 : RM+B, RM
    1.TMT ELB(Delivery)    ${data_excel.S2_TMTELBPACKING_DELIVERY_1[RM+B+RM]}
    4.TDEM TH WH(Receive)    ${data_excel.S2_TMATH-TH-WH_RECEIVE_4[RM]}
    1.3.6 R-Package Movement Updating Batch
    1.3.12 Discrepancy Calculation Batch
    