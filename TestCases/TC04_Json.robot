*** Settings ***
Documentation    Suite description
Library   JSONLibrary
Library  os
Library  Collections

*** Test Cases ***
TestCase1
    ${json_obj}=    load json from file    /home/carolina/Documents/automacao/Rest-API-Testing-using-Robot-Framework-Python/json/teste.json
    ${name_value}=  get value from json   ${json_obj}   $.FirstName
    ${Last_value}=  get value from json   ${json_obj}   $.LastName

    log to console   ${name_value[0]}
    log to console   ${last_value[0]}

    should be equal   ${name_value[0]}  Carol4
    should be equal   ${last_value[0]}  Mesquita4