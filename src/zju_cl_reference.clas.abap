CLASS zju_cl_reference DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES zju_if_reference .
        ALIASES copy_data_to_ref
      FOR zju_if_reference~copy_data_to_ref .
    ALIASES get_referece
      FOR zju_if_reference~get_referece .
    ALIASES set_referece
      FOR zju_if_reference~set_referece .
    ALIASES changing_referece
      FOR zju_if_reference~changing_referece .
    ALIASES get_any
      FOR zju_if_reference~get_any .
    ALIASES set_any
      FOR zju_if_reference~set_any.

  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA gv_value TYPE c.
    DATA gs_struct1 TYPE zju_if_reference=>ts_ref1.
    DATA gt_table1  TYPE zju_if_reference=>tt_ref1.

ENDCLASS.



CLASS zju_cl_reference IMPLEMENTATION.


  METHOD zju_if_reference~get_referece.
    ev_value = REF #(  gv_value ).
    ev_struct = REF #( gs_struct1 ).
    ev_table = REF #( gt_table1 ).

  ENDMETHOD.


  METHOD zju_if_reference~set_referece.
* Field
    DATA lr_value    TYPE REF TO data.
    CREATE DATA lr_value TYPE c.
    FIELD-SYMBOLS <fs_value> TYPE c.
    lr_value = iv_value.
    ASSIGN lr_value->* TO <fs_value>.
    gv_value = <fs_value>.

* Structures
    DATA lr_struct          TYPE REF TO data.
    CREATE DATA lr_struct   TYPE zju_if_reference=>ts_ref1.
    FIELD-SYMBOLS <fs_ref1> TYPE zju_if_reference=>ts_ref1.
    lr_struct = iv_struct.
    ASSIGN lr_struct->* TO <fs_ref1>.
    gs_struct1 = <fs_ref1>.

* Tables
    DATA lr_table           TYPE REF TO data.
    CREATE DATA lr_table    TYPE zju_if_reference=>tt_ref1.
    FIELD-SYMBOLS <fs_table> TYPE zju_if_reference=>tt_ref1.
    lr_table = iv_table.
    ASSIGN lr_table->* TO <fs_table>.
    gt_table1 = <fs_table>.

  ENDMETHOD.

  METHOD zju_if_reference~set_any.
   gv_value = iv_value.
   gv_value = 9.
   gs_struct1 = CORRESPONDING #( iv_struct ).

   gt_table1  = CORRESPONDING #( iv_table ).

  ENDMETHOD.

  METHOD zju_if_reference~get_any.

        ev_value  =   gv_value.
        ev_struct = CORRESPONDING #( gs_struct1 ).
        ev_table =  CORRESPONDING #( gt_table1 ).

  ENDMETHOD.



  METHOD zju_if_reference~changing_referece.
    DATA lr_value    TYPE REF TO data.
    CREATE DATA lr_value TYPE c.
    FIELD-SYMBOLS <fs_value> TYPE c.
    lr_value = cv_value.
    ASSIGN lr_value->* TO <fs_value>.
    gv_value = <fs_value>.
    <fs_value> = '7'.
* Structures
    DATA lr_struct          TYPE REF TO data.
    CREATE DATA lr_struct   TYPE zju_if_reference=>ts_ref1.
    FIELD-SYMBOLS <fs_ref1> TYPE zju_if_reference=>ts_ref1.
    lr_struct = cv_struct.
    ASSIGN lr_struct->* TO <fs_ref1>.
    gs_struct1 = <fs_ref1>.
    <fs_ref1> = VALUE #( field1 = '1' field2 = '2' field3 = '3'  field4 = 4 ).

* Tables
    DATA lr_table           TYPE REF TO data.
    CREATE DATA lr_table    TYPE zju_if_reference=>tt_ref1.
    FIELD-SYMBOLS <fs_table> TYPE zju_if_reference=>tt_ref1.
    lr_table = ct_table.
    ASSIGN lr_table->* TO <fs_table>.
    gt_table1 = <fs_table>.
    <fs_table> = VALUE #( ( field1 = 'A' field2 = 'B' field3 = 'C'  field4 = 1 )
                          ( field1 = 'D' field2 = 'E' field3 = 'F'  field4 = 2 )   ).

  ENDMETHOD.

  METHOD zju_if_reference~copy_data_to_ref.
    FIELD-SYMBOLS:  <ls_data> TYPE any.
    CREATE DATA cr_data LIKE is_data.
    ASSIGN cr_data->* TO <ls_data>.
    <ls_data> = is_data.
  ENDMETHOD.

ENDCLASS.
