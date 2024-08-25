*** Settings ***
Resource    ../../../../keywords/import.robot
Test Setup  Common.Login Polygon
Test Teardown   Close Browser
*** Test Cases ***
I24 8,13 R-Package RM
    8 : DLV (KRW): Shipment from KRW to STR with scanning point at KRW    ${data_excel.I24__KRW_DLV_8[RM]}
    13 : RCV (APMC Importer): Receipt of goods at APMC Importer from STR    ${data_excel.I24__APMC_RCV_13[RM]}
    1.3.6 R-Package Movement Updating Batch
    