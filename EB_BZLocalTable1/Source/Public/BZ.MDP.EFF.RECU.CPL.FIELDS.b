* @ValidationCode : MjotODAwNjY2MDU4OkNwMTI1MjoxNjAwNDc5MTU0MDcwOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:32:34
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
SUBROUTINE BZ.MDP.EFF.RECU.CPL.FIELDS
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
    EB.Template.TableDefineid("ID", "" : @FM : "35" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("CODE.VALEUR", "2","A","")
	EB.Template.FieldSetcheckfile("BZ.MDP.TYPE.VALEUR")
    
    EB.Template.TableAddfielddefinition("NATURE.REM", "1","A","")
    
    EB.Template.TableAddfielddefinition("CODE.REM", "2","A","")
	EB.Template.FieldSetcheckfile("BC.SORT.CODE")
	
    EB.Template.TableAddfielddefinition("CODE.CENTRE.REM", "3","A","")
    
    EB.Template.TableAddfielddefinition("DATE.OPERATION", "8","D","")
    
    EB.Template.TableAddfielddefinition("NUM.LOT", "4","","")
    
    EB.Template.TableAddfielddefinition("CODE.ENREG", "2","A","")
    
    EB.Template.TableAddfielddefinition("CODE.DEVISE","3","A","")
    EB.Template.TableAddfielddefinition("RANG","2","A","")

    EB.Template.TableAddfielddefinition("NUM.LCN", "12","A","")

    EB.Template.TableAddfielddefinition("NOM.RS.TIRE", "35","A","")
	
	EB.Template.TableAddfielddefinition("ADRESSE", "35","A","")

    EB.Template.TableAddfielddefinition("NATURE.IDENTIFIANT", "1","A","")

    EB.Template.TableAddfielddefinition("NUMERO.IDENTIFIANT", "15","A","")
    
    EB.Template.TableAddfielddefinition("CODE.RISQUE.BCT", "6","A","")
  
    EB.Template.TableAddfielddefinition("ZONE.LIBRE", "258","A","")
	
	EB.Template.TableAddfielddefinition("STATUT", "20","A","")
    EB.Template.FieldSetcheckfile("BZ.TRAIT.STATUT")
	
	EB.Template.TableAddfielddefinition("FICHIER.RECU", "65","A","")
    

*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
