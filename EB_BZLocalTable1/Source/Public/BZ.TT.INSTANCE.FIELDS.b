* @ValidationCode : MjotMTU4NDYzNTU5NDpDcDEyNTI6MTYwMDQ3OTM1MjM0NjpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjE5X0FNUi4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:35:52
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
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.TT.INSTANCE.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author fehmi bounouara
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*ZIT-UPG-R13-R19 : Converted  FM converted to @FM.
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


    EB.Template.TableDefineid("ID", "" : @FM : "60" : @FM : "A")
    EB.Template.TableAddfielddefinition("TYPE.INSTANCE", "4","A", "")
    EB.Template.TableAddfielddefinition("DATE.OPERATION", "8", "D", "")
    EB.Template.TableAddfielddefinition("UNITE.INS", "4", "A", "")
    EB.Template.FieldSetcheckfile('DEPT.ACCT.OFFICER')
    EB.Template.TableAddfielddefinition("CAISSE.EMET", "4", "A", "")
    EB.Template.FieldSetcheckfile('TELLER.ID')
    EB.Template.TableAddfielddefinition("CAISSIER.EMET", "35", "A", "")
    EB.Template.TableAddfielddefinition("UNITE.RECEPTRICE", "4", "A", "")
    EB.Template.FieldSetcheckfile('DEPT.ACCT.OFFICER')
    EB.Template.TableAddfielddefinition("CAISSE.RECEPTRICE", "4", "A", "")
    EB.Template.FieldSetcheckfile('TELLER.ID')
    EB.Template.TableAddfielddefinition("CAISSIER.RECEPTEUR", "35", "A", "")
    EB.Template.TableAddfielddefinition("MONTANT", "15", "AMT", "")
    EB.Template.TableAddfielddefinition("DEVISE", "3", "CCY", "")
    EB.Template.FieldSetcheckfile('CURRENCY')
    EB.Template.TableAddfielddefinition("DATE.RECEPTION", "8", "D", "")
    EB.Template.TableAddfielddefinition("COURS", "10", "A", "")
    EB.Template.TableAddfielddefinition("REF.APPUR", "12", "A", "")

    EB.Template.TableAddfielddefinition("COMPTE.1", "12", "A", "")

    EB.Template.TableAddfielddefinition("COMPTE.2", "12", "A", "")

    EB.Template.TableAddoptionsfield("STATUT", "1_2_3", "", "")
    EB.Template.TableAddfielddefinition("MONTANT.LCY", "19", "AMT", "")
*-----------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
