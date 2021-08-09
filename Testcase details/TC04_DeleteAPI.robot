*** Settings ***
Library    RequestsLibrary
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections
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
TC04_Delete_Request
    create session    Getrequestdata    ${baseUrl}
    ${responsedata}=    delete request  Getrequestdata    api/studentsDetails/${studentid}
    ${statuscode}=  convert to string    ${responsedata.status_code}
    should be equal    ${statuscode}    200
    log to console    ${responsedata.content}
    #convert first into JSON
    ${content}=     to json  ${responsedata.content}
    #take the value from JSON
    @{contentlist}=     get value from json    ${content}   status
    #take value from list of that JSON
    ${statusvaluefromlist}=     get from list    ${contentlist}     0
    should be equal    ${statusvaluefromlist}    true




