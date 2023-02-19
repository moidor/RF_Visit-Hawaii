*** Settings ***
Documentation   Here it is the requests to test the Hawaii API
...             The database is accessible by H2
Library         Collections
Library         RequestsLibrary
Library         JSONLibrary
Library         BuiltIn

*** Variables ***
${base_url}     http://localhost:8080

*** Test Cases ***
Get every touristic Hawaiian place
    Create Session    mySession     ${base_url}
    ${response} =   Get on session     mySession      /places
#   Headers
    Log    ${response.headers}
#   Status code
    Should Be Equal As Integers    ${response.status_code}      200
    Log    ${response.status_code}
#   JSON object content
    Should Not Be Empty    ${response.content}
    Log    ${response.content}

Get a particular touristic Hawaiian place
    Create Session    mySession     ${base_url}
    ${response} =   Get on session     mySession      /places
#   Headers
    Log    ${response.headers}
#   Status code
    Should Be Equal As Integers    ${response.status_code}      200
    Log    ${response.status_code}
#   JSON object content
    Should Not Be Empty    ${response.content}
    Log    ${response.content}
#   Converting the response into a string
    ${JSON_str} =   Convert To String       ${response.content}
    Should Contain    ${JSON_str}       Makena Beach
    ${JSON_converted_response} =   To Json        ${response.content}
    ${JSON_value} =     Get Value From Json    ${JSON_converted_response}     ['_embedded']['places'][1]['name']    fail_on_empty=${True}
    Log    ${JSON_value}
    Log To Console    ${JSON_value}

Get an user by its username and password
    # Le symbole "&" sert à créer un dictionnaire
    Create Session    mySession     ${base_url}
    &{data} =   Create Dictionary  username=Chamito2    password=Nuh2
    log     ${data}
    Dictionary Should Contain Key    ${data}     username
    Dictionary Should Contain Value  ${data}     Chamito2
    log     ${data.username} # it can also be written like that : ${data}[username]

Add an user into the H2 database
    &{req_body}=    Create Dictionary    username=Chamito2    password=Nuh2
    POST       ${base_url}/api/users      json=${req_body}    expected_status=201

