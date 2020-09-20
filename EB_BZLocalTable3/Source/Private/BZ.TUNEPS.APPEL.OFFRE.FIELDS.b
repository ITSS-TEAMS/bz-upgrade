* @ValidationCode : MjotMTIwMzUzNTI0OkNwMTI1MjoxNjAwNTYyNzU0NTc1OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:45:54
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
* Modification History :
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Converted FM to @FM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable3
SUBROUTINE BZ.TUNEPS.APPEL.OFFRE.FIELDS

*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
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
    EB.Template.TableDefineid("ID", "" : @FM : "25" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("HEURE.RECU", "19","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("CODE.RESULTAT.RECU", "4","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("MESSAGE.RESULTAT", "20","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("ID.TRANSMISSION", "20","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("NOM.AVIS.AO", "200","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("NUM.AO", "15","A","")
    EB.Template.TableAddfielddefinition("NUM.SEQ.AO", "2","A","")
    EB.Template.TableAddfielddefinition("XX<NUM.LOT", "3","A","")
    EB.Template.TableAddfielddefinition("XX-NOM.LOT", "200","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("XX-DETAIL.LOT", "150","T24.TEXT" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("XX-DEVISE", "3","CCY" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.FieldSetcheckfile('CURRENCY')
    EB.Template.TableAddfielddefinition("XX>MONTANT.AO", "17","AMT" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("NOM.ACHETEUR", "200","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("CODE.ACHETEUR", "10","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("AVIS.REEL", "1","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("VALIDITE.OFFRE", "4","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("CATEGORIE.ACTIV", "4","A": @FM :"" : @FM :"NOINPUT", "")
*    CALL Field.setCheckFile("BZ.TUNEPS.ACTIVITE")
    EB.Template.TableAddfielddefinition("MODE.PASSATION", "1","A" : @FM :"" : @FM :"NOINPUT", "")
*  CALL Field.setCheckFile("BZ.TUNEPS.PASSATION")
    EB.Template.TableAddfielddefinition("AO.ELECTRONIQUE", "1","A" : @FM :"" : @FM :"NOINPUT", "")
*   CALL Field.setCheckFile("BZ.TUNEPS.AO.ELEC")
    EB.Template.TableAddfielddefinition("DATE.PUBLICATION", "19","A": @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("DATE.DEB.RECP", "19","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("DATE.FIN.RECP", "19","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("DATE.OUV.PLIS", "19","A" : @FM :"" : @FM :"NOINPUT", "")

**RESERVED
    EB.Template.TableAddfielddefinition("DESC.ACTIV", "50","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("DESC.PASSATION", "20","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("DESC.AO.ELEC", "20","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("RESERVED.4", "10","A" : @FM :"" : @FM :"NOINPUT", "")
    EB.Template.TableAddfielddefinition("RESERVED.5", "10","A" : @FM :"" : @FM :"NOINPUT", "")

*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
