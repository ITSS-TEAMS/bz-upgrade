* @ValidationCode : MjotMTI1NjY1ODQ2NTpDcDEyNTI6MTYwMDU2MDE0NDgwNDpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjIwX1NQNC4wOi0xOi0x
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
SUBROUTINE TNA.CARD.SUIVI.FIELDS
*-----------------------------------------------------------------------------
*********************************************************************
*                      PROJET CHALLENGE 24
*********************************************************************
**
* CREATION PAR : ZIED BEN YOUSSEF
* DESCRPTION : LE SUIVI DES OPERATIONS SUR CARTES MONETIQUES
* DATE MODIFICATION : 31/10/2012
*
* @stereotype H
*********************************************************************
*Modification History :
*ZIT-UPG-R13-R19 :   Converted FM to @FM.
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

    EB.Template.TableDefineid("ID", "" : @FM : "35" : @FM : "A") ;

    EB.Template.TableAddfielddefinition("CARD.NUMBER","19","A","")
    EB.Template.TableAddfielddefinition("OPERATION","3", "A", "")
    EB.Template.FieldSetcheckfile("TNA.CARD.OPERATION")
    EB.Template.TableAddfielddefinition("REASON","3", "A", "")
    EB.Template.FieldSetcheckfile("TNA.CARD.REASON")
    EB.Template.TableAddfielddefinition("REF.OFS","35", "A", "")
    EB.Template.TableAddfielddefinition("REF","35", "A", "")
    EB.Template.TableAddfielddefinition("UTILISATEUR","16", "A", "")
    EB.Template.FieldSetcheckfile("USER")
    EB.Template.TableAddfielddefinition("CODE.DEPT","20", "A", "")
    EB.Template.FieldSetcheckfile("DEPT.ACCT.OFFICER")
    EB.Template.TableAddfielddefinition("OFS.MESSAGE","600", "A", "")


    EB.Template.TableAddlocalreferencefield("")

    EB.Template.TableAddoverridefield()
    EB.Template.TableSetauditposition()         ;* Poputale audit information

RETURN
* ----------------------------------------------------------------------------
END
