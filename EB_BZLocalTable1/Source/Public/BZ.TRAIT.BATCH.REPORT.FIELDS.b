* @ValidationCode : MjoyMjQ1MTAwNzk6Q3AxMjUyOjE2MDA0NzkzMzUzNjM6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIxOV9BTVIuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:35:35
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
SUBROUTINE BZ.TRAIT.BATCH.REPORT.FIELDS
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
    EB.Template.TableDefineid("ID", "" : @FM : "60" : @FM : "A")
*-----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("DESCRIPTION","50", "A", "")
    EB.Template.TableAddfielddefinition("TRAIT.BATCH","50", "A", "")
    EB.Template.FieldSetcheckfile("BZ.TRAIT.BATCH")

    EB.Template.TableAddfielddefinition("DATE.EXECUTION","8", "D", "")
    EB.Template.TableAddfielddefinition("DEBUT.EXECUTION","16", "A", "")
    EB.Template.TableAddfielddefinition("FIN.EXECUTION","16", "A", "")
    EB.Template.TableAddfielddefinition("STATUT.TRAITEMNT","4", "" : @FM : "OK_ERROR_", "")
    EB.Template.TableAddfielddefinition("MESSAGE.ERREUR","100", "A", "")




    EB.Template.TableSetauditposition() ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
