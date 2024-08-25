*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
I24 8,13 R-Package RM
    common.Log In
    8 : DLV (KRW): การส่งสินค้าออกจาก KRW ไปยัง STR โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ KRW    ${data_excel.I24__KRW_DLV_8[RM]}
    13 : RCV (APMC Importer): การรับสินค้าที่ APMC Importer จาก STR    ${data_excel.I24__APMC_RCV_13[RM]}
    1.3.6 R-Package Movement Updating Batch
    [Teardown]    Close Browser