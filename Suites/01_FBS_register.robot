*** Settings ***
Documentation          Negative Case
Library                SeleniumLibrary
Resource                ../Resources/01_FBS_register_Keywords.robot

*** Test Cases ***
User failed registered with invalid format email and valid name
    [Tags]                                        Negative Case
    [Documentation]                               Negative case: input invalid format email
    [Setup]                                       Given User open Browser Chrome and Go to FBS web
    When User go to regsitration account of FBS
    Then Validate user in the register page
    Given User input invalid email
    And User input valid full name
    When User click register button
    Then System showing alert "Email tidak terdaftar"
    [Teardown]                                    Close Browser

User failed registered with leaves blank email column but input in name column
    [Tags]                                        Negative Case
    [Documentation]                               Negative case: leaves blank email
    [Setup]                                       Given User open Browser Chrome and Go to FBS web
    When User go to regsitration account of FBS
    Then Validate user in the register page
    Given User input valid full name
    When User click register button
    Then System showing alert "Dibutuhkan Email"
    [Teardown]                                    Close Browser

User failed registered with input valid email in email column but leaves blank name column
    [Tags]                                        Negative Case
    [Documentation]                               Negative case: Leaves blank name
    [Setup]                                       Given User open Browser Chrome and Go to FBS web
    When User go to regsitration account of FBS
    Then Validate user in the register page
    Given User input valid email
    When User click register button
    Then System showing alert "Dibutuhkan Nama"
    [Teardown]                                    Close Browser

User failed registered with leaves blank in email and full name column
    [Tags]                                        Negative Case
    [Documentation]                               Negative case: leaves blank in email and full name column
    [Setup]                                       Given User open Browser Chrome and Go to FBS web
    When User go to regsitration account of FBS
    Then Validate user in the register page
    When User click register button
    Then System showing alert "Dibutuhkan Email"
    And System showing alert "Dibutuhkan Nama"
    [Teardown]                                    Close Browser

User success register with valid email and valid name
    [Tags]                                        Negative Case
    [Documentation]                               Negative case: leaves blank in email and full name column
    [Setup]                                       Given User open Browser Chrome and Go to FBS web
    When User go to regsitration account of FBS
    Then Validate user in the register page
    Given User input valid email
    And User input valid full name
    When User click register button
    And User input valid email in google email page
    And User input valid password in google email page
    And User skipped verifikasi ID
    Then User redirected to Dashboard Page
    [Teardown]                                    Close Browser