*** Settings ***
Library    Collections
Library    String
Default Tags    disabled
Force Tags    regression

*** Variables ***
@{mobil}    sedan    pickup    hatchback

*** Test Cases ***
Loop with Range
    [Tags]        disabled
    FOR    ${i}    IN RANGE    5
        Log    i adalah ${i}    console=${TRUE}
        Exit For Loop If    ${i}==2
    END

Loop di list
    [Tags]        disabled
    FOR    ${element}    IN    @{mobil}
        Log    element adalah ${element}    console=${TRUE}
    END