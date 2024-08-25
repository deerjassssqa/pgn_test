*** Variables ***
${common.url}    https://pgn-dev.toyota.co.th/
${common.message}    (//div[contains(@class, 'MuiAlert-message') and contains(@class, 'css-1xsto0d')])[2]
${common.status}    xpath=//div[@data-field='status']//span
${BASE_URL}           https://pgn-api-dev.toyota.co.th/web-api-master/master-upload
${HEADERS}            {"accept": "application/json, text/plain, */*", "accept-language": "th-TH,th;q=0.9,en;q=0.8", "origin": "https://pgn-dev.toyota.co.th", "priority": "u=1, i", "referer": "https://pgn-dev.toyota.co.th/", "sec-ch-ua": "\"Not/A)Brand\";v=\"8\", \"Chromium\";v=\"126\", \"Google Chrome\";v=\"126\"", "sec-ch-ua-mobile": "?0", "sec-ch-ua-platform": "\"macOS\"", "sec-fetch-dest": "empty", "sec-fetch-mode": "cors", "sec-fetch-site": "same-site", "user-agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/126.0.0.0 Safari/537.36"}
${FUNCTION_NAME}      BDN910F0
${USER_ID}            Surasith
${DATA_OWNER}         TMATH
${CD}                 BDN910F0
${common.upload_button}    //button[contains(.,'Upload')]

${XPATH_EXPORTER_CODE_INPUT}    //div[@data-testid='1-exporterCode']//input[@class='MuiSelect-nativeInput css-1k3x8v3']
${XPATH_IMP_COMPANY_INPUT}    //div[@data-testid='1-impCompanyAbbrId']//input[@class='MuiSelect-nativeInput css-1k3x8v3']
${XPATH_ETD_INPUT}    //div[@data-testid='1-etd']//input[@class='MuiInputBase-input MuiOutlinedInput-input css-1x5jdmq']
${XPATH_CONSIGNEE_ID_INPUT}    //div[@data-testid='1-consigneeId']//input[@class='MuiSelect-nativeInput css-1k3x8v3']
${XPATH_LOADING_PORT_INPUT}    //div[@data-testid='1-loadingPort']//input[@class='MuiSelect-nativeInput css-1k3x8v3']
${XPATH_DISCHARGING_PORT_INPUT}    //div[@data-testid='1-dischargingPort']//input[@class='MuiSelect-nativeInput css-1k3x8v3']
${DROPDOWN_OPTION_TMATH}     //li[contains(text(),'TMATH')]


${SCROLL_DOWN}               window.scrollTo(0, document.body.scrollHeight)
${SCROLL_RIGHT}              window.scrollTo(document.body.scrollWidth, 0);
${SCROLL_UP}                 window.scrollTo(0, 0)
${SCROLL_TO_POSITION}        window.scrollTo(0, 328)
${CSS_MUI_SELECT}            css=.Mui-focused > .MuiSelect-select
${CSS_MUI_BACKDROP}          css=.MuiBackdrop-invisible
${CSS_BODY}                  css=body
${ex.CSS_ADD_BUTTON}         css=.MuiButtonBase-root:nth-child(11)


${im.CSS_MUI_MENU_ITEM}      css=.MuiMenuItem-root:nth-child(4)
${im.CSS_ADD_BUTTON}         css=.MuiButtonBase-root:nth-child(208)

${DATA_TESTID_IMP_COMPANY}              xpath=//*[@data-testid='1-impCompanyAbbrId']
${DATA_TESTID_EX_CODE}                  xpath=//*[@data-testid='1-exporterCode']
${DATA_TESTID_ETD}                      xpath=//*[@data-testid='1-etd']
${DATA_TESTID_ETD_INPUT}                xpath=//*[@data-testid='1-etd']//input[@type='text']
${DATA_TESTID_LOADING_PORT_COMBOBOX}    xpath=//*[@data-testid='1-loadingPort']//div[@role='combobox']

${MASTER_MENU}    xpath=//span[text()='Master']/ancestor::div[@role='button']
${DUMMS_MENU}    xpath=//span[text()='Download and Upload Master Maintenance Screen']/ancestor::div[@role='button']
${TLM_MENU}    xpath=//li[contains(.,'Transportation Leadtime Master')]
${IV_MENU}    xpath=//span[text()='Invoice']/ancestor::div[@role='button']
${SIMS_MENU}    xpath=//span[text()='Shipping Information Maintenance Screen']/ancestor::div[@role='button']
${RP_MENU}    xpath=//span[text()='Report']/ancestor::div[@role='button']
${ARTR_MENU}    xpath=//span[text()='Average Lead Time Report']/ancestor::div[@role='button']

${SELECT_UPLOAD}    id=select_upload
${UPLOAD_FILE}    id=upload-file
${ALERT_MESSAGE}    //div[@class='MuiAlert-message css-1xsto0d']
${BUTTON_ADD}    id=btn_add
${DATA_TESTID_SELECT_REPORT_BASIS}    xpath=//*[@data-testid='select-report-basis']//div[@role='combobox']
${DATA_TESTID_SELECT_REPORT_BASIS_MOUNTHLY}    xpath=//li[contains(.,'Monthly')]
${DATA_TESTID_SELECT_LOCATION_TYPE}    xpath=//*[@data-testid='select-location-type']//div[@role='combobox']
${DATA_TESTID_SELECT_ROUTE_POINT}    xpath=//li[contains(.,'Route Point')]
${DATA_TESTID_SELECT_LOCATION_GROUP}    xpath=//*[@data-testid='select-location-group']//div[@role='combobox']
${DATA_TESTID_SELECT_TMV}    xpath=//li[contains(.,'TMV')]

${ID_PERIOD_FROM}    id=input-period-from
${ID_PERIOD_TO}    id=input-period-to
${DATA_TESTID_PERIOD_FROM}    xpath=//*[@data-testid='input-period-from']//input[@type='text']
${DATA_TESTID_PERIOD_TO}    xpath=//*[@data-testid='input-period-to']//input[@type='text']
${ID_GEN_REPORT}    id=generate-reports
${ALERT_MESSAGE_XPATH}               xpath=//div[@class='MuiAlert-message css-1xsto0d']
${DATA_TESTID_GEN_REPORT}              xpath=//*[@data-testid='generate-reports']
${EXPECTED_FILE_PREFIX}    Average_Lead_Time
${EXPECTED_FILE_EXTENSION}    .xlsx

${DATA_TESTID_SELECT_RPACKAGE_OWNER}  xpath=//*[@data-testid='select-rpackage-owner']//div[@role='combobox']
${DATA_TESTID_SELECT_RPACKAGE_OWNER_TMV}  xpath=//li[contains(.,'TMV')]
${LOADING_INDICATOR}            xpath=//p[contains(text(),'Loading...')]
${ALERT_MESSAGE_INDICATOR}      xpath=//div[contains(@class,'MuiAlert-message')]

${SELECT_LOCATION}      id=select-location
${DOWNLOAD_PATH}    /Users/deer/polygon-robot-test/resources/testdata/excel


${as.SELECT_LOCATION_BUTTON}        id=select-current-location
${as.BACKDROP_INVISIBLE}            css=.MuiBackdrop-invisible
${as.SCROLL_TO_TOP_SCRIPT}          window.scrollTo(0,0)
${as.BUTTON_TO_CLICK}               css=.MuiButtonBase-root:nth-child(1535)


${DATA_TESTID_PROJECT_CODE}    xpath=//*[@data-testid='input-project-code']


${mt.URL}  https://pgn-api-dev.toyota.co.th/web-api-master/master-upload
${mt.HEADERS}  Create Dictionary  accept=application/json, text/plain, */*  accept-language=th-TH,th;q=0.9,en;q=0.8  content-type=multipart/form-data; boundary=----WebKitFormBoundaryDlAHRrwZDG3A5ltb  origin=https://pgn-dev.toyota.co.th  priority=u=1, i  referer=https://pgn-dev.toyota.co.th/  sec-ch-ua="Not)A;Brand";v="99", "Google Chrome";v="127", "Chromium";v="127"  sec-ch-ua-mobile=?0  sec-ch-ua-platform="macOS"  sec-fetch-dest=empty  sec-fetch-mode=cors  sec-fetch-site=same-site  user-agent=Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/127.0.0.0 Safari/537.36
${mt.DATA}  Create Dictionary  functionName=BDN910F0  userId=9ed18e70-53bb-4717-a34b-d92ce82afc3e  dataOwner=TMATH  cd=BDN910F0
${mt.FILE_PATH}  path_to_your_file  # replace with the path to your file
