* @ValidationCode : MjotMjEzNDk4MDExNjpDcDEyNTI6MTYwMDQ3OTA5NDUwMjpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE5X0FNUi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:31:34
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R19_AMR.0
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.IJARA.POST.CONCAT.FIELDS

*--------------------------------------------------------------------------------------------------------------------------------
* Company Name        : ITSS
*--------------------------------------------------------------------------------------------------------------------------------
*
* Development by      : Imthathullah A
* Development date    : 29 Jan 2018
* Subroutine type     : Template routine
* Attached to         : N/A
* Attached as         : N/A
* Description         : Fields definition
*
*--------------------------------------------------------------------------------------------------------------------------------
* Modification History:
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, FM to @FM
*--------------------------------------------------------------------------------------------------------------------------------
*
*--------------------------------------------------------------------------------------------------------------------------------

* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template

    EB.Template.TableDefineid("ID", "" : @FM : "90" : @FM : "A")
    EB.Template.FieldSetcheckfile("LD.LOANS.AND.DEPOSITS")

    EB.Template.TableAddfielddefinition("STATUS","50","":@FM:"READY.TERM.ASSIGN_TERM.ASSIGN.STARTED_TERM.ASSIGN.COMPLETE_SERVICE.FAILURE","")
    EB.Template.TableAddfielddefinition("CUSTOMER.NUMBER","19", "A", "")
    EB.Template.TableAddfielddefinition("CUSTOMER.NAME","35", "A", "")
    EB.Template.TableAddfielddefinition("CUSTOMER.ACCOUNT","19", "A", "")
    EB.Template.TableAddfielddefinition("CURRENCY","3", "A", "")
    EB.Template.TableAddfielddefinition("LOAN.TYPE","19", "A", "")
    EB.Template.TableAddfielddefinition("START.DATE","11", "D", "")
    EB.Template.TableAddfielddefinition("END.DATE","11", "D", "")
    EB.Template.TableAddfielddefinition("RESIDUAL.VALUE","19", "A", "")
    EB.Template.TableAddfielddefinition("TERM.FT","19", "A", "")
    EB.Template.TableAddfielddefinition("AGENCY","19", "A", "")
    EB.Template.FieldSetcheckfile("DEPT.ACCT.OFFICER")
    EB.Template.TableAddfielddefinition("FAILURE.REASON","60", "A", "" )

RETURN

END
