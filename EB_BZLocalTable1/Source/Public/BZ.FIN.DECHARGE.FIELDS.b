* @ValidationCode : MjoyMDAwODUzMTE6Q3AxMjUyOjE2MDA0NzkwNzAxMzA6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIxOF9BTVIuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:31:10
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
* <Rating>-2</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.FIN.DECHARGE.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* Field definition de l'application Demande de financement
* @author Zeki Ben Othmen (Zeki.BenOthmen@banquezitouna.com)
* @stereotype H
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
* -----------------------
*ZIT-UPG-R13-R19- FM TO @FM;
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
    EB.Template.TableDefineid("ID", "" : @FM : "15" : @FM : "A")    ;* Define Table id
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("CUSTOMER", "10", "ANY", "")
    EB.Template.FieldSetcheckfile("CUSTOMER")
    EB.Template.TableAddfielddefinition("AGENCE", "4", "ANY", "")
    EB.Template.FieldSetcheckfile("DEPT.ACCT.OFFICER")
    EB.Template.TableAddfielddefinition("TYPE.PRODUIT","3", "A", "")
    EB.Template.FieldSetcheckfile("IS.H.PRODUCT.TYPES")
    EB.Template.TableAddfielddefinition("PRODUIT", "3", "", "")
    EB.Template.FieldSetcheckfile("IS.H.PRODUCTS")
    EB.Template.TableAddamountfield("MONTANT.BIEN", "15","", "")
    EB.Template.TableAddamountfield("MONTANT.ACOMPTE", "15","", "")
    EB.Template.TableAddamountfield("MONTANT.FIN", "15","", "")
    EB.Template.TableAddfielddefinition("DATE.DECHARGE","8","D","")
    EB.Template.TableAddfielddefinition("DUREE.FINANCEMENT","8",T24_NUMERIC,"")
    EB.Template.TableAddfielddefinition("TYPE.FINANCEMENT","10", "" : @FM : "Immo_HorsImmo_", "")
    EB.Template.TableAddfielddefinition("REF.UTILISEE","3", "" : @FM : "Oui_Non_", "")
    EB.Template.TableAddreservedfield('RESERVED.4')
    EB.Template.TableAddreservedfield('RESERVED.5')
    EB.Template.TableAddreservedfield('RESERVED.6')
*-----------------------------------------------------------------------------

    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
