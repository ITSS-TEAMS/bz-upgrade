* @ValidationCode : MjoyMDQxNDI1Njk5OkNwMTI1MjoxNjAwNDc4OTg2MTE1OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:29:46
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
SUBROUTINE BZ.COMITE.RISQUE.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* Template for field definitions routine YOURAPPLICATION.FIELDS
*
* @author aelidrissi@temenos.com
* @stereotype H
* </doc>
*-----------------------------------------------------------------------------
* Modification History :
*
* 19/11/09 - aelidrissi   New Template changes
*ZIT-UPG-R13-R19  : FM CHANGED TO @FM
*-----------------------------------------------------------------------------
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
    EB.Template.TableDefineid("ID", EB.Template.T24Numeric : @FM : "10") ;* Define Table id
*-----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("ANCIEN.CLS.RISQ", "4", "", "")
    EB.Template.FieldSetcheckfile("CUSTOMER.STATUS")
    EB.Template.TableAddfielddefinition("NOUV.CLS.RISQ", "4", "", "")
    EB.Template.FieldSetcheckfile("CUSTOMER.STATUS")
    EB.Template.TableAddfield("DATE.MODIF", EB.Template.T24Date, "", "")
    EB.Template.TableAddfielddefinition("XX.MOTIF.MODIF", "50", "A", "")
    EB.Template.TableAddfield("DATE.COMITE", EB.Template.T24Date, "", "")
    EB.Template.TableAddfielddefinition("MODIFIE.PAR", "35", "A", "")
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition() ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
