* @ValidationCode : MjotMTQwNTIzNDg2MzpDcDEyNTI6MTYwMDQ3ODk1NjM2NjpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE4X0FNUi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:29:16
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R18_AMR.0
*-----------------------------------------------------------------------------
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.CARD.MAJ.PLAFOND.FIELDS
*-----------------------------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19  : FM TO @FM
*-------------------------------------------------------
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "35" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("TYPE.EVT","5","A","")
    EB.Template.FieldSetcheckfile('BZ.CARD.EVENEMENT')
    EB.Template.TableAddfielddefinition("DATE.EVT","8", "D", "")
    EB.Template.TableAddfielddefinition("NUMERO.CARTE","16", "A", "")
    EB.Template.TableAddfielddefinition("REF.ORIGINE","16", "A", "")
    EB.Template.TableAddfielddefinition("PLAFOND.ACHAT","5", "A", "")
    EB.Template.TableAddfielddefinition("PLAFOND.RETRAIT","5", "A", "")
    EB.Template.TableAddfielddefinition("PLAFOND.CASH","5", "A", "")
    EB.Template.TableAddfielddefinition("ACCOUNT.OFFICER","4", "A", "")
    EB.Template.FieldSetcheckfile('DEPT.ACCT.OFFICER')

    EB.Template.TableAddfielddefinition("RESERVED1","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED2","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED3","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED4","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED5","15", "A", "")
*-----------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
