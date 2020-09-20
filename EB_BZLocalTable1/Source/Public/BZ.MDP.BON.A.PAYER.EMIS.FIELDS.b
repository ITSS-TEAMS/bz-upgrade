* @ValidationCode : Mjo3Njc5NzYxMzQ6Q3AxMjUyOjE2MDA0NzkxNDc0Mzg6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIxOV9BTVIuMDotMTotMQ==
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
SUBROUTINE BZ.MDP.BON.A.PAYER.EMIS.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author Bounouara Fehmi
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
* ----------------------------------------------------------------------------
*Modification History:
*ZIT-UPG-R13-R19 :  removed BP's and changed INCLUDE to INSERT
*                   FM converted to @FM
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
    EB.Template.TableDefineid("ID", "" : @FM : "12" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("NUM.COMPTE", "10","ACC","")
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("DATE.ECHEANCE", "8","D","")
    EB.Template.TableAddamountfield("MONTANT","15", T24_NUMERIC, "")
    EB.Template.TableAddfielddefinition("BANQUE.BENEF", "15","A","")
    EB.Template.TableAddfielddefinition("NOM.BENEF", "30","A","")
    EB.Template.TableAddfielddefinition("DATE.REJET", "8","D","")
    EB.Template.TableAddfielddefinition("DATE.CREATION", "8","D","")
    EB.Template.TableAddfielddefinition("STATUT", "2","A","")
    EB.Template.TableAddfielddefinition("DATE.APUREMENT", "8","D","")
    EB.Template.TableAddfielddefinition("CPT.INTERNE", "16","A","")
    EB.Template.FieldSetcheckfile("ACCOUNT")

*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
