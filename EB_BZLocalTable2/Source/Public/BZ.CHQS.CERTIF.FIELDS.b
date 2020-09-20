* @ValidationCode : Mjo2MDY4NzYxNDE6Q3AxMjUyOjE2MDA0ODQ3MTg0MDQ6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIyMF9TUDQuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 04:05:18
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
SUBROUTINE BZ.CHQS.CERTIF.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author Anas Zdadou
* @stereotype H
*
*
*----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* 28 / 03 / 2010 - azdadou@temenos.com New Template changes
*ZIT_UPG_R13_TO_R19  : changed FM to @FM
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
    EB.Template.TableDefineid("ID", "" : @FM : "27" : @FM : "A")    ;*changed
    EB.Template.TableAddfielddefinition("NUM.CHEQUE", "7", "", "")
    EB.Template.TableAddfielddefinition("RIB", "20", "A", "")
    EB.Template.TableAddfielddefinition("CPT.CLIENT", "20", "A", "")
*CALL Field.setCheckFile('ACCOUNT')
    EB.Template.TableAddfielddefinition("MONTANT", "35", "AMT", "")
    EB.Template.TableAddfielddefinition("CPT.CERTIF", "20", "A", "")
*CALL Field.setCheckFile('ACCOUNT')
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
