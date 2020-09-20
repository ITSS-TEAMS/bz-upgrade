* @ValidationCode : MjotNzM5Mzc5MDc0OkNwMTI1MjoxNjAwNDc4OTYyNjc2OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMThfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:29:22
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R18_AMR.0
*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.CHQ.CERTIF.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author Anas Zdadou
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* 28 / 03 / 2010 - azdadou@temenos.com New Template changes
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
*CALL Table.defineId("ID",T24_String) ;* Define Table id
*-----------------------------------------------------------------------------
*CALL Table.addFieldDefinition("ID", "27", "A", "")
    EB.Template.TableAddfielddefinition("NUM.CHEQUE", "7", "", "")
    EB.Template.TableAddfielddefinition("RIB", "20", "A", "")
    EB.Template.TableAddfielddefinition("CPT.CLIENT", "20", EB.Template.T24Account, "")
    EB.Template.FieldSetcheckfile('ACCOUNT')
    EB.Template.TableAddfielddefinition("MONTANT", "35", "AMT", "")
    EB.Template.TableAddfielddefinition("CPT.CERTIF", "20", EB.Template.T24Account, "")
    EB.Template.FieldSetcheckfile('ACCOUNT')
    EB.Template.TableAddfielddefinition("OBJET.CERTIF", "35", "A", "")
    EB.Template.TableAddfielddefinition("DATE.CERTIF", "8", "D", "")
    EB.Template.TableAddoptionsfield("STATUT", "Cree_Apure_Annule", "", "")
    EB.Template.TableAddfielddefinition("DATE.SORT", "8", "D", "")



*-----------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition() ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
