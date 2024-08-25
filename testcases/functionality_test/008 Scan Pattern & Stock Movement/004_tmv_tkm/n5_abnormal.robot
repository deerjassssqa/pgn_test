*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser

*** Test Cases ***
N5 : RM+B, RM TMV
    2.TMV/TKM (Receive)    ${data_excel.N5_TMV_RECEIVE_2[RM+B+RM]}
    4.TMV/TKM (Delivery)    ${data_excel.N5_TMV_DLV_4[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    # 3 RM
    

N5 : RM+B, RM TKM
    2.TMV/TKM (Receive)    ${data_excel.N5_TKM_RECEIVE_2[RM+B+RM]}
    4.TMV/TKM (Delivery)    ${data_excel.N5_TKM_DLV_4[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    # 3 RM
    
