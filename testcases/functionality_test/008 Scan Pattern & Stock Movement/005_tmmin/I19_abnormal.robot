*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
I19 2,6.3 R-Package RM
    common.Log In
    2 : RCV (KRW): การรับสินค้าที่ KRW จาก TMT ELB Packing    ${data_excel.I19__KRW_RCV_2[RM]} 
    6.3 : DLV (STR): การส่งสินค้าไปยัง TDEM TH WH โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ STR    ${data_excel.I19__STR_DLV_6_3[RM]}
    1.3.6 R-Package Movement Updating Batch
    [Teardown]    Close Browser    
