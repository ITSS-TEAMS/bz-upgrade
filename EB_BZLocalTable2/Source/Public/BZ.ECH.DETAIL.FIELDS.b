* @ValidationCode : MjotMTg2NDY5MTA3NDpDcDEyNTI6MTYwMDQ4NDcxOTI2NzpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjIwX1NQNC4wOi0xOi0x
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
* <Rating>-4</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE BZ.ECH.DETAIL.FIELDS
*----------------------------------------------------------------------------
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
*-----------------------
* ZIT_UPG_R13_TO_R19   : Changed FM to @FM
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
    EB.Template.TableDefineid("ID.ECH", "" : @FM : "15" : @FM : "A") ;* changed to @FM
*    CALL Table.defineId("ID.ECH", "" : FM : "15" : FM : "A")          ;* Define Table id
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("CATEGORIE","6", "A", "")
    EB.Template.TableAddfielddefinition("PRODUIT","6", "A", "")
    EB.Template.TableAddfielddefinition("CODE.CLIENT","15", "A", "")
    EB.Template.TableAddfielddefinition("NOM.CLIENT","35", "A", "")
    EB.Template.TableAddfielddefinition("MONTANT.FIN", "15","", "")
    EB.Template.TableAddfielddefinition("DATE.DEBUT","8","D","")
    EB.Template.TableAddfielddefinition("DATE.FIN","8","D","")
    EB.Template.TableAddfielddefinition("TEG","10", "A", "")
    EB.Template.TableAddamountfield("VAL.RESID", "15","", "")
    EB.Template.TableAddamountfield("TOTAL.COUT", "15","", "")
    EB.Template.TableAddfielddefinition("COMPTE","15", "A", "")
    EB.Template.TableAddfielddefinition("XX<DATE.ECH","10", "A", "")
    EB.Template.TableAddamountfield("XX-MONTANT.TTC", "15","", "")
    EB.Template.TableAddamountfield("XX-PRINCIPAL", "15","", "")
    EB.Template.TableAddamountfield("XX-PROFIT", "15","", "")
    EB.Template.TableAddamountfield("XX-TIMBRE", "15","", "")
    EB.Template.TableAddamountfield("XX-COMM.ECH", "15","", "")
    EB.Template.TableAddamountfield("XX-TVA", "15","", "")
    EB.Template.TableAddamountfield("XX>CAPITAL.RESTANT", "15","", "")


    EB.Template.TableAddfielddefinition("XX<CHAMP1","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-CHAMP2","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-CHAMP3","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-CHAMP4","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-CHAMP5","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-CHAMP6","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-CHAMP7","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-CHAMP8","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-CHAMP9","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-CHAMP10","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-CHAMP11","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-CHAMP12","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-CHAMP13","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-CHAMP14","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-CHAMP15","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-CHAMP16","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-CHAMP17","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-CHAMP18","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-CHAMP19","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-CHAMP20","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-CHAMP21","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-CHAMP22","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-CHAMP23","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-CHAMP24","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-CHAMP25","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-CHAMP26","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-CHAMP27","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-CHAMP28","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-CHAMP29","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-CHAMP30","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-CHAMP31","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-CHAMP32","35", "A", "")
    EB.Template.TableAddfielddefinition("XX-CHAMP33","35", "A", "")
    EB.Template.TableAddfielddefinition("XX>CHAMP34","35", "A", "")


*-----------------------------------------------------------------------------

    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
