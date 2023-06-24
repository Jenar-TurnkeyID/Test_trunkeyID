*** Settings ***
Documentation          Negative Case
Library                SeleniumLibrary
Resource                ../Resources/03_OpenAccount_Keywords.robot

*** Test Cases ***
User successfully open demo account
    [Tags]                                        Psitive Case
    [Documentation]                               Positive case: Open Account
    [Setup]                                       Given User open Browser Chrome and Go to FBS web
    When User input valid email
    And User input valid password
    And User Click "Log in" button
    Then User redirected to Dashboard Page
    When User Click "+buat akun" button
    And User select "DEMO"
    And User select "DEMO Standar"
    And User choose Platform Trading with Meta Trader 4
    And User input Saldo Awal with USD$ 30.000
    And User select Leverage 1:2000
    And User click Buka Akun button
    Then User redirected to informasi akun page
    [Teardown]                                    Close Browser 