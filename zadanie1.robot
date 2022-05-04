*** Settings ***
Library     SeleniumLibrary
Test Setup      Open Browser    https://www.gomedicare.com/  gc
Test Teardown       Close Browser

*** Variables ***
${zip_submit}      class=form__submit
${fname_submit}      xpath=//section[4]/div/form/div/div[2]/button
${lname_submit}     xpath=//section[5]/div/form/div/div[2]/button
${card_label}       xpath=//section[6]/div/form/div/div/label[2]
${locator_phone}       xpath=//section[7]/div/form/div/div[2]/input
${locator_submit_form}    xpath=//section[7]/div/form/div/button
${locator_privacy_link}     xpath=/html/body/div[1]/div/section/div/p/a[3]
${locator_qualify_button}       id=button-header
${phone_number}     0000000007
${ZIP}      35007
${first_name}       Rachel
${last_nane}        Green

*** Test Cases ***
Open page and if qualify button is visible for mobile
    Set Selenium Speed    0.5s
    Set Window Size    1080    1920
    Wait Until Page Contains    Answer 4 simple questions
    Wait Until Page Contains Element    ${locator_qualify_button}
    Click Button    ${locator_qualify_button}


Open page and submit the form with wrong number
    Set Selenium Speed    0.5s
    Wait Until Page Contains    Answer 4 simple questions
    Click Button    id=button-header
    Wait Until Page Contains Element    id=zip-code
    Input Text    id=zip-code    ${ZIP}
    Click Button    ${zip_submit}
    Click Element    xpath=//section[3]/div/form/div/div/label[1]
    Input Text    id=first-name         ${first_name}
    Click Button    ${fname_submit}
    Input Text    id=last-name      ${last_nane}
    Click Button    ${lname_submit}
    Click Element    ${card_label}
    Input Text    ${locator_phone}    ${phone_number}
    Click Button    ${locator_submit_form}
    Page Should Contain    Invalid phone number format.
    
Open page and verify address
#tento test case mi neprechadza a neviem preco locator mam spravne ale neviem ci spravne ukladam
#to cislo do premennej ... mozno to nema byt get text ale nieco ine pozriem sa na to cez vikend
    Wait Until Page Contains    GoMedicare
    ${callcenter_number}       Get Text    xpath=/html/body/div[1]/div/header/div/div[2]/div[2]/span[3]
    Should Be Equal    ${callcenter_number}    1-855-493-3940