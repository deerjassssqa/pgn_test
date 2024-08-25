*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser

*** Test Cases ***
I2.1 1,2 R-Package RM
    1 : DLV (TMT ELB Packing): Shipment is sent from TMT ELB Packing to KRW with scanning point at TMT ELB Packing    ${data_excel.I2_1_TMTELBPACKING_DLV_1[RM]}
    2 : RCV (KRW): Receipt of goods at KRW from TMT ELB Packing    ${data_excel.I2_1_KRW_RCV_2[RM]}
    Log Monitor State
    

I2.2 2,8 R-Package RM+B,RM
    2 : RCV (KRW): Receipt of goods at KRW from TMT ELB Packing    ${data_excel.I2_2_KRW_RCV_2[RM]}
    8 : DLV (KRW): Shipment from KRW to STR with scanning point at KRW    ${data_excel.I2_2_KRW_DLV_8[RM]} 
    Log Monitor State
    

I2.3 8,9 R-Package RM+B,RM
    8 : DLV (KRW): Shipment from KRW to STR with scanning point at KRW    ${data_excel.I2_3_KRW_DLV_8[RM+B+RM]}
    9 : RCV (STR): Receipt of goods at STR from KRW    ${data_excel.I2_3_KRW_RCV_9[RM+B+RM]}
    Log Monitor State
    

I2.4 9,6.3 R-Package RM
    9 : RCV (STR): Receipt of goods at STR from KRW    file
    6.3 : DLV (STR): Delivery of goods to TDEM TH WH with scanning of the delivery point (Scanning point) at STR    ${data_excel.I2_4_STR_RCV_9[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    
    
I2.5 6.3,4.2 R-Package RM+B,RM
    6.3 : DLV (STR): Delivery of goods to TDEM TH WH with scanning of the delivery point (Scanning point) at STR    ${data_excel.I2_4_STR_DLV_6_3[RM+B+RM]}
    4.2 : RCV (STR): Receipt of Goods from APMC Exporter to STR   ${data_excel.I2_5_STR_RCV_4_2[RM+B+RM]}
    1.3.6 R-Package Movement Updating Batch
    

I2.6 4.2,6.2 R-PackageRM
    4.2 : RCV (STR): Receipt of Goods from APMC Exporter to STR    ${data_excel.I2_6_STR_RCV_4_2[RM]}
    6.2 : DLV (STR): Delivery of goods to Domestic Part Supplier with scanning of delivery point (Scanning point) at STR    ${data_excel.I2_6_STR_DLV_6_2[RM]} 
    Log Monitor State
    

I2.7 6.2,13 R-Package RM
    6.2 : DLV (STR): Delivery of goods to Domestic Part Supplier with scanning of delivery point (Scanning point) at STR    ${data_excel.I2_7_STR_DLV_6_2[RM]}
    13 : RCV (APMC Importer): Receipt of goods at APMC Importer from STR    ${data_excel.I2_7_STR_RCV_13[RM]}  
    Log Monitor State
    
