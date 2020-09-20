* @ValidationCode : Mjo4NDY1OTE5Njc6Q3AxMjUyOjE2MDA0Nzg5NzQ0ODg6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIxOV9BTVIuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:29:34
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
*** Modification History:
*** "ZIT-UPG-R13-R19"
*** Converted FM to @FM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.COFFRE.EVENEMENT.FIELDS

*-----------------------------------------------------------------------------

* ----------------------------------------------------------------------------

*** <region name= Header>
*** <desc>Inserts and control logic</desc>
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
*******
    EB.Template.TableAddfielddefinition("DATE", "8","D","")

    EB.Template.TableAddfielddefinition("DETAILS", "65","A","")

    EB.Template.TableAddfielddefinition("NUMERO.COFFRE", "8","","")

    EB.Template.TableAddfielddefinition("TYPE.EVENT", "35","","")
    EB.Template.FieldSetcheckfile("BZ.COFFRE.EVENEMENT.TYPE")

    EB.Template.TableAddfielddefinition("ID.CONTRAT", "12","A","")


    EB.Template.TableAddfielddefinition("REF.OPERATION", "35","A","")

    EB.Template.TableAddfielddefinition("DATE.TIME.EVENT", "35","A","")

*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
