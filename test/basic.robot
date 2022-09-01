*** Settings ***
Library    Collections
Library    String
Default Tags    disabled
Force Tags    regression

*** Variables ***
${name}    John Paul
${age}    28

*** Test Cases ***
Tunjukkan nama saya
    [Tags]        that
    Log    Nama adalah ${name}    console=${TRUE}

Tunjukkan Umur saya
    [Tags]        that
    Log    Umur adalah ${age}    console=${TRUE}

Buat Nama baru
    [Tags]        that
    ${name}    Set Variable    Joni
    Log    Nama adalah ${name}    console=${TRUE}

Pembuatan Huruf BESAR
    [Tags]    disabled
    ${name}    Set Variable    john paul
    Log    huruf kecil adalah ${name}    console=${TRUE}
    ${caps}    Jadikan huruf KAPITAL    input=${name}
    Log    Hasil caps adalah ${caps}    console=${TRUE}

*** Keywords ***
Jadikan huruf KAPITAL
    [Arguments]    ${input}
    ${result}    Convert To Upper Case    ${input}
    [Return]    ${result}