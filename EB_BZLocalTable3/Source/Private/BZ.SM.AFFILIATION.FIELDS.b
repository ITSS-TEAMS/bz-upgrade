* @ValidationCode : MjotMzgyMjk1MjQ2OkNwMTI1MjoxNjAwNTYyNzU0MjgzOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
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
* <Rating>-5</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable3
SUBROUTINE BZ.SM.AFFILIATION.FIELDS
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
*ZIT-UPG-R13-R19 : Converted FM to @FM.
* ----------------------------------------------------------------------------

*** <region name= Header>
*** <desc>Inserts and control logic</desc>
* $INSERT I_COMMON - Not Used anymore;N
* $INSERT I_EQUATE - Not Used anymore;E
* $INSERT I_DataTypes - Not Used anymore;s
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*** </region>

*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "10" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("CODE.CLIENT", "10","CUS","")
    EB.Template.FieldSetcheckfile('CUSTOMER')
    EB.Template.TableAddfielddefinition("ADDRESSE", "100","A","")
    EB.Template.TableAddfielddefinition("ACCOUNT.NO", "10","ACC","")
    EB.Template.FieldSetcheckfile('ACCOUNT')
    EB.Template.TableAddfielddefinition("REPRESENT", "100","A","")
    EB.Template.TableAddfielddefinition("QUALITE", "35","A","")
    EB.Template.TableAddfielddefinition("TEL", "16","A","")
    EB.Template.TableAddfielddefinition("EMAIL", "50","A","")
    EB.Template.TableAddfielddefinition("ACTIVITE", "50","A","")
    EB.Template.TableAddfielddefinition("TYPE.COMMERCE", "35","A","")
    EB.Template.TableAddfielddefinition("CHIFFRE.AFF", "19","AMT","")
    EB.Template.TableAddfielddefinition("NBR.TPE", "4","","")

    EB.Template.TableAddfielddefinition("STATUT", "1","","")
    EB.Template.TableAddfielddefinition("DATE.CREATION", "8","D","")

    EB.Template.TableAddfielddefinition("TYPE.AFFILIATION", "1","A","")
    EB.Template.FieldSetcheckfile("BZ.SM.TYPE.AFFILIATION")

    EB.Template.TableAddfielddefinition("TYPE", "35","":@FM:"TPE_KIT","")


    EB.Template.TableAddfielddefinition("TAUX.VISA", "8","R","")
    EB.Template.TableAddfielddefinition("TAUX.MCD", "8","R","")
    EB.Template.TableAddfielddefinition("CODE.COMM", "35","A","")
    EB.Template.FieldSetcheckfile('FT.COMMISSION.TYPE')
    EB.Template.TableAddfielddefinition("CODE.MMC", "8","A","")
    EB.Template.TableAddfielddefinition("ACTIVE", "3","":@FM:"YES_NO","")

**RESERVED
    EB.Template.TableAddfielddefinition("TAUX.NATIONAL", "8","R","")
    EB.Template.TableAddfielddefinition("COMPTE.TECHNIQUE", "10","ACC","")
    EB.Template.FieldSetcheckfile('ACCOUNT')
    EB.Template.TableAddfielddefinition("MONTANT.LOCATION", "10","AMT","")
    EB.Template.TableAddfielddefinition("RESERVED.4", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.5", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.6", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.7", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.8", "10","A","")

*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
