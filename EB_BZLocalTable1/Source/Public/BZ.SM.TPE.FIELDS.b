* @ValidationCode : MjoyNTYzMzM1NTc6Q3AxMjUyOjE2MDA0NzkyOTU1ODM6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIxOV9BTVIuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:34:55
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
SUBROUTINE BZ.SM.TPE.FIELDS
*-----------------------------------------------------------------------
*Modification History :
*ZIT-UPG-R13-R19 : Converted FM to @FM.
*-----------------------------------------------------------------------------
* $INSERT I_COMMON - Not Used anymore;N
* $INSERT I_EQUATE - Not Used anymore;E
* $INSERT I_DataTypes - Not Used anymore;s
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "10" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("CODE.CLIENT", "10","CUS","")
    EB.Template.FieldSetcheckfile("CUSTOMER")
    EB.Template.TableAddfielddefinition("CODE.AFFILIATION","10","A","")
    EB.Template.FieldSetcheckfile("BZ.SM.AFFILIATION")
    EB.Template.TableAddoptionsfield("TYPE.TPE","FIXE_MOBILE",'','')
    EB.Template.TableAddfielddefinition("NUMERO.SERIE","35.1","A","")
    EB.Template.TableAddfielddefinition("MODEL","35.1","A","")
    EB.Template.TableAddfielddefinition("FOURNISSEUR","100","A","")
    EB.Template.TableAddfielddefinition("ACTIF","3","":@FM:"_YES","")
    EB.Template.TableAddfielddefinition("CURRENCY","3","A","")
    EB.Template.FieldSetcheckfile("CURRENCY")
    EB.Template.TableAddfielddefinition("ADR.TPE","100","A","")
    EB.Template.TableAddfielddefinition("REF.PACK","16","A","")
    EB.Template.TableAddfielddefinition("STATUT","16","A","")
    EB.Template.TableAddfielddefinition("TYPE","35","":@FM:"TPE_KIT","")
*-----------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
