* @ValidationCode : MjotMTc4ODI1Mzg3MDpDcDEyNTI6MTYwMDQ4NDcyMTA5NDpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjIwX1NQNC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 04:05:21
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
SUBROUTINE BZ.SED.SOLDE.CONTRE.VAL.2.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @DEVT24@BANQUEZITOUNA
*
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* 08 / 07 / 2010

*ZIT-UPG-R13-R19 : FM CHANGED TO @FM
* ----------------------------------------------------------------------------
*** <region name= Header>
*** <desc>Inserts and control logic</desc>
*ZIT-UPG-R13-R19/S
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
*ZIT-UPG-R13-R19/E
*** </region>

*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "20" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("CUSTOMER","10", "A", "")
    EB.Template.TableAddfielddefinition("MOIS","6", "A", "")
    EB.Template.TableAddfielddefinition("CONTRE.VAL.J1","15",  "AMT", "")
    EB.Template.TableAddfielddefinition("CONTRE.VAL.J2","15",  "AMT", "")
    EB.Template.TableAddfielddefinition("CONTRE.VAL.J3","15",  "AMT", "")
    EB.Template.TableAddfielddefinition("CONTRE.VAL.J4","15",  "AMT", "")
    EB.Template.TableAddfielddefinition("CONTRE.VAL.J5","15",  "AMT", "")
    EB.Template.TableAddfielddefinition("CONTRE.VAL.J6","15",  "AMT", "")
    EB.Template.TableAddfielddefinition("CONTRE.VAL.J7","15",  "AMT", "")
    EB.Template.TableAddfielddefinition("CONTRE.VAL.J8","15",  "AMT", "")
    EB.Template.TableAddfielddefinition("CONTRE.VAL.J9","15",  "AMT", "")
    EB.Template.TableAddfielddefinition("CONTRE.VAL.J10","15", "AMT", "")
    EB.Template.TableAddfielddefinition("CONTRE.VAL.J11","15", "AMT", "")
    EB.Template.TableAddfielddefinition("CONTRE.VAL.J12","15", "AMT", "")
    EB.Template.TableAddfielddefinition("CONTRE.VAL.J13","15", "AMT", "")
    EB.Template.TableAddfielddefinition("CONTRE.VAL.J14","15", "AMT", "")
    EB.Template.TableAddfielddefinition("CONTRE.VAL.J15","15", "AMT", "")
    EB.Template.TableAddfielddefinition("CONTRE.VAL.J16","15", "AMT", "")
    EB.Template.TableAddfielddefinition("CONTRE.VAL.J17","15", "AMT", "")
    EB.Template.TableAddfielddefinition("CONTRE.VAL.J18","15", "AMT", "")
    EB.Template.TableAddfielddefinition("CONTRE.VAL.J19","15", "AMT", "")
    EB.Template.TableAddfielddefinition("CONTRE.VAL.J20","15", "AMT", "")
    EB.Template.TableAddfielddefinition("CONTRE.VAL.J21","15", "AMT", "")
    EB.Template.TableAddfielddefinition("CONTRE.VAL.J22","15", "AMT", "")
    EB.Template.TableAddfielddefinition("CONTRE.VAL.J23","15", "AMT", "")
    EB.Template.TableAddfielddefinition("CONTRE.VAL.J24","15", "AMT", "")
    EB.Template.TableAddfielddefinition("CONTRE.VAL.J25","15", "AMT", "")
    EB.Template.TableAddfielddefinition("CONTRE.VAL.J26","15", "AMT", "")
    EB.Template.TableAddfielddefinition("CONTRE.VAL.J27","15", "AMT", "")
    EB.Template.TableAddfielddefinition("CONTRE.VAL.J28","15", "AMT", "")
    EB.Template.TableAddfielddefinition("CONTRE.VAL.J29","15", "AMT", "")
    EB.Template.TableAddfielddefinition("CONTRE.VAL.J30","15", "AMT", "")
    EB.Template.TableAddfielddefinition("CONTRE.VAL.J31","15", "AMT", "")




*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("XX<DATE.OPERATION","8", "D", "")
    EB.Template.TableAddfielddefinition("XX>SOLDE.OPERATION","15", "AMT", "")
    EB.Template.TableAddfielddefinition("RESERVED.3","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.4","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.5","10", "A", "")
*-----------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
