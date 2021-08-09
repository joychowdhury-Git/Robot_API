*** Settings ***
Library    JSONLibrary
Library    RequestsLibrary
Library    Collections

*** Variables ***
${baseUrl}  http://thetestingworldapi.com/
${original_firstname}   Hello
${update_firstname}     Testing

*** Keywords ***
Get details and validate

    [Arguments]    ${id}
    ${getrequest}=    get on session    E2E    api/studentsDetails/${id}
    ${getrequest_json}=    to json    ${getrequest.content}
    @{jsonlistvalue}=    get value from json    ${getrequest_json}    data.first_name
    ${firstname}=    get from list    ${jsonlistvalue}  0
    should be equal    ${firstname}    ${update_firstname}

Put request data
    [Arguments]    ${id}    ${header}
    &{body1}=    create dictionary    id=${id}    first_name=${update_firstname}    middle_name=World    last_name=Shine    date_of_birth=01/06/1990
    ${put_response}=    put request    E2E    api/studentsDetails/${id}  data=${body1}    headers=${header}
    log to console    ${put_response.content}
    log to console    ${put_response.status_code}

Delete request data
    [Arguments]    ${id}
    ${deleterequest}=    delete request    E2E    api/studentsDetails/${id}
    ${deletejson}=    to json    ${deleterequest.content}
    @{jsondeletevalue}=    get value from json    ${deletejson}    status
    ${statusvalue}=    get from list    ${jsondeletevalue}  0
    should be equal    ${statusvalue}    true






