*** Settings ***
Resource    ../../../keywords/import.robot

*** Keywords ***
Select Exporter Code
    [Documentation]    This keyword is used to select the Exporter Code = TMATH
    Click Myelement    ${DATA_TESTID_EX_CODE}
    Scroll Element Into View    ${ex.CSS_ADD_BUTTON}
    Click Myelement    ${ex.CSS_ADD_BUTTON}


Select Importer Company
    [Documentation]    This keyword is used to select the Importer Company = Example Company
    Click Myelement    ${DATA_TESTID_IMP_COMPANY}
    Scroll Element Into View    ${im.CSS_ADD_BUTTON}
    Click Myelement    ${im.CSS_ADD_BUTTON}

Input ETD
    [Documentation]    This keyword is used to input the ETD = 23/02/2024
    Click Myelement    ${DATA_TESTID_ETD}
    Input Text    ${DATA_TESTID_ETD_INPUT}    23/02/2024

Select Loading Port
    [Documentation]    This keyword is used to select the Loading Port = Example Loading Port
    Click Myelement    ${DATA_TESTID_LOADING_PORT_COMBOBOX}
    Scroll Element Into View    css=.MuiMenuItem-root:nth-child(2)
    Click Myelement    css=.MuiMenuItem-root:nth-child(2)

Click Generate Report Button And Check Downloaded File
    Wait Until Element Is Visible  id=generate-reports  10s
    Execute JavaScript  document.getElementById("generate-reports").click();
    Wait For Downloaded File  ${DOWNLOAD_PATH}  ${EXPECTED_FILE_PREFIX}  ${EXPECTED_FILE_EXTENSION}  60s
    [Teardown]  Close Browser

Wait For Downloaded File
    [Arguments]  ${download_path}  ${file_prefix}  ${file_extension}  ${timeout}
    ${end_time}=  Set Variable  ${timeout}
    ${current_time}=  Set Variable  0
    WHILE  ${current_time} < ${end_time}
        ${files}=  List Files In Directory  ${download_path}
        ${matching_files}=  Create List
        FOR  ${file}  IN  @{files}
            Run Keyword If  '${file}'.startswith('${file_prefix}') and '${file}'.endswith('${file_extension}')  Append To List  ${matching_files}  ${file}
        END
        Run Keyword And Return If  ${matching_files}  Log  Matching file found: ${matching_files[0]}
        Sleep  1s
        ${current_time}=  Evaluate  ${current_time} + 1
    END
    Fail  No file starting with '${file_prefix}' and ending with '${file_extension}' found in directory '${download_path}' within timeout of ${timeout} seconds.

1.7.10 Main Server Receiving Interface Upload & Validation Batch    
    [Documentation]    Step 1
    # 1.เลือกเมนู Common >> Monitoring >> On Demand Batch Screen
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    On Demand Batch Screen
    # 2.*Project Code: DN97
    Click Myelement    ${DATA_TESTID_PROJECT_CODE}
    Click Option Dropdown    DN97
    # 3.Batch Name: Main Server Interface File Generation Batch >> Click Search
    Click Myelement    xpath=//*[@data-testid='input-batch-name']
    Click Option Dropdown    Main Server Interface File Generation Batch
    Click Search Button
    # 4.Click Checkbox 
    Click Check Box
    # 5.Click Excute >> ข้อความแสดงว่า Success และมีเลข App Id แสดง
    Click Myelement  id=btn-execute
    Click Myelement    id=button-confirm-ok
    Sleep    3s
    # รับค่า App ID จาก Alert Message และเก็บไว้ในตัวแปร process_app_id
    Check Alert Messages and Extract IDs
    # 6.เลือกเมนู Common >> Monitoring >> Log Monitoring Summary Screen
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    # 7.App ID :XXXXXX >>Click Search
    Click Myelement  xpath=//div[@data-testid='select_moduleId']
    Click Option Dropdown    DN97
    Click Myelement  xpath=//div[@data-testid='select_function']
    Click Option Dropdown    BDN97070
    Click Myelement    id=select_status
    Click Option Dropdown    I
    # Input Text    id=input_appId    ${process_app_id}
    Sleep    3s
    Click Myelement    id=btn_search
    Sleep    2s
    # 8.Click Status :  Success
    # 9.Status = End >> Massage Standard Movement Updating Interface Upload & Validation End successfully
    # Verify Table Row Values    ${process_app_id}  DN97-Handheld  BDN97070-Plant Server Receiving Interface Upload & Validation  31/07/2024  31/07/2024  auto  Success  Standard Movement Updating Interface Upload & Validation End successfully
    Click Myelement  xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Table Success    Standard Movement Updating Interface Upload & Validation End successfully

Check Alert Messages and Extract IDs
    # ดึงข้อความจากการแจ้งเตือนแรก
    Wait Until Element Is Visible  xpath=(//div[contains(@class,'MuiAlert-message')])[1]  10s
    ${message1}=  Get Text  xpath=(//div[contains(@class,'MuiAlert-message')])[1]
    ${match}=  Evaluate  re.search(r"Batch ID '(.+)'", """${message1}""")  re
    Run Keyword If  ${match}  Set Global Variable  ${process_batch_id}  ${match.group(1)}
    
    # ตรวจสอบว่า message1 เป็นข้อความข้อผิดพลาดหรือไม่
    Run Keyword If  "${message1}" == "ERR_BAD_RESPONSE: Cannot read properties of undefined (reading 'filename')"  Log  "Error encountered: ${message1}"  ELSE  Continue With Message2

Continue With Message2
    Wait Until Element Is Visible  xpath=(//div[contains(@class,'MuiAlert-message')])[2]  10s
    ${message2}=  Get Text  xpath=(//div[contains(@class,'MuiAlert-message')])[2]
    ${process_app_id}=  Set Variable  ${message2}
    Log  ${message2}
    Set Global Variable  ${process_app_id}

Verify Table Row Values
    [Arguments]  ${EXPECTED_APP_ID}  ${EXPECTED_MODULE_NAME}  ${EXPECTED_FUNCTION_NAME}  ${EXPECTED_START_DATE}  ${EXPECTED_END_DATE}  ${EXPECTED_USER_ID}  ${EXPECTED_STATUS}  ${EXPECTED_MESSAGE}
    # ดึงค่าจากทุก field ในแถวของตาราง
    ${app_id}=  Get Text  xpath=//div[@data-field='appId']/div[@class='MuiDataGrid-cellContent']
    ${module_name}=  Get Text  xpath=//div[@data-field='moduleName']
    ${function_name}=  Get Text  xpath=//div[@data-field='functionName']/div[@class='MuiDataGrid-cellContent']
    ${start_date}=  Get Text  xpath=//div[@data-field='startDate']
    ${end_date}=  Get Text  xpath=//div[@data-field='endDate']
    ${user_id}=  Get Text  xpath=//div[@data-field='userId']/div[@class='MuiDataGrid-cellContent']
    ${status}=  Get Text  xpath=//div[@data-field='status']/span
    ${message}=  Get Text  xpath=//div[@data-field='message']/div[@class='MuiDataGrid-cellContent']
    
    # เช็คผลลัพธ์ที่คาดหวัง
    Should Be Equal As Strings  ${app_id}  ${EXPECTED_APP_ID}
    Should Be Equal As Strings  ${module_name}  ${EXPECTED_MODULE_NAME}
    Should Be Equal As Strings  ${function_name}  ${EXPECTED_FUNCTION_NAME}
    Should Be Equal As Strings  ${start_date}  ${EXPECTED_START_DATE}
    Should Be Equal As Strings  ${end_date}  ${EXPECTED_END_DATE}
    Should Be Equal As Strings  ${user_id}  ${EXPECTED_USER_ID}
    Should Be Equal As Strings  ${status}  ${EXPECTED_STATUS}
    Should Be Equal As Strings  ${message}  ${EXPECTED_MESSAGE}

Verify Table Success
    [Arguments]    ${message_success}
    # รอให้ตารางปรากฏ
    Wait Until Element Is Visible  xpath=//div[@id='ele_table']  10s
    # ตรวจสอบค่าในแต่ละฟิลด์ของแถวแรก
    # ${date}=  Get Text  xpath=(//div[@role='row'])[2]//div[@data-field='date']//div[@role='presentation']
    # Should Be Equal As Strings  ${date}  31/07/2024 20:03:41

    ${status}=  Get Text  xpath=(//div[@role='row'])[2]//div[@data-field='status']//div[@role='presentation']
    Should Be Equal As Strings  ${status}  END

    ${user_id}=  Get Text  xpath=(//div[@role='row'])[2]//div[@data-field='userId']//div[@role='presentation']
    Should Be Equal As Strings  ${user_id}  auto

    ${level}=  Get Text  xpath=(//div[@role='row'])[2]//div[@data-field='levelId']//div[@role='presentation']
    Should Be Equal As Strings  ${level}  Info

    ${message}=  Get Text  xpath=(//div[@role='row'])[2]//div[@data-field='message']//div[@role='presentation']
    Should Be Equal As Strings  ${message}  ${message_success}

Verify Status Success In Table
    [Arguments]    ${message_success}
    # รอให้ตารางปรากฏ
    Wait Until Element Is Visible  xpath=//div[@id='ele_table']  10s
    ${message}=  Get Text  xpath=(//div[@role='row'])[2]//div[@data-field='message']//div[@role='presentation']
    Should Be Equal As Strings  ${message}  ${message_success}


1.3.6 R-Package Movement Updating Batch
    [Documentation]    Step 2.1
    # 1.เลือกเมนู Common >> Monitoring >> On Demand Batch Screen
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    On Demand Batch Screen
    # 2.*Project Code: DN93
    Click Myelement    ${DATA_TESTID_PROJECT_CODE}
    Click Option Dropdown    DN93
    # 3.Batch Name: 1.3.6 R-Package Movement Updating Batch >> Click Search
    Click Myelement    xpath=//*[@data-testid='input-batch-name']
    Click Option Dropdown    R-Package Movement Updating
    Click Search Button
    # 4.Click Checkbox
    Click Check Box
    # 5.Click Excute
    Click Myelement  id=btn-execute
    Click Myelement    id=button-confirm-ok
    Sleep    3s
    Check Alert Messages and Extract IDs
    # 6.เลือกเมนู Common >> Monitoring >> Log Monitoring Summary Screen
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    # 7.App ID :XXXXXX >>Click Search
    Click Myelement  xpath=//div[@data-testid='select_moduleId']
    Click Option Dropdown    DN93
    Click Myelement  xpath=//div[@data-testid='select_function']
    Click Option Dropdown    BDN93080
    Click Myelement    id=select_status
    Click Option Dropdown    I
    # Input Text    id="input_appId"    ${process_app_id}
    Sleep    3s
    Click Myelement    id=btn_search
    # 8.Click Status :  Success
    # 9.Status = End >> Massage Standard Movement Updating Interface Upload & Validation End successfully
    # Verify Table Row Values    ${process_app_id}  DN97-Handheld  BDN97070-Plant Server Receiving Interface Upload & Validation  31/07/2024  31/07/2024  auto  Success  Standard Movement Updating Interface Upload & Validation End successfully
    # Click Myelement  xpath=//div[@data-field='status']//span[text()='Success']
    # Switch Window    New
    # Verify Table Success    R-Package Movement Updating End successfully


1.6.15 Transaction Raw Data Report
    [Documentation]    Step 2.2
    #1.เลือกเมนู Report >> Transaction Raw Data Report
    Click Myelement    ${RP_MENU}
    Click Menu    Transaction Raw Data Report
    # >> Transaction Raw Data Report : 22/02/2024
    Input Text    id=input-transaction-date-from    22/02/2024
    # 2.Click Generate Report >>
    Click Myelement    id=generate-reports
    # Massage Show : ODB Excel posted with Document No: D240200427
    Wait Until Element Is Visible  xpath=//div[contains(@class,'MuiAlert-message')]  10s
    # ดึงข้อความจากข้อความแจ้งเตือน
    ${message} =  Get Text  xpath=//div[contains(@class,'MuiAlert-message')]
    Log  Message: ${message}

    # ตรวจสอบว่า message มีข้อความที่คาดหวัง
    Should Contain  ${message}  ODB Excel posted with Document No:

    # ใช้ re.search หา Document No
    ${match} =  Evaluate  re.search(r"ODB Excel posted with Document No: (\w+)", """${message}""")  re
    Run Keyword If  ${match}  Set Global Variable  ${document_no}  ${match.group(1)}
    Run Keyword If  not ${match}  Log  "No document number found in the message."
    Log  Document No: ${document_no}
    # 3.Check Document No: D240200427 >> 
    # Common >> Monitoring >> On Demand Excel Download Monitoring Screen
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    On Demand Excel Download Monitoring
    # *Request Date: 22/02/2024 >> Click Search >> เพิ่มฟิวเสิด >> Report Status : Download
    Click Myelement    id=input-request-date
    Input Text    id=input-request-date    22/02/2024
    Click Myelement    id=btn-search
    # ตรวจสอบว่า Document No ที่เราเก็บไว้ ตรงกับที่แสดงในตารางหรือไม่

1.3.12 Discrepancy Calculation Batch
    [Documentation]    Step 3
    # 1.เลือกเมนู Common >> Monitoring >> On Demand Batch Screen
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    On Demand Batch Screen
    # 2.*Project Code: DN93
    Click Myelement    ${DATA_TESTID_PROJECT_CODE}
    Click Option Dropdown    DN93
    # 3.Batch Name: Discrepancy Calculation Batch  >> Click Search
    Click Myelement    xpath=//*[@data-testid='input-batch-name']
    Click Option Dropdown    Discrepancy Calculation Batch
    Click Search Button
    # 4.Click Checkbox 
    Click Check Box
    # 5.Click Excute
    Click Myelement  id=btn-execute
    Click Myelement    id=button-confirm-ok
    Sleep    3s
    # 6.เลือกเมนู Common >> Monitoring >> Log Monitoring Summary Screen
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    # 7.App ID :XXXXXX >>Click Search
    Click Myelement  xpath=//div[@data-testid='select_moduleId']
    Click Option Dropdown    DN93
    Click Myelement  xpath=//div[@data-testid='select_function']
    Click Option Dropdown    BDN93090
    Click Myelement    id=select_status
    Click Option Dropdown    I
    # Input Text    id="input_appId"    ${process_app_id}
    Sleep    3s
    Click Myelement    id=btn_search
    # 8.Click Status :  Success
    # 9.Status = End >> Massage Discrepancy Calculation  End successfully
    # Verify Table Row Values    ${process_app_id}  DN93-Inventory  BDN93090-R-Package Warehouse Allocation Calculation  31/07/2024  31/07/2024  auto  Success  Discrepancy Calculation End Successfully
    # Click Myelement  xpath=//div[@data-field='status']//span[text()='Success']
    # Switch Window    New
    # Verify Table Success    Discrepancy Calculation End Successfully


1.3.8 Inventory Updating Batch
    [Documentation]    Step 4
    # 1.เลือกเมนู Common >> Monitoring >> On Demand Batch Screen
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    On Demand Batch Screen
    # 2.*Project Code: DN93
    Click Myelement    ${DATA_TESTID_PROJECT_CODE}
    Click Option Dropdown    DN93
    # 3.Batch Name: Inventory Updating Batch >> Click Search
    Click Myelement    xpath=//*[@data-testid='input-batch-name']
    Click Option Dropdown    Inventory Updating
    Click Search Button
    # 4.Click Checkbox
    Click Check Box
    # 5.Click Excute
    Click Myelement  id=btn-execute
    Click Myelement    id=button-confirm-ok
    Sleep    3s
    # 6.เลือกเมนู Common >> Monitoring >> Log Monitoring Summary Screen
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    # 7.App ID :XXXXXX >>Click Search
    Click Myelement  xpath=//div[@data-testid='select_moduleId']
    Click Option Dropdown    DN93
    Click Myelement  xpath=//div[@data-testid='select_function']
    Click Option Dropdown    BDN93070
    Click Myelement    id=select_status
    Click Option Dropdown    I
    # Input Text    id="input_appId"    ${process_app_id}
    Sleep    3s
    Click Myelement    id=btn_search
    # 8.Click Status :  Success
    # 9.Status = End >> Massage Inventory Updating End successfully
    # Verify Table Row Values    ${process_app_id}  DN93-Inventory  BDN93090-R-Package Warehouse Allocation Calculation  31/07/2024  31/07/2024  auto  Success  Discrepancy Calculation End Successfully
    # Click Myelement  xpath=//div[@data-field='status']//span[text()='Success']
    # Switch Window    New
    # Verify Table Success    Discrepancy Calculation End Successfully

1.2.13 Average Leadtime Calculation Process
    [Documentation]    Step 5.1
    # 1.เลือกเมนู Common >> Monitoring >> On Demand Batch Screen
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    On Demand Batch Screen
    # 2.*Project Code: DN92
    Click Myelement    ${DATA_TESTID_PROJECT_CODE}
    Click Option Dropdown    DN92
    # 3.Batch Name: verage Leadtime Calculation Process Batch>> Click Search
    Click Myelement    xpath=//*[@data-testid='input-batch-name']
    Click Option Dropdown    Average Leadtime Calculation Process Batch
    Click Search Button
    # 4.Click Checkbox 
    Click Check Box
    # 5.Click Excute
    Click Myelement  id=btn-execute
    Click Myelement    id=button-confirm-ok
    Sleep    3s
    # 6.เลือกเมนู Common >> Monitoring >> Log Monitoring Summary Screen
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Log Monitoring Summary Screen
    # 7.App ID :XXXXXX >>Click Search
    Click Myelement  xpath=//div[@data-testid='select_moduleId']
    Click Option Dropdown    DN92
    Click Myelement  xpath=//div[@data-testid='select_function']
    Click Option Dropdown    BDN92010
    Click Myelement    id=select_status
    Click Option Dropdown    I
    Input Text    id="input_appId"    ${process_app_id}
    Sleep    3s
    Click Myelement    id=btn_search
    # 8.Click Status :  Success
    # 9.Status = End >> Massage Inventory Updating  End successfully
    Verify Table Row Values    ${process_app_id}  DN92-Inventory  BDN92010-Average Leadtime Calculation Process  31/07/2024  31/07/2024  auto  Success  Average Leadtime Calculation Process End Successfully
    Click Myelement  xpath=//div[@data-field='status']//span[text()='Success']
    Switch Window    New
    Verify Table Success    Average Leadtime Calculation Process End Successfully

1.6.21 Average Lead Time Report
    [Documentation]    Step 5.2
    Click Myelement    ${RP_MENU}
    Click Myelement    ${ARTR_MENU}
    Click Myelement    ${DATA_TESTID_SELECT_REPORT_BASIS}
    Click Myelement    ${DATA_TESTID_SELECT_REPORT_BASIS_MOUNTHLY}
    Click Myelement    ${DATA_TESTID_SELECT_LOCATION_TYPE}
    Click Myelement    ${DATA_TESTID_SELECT_ROUTE_POINT}
    Click Myelement    ${DATA_TESTID_SELECT_LOCATION_GROUP}
    Click Myelement    ${DATA_TESTID_SELECT_TMV}
    Click Myelement    ${ID_PERIOD_FROM}
    Input Text    ${ID_PERIOD_FROM}    22/02/2024
    Click Myelement    ${ID_PERIOD_TO}
    Input Text    ${ID_PERIOD_TO}    23/02/2024
    Scroll Element Into View    ${DATA_TESTID_GEN_REPORT}
    Click Generate Report Button And Check Downloaded File

1.2.12 Forecasting Process Batch - Daily
    [Documentation]    Step 6.1
    Log    message

1.4.4.1 Daily Inventory Simulation Batch
    [Documentation]    Step 6.2
    Log    message

1.6.14 Aging Stock & Usage Raw Data Report
    [Documentation]    Step 7
    Click Myelement    ${RP_MENU}
    Click Menu    Aging Stock & UsageRaw Data Report
    Click Myelement    ${DATA_TESTID_SELECT_RPACKAGE_OWNER}
    Click Myelement    ${DROPDOWN_OPTION_TMATH}
    Click Elements And Scroll
    Execute JavaScript  document.getElementById("generate-reports").click();
    Wait Until Element Is Visible  ${LOADING_INDICATOR}  10s
    Wait Until Element Is Not Visible  ${LOADING_INDICATOR}  60s
    Verify Message    ODB Excel posted with Document No: XXXX
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    On Demand Excel Download Monitoring

1.6.20 Aging Stock Report
    [Documentation]    Step 8
    Click Myelement    ${RP_MENU}
    Click Menu    Aging Stock Report
    Click Myelement    ${SELECT_LOCATION}
    Scroll Element Into View    css=.MuiButtonBase-root:nth-child(1533)
    Click Myelement    css=.MuiButtonBase-root:nth-child(1533)
    Execute JavaScript  document.getElementById("generate-reports").click();
    Wait Until Element Is Visible  ${LOADING_INDICATOR}  10s
    Wait Until Element Is Not Visible  ${LOADING_INDICATOR}  60s

1.6.19 Stock Visualization Report
    [Documentation]    Step 9
    # 1.เลือกเมนู Report >> Click Aging Stock Report
    Click Myelement    ${RP_MENU}
    Click Menu    Aging Stock Report
    # 2. * Date(From) : 01/12/2023
    # Click Myelement    ${DATA_TESTID_DATE_FROM}
    # Input Text    ${DATA_TESTID_DATE_FROM}    01/12/2023
    # 3. Click Generate
    Click Myelement    id=generate-reports
    
1.6.12 Stock Summary Report by status
    [Documentation]    Step 10
    # 1.เลือกเมนู Report >>  Stock Summary Report by status
    Click Myelement    ${RP_MENU}
    Click Menu    Stock Summary Report by status
    # 2. *R-Package Owner : TMATH
    Click Myelement    ${DATA_TESTID_SELECT_RPACKAGE_OWNER}
    Click Myelement    ${DROPDOWN_OPTION_TMATH}
    # 3. Click Generate
    Click Myelement    id=generate-reports

1.6.6 Stock IN OUT Report
    [Documentation]    Step 11
    # 1.เลือกเมนู Report >>  Stock IN OUT Report
    Click Myelement    ${RP_MENU}
    Click Menu    Stock IN OUT Report
    # 2.*R-Package Owner : TMATH 
    Click Myelement    ${DATA_TESTID_SELECT_RPACKAGE_OWNER}
    Click Myelement    ${DROPDOWN_OPTION_TMATH}
    # 3.*Month (From) : 02/2024
    # 4. *Month (To) : 03/2024
    # 5. Click Generate 
    Click Myelement    id=generate-reports

1.6.4 Daily Inventory Management Report
    [Documentation]    Step 12
    # 1.เลือกเมนู Report >>   Daily Inventory Management Report
    Click Myelement    ${RP_MENU}
    Click Menu    Daily Inventory Management Report
    # 2.*Country : THAILAND
    # 3.*Warehouse : TMATH : ALL
    # 4.*Month : 02/2024
    # 5.*R-Package Owner : TMATH
    # 6.*R-Package Category : R-Module
    Fill Form Fields
    # 7.Click Generate Report
    Click Myelement    id=generate-reports

Fill Form Fields
    Select From List By Label    xpath=//div[@data-testid='select-country']//select    THAILAND
    Select From List By Label    xpath=//div[@data-testid='select-warehouse']//select    TMATH : ALL
    Input Text    xpath=//input[@placeholder='MM/YYYY']    02/2024
    Select From List By Label    xpath=//div[@data-testid='select-rpackage-owner']//select    TMATH
    Select From List By Label    xpath=//div[@data-testid='select-rpackage-category']//select    R-Module

Click Menu
    [Arguments]    ${menu_name}
    Click Myelement    xpath=//span[text()='${menu_name}']/ancestor::div[@role='button']

Verify Message
    [Arguments]    ${message}
    Wait Until Element Is Visible    ${ALERT_MESSAGE_INDICATOR}    60s
    ${status_text}=    Get Text    ${ALERT_MESSAGE_INDICATOR}
    Should Be Equal    ${status_text}    ${message}
    Log    Message text is: ${status_text}

Click Elements And Scroll
    Wait Until Element Is Visible  ${as.SELECT_LOCATION_BUTTON}  10s
    Mouse Down  ${as.SELECT_LOCATION_BUTTON}
    Wait Until Element Is Visible  ${as.BACKDROP_INVISIBLE}  10s
    Mouse Up  ${as.BACKDROP_INVISIBLE}
    Click Element  ${CSS_BODY}
    Execute JavaScript  ${as.SCROLL_TO_TOP_SCRIPT}
    Wait Until Element Is Visible  ${as.BUTTON_TO_CLICK}  10s
    Click Element  ${as.BUTTON_TO_CLICK}
    [Teardown]  Close Browser

1.7.6 Standard Movement Updating Interface Upload & Validation
    [Documentation]    1.7.6 Standard Movement Updating Interface Upload & Validation
    # 1.เลือกเมนู Common >> Monitoring >> On Demand Batch Screen
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    On Demand Batch Screen
    # *Project Code: DN97
    Click Myelement  xpath=//div[@data-testid='input-project-code']
    Click Option Dropdown    DN97
    # Batch Name: 1.7.6 Standard Movement Updating Interface Upload & Validation
    Click Myelement  xpath=//div[@data-testid='input-batch-name']
    Click Option Dropdown    Standard Movement Updating Interface Upload & Validation
    Click Myelement    id=btn-search
    Click Check Box
    Click Myelement    id=btn-execute
    Click Myelement    id=button-confirm-ok
    Wait Until Element Is Visible    css=.MuiAlert-message    10s
    ${alert_message}=  Get Text    css=.MuiAlert-message
    Log    Message: ${alert_message}
    # Should Be Equal    ${alert_message}    successfully

Common 2.1.4 Excel Download Screen
    [Documentation]    Common 2.1.4 Excel Download Screen
    [Arguments]    ${table_view}
    # 1.เลือกเมนู Common >> Monitoring >> Click Menu Excel Download Screen
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    Excel Download
    # *Table / View = VW_STD_MOVEMENT_TRANS
    Click Myelement    xpath=//*[@data-testid='select-table-view']
    Click Option Dropdown    ${table_view}
    # Click Excel Download 
    Click Myelement    id=btn-excel-download
    Click Myelement    id=button-confirm-ok
    # Verify Message    MSTD4003AINF: File Upload process is succeeded with File ID: xxxxxx
    # ======================================== #    
    # 2.นำเลข File ID: D240200482  ไปเช็คสถานะ
    # ======================================== # 
    # 3.เลือกเมนู Common >> Monitoring >> Click  On Demand Excel Download Monitoring Screen
    Click Menu    Common
    Click Menu    Monitoring
    Click Menu    On Demand Excel Download Monitoring
    # *Request Date = วันที่ ที่แสดง ณ เวลานั้น แล้วกดค้นหา
    Click Myelement    id=btn_search
    # Doc No = D240200482 (ตัวอย่าง)
    # Report Status = Download

1.3.4 Standard Movement Updating Excel Upload & Validation Batch
    [Documentation]    Step 1.3.4 Standard Movement Updating Excel Upload & Validation Batch
    Log    ใช้วิธี ยิง API เพื่อดู DATA เนื่องจากหน้า Web ยังไม่มีเมนูนี้

1.7.7 Plant Server Receiving interface Upload & Validation Batch
    Click Menu    Main Server
    Click Menu    Uploading R-Package Receive / Deliver / Update Status Screen
    Click Myelement    xpath=//button[normalize-space(text())='Send']

Scan Receive
    [Arguments]    ${scan_mode}    ${container_no}    ${barcode_no}
    # Open Scan Receive Screen
    Send Device Code Request
    Send Profile Request
    Send Get Location Warehouse Request    ${scan_mode}
    Send Get Delivery Container Info Request    ${container_no}
    Send Get Scan Receive Check Mismatch Request    ${barcode_no}    ${container_no}
    Send Get User Confirmation Request
    Send Scan Receive Request    ${barcode_no}    ${container_no}

Scan Sorting
    [Arguments]    ${scan_mode}    ${barcode_no}
    # Open Scan Receive Screen
    Send Device Code Request
    Send Profile Request
    Send Get Location Warehouse Request    ${scan_mode}
    Send Get Scan Receive Check Mismatch Request Sorting    ${barcode_no}
    Send Scan Status Change Request @CFIN    ${scan_mode}    ${barcode_no}

Scan Receive Box
    [Arguments]    ${scan_mode}    ${barcode_no}
    # Open Scan Receive Screen
    Send Device Code Request
    Send Profile Request
    Get Module Container Info    ${scan_mode}    ${barcode_no}
    Send Get User Confirmation Request
    Scan Status Change R-Box    ${scan_mode}    ${barcode_no}

Scan Receive Module
    [Arguments]    ${scan_mode}    ${barcode_no}
    # Open Scan Receive Screen
    Send Device Code Request
    Send Profile Request
    Get Module Container Info    ${scan_mode}    ${barcode_no}
    Send Get User Confirmation Request
    Scan Status Change R-Box    ${scan_mode}    ${barcode_no}    

APMC Scan Receive : Scan Receive Module only
    Scan Receive    RCV    MOFU6813381    TVRN0024000004
    1.7.11 R-Package Scan Screen - APMC Receive
    Common 2.1.4 Excel Download Screen    VW_SCAN_TRANS_HEADER_DETAIL_7D

APMC Scan Receive : Scan Receive Box (Scan Module, auto Retreive Box)
    Scan Receive    RCV    MOFU6813381    TVRN0024000004
    1.7.11 R-Package Scan Screen - APMC Receive
    Common 2.1.4 Excel Download Screen    VW_SCAN_TRANS_HEADER_DETAIL_7D

APMC Scan Receive : Scan Receive Box with DLV Dummy (Scan Module, auto Retreive Box)
    Scan Receive    RCV    MOFU6813381    TVRN0024000004
    1.7.11 R-Package Scan Screen - APMC Receive
    Common 2.1.4 Excel Download Screen    VW_SCAN_TRANS_HEADER_DETAIL_7D

APMC Scan Receive : Scan Receive Box with different default destination (Muti Devan)
    Scan Receive    RCV    MOFU6813381    TVRN0024000004
    1.7.11 R-Package Scan Screen - APMC Receive
    Common 2.1.4 Excel Download Screen    VW_SCAN_TRANS_HEADER_DETAIL_7D

1.7.11 R-Package Scan Screen - APMC Receive
    # รอ Step