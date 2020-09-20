* @ValidationCode : MjotNjY1MTI3NjY6Q3AxMjUyOjE2MDA0NzkwOTY5OTY6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIxOV9BTVIuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:31:36
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
SUBROUTINE BZ.ISB.FOURNISSEUR.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* Field definition de la table fournisseur
* @author hicham.atoui@targa-consult.com
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* ZIT_UPG_R13_TO_R19  : Changed FM to @FM
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
* CALL Table.defineId("ID", T24_String)         ;* Define Table id
    EB.Template.TableDefineid("ID", "" : @FM : "10" : @FM : "A")
*-----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("MAT.FISC","13.1", "A", "")
    EB.Template.TableAddfielddefinition("CIN.REGCOM","17","" : @FM : "CIN_MATRICULE.FISCAL","")
    EB.Template.TableAddfielddefinition("ADR.FRS", "150", "A", "")
    EB.Template.TableAddfielddefinition("ACTIVITE", "15.1", "ANY", "")
    EB.Template.FieldSetcheckfile("BZ.INDUSTRIE")
    EB.Template.TableAddfielddefinition("XX.RIB.FRS", "25", "A", "")
    EB.Template.TableAddfielddefinition("CUSTOMER", "15", "ANY", "")
    EB.Template.FieldSetcheckfile("CUSTOMER")
    EB.Template.TableAddfielddefinition("RAISON.SOCIALE","150", "A", "")
*-----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("DATE.VALIDITE","8", "D", "")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
