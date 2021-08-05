*** Settings ***
Library    RequestsLibrary

*** Variables ***
${baseUrl}  http://thetestingworldapi.com/

*** Test Cases ***
TC001_Get_Request
    create session    Getrequestdata    ${baseUrl}
    ${responsedata}=  get on session    Getrequestdata   api/studentsDetails
    ${actualcode}   convert to string    ${responsedata.status_code}
    log to console    ${actualcode}
    should be equal  ${actualcode}    200