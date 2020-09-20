* @ValidationCode : Mjo1NzMxNzk2NzA6Q3AxMjUyOjE2MDA1NjAxNDM2MTg6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIyMF9TUDQuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:02:23
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
* <Rating>-24</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE TNA.CARD.GEN.FICHIER.FIELDS
*-----------------------------------------------------------------------------
*********************************************************************
*                      PROJET CHALLENGE 24
*********************************************************************
*
* @author    RANIA
*

* @revby
*
* @stereotype H
*-----------------------------------------------------------------------------
* Modification History :

*ZIT-UPG-R13-R19 : NO CHANGES
*-----------------------------------------------------------------------------
*** <region name= Header>
*ZIT-UPG-R13-R19/S
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;

    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
*ZIT-UPG-R13-R19/E
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

    EB.Template.TableAddfieldwitheblookup("ALL.BATCH","CARD","");*
*CALL Table.addFieldDefinition("ALL.BATCH","8","","");*
    EB.Template.TableAddfielddefinition("BATCH.NUM","0011","","");*
*CALL Table.addFieldDefinition("NOM.REPERTOIRE","15","A","");*

*-----------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
    EB.Template.TableSetauditposition() ;* Poputale audit information
 
*-----------------------------------------------------------------------------
RETURN
* ----------------------------------------------------------------------------
END
