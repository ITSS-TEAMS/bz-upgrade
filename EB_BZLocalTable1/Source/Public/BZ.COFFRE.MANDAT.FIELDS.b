* @ValidationCode : Mjo3NjQzMzMxNTM6Q3AxMjUyOjE2MDA0Nzg5ODAzMzI6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIxOV9BTVIuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:29:40
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
SUBROUTINE BZ.COFFRE.MANDAT.FIELDS

*-----------------------------------------------------------------------------
  
* ----------------------------------------------------------------------------
*Modification history :
*ZIT-UPG-R13-R19: Converted FM TO @FM.
*---------------------------------------------

*** <region name= Header>
*** <desc>Inserts and control logic</desc>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template

*** </region>

*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "14" : @FM : "A")
*-----------------------------------------------------------------------------
*******
    EB.Template.TableAddfielddefinition("ID.CONTRAT", "12.1","A","")
    EB.Template.FieldSetcheckfile("BZ.COFFRE.CONTRAT")

    EB.Template.TableAddfielddefinition("ID.CLIENT", "8.1","A","")
    EB.Template.FieldSetcheckfile("CUSTOMER")

    EB.Template.TableAddfielddefinition("DATE.CREATION", "8.1","D","")
    EB.Template.TableAddfielddefinition("DATE.DEBUT", "8.1","D","")
    EB.Template.TableAddfielddefinition("DATE.ANNULATION", "8","D","")

    EB.Template.TableAddyesnofield("MANDAT.ANNULE","","")
*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
