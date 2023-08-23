*"* use this source file for any type of declarations (class
*"* definitions, interfaces or type declarations) you need for
*"* components in the private section
CLASS lcl_local DEFINITION CREATE PRIVATE.

  PUBLIC SECTION.
    CLASS-METHODS fill_syst
      IMPORTING
        is_bapiret2 TYPE bapiret2.
  PROTECTED SECTION.

  PRIVATE SECTION.

  ENDCLASS.
