*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser
*** Test Cases ***
I4.1 10,4.1 R-Package RM
    10 : DLV (APMC Exporter): Export of goods from APMC Exporter to STR with scanning point at APMC Exporter    ${data_excel.I4_1_APMC_DLV_10[RM]}
    4.1 : RCV (STR): Receipt of goods at STR from KRW    ${data_excel.I4_1_STR_RCV_4_1[RM]}
    1.7.10 Main Server Receiving Interface Upload & Validation Batch
    

I4.2 4.1,5 R-Package RM+B,RM
    4.1 : RCV (STR): Receipt of goods at STR from KRW    ${data_excel.I4_2_STR_RCV_4_1[RM]}
    5 : Sort (STR): Sorting goods in STR after receiving them    ${data_excel.I4_2_STR_CHG_5[RM]}
    Log Monitor State
    

I4.3 5,6.3 R-Package RM
    5 : Sort (STR): Sorting goods in STR after receiving them    ${data_excel.I4_3_STR_CHG_5[RM]} 
    6.1 : DLV (STR): Delivery of goods from STR to APMC Importer with scanning of the delivery point (Scanning point) at STR    ${data_excel.I4_3_STR_DLV_6_1[RM]}
    Log Monitor State
    
    
I4.4 6.3,4.2R-Package RM+B,RM
    6.3 : DLV (STR): Delivery of goods to TDEM TH WH with scanning of the delivery point (Scanning point) at STR    ${data_excel.I4_4_STR_DLV_6_3[RM]}
    4.2 : RCV (STR): Receipt of Goods from APMC Exporter to STR    ${data_excel.I4_4_STR_RCV_4_2[RM]}
    1.3.6 R-Package Movement Updating Batch
    

I4.5 4.2,6.2R-Package RM
    4.2 : RCV (STR): Receipt of Goods from APMC Exporter to STR    ${data_excel.I4_5_STR_RCV_4_2[RM]}
    6.2 : DLV (STR): Delivery of goods to Domestic Part Supplier with scanning of delivery point (Scanning point) at STR    ${data_excel.I4_5_STR_DLV_6_2[RM]}
    Log Monitor State
    

I4.6 6.2,13 R-Package RM
    6.2 : DLV (STR): Delivery of goods to Domestic Part Supplier with scanning of delivery point (Scanning point) at STR    ${data_excel.I4_6_STR_DLV_6_2[RM]}
    13 : RCV (APMC Importer): Receipt of goods at APMC Importer from STR    ${data_excel.I4_6_TMATH_RCV_13[RM]}
    Log Monitor State
    
