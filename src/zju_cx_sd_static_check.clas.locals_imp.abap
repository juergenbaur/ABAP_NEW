*"* use this source file for the definition and implementation of
*"* local helper classes, interface definitions and type
*"* declarations
CLASS lcl_local IMPLEMENTATION.

  METHOD fill_syst.

    DATA ls_bapiret2 TYPE bapiret2.
    ls_bapiret2 = is_bapiret2.
    IF ls_bapiret2-id IS INITIAL.
      ls_bapiret2-id = if_t100_message=>default_textid-msgid.
      ls_bapiret2-number = if_t100_message=>default_textid-msgno.
      ls_bapiret2-type = 'E'.
    ENDIF.

    MESSAGE ID ls_bapiret2-id TYPE ls_bapiret2-type NUMBER ls_bapiret2-number
     WITH ls_bapiret2-message_v1 ls_bapiret2-message_v2 ls_bapiret2-message_v3 ls_bapiret2-message_v4 INTO DATA(msg).

  ENDMETHOD.

ENDCLASS.
