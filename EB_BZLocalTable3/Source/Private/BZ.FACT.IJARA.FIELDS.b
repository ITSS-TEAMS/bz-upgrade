* @ValidationCode : MjozMjI1MjAwOkNwMTI1MjoxNjAwNTYyMTkyMzUzOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:36:32
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
$PACKAGE EB.BZLocalTable3
SUBROUTINE BZ.FACT.IJARA.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @ZEKI
* 20120517
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19  :FM CHANGED TO @FM
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
    EB.Template.TableDefineid("ID", "" : @FM : "60" : @FM : "A")  ;*CHANGED
*-----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("NUM.CPTE","19", "A", "")
    EB.Template.FieldSetcheckfile("ACCOUNT")

    EB.Template.TableAddfielddefinition("CODE.CLIENT","10", "A", "")
    EB.Template.FieldSetcheckfile("CUSTOMER")

    EB.Template.TableAddfielddefinition("AGENCE","4", "A", "")
    EB.Template.FieldSetcheckfile("DEPT.ACCT.OFFICER")

    EB.Template.TableAddfielddefinition("DATE.OPERATION","8", "D", "")

    EB.Template.TableAddfielddefinition("DATE.GENERATION","8", "D", "")

    EB.Template.TableAddfielddefinition("NOM.CLIENT","35", "A", "")
    EB.Template.TableAddfielddefinition("ADRESSE","100", "A", "")
    EB.Template.TableAddfielddefinition("MAT.FISCALE","35", "A", "")
    EB.Template.TableAddfielddefinition("NUM.CONTRAT","35", "A", "")
    EB.Template.TableAddfielddefinition("NUM.FACTURE","35", "A", "")
    EB.Template.TableAddfielddefinition("MOIS","2", "A", "")


    EB.Template.TableAddfielddefinition("DATE.EMISSION","8", "D", "")

    EB.Template.TableAddfielddefinition("DATE.ECHEANCE","8", "D", "")


    EB.Template.TableAddfielddefinition("PERIODE.DU","10", "A", "")
    EB.Template.TableAddfielddefinition("PERIODE.AU","10", "A", "")
    EB.Template.TableAddfielddefinition("DESC.BIEN","35", "A", "")

    EB.Template.TableAddfielddefinition("MONTANT.PRINC","35", "A", "")
    EB.Template.TableAddfielddefinition("MONTANT.PRFT","35", "A", "")
    EB.Template.TableAddfielddefinition("MONTANT.LOYER.HT","35", "A", "")
    EB.Template.TableAddfielddefinition("MONTANT.TVA","35", "A", "")
    EB.Template.TableAddfielddefinition("MONTANT.TTC","35", "A", "")

    EB.Template.TableAddfielddefinition("MONTANT.COMM.ECH","35", "A", "")
    EB.Template.TableAddfielddefinition("MONTANT.TVA.ECH","35", "A", "")

    EB.Template.TableAddfielddefinition("MONTANT.TIMBRE","35", "A", "")
    EB.Template.TableAddfielddefinition("FRAIS.PORT.LETTRE","35", "A", "")

    EB.Template.TableAddfielddefinition("MONTANT.TOT.PAYER","35", "A", "")

    EB.Template.TableAddfielddefinition("MONTANT.TOT.LETTRE","200", "A", "")
    EB.Template.TableAddfielddefinition("MONTANT.TAKAFUL","35", "A", "")

    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
