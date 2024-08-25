*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
I26 9,13 R-Package RM
    common.Log In
    9 : RCV (STR): การรับสินค้าที่ STR จาก KRW    ${data_excel.I26__STR_RCV_9[RM]} 
    13 : RCV (APMC Importer): การรับสินค้าที่ APMC Importer จาก STR    ${data_excel.I26_APMC_RCV_13[RM]}
    1.3.6 R-Package Movement Updating Batch
    [Teardown]    Close Browser