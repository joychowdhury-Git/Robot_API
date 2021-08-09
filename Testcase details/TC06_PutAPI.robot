*** Settings ***

Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${baseUrl}  http://thetestingworldapi.com/

*** Test Cases ***
TC05_Put_Request
    create session    Putrequestdata    ${baseUrl}
    #change the middle name as joy and add the id which you wanted to update
    &{body}=    create dictionary    id=417667    first_name=Testing    middle_name=joyupdatenew    last_name=Shine    date_of_birth=01/06/1990
    &{header}=    create dictionary    Content-Type=application/json
    ${responsedata}=    put request    Putrequestdata    api/studentsDetails/417667    data=${body}    headers=${header}
    log to console    ${responsedata.status_code}
    ${statuscode}=    convert to string    ${responsedata.status_code}
    should be equal    ${statuscode}    200
    log to console    ${responsedata.content}
    #get the request
    ${getrequestdata}=  get on session    Putrequestdata    api/studentsDetails/417614
    log to console    ${getrequestdata.content}







