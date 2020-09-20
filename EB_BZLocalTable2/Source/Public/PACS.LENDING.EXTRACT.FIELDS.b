* @ValidationCode : MjotNjM3ODc3Mjg5OkNwMTI1MjoxNjAwNTYwMTQwMDQ3OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:02:20
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R20_SP4.0
$PACKAGE EB.BZLocalTable2
*-----------------------------------------------------------------------------
* <Rating>-3</Rating>
*-----------------------------------------------------------------------------
SUBROUTINE PACS.LENDING.EXTRACT.FIELDS
*-------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19  :FM TO @FM
*-------------------------------------------------------
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
* $INSERT I_F.PGM.FILE - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*** </region>
*-----------------------------------------------------------------------------
*dataType = 'PG'
    EB.Template.TableDefineid("@ID", EB.Template.T24String)        ;* Define Table id
    EB.SystemTables.setIdF("APPLICATION"); EB.SystemTables.setIdN("40.2"); EB.SystemTables.setIdT("PG")
    tmp=EB.SystemTables.getIdT(); tmp<2>="HULWD"; EB.SystemTables.setIdT(tmp);*Enabled the localref fields for dynamic application.
    EB.SystemTables.setIdConcatfile("AL")
    EB.SystemTables.setIdCheckfile("PGM.FILE":@FM:EB.SystemTables.PgmFile.PgmScreenTitle:@FM:"L")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfield("XX.CONTRACT.NUMBER", EB.Template.T24String, "", '')
    EB.Template.TableAddfield("LIST.FILE.PATH",EB.Template.T24BigString , '', '')
    EB.Template.TableAddfield("FILE.NAME", EB.Template.T24String, '', '')
    EB.Template.TableAddfield("LOG.FILE.PATH",EB.Template.T24BigString , EB.Template.FieldMandatory , '')
    EB.Template.TableAddfield("NO.OF.HISTORY", EB.Template.T24Numeric, '', '')
    EB.Template.TableAddoptionsfield("GL.EXTRACT.REQ", 'YES_NO', "", '')
    EB.Template.FieldSetdefault('NO')
    EB.Template.TableAddfield("GL.START.DATE", EB.Template.T24Date, '', '')
    EB.Template.TableAddfield("XX.GL.BRANCH.REQ", EB.Template.T24String, '', '')
    EB.Template.FieldSetcheckfile("COMPANY")
    EB.Template.TableAddoptionsfield("CLEAR.LOG.FILES", 'YES_NO', "", '')
    EB.Template.FieldSetdefault('NO')
    EB.Template.TableAddfield("EXECUTION.STATUS",EB.Template.T24String ,EB.Template.FieldNoInput , '')
    EB.Template.FieldSetdefault('')
    EB.Template.TableAddreservedfield("RESERVED.05")
    EB.Template.TableAddreservedfield("RESERVED.04")
    EB.Template.TableAddreservedfield("RESERVED.03")
    EB.Template.TableAddreservedfield("RESERVED.02")
    EB.Template.TableAddreservedfield("RESERVED.01")
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
