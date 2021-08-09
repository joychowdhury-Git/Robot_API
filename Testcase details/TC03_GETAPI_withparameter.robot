*** Settings ***
Library    RequestsLibrary
Library    JSONLibrary
Library    Collections


*** Variables ***
${baseUrl}  https://reqres.in

*** Test Cases ***
TC003_validate get request with parameter
    create session    Getparameter    ${baseUrl}
    &{parameters}=  create dictionary    page=2
    #for parameter we are sending params
    ${responsedata}=  get on session    Getparameter   api/users    params=${parameters}
    #log to console    ${responsedata.content}
   # log to console    ${responsedata.status_code}
    ${actualcode}=  convert to string    ${responsedata.status_code}
    should be equal    ${actualcode}    200
    ${jsonresponse}=    to json    ${responsedata.content}
    @{valuefromjson}=   get value from json    ${jsonresponse}  data[0].first_name
    log to console    @{valuefromjson}
    ${firstname}=   get from list    ${valuefromjson}   0
    should be equal   ${firstname}  Michael



