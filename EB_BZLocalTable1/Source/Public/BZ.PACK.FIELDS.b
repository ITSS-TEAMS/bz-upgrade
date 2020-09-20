* @ValidationCode : Mjo4OTg4NDMyODU6Q3AxMjUyOjE2MDA0NzkyMjYyMjk6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIxOV9BTVIuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:33:46
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R19_AMR.0
*-----------------------------------------------------------------------------
* <Rating>-5</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.PACK.FIELDS
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
    EB.Template.TableDefineid("ID", "" : @FM : "16" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfield("CUSTOMER.NO", EB.Template.T24Customer, EB.Template.FieldMandatory,"")

    EB.Template.TableAddfielddefinition("PACK.TYPE", "16.1", "A", "")
    EB.Template.FieldSetcheckfile('BZ.PACK.DEFINITION')

    EB.Template.TableAddoptionsfield("FREQUENCY", "Mensuelle_Trimestrielle_Semestrielle_Annuelle", "", "")

    EB.Template.TableAddfield("EFFECTIVE.DATE", EB.Template.T24Date,EB.Template.FieldMandatory,"")

    EB.Template.TableAddfielddefinition("PACK.AMT", "19","AMT","")

    EB.Template.TableAddfield("ACCOUNT.NO", EB.Template.T24Account, "", "")
    EB.Template.TableAddfielddefinition("CARD.NO", "20", "", "")
    EB.Template.TableAddfielddefinition("TAWASSOOL.NO", "20", "A", "")
    EB.Template.FieldSetcheckfile('BZ.IB.SMS.ABONNEMENT')
    EB.Template.TableAddfielddefinition("TPE.NO", "20", "A", "")

    EB.Template.FieldSetcheckfile('BZ.SM.TPE')

    EB.Template.TableAddfield("OPENNING.DATE", EB.Template.T24Date,"","")
    EB.Template.TableAddvirtualtablefield("STATUS", "PACK.STATUS", "", "")
    EB.Template.TableAddfield("VALIDATION.DATE", EB.Template.T24Date,"","")
    EB.Template.TableAddfield("RESILIATION.DATE", EB.Template.T24Date,"","")

    EB.Template.TableAddfielddefinition("CARD.NO.OLD", "20","", "")
    EB.Template.TableAddfielddefinition("RELATED.PACK", "16","A", "")
    EB.Template.FieldSetcheckfile('BZ.PACK')

**RESERVED
    EB.Template.TableAddfielddefinition("CHARGE.KEY", "15","A","")
    EB.Template.FieldSetcheckfile('IC.CHARGE.PRODUCT')

    EB.Template.TableAddfielddefinition("RESERVED.2", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.3", "10","A","")
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
