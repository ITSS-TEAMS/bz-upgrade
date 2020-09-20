* @ValidationCode : MjoxODA5NTM4NzA4OkNwMTI1MjoxNjAwNDc5MzY4NTE0OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:36:08
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
SUBROUTINE BZ.WU.OPERATIONS.AG.FIELDS

*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
*Modification histroy :
*ZIT-UPG-R13-R19     :  FM converted to @FM.
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
    EB.Template.TableDefineid("ID", "" : @FM : "45" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("REFERENCE", "12","A","")
    EB.Template.TableAddfielddefinition("DATE.OPERATION","8","D","")
    EB.Template.TableAddfielddefinition("MONTANT","20","A","")
    EB.Template.TableAddfielddefinition("CODE.AGENCE","4","A","")
    EB.Template.FieldSetcheckfile('DEPT.ACCT.OFFICER')
    EB.Template.TableAddfielddefinition("MTCN","10","A","")
    EB.Template.TableAddfielddefinition("TELLER.ID","4","A","")
    EB.Template.TableAddfielddefinition("BENEFICIAIRE","35","A","")
    EB.Template.TableAddfielddefinition("TYPE.PIECE","10","A","")
    EB.Template.TableAddfielddefinition("NUM.PIECE","12","A","")
    EB.Template.TableAddfielddefinition("DATE.DELIVRANCE","8","D","")




**RESERVED
    EB.Template.TableAddfielddefinition("RESERVED.1", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.2", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.3", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.4", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.5", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.6", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.7", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.8", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.9", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.10", "10","A","")
*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
