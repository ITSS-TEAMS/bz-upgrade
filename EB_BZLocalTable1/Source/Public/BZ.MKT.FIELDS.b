* @ValidationCode : MjoxNTk2MzQ1OTgxOkNwMTI1MjoxNjAwNDc5MjA5ODk3OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:33:29
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
SUBROUTINE BZ.MKT.FIELDS
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
* 19/11/09 - aelidrissi   New Template changes
*
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Converted FM to @FM
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
    EB.Template.TableDefineid("ID", EB.Template.T24Numeric : @FM : "10") ;* Define Table id
*-----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("XX<NOM.CONJOINT", "50", "A", "")
    EB.Template.TableAddfielddefinition("XX-PROFES.CONJ", "35", "A", "")
    EB.Template.TableAddfield("XX>NAISS.CONJ", EB.Template.T24Date, "", "")
    EB.Template.TableAddfielddefinition("NBRE.ENFANTS", "6", "", "")
    EB.Template.TableAddfielddefinition("XX<PRENOM.ENFANT", "35", "A", "")
    EB.Template.TableAddfieldwitheblookup("XX-SEXE.ENFANT", "GENDER", "")
    EB.Template.TableAddfield("XX>NAISS.ENF", EB.Template.T24Date, "", "")
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition() ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
