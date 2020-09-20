* @ValidationCode : MjoyMDMwMTg1MTI2OkNwMTI1MjoxNjAwNDc5MDk0MTg1OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:31:34
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
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.IB.SMS.ABONNEMENT.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @DEVT24@BANQUEZITOUNA
*
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* 08 / 07 / 2010
* Modification History:
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, FM TO @FM
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

    EB.Template.TableAddfielddefinition("ABONNE","35", "A", "")
    EB.Template.FieldSetcheckfile("CUSTOMER")

    EB.Template.TableAddfielddefinition("TYPE.PACK","16", "A", "")
    EB.Template.FieldSetcheckfile("BZ.IB.SMS.PACK.DEF")

    EB.Template.TableAddfielddefinition("CPT.FACTURATION","16", "A", "")
    EB.Template.FieldSetcheckfile("ACCOUNT")

    EB.Template.TableAddfielddefinition("DATE.ACTIVATION", "8","D","")
    EB.Template.TableAddfielddefinition("DATE.FACTURATION", "8","D","")
    EB.Template.TableAddfielddefinition("DATE.ABONNEMENT", "8","D","")
    EB.Template.TableAddfielddefinition("DATE.DERN.FACT", "8","D","")
    EB.Template.TableAddfielddefinition("REF.DER.FACT", "35","A","")

    EB.Template.TableAddfielddefinition("PERIODICITE","14", "A", "")

    EB.Template.TableAddfielddefinition("STATUT","14", "" : @FM : "ACTIF_RESILIE", "")


    EB.Template.TableAddfielddefinition("DATE.RESILIATION", "8","D","")
    EB.Template.TableAddfielddefinition("CHARGE.WAIVE","3", "" : @FM : "NO_YES", "")
    EB.Template.TableAddfielddefinition("OFS.REF","40", "A", "")

*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition('DATE.DERN.ANNIV', "8","D","")
    EB.Template.TableAddfielddefinition('REF.PACK', "20","A","")
    EB.Template.TableAddfielddefinition("CHARGE.WAIVE.PACK","3", "" : @FM : "NO_YES", "")
    EB.Template.TableAddreservedfield('RESERVED.4')
    EB.Template.TableAddreservedfield('RESERVED.5')
*-----------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
