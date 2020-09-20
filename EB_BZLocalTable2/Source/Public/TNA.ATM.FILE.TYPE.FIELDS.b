* @ValidationCode : Mjo4ODg3MDkxOkNwMTI1MjoxNjAwNTYwMTQwOTQzOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:02:20
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R20_SP4.0
*-----------------------------------------------------------------------------
* <Rating>-2</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE TNA.ATM.FILE.TYPE.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* @author aajouad@temenos.com
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* Version Initiale 13/08/2009 -- STD 0.1 23/06/09
*ZIT-UPG-R13-R19  : FM TO @FM
* ----------------------------------------------------------------------------

*** <region name= Header>
*** <desc>Inserts and control logic</desc>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*** </region>
*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("TYPE.FILE",  "" : @FM : "12" : @FM : "A")  ;* Define Table id
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("PRECHECK.RTN","35","A","")
    EB.Template.FieldSetcheckfile("PGM.FILE")
      
    EB.Template.TableAddfielddefinition("MSG.MAP.ID.RTN","35","A","")
    EB.Template.FieldSetcheckfile("PGM.FILE")
   
    EB.Template.TableAddfielddefinition("DECRIPTION","35.1","A","")
   
    EB.Template.TableAddfielddefinition("XX<FIELD.NUM","3","","")
    EB.Template.TableAddfielddefinition("XX-FIELD.NAME","35","A","")
    EB.Template.TableAddfielddefinition("XX-FIELD.POS","3","","")
    EB.Template.TableAddfielddefinition("XX-FIELD.LEN","3","","")
    EB.Template.TableAddfielddefinition("XX>FIELD.TYPE","3","" : @FM : "CHAR_NUM_AMT_ACCT_ATM_CARD","")
   
    EB.Template.TableAddfielddefinition("FINAL.PROCESS.RTN","35","A","")
    EB.Template.FieldSetcheckfile("PGM.FILE")
   
    EB.Template.TableAddfielddefinition("FILE.NAME.PREFIX","3","A","")
*-----------------------------------------------------------------------------

    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
