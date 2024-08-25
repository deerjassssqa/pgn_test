*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
I15 2,9 R-Package RM+B,RM
    common.Log In
    2 : RCV (KRW): การรับสินค้าที่ KRW จาก TMT ELB Packing    ${data_excel.I15__KRW_RCV_2[RM+B+RM]} 
    9 : RCV (STR): การรับสินค้าที่ STR จาก KRW    ${data_excel.I15__STR_RCV_9[RM+B+RM]}
    [Teardown]    Close Browser
