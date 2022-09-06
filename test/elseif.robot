*** Settings ***
Library    Collections
Library    String
Default Tags    disabled
Force Tags    regression

*** Test Cases ***
Basic If
    [Tags]        disabled
    ${i}    Set Variable    b

    IF    "${i}"=="a"
        Log    Bagus    console=${TRUE}
    END

    IF    "${i}"=="b"
        Log    oke    console=${TRUE}
    END

Basic If else
    [Tags]        disabled
    ${i}    Set Variable    b

    IF    "${i}"=="a"
        Log    Bagus    console=${TRUE}
    ELSE
        Log    coba lagi    console=${TRUE}
    END

Basic If elif
    [Tags]        disabled
    ${i}    Set Variable    z

    IF    "${i}"=="a"
        Log    Bagus    console=${TRUE}
    ELSE IF    "${i}"=="b"
        Log    oke    console=${TRUE}
    ELSE
        Log    coba lagi    console=${TRUE}
    END

Decide on Keyword
    [Tags]        disabled
    ${i}    Set Variable    z
    Run Keyword If    "${i}"=="a"    Log    Bagus    console=${TRUE}
    ...    ELSE IF    "${i}"=="b"    Log    cukup    console=${TRUE}
    ...    ELSE    Log    coba lagi    console=${TRUE}