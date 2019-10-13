*** Settings ***
Documentation    Suite description

Library  RequestsLibrary
Library  Collections

*** Variables ***
${base_url}     http://restapi.demoqa.com/

*** Test Cases ***
Put_CustomerRegistration
    create session   mysession  ${base_url}

    ${body}=       create dictionary  FirstName=Carol3  LastName=Mesquita3  UserName=Carolina3  Password=1234563  Email=testeapi3ff@testeapi.com
    ${header}=     create dictionary  Content-Type=application/json
    ${response}=   post request       mysession  /customer/register   data=${body}   headers=${header}

    log to console  ${response.status_code}
    log to console  ${response.content}

    #Validations
    ${status_code}=   convert to string    ${response.status_code}
    should be equal   ${status_code}   201
    ${res_body}=  convert to string   ${response.content}
    should contain      ${res_body}   OPERATION_SUCCESS
    should contain       ${res_body}  Operation completed successfully




