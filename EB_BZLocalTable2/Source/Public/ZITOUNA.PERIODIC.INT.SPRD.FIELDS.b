* @ValidationCode : MjotMTk3MTY1NDIxODpDcDEyNTI6MTYwMDU2MDE0NTE1MjpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjIwX1NQNC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:02:25
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R20_SP4.0
*-----------------------------------------------------------------------------
* <Rating>-10</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE ZITOUNA.PERIODIC.INT.SPRD.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* Template for field definitions routine YOURAPPLICATION.FIELDS
*
* tmoursli
* </doc>
*-----------------------------------------------------------------------------
* Modification History :
* 22/12/2009
*ZIT-UPG-R13-R19  : NO CHANGES
* *-----------------------------------------------------------------------------
*** <region name= Header>
*** <desc>Inserts and control logic</desc>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
*** </region>
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("REF.CCY.COND",EB.Template.T24String:T24);* Define Table id
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("DESCRIPTION", "35", "A", "")
    EB.Template.TableAddamountfield("BID.TOLERANCE", "", "", "")
    EB.Template.TableAddamountfield("OFFER.TOLERANCE", "", "", "")
    EB.Template.TableAddfielddefinition("REST.PERIOD", "4", "A", "")
    EB.Template.TableAddamountfield("MONTANT", "", "", "")
    EB.Template.TableAddamountfield("BID.INT.SPRD", "", "", "")
    EB.Template.TableAddamountfield("OFFER.INT.SPRD", "", "", "")
 
*   CALL Field.setCheckFile(fileName)        ;* Use DEFAULT.ENRICH from SS or just field 1
*    CALL Table.addField(fieldName, fieldLength, fieldType, neighbour) ;* Add a new field
*    CALL Table.addFieldWithEbLookup(fieldName,virtualTableName,neighbour) ;* Specify Lookup values
*    CALL Field.setDefault(defaultValue) ;* Assign default value
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition() ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
