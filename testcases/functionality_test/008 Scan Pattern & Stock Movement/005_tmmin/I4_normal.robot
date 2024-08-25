*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
I4.1 10,4.1 R-Package RM
    common.Log In
    10 : DLV (APMC Exporter): การส่งสินค้าออกจาก APMC Exporter ไปยัง STR โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ APMC Exporter    ${data_excel.I4_1_APMC_DLV_10[RM]}
    4.1 : RCV (STR): การรับสินค้าที่ STR จาก KRW    ${data_excel.I4_1_STR_RCV_4_1[RM]}
    1.7.10 Main Server Receiving Interface Upload & Validation Batch
    [Teardown]    Close Browser

I4.2 4.1,5 R-Package RM+B,RM
    common.Log In
    4.1 : RCV (STR): การรับสินค้าที่ STR จาก KRW    ${data_excel.I4_2_STR_RCV_4_1[RM]}
    5 : Sort (STR): การคัดแยกสินค้าใน STR หลังจากรับสินค้า    ${data_excel.I4_2_STR_CHG_5[RM]}
    Log Monitor State
    [Teardown]    Close Browser

I4.3 5,6.3 R-Package RM
    common.Log In
    5 : Sort (STR): การคัดแยกสินค้าใน STR หลังจากรับสินค้า    ${data_excel.I4_3_STR_CHG_5[RM]} 
    6.1 : DLV (STR): การส่งสินค้าออกจาก STR ไปยัง APMC Importer โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ STR    ${data_excel.I4_3_STR_DLV_6_1[RM]}
    Log Monitor State
    [Teardown]    Close Browser
    
I4.4 6.3,4.2R-Package RM+B,RM
    common.Log In
    6.3 : DLV (STR): การส่งสินค้าไปยัง TDEM TH WH โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ STR    ${data_excel.I4_4_STR_DLV_6_3[RM]}
    4.2 : RCV (STR): การรับสินค้าจาก APMC Exporter ไปยัง STR    ${data_excel.I4_4_STR_RCV_4_2[RM]}
    1.3.6 R-Package Movement Updating Batch
    [Teardown]    Close Browser

I4.5 4.2,6.2R-Package RM
    common.Log In
    4.2 : RCV (STR): การรับสินค้าจาก APMC Exporter ไปยัง STR    ${data_excel.I4_5_STR_RCV_4_2[RM]}
    6.2 : DLV (STR): การส่งสินค้าไปยัง Domestic Part Supplier โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ STR    ${data_excel.I4_5_STR_DLV_6_2[RM]}
    Log Monitor State
    [Teardown]    Close Browser

I4.6 6.2,13 R-Package RM
    common.Log In
    6.2 : DLV (STR): การส่งสินค้าไปยัง Domestic Part Supplier โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ STR    ${data_excel.I4_6_STR_DLV_6_2[RM]}
    13 : RCV (APMC Importer): การรับสินค้าที่ APMC Importer จาก STR    ${data_excel.I4_6_TMATH_RCV_13[RM]}
    Log Monitor State
    [Teardown]    Close Browser
