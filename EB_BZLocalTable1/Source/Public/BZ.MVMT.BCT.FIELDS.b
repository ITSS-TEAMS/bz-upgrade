* @ValidationCode : Mjo5ODEwMzI0NDA6Q3AxMjUyOjE2MDA0NzkyMjU2Mzg6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIxOF9BTVIuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:33:45
* @ValidationInfo : Encoding          : Cp1252
* @ValidationInfo : User Name         : Administrateur
* @ValidationInfo : Nb tests success  : N/A
* @ValidationInfo : Nb tests failure  : N/A
* @ValidationInfo : Rating            : N/A
* @ValidationInfo : Coverage          : N/A
* @ValidationInfo : Strict flag       : true
* @ValidationInfo : Bypass GateKeeper : true
* @ValidationInfo : Compiler Version  : R18_AMR.0
*-----------------------------------------------------------------------------
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.MVMT.BCT.FIELDS
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
*ZIT-UPG-R13-R19-FM TO @FM
* ----------------------------------------------------------------------------

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
    EB.Template.TableDefineid("ID", "" : @FM : "65" : @FM : "A") ;* TODAY:CMC7
*-----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("DATE.OPERATION", "8","D","")

    EB.Template.TableAddfielddefinition("TYPE.VALEUR", "4", "" : @FM : "CHQE_CHQM_EFFE_EFFM_VIR_PRL_", "")

    EB.Template.TableAddfielddefinition("TYPE.MVMT", "6", "" : @FM : "EMIS_REPRIS_RECU_RENDU_", "")

    EB.Template.TableAddfielddefinition("DEVISE","3","ANY","")
    EB.Template.FieldSetcheckfile("CURRENCY")

    EB.Template.TableAddamountfield("MONTANT","15", T24_NUMERIC, "")


    EB.Template.TableAddfielddefinition("BQ.DEST","2","A","")

    EB.Template.TableAddfielddefinition("STATUT", "8","A","")

    EB.Template.TableAddfielddefinition("CODE.VALEUR", "2","A","")

    EB.Template.TableAddfielddefinition("REF.TRANSACTION", "12","A","")
    
*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition() ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
