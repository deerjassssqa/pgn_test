*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
I2.1 1,2 R-Package RM
    common.Log In
    1 : DLV (TMT ELB Packing): การส่งสินค้าออกจาก TMT ELB Packing ไปยัง KRW โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ TMT ELB Packing    ${data_excel.I2_1_TMTELBPACKING_DLV_1[RM]}
    2 : RCV (KRW): การรับสินค้าที่ KRW จาก TMT ELB Packing    ${data_excel.I2_1_KRW_RCV_2[RM]}
    Log Monitor State
    [Teardown]    Close Browser

I2.2 2,8 R-Package RM+B,RM
    common.Log In
    2 : RCV (KRW): การรับสินค้าที่ KRW จาก TMT ELB Packing    ${data_excel.I2_2_KRW_RCV_2[RM]}
    8 : DLV (KRW): การส่งสินค้าออกจาก KRW ไปยัง STR โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ KRW    ${data_excel.I2_2_KRW_DLV_8[RM]} 
    Log Monitor State
    [Teardown]    Close Browser

I2.3 8,9 R-Package RM+B,RM
    common.Log In
    8 : DLV (KRW): การส่งสินค้าออกจาก KRW ไปยัง STR โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ KRW    ${data_excel.I2_3_KRW_DLV_8[RM+B+RM]}
    9 : RCV (STR): การรับสินค้าที่ STR จาก KRW    ${data_excel.I2_3_KRW_RCV_9[RM+B+RM]}
    Log Monitor State
    [Teardown]    Close Browser

I2.4 9,6.3 R-Package RM
    common.Log In
    9 : RCV (STR): การรับสินค้าที่ STR จาก KRW    file
    6.3 : DLV (STR): การส่งสินค้าไปยัง TDEM TH WH โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ STR    ${data_excel.I2_4_STR_RCV_9[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    [Teardown]    Close Browser
    
I2.5 6.3,4.2 R-Package RM+B,RM
    common.Log In
    6.3 : DLV (STR): การส่งสินค้าไปยัง TDEM TH WH โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ STR    ${data_excel.I2_4_STR_DLV_6_3[RM+B+RM]}
    4.2 : RCV (STR): การรับสินค้าจาก APMC Exporter ไปยัง STR   ${data_excel.I2_5_STR_RCV_4_2[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    [Teardown]    Close Browser

I2.6 4.2,6.2 R-PackageRM
    common.Log In
    4.2 : RCV (STR): การรับสินค้าจาก APMC Exporter ไปยัง STR    ${data_excel.I2_6_STR_RCV_4_2[RM]}
    6.2 : DLV (STR): การส่งสินค้าไปยัง Domestic Part Supplier โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ STR    ${data_excel.I2_6_STR_DLV_6_2[RM]} 
    Log Monitor State
    [Teardown]    Close Browser

I2.7 6.2,13 R-Package RM
    common.Log In
    6.2 : DLV (STR): การส่งสินค้าไปยัง Domestic Part Supplier โดยมีการสแกนจุดส่งสินค้า (Scanning point) ที่ STR    ${data_excel.I2_7_STR_DLV_6_2[RM]}
    13 : RCV (APMC Importer): การรับสินค้าที่ APMC Importer จาก STR    ${data_excel.I2_7_STR_RCV_13[RM]}  
    Log Monitor State
    [Teardown]    Close Browser
