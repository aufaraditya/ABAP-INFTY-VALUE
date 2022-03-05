# ABAP-INFTY-VALUE

## Description
Global Utility Class to Retrieve Infotype Data


## IMPORTING PARAMETERS

| Parameter Name  | Parameter Type | Description                                                             |
| --------------- | -------------- | ----------------------------------------------------------------------- |
| PERNR           | PERSNO         | Employee Personnel Number                                               |
| INFOTYPE        | INFTY          | Infotype Number                                                         |
| SUBTYPE         | SUBTY          | Subtype Number, Default value is `*` so all subtypes will be retrieved  |
| DATE            | DATUM          | Date period in which the data is valid                                  |


## EXPORTING PARAMETERS

| Parameter Name  | Parameter Type | Description                                                                                         |
| --------------- | -------------- | --------------------------------------------------------------------------------------------------- |
| INFOTYPE_VAL    | ANY TABLE      | Internal Table containing the infotype data with the type according to desired infotype table type  |
| ERROR_MSG       | STRING         | Error Message                                                                                       |

#### Sample Program Report contains example on how to retrieve infotype 1 data.
