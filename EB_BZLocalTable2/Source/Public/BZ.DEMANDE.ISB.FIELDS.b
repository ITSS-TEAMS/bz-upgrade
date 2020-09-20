* @ValidationCode : MjoyODI0ODcwOTY6Q3AxMjUyOjE2MDA0ODQ3MTkyMDY6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIyMF9TUDQuMDotMTotMQ==
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
* <Rating>-2</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE BZ.DEMANDE.ISB.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* Field definition de l'application Demande de financement
* @author hicham.atoui@targa-consult.com
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*----------------------------------------------------------------------------
*ZIT-UPG-R13-R19 : FM converted to @FM
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
*  CALL Table.defineId("ID", T24_String)         ;* Define Table id
    EB.Template.TableDefineid("ID.FIN", "" : @FM : "15" : @FM : "A")          ;* Define Table id
*-----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("TYPE.PRODUIT","3.1", "A", "")
    EB.Template.FieldSetcheckfile("IS.H.PRODUCT.TYPES")
    EB.Template.TableAddfielddefinition("PRODUIT", "3.1", "", "")
    EB.Template.FieldSetcheckfile("IS.H.PRODUCTS")
    EB.Template.TableAddfielddefinition("CUSTOMER", "10.1", "ANY", "")
    EB.Template.FieldSetcheckfile("CUSTOMER")
    EB.Template.TableAddamountfield("MONTANT.BIEN", "15","", "")
    EB.Template.TableAddamountfield("MONTANT.ACOMPTE", "15","", "")
    EB.Template.TableAddamountfield("MONTANT.FIN", "15","", "")
    EB.Template.TableAddfielddefinition("DATE.DEMANDE","8","D","")
    EB.Template.TableAddfielddefinition("DATE.DECISION","8","D","")
    EB.Template.TableAddfielddefinition("TYPE.DEMANDE","15","" : @FM : "NOUVELLE_UTILISATION_MODIFICATION","")
    EB.Template.TableAddfielddefinition("SORT.DEMANDE","8","" : @FM : "ENCOURS_ACCEPTEE_REFUSEE","")
    EB.Template.TableAddfielddefinition("REC.GARANTIE","8","" : @FM : "OUI_NON","")
    EB.Template.TableAddfield("COMMENTAIRE", EB.Template.T24Text,"","")
    EB.Template.TableAddfield("COMM.DECISION", EB.Template.T24Text,"","")
    EB.Template.TableAddfielddefinition("DESC.BIEN","100","ANY","")
    EB.Template.TableAddfielddefinition("NATURE.BIEN","3", "A", "")
    EB.Template.FieldSetcheckfile("IS.H.COMMODITY")
    EB.Template.TableAddfieldwitheblookup("TYPE.PAY.FRS","IS.TYPE.PAY.FRS","")
    EB.Template.TableAddfielddefinition("N.CPTE.EPARGNE", "15", "ANY", "")
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("DATE.FINANACEMENT","8","D","")
    EB.Template.TableAddfielddefinition("DUREE.FINANCEMENT","8",T24_NUMERIC,"")
    EB.Template.TableAddfielddefinition("ECHEANCE","8","D","")
    EB.Template.TableAddfielddefinition("MARGE","5","R","")

    EB.Template.TableAddamountfield("MONTANT.PROFIT", "15","", "")
    EB.Template.TableAddfielddefinition("TMM","5","R","")
    EB.Template.TableAddfielddefinition("TAUX","5","R","")
    EB.Template.TableAddfielddefinition("FRANCHISE.FRS","8",T24_NUMERIC,"")
    EB.Template.TableAddfielddefinition("REF.LD.SIM", "20", "A", "")
    EB.Template.FieldSetcheckfile("LD.LOANS.AND.DEPOSITS")
    EB.Template.TableAddfielddefinition("REF.LD.FIN", "20", "A", "")
* CALL Field.setCheckFile("LD.LOANS.AND.DEPOSITS")
    EB.Template.TableAddfielddefinition("CPT.INT.FRS", "15", "ANY", "")
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfield("XX<ID.PAY.FRS", EB.Template.T24String,"Field_NOINPUT","")
    EB.Template.TableAddfield("XX>MNT.PAY.FRS", EB.Template.T24String,"Field_NOINPUT","")
    EB.Template.TableAddfield("REF.LIMIT", EB.Template.T24String,"Field_NOINPUT","")
    EB.Template.TableAddfield("XX<ID.ACOMPTE.TXN", EB.Template.T24String,"Field_NOINPUT","")
    EB.Template.TableAddfield("XX>MNT.PAY.ACOMPTE", EB.Template.T24String,"Field_NOINPUT","")

    EB.Template.TableAddamountfield("MNT.LIGNE.CR", "15","", "")
    EB.Template.TableAddfielddefinition("DATE.DEBUT.LDC","8","D","")
    EB.Template.TableAddfielddefinition("DATE.FIN.LDC","8","D","")

    EB.Template.TableAddfielddefinition("CUST.GAR", "10", "ANY", "")
    EB.Template.FieldSetcheckfile("CUSTOMER")
    EB.Template.TableAddfielddefinition("NB.GARANTIE","3",T24_NUMERIC,"")
    EB.Template.TableAddfield("DESC.GAR", EB.Template.T24Text,"","")
    EB.Template.TableAddfielddefinition("XX<COLL.TYPE", "3", "ANY", "")
    EB.Template.FieldSetcheckfile("COLLATERAL.TYPE")
    EB.Template.TableAddfielddefinition("XX-COLL.CODE", "3", "ANY", "")
    EB.Template.FieldSetcheckfile("COLLATERAL.CODE")
    EB.Template.TableAddfielddefinition("XX>OLD.GAR.T24", "20", "ANY", "")
    EB.Template.FieldSetcheckfile("COLLATERAL")

    EB.Template.TableAddamountfield("VAL.RESIDUELLE", "15","", "")
    EB.Template.TableAddfielddefinition("FORWARD.IJARA","3","" : @FM : "YES_NO","")

    EB.Template.TableAddfielddefinition("DEVISE", "3", "ANY", "")
    EB.Template.FieldSetcheckfile("CURRENCY")
    EB.Template.TableAddfielddefinition("REVOLVING","3","" : @FM : "OUI_NON","")
    EB.Template.TableAddfieldwitheblookup("FREQUENCE","IS.FREQUENCE","")

    EB.Template.TableAddfieldwitheblookup("TAUX.TVA.DEDUCT","IS.TVA.ACHAT","")
    EB.Template.TableAddamountfield("MNT.TVA.DEDUCT", "15","", "")
    EB.Template.TableAddamountfield("MNT.OUTSTAD.FRS", "15","", "")

    EB.Template.TableAddfielddefinition("ACTION","8","" : @FM : "DEMANDE_DECISION","")

    EB.Template.TableAddamountfield("MNT.LGN.CR.GLOB", "15","", "")
    EB.Template.TableAddfielddefinition("FREQ.REV.LIM","17","FQU","")
* T(Z)<4> = "RDDDD DD  DD #####"
    EB.Template.TableAddfielddefinition("NOTE.LIMIT","35", "ANY", "")
    EB.Template.TableAddfielddefinition("REF.CONTRAT.ISB","35", "A", "")
    EB.Template.TableAddfielddefinition("REF.TVA.TXN","35", "A", "")
    EB.Template.TableAddfielddefinition("XX.REF.RESEV.PROV","35", "A", "")
    EB.Template.TableAddamountfield("MONTANT.PROVISION", "15","", "")
    EB.Template.TableAddfielddefinition("PROV.STATUS","35", "A", "")
    EB.Template.TableAddfielddefinition("CPT.PROVISION.DB", "15", "ANY", "")
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("CPT.PROVISION.CR", "15", "ANY", "")
    EB.Template.FieldSetcheckfile("ACCOUNT")

    EB.Template.TableAddfielddefinition("XX.REF.LIB.PROV","35", "A", "")

    EB.Template.TableAddfielddefinition("XX.VR.REF.RESEV","35", "A", "")
    EB.Template.TableAddfielddefinition("VR.STATUS","35", "A", "")
    EB.Template.TableAddfielddefinition("VR.CPT", "15", "ANY", "")
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("XX.VR.REF.LIB","35", "A", "")

    EB.Template.TableAddfielddefinition("XX<GARANTIE","65", "ANY", "")
    EB.Template.FieldSetcheckfile("BZ.FIN.MUR.GARANTIES")
    EB.Template.TableAddfielddefinition("XX>COMMENTAIR.GAR","100", "ANY", "")
    EB.Template.TableAddfielddefinition("XX<RESERVE","65", "ANY", "")
    EB.Template.FieldSetcheckfile("BZ.FIN.MUR.CONDITIONS")
    EB.Template.TableAddfielddefinition("XX>COMMENTAIR.RES","100", "ANY", "")


    EB.Template.TableAddfielddefinition("DATE.VALIDITE","8","D","")
    EB.Template.TableAddfielddefinition("AUTRE.GARANTIE","100","ANY","")



*-----------------------------------------------------------------------------

    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
