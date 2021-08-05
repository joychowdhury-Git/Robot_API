*** Settings ***

Library    SeleniumLibrary

*** Variables ***

${Browser}  Chrome
${URL}  http://www.testingworld.com/testings

*** Test Cases ***
TC01_Browser Start and close
    open browser    ${URL}  ${Browser}
    maximize browser window
    sleep    3s
    close browser




