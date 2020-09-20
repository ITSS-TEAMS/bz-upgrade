* @ValidationCode : MjoxMjAxNDgzNDcxOkNwMTI1MjoxNjAwNDc5MzE2MjA0OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
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
*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.SOLDE.MOYEN.FIELDS
*-----------------------------------------------------------------------------
* Modification History :
*ZITUNA-UPG-R13-R19 :  removed BP's and changed INCLUDE to INSERT
*                      FM converted to @FM
* ----------------------------------------------------------------------------

*** <region name= Header>
*** <desc>Inserts and control logic</desc>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
 
*** </region>
*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "20":@FM:"A")
*-----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("COMPTE","12", "ACC", "")
    EB.Template.TableAddfielddefinition("DEVISE","3", "CCY", "")
    EB.Template.TableAddfielddefinition("NBR.JOUS.MOIS","2", "", "")

    EB.Template.TableAddfielddefinition("XX<NBR.JOURS.DB","10", "", "")
    EB.Template.TableAddfielddefinition("XX>SOLDE.DB","19", "AMT", "")

    EB.Template.TableAddfielddefinition("XX<NBR.JOURS.CR","10", "", "")
    EB.Template.TableAddfielddefinition("XX>SOLDE.CR","19", "AMT", "")

    EB.Template.TableAddfielddefinition("SOLDE.MOYEN.DB","19", "AMT", "")
    EB.Template.TableAddfielddefinition("SOLDE.MOYEN.CR","19", "AMT", "")
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
 