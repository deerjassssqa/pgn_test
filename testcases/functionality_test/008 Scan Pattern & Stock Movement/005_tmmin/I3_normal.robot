*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
I3.1 10,4.1 R-Package RM
    common.Log In
    10 : DLV (APMC Exporter): การส่งสินค้าออกจาก APMC Exporter ไปยัง STR โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ APMC Exporter   ${data_excel.I3_1_APMC_DLV_10[RM]}
    4.1 : RCV (STR): การรับสินค้าที่ STR จาก KRW    ${data_excel.I3_1_STR_RCV_4_1[RM]}
    1.7.10 Main Server Receiving Interface Upload & Validation Batch
    [Teardown]    Close Browser

I3.2 4.1,5 R-Package RM+B,RM
    common.Log In
    4.1 : RCV (STR): การรับสินค้าที่ STR จาก KRW    ${data_excel.I3_2_STR_RCV_4_1[RM]}
    5 : Sort (STR): การคัดแยกสินค้าใน STR หลังจากรับสินค้า    ${data_excel.I3_2_STR_CHG_5[RM]}
    Log Monitor State
    [Teardown]    Close Browser

I3.3 5,6.1 R-Package RM+B,RM
    common.Log In
    5 : Sort (STR): การคัดแยกสินค้าใน STR หลังจากรับสินค้า    ${data_excel.I3_3_STR_CHG_5[RM+B+RM]}
    6.1 : DLV (STR): การส่งสินค้าออกจาก STR ไปยัง APMC Importer โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ STR    ${data_excel.I3_3_STR_DLV_6_1[RM+B+RM]} 
    [Teardown]    Close Browser

I3.4 6.1,7 R-Package RM+B,RM
    common.Log In
    6.1 : DLV (STR): การส่งสินค้าออกจาก STR ไปยัง APMC Importer โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ STR    ${data_excel.I3_3_STR_DLV_6_1[RM+B+RM]}
    7 : RCV (TDEM TH WH): การรับสินค้าที่ TDEM TH WH จาก STR    ${data_excel.I3_4_TMATH_RCV_7[RM+B+RM]}
    Log Monitor State
    [Teardown]    Close Browser
