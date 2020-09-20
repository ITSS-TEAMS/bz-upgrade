* @ValidationCode : MjoxNzU1MTk0OTY5OkNwMTI1MjoxNjAwNDg0NzE5ODU1OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
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
$PACKAGE EB.BZLocalTable2
SUBROUTINE BZ.LI.DECISION.FINANCEMENT.FIELDS

*-----------------------------------------------------------------------------
*<doc>
* Field definition de l'application Demande de financement
* @author Fahmi Abdeltif
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19 : Converted FM to @FM.
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
*------------------------------------------------------------------------------
    EB.Template.TableDefineid("ID.FIN", "" : @FM : "25" : @FM : "A")          ;* Define Table id

*------------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition('CUSTOMER', '10', 'CUS','')
    EB.Template.FieldSetcheckfile('CUSTOMER')
    EB.Template.TableAddfieldwitheblookup('TYPE.DECISION','BZ.LISTE.DECISIONS.POSSIBLES','')
    EB.Template.TableAddfielddefinition('DATE.DECISION','8','D', '')
    EB.Template.TableAddfielddefinition('VALIDITE.DECISION','8','D', '')

    EB.Template.TableAddfieldwitheblookup('XX<NIVEAU.LIMITE','NIVEAU.LIMITE','')
    EB.Template.TableAddfielddefinition('XX-TYPE.LIMIT','1','' : @FM : 'Y_N', '')
    EB.Template.TableAddfielddefinition('XX-DEVISE', '3', 'CCY', '')
    EB.Template.FieldSetcheckfile('CURRENCY')


    EB.Template.TableAddfielddefinition('XX-ID.LIMIT','30','A', '')
    EB.Template.TableAddfielddefinition('XX-DATE.LI.TIRAGE', '8','D', '')
    EB.Template.TableAddfielddefinition('XX-PRODUIT.NIVEAU.1','10','A','')
    EB.Template.FieldSetcheckfile('LIMIT.REFERENCE')
    EB.Template.TableAddamountfield('XX-MNT.FIN.1', '19','','')
    EB.Template.TableAddfielddefinition('XX-XX<PRODUIT.NIVEAU.2','10','A','')
    EB.Template.FieldSetcheckfile('LIMIT.REFERENCE')
    EB.Template.TableAddamountfield('XX-XX>MNT.FIN.2', '19','','')
    EB.Template.TableAddfielddefinition('XX-XX<PRODUIT.NIVEAU.3','10','A','')
    EB.Template.FieldSetcheckfile('LIMIT.REFERENCE')
    EB.Template.TableAddamountfield('XX-XX>MNT.FIN.3', '19','','')
    EB.Template.TableAddfielddefinition('XX-XX<PRODUIT.NIVEAU.4','10','A','')
    EB.Template.FieldSetcheckfile('LIMIT.REFERENCE')
    EB.Template.TableAddamountfield('XX-XX>MNT.FIN.4', '19','','')
    EB.Template.TableAddfielddefinition('XX-XX<PRODUIT.NIVEAU.5','10','A','')
    EB.Template.FieldSetcheckfile('LIMIT.REFERENCE')
    EB.Template.TableAddamountfield('XX-XX>MNT.FIN.5', '19','','')
    EB.Template.TableAddfielddefinition('XX-XX<PRODUIT.NIVEAU.6','10','A','')
    EB.Template.FieldSetcheckfile('LIMIT.REFERENCE')
    EB.Template.TableAddamountfield('XX-XX>MNT.FIN.6', '19','','')
    EB.Template.TableAddfielddefinition('XX-XX<PRODUIT.NIVEAU.7','10','A','')
    EB.Template.FieldSetcheckfile('LIMIT.REFERENCE')
    EB.Template.TableAddamountfield('XX-XX>MNT.FIN.7', '19','','')

    EB.Template.TableAddamountfield('XX-MNT.FIN', '19','', '')
    EB.Template.TableAddamountfield('XX-NOUVEAU.MNT.FIN', '19','', '')
    EB.Template.TableAddfielddefinition('XX-ECHEANCE.FIN','8','D', '')
    EB.Template.TableAddfielddefinition('XX-ECHEANCE.ANCIENNE','8','D','')

    EB.Template.TableAddfielddefinition('XX-XX<CODE.GARANTIE','3','A','')
    EB.Template.FieldSetcheckfile('COLLATERAL.CODE')
    EB.Template.TableAddfielddefinition('XX-XX-LIBELLE.GARANTIE','25','ANY','')
    EB.Template.TableAddamountfield('XX-XX-MNT.GARANTIE','19','','')
    EB.Template.TableAddfieldwitheblookup('XX-XX-RANG.GARANTIE','RANG.GARANTIE.EXIGEE','')
    EB.Template.TableAddfielddefinition('XX-XX-PARI.PASSU','3','' : @FM : 'OUI_NON', '')
    EB.Template.TableAddfielddefinition('XX-XX-BANK.PARI.PASSU','35', 'A' ,'')
    EB.Template.TableAddfielddefinition('XX-XX>ID.COLL.RIGHT','30', 'A', '')
    EB.Template.FieldSetcheckfile('COLLATERAL.RIGHT')

    EB.Template.TableAddfielddefinition('XX>RESERVE','50','TEXT','')


    EB.Template.TableAddfielddefinition('REMARQUE.DECISION', '50', 'TEXT', '')
    EB.Template.TableAddfielddefinition('STATUT.DECISION','12','' : @FM : 'NON.ACCEPTEE_ACCEPTEE', '')
    EB.Template.TableAddfielddefinition('STATUT.REPARTITION','12','' : @FM : 'REPARTIE_NON.REPARTIE', '')
    EB.Template.TableAddfielddefinition('STATUT.ACTIVATION','10','' : @FM : 'ACTIVE_NON.ACTIVE', '')
    EB.Template.TableAddfielddefinition('FEU.VERT.LIMITE','5','' : @FM : 'VERT_ROUGE', '')
    EB.Template.TableAddfielddefinition('STATUT.FORCAGE','12','' : @FM : 'FORCEE_NON.FORCEE', '')

    EB.Template.TableAddfieldwitheblookup('STATUT.GARANTIE','STATUT.GARANTIE','')

    EB.Template.TableAddfielddefinition('STATUT.AFFECTATION','20','' : @FM : 'AVEC.AFFECTATION_SANS.AFFECTATION', '')
    EB.Template.TableAddfielddefinition('DATE.ACCEPTATION','8','D','')
    EB.Template.TableAddfielddefinition('ACCEPTATION.CLIENT','3','' : @FM : 'OUI_NON','')
    EB.Template.TableAddfielddefinition('DATE.ACTIVATION','8','D','')
    EB.Template.TableAddfielddefinition('ACTIVATION','3','' : @FM : 'OUI_NON','')
    EB.Template.TableAddfielddefinition('DATE.FORCAGE','8','D','')
    EB.Template.TableAddfielddefinition('RESERVES','50','TEXT','')
    EB.Template.TableAddfielddefinition('XX<DEVISE.TOTAL','3','CCY','')
    EB.Template.TableAddamountfield('XX>MONTANT.TOTAL','19','','')
    EB.Template.TableAddfielddefinition('REF.PARENT','20','A','')
    EB.Template.TableAddfielddefinition('LAST.VERSION','50','A','')
    EB.Template.TableAddfielddefinition('XX<ID.RENOUVEL','10','A','')
    EB.Template.TableAddfielddefinition('XX<ID.EXTENSION','10','A','')
    EB.Template.TableAddfielddefinition('XX<REFERENCE.LIMIT','50','A','')
    EB.Template.TableAddfielddefinition('XX-COLLATERAL.RIGHT','35','A','')
    EB.Template.TableAddfielddefinition('XX>DECISION.LEVEL','2','','')
    EB.Template.TableAddfielddefinition('REPARTITION','3','' : @FM : 'OUI_NON','')
    EB.Template.TableAddfielddefinition('RESERVED.7','10','A','')
    EB.Template.TableAddfielddefinition('RESERVED.8','10','A','')
    EB.Template.TableAddfielddefinition('RESERVED.9','10','A','')
    EB.Template.TableAddfielddefinition('RESERVED.10','10','A','')
    EB.Template.TableAddfielddefinition('RESERVED.11','10','A','')


*-----------------------------------------------------------------------------

    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
