* @ValidationCode : Mjo4Mzg0ODM0ODY6Q3AxMjUyOjE2MDA0NzkxNDc4MjA6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIxOV9BTVIuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:32:27
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
SUBROUTINE BZ.MDP.CHQ.CODE.PRESENTATION.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author FEHMI
* @stereotype H
**
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
*
* Modification History:
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Converted FM to @FM
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
    EB.Template.TableDefineid("ID", "" : @FM : "27" : @FM : "A")    ;* CMC7
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("CODE.VALEUR", "2", "A", "")

    EB.Template.TableAddfielddefinition("REF.FICHIER","65", "A", "")
    EB.Template.TableAddfielddefinition("MONTANT.REGUL","15", "AMT", "")
    EB.Template.TableAddfielddefinition("MONTANT.INT","15", "AMT", "")
    EB.Template.TableAddfielddefinition("DATE.EMISS","8", "D", "")
    EB.Template.TableAddfielddefinition("DATE.DOC","8", "D", "")
    EB.Template.TableAddfielddefinition("NUM.DOC","4", "A", "")

*-----------------------------------------------------------------------------

    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
    