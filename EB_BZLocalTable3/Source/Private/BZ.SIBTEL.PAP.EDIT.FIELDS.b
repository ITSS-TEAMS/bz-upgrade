* @ValidationCode : MjoxOTQzNDI5NTM6Q3AxMjUyOjE2MDA1NjI3NTQyMDU6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIyMF9TUDQuMDotMTotMQ==
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
SUBROUTINE BZ.SIBTEL.PAP.EDIT.FIELDS
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
*-----------------------
*ZIT-UPG-R13-R19  : FM CHANGED TO @FM
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
    EB.Template.TableAddfielddefinition("SENS","1", "A", "")

    EB.Template.TableAddfielddefinition("CODE.VALEUR","2", "A", "")

    EB.Template.TableAddfielddefinition("NATURE.REMETTANT", "1","","")

    EB.Template.TableAddfielddefinition("CODE.REMETTANT", "2","","")

    EB.Template.TableAddfielddefinition("CODE.CENTRE.REG", "3","","")

    EB.Template.TableAddfielddefinition("DATE.OPERATION", "8","D","")

    EB.Template.TableAddfielddefinition("NUM.LOT", "4","","")

    EB.Template.TableAddfielddefinition("CODE.ENREG", "2","","")

    EB.Template.TableAddfielddefinition("CODE.DEVISE","3","A","")

    EB.Template.TableAddfielddefinition("MNT.CHEQUE","15","AMT","")

    EB.Template.TableAddfielddefinition("NUM.CHEQUE", "7","","")

    EB.Template.TableAddfielddefinition("RIB.TIREUR", "20","A","")

    EB.Template.TableAddfielddefinition("CODE.DEST", "2","A","")

    EB.Template.TableAddfielddefinition("CODE.CENTRE.DEST", "3","","")

    EB.Template.TableAddfielddefinition("RIB.BENEF", "20","A","")

    EB.Template.TableAddfielddefinition("DATE.EMISSION", "8","D","")

    EB.Template.TableAddfielddefinition("LIEU.EMISSION", "1","","")

    EB.Template.TableAddfielddefinition("DATE.ETAB.PAP", "8","D","")

    EB.Template.TableAddfielddefinition("NUM.PAP", "4","","")

    EB.Template.TableAddfielddefinition("MOTIF.1", "2","A","")

    EB.Template.TableAddfielddefinition("MOTIF.2", "2","A","")

    EB.Template.TableAddfielddefinition("MOTIF.3", "2","A","")

    EB.Template.TableAddfielddefinition("MOTIF.4", "2","A","")

    EB.Template.TableAddfielddefinition("NBR.COMP.ENREG", "2","","")

    EB.Template.TableAddfielddefinition("DATE.CHARG", "8","D","")

    EB.Template.TableAddfielddefinition("REF.FICHIER", "60","A","")

    EB.Template.TableAddfielddefinition("CODE.AGENCE", "4","A","")

    EB.Template.TableAddfielddefinition("NUM.COMPTE", "10","A","")

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
