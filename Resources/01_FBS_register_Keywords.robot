*** Settings ***
Library                SeleniumLibrary
Variables              ../Resources/01_FBS_register_locators.yaml

*** Variables ***
${homepage_url}        https://ind-fbs-broker.com/cabinet/login
${browser_type}        chrome
${valid_email}         jenarforturnkeyid@gmail.com
${invalid_email}       jenarforturnkeyid
${valid_name}          jenar test TurnkeyID
${valid_googlepass}    Jenar123!@#

*** Keywords ***
User open Browser Chrome and Go to FBS web
    [Documentation]                        Open Browser Using Chrome
    Open Browser                           ${homepage_url}                ${browser_type}
    Maximize Browser Window    
    Location Should Be                     ${homepage_url}

User go to regsitration account of FBS
    Wait Until Element Is Visible          ${pendaftaran_button}
    Click Element                          ${pendaftaran_button}

Validate user in the register page
    Wait Until Element Is Visible         ${pendaftaran_title}

User input valid email
    Wait Until Element Is Visible         ${email_column}
    Input Text                            ${email_column}                ${valid_email}

User input invalid email
    Wait Until Element Is Visible         ${email_column}
    Input Text                            ${email_column}                ${invalid_email}

User input valid full name
    Wait Until Element Is Visible         ${name_column}
    Input Text                            ${name_column}                 ${valid_name}

User click register button
    Wait Until Element Is Visible         ${register_button}
    Click Element                         ${register_button}

System showing alert "Email tidak terdaftar"
    Wait Until Element Is Visible         ${alert_noregis}
    Element Should Be Visible             ${alert_noregis}

System showing alert "Dibutuhkan Email"
    Wait Until Element Is Visible         ${alert_in_email}
    Element Should Be Visible             ${alert_in_email}

System showing alert "Dibutuhkan Nama"
    Wait Until Element Is Visible         ${alert_in_name}
    Element Should Be Visible             ${alert_in_name}

User input valid email in google email page
    Wait Until Element Is Visible         ${input_new_emailgoogle}
    Input Text                            ${input_new_emailgoogle}        ${valid_email}
    Click Element                         ${next_google}

User input valid password in google email page
    Wait Until Element Is Visible         ${input_new_passwordgoogle}
    Input Text                            ${input_new_passwordgoogle}     ${valid_googlepass}
    Click Element                         ${next_google}

Select correct email
    Wait Until Element Is Visible         ${email}
    Click Element                         ${email}

User skipped verifikasi ID
    Sleep                                 5s
    Wait Until Element Is Visible         ${lewati}                    timeout=20
    Click Element                         ${lewati}

User redirected to Dashboard Page
    Sleep                                 5s
    Wait Until Element Is Visible         ${dashboard}                    timeout=20