* @ValidationCode : MjoxMTM2ODUwNzQ2OkNwMTI1MjoxNjAwNDc4OTU2NDkyOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:29:16
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
* <Rating>0</Rating>
*** Modification History
*** "ZIT-UPG-R13-R19"
*** Converted FM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.CATEG.COMPTE.FIELDS
*-----------------------------------------------------------------------------
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "6" : @FM : "A")
    EB.Template.TableAddfielddefinition("XX.CODE.CATEG","5","A","")
    EB.Template.FieldSetcheckfile('CATEGORY')
*CALL Table.addFieldDefinition("XX>DESCRIPTION","50","A","")
    EB.Template.TableAddfielddefinition("RESERVED1","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED2","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED3","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED4","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED5 ","15", "A", "")
*-----------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
