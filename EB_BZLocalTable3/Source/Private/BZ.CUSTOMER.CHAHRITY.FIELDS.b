* @ValidationCode : MjoyMTA0NDM4OTcyOkNwMTI1MjoxNjAwNTYyMTkxNjcwOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:36:31
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
* <Rating>-5</Rating>
*-----------------------------------------------------------------------------
* Modification History :

*ZIT-UPG-R13-R19 : FM CHANGED TO @FM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable3
SUBROUTINE BZ.CUSTOMER.CHAHRITY.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author Bounouara fehmi
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
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
    EB.Template.TableDefineid("ID", "" : @FM : "35" : @FM : "A")
*-----------------------------------------------------------------------------
**FROM.FILE
    EB.Template.TableAddfielddefinition("NOM", "50","A","")
    EB.Template.TableAddfielddefinition("PRENOM", "50","A","")
    EB.Template.TableAddfielddefinition("GENRE", "2","A","")
    EB.Template.TableAddfielddefinition("NUM.CIN", "8","A","")
    EB.Template.TableAddfielddefinition("DATE.CIN", "8","D","")
    EB.Template.TableAddfielddefinition("DATE.NAISS", "8","D","")
    EB.Template.TableAddfielddefinition("NUM.TEL", "12","A","")
    EB.Template.TableAddfielddefinition("EMAIL", "80","A","")
    EB.Template.TableAddfielddefinition("ADRESSE", "50","A","")
    EB.Template.TableAddfielddefinition("CODE.POSTAL", "6","A","")
    EB.Template.TableAddfielddefinition("SALAIRE", "15","A","")

**CALCULATED
    EB.Template.TableAddfielddefinition("DATE.CHARGEMENT", "8","D","")
    EB.Template.TableAddfielddefinition("FICHIER.RECU", "50","A","")
    EB.Template.TableAddfielddefinition("REF.CHARGEMENT", "20","A","")
    EB.Template.TableAddfielddefinition("STATUT", "20","A","")
    EB.Template.TableAddfielddefinition("XX.ANOMALIES", "1000","A","")

    EB.Template.TableAddfielddefinition("SECTOR", "10","A","")
    EB.Template.TableAddfielddefinition("ACCOUNT.OFFICER", "10","A","")
    EB.Template.TableAddfielddefinition("OTHER.OFFICER", "10","A","")
    EB.Template.TableAddfielddefinition("INDUSTRY", "10","A","")
    EB.Template.TableAddfielddefinition("EMPLOYER.NAME", "35","A","")
    EB.Template.TableAddfielddefinition("ACTIVITE", "35","A","")
    EB.Template.TableAddfielddefinition("GOUVERNORAT", "35","A","")
    EB.Template.TableAddfielddefinition("MNEMONIC", "10","A","")
    EB.Template.TableAddfielddefinition("NOM.PRENOM", "35","A","")
**RESERVED
    EB.Template.TableAddfielddefinition("DATE.EXECUTION", "8","D","")
    EB.Template.TableAddfielddefinition("MESSAGE.OFS", "1000","A","")
    EB.Template.TableAddfielddefinition("REPONSE.OFS", "1000","A","")
    EB.Template.TableAddfielddefinition("COMPTE.DO", "10","A","")
    EB.Template.TableAddfielddefinition("MESSAGE.OFS.AC", "1000","A","")
    EB.Template.TableAddfielddefinition("REPONSE.OFS.AC", "1000","A","")
    EB.Template.TableAddfielddefinition("STATUT.AC", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.8", "10","A","")

*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
