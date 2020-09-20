* @ValidationCode : MjoxNDQ5NzUyMTcyOkNwMTI1MjoxNjAwNDc5MzE2OTA0OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:35:16
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R19_AMR.0
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19  : FM CHANGES TO @FM
*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.STRUCT.SGMT.FIELDS
*-----------------------------------------------------------------------------

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
    EB.Template.TableDefineid("ID", "" : @FM : "35": @FM :"A")
*-----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("XX.HEADER","35", "ANY", "")

    EB.Template.TableAddfielddefinition("XX.XX<TAG","10", "A", "")
    EB.Template.TableAddfielddefinition("XX-XX.SOURCE.VALUE","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-XX.CONSTANT","3", "":@FM:"_YES", "")
    EB.Template.TableAddfielddefinition("XX-XX.SEPARATEUR","10", "":@FM:"_RETOUR", "")
    EB.Template.TableAddfielddefinition("XX>XX.CONVERSION","15", "":@FM:"_RIB_CPT.REG_OUR.EXCH.AC", "")
*-----------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
*-----------------------------------------------------------------------------

    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
