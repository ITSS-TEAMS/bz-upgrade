* @ValidationCode : MjoxMTQ0Nzc4NDAyOkNwMTI1MjoxNjAwNDc5Mjk1MDYyOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:34:55
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
SUBROUTINE BZ.SM.COMMERCANT.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author Bounouara fehmi
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
*----------------------------------------------------------------------
* Modification History :

*ZIT-UPG-R13-R19 : FM CHANGED TO @FM
*----------------------------------------------------------------------

*** <region name= Header>
*** <desc>Inserts and control logic</desc>
*ZIT-UPG-R13-R19/S
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;

    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
*ZIT-UPG-R13-R19/E
*** </region>

*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "10" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("COMPTE", "12","A","")
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("COMM.ACHAT", "10","A","")
    EB.Template.TableAddfielddefinition("CODE.CLIENT", "10","A":@FM:"":@FM:"NOINPUT","")
    EB.Template.FieldSetcheckfile("CUSTOMER")
    EB.Template.TableAddfielddefinition("TYPE.AFFILIATION", "1","A","")
    EB.Template.FieldSetcheckfile("BZ.SM.TYPE.AFFILIATION")
    EB.Template.TableAddfielddefinition("TAUX.VISA", "8","A","")
    EB.Template.TableAddfielddefinition("TAUX.MCD", "8","A","")
    EB.Template.TableAddfielddefinition("MONTANT.LOCATION", "8",AMT,"")
    EB.Template.TableAddfielddefinition("CODE.MMC", "8","A","")
    EB.Template.TableAddfielddefinition("ACTIVE", "3","":@FM:"YES_NO","")
    EB.Template.TableAddfielddefinition("COMPTE.INACTIVE", "12","A","")
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("COMPTE.TECHNIQUE", "12","A","")
    EB.Template.FieldSetcheckfile("ACCOUNT")

*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
