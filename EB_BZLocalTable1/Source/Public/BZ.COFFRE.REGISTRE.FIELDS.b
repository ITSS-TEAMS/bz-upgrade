* @ValidationCode : MjotMTAyMjMzMDEyMDpDcDEyNTI6MTYwMDQ3ODk4MDY5MzpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE5X0FNUi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:29:40
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
*Modification History:

*ZIT-UPG-R13-R19: FM CHANGED TO @FM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.COFFRE.REGISTRE.FIELDS

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
    EB.Template.TableDefineid("ID", EB.Template.T24Numeric : @FM : "8")
*-----------------------------------------------------------------------------
*******
    EB.Template.TableAddfielddefinition("TYPE", "2.1", "","")
    EB.Template.FieldSetcheckfile("BZ.COFFRE.TYPE")

    EB.Template.TableAddfielddefinition("AGENCE", "4.4", "","")
    EB.Template.FieldSetcheckfile("DEPT.ACCT.OFFICER")

    EB.Template.TableAddfielddefinition("NUMERO", "004.4", "","")

    EB.Template.TableAddfielddefinition("STATUT", "2.1", "","")
    EB.Template.FieldSetcheckfile("BZ.COFFRE.STATUT")

    EB.Template.TableAddfield("DATE.CREATION",EB.Template.T24Date,EB.Template.FieldMandatory,"")


*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
