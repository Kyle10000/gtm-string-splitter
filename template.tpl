___TERMS_OF_SERVICE___

By creating or modifying this file you agree to Google Tag Manager's Community
Template Gallery Developer Terms of Service available at
https://developers.google.com/tag-manager/gallery-tos (or such other URL as
Google may provide), as modified from time to time.


___INFO___

{
  "type": "MACRO",
  "id": "cvt_temp_public_id",
  "version": 1,
  "securityGroups": [],
  "displayName": "String Splitter",
  "description": "Splits a string using the specified delimiter and returns one of the array items.",
  "categories": [
    "UTILITY"
  ],
  "containerContexts": [
    "WEB"
  ]
}


___TEMPLATE_PARAMETERS___

[
  {
    "type": "TEXT",
    "name": "input",
    "displayName": "Input",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  },
  {
    "type": "RADIO",
    "name": "delimiter",
    "displayName": "Delimiter",
    "radioItems": [
      {
        "value": "|",
        "displayValue": "|"
      },
      {
        "value": "-",
        "displayValue": "-"
      },
      {
        "value": "/",
        "displayValue": "/"
      },
      {
        "value": "custom",
        "displayValue": "Custom",
        "subParams": [
          {
            "type": "TEXT",
            "name": "customDelimiter",
            "displayName": "Value",
            "simpleValueType": true
          }
        ]
      }
    ],
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_EMPTY"
      }
    ]
  },
  {
    "type": "TEXT",
    "name": "arrayPosition",
    "displayName": "Array Position to Return",
    "simpleValueType": true,
    "valueValidators": [
      {
        "type": "NON_NEGATIVE_NUMBER"
      }
    ],
    "alwaysInSummary": false,
    "help": "Remember, arrays count from 0"
  },
  {
    "type": "GROUP",
    "name": "Advanced",
    "displayName": "Advanced",
    "groupStyle": "ZIPPY_CLOSED",
    "subParams": [
      {
        "type": "CHECKBOX",
        "name": "delimiterSpaces",
        "checkboxText": "Delimiter includes spaces",
        "simpleValueType": true,
        "defaultValue": ""
      },
      {
        "type": "CHECKBOX",
        "name": "trimString",
        "checkboxText": "Trim whitespace from output",
        "simpleValueType": true,
        "defaultValue": true
      }
    ]
  }
]


___SANDBOXED_JS_FOR_WEB_TEMPLATE___

var arrayPosition = data.arrayPosition,
    delimiter = data.delimiter === "custom" ? data.customDelimiter : data.delimiter,
    delimiterSpaces = data.delimiterSpaces,
    input = data.input,
    output = '', 
    splitString= '',
    trimString = data.trimString;

// Check input has a value
  if (!input){
    return undefined;
  }

// Split the string
  if (delimiterSpaces){
    splitString = input.split(" " + delimiter + " ");
  }
  else {
    splitString = input.split(delimiter);
  }

// Check if the desired position exists within the array
if (arrayPosition >= splitString.length) {
    return undefined;
  }

//Find array to return
output = splitString[arrayPosition];

//Trim the output if reuired
return trimString ? output.trim() : output;


___TESTS___

scenarios:
- name: Undefined Input
  code: |-
    const mockData = {
      // Mocked field values
    input:undefined
    };

    // Call runCode to run the template's code.
    let variableResult = runCode(mockData);

    // Verify that the variable returns a result.
    assertThat(variableResult).isNotEqualTo(false);
- name: Array Position Doesn't Exist
  code: |-
    const mockData = {
      // Mocked field values
      input:"1|2|3",
      delimiter:"|",
      arrayPosition:3
    };

    // Call runCode to run the template's code.
    let variableResult = runCode(mockData);

    // Verify that the variable returns a result.
    assertThat(variableResult).isNotEqualTo(false);


___NOTES___

Created on 31/03/2023, 15:31:14


