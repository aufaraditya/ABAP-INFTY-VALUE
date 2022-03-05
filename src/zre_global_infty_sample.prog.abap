*&---------------------------------------------------------------------*
*& Report zre_global_infty_sample
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT zre_global_infty_sample.


DATA infotype_1s   TYPE TABLE OF p0001.
DATA msg TYPE string.

CONSTANTS org_asgn_infty(4) VALUE '0001'.



zcl_infty_data=>get_data(
  EXPORTING
    pernr        = '10'
    infotype     = org_asgn_infty
  IMPORTING
    infotype_val = infotype_1s "Can be multiple rows especially for infotype with many subtypes
    error_msg    = msg ).


LOOP AT infotype_1s INTO DATA(infotype_1).

  WRITE:/ infotype_1-persg,
          infotype_1-persk,
          infotype_1-werks,
          infotype_1-plans.
ENDLOOP.
