* @ValidationCode : MjoxMjcyOTM2OTU3OkNwMTI1MjoxNjAwNDc5MjcwNzAxOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
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
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.SED.CNP.FICHEIER.RCP.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* AUTHOR YENGUI FIRAS
*

*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* 08 / 07 / 2010

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
    EB.Template.TableDefineid("ID", "" : @FM : "20" : @FM : "A")
*-----------------------------------------------------------------------------
    
	EB.Template.TableAddfielddefinition("NOM.FICHIER", "100","ANY","")
    EB.Template.TableAddfielddefinition("DATE.CHARGEMENT", "8","D","")
    EB.Template.TableAddfielddefinition("NBR.DOSSIER", "15","A","")
	EB.Template.TableAddfielddefinition("OBSERVATION", "15","A","")
    
**********
    EB.Template.TableAddfielddefinition("STATUT", "10","":@FM:"CHARGER_ANNULER","")

	EB.Template.TableAddfielddefinition("RESERVED.1", "10","A","")
	EB.Template.TableAddfielddefinition("RESERVED.2", "10","A","")
	EB.Template.TableAddfielddefinition("RESERVED.3", "10","A","")
	EB.Template.TableAddfielddefinition("RESERVED.4", "10","A","")
	EB.Template.TableAddfielddefinition("RESERVED.5", "10","A","")

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
