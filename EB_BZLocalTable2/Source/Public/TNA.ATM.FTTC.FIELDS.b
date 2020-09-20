* @ValidationCode : MjotMTEzNjc3OTU3NTpDcDEyNTI6MTYwMDU2MDE0MTI5NzpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjIwX1NQNC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:02:21
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
* <Rating>-2</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE TNA.ATM.FTTC.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* @author aajouad@temenos.com
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* Version Initiale 13/08/2009 -- STD 0.1 23/06/09
*ZIT-UPG-R13-R19 : removed BP's and changed INCLUDE to INSERT
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
    EB.Template.TableDefineid("KEY",  "" : @FM : "15" : @FM : "A")  ;* Define Table id
*-----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("DESCRIPTION","35", "A", "")
   
    EB.Template.TableAddfielddefinition("FTTC.CODE", "4", "A", "")
    EB.Template.FieldSetcheckfile("FT.TXN.TYPE.CONDITION")
    

*-----------------------------------------------------------------------------

    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
