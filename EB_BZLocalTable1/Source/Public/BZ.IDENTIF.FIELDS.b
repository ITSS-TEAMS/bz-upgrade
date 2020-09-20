* @ValidationCode : MjoxNTc0NjU3MTc4OkNwMTI1MjoxNjAwNDc5MDk0Mzc0OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
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
* <Rating>-2</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.IDENTIF.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* Template for field definitions routine YOURAPPLICATION.FIELDS
*
* @author aelidrissi@temenos.com
* @stereotype H
* </doc>
*-----------------------------------------------------------------------------
* Modification History :
*
* 19/10/07 - aelidrissi   New Template changes
* 10/05/2017 - Abdelmonaam Mastouri

*ZIT-UPG-R13-R19:FM converted to @FM
*-----------------------------------------------------------------------------
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
    EB.Template.TableDefineid("ID", EB.Template.T24Numeric : @FM : "10")      ;* Define Table id
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("NATURE.CLIENT", "35", "" : @FM : "Particulier_Professionnel_Personne Morale_", "")
    EB.Template.TableAddfieldwitheblookup("XX<ID.TYPE", "CUS.LEGAL.DOC.NAME", "")
    EB.Template.TableAddfielddefinition("XX>DOC.ID","13", "A", "")
    EB.Template.TableAddfielddefinition("NATIONALITE", "3", "A", "")
    EB.Template.FieldSetcheckfile("COUNTRY")
    EB.Template.TableAddfielddefinition("RESIDENCE","2", "" : @FM : "R_NR_ ", "")
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
