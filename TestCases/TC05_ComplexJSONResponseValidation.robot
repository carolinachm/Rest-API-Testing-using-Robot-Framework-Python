*** Settings ***
Documentation    Suite description
Library   JSONLibrary
Library  os
Library  Collections
Library  RequestsLibrary

*** Variables ***
${base_url}   https://restcountries.eu

*** Test Cases ***
Get_countryInfo
    create session  mysession  ${base_url}
    ${response}=  get request  mysession   rest/v2/alpha/IN
    ${json_object}=   to json   ${response.content}

    #Single data validation
    ${country_Name}=  get value from json  ${json_object}  $.name
    log to console  ${country_Name[0]}
    should be equal  ${country_Name[0]}  India

    #Single data validation array
    ${boarder}=  get value from json  ${json_object}  $.borders[0]
    log to console  ${boarder[0]}
    should be equal  ${country_Name[0]}  India
    should be equal  ${boarder[0]}  AFG

    #Multipe data validation in array
    ${boarders}=  get value from json  ${json_object}  $.borders
    log to console  ${boarders[0]}
    should contain any   ${boarders[0]}  AFG   BGD   BTN    MMR   CHN    NPL   PAK    LKA


