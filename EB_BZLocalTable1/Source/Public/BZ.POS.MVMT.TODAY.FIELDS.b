* @ValidationCode : MjotMTcwNzUyNDEyOkNwMTI1MjoxNjAwNDc5MjI2NDE0OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:33:46
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
SUBROUTINE BZ.POS.MVMT.TODAY.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author fehmi bounouara
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History:
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Converted FM to @FM
*-----------------------------------------------------------------------------
*** <region name= Header>
*** <desc>Inserts and control logic</desc>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
*** </region>

    EB.Template.TableDefineid("ID", "" : @FM : "30" : @FM : "A")

    EB.Template.TableAddfielddefinition("DEVISE", "3", "A", "")
    EB.Template.TableAddfielddefinition("DATE.POSITION", "8", "D", "")

    EB.Template.TableAddfielddefinition("OPEN.BALANCE", "19", "AMT", "")
    EB.Template.TableAddfielddefinition("REVAL.VEILLE", "10", "A", "")
    EB.Template.TableAddfielddefinition("OPEN.BALANCE.LCY", "19", "AMT", "")

    EB.Template.TableAddfielddefinition("ACHAT", "19", "AMT", "")
    EB.Template.TableAddfielddefinition("ACHAT.LCY", "19", "AMT", "")

    EB.Template.TableAddfielddefinition("VENTE", "19", "AMT", "")
    EB.Template.TableAddfielddefinition("VENTE.LCY", "19", "AMT", "")

    EB.Template.TableAddfielddefinition("TXN.EOD", "19", "AMT", "")
    EB.Template.TableAddfielddefinition("TXN.EOD.LCY", "19", "AMT", "")

    EB.Template.TableAddfielddefinition("POSITION.FINAL", "19", "AMT", "")
    EB.Template.TableAddfielddefinition("REVAL", "10", "A", "")
    EB.Template.TableAddfielddefinition("POSITION.FINAL.LCY", "19", "AMT", "")

    EB.Template.TableAddfielddefinition("RESULTAT", "19", "AMT", "")

    EB.Template.TableAddfielddefinition("POUR.FP", "10", "A", "")

    EB.Template.TableAddfielddefinition("RANK", "30", "", "")
    EB.Template.TableAddfielddefinition("POS.FINAL.NEW", "19", "AMT", "")
    EB.Template.TableAddfielddefinition("RESULTAT.NEW", "19", "AMT", "")
    EB.Template.TableAddfielddefinition("POUR.FP.NEW", "10", "A", "")
    EB.Template.TableAddfielddefinition("RESSERVED.5", "30", "A", "")


*-----------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
