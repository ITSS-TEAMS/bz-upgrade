* @ValidationCode : Mjo2OTM3ODgxMzY6Q3AxMjUyOjE2MDA0NzkwMjcyNjE6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIxOV9BTVIuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:30:27
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R19_AMR.0
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.DE.MAPPING.ADVICE.FIELDS
*------------------------------------------------------------------------
* Modification History :

*ZIT-UPG-R13-R19 : FM CHANGED TO @FM
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author BOUNOUARA FEHMI
* @stereotype H

* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
*** </region>
*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "35" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("TYPE", "15","A","")
    EB.Template.FieldSetcheckfile("BZ.AVIS.TYPE")
    EB.Template.TableAddfielddefinition("XX<ZONE", "2","","")
    EB.Template.TableAddfielddefinition("XX-LIBELLE", "20","A","")
    EB.Template.TableAddfielddefinition("XX-XX.VALUE", "30","A","")
    EB.Template.TableAddfielddefinition("XX-XX.CONVERSION", "40","A","")
    EB.Template.TableAddfielddefinition("XX>ROUTINE", "35","A","")

    EB.Template.TableAddfielddefinition("TABLE", "35","A","")

***
    EB.Template.TableAddfielddefinition("XX<SELECTION", "10","":@FM:"_SECTOR_CATEGORY","")
    EB.Template.TableAddfielddefinition("XX-XX.OPERAND", "10","":@FM:"_EQ_NE_BETWEEN","")
    EB.Template.TableAddfielddefinition("XX>XX.SEL.VALUE", "35","A","")
***
    EB.Template.TableAddfielddefinition("ACTIVE", "3","":@FM:"YES_NO","")

    EB.Template.TableAddfielddefinition("BUILD.ROUTINE", "35","A","")
*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
