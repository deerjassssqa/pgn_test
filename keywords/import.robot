
*** Settings ***

# Library
Library    SeleniumLibrary
Library    RequestsLibrary
Library    OperatingSystem
Library    Process
Library    JSONLibrary
Library    Collections
Library    BuiltIn
Library    String
Library    custom_lib/capture_api.py
Library    DatabaseLibrary
Library    SSHLibrary

# Locators
Resource    ../resources/locators/apmc_receive_sorting_locator.robot
Resource    ../resources/locators/common_locator.robot
Resource    ../resources/testdata/excel/data_excel.robot

#Keyword
Resource    common.robot
Resource    api/common_api.robot
Resource    ../keywords/polygon/pages/apmc_receive_sorting_page.robot
Resource    ../keywords/polygon/features/apmc_receive_sorting_feature.robot
Resource    ../keywords/polygon/features/scan_pattern_stock_movement_feature.robot
Resource    ../keywords/database/db.robot