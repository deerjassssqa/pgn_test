*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
S1 : RM+B, RM
    common.Log In
    1.TMT ELB(Delivery)    ${data_excel.S1_TMTELBPACKING_DELIVERY_1[RM+B+RM]}
    3.TSAM(Delivery)    ${data_excel.S1_TSAM_DELIVERY_3[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    [Teardown]    Close Browser
    