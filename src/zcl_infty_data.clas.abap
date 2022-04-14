CLASS zcl_infty_data DEFINITION
  PUBLIC
  FINAL
  CREATE PRIVATE .

  PUBLIC SECTION.
  class-methods GET_DATA
    IMPORTING
        !pernr              TYPE persno
        !infotype           TYPE infty
        !subtype            TYPE subty DEFAULT '*'
        !date       TYPE datum DEFAULT sy-datum
      EXPORTING
        VALUE(infotype_val) TYPE ANY TABLE
        VALUE(error_msg) TYPE string.
  PROTECTED SECTION.
  PRIVATE SECTION.
    CLASS-DATA  object_id      TYPE objps VALUE '*'.
    CLASS-DATA  lock_indicator TYPE sprps.
    CONSTANTS  tclas_param    TYPE tclas VALUE 'A'.

  ENDCLASS.



CLASS zcl_infty_data IMPLEMENTATION.
  METHOD get_data.

    TRY.
        cl_hrpa_read_infotype=>get_instance(
          IMPORTING
            infotype_reader = DATA(infty_reader) " Reading Infotype Records
        ).
      CATCH cx_hrpa_violated_assertion INTO DATA(violated_assertion). " HR Master Data: Unfulfilled Program Condition
        error_msg = violated_assertion->get_text(  ).
    ENDTRY.

    DATA(start_date) = date.
    DATA(end_date) = date.

    TRY.
        "Read record
        infty_reader->read(
          EXPORTING
            tclas         = tclas_param
            pernr         = pernr
            infty         = infotype
            subty         = subtype
            objps         = object_id
            sprps         = lock_indicator
            begda         = start_date
            endda         = end_date
            no_auth_check = abap_true
          IMPORTING
            infotype_tab  = DATA(pre_record) "<fs_t_infotype>
            data_exists   = DATA(is_exist)
            missing_auth  = DATA(is_missing_auth)
        ).

      CATCH cx_hrpa_violated_assertion INTO violated_assertion.
        error_msg = violated_assertion->get_text(  ).
    ENDTRY.

    cl_hr_pnnnn_type_cast=>prelp_to_pnnnn_tab( "convert pre table to infotype table format
      EXPORTING
        prelp_tab = pre_record
      IMPORTING
        pnnnn_tab = infotype_val
    ).
  ENDMETHOD.

ENDCLASS.
