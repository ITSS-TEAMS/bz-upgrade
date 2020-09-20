* @ValidationCode : MjotNDkwMjczOTY6Q3AxMjUyOjE2MDA1NjAxMzgxMzU6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIyMF9TUDQuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:02:18
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
$PACKAGE EB.BZLocalTable2
SUBROUTINE EDITIQUE.PMS.RET.SOURCE.FIELDS

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
*ZIT-UPG-R13-R19 : removed BP's and changed INCLUDE to INSERT
*                  FM converted to @FM
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
    EB.Template.TableDefineid("ID", "" : @FM : "30" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("AGENCE", "25","A","")
    EB.Template.TableAddfielddefinition("RIB", "20","A","")
    EB.Template.TableAddfielddefinition("IBAN", "24","A","")
    EB.Template.TableAddfielddefinition("DESTINAIRE", "100","A","")
    EB.Template.TableAddfielddefinition("MATRICULE.FISCALE", "10","A","")
    EB.Template.TableAddfielddefinition("CODE.TVA", "3","A","")
    EB.Template.TableAddfielddefinition("CODE.CATEG", "3","A","")
    EB.Template.TableAddfielddefinition("NUM.ETAB.SECOND", "3","A","")
    EB.Template.TableAddfielddefinition("NUM.IDENTITE", "10","A","")
    EB.Template.TableAddfielddefinition("NOM.CLIENT", "35","A","")
    EB.Template.TableAddfielddefinition("ADRESSE", "100","A","")
    EB.Template.TableAddfielddefinition("MONTANT.RETENUE", "20","A","")
    EB.Template.TableAddfielddefinition("MONTANT.NET", "20","A","")
    EB.Template.TableAddfielddefinition("TYPE.NUM.IDENTITE", "55","A","")
    EB.Template.TableAddfielddefinition("CURRENCY.DECIMAL", "3","A","")
    EB.Template.TableAddfielddefinition("MONTANT.BRUT", "20","A","")
    EB.Template.TableAddfielddefinition("DATE.PROFIT", "8","D","")


**RESERVED
    EB.Template.TableAddfielddefinition("RESERVED.1", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.2", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.3", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.4", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.5", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.6", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.7", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.8", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.9", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.10", "10","A","")
*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
