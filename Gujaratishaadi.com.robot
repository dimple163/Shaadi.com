*** Settings ***
Library           SeleniumLibrary

*** Variables ***
${lets_begin}     //button[@data-testid='lets_begin']
${email}          //input[@data-testid='email']
${password}       //input[@data-testid='password1']
${create_profile}    //form/div[2]/div[3]/div/div[1]
${create_profile_value}    //form/div[2]/div[3]/div/div[2]/div
${gender}         //input[@id='gender_male']
${next}           //button[@data-testid='next_button']
${community}      //form/div[5]/div/div/div/div[1]
${url}            https://www.gujaratishaadi.com/

*** Test Cases ***
Registration
    open browser    ${url}    Chrome
    Maximize Browser Window
    Scroll Element Into View    ${lets_begin}
    Click Button    ${lets_begin}
    Scroll Element Into View    ${email}
    Click Element    ${email}
    Input Text    ${email}    firstname.lastname1@example.com
    Sleep    2s
    Click Element    ${password}
    Input Password    ${password}    P@ssw0rd@1
    Wait Until Element Is Visible    ${create_profile}
    Click Element    ${create_profile}
    sleep    2s
    Click Element    ${create_profile_value}
    Click Element    ${gender}
    Sleep    5s
    Click Button    ${next}
    sleep    5s
    Wait Until Element Is Visible    ${community}
    ${community_value}    Get Text    ${community}
    ${output}    Should Be Equal As Strings    ${community_value}    Gujarati
    Log    Community is Gujarati
    Close Browser
