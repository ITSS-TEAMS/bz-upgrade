* @ValidationCode : MjotMTk4NTY2MzQ1NzpDcDEyNTI6MTYwMDU2Mjc1MzY0MzpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjIwX1NQNC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:45:53
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
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable3
SUBROUTINE BZ.SED.ALLOC.RETRO.FIELDS
*-------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-FM TO @FM
*-----------------------------------------------------------------------------
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "33" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("DATE.TRANSACTION","8","D","")
    EB.Template.TableAddfielddefinition("CODE.TRANSACTION","5","A","")
    EB.Template.TableAddfielddefinition("TYPE.OP.BBE","3","A","")
    EB.Template.TableAddfielddefinition("REFERENCE.TT","12","A","")
    EB.Template.TableAddfielddefinition("CODE.BAL.PAY","5","A","")
    EB.Template.TableAddfielddefinition("INTERMEDIARE.AGREE","4","A","")
    EB.Template.TableAddfielddefinition("AGENCE","4","A","")
    EB.Template.FieldSetcheckfile('DEPT.ACCT.OFFICER')
    EB.Template.TableAddfielddefinition("TYPE.PID","35","A","" )
    EB.Template.TableAddfielddefinition("NUM.PIECE","12","A","")
    EB.Template.TableAddfielddefinition("NOM.PRENOM","35","A","")
    EB.Template.TableAddfielddefinition("PAYS.DESTINATION","20","A","")
    EB.Template.TableAddfielddefinition("NATURE","25","A","")
    EB.Template.TableAddfielddefinition("MONTANT","15","AMT","")
    EB.Template.TableAddfielddefinition("MONTANT.TND","15","AMT","")
    EB.Template.TableAddfielddefinition("MODE.DELIVRANCE","3","A","")
    EB.Template.TableAddfielddefinition("NUM.PASSEPORT","12","A","")
    EB.Template.TableAddfielddefinition("DATE.RETOUR","35","A","")
*********************************************************************
    EB.Template.TableAddfielddefinition("RESERVED1","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED2","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED3","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED4","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED5","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED6","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED7","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED8","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED9","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED10","15", "A", "")

*-----------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
