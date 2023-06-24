*** Settings ***
Documentation          Negative Case
Library                SeleniumLibrary
Resource                ../Resources/02_FBS_login_keywords.robot

*** Test Cases ***
User failed login with valid email but invalid password
    [Tags]                                        Negative Case
    [Documentation]                               Negative case: valid email but invalid password
    [Setup]                                       Given User open Browser Chrome and Go to FBS web
    When User input valid email
    And User input invalid password
    And User Click "Log in" button
    Then System showing error message: "Terjadi kesalahan saat login atau Anda salah memasukkan password"
    [Teardown]                                    Close Browser

User failed login with invalid email but valid password
    [Tags]                                        Negative Case
    [Documentation]                               Negative case: invalid email but valid password.
    [Setup]                                       Given User open Browser Chrome and Go to FBS web
    When User input invalid email
    And User input valid password
    And User Click "Log in" button
    Then System showing error message: "Email tidak terdaftar"
    [Teardown]                                    Close Browser

User failed login with invalid email and invalid password
    [Tags]                                        Negative Case
    [Documentation]                               Negative case: invalid email and invalid password
    [Setup]                                       Given User open Browser Chrome and Go to FBS web
    When User input invalid email
    And User input invalid password
    And User Click "Log in" button
    Then System showing error message: "Email tidak terdaftar"
    [Teardown]                                    Close Browser

User failed login with user id
    [Tags]                                        Negative Case
    [Documentation]                               Negative case: fill email with username
    [Setup]                                       Given User open Browser Chrome and Go to FBS web
    When User input valid username
    And User input valid password
    And User Click "Log in" button
    Then System showing error message: "Email tidak terdaftar"
    [Teardown]                                    Close Browser

User failed login with leaves blank in email but input valid password
    [Tags]                                        Negative Case
    [Documentation]                               Negative case: leaves blank email
    [Setup]                                       Given User open Browser Chrome and Go to FBS web
    When User input valid password
    And User Click "Log in" button
    Then System showing error message: "Dibutuhkan Email"
    [Teardown]                                    Close Browser

User failed login with input valid email but leaves blank in password
    [Tags]                                        Negative Case
    [Documentation]                               Negative case: leaves blank password
    [Setup]                                       Given User open Browser Chrome and Go to FBS web
    When User input valid email
    And User Click "Log in" button
    Then System showing error message: "Dibutuhkan kata sandi"
    [Teardown]                                    Close Browser

User failed login with leaves blank in email and password
    [Tags]                                        Negative Case
    [Documentation]                               Negative case: leaves blank email and password
    [Setup]                                       Given User open Browser Chrome and Go to FBS web
    When User Click "Log in" button
    Then System showing error message: "Dibutuhkan Email"
    And System showing error message: "Dibutuhkan kata sandi"
    [Teardown]                                    Close Browser

User success login with valid credentials
    [Tags]                                        Positive Case
    [Documentation]                               Positive case: success login and see dashboard
    [Setup]                                       Given User open Browser Chrome and Go to FBS web
    When User input valid email
    And User input valid password
    And User Click "Log in" button
    Then User redirected to Dashboard Page
    [Teardown]                                    Close Browser