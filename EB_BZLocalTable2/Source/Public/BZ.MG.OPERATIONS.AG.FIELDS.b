* @ValidationCode : MjotMTk0MzkxMDgzOkNwMTI1MjoxNjAwNDg0NzIwNDYwOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
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
SUBROUTINE BZ.MG.OPERATIONS.AG.FIELDS

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
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-FM TO @FM
*-----------------------------------------------------------------------------

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
    EB.Template.TableDefineid("ID", "" : @FM : "45" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("REFERENCE", "12","A","")
    EB.Template.TableAddfielddefinition("DATE.OPERATION","8","D","")
    EB.Template.TableAddfielddefinition("MONTANT","20","AMT","")
    EB.Template.TableAddfielddefinition("CODE.AGENCE","4","A","")
    EB.Template.FieldSetcheckfile('DEPT.ACCT.OFFICER')
    EB.Template.TableAddfielddefinition("CODE.REFERENCE","8","A","")
    EB.Template.TableAddfielddefinition("TELLER.ID","4","A","")
    EB.Template.TableAddfielddefinition("BENEFICIAIRE","35","A","")
    EB.Template.TableAddfielddefinition("TYPE.PIECE","10","A","")
    EB.Template.TableAddfielddefinition("NUM.PIECE","12","A","")
    EB.Template.TableAddfielddefinition("DATE.DELIVRANCE","8","D","")
    EB.Template.TableAddfielddefinition("DEVISE","3","CCY","")
    EB.Template.TableAddfielddefinition("OBJET.OP", "35","":@FM : "Aide familiale_Frais de scolarite/Education_Frais hospitalisation/Sante_Frais de sejour_Reglement prestation_Investissement Immobilier_Autre investissement_Autre","")
    EB.Template.TableAddfielddefinition("DETAIL.OBJET.OP","100","A","")
    EB.Template.TableAddfielddefinition("NUM.TEL","11","A","")
    EB.Template.TableAddfielddefinition("EMAIL","35","A","")
    EB.Template.TableAddfielddefinition("ADRESSE.BENEF","100","A","")
    EB.Template.TableAddfielddefinition("RESIDENCE", "2","":@FM : "R_NR","")
    EB.Template.TableAddfielddefinition("NATIONALITE","3","A","")
    EB.Template.FieldSetcheckfile('COUNTRY')
    EB.Template.TableAddfielddefinition("CLIENT.BZ", "3","":@FM : "OUI_NON","")
    EB.Template.TableAddfielddefinition("ID.CLIENT.BZ","6","A","")
    EB.Template.TableAddfielddefinition("DATE.EXPIRATION","8","D","")
    EB.Template.TableAddfielddefinition("REL.EXP.BENEF", "18","":@FM : "Relation Familiale_Relation d'affaire","")
    EB.Template.TableAddfielddefinition("DETAIL.REL","100","A","")
    EB.Template.TableAddfielddefinition("PROFESSION","35","A","")
    EB.Template.TableAddfielddefinition("PAYS.ENVOI","3","A","")
    EB.Template.FieldSetcheckfile('COUNTRY')
**RESERVED
    EB.Template.TableAddfielddefinition("ETAT.CIVIL", "12","A","")
    EB.Template.TableAddfielddefinition("DONNEUR.ORDRE", "35","A","")
    EB.Template.TableAddfielddefinition("RESERVED.3", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.4", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.5", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.6", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.7", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.8", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.9", "10","A","")
    EB.Template.TableAddfielddefinition("RESERVED.10", "10","A","")
*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
