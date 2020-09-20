* @ValidationCode : MjozMzMxNjUyMzU6Q3AxMjUyOjE2MDA0NzkwOTY4Mjc6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIxOV9BTVIuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:31:36
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
SUBROUTINE BZ.IS.CHQ.FRS.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* Field definition de l'application suivi des cheques fournisseurs'
* @author hicham.atoui@targa-consult.com
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19    : FM CHANGED TO @FM
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
*  CALL Table.defineId("ID", T24_String)         ;* Define Table id
    EB.Template.TableDefineid("ID.FRS", "" : @FM : "15" : @FM : "A")          ;* Define Table id
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("NUM.CHEQUE","15", "A", "")
    EB.Template.TableAddfielddefinition("REF.DEMANDE","15", "A", "")
    EB.Template.TableAddfielddefinition("CODE.FRS", "10.1", "", "")
    EB.Template.FieldSetcheckfile("BZ.ISB.FOURNISSEUR")
    EB.Template.TableAddfielddefinition("CUSTOMER", "10", "ANY", "")
    EB.Template.FieldSetcheckfile("CUSTOMER")
    EB.Template.TableAddamountfield("MONTANT.PAIEMENT", "15","", "")
    EB.Template.TableAddfielddefinition("CPTE.CHQ.LIV","15", "ANY", "")
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("DATE.PAIMENT","8","D","")
    EB.Template.TableAddfielddefinition("DATE.LIVRAISON","8","D","")
    EB.Template.TableAddfielddefinition("UNITE.GESTION","5", "A", "")
    EB.Template.FieldSetcheckfile("DEPT.ACCT.OFFICER")
    EB.Template.TableAddfielddefinition("STATUT","15", "A", "")
    EB.Template.TableAddfielddefinition("REF.CREATION","15", "A", "")
    EB.Template.TableAddfielddefinition("REF.APUREMENT","15", "A", "")
    EB.Template.TableAddfielddefinition("NOM.FRS","35", "A", "")
    EB.Template.TableAddfielddefinition("UNITE.TRANS","5", "A", "")
    EB.Template.FieldSetcheckfile("DEPT.ACCT.OFFICER")
    EB.Template.TableAddfielddefinition("DATE.TRANS","8","D","")
*-----------------------------------------------------------------------------

    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
