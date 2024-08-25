*** Settings ***
Resource    ../../../../keywords/import.robot

*** Test Cases ***
TC1.1 APMC scan sorting : Sorting without scan Rcv for Module Only
    Scan Sorting    STS    TVRN0024000004
    1.7.11 R-Package Scan Screen - APMC Receive
    Common 2.1.4 Excel Download Screen    VW_SCAN_TRANS_HEADER_DETAIL_7D
    

TC1.2 APMC scan sorting : Sorting without scan Rcv for Box (Scan Module, auto Retreive Box)
    Scan Receive Box    STS    TVRN0024000004
    1.7.11 R-Package Scan Screen - APMC Receive
    Common 2.1.4 Excel Download Screen    VW_SCAN_TRANS_HEADER_DETAIL_7D
    

TC1.3 APMC scan sorting : Sorting without scan Rcv for Box with Del Dummy (Scan Module, auto Retreive Box)
    Scan Receive Box    STS    TVRN0024000004
    1.7.11 R-Package Scan Screen - APMC Receive
    Common 2.1.4 Excel Download Screen    VW_SCAN_TRANS_HEADER_DETAIL_7D
    

TC1.4 APMC scan sorting : Sorting with scan Rcv for Module Only
    Scan Receive    RCV    MOFU6813381    TVRN0024000004
    Scan Receive Box    STS    TVRN0024000004
    1.7.11 R-Package Scan Screen - APMC Receive
    Common 2.1.4 Excel Download Screen    VW_SCAN_TRANS_HEADER_DETAIL_7D
