* @ValidationCode : MjozNTU1NzMwMzM6Q3AxMjUyOjE2MDA1NjI3NTM0NDc6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIyMF9TUDQuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:45:53
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
*-----------------------------------------------------------------------------
* Marwen BEN NASR
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable3
SUBROUTINE BZ.REGISTRE.CPS.VISA.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* BANQUEZITOUNA
*
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* 02 / 09/ 2011
*ZIT-UPG-R13-R19     : Converted FM to @FM.
* ----------------------------------------------------------------------------
*** <region name= Header>
*** <desc>Inserts and control logic</desc>
* $INSERT I_COMMON - Not Used anymore;N
* $INSERT I_EQUATE - Not Used anymore;E
* $INSERT I_DataTypes - Not Used anymore;s
*** </region>
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template

*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "50" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("REF.ENREG","4", "A", "")
    EB.Template.TableAddfielddefinition("NUM.LOT","4", "A", "")
    EB.Template.TableAddfielddefinition("NUM.REMISE","3", "A", "")
    EB.Template.TableAddfielddefinition("NUM.ORDRE","4", "A", "")
    EB.Template.TableAddfielddefinition("CODE.BANQUE","2", "A", "")
    EB.Template.TableAddfielddefinition("FILLER","7", "A", "")
    EB.Template.TableAddfielddefinition("CLE.LUHN","1", "A", "")
    EB.Template.TableAddfielddefinition("NUM.BORDEREAU","6", "A", "")
    EB.Template.TableAddfielddefinition("NUM.FACTURETTE","6", "A", "")
    EB.Template.TableAddfielddefinition("NUM.PORTEUR","19", "A", "")
    EB.Template.TableAddfielddefinition("ICA.PORTEUR","4", "A", "")
    EB.Template.TableAddfielddefinition("MONTANT.TRANSAC","9", "A", "")
    EB.Template.TableAddfielddefinition("HEURE.TRANSAC","4", "A", "")
    EB.Template.TableAddfielddefinition("DATE.VALIDITE","4", "A", "")
    EB.Template.TableAddfielddefinition("NUM.AUTORIS","6", "A", "")
    EB.Template.TableAddfielddefinition("DATE.ACHAT","6", "A", "")
    EB.Template.TableAddfielddefinition("MONTANT.COMPENSE","9", "A", "")
    EB.Template.TableAddfielddefinition("TYPE.TERMINAL","1", "A", "")
    EB.Template.TableAddfielddefinition("CODE.OPERATION","1", "A", "")
    EB.Template.TableAddfielddefinition("NUMERO.BATCH","3", "A", "")
    EB.Template.TableAddfielddefinition("CODE.MONNAIE","3", "A", "")
    EB.Template.TableAddfielddefinition("PROVENANCE.TRANS","1", "A", "")
    EB.Template.TableAddfielddefinition("STATUT","35", "A", "")
    EB.Template.TableAddfielddefinition("DATE.CHARGEMENT","8", "D", "")
    EB.Template.TableAddfielddefinition("REF.FICHIER","50", "A", "")
    EB.Template.TableAddfielddefinition("DATE.FICHIER","6", "D", "")
    EB.Template.TableAddfielddefinition("FILLER.2","7", "A", "")
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
