*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser
*** Test Cases ***
N1.3 : RM+B, RM
    3.TMV/TKM (Sorting)    ${data_excel.N3_TMTELBPACKING_DLV_1[ RM+B+RM]}
    4.TMV/TKM (Delivery)    ${data_excel.N3_TMV_DLV_4[RM+B+RM]}
    4.TMV/TKM (Delivery)    ${data_excel.N3_TKM_DLV_4[RM+B+RM]}
    Log Monitor State
    
