* @ValidationCode : MjotMTQyODc0NjA5OTpDcDEyNTI6MTYwMDQ4NDcyMDY3MTpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjIwX1NQNC4wOi0xOi0x
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
*-----------------------------------------------------------------------------
* Marwen BEN NASR
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE BZ.REGISTRE.CPS.MCD.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* BANQUEZITOUNA
*
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* 02 / 09/ 2011

*ZIT-UPG-R13-R19:FM converted to @FM
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
    EB.Template.TableDefineid("ID", "" : @FM : "90" : @FM : "A")
*-----------------------------------------------------------------------------


    EB.Template.TableAddfielddefinition("MSG.TYPE.IND","4", "A", "")
    EB.Template.TableAddfielddefinition("SWITCH.SER.NUM","9", "A", "")
    EB.Template.TableAddfielddefinition("PROC.ACQ.ISS","1", "A", "")
    EB.Template.TableAddfielddefinition("PROCESSOR.ID","4", "A", "")
    EB.Template.TableAddfielddefinition("TRANSAC.DATE","6", "A", "")
    EB.Template.TableAddfielddefinition("TRANSAC.TIME","6", "A", "")
    EB.Template.TableAddfielddefinition("PAN.LENGTH","2", "A", "")
    EB.Template.TableAddfielddefinition("PAN","19", "A", "")
    EB.Template.TableAddfielddefinition("PROCESSING.CODE","6", "A", "")
    EB.Template.TableAddfielddefinition("TRACE.NUM","6", "A", "")
    EB.Template.TableAddfielddefinition("MCC","4", "A", "")
    EB.Template.TableAddfielddefinition("POS.ENTRY","3", "A", "")
    EB.Template.TableAddfielddefinition("REF.NUM","12", "A", "")
    EB.Template.TableAddfielddefinition("ACQ.INSTITUTION","10", "A", "")
    EB.Template.TableAddfielddefinition("TERMINAL.ID","10", "A", "")
    EB.Template.TableAddfielddefinition("RESPONSE.CODE","2", "A", "")
    EB.Template.TableAddfielddefinition("PRODUCT.CODE","3", "A", "")
    EB.Template.TableAddfielddefinition("ADV.REASON.CODE","7", "A", "")
    EB.Template.TableAddfielddefinition("ISIS.AGREE.CODE","4", "A", "")
    EB.Template.TableAddfielddefinition("AUTORISATION.ID","6", "A", "")
    EB.Template.TableAddfielddefinition("CURR.CODE.TRX","3", "A", "")
    EB.Template.TableAddfielddefinition("IMPLIED.DECIMAL","1", "A", "")
    EB.Template.TableAddfielddefinition("CMP.AMT.TRX","12", "A", "")
    EB.Template.TableAddfielddefinition("CMP.AMT.TRX.IND","1", "A", "")
    EB.Template.TableAddfielddefinition("CSH.BAK.AMT","12", "A", "")
    EB.Template.TableAddfielddefinition("CSH.BAK.AMT.IND","1", "A", "")
    EB.Template.TableAddfielddefinition("ACCESS.FEE","8", "A", "")
    EB.Template.TableAddfielddefinition("ACCESS.FEE.IND","1", "A", "")
    EB.Template.TableAddfielddefinition("CURR.CODE.STTL","3", "A", "")
    EB.Template.TableAddfielddefinition("IMPL.DECIM.STTL","1", "A", "")
    EB.Template.TableAddfielddefinition("CONV.RATE","5", "A", "")
    EB.Template.TableAddfielddefinition("CP.AMT.STTL","12", "A", "")
    EB.Template.TableAddfielddefinition("CP.AMT.STTL.IND","1", "A", "")
    EB.Template.TableAddfielddefinition("INTERCH.FEE","10", "A", "")
    EB.Template.TableAddfielddefinition("INTERCH.FEE.IND","1", "A", "")
    EB.Template.TableAddfielddefinition("CURR.CD.SCH.FEE","3", "A", "")
    EB.Template.TableAddfielddefinition("IMPL.DC.SCH.FEE","1", "A", "")
    EB.Template.TableAddfielddefinition("SWH.FEE.AMT","10", "A", "")
    EB.Template.TableAddfielddefinition("SWH.FEE.AMT.IND","1", "A", "")
    EB.Template.TableAddfielddefinition("POSITIVE.ID.IND","1", "A", "")
    EB.Template.TableAddfielddefinition("FUT.SERV.FILLER","1", "A", "")
    EB.Template.TableAddfielddefinition("CRS.BOR.IND","1", "A", "")
    EB.Template.TableAddfielddefinition("CRS.BOR.CUR.IND","1", "A", "")
    EB.Template.TableAddfielddefinition("ISA.FEE.IND","1", "A", "")
    EB.Template.TableAddfielddefinition("FILLER","31", "A", "")
    EB.Template.TableAddfielddefinition("STATUT","35", "A", "")
    EB.Template.TableAddfielddefinition("DATE.CHARGEMENT","8", "D", "")
    EB.Template.TableAddfielddefinition("REF.FICHIER","50", "A", "")
    EB.Template.TableAddfielddefinition("DATE.FICHIER","6", "A", "")

    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
