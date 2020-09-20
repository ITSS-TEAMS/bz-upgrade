* @ValidationCode : Mjo5NzY1ODMyMzc6Q3AxMjUyOjE2MDA0NzkyMTA0NTc6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIxOV9BTVIuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:33:30
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
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.MUR.PRODUCTS.PARAMETER.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @Zeki.benothmen@banquezitouna.com
* @stereotype H
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
* Modification History :
*ZIT-UPG-R13-R19     : Converted FM to @FM.
*-----------------------------------------------------------------------------
*** <region name= Header>
*** <desc>Inserts and control logic</desc>

* $INSERT I_COMMON - Not Used anymore;N
* $INSERT I_EQUATE - Not Used anymore;E
* $INSERT I_DataTypes - Not Used anymore;s
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*** </region>
*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "7" : @FM : "A")
*-----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("XX.IMMO.MUR","5","A","")
    EB.Template.FieldSetcheckfile("IS.H.PRODUCTS")

    EB.Template.TableAddfielddefinition("XX.IMMO.RMC","5","A","")
    EB.Template.FieldSetcheckfile("IS.H.PRODUCTS")

    EB.Template.TableAddfielddefinition("XX.HORSIMMO.MUR","5","A","")
    EB.Template.FieldSetcheckfile("IS.H.PRODUCTS")

    EB.Template.TableAddfielddefinition("XX.HORSIMMO.RMC","5","A","")
    EB.Template.FieldSetcheckfile("IS.H.PRODUCTS")
**RESERVED
    EB.Template.TableAddfielddefinition("RESERVED.1", "10","A" ,"")
    EB.Template.TableAddfielddefinition("RESERVED.2", "10","A" ,"")
    EB.Template.TableAddfielddefinition("RESERVED.3", "10","A" ,"")
    EB.Template.TableAddfielddefinition("RESERVED.4", "10","A" ,"")
    EB.Template.TableAddfielddefinition("RESERVED.5", "10","A" ,"")
    EB.Template.TableAddfielddefinition("RESERVED.6", "10","A" ,"")
    EB.Template.TableAddfielddefinition("RESERVED.7", "10","A" ,"")
    EB.Template.TableAddfielddefinition("RESERVED.8", "10","A" ,"")
    EB.Template.TableAddfielddefinition("RESERVED.9", "10","A" ,"")
    EB.Template.TableAddfielddefinition("RESERVED.10", "10","A" ,"")
*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
