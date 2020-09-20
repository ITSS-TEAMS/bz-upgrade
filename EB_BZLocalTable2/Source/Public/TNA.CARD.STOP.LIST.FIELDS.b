* @ValidationCode : MjotMTczNzE2MTIxNDpDcDEyNTI6MTYwMDU2MDE0NDY3NjpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjIwX1NQNC4wOi0xOi0x
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
* <Rating>-23</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE TNA.CARD.STOP.LIST.FIELDS
*-----------------------------------------------------------------------------
*********************************************************************
*                      PROJET CHALLENGE 24
*********************************************************************
*
* @RANIA
*
* @Mail

* @create    06/01/2010 10:23:51

*********************************************************************
*Modification History :
*ZIT-UPG-R13-R19 :  No Changes.
*-----------------------------------------------------------------------------
*** <region name= Header>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
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

    EB.Template.TableDefineid("ID", EB.Template.T24String )
*CALL Table.addFieldDefinition("CARD.NUMBER","19","","");*
    EB.Template.FieldSetcheckfile("CARD.ISSUE")
    EB.Template.TableAddfielddefinition("DECLARATION.DATE","","D","");*
    EB.Template.TableAddfielddefinition("END.DATE","","D","");*
    EB.Template.TableAddfielddefinition("REASON.CODE","2","","");*
    EB.Template.FieldSetcheckfile("TNA.CARD.REASON")
*CALL Table.addYesNoField("SEND.RECORD","","")
    EB.Template.TableAddfieldwitheblookup("SEND.RECORD","CARD","");*
    EB.Template.TableAddfielddefinition("XX.MEMO","60","A","");*

    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
    EB.Template.TableSetauditposition() ;* Poputale audit information

RETURN
* ----------------------------------------------------------------------------
END
