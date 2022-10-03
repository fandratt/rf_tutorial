*** Settings ***
Documentation   Generate Test Data Matrix
Library         OperatingSystem
Library         Collections
Library         String
Library         ${EXECDIR}/python/csvLibrary.py

*** Test Cases ***
Generate Test Case
    [Documentation]     ${deftestdata} = valid | invalid | blank | none | 0 | numeric
    ...                 E | e | alphabet | alphanumeric | decimal | specialchars | freetext | boolean
    ...                 RUNNER: robot -d Results --include data_matrix_generator test/
    ...                 Tutorial on YouTube: https://www.youtube.com/watch?v=ijDck6Wh1tQ
    [Tags]              data_matrix_generator
    ${file_path}=       Set Variable    ${EXECDIR}/FILE/trial.csv
    Remove File From Path   ${file_path}
    # --- START - You MAY CHANGE THE LINES ---
    ${headernames}=     Create List     username    password    corp_id
    ${deftestdata}=     Create List     valid   space    blank
    # --- STOP - You MAY CHANGE THE LINES ---
    Create CSV Test Data Matrix     ${file_path}    ${headernames}      ${deftestdata}

*** Keywords ***
Remove File From Path
    [Arguments]         ${path}
    ${is_exists}=       Run Keyword And Return Status   File Should Exist   ${path}
    Run Keyword If      ${is_Exists}==${TRUE}           Remove File         ${path}
Create CSV Test Data Matrix
    [Arguments]     ${file_path}    ${headernames}      ${deftestdata}
    ${rows_dict}=   Create Dictionary
    ${rows_list}=   Create List
    ${results}=     Prepare CSV Test Data Matrix     ${headernames}      ${deftestdata}
    ${list_data}=   Set Variable    ${results.list_data}
    ${total}=       Set Variable    ${results.total}
    FOR     ${i}    IN RANGE    ${total}
        ${rows_dict}=       Create Dictionary
        ${rows_dict}=       Copy Dictionary     ${list_data}[${i}]
        Set To Dictionary   ${rows_dict}        test_number=${i}
        ${def_test_data}=   Set Variable        SEND ${list_data}[${i}]
        ${def_test_data}=   Remove String       ${def_test_data}    {   }
        ${def_test_data}=   Replace String      ${def_test_data}    :   =
        ${def_test_data}=   Replace String      ${def_test_data}    ,   ${SPACE}-
        Append To List      ${rows_list}        ${rows_dict}
    END
    Insert Into List    ${headernames}      0   test_number
    Create and Write Into CSV   ${file_path}    ${headernames}      ${rows_list}
Prepare CSV Test Data Matrix
    [Documentation]     This keyword takes arguments:
    ...                 columns = list of column/headers in csv
    ...                 test_data = list of possible data to be used
    [Arguments]         ${columns}      ${test_data}
    ${results}=         Test Matrix     ${columns}      ${test_data}
    ${len}=         Get Length      ${results}
    ${temp_list}=   Create List
    FOR     ${i}    IN RANGE    ${len}
        ${arr1}=    Set Variable    ${results}[${i}]
        ${len2}=    Get Length      ${arr1}
        ${temp_dict}=   Create Dictionary
        FOR     ${j}    IN RANGE    ${len2}
            ${arr2}=    Set Variable    ${arr1}[${j}]
            ${len3}=    Get Length      ${arr2}
            Set To Dictionary   ${temp_dict}    ${arr2}[0]=${arr2}[1]
        END
        Append To List      ${temp_list}    ${temp_dict}
    END
    ${len_tot}=     Get Length      ${temp_list}
    ${results}=     Create Dictionary   total=${len_tot}    list_data=${temp_list}
    [Return]        ${results}
Create and Write Into CSV
    [Documentation]     This keyword takes arguments:
    ...                 file_path = path and csv file name to be created
    ...                 headernames = list of header names
    ...                 rows_dict = list of dict of the content of the CSV
    [Arguments]         ${file_path}    ${headernames}      ${rows_dict}
    Write Into CSV      ${file_path}    ${headernames}      ${rows_dict}