*** Settings ***
Library                SeleniumLibrary
Variables              ../Resources/02_FBS_login_locators.yaml

*** Variables ***
${homepage_url}        https://ind-fbs-broker.com/cabinet/login
${browser_type}        chrome
${valid_email}         jenarforturnkeyid@gmail.com
${valid_password}      Jenar123!@#
${invalid_email}       jenarforturnkeyid
${invalid_password}    invalid
${username}            jenarforturnkeyid

*** Keywords ***
User open Browser Chrome and Go to FBS web
    [Documentation]                        Open Browser Using Chrome
    Open Browser                           ${homepage_url}                    ${browser_type}
    Maximize Browser Window    
    Location Should Be                     ${homepage_url}

User input valid username
    Wait Until Element Is Enabled          ${email_column}
    Input Text                             ${email_column}                    ${username}

User input valid email
    Wait Until Element Is Enabled          ${email_column}
    Input Text                             ${email_column}                    ${valid_email}

User input invalid email
    Wait Until Element Is Enabled          ${email_column}
    Input Text                             ${email_column}                    ${invalid_email}

User input valid password
    Wait Until Element Is Enabled          ${password_column}
    Input Text                             ${password_column}                 ${valid_password}

User input invalid password
    Wait Until Element Is Enabled          ${password_column}
    Input Text                             ${password_column}                 ${invalid_password}

User Click "Log in" button
    Click Element                          ${Login_button}

User redirected to Dashboard Page
    Sleep                                 5s
    Wait Until Element Is Visible         ${dashboard}                        timeout=20

System showing error message: "Dibutuhkan Email"
    Wait Until Element Is Visible         ${alert_blank_email}                timeout=20
    Element Should Be Visible             ${alert_blank_email}


System showing error message: "Dibutuhkan kata sandi"
    Wait Until Element Is Visible         ${alert_blank_password}             timeout=20
    Element Should Be Visible             ${alert_blank_password}

System showing error message: "Email tidak terdaftar"
    Wait Until Element Is Visible         ${alert_wrong_email}                timeout=20
    Element Should Be Visible             ${alert_wrong_email}

System showing error message: "Terjadi kesalahan saat login atau Anda salah memasukkan password"
    Wait Until Element Is Visible         ${alert_wrong creds}                timeout=20
    Element Should Be Visible             ${alert_wrong creds}
