* @ValidationCode : MjotMTY4MzAzNzc3NjpDcDEyNTI6MTYwMDU2Mjc1NDExMDpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjIwX1NQNC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:45:54
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
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable3
SUBROUTINE BZ.SIBTEL.PAP.COMP.EDIT.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author
* @stereotype H
**
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Converted FM to @FM
*-----------------------
*
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
    EB.Template.TableDefineid("ID", "" : @FM : "45" : @FM : "A")

*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("SENS","1", "A", "")

    EB.Template.TableAddfielddefinition("CODE.VALEUR","2", "A", "")

    EB.Template.TableAddfielddefinition("NATURE.REMETTANT", "1","","")

    EB.Template.TableAddfielddefinition("CODE.REMETTANT", "2","","")

    EB.Template.TableAddfielddefinition("CODE.CENTRE.REG", "3","","")

    EB.Template.TableAddfielddefinition("DATE.OPERATION", "8","D","")

    EB.Template.TableAddfielddefinition("NUM.LOT", "4","","")

    EB.Template.TableAddfielddefinition("CODE.ENREG", "2","","")

    EB.Template.TableAddfielddefinition("CODE.DEVISE","3","A","")

    EB.Template.TableAddfielddefinition("RANG","2","","")

    EB.Template.TableAddfielddefinition("NUM.CHEQUE", "7","","")

    EB.Template.TableAddfielddefinition("RIB.TIREUR", "20","A","")

    EB.Template.TableAddfielddefinition("DATE.ETAB.PAP", "8","D","")

    EB.Template.TableAddfielddefinition("NUM.PAP", "4","","")

    EB.Template.TableAddfielddefinition("NAT.PERSONNE", "1","A","")

    EB.Template.TableAddfielddefinition("TYPE", "1","A","")

    EB.Template.TableAddfielddefinition("LEGAL.ID", "12","A","")

    EB.Template.TableAddfielddefinition("NOM.RS", "30","A","")

    EB.Template.TableAddfielddefinition("IDENTIF.RCS", "15","A","")

    EB.Template.TableAddfielddefinition("NUMERO", "5","A","")

    EB.Template.TableAddfielddefinition("NOM.RUE.AVENUE", "50","A","")

    EB.Template.TableAddfielddefinition("NUM.BP", "4","A","")

    EB.Template.TableAddfielddefinition("CODE.POSTAL", "4","A","")

    EB.Template.TableAddfielddefinition("QUALITE", "1","A","")

    EB.Template.TableAddfielddefinition("RESERVED1","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED2","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED3","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED4","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED5","10", "A", "")

*-----------------------------------------------------------------------------

    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
