* @ValidationCode : MjoyMDk1NTU5Njk4OkNwMTI1MjoxNjAwNDc5MTc2NjE1OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:32:56
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
* <Rating>-2</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.MDP.MTX.DECISION.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author ktalhaoui@temenos.com
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* 09 / 03 / 10 - ktalhaoui New Template changes
*ZIT-UPG-R13-R19     : Converted FM to @FM.
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
    EB.Template.TableDefineid("ID", "" : @FM : "10" : @FM : "A") ;* EX. CHQR0001,
*-----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("CRT.NAT.VAL","4","A","")
    EB.Template.TableAddfielddefinition("CRT.SENS", "3", "" : @FM : "IN_OUT_", "")
    EB.Template.TableAddfielddefinition("CRT.CERTIFIE", "3", "" : @FM : "YES_NO_", "")
    EB.Template.TableAddfielddefinition("CRT.INEXPLOITABLE", "3", "" : @FM : "YES_NO_", "")

    EB.Template.TableAddfielddefinition("CRT.OPPOSITION", "3", "" : @FM : "YES_NO_", "")
    EB.Template.TableAddfielddefinition("CRT.CPTE.CLOTURE", "3", "" : @FM : "YES_NO_", "")
    EB.Template.TableAddfielddefinition("CRT.VICE.FORME", "3", "" : @FM : "YES_NO_", "")

    EB.Template.TableAddfielddefinition("DSN.DOC.REJ", "8", "" : @FM : "CNP_PAP_PRV_PAP.PRV_", "")
    EB.Template.TableAddfielddefinition("DSN.BLOCAGE",  "3", "" : @FM : "YES_NO_", "")
 
*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition() ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
