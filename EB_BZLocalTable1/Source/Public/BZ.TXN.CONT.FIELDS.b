* @ValidationCode : MjotMTAwNjk4MDU4NTpDcDEyNTI6MTYwMDQ3OTM2Nzg3ODpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE5X0FNUi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:36:07
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R19_AMR.0
*---------------------------------------------------------------------------------------
* <Rating>0</Rating>
* Version 1 01/11/2017 Globus Release R13.55
*---------------------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.TXN.CONT.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* @author : firasjmalt24@gmail.com
* @stereotype L
* @classification CUS
* @desc les operations de credit sur les comptes contentieux
*</doc>
*-----------------------------------------------------------------------------
*Modification History:

*ZIT-UPG-R13-R19 : FM CHANGED TO @FM;
*---------------------------------------------------------------------------------------

*** <region name= Header>
*** <desc>Inserts and control logic</desc>
*ZIT-UPG-R13-R19/S
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
*ZIT-UPG-R13-R19/E
*** </region>

*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "70" : @FM : "A") ;
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("CUSTOMER","10", "A", "")
    EB.Template.FieldSetcheckfile("CUSTOMER")
    EB.Template.TableAddfielddefinition("ACCOUNT.NUMBER","19", "A", "")
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("CURRENCY","35", "A", "")
    EB.Template.FieldSetcheckfile("CURRENCY")
    EB.Template.TableAddfielddefinition("COMPANY.CODE","11", "A", "")
    EB.Template.FieldSetcheckfile("COMPANY")
    EB.Template.TableAddfielddefinition("DEPARTEMENT.CODE","20", "A", "")
    EB.Template.FieldSetcheckfile("DEPT.ACCT.OFFICER")
    EB.Template.TableAddfielddefinition("STMT.ENTRY.ID","90", "A", "")
    EB.Template.FieldSetcheckfile("STMT.ENTRY")
    EB.Template.TableAddfielddefinition("VALUE.DATE","11", "D", "")
    EB.Template.TableAddfielddefinition("SYSTEM.ID","24", "A", "")
    EB.Template.TableAddfielddefinition("TRANS.REFERENCE","23", "A", "")
    EB.Template.TableAddfielddefinition("TRANSACTION.CODE","3", "", "")
    EB.Template.FieldSetcheckfile("TRANSACTION")
    EB.Template.TableAddfielddefinition("AMOUNT.LCY","12", "A", "")
    EB.Template.TableAddfielddefinition("AMOUNT.FCY","12", "A", "")


*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("RESERVED1","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED2","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED3","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED4","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED5","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED6","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED7","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED8","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED9","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED10","10", "A", "")


*-----------------------------------------------------------------------------

    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
