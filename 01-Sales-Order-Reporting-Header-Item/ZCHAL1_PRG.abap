REPORT ZCHAL1_PRG.

TYPES: BEGIN OF lty_header,
       oid type ZCHAL1_DE_OID,
       cname type ZCHAL1_DE_CNAME,
       odate type ZCHAL1_DE_ODATE,
       END OF lty_header.

TYPES: BEGIN OF lty_item,
       oid type ZCHAL1_DE_OID,
       iid type ZCHAL1_DE_IID,
       pname type ZCHAL1_DE_PNAME,
       qty type ZCHAL1_DE_QTY,
       unit type MEINS,
       price type NETPR,
       curr type WAERS,
       END OF lty_item.

TYPES: BEGIN OF lty_report,
       oid TYPE ZCHAL1_DE_OID,
       cname TYPE ZCHAL1_DE_CNAME,
       pname TYPE ZCHAL1_DE_PNAME,
       total TYPE p DECIMALS 2,
       END OF lty_report.

DATA :lt_header TYPE TABLE OF lty_header,
      lt_item TYPE TABLE OF lty_item,
      lt_report TYPE TABLE OF lty_report,
      lwa_header TYPE lty_header,
      lwa_item type lty_item,
      lwa_report TYPE lty_report,
      lv_today type D,
      lv_grandTotal TYPE P DECIMALS 2 value 0.

lv_today = sy-datum.

SELECT OID CNAME ODATE from ZCHAL1_H INTO TABLE lt_header.

IF sy-subrc = 0.
  SELECT OID IID PNAME QTY UNIT PRICE CURR FROM ZCHAL1_I INTO TABLE lt_item FOR ALL ENTRIES IN lt_header WHERE OID = lt_header-oid.
ENDIF.

SELECT h~oid, h~cname, i~pname, ( i~qty * i~price ) AS total FROM ZCHAL1_H AS h INNER JOIN ZCHAL1_I AS i ON h~oid = i~oid INTO TABLE @lt_report.

WRITE: / 'Laporan Penjualan Per Tanggal:', lv_today.

LOOP AT lt_report into lwa_report.
  IF lwa_report-total => 100.
    lwa_report-total = lwa_report-total - ( lwa_report-total * 10 / 100 ).
  ENDIF.
  lv_grandTotal = lv_grandTotal + lwa_report-total.
  WRITE: / sy-tabix, lwa_report-oid, lwa_report-cname, lwa_report-pname, lwa_report-total.
ENDLOOP.

WRITE: /, /.

ULINE.
WRITE: / 'Total Seluruh Transaksi adalah: ', lv_grandTotal.
ULINE.
