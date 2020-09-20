* @ValidationCode : MjoxMTA4OTMxMTpDcDEyNTI6MTYwMDU2MDEzOTg2MzpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjIwX1NQNC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:02:19
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
* Modification History :
*ZIT-UPG-R13-R19:NO CHANGES
*-----------------------------------------------------------------------------

$PACKAGE EB.BZLocalTable2
SUBROUTINE PACS.AC.DATA.EXTRACT.FIELDS
	
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
*** </region>
*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("@ID", EB.Template.T24String)        ;* Define Table id
*-----------------------------------------------------------------------------
    EB.Template.TableAddfield("XX.ACCOUNT.NUMBER", EB.Template.T24String, "", '')
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfield("LIST.FILE.PATH",EB.Template.T24BigString , '', '')
    EB.Template.TableAddfield("FILE.NAME", EB.Template.T24String, '', '')
    EB.Template.TableAddfield("LOG.FILE.PATH",EB.Template.T24BigString , EB.Template.FieldMandatory , '')
    EB.Template.TableAddfield("ENTRY.START.DATE", EB.Template.T24Date, '', '')
    EB.Template.TableAddoptionsfield("GL.EXTRACT.REQ", 'YES_NO', "", '')
    EB.Template.FieldSetdefault('NO')
    EB.Template.TableAddfield("GL.START.DATE", EB.Template.T24Date, '', '')
    EB.Template.TableAddfield("XX.GL.BRANCH.REQ", EB.Template.T24String, '', '')
    EB.Template.TableAddoptionsfield("WORKING.BAL.CHK", 'YES_NO', "", '')
    EB.Template.FieldSetdefault('NO')
    EB.Template.TableAddoptionsfield("FWD.ENT.DETS.REQD", 'YES_NO', "", '')
    EB.Template.FieldSetdefault('NO')
    EB.Template.TableAddoptionsfield("DATE.EXPO.REQD", 'YES_NO', "", '')
    EB.Template.FieldSetdefault('NO')
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
