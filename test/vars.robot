*** Settings ***
Library    Collections
Library    String
Default Tags    disabled
Force Tags    regression

*** Variables ***
${name}    John Paul
&{planes}    us=boeing    eu=airbus
@{mobil}    sedan    pickup    hatchback

*** Test Cases ***
Percobaan Panggil Variables dan Dictionary
    [Tags]        disabled
    # Log    Nama adalah ${name}    console=${TRUE}
    # Dictionary Should Contain Item    ${planes}    ab    boeing
    
    Log    Pesawat adalah ${planes}    console=${TRUE}
    # ${show}    Get Dictionary Items    ${planes}
    # Log    ${show}    console=${TRUE}

    # Log    Pesawat adalah ${planes.us}    console=${TRUE}
    # ${show}    Get From Dictionary    ${planes}    us
    # Log    ${show}    console=${TRUE}

    Set To Dictionary    ${planes}    id=PTDI
    Log    Pesawat adalah ${planes}    console=${TRUE}

    Remove From Dictionary    ${planes}    us
    Log    Pesawat adalah ${planes}    console=${TRUE}

Buat Variable dan Dictionary Baru
    [Tags]    disabled
    ${binatang}    Set Variable    kucing
    Log    Show binatang ${binatang}    console=${TRUE}

    ${cars}    Create Dictionary    eu=bmw    us=ford
    
    ${motor}    Create Dictionary
    Set To Dictionary    ${motor}    bebek=supra    matic=beat

Latihan List atau Array
    [Tags]    disabled
    Log    Isi mobil adalah ${mobil}    console=${TRUE}
    Append To List    ${mobil}    offroad
    Log    Isi mobil adalah ${mobil}    console=${TRUE}

Banyak isi
    [Tags]    this
    ${negara}    Create List    indonesia
    Log    Isi dari list ${negara}    console=${TRUE}

    ${province}    Create Dictionary    dki=jakarta pusat    jabar=bandung    sumbar=padang

    Append To List    ${negara}    ${province}
    Log    Isi dari list ${negara}    console=${TRUE}

    Log    spesific DKI ${negara[1].dki}    console=${TRUE}