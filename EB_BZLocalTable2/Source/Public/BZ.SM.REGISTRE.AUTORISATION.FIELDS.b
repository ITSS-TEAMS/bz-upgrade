* @ValidationCode : Mjo4NDEyMjU5ODk6Q3AxMjUyOjE2MDA0ODQ3MjExOTU6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIyMF9TUDQuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 04:05:21
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
* <Rating>-7</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE BZ.SM.REGISTRE.AUTORISATION.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author T24 TEAM
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
    EB.Template.TableDefineid("ID", "" : @FM : "35" : @FM : "A") ;
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("DATE.TRAITEMENT","8", "D", "")
    EB.Template.TableAddfielddefinition("NUM.COMMERCANT","10", "", "")
    EB.Template.TableAddfielddefinition("DATE.TRANS","8", "D", "")
    EB.Template.TableAddfielddefinition("HEURE","6", "A", "")
    EB.Template.TableAddfielddefinition("NUM.CARTE","19", "A", "")
    EB.Template.TableAddfielddefinition("SERVICE.CODE","3", "A", "")

    EB.Template.TableAddfielddefinition("CODE.TRANS","2", "A", "")
* CALL Field.setCheckFile("BZ.SM.CODE.TRANSACTION")

    EB.Template.TableAddfielddefinition("SEQ.TRANS","13", "A", "")

    EB.Template.TableAddfielddefinition("MESSAGE","4", "A", "")
* CALL Field.setCheckFile("BZ.SM.MESSAGE")

    EB.Template.TableAddfielddefinition("REVERSAL.REASON","2", "A", "")
* CALL Field.setCheckFile("BZ.SM.REVERS.REASON")


    EB.Template.TableAddfielddefinition("BNQ.ACQUEREUR","4", "A", "")
* CALL Field.setCheckFile("BZ.SM.BANQ")
    EB.Template.TableAddfielddefinition("BNQ.EMETTEUR","4", "A", "")
* CALL Field.setCheckFile("BZ.SM.BANQ")
    EB.Template.TableAddfielddefinition("AUTORISATION","6", "A", "")
    EB.Template.TableAddfielddefinition("MONTANT","10", "AMT", "")
    EB.Template.TableAddfielddefinition("RESPONSE.CODE","3", "A", "")
    EB.Template.TableAddfielddefinition("INVOICE.NUMBER","10", "A", "")
    EB.Template.TableAddfielddefinition("TERM.ID","10", "A", "")
    EB.Template.TableAddfielddefinition("REF.AFFILIATION","25", "A", "")
    EB.Template.TableAddfielddefinition("COMMERCANT","25", "A", "")
    EB.Template.TableAddfielddefinition("ADRESSE","15", "A", "")
    EB.Template.TableAddfielddefinition("CODE.DEVISE","13", "A", "")
    EB.Template.TableAddfielddefinition("NATURE","1", "A", "")
*    CALL Field.setCheckFile("BZ.SM.NATURE.OP")

    EB.Template.TableAddfielddefinition("REF.AGENCE","25", "A", "")
    EB.Template.TableAddfielddefinition("REF.DAB","25", "A", "")
    EB.Template.TableAddfielddefinition("COURS.CHANGE","35", "A", "")

    EB.Template.TableAddfielddefinition("REF.FICHIER","35", "A", "")
    EB.Template.TableAddfielddefinition("STATUT","15", "A", "")
    EB.Template.TableAddfielddefinition("DATE.CHARGEMENT","8", "D", "")
    EB.Template.TableAddfielddefinition("FT.PAIEMENT","16", "A", "")

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
