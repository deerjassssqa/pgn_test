*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser

*** Test Cases ***
I3.1 10,4.1 R-Package RM
    10 : DLV (APMC Exporter): Export of goods from APMC Exporter to STR with scanning point at APMC Exporter   ${data_excel.I3_1_APMC_DLV_10[RM]}
    4.1 : RCV (STR): Receipt of goods at STR from KRW    ${data_excel.I3_1_STR_RCV_4_1[RM]}
    1.7.10 Main Server Receiving Interface Upload & Validation Batch
    

I3.2 4.1,5 R-Package RM+B,RM
    4.1 : RCV (STR): Receipt of goods at STR from KRW    ${data_excel.I3_2_STR_RCV_4_1[RM]}
    5 : Sort (STR): Sorting goods in STR after receiving them    ${data_excel.I3_2_STR_CHG_5[RM]}
    Log Monitor State
    

I3.3 5,6.1 R-Package RM+B,RM
    5 : Sort (STR): Sorting goods in STR after receiving them    ${data_excel.I3_3_STR_CHG_5[RM+B+RM]}
    6.1 : DLV (STR): Delivery of goods from STR to APMC Importer with scanning of the delivery point (Scanning point) at STR    ${data_excel.I3_3_STR_DLV_6_1[RM+B+RM]} 
    

I3.4 6.1,7 R-Package RM+B,RM
    6.1 : DLV (STR): Delivery of goods from STR to APMC Importer with scanning of the delivery point (Scanning point) at STR    ${data_excel.I3_3_STR_DLV_6_1[RM+B+RM]}
    7 : RCV (TDEM TH WH): Receipt of goods at TDEM TH WH from STR    ${data_excel.I3_4_TMATH_RCV_7[RM+B+RM]}
    Log Monitor State
    
