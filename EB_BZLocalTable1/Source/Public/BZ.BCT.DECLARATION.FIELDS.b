* @ValidationCode : Mjo4ODIwODU3MTI6Q3AxMjUyOjE2MDA0Nzg5NTA0NzU6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIxOV9BTVIuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:29:10
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
SUBROUTINE BZ.BCT.DECLARATION.FIELDS
*-----------------------------------------------------------------------------
*Modification history :
*-----------------------
*ZIT-UPG-R13-R19 : FM converted to @FM
*--------------------------------------------------------------------------------------------------------
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template

  
*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "12" : @FM : "A")
*-----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("ANNE.PERIODE","4","A","")
    EB.Template.TableAddfielddefinition("MOIS","2","":@FM:"01_02_03_04_05_06_07_08_09_10_11_12","")
    EB.Template.TableAddfielddefinition("CODE.IA","20","A","")
    EB.Template.TableAddfielddefinition("TYPE.DECLARATION","35","":@FM:"COMPTE.PROFESSIONNEL_ENCOURS.PLACEMENT","")

    EB.Template.TableAddfielddefinition("FICHIER.EMIS","65","A","")

    EB.Template.TableAddfielddefinition("STATUT","10","A","")

    EB.Template.TableAddfielddefinition("COMMENTAIRE","35","A","")

    EB.Template.TableAddfielddefinition("RESERVED1","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED2","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED3","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED4","15", "A", "")
    EB.Template.TableAddfielddefinition("TRIMESTRE","2","":@FM:"T1_T2_T3_T4","")
*-----------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
