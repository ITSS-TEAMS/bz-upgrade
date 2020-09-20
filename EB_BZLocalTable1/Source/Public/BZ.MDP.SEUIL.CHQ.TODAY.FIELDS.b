* @ValidationCode : MjoyMDQ5ODY1NTAwOkNwMTI1MjoxNjAwNDc5MTk2OTU1OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:33:16
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
* Modification History:
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, FM to @FM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.MDP.SEUIL.CHQ.TODAY.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.

*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------

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
    EB.Template.TableDefineid("ID", "" : @FM : "12" : @FM : "A")
    EB.Template.TableAddfielddefinition("DESCRIPTION","35","A","")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("XX<SEUIL.TIME.DEB","6","A","")
    EB.Template.TableAddfielddefinition("XX-SEUIL.TIME.FIN","6","A","")
    EB.Template.TableAddfielddefinition("XX-SEUIL.NOMBRE","10","","")
    EB.Template.TableAddfielddefinition("XX>CHEQUE.DEPOSE","10","","")
*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
    EB.Template.TableAddlocalreferencefield("")
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition() ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
