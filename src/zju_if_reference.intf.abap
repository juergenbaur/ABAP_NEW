INTERFACE zju_if_reference
  PUBLIC .
  TYPES: BEGIN OF ts_ref1,
           field1(1) TYPE c,
           field2(1) TYPE c,
           field3(1) TYPE c,
           field4(1) TYPE n,
         END OF ts_ref1.

  TYPES: tt_ref1 TYPE STANDARD TABLE OF ts_ref1 WITH NON-UNIQUE key field1.

  TYPES: BEGIN OF ts_ref2,
           first(1)  TYPE c,
           second(1) TYPE c,
           number(1) TYPE n,
         END OF ts_ref2.

  TYPES: tt_ref2 TYPE STANDARD TABLE OF ts_ref2 WITH NON-UNIQUE key first.

  data gv_field(2) type c.

    METHODS copy_data_to_ref
    IMPORTING
      !is_data TYPE any
    CHANGING
      !cr_data TYPE REF TO data .

  METHODS set_referece
    IMPORTING
      iv_value  TYPE REF TO data
      iv_struct TYPE REF TO data
      iv_table  TYPE REF TO data.

  METHODS get_referece
    EXPORTING
      ev_value  TYPE REF TO data
      ev_struct TYPE REF TO data
      ev_table  TYPE REF TO data.

  METHODS changing_referece
    changing
      cv_value  TYPE REF TO data
      cv_struct TYPE REF TO data
      ct_table  TYPE REF TO data.

  METHODS set_any
    IMPORTING
      iv_value  TYPE any
      iv_struct TYPE any
      iv_table  TYPE any .

  METHODS get_any
    EXPORTING
      ev_value  TYPE any
      ev_struct TYPE any
      ev_table  TYPE ANY  .
ENDINTERFACE.
