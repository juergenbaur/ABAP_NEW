CLASS zju_cl_abap_filter DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES t_fh TYPE STANDARD TABLE OF /dmo/agency WITH NON-UNIQUE KEY agency_id.

    INTERFACES if_oo_adt_classrun_out .
    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.

    METHODS filter_by_key
      RETURNING VALUE(rt_result) TYPE t_fh.
    METHODS filter_by_tab
      RETURNING VALUE(rt_result) TYPE t_fh.

  PRIVATE SECTION.
    DATA lt_agency     TYPE STANDARD TABLE OF /dmo/agency WITH NON-UNIQUE SORTED KEY country_code COMPONENTS country_code.
    DATA lt_agency_fh  TYPE STANDARD TABLE OF /dmo/agency.

ENDCLASS.



CLASS ZJU_CL_ABAP_FILTER IMPLEMENTATION.


  METHOD filter_by_key.
    SELECT * FROM /dmo/agency INTO TABLE @lt_agency.

    rt_result = FILTER #( lt_agency USING KEY country_code WHERE country_code = 'US ' ).
*    cl_demo_output=>display( lt_agency_fh ).


  ENDMETHOD.


  METHOD filter_by_tab.
    DATA filter_tab TYPE SORTED TABLE OF /dmo/agency-country_code WITH UNIQUE KEY table_line.

    filter_tab = VALUE #( ( 'US ' ) ( 'DE ' ) ).

    SELECT * FROM /dmo/agency INTO TABLE @lt_agency.

    rt_result = FILTER #( lt_agency IN filter_tab WHERE country_code = table_line ).

  ENDMETHOD.


  METHOD if_oo_adt_classrun_out~get.
  ENDMETHOD.


  METHOD if_oo_adt_classrun_out~write.
  ENDMETHOD.


  METHOD if_oo_adt_classrun~main.

    DATA(filter_by_key) = filter_by_key( ).
    out->write( 'filter_by_key' ).
    out->write( filter_by_key ).

    DATA(filter_by_tab) = filter_by_tab( ).
    out->write( 'filter_by_tab' ).
    out->write( filter_by_tab ).
  ENDMETHOD.
ENDCLASS.
