*** Settings ***
Library    Collections
Library    RequestsLibrary

*** Variables ***
${base_url}     https://rahulshettyacademy.com

*** Test Cases ***
Play around with dictionary
# Le symbole "&" sert à créer un dictionnaire
    &{data} =   Create Dictionary  name=rahulshetty    course=robot    website=rahulshettyacademy.com
    log     ${data}
    Dictionary Should Contain Key   ${data}     name
    log     ${data}[name]

Add book into library database
    &{req_body}=    Create Dictionary    name=RobotFramework    isbn=984353     aisle=324353
    POST       ${base_url}/Library/Addbook.php      json=${req_body}    expected_status=200

