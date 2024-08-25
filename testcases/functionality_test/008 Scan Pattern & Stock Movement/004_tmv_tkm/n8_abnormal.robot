*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser

*** Test Cases ***
N8 : RM+B, RM TMV
    4.TMV/TKM (Delivery)    ${data_excelN8_TMV_DLV_4[RM]}
    # (Miss Scan DLV Box)
    5.TDEM TH WH (Receive)    ${data_excel.N8_TMV_RECEIVE_5[RM+B]}
    # (Scan Receive Box)
    1.3.6 R-Package Movement Updating Batch
    1.3.12 Discrepancy Calculation Batch
    # 4
    
N8 : RM+B, RM TKM
    4.TMV/TKM (Delivery)    ${data_excel.N8_TKM_DLV_4[RM]}
    # (Miss Scan DLV Box)
    5.TDEM TH WH (Receive)    ${data_excel.N8_TKM_RECEIVE_5[RM+B]}
    # (Scan Receive Box)
    1.3.6 R-Package Movement Updating Batch
    1.3.12 Discrepancy Calculation Batch
    # 4
    

