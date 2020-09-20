* @ValidationCode : MjotMTQxOTk1ODI2NDpDcDEyNTI6MTYwMDU2MDE0NDk4NTpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjIwX1NQNC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:02:24
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
* <Rating>-24</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE TNA.MONETIQUE.PROTOCOLE.FIELDS
*-----------------------------------------------------------------------------
*********************************************************************
*                      PROJET CHALLENGE 24
*********************************************************************
*
* @author
*
* @Mail
*
* @desc      THIS IS AN AUTO-GENERATED ROUTINE
* @desc      MONETIQUE.PROTOCOLE TEMPLATE - (TEMPLATE GENERATOR TOOL)
*
* @create    07/01/2010 11:15:36
*
* @param
*
* @calls
*
* @error
*
* @change
*
* @revby
*
* @stereotype H
*********************************************************************
*Modification History :
*ZIT-UPG-R13-R19 :  No Changes.
*-----------------------------------------------------------------------------
*** <region name= Header>
* $INSERT I_COMMON - Not Used anymore;N
* $INSERT I_EQUATE - Not Used anymore;E
* $INSERT I_DataTypes - Not Used anymore;s
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*** </region>
*-----------------------------------------------------------------------------
* <Main controlling section>
*----------------------------------------------------------------------

    GOSUB INITIALISATION
    GOSUB MAIN.PROCESS

RETURN
*---------------------------------------------------------------------------
INITIALISATION:
*file opening, variable set up

RETURN
*---------------------------------------------------------------------------
MAIN.PROCESS:
*main subroutine processing

    EB.Template.TableDefineid("PROTOCOLE.ID",EB.Template.T24String ) ;* Define Table id

    EB.Template.TableAddfielddefinition("PRG.CARD.PROD.FILE","30","","");*
    EB.Template.TableAddfielddefinition("CARD.PROD.NAME","30","","");*
    EB.Template.TableAddfielddefinition("PRG.CARD.UPDATE","30","","");*
    EB.Template.TableAddfielddefinition("CARD.UPDATE.NAME.F","30","","");*
    EB.Template.TableAddfielddefinition("CARD.UPDATE.NAME.P","30","","");*
    EB.Template.TableAddfieldwitheblookup("GEN.CARD.NUMBER","CARD","");*
    EB.Template.TableAddfielddefinition("CARD.RENEW","2.1","","");*

    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
    EB.Template.TableSetauditposition() ;* Poputale audit information

RETURN
* ----------------------------------------------------------------------------
END
