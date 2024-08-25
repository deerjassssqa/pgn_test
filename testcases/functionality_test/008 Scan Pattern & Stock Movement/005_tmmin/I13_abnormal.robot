*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
I13 1,13 R-Package RM+B,RM
    common.Log In
    1 : DLV (TMT ELB Packing): การส่งสินค้าออกจาก TMT ELB Packing ไปยัง KRW โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ TMT ELB Packing    ${data_excel.I13_TMTELBPACKING_DLV_1[RM]}
    13 : RCV (APMC Importer): การรับสินค้าที่ APMC Importer จาก STR   ${data_excel.I13_APMC_RCV_13[RM]}
    1.3.6 R-Package Movement Updating Batch
    [Teardown]    Close Browser
