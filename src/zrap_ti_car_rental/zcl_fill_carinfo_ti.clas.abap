CLASS zcl_fill_carinfo_ti DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    interfaces if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_fill_carinfo_ti IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

  DATA: lt_cars type table of ZRAP_CAR_TI.

"read current timestamp
*GET TIME STAMP FIELD DATA(zv_tsl).

"fill internal table
lt_cars = VALUE #(

    ( model ='RAY' automaker ='KIA' model_year ='2023' class ='economy' price ='14500000' currency_code = 'KRW' transmission ='AUTO ' fuel_type ='GAS'  seats ='5' doors = '4' description = 'empty' )
    ( model ='RAY' automaker ='KIA' model_year ='2022' class ='economy' price ='13900000' currency_code = 'KRW' transmission ='AUTO ' fuel_type ='GAS'  seats ='5' doors = '4' description = 'empty' )
    ( model ='RAY' automaker ='KIA' model_year ='2023' class ='economy' price ='16500000' currency_code = 'KRW' transmission ='AUTO ' fuel_type ='HYBRID'  seats ='5' doors = '4' description = 'empty' )
    ( model ='MORNING' automaker ='KIA' model_year ='2023' class ='economy' price ='12200000' currency_code = 'KRW' transmission ='AUTO ' fuel_type ='GAS'  seats ='5' doors = '4' description = 'empty' )
    ( model ='CASPER' automaker ='HYUNDAI' model_year ='2023' class ='economy' price ='13850000' currency_code = 'KRW' transmission ='AUTO ' fuel_type ='GAS'  seats ='5' doors = '4' description = 'empty' )
).

"Delete possible entries; insert new entries
DELETE FROM ZRAP_CAR_TI.

INSERT ZRAP_CAR_TI from table @lt_cars.

"Check result in console
out->write( sy-dbcnt ).
out->write(  'DONE!' ).

  ENDMETHOD.

ENDCLASS.
