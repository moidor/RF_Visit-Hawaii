*** Settings ***
Documentation   To validate the login form
Library         SeleniumLibrary

*** Test Cases ***
Validate unsuccessful login
    open the browser with the Mortgage payment url
    Fill the login form
    wait until it checks and display error message
    verify error message is correct

*** Keywords ***
open the browser with the Mortgage payment url
    Create Webdriver    Chrome  executable_path=C:/Users/Cham/Downloads/chromedriver_win32/chromedriver.exe
    Go To   https://rahulshettyacademy.com/loginpagePractise/

