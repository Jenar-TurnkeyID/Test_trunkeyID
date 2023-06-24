*** Settings ***
Library                SeleniumLibrary
Variables              ../Resources/04_educationalmaterials_locators.yaml
*** Variables ***
${homepage_url}        https://ind-fbs-broker.com/cabinet/login
${browser_type}        chrome
${valid_email}         jenarforturnkeyid@gmail.com
${valid_password}      Jenar123!@#

*** Keywords ***
User open Browser Chrome and Go to FBS web
    [Documentation]                        Open Browser Using Chrome
    Open Browser                           ${homepage_url}                    ${browser_type}
    Maximize Browser Window    
    Location Should Be                     ${homepage_url}

User input valid email
    Wait Until Element Is Enabled          ${email_column}
    Input Text                             ${email_column}                    ${valid_email}

User input valid password
    Wait Until Element Is Enabled          ${password_column}
    Input Text                             ${password_column}                 ${valid_password}

User Click "Log in" button
    Click Element                          ${Login_button}

User redirected to Dashboard Page
    Sleep                                 5s
    Wait Until Element Is Visible         ${dashboard}                       timeout=20

User Click Analisis & Pendidikan
    Sleep                                  3s
    Wait Until Element Is Enabled          ${edu_menu}
    Click Element                          ${edu_menu}

User Click Tampilkan Semua Kursus for Pemula
    Sleep                                  3s
    Wait Until Element Is Enabled          ${semua_kursus}                    timeout=20
    Click Element                          ${edu_menu}

User Click one card list
    Sleep                                  3s
    Wait Until Element Is Enabled          ${card_list1}                        timeout=20
    Click Element                          ${edu_menu}