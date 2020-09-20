* @ValidationCode : MjotMzI1OTU1NTA6Q3AxMjUyOjE2MDA0ODQ3MjAwMjM6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIyMF9TUDQuMDotMTotMQ==
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
* <Rating>-3</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE BZ.MDP.DOC.EMIS.CHQ.FIELDS
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
*ZIT-UPG-R13-R19-FM TO @FM
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

    EB.Template.TableAddfielddefinition("DATE.DOC", "8","D","")
    EB.Template.TableAddfielddefinition("NUM.DOC", "4","","")

    EB.Template.TableAddfielddefinition("DATE.PRES.CHQ", "8","D","")
    EB.Template.TableAddfielddefinition("DATE.PREAVIS", "8","D","")

    EB.Template.TableAddfielddefinition("DATE.CNP", "8","D","")
    EB.Template.TableAddfielddefinition("NUM.CNP", "4","","")

    EB.Template.TableAddamountfield("MNT.PROVISION","15", T24_NUMERIC, "")

    EB.Template.TableAddfielddefinition("CODE.DEV.POS", "3","ANY","")


    EB.Template.TableAddfielddefinition("MOTIF.REJET", "8","A","")

    EB.Template.TableAddamountfield("MNT.REGUL","15", T24_NUMERIC, "")

    EB.Template.TableAddamountfield("MNT.REGUL.INT","15", T24_NUMERIC, "")

*CHAMPS DE TRAITEMENT
    EB.Template.TableAddfielddefinition("XX.SIGNATAIRE", "12","ANY","")
    EB.Template.FieldSetcheckfile("CUSTOMER")

    EB.Template.TableAddfielddefinition("NATURE.PERSONNE", "4", "" : @FM : "PP_PM_AS_", "")

    EB.Template.TableAddfielddefinition("STATUT", "2", "A", "")

    EB.Template.TableAddfielddefinition("NUM.CPT","10","ANY","")
*CALL Field.setCheckFile("ACCOUNT")

    EB.Template.TableAddfielddefinition("DATE.DEL.CHQ","8","D","")

    EB.Template.TableAddfielddefinition("FT.PAI.PREAV", "20","A","")

    EB.Template.TableAddfielddefinition("FT.DEBL.PROV", "20","A","")

    EB.Template.TableAddfielddefinition("NOM.BENEF", "35","A","")

    EB.Template.TableAddfielddefinition("REF.FICHIER", "60","A","")

    EB.Template.TableAddfielddefinition("RESERVED.3", "35","A","")
    EB.Template.TableAddfielddefinition("RESERVED.2", "35","A","")
    EB.Template.TableAddfielddefinition("RESERVED.1", "35","A","")
*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition() ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
