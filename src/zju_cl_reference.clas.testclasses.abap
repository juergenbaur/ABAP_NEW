CLASS test DEFINITION FINAL FOR TESTING
  DURATION MEDIUM
  RISK LEVEL HARMLESS.

  PRIVATE SECTION.
    METHODS:
      ref_test FOR TESTING RAISING cx_static_check,
      any_test   FOR TESTING RAISING cx_static_check.
ENDCLASS.


CLASS test IMPLEMENTATION.

  METHOD ref_test.

    DATA lv_field TYPE c VALUE 'A'.
    DATA(ls_struct) = VALUE zju_if_reference=>ts_ref1( field1 = 'B' field2 = 'C' field3 = 'D'  field4 = 1 ).
    DATA(lt_table) = VALUE zju_if_reference=>tt_ref1( ( field1 = 'S' field2 = 'F' field3 = 'B'  field4 = 1 )
                                                      ( field1 = 'X' field2 = 'Y' field3 = 'Z'  field4 = 1 )   ).

    DATA(lr_inst) = NEW zju_cl_reference(  ).
    data lr_field  type ref to data.
    data lr_struct type ref to data.
    data lr_table  type ref to data.
    lr_field  = ref #( lv_field ).
    lr_struct = ref #( ls_struct ).
    lr_table  = ref #( lt_table ).

    lr_inst->changing_referece(
      CHANGING
        cv_value  = lr_field
        cv_struct = lr_struct
        ct_table  = lr_table ).

    lr_inst->set_referece(
      EXPORTING
        iv_value  = REF #( lv_field )
        iv_struct = REF #( ls_struct )
        iv_table  = REF #( lt_table ) ).

    lr_inst->get_referece(
      IMPORTING
        ev_value  = DATA(er_value)
        ev_struct = DATA(er_struct)
        ev_table  = DATA(er_table)
    ).

    ASSIGN er_value->* TO FIELD-SYMBOL(<lv_result>).
    ASSIGN er_struct->* TO FIELD-SYMBOL(<lv_struct>).
    ASSIGN er_table->* TO FIELD-SYMBOL(<lv_table>).

*    cl_abap_unit_assert=>fail( 'Implement your first test here' ).
  ENDMETHOD.

  METHOD any_test.
    DATA lv_value TYPE c VALUE 'A'.
    DATA(ls_struct) = VALUE zju_if_reference=>ts_ref1( field1 = 'B' field2 = 'C' field3 = 'D'  field4 = 1 ).
    DATA(lt_table) = VALUE zju_if_reference=>tt_ref1( ( field1 = 'S' field2 = 'F' field3 = 'B'  field4 = 1 )
                                                      ( field1 = 'X' field2 = 'Y' field3 = 'Z'  field4 = 1 )   ).
    DATA(lr_inst) = NEW zju_cl_reference(  ).
    lr_inst->set_any(
      EXPORTING
        iv_value  = lv_value
        iv_struct = ls_struct
        iv_table  = lt_table
    ).
    DATA ev_value  TYPE c.
    DATA ev_struct TYPE zju_if_reference=>ts_ref1.
    DATA et_table  TYPE zju_if_reference=>tt_ref1.
    lr_inst->get_any(
          IMPORTING
            ev_value  = ev_value
            ev_struct = ev_struct
            ev_table  = et_table
        ).
  ENDMETHOD.

ENDCLASS.
"* use this source file for your ABAP unit test classes
