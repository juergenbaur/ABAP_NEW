CLASS zju_cx_static_check DEFINITION
  PUBLIC
  INHERITING FROM cx_static_check
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_t100_message .
    INTERFACES if_t100_dyn_msg .

    ALIASES msgty
      FOR if_t100_dyn_msg~msgty .

    METHODS  get_bapiret2
      RETURNING VALUE(rs_bapiret2) TYPE bapiret2.

    CLASS-METHODS  raise_bapiret2
      IMPORTING is_bapiret2 TYPE bapiret2
      RAISING   zju_cx_static_check.

    METHODS constructor
      IMPORTING
        !textid   LIKE if_t100_message=>t100key OPTIONAL
        !previous LIKE previous OPTIONAL .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zju_cx_static_check IMPLEMENTATION.


  METHOD constructor ##ADT_SUPPRESS_GENERATION.
    CALL METHOD super->constructor
      EXPORTING
        previous = previous.

    me->msgty = msgty .
    CLEAR me->textid.
    IF textid IS INITIAL.
      if_t100_message~t100key = if_t100_message=>default_textid.
    ELSE.
      if_t100_message~t100key = textid.
    ENDIF.
  ENDMETHOD.
  METHOD get_bapiret2.

    rs_bapiret2 = VALUE #( message_v1 = if_t100_dyn_msg~msgv1
                           message_v2 = if_t100_dyn_msg~msgv2
                           message_v3 = if_t100_dyn_msg~msgv3
                           message_v4 = if_t100_dyn_msg~msgv4
                           id         = if_t100_message~t100key-msgid
                           number     = if_t100_message~t100key-msgno
                           type       = msgty
                           message    = me->get_text( ) ).

  ENDMETHOD.

  METHOD raise_bapiret2.
    lcl_local=>fill_syst( is_bapiret2 ).

    RAISE EXCEPTION TYPE zju_cx_static_check
      MESSAGE ID sy-msgid
      TYPE sy-msgty
      NUMBER sy-msgno
      WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.

  ENDMETHOD.

ENDCLASS.
