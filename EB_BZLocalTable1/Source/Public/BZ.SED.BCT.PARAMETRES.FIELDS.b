* @ValidationCode : MjotMzQ5NTkyNzU0OkNwMTI1MjoxNjAwNDc5MjcwMTI1OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:34:30
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
SUBROUTINE BZ.SED.BCT.PARAMETRES.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author MALLEK Seif eddine
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*ZIT-UPG-R13-R19     :  Converted FM to @FM.
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
    EB.Template.TableDefineid("ID", "" : @FM : "50" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("NOM.FICHIER", "100", "A", "")
    EB.Template.TableAddoptionsfield("FREQUENCE", "Journalier_Mensuelle_Trimestrielle_Semestrielle_Annuelle", "", "")
    EB.Template.TableAddfielddefinition("SERVICE.AUTO", "50", "A", "")
    EB.Template.FieldSetcheckfile('TSA.SERVICE')
    EB.Template.TableAddfielddefinition("REPERTOIRE", "100", "A", "")
    EB.Template.TableAddfielddefinition("EXTENSION", "20", "A", "")
    EB.Template.TableAddfielddefinition("HEADER", "150", "A", "")
**RESERVED

*    CALL Table.addFieldDefinition("RESERVED.2", "30","A","")
*    CALL Table.addFieldDefinition("RESERVED.3", "30","A","")
    EB.Template.TableAddfielddefinition("RESERVED.4", "30","A","")
    EB.Template.TableAddfielddefinition("RESERVED.5", "30","A","")
    EB.Template.TableAddfielddefinition("RESERVED.6", "30","A","")
    EB.Template.TableAddfielddefinition("RESERVED.7", "30","A","")
    EB.Template.TableAddfielddefinition("RESERVED.8", "30","A","")

*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
