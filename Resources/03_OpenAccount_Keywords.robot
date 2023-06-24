*** Settings ***
Library                SeleniumLibrary
Variables              ../Resources/03_OpenAccount_locators.yaml

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

User Click "+buat akun" button
    Sleep                                 5s
    Wait Until Element Is Visible         ${bukaAkun_button}                 timeout=20
    Click Element                         ${bukaAkun_button}

User select "DEMO"
    Sleep                                 5s
    Wait Until Element Is Visible         ${account_type1}                    timeout=20
    Click Element                         ${account_type1}

User select "DEMO Standar"
    Sleep                                 5s
    Wait Until Element Is Visible         ${account_type2}                    timeout=20
    Click Element                         ${account_type2}

User choose Platform Trading with Meta Trader 4
    Sleep                                 5s
    Wait Until Element Is Visible         ${metatrader4}                      timeout=20
    Click Element                         ${metatrader4}

User input Saldo Awal with USD$ 30.000
    Sleep                                 5s
    Wait Until Element Is Visible         ${saldo_awal}                       timeout=20
    Click Element                         ${saldo_awal}

User select Leverage 1:2000
    Sleep                                 5s
    Click Element                         ${leverage}

User click Buka Akun button
    Sleep                                 5s
    Click Element                         ${bukaAkun2_button}

User redirected to informasi akun page
    Sleep                                 5s
    Wait Until Element Is Visible         ${informasi_akun}                       timeout=20