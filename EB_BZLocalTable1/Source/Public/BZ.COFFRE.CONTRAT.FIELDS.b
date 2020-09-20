* @ValidationCode : MjoxMTU1NzUxNzg5OkNwMTI1MjoxNjAwNDc4OTc0MzU4OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
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
*-----------------------------------------------------------------------------
*Modification History:
*-----------------------------------------------------------------------------
*ZIT-UPG-R09-R13  : $INSERT BP to $INCLUDE BZDEV.BP

*ZIT-UPG-R13-R19: FM CHANGED TO @FM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.COFFRE.CONTRAT.FIELDS

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
        
*ZIT-UPG-R09-R13/S
*  $INSERT BP I_F.BZ.COFFRE.REGISTRE
* $INSERT I_F.BZ.COFFRE.REGISTRE - Not Used anymore;
*ZIT-UPG-R09-R13/E
*** </region>

*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "12" : @FM : "A")
*-----------------------------------------------------------------------------
*******
    EB.Template.TableAddfielddefinition("ID.CLIENT", "8.1","A","")
    EB.Template.FieldSetcheckfile("CUSTOMER")

    EB.Template.TableAddfielddefinition("NUMERO.COFFRE", "008.8","","")
    EB.Template.FieldSetcheckfile("BZ.COFFRE.REGISTRE")

    EB.Template.TableAddfielddefinition("DATE.CONTRAT", "8.1","D","")


    EB.Template.TableAddfielddefinition("COMPTE.FACTURATION", "0010.1","A","")
    EB.Template.FieldSetcheckfile("ACCOUNT")

    EB.Template.TableAddyesnofield("GARANTIE","","")

    EB.Template.TableAddfielddefinition("COMPTE.GARANTIE", "","A","")
    EB.Template.FieldSetcheckfile("ACCOUNT")

    EB.Template.TableAddamountfield("AMOUNT.GARANTIE", "","","")
    EB.Template.TableAddfielddefinition("REFERENCE.GARANTIE", "12","A","")
    EB.Template.TableAddfielddefinition("REF.RESTIT.GAR", "12","A","")
    EB.Template.TableAddfielddefinition("STATUT", "2.1","","")
    EB.Template.FieldSetcheckfile("BZ.CONTRAT.STATUT")

    EB.Template.TableAddfielddefinition("DATE.RESILIATION", "8","D","")
    EB.Template.TableAddfielddefinition("MNT.PRE.LOYER", "12","","")
    EB.Template.TableAddfielddefinition("MNT.GAR.FCY", "12","","")
    EB.Template.TableAddfielddefinition("COMPTE.FACT.OLD", "10","A","")

*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
