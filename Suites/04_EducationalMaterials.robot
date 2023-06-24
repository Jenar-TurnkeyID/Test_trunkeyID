*** Settings ***
Documentation          Negative Case
Library                SeleniumLibrary
Resource                ../Resources/04_educationalmaterials_keywords.robot

*** Test Cases ***
User successfully open demo account
    [Tags]                                        Psitive Case
    [Documentation]                               Positive case: Open Account
    [Setup]                                       Given User open Browser Chrome and Go to FBS web
    When User input valid email
    And User input valid password
    And User Click "Log in" button
    Then User redirected to Dashboard Page
    When User Click Analisis & Pendidikan
    Then User Click Tampilkan Semua Kursus for Pemula
    Then User Click one card list
    [Teardown]                                    Close Browser 