REPORT ZCHAL2_PRG.

TYPES: BEGIN OF lty_matData,
      mid type ZCHAL2_DE_MID,
      mname type ZCHAL2_DE_MNAME,
      cat type ZCHAL2_DE_CAT,
      sqty type ZCHAL2_DE_SQTY,
      unit type ZCHAL2_DE_UNIT,
      minstck type ZCHAL2_DE_MINSTCK,
      status(7) TYPE C,
      END OF lty_matData.

TYPES: BEGIN OF lty_summary,
       cat type ZCHAL2_DE_CAT,
       sqty type ZCHAL2_DE_SQTY,
       END OF lty_summary.

DATA: lt_matData TYPE TABLE OF lty_matData,
      lt_temp_matData TYPE TABLE OF lty_summary,
      lwa_matData TYPE lty_matData,
      lwa_temp_matData TYPE lty_summary.

SELECT MAT_ID MAT_NAME CATEGORY STOCK_QTY UNIT MIN_STOCK FROM ZCHAL2_MATSTOCK INTO TABLE lt_matData.

LOOP at lt_matData into lwa_matData.
  CONDENSE lwa_matData-mname.
  TRANSLATE lwa_matData-cat TO UPPER CASE.
  IF lwa_matData-sqty < lwa_matData-minstck.
    lwa_matData-status = 'REORDER'.
  ELSE.
    lwa_matData-status = 'OK'.
  ENDIF.

  lwa_temp_matData-cat = lwa_matData-cat.
  lwa_temp_matData-sqty = lwa_matData-sqty.
  COLLECT lwa_temp_matData INTO lt_temp_matData.
  CLEAR lwa_temp_matData.

  WRITE: / lwa_matData-mid, lwa_matData-mname, lwa_matData-cat, lwa_matData-sqty, lwa_matData-unit, lwa_matData-minstck, lwa_matData-status.
ENDLOOP.

ULINE.
WRITE /.

LOOP AT lt_temp_matData into lwa_temp_matData.
  WRITE: / lwa_temp_matData-cat, lwa_temp_matData-sqty.
ENDLOOP.
