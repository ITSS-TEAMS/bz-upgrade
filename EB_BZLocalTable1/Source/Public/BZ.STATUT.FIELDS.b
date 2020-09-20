* @ValidationCode : Mjo2MTg4MjA0ODk6Q3AxMjUyOjE2MDA0NzkzMTY1NjE6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIxOV9BTVIuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:35:16
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
* <Rating>-5</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.STATUT.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author ktalhaoui@temenos.com
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* 09 / 03 / 10 - ktalhaoui New Template changes

*ZIT-UPG-R13-R19:FM converted to @FM
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
    EB.Template.TableDefineid("ID", "" : @FM : "4" : @FM : "") ;* NUMERIC 1,2,3,...EX. POUR CHQ RECU :
*;* ID = 1, DESCRIPTION=GESTION DE PAIMENT DES CHEQUES RECUS,
*;* STATUT.1 = 1
*;* DESCR.1 = CHARGE
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("DESCRIPTION", "50","A","")

    EB.Template.TableAddfielddefinition("XX<STATUT", "4","A","")

    EB.Template.TableAddfielddefinition("XX>STATUT.DESC", "35","A","")


*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition() ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
