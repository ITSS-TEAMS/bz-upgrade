* @ValidationCode : MjotMTY1OTk1NTMyMjpDcDEyNTI6MTYwMDU2Mjc1NDcyMjpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjIwX1NQNC4wOi0xOi0x
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
SUBROUTINE BZ.TUNEPS.FOURNISSEUR.FIELDS

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
*Modification History:
*ZIT-UPG-R13-R19:FM converted to @FM
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
    EB.Template.TableAddfielddefinition("MESSAGE.RESULTAT", "20","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("ID.TRANSMISSION", "20","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("RAISON.SOCIALE", "200","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("NUM.TUNEPS", "20","A","")
    EB.Template.TableAddfielddefinition("NOM.GERANT", "200","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("CODE.STRUCTURE", "2","A" : @FM :"" : @FM :"NOINPUT", "")
*CALL Field.setCheckFile("BZ.TUNEPS.JURIDIQUE")
    EB.Template.TableAddfielddefinition("DATE.CREATION", "19","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("ADRESSE", "100","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("CODE.POSTAL", "4","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("NUM.TEL", "20","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("NUM.FAX", "20","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("SITE.WEB", "50","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("EMAIL", "50","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("DATE.ENREG", "19","A" : @FM :"" : @FM :"NOINPUT", "")

**RESERVED
    EB.Template.TableAddfielddefinition("NOM.STUCTURE", "35","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("RESERVED.2", "10","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("RESERVED.3", "10","A" : @FM :"" : @FM :"NOINPUT", "")
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
