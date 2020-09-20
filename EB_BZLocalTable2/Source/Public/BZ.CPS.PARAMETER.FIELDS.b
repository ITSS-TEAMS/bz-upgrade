* @ValidationCode : MjoxNTQyODk1OTcwOkNwMTI1MjoxNjAwNDg0NzE5MDczOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 04:05:19
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
SUBROUTINE BZ.CPS.PARAMETER.FIELDS
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
* $INSERT I_COMMON - Not Used anymore;N
* $INSERT I_EQUATE - Not Used anymore;E
* $INSERT I_DataTypes - Not Used anymore;s
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*** </region>
*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "6" : @FM : "A")     ;* SYSTEM
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("REP.IN", "35","A","")    ;*MDP.OFS.IN
    EB.Template.TableAddfielddefinition("REP.OUT", "35","A","")
    EB.Template.TableAddfielddefinition("OFS.REP.IN", "35","A","")

    EB.Template.TableAddfielddefinition("COMPTE.CHQ.DEPOT", "20" ,"A","")


    EB.Template.TableAddfielddefinition("COMPTE.CHQ.SIBTEL", "20","A","")


    EB.Template.TableAddfielddefinition("COMPTE.CHQ.TECH", "20","A","")

    EB.Template.TableAddfielddefinition("COMPTE.CHQ.REPRIS", "20","A","")


    EB.Template.TableAddfielddefinition("COMPTE.CHQ.PREAVIS", "20","A","")

    EB.Template.TableAddfielddefinition("STATUT.JOURNEE", "5","A","")

    EB.Template.TableAddfielddefinition("DELAI.COMPENSATION", "3","","")

    EB.Template.TableAddfielddefinition("DELAI.PREAVIS", "3","","")

    EB.Template.TableAddfielddefinition("OFS.LOGIN", "16","A","")

    EB.Template.TableAddfielddefinition("OFS.PASSWD", "8","A","")

    EB.Template.TableAddfielddefinition("COMPTE.CHQR.BQ", "20","A","")

    EB.Template.TableAddfielddefinition("COMPTE.CHQR.AG", "20","A","")

    EB.Template.TableAddfielddefinition("COMPTE.POD", "20","A","")

    EB.Template.TableAddfielddefinition("COMPTE.CHQ.CERTIF", "20","A","")

    EB.Template.TableAddfielddefinition("COMPTE.PROV.ARP", "20","A","")

    EB.Template.TableAddfielddefinition("COMPTE.PRV.EMI", "20","A","")

    EB.Template.TableAddfielddefinition("COMPTE.PRV.EMI.AG", "20","A","")

    EB.Template.TableAddfielddefinition("COMPTE.CHQ.REPR.AG", "20","A","")

    EB.Template.TableAddfielddefinition("COMPTE.CHQ.PREA.AG", "20","A","")

    EB.Template.TableAddfielddefinition("COMPTE.POD.AG", "20","A","")

    EB.Template.TableAddfielddefinition("COMPTE.CHQ.RENDU", "20","A","")
    EB.Template.TableAddfielddefinition("CPTE.CHQ.RENDU.AG", "20","A","")
    EB.Template.TableAddfielddefinition("REP.DDE.CHEQUIER", "35","A","")
    EB.Template.TableAddfielddefinition("CPT.BON.A.PAYER", "18","A","")

    EB.Template.TableAddfielddefinition("COMPTE.NET.BCT", "20","A","")

    EB.Template.TableAddfielddefinition("COMM.REMISE", "20","A","")
    EB.Template.FieldSetcheckfile("FT.COMMISSION.TYPE")

    EB.Template.TableAddfielddefinition("COMM.TAX.REMISE", "20","A","")
    EB.Template.FieldSetcheckfile("FT.COMMISSION.TYPE")

    EB.Template.TableAddfielddefinition("CPTE.EFFE.RC.INTER", "20","A","")

    EB.Template.TableAddfielddefinition("CPTE.EFFE.RC.INTRA", "20","A","")

    EB.Template.TableAddfielddefinition("DELAI.PRES.EFF", "3","","")
    EB.Template.TableAddfielddefinition("DELAI.41", "3","","")
    EB.Template.TableAddfielddefinition("DELAI.40.PLACE", "3","","")
    EB.Template.TableAddfielddefinition("DELAI.40.HPLACE", "3","","")
    EB.Template.TableAddfielddefinition("STATUT.JOURNEE.EFF", "5","A","")
    EB.Template.TableAddfielddefinition("CPT.EFFET.EMIS", "16","A","")
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("CPT.REPRIS", "16","A","")
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("CPT.EFFET.RECU", "16","A","")
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("CPT.EFFET.RENDU", "16","A","")
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("REP.POSTE","35","A","")
    EB.Template.TableAddfielddefinition("VIR.TIME","6","A","")
    EB.Template.TableAddfielddefinition("VIR.SEUIL","15","AMT","")
    EB.Template.TableAddfielddefinition("STATUT.JOURNEE.PRL", "5","A","")

******************
    EB.Template.TableAddfielddefinition("REDV.HUIS.MNT","15","AMT","")
    EB.Template.TableAddfielddefinition("REDV.HUIS.TX","2","","")
******************

*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
