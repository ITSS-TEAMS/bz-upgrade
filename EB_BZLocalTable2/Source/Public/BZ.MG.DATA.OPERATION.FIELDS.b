* @ValidationCode : Mjo3MDQ3ODk0MjM6Q3AxMjUyOjE2MDA0ODQ3MjA0MDY6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIyMF9TUDQuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 04:05:20
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
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE BZ.MG.DATA.OPERATION.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author
* @stereotype H
**
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
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
    EB.Template.TableDefineid("ID", "" : @FM : "35" : @FM : "A") ;
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("REF.OPERATION","8", "A", "")
    EB.Template.TableAddfielddefinition("BASE.AMT","19", "A", "")
    EB.Template.TableAddfielddefinition("COMMISSION.AMT","19", "A", "")
    EB.Template.TableAddfielddefinition("FX.MARGIN.AMT","19", "A", "")
    EB.Template.TableAddfielddefinition("AGENCE","4", "A", "")
    EB.Template.FieldSetcheckfile("DEPT.ACCT.OFFICER")
    EB.Template.TableAddfielddefinition("DATE.OPERATION","8", "D", "")
    EB.Template.TableAddfielddefinition("TIME.OPERATION","6", "A", "")
    EB.Template.TableAddfielddefinition("DEVISE","3", "CCY", "")
    EB.Template.TableAddfielddefinition("PAYS.ENVOI","2", "A", "")
    EB.Template.FieldSetcheckfile("COUNTRY")
    EB.Template.TableAddfielddefinition("AGENT","6", "A", "")
    EB.Template.TableAddfielddefinition("STATUT","10", "A", "")
    EB.Template.TableAddfielddefinition("REF.FICHIER","25", "A", "")
    EB.Template.TableAddfielddefinition("DATE.CHARGEMENT","8", "D", "")
    EB.Template.TableAddfielddefinition("CODE.ENREG","2", "A", "")
    EB.Template.TableAddfielddefinition("DATE.TRAITEMENT","8", "D", "")
    EB.Template.TableAddfielddefinition("TIME.TRAITEMENT","6", "A", "")
    EB.Template.TableAddfielddefinition("DATE.DEB.ACTIV","8", "D", "")
    EB.Template.TableAddfielddefinition("TIME.DEB.ACTIV","6", "A", "")
    EB.Template.TableAddfielddefinition("DATE.FIN.ACTIV","8", "D", "")
    EB.Template.TableAddfielddefinition("TIME.FIN.ACTIV","6", "A", "")
    EB.Template.TableAddfielddefinition("FX.DATE","8", "D", "")
    EB.Template.TableAddfielddefinition("FX.RATE","19", "A", "")
    EB.Template.TableAddfielddefinition("FX.REV.SHARE.AMT","19", "A", "")
    EB.Template.TableAddfielddefinition("JOURNEE","8","D","")
    
    EB.Template.TableAddfielddefinition("TOTAL.CHARGES", "19","A","")
    
    EB.Template.TableAddfielddefinition("TOTAL.EXCHANGE", "19","A","")
    
    EB.Template.TableAddfielddefinition("TOTAL.PRINCIPAL", "19","A","")
    
    EB.Template.TableAddfielddefinition("TOTAL.PRINCTND","19","A","")
    EB.Template.TableAddfielddefinition("TOTAL.NET.TND","19","A","")
    EB.Template.TableAddfielddefinition("TOTAL.CHARGTND","19","A","")
    EB.Template.TableAddfielddefinition("TOTAL.EXCHATND","19","A","")
    EB.Template.TableAddfielddefinition("NBR.OPERATION", "19","A","")
**RESERVED
    EB.Template.TableAddfielddefinition("RESERVED1","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED2","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED3","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED4","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED5","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED6","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED7","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED8","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED9","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED10","10", "A", "")

*-----------------------------------------------------------------------------

    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
