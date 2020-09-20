* @ValidationCode : MjoxNTU4NDY4Mzc1OkNwMTI1MjoxNjAwNDc5MjEwMTcyOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:33:30
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R19_AMR.0
*-----------------------------------------------------------------------------
* <Rating>-4</Rating>
* Modification History :
*ZIT-UPG-R13-R19     : Converted FM to @FM.
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.MON.PREPAYEE.FIELDS
*-----------------------------------------------------------------------------
* $INSERT I_COMMON - Not Used anymore;N
* $INSERT I_EQUATE - Not Used anymore;E
* $INSERT I_DataTypes - Not Used anymore;s
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "25" : @FM : "A")
*-----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("DESCRIPTION","50","A","")
    EB.Template.TableAddfielddefinition("PLAFOND","15","AMT","")
    EB.Template.TableAddfielddefinition("DATE.CREATION","20","A","")
    EB.Template.TableAddfielddefinition("CATEGORY","35","A","")
    EB.Template.TableAddfielddefinition("DEVISE","3","A","")
    EB.Template.TableAddfielddefinition("STATUT","15","A","")
    EB.Template.TableAddfielddefinition("RESERVED1","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED2","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED3","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED4","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED5","15", "A", "")
*-----------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
