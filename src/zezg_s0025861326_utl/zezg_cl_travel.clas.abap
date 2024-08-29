CLASS zezg_cl_travel DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZEZG_CL_TRAVEL IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.

    DATA lt_data TYPE TABLE OF zezg_t001.

    DELETE FROM zezg_t001.

    INSERT zezg_t001 FROM ( SELECT travel_id, description, total_price, currency_code ,
    CASE status
           WHEN 'N' THEN 'O'
           WHEN 'P' THEN 'O'
           WHEN 'B' THEN 'A'
           ELSE 'X'
           END AS status FROM /dmo/travel ).


  ENDMETHOD.
ENDCLASS.
