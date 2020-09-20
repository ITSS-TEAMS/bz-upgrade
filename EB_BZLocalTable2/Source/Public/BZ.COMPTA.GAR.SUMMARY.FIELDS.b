* @ValidationCode : MjoxNjIyMzk1NTIyOkNwMTI1MjoxNjAwNDg0NzE4OTM3OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 04:05:18
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
* <Rating>-13</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE BZ.COMPTA.GAR.SUMMARY.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* Field definition de l'application comptabilisation des garanties
* @author hicham.atoui@targa-consult.com
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* ZIT-UPG-R13-R19 : Converted FM to @FM.
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
*  CALL Table.defineId("ID", T24_String)         ;* Define Table id
    EB.Template.TableDefineid("ID.GAR.SUM", "" : @FM : "20" : @FM : "A")      ;* Define Table id
*-----------------------------------------------------------------------------


    EB.Template.TableAddfielddefinition("CUSTOMER", "10", "ANY", "")
    EB.Template.FieldSetcheckfile("CUSTOMER")

    EB.Template.TableAddamountfield("GAR.NIVEAU1", "15","", "")
    EB.Template.TableAddfielddefinition("CPTE.NIVEAU1", "15", "ANY", "")
*   CALL Field.setCheckFile("ACCOUNT")
    EB.Template.TableAddfielddefinition("TXN.COMPTA.NIV1","35", "A", "")
    EB.Template.TableAddfielddefinition("TXN.LIB.NIV1","35", "A", "")

    EB.Template.TableAddamountfield("GAR.NIVEAU2", "15","", "")
    EB.Template.TableAddfielddefinition("CPTE.NIVEAU2", "15", "ANY", "")
*   CALL Field.setCheckFile("ACCOUNT")
    EB.Template.TableAddfielddefinition("TXN.COMPTA.NIV2","35", "A", "")
    EB.Template.TableAddfielddefinition("TXN.LIB.NIV2","35", "A", "")

    EB.Template.TableAddamountfield("GAR.NIVEAU3", "15","", "")
    EB.Template.TableAddfielddefinition("CPTE.NIVEAU3", "15", "ANY", "")
*   CALL Field.setCheckFile("ACCOUNT")
    EB.Template.TableAddfielddefinition("TXN.COMPTA.NIV3","35", "A", "")
    EB.Template.TableAddfielddefinition("TXN.LIB.NIV3","35", "A", "")

    EB.Template.TableAddamountfield("GAR.NIVEAU4", "15","", "")
    EB.Template.TableAddfielddefinition("CPTE.NIVEAU4", "15", "ANY", "")
*   CALL Field.setCheckFile("ACCOUNT")
    EB.Template.TableAddfielddefinition("TXN.COMPTA.NIV4","35", "A", "")
    EB.Template.TableAddfielddefinition("TXN.LIB.NIV4","35", "A", "")

    EB.Template.TableAddamountfield("GAR.NIVEAU5", "15","", "")
    EB.Template.TableAddfielddefinition("CPTE.NIVEAU5", "15", "ANY", "")
*   CALL Field.setCheckFile("ACCOUNT")
    EB.Template.TableAddfielddefinition("TXN.COMPTA.NIV5","35", "A", "")
    EB.Template.TableAddfielddefinition("TXN.LIB.NIV5","35", "A", "")

    EB.Template.TableAddamountfield("GAR.NIVEAU6", "15","", "")
    EB.Template.TableAddfielddefinition("CPTE.NIVEAU6", "15", "ANY", "")
*   CALL Field.setCheckFile("ACCOUNT")
    EB.Template.TableAddfielddefinition("TXN.COMPTA.NIV6","35", "A", "")
    EB.Template.TableAddfielddefinition("TXN.LIB.NIV6","35", "A", "")

    EB.Template.TableAddamountfield("GAR.NIVEAU7", "15","", "")
    EB.Template.TableAddfielddefinition("CPTE.NIVEAU7", "15", "ANY", "")
*   CALL Field.setCheckFile("ACCOUNT")
    EB.Template.TableAddfielddefinition("TXN.COMPTA.NIV7","35", "A", "")
    EB.Template.TableAddfielddefinition("TXN.LIB.NIV7","35", "A", "")

    EB.Template.TableAddamountfield("GAR.NIVEAU8", "15","", "")
    EB.Template.TableAddfielddefinition("CPTE.NIVEAU8", "15", "ANY", "")
*   CALL Field.setCheckFile("ACCOUNT")
    EB.Template.TableAddfielddefinition("TXN.COMPTA.NIV8","35", "A", "")
    EB.Template.TableAddfielddefinition("TXN.LIB.NIV8","35", "A", "")


    EB.Template.TableAddamountfield("GAR.NIVEAU9", "15","", "")
    EB.Template.TableAddfielddefinition("CPTE.NIVEAU9", "15", "ANY", "")
*   CALL Field.setCheckFile("ACCOUNT")
    EB.Template.TableAddfielddefinition("TXN.COMPTA.NIV9","35", "A", "")
    EB.Template.TableAddfielddefinition("TXN.LIB.NIV9","35", "A", "")

    EB.Template.TableAddamountfield("GAR.NIVEAU10", "15","", "")
    EB.Template.TableAddfielddefinition("CPTE.NIVEAU10", "15", "ANY", "")
*   CALL Field.setCheckFile("ACCOUNT")
    EB.Template.TableAddfielddefinition("TXN.COMPTA.NIV10","35", "A", "")
    EB.Template.TableAddfielddefinition("TXN.LIB.NIV10","35", "A", "")


    EB.Template.TableAddamountfield("GAR.NIVEAU11", "15","", "")
    EB.Template.TableAddfielddefinition("CPTE.NIVEAU11", "15", "ANY", "")
*   CALL Field.setCheckFile("ACCOUNT")
    EB.Template.TableAddfielddefinition("TXN.COMPTA.NIV11","35", "A", "")
    EB.Template.TableAddfielddefinition("TXN.LIB.NIV11","35", "A", "")




    EB.Template.TableAddfielddefinition("DATE.CREATION","8","D","")



*-----------------------------------------------------------------------------

    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
