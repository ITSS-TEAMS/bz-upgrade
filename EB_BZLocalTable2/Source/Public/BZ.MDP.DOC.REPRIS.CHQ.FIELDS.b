* @ValidationCode : MjotMTg2MjU3MTQxMTpDcDEyNTI6MTYwMDQ4NDcyMDA3NjpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjIwX1NQNC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 04:05:20
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
* <Rating>-2</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE BZ.MDP.DOC.REPRIS.CHQ.FIELDS
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
*ZIT-UPG-R13-R19- FM TO @FM
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
    EB.Template.TableDefineid("ID", "" : @FM : "35" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("CODE.VALEUR", "2","ANY","")

    EB.Template.FieldSetcheckfile("BZ.MDP.TYPE.VALEUR")

    EB.Template.TableAddfielddefinition("NATURE.REMETTANT", "1","","")

    EB.Template.TableAddfielddefinition("CODE.REMETTANT", "2","","")

    EB.Template.TableAddfielddefinition("CODE.CENTRE.REG", "3","","")

    EB.Template.TableAddfielddefinition("DATE.OPERATION", "8","D","")

    EB.Template.TableAddfielddefinition("NUM.LOT", "4","","")

    EB.Template.TableAddfielddefinition("CODE.ENREG", "2","","")

*CALL Table.addFieldDefinition("CODE.ENREGISTREMENT", "2","","")

    EB.Template.TableAddfielddefinition("CODE.DEVISE","3","ANY","")



    EB.Template.TableAddamountfield("MNT.CHEQUE","15", T24_NUMERIC, "")

    EB.Template.TableAddfielddefinition("NUM.CHEQUE", "7","","")

    EB.Template.TableAddfielddefinition("RIB.TIREUR", "20","A","")

    EB.Template.TableAddfielddefinition("CODE.DEST", "2","A","")

    EB.Template.TableAddfielddefinition("CODE.CENTRE.DEST", "3","","")

    EB.Template.TableAddfielddefinition("RIB.BENEF", "20","A","")


    EB.Template.TableAddfielddefinition("DATE.EMISSION", "8","D","")

    EB.Template.TableAddfielddefinition("LIEU.EMISSION", "1","A","")

    EB.Template.TableAddfielddefinition("DATE.DOC", "8","D","")

    EB.Template.TableAddfielddefinition("NUM.DOC", "4","","")


    EB.Template.TableAddfielddefinition("CODE.DEV.POS", "3","ANY","")
*CALL Field.setCheckFile("CURRENCY")
    EB.Template.TableAddfielddefinition("RANG", "2","A","")

    EB.Template.TableAddamountfield("MNT.PROVISION","15", T24_NUMERIC, "")

    EB.Template.TableAddamountfield("MNT.REGUL.CHQ","15", T24_NUMERIC, "")

    EB.Template.TableAddamountfield("MNT.REGUL.INT","15", T24_NUMERIC, "")

    EB.Template.TableAddfielddefinition("MOTIF.REJET.1", "2","","")
    EB.Template.TableAddfielddefinition("DATE.PREAVIS", "8","D","")
    EB.Template.TableAddfielddefinition("DATE.DEL.CHQ", "8","D","")


    EB.Template.TableAddfielddefinition("MOTIF.REJET.2", "2","","")

    EB.Template.TableAddfielddefinition("MOTIF.REJET.3", "2","","")

    EB.Template.TableAddfielddefinition("MOTIF.REJET.4", "2","","")
    EB.Template.TableAddfielddefinition("FICHIER.RECU", "65","A","")
    EB.Template.TableAddfielddefinition("STATUT", "2","A","")
    EB.Template.TableAddfielddefinition("UNITE.GEST", "4","A","")
    EB.Template.FieldSetcheckfile("DEPT.ACCT.OFFICER")
    EB.Template.TableAddfielddefinition("NUM.CPT", "10","ACC","")
    EB.Template.FieldSetcheckfile("ACCOUNT")

    
*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition() ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
