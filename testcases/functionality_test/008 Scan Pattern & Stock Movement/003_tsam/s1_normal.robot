*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser

*** Test Cases ***
S1.1 RM
    1.TMT ELB(Delivery)     ${data_excel.S1_1_TMTELBPACKING_DELIVERY_1[RM+BOX]}  
    2.TSAM(Receive)    ${data_excel.S1_1_TH_WH_RECEIVE_2[RM]}
    1.7.10 Main Server Receiving Interface Upload & Validation Batch
    

S1.2 RM+B, RM
    2.TSAM(Receive)    ${data_excel.S1_2_TSAM_RECEIVE_2[RM+B+RM]} 
    3.TSAM(Delivery)    ${data_excel.S1_2_TSAM_DELIVERY_3[RM+B+RM]}
    Log Monitor State
    
    
S1.3 RM+B, RM
    3.TSAM(Delivery)    ${data_excel.S1_3_TSAM_DELIVERY_3[RM+B+RM]}
    4.TDEM TH WH(Receive)    ${data_excel.S1_3_TSAM_RECEIVE_4[RM+B+RM]}
    Log Monitor State
    