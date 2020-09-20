* @ValidationCode : MjoxNzMyNTg1NDpDcDEyNTI6MTYwMDQ4NDcyMDYxOTpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjIwX1NQNC4wOi0xOi0x
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
SUBROUTINE BZ.REGISTRE.AVIS.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* AUTHOR : FEHMI BOUNOUARA

*------------------------------------------------------------------------
* Modification History :
*-----------------------

*ZIT-UPG-R13-R19 : FM TO @FM;
*-----------------------------------------------------------------------
*ZIT-UPG-R13-R19/S
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
*ZIT-UPG-R13-R19/E
*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "60" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("MAPPING.ID","20", "A", "")
    EB.Template.TableAddfielddefinition("STMT.ID","40", "A", "")

    EB.Template.TableAddfielddefinition("TYPE.AVIS","4", "A", "")
    EB.Template.FieldSetcheckfile("BZ.AVIS.TYPE")

    EB.Template.TableAddfielddefinition("NUM.CPTE","19", "A", "")
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("CODE.CLIENT","10", "A", "")
    EB.Template.FieldSetcheckfile("CUSTOMER")

    EB.Template.TableAddfielddefinition("AGENCE","4", "A", "")
    EB.Template.FieldSetcheckfile("DEPT.ACCT.OFFICER")

    EB.Template.TableAddfielddefinition("DATE.AVIS","8", "D", "")

    EB.Template.TableAddfielddefinition("DATE.CHARGEMENT","8", "D", "")

    EB.Template.TableAddfielddefinition("ZONE.1","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.2","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.3","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.4","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.5","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.6","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.7","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.8","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.9","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.10","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.11","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.12","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.13","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.14","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.15","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.16","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.17","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.18","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.19","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.20","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.21","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.22","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.23","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.24","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.25","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.26","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.27","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.28","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.29","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.30","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.31","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.32","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.33","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.34","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.35","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.36","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.37","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.38","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.39","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.40","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.41","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.42","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.43","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.44","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.45","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.46","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.47","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.48","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.49","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.50","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.51","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.52","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.53","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.54","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.55","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.56","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.57","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.58","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.59","35", "A", "")
    EB.Template.TableAddfielddefinition("ZONE.60","35", "A", "")

    EB.Template.TableAddfielddefinition("ENVOYE","10", "A", "")

    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
