"Custom shop class
SELECTION-SCREEN BEGIN OF SCREEN 0200 AS WINDOW TITLE TEXT-000.
SELECTION-SCREEN BEGIN OF BLOCK cls WITH FRAME TITLE TEXT-000.

PARAMETERS p_class  TYPE classname OBLIGATORY.
SELECTION-SCREEN COMMENT /1(79) TEXT-001 MODIF ID sc1.
SELECTION-SCREEN COMMENT /1(79) TEXT-002 MODIF ID sc1.
SELECTION-SCREEN COMMENT /1(79) TEXT-003 MODIF ID sc1.

SELECTION-SCREEN END OF BLOCK cls.
SELECTION-SCREEN END OF SCREEN 0200.

AT SELECTION-SCREEN OUTPUT.

  LOOP AT SCREEN.
    IF screen-group1 = 'SC1'.
      screen-intensified = '1'.
      MODIFY SCREEN.
    ENDIF.
  ENDLOOP.

  GET PARAMETER ID 'ASE_SHOP' FIELD DATA(ase_shop_class_name).

  IF ase_shop_class_name IS NOT INITIAL.
    CALL FUNCTION 'ZASE_SHOP_APP_0100'
      EXPORTING
        i_custom_class_name = CONV classname( ase_shop_class_name ).
  ENDIF.

AT SELECTION-SCREEN.
  CALL FUNCTION 'ZASE_SHOP_APP_0100'
    EXPORTING
      i_custom_class_name = p_class.
