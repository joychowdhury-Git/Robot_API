*** Settings ***
Library    RequestsLibrary
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${baseUrl}  http://thetestingworldapi.com/
${studentid}  380761

*** Test Cases ***
TC002_Get_Request
    create session    Getrequestdata    ${baseUrl}
    ${responsedata}=  get on session    Getrequestdata   api/studentsDetails/${studentid}
    log to console    ${responsedata.content}
    ${jsonresponse}=    to json    ${responsedata.content}
   @{firstname_json}=   get value from json    ${jsonresponse}  data.first_name
   ${firstname}=    get from list    ${firstname_json}  0
    log to console  ${firstname}


