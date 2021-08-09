*** Settings ***

Library    RequestsLibrary
Library    JSONLibrary
Library    Collections

*** Variables ***
${baseUrl}  http://thetestingworldapi.com/

*** Test Cases ***
TC05_POST_Request
    create session    Postrequestdata    ${baseUrl}

    &{body}=    create dictionary    first_name=Testing    middle_name=World    last_name=Shine    date_of_birth=01/06/1990
    &{header}=    create dictionary    Content-Type=application/json
    ${responsedata}=    post request    Postrequestdata    api/studentsDetails    data=${body}    headers=${header}
    ${statuscode}=    convert to string    ${responsedata.status_code}
    ${jsonresponse}=    to json    ${responsedata.content}
    @{studentid}=   get value from json    ${jsonresponse}  id
    ${iddetails}=    get from list    ${studentid}  0
    log to console  ${iddetails}
    log to console    @{studentid}
    should be equal    ${statuscode}    201
    log to console    ${responsedata.content}





