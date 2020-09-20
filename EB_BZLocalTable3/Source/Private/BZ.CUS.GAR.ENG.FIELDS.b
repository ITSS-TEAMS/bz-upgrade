* @ValidationCode : Mjo2MjI3NDIyMjpDcDEyNTI6MTYwMDU2MjE5MTU2NzpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjIwX1NQNC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:36:31
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
$PACKAGE EB.BZLocalTable3
SUBROUTINE BZ.CUS.GAR.ENG.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* Field definition de l'application GRANTIES
* @author hicham.atoui@targa-consult.com
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19 : Converted FM to @FM.
* ----------------------------------------------------------------------------

*** <region name= Header>
*** <desc>Inserts and control logic</desc>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*** </region>
*-----------------------------------------------------------------------------
*  CALL Table.defineId("ID", T24_String)         ;* Define Table id
    EB.Template.TableDefineid("ID.FIN", "" : @FM : "15" : @FM : "A")          ;* Define Table id
*-----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("CODE.CLIENT","10", "ANY", "")
    EB.Template.FieldSetcheckfile("CUSTOMER")
    EB.Template.TableAddfielddefinition("XX<REF.COLL.RIGTH", "15", "ANY", "")
    EB.Template.FieldSetcheckfile("COLLATERAL.RIGHT")
    EB.Template.TableAddamountfield("XX-MNT.COLL.RT", "15","", "")
    EB.Template.TableAddfielddefinition("XX-DEVISE.COLL.RT", "3", "ANY", "")
    EB.Template.FieldSetcheckfile("CURRENCY")
    EB.Template.TableAddamountfield("XX-CV.MNT.COLL.RT", "15","", "")
    EB.Template.TableAddfielddefinition("XX-XX<REF.COLL", "15", "ANY", "")
    EB.Template.FieldSetcheckfile("COLLATERAL")
    EB.Template.TableAddfielddefinition("XX-XX-COLL.TYPE","3", "ANY", "")
    EB.Template.FieldSetcheckfile("COLLATERAL.TYPE")
    EB.Template.TableAddfielddefinition("XX-XX-COLL.CODE","3", "ANY", "")
    EB.Template.FieldSetcheckfile("COLLATERAL.CODE")
    EB.Template.TableAddamountfield("XX-XX-MNT.COLL", "15","", "")
    EB.Template.TableAddfielddefinition("XX-XX-DEVISE.COLL", "3", "ANY", "")
    EB.Template.FieldSetcheckfile("CURRENCY")
    EB.Template.TableAddfielddefinition("XX-XX-NIVEAU.ENG","8", "A", "")
    EB.Template.TableAddamountfield("XX>XX>CV.MNT.COLL", "15","", "")
    EB.Template.TableAddfielddefinition("XX<LIMIT", "15", "ANY", "")
    EB.Template.FieldSetcheckfile("LIMIT")
    EB.Template.TableAddamountfield("XX-MNT.LIMIT", "15","", "")
    EB.Template.TableAddfielddefinition("XX-DEVISE.LIMIT", "3", "ANY", "")
    EB.Template.FieldSetcheckfile("CURRENCY")
    EB.Template.TableAddamountfield("XX>CV.MNT.LIMIT", "15","", "")
    EB.Template.TableAddfielddefinition("XX<REF.ENG","15", "A", "")
    EB.Template.TableAddamountfield("XX-MNT.ENG", "15","", "")
    EB.Template.TableAddfielddefinition("XX-DEVISE.ENG", "3", "ANY", "")
    EB.Template.FieldSetcheckfile("CURRENCY")
    EB.Template.TableAddfielddefinition("XX-TYPE.ENG","5", "A", "")
    EB.Template.TableAddfielddefinition("XX-ORDRE.ENG","7", "A", "")
    EB.Template.TableAddamountfield("XX>CV.MNT.ENG", "15","", "")

*-----------------------------------------------------------------------------

    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
