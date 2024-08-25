*** Settings ***
Resource    ../import.robot

*** Variables ***
${database.database_type}    pymysql
${database.host}     rds-pgn-dev.cqdbslwlazoc.ap-southeast-1.rds.amazonaws.com
${database.port}     3306
${database_name}     dev
${database.username}     user00
${database.password}    Rtv)CwG%&-~Oz%Q).T28Y0N?Iv_n(pi6
*** Keywords ***

Connect To Databse Via SSH
    ${connection_string}    BuiltIn.Set variable        database='${database_name}', user='${database.username}', password='${database.password}', host='${database.host}', port=${database.port}
    ${is_connect}      BuiltIn.Run Keyword And Return Status    DatabaseLibrary.Connect to database using custom params     ${database.database_type}        ${connection_string}
    IF   ${is_connect} == ${FALSE}
        Close SSH Connection
        DatabaseLibrary.Connect to database using custom params     ${database.database_type}        ${connection_string}
    END
Close SSH Connection
    SSHLibrary.Close all connections

Disconnect From Database And SSH
    DatabaseLibrary.Disconnect from database

Select Column With Condition
    [Arguments]     ${table}    ${column}   ${column_condition}    ${condition_value}
    ${sql_query}    BuiltIn.Catenate        SELECT ${column}      
    ...                                     FROM   ${table}
    ...                                     WHERE  ${column_condition} = '${condition_value}'
    DatabaseLibrary.Execute sql string    ${sql_query}
    ${result}=      DatabaseLibrary.Execute Sql String    ${sql_query}
    Log    The value of ${column} is: ${result[0][0]}
    [Return]        ${result[0][0]}