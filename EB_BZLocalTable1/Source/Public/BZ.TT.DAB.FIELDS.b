* @ValidationCode : MjoxMzAwMjcyMDU0OkNwMTI1MjoxNjAwNDc5MzUyMjE5OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:35:52
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R19_AMR.0
*-------------------------------------------------------------------------
*-----------------------------------------------------------------------------
* <Rating>-2</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.TT.DAB.FIELDS
*-------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author bounouara fehmi
* @stereotype H
*
*-------------------------------------------------------------------------
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19    : FM CHANGED TO @FM
* ------------------------------------------------------------------------

*** <region name= Header>
*** <desc>Inserts and control logic</desc>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*** </region>
*-------------------------------------------------------------------------
    EB.Template.TableDefineid("ID.DAB", "A" : @FM : "12")          ;* Define Table id
*-------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("DESCRIPTION","35","A","")
    EB.Template.TableAddfielddefinition("ADRESSE","35","A","")
    EB.Template.TableAddfielddefinition("CONTACT","35","A","")
    EB.Template.TableAddfielddefinition("CONSTRUCTEUR","35","A","")
    EB.Template.TableAddfielddefinition("MODELE","35","A","")

    EB.Template.TableAddfielddefinition("UNITE.GESTION","6","A","")
    EB.Template.FieldSetcheckfile("DEPT.ACCT.OFFICER")

    EB.Template.TableAddfielddefinition("COMPTE.DAB","16","A","")
    EB.Template.FieldSetcheckfile("ACCOUNT")

    EB.Template.TableAddfielddefinition("TYPE.GAB","3","":@FM:"_YES","")
    EB.Template.TableAddfielddefinition("COMPTE.GAB","16","A","")
    EB.Template.FieldSetcheckfile("ACCOUNT")
*-------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-------------------------------------------------------------------------
RETURN
*-------------------------------------------------------------------------
END
