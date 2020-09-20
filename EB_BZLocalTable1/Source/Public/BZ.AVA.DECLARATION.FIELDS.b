* @ValidationCode : MjotMTEyODAzNjMwMjpDcDEyNTI6MTYwMDQ3ODkzNDY4NTpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE5X0FNUi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:28:54
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
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.AVA.DECLARATION.FIELDS
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------
*ZIT-UPG-R13-R19 :   FM converted to @FM
*-----------------------------------------------------------------------------
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template


*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "10" : @FM : "A")
*-----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("ANNE.PERIODE","4","A","")
    EB.Template.TableAddfielddefinition("MOIS","2","":@FM:"01_02_03_04_05_06_07_08_09_10_11_12","")

    EB.Template.TableAddfielddefinition("REF.FICHIER.BEN","65","A","")
    EB.Template.TableAddfielddefinition("REF.FICHIER.DOSS","65","A","")
    EB.Template.TableAddfielddefinition("TYPE.GENERATION","7","":@FM:"DOSSIER_BENEF_ALL","")

    EB.Template.TableAddfielddefinition("STATUT","10","A","")

    EB.Template.TableAddfielddefinition("COMMENTAIRE","35","A","")



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
