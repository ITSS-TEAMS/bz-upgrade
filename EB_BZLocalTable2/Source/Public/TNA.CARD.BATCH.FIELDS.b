* @ValidationCode : MjotMTIyNTQ3MTQ3MjpDcDEyNTI6MTYwMDU2MDE0MjAzNzpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjIwX1NQNC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:02:22
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R20_SP4.0
*-----------------------------------------------------------------------------
* Modification History :
*ZIT-UPG-R13-R19  : NO CHANGES
*-----------------------------------------------------------------------------
* <Rating>-24</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE TNA.CARD.BATCH.FIELDS
*-----------------------------------------------------------------------------
*********************************************************************
*                      PROJET CHALLENGE 24
*********************************************************************
*
* @author    RANIA
* @stereotype H
*********************************************************************
*-----------------------------------------------------------------------------
*** <region name= Header>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*** </region>
*-----------------------------------------------------------------------------
* <Main controlling section>
*----------------------------------------------------------------------

    GOSUB INITIALISATION
    GOSUB MAIN.PROCESS

RETURN
*---------------------------------------------------------------------------
INITIALISATION:
*file opening, variable set up

RETURN
*---------------------------------------------------------------------------
MAIN.PROCESS:
*main subroutine processing
*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", EB.Template.T24String);* Define Table id


*---------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("DESCRIPTION","30","A","");*
    EB.Template.TableAddfielddefinition("BRANCH.CODE","9","A","");*
    EB.Template.FieldSetcheckfile("COMPANY")
    EB.Template.TableAddfielddefinition("NUM.CREATE","009","","");*
    EB.Template.TableAddfielddefinition("NUM.REPLACE","009","","");*
    EB.Template.TableAddfielddefinition("NUM.MODIF","009","","");*
    EB.Template.TableAddfielddefinition("NUM.CANCELED","009","","");*
    EB.Template.TableAddfielddefinition("NUM.PROD.REQ","009","","");*
    EB.Template.TableAddfielddefinition("NUM.PIN.REQ","009","","");*
    EB.Template.TableAddfielddefinition("NUM.RENEW","009","","");*
    EB.Template.TableAddfieldwitheblookup("BATCH.STATUS","STATUS","");*
 
*-----------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
    EB.Template.TableSetauditposition() ;* Poputale audit information
 
*-----------------------------------------------------------------------------
RETURN
* ----------------------------------------------------------------------------
END
