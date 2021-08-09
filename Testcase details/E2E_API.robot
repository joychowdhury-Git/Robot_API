# Add new resource
#update resource
#validate updation
#delete resource
#validate resource delete or not
*** Settings ***
Library    RequestsLibrary
Library     JSONLibrary
Library     Collections
Resource    ./../ResourceFile/resource.robot

*** Test Cases ***
TC01_E2E testcaswe
    #post the request details
    create session    E2E    ${baseUrl}
    &{body}=    create dictionary    first_name=${original_firstname}    middle_name=World    last_name=Shine    date_of_birth=01/06/1990
    &{header}=    create dictionary    Content-Type=application/json
    ${post_response}=  post request    E2E    api/studentsDetails    data=${body}    headers=${header}
    ${actualcode}   convert to string    ${post_response.status_code}
    log to console    ${actualcode}
    should be equal  ${actualcode}    201
    log to console    ${post_response.content}
    ${json_response}=    to json    ${post_response.content}
    @{id_list}=    get value from json    ${json_response}    id
    ${id}=    get from list    ${id_list}  0
    log to console    ${id}

    #put data
    Put request data  ${id}  ${header}
    #get data
    Get details and validate  ${id}
    #delete response
    Delete request data    ${id}







