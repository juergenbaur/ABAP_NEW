CLASS zju_cl_abap_reference DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
    INTERFACES if_oo_adt_classrun_out .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zju_cl_abap_reference IMPLEMENTATION.


  METHOD if_oo_adt_classrun_out~get.
  ENDMETHOD.


  METHOD if_oo_adt_classrun_out~write.
  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.

    DATA(lv_int) = 1.
    DATA(o_int) = REF #( lv_int ).

    lv_int = 2.
    out->write( o_int->* ).

    o_int->* = 3.
    out->write( lv_int ).

    ASSIGN o_int->* TO FIELD-SYMBOL(<i1>).
    ASSIGN o_int->* TO FIELD-SYMBOL(<i2>).
    <i1> = 4.
    out->write( |Feld Symbol i1 && { <i1> } |  ).
    out->write( |Feld Symbol i2 && { <i2> }|  ).


  ENDMETHOD.
ENDCLASS.
