* @ValidationCode : MjotMTk0ODA1NDQ3NzpDcDEyNTI6MTYwMDU2Mjc1NDY1MDpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjIwX1NQNC4wOi0xOi0x
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
SUBROUTINE BZ.TUNEPS.CONTRAT.FIELDS

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
* Modification History :
*ZITUNA-UPG-R13-R19 :  removed BP's and changed INCLUDE to INSERT
*                      FM converted to @FM
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
    EB.Template.TableDefineid("ID", "" : @FM : "25" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("HEURE.RECU", "19","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("CODE.RESULTAT", "4","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("MESSAGE.RESULTAT", "2000","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("ID.TRANSMISSION", "20","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("NOM.CONTRAT", "300","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("NUM.CONTRAT", "15","A","")
    EB.Template.TableAddfielddefinition("NUM.NOTICE", "15","A","")
    EB.Template.TableAddfielddefinition("NUM.SEQ.CONTRAT", "2","A","")
    EB.Template.TableAddfielddefinition("RAISON.SOCIALE", "200","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("NUM.RC", "10","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("NOM.AO", "200","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("NUM.AO", "15","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("NUM.SEQ.AO", "2","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("NOM.ACHETEUR", "50","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("NUM.TUNEPS", "20","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("MONTANT.CONTRAT", "10","AMT" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("MONTANT.LETTRE", "100","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("DELAIS.ANS", "3","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("DELAIS.MOIS", "2","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("DELAIS.JOURS", "2","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("XX<NUM.PJ", "2","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("XX-TITRE.PJ", "100","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("XX-NOM.PJ", "200","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("XX>CHEMIN.PJ", "500","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("REF.CAUTION", "25","A","")
    EB.Template.TableAddfielddefinition("ID.CUSTOMER", "15","A","")

**RESERVED
    EB.Template.TableAddfielddefinition("CODE.ACHETEUR", "20","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("DATE.TIT.MARCHE", "12","D","")
    EB.Template.TableAddfielddefinition("DEVISE", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.4", "10","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("RESERVED.5", "10","A" : @FM :"" : @FM :"NOINPUT", "")

*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
