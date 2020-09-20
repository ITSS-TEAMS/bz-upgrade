* @ValidationCode : Mjo2NTI5Mjg3NDU6Q3AxMjUyOjE2MDA0Nzg5MjM5MzE6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIxOV9BTVIuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:28:43
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
* <Rating>-2</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BIAT.MATRICES.CBP.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* Template for field definitions routine YOURAPPLICATION.FIELDS
*
* @author azdadou@temenos.com
* @stereotype H
* </doc>
*-----------------------------------------------------------------------------
* Modification History :
*
* 26/04/2010 - Anas Zdadou   New Template changes
*-------------------------------------------------
*ZIT-UPG-R13-R19 :   FM converted to @FM
*-----------------------------------------------------------------------------
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
    EB.Template.TableDefineid("ID", "" : @FM : "24" : @FM : "A")    ;* Define Table id
*-----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("DESCRIPTION","80","A","")
    EB.Template.TableAddfielddefinition("XX<MAT.CBP.LIEE","24","A","")
    EB.Template.FieldSetcheckfile("BZ.MATRICES.CBP")

    EB.Template.TableAddoptionsfield("XX-TRAITEMENT", "OK_NOK", "", "")
    EB.Template.TableAddoptionsfield("XX-TYPE.CBP", "FIGE_AUCHOIX", "", "")
    EB.Template.TableAddfielddefinition("XX-CBP","6","","")
    EB.Template.TableAddoptionsfield("XX-DOSSIER.CHANGE", "OUI", "", "")
    EB.Template.TableAddoptionsfield("XX>MEME.CLIENT", "OUI", "", "")
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
