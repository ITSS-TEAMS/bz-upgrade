* @ValidationCode : MjotMjA0NTg4Njc3ODpDcDEyNTI6MTYwMDQ4NDcyMTM0NDpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjIwX1NQNC4wOi0xOi0x
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
*-----------------------------------------------------------------------------
* Marwen BEN NASR
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE BZ.TMP.ENTRY.TODAY.FIELDS
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
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Converted FM to @FM
*-----------------------
* 02 / 09/ 2011
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
    EB.Template.TableAddfielddefinition("ACCOUNT.NUMBER","19", "ACC", "")
    EB.Template.FieldSetcheckfile("ACCOUNT")

    EB.Template.TableAddfielddefinition("COMPANY.CODE","11", "A", "")
    EB.Template.FieldSetcheckfile("COMPANY")

    EB.Template.TableAddfielddefinition("AMOUNT.LCY","19", "AMT", "")

    EB.Template.TableAddfielddefinition("TRANSACTION.CODE","3.1", "A", "")
    EB.Template.FieldSetcheckfile("TRANSACTION")

    EB.Template.TableAddfielddefinition("THEIR.REFERENCE","16", "A", "")
    EB.Template.TableAddfielddefinition("XX.NARRATIVE","34", "A", "")

    EB.Template.TableAddfielddefinition("PL.CATEGORY","6", "A", "")
    EB.Template.FieldSetcheckfile("CATEGORY")

    EB.Template.TableAddfielddefinition("CUSTOMER.ID","10", "A", "")
    EB.Template.FieldSetcheckfile("CUSTOMER")

    EB.Template.TableAddfielddefinition("ACCOUNT.OFFICER","4", "A", "")
    EB.Template.FieldSetcheckfile("DEPT.ACCT.OFFICER")

    EB.Template.TableAddfielddefinition("PRODUCT.CATEGORY","6", "A", "")
    EB.Template.FieldSetcheckfile("CATEGORY")

    EB.Template.TableAddfielddefinition("VALUE.DATE","11", "D", "")

    EB.Template.TableAddfielddefinition("CURRENCY","3", "A", "")
    EB.Template.FieldSetcheckfile("CURRENCY")

    EB.Template.TableAddfielddefinition("AMOUNT.FCY","19", "AMT", "")
    EB.Template.TableAddfielddefinition("EXCHANGE.RATE","11", "A", "")
    EB.Template.TableAddfielddefinition("NEGOTIATED.REF.NUM","5", "A", "")
    EB.Template.TableAddfielddefinition("POSITION.TYPE","2", "A", "")
    EB.Template.FieldSetcheckfile("FX.POS.TYPE")

    EB.Template.TableAddfielddefinition("OUR.REFERENCE","60", "A", "")
    EB.Template.TableAddfielddefinition("REVERSAL.MARKER","1", "A", "")
    EB.Template.TableAddfielddefinition("EXPOSURE.DATE","11", "A", "")
    EB.Template.TableAddfielddefinition("CURRENCY.MARKET","1", "A", "")
    EB.Template.FieldSetcheckfile("CURRENCY.MARKET")

    EB.Template.TableAddfielddefinition("XX.LOCAL.REF","35", "A", "")
    EB.Template.TableAddfielddefinition("DEPARTMENT.CODE","4", "A", "")
    EB.Template.FieldSetcheckfile("DEPT.ACCT.OFFICER")

    EB.Template.TableAddfielddefinition("TRANS.REFERENCE","60", "A", "")
    EB.Template.TableAddfielddefinition("SYSTEM.ID","4", "A", "")
    EB.Template.FieldSetcheckfile("EB.SYSTEM.ID")

    EB.Template.TableAddfielddefinition("BOOKING.DATE","11", "D", "")
    EB.Template.TableAddfielddefinition("XX.STMT.NO","30", "A", "")

    EB.Template.TableAddfielddefinition("SUSPENSE.CATEGORY","6", "A", "")
    EB.Template.TableAddfielddefinition("SUSPNSE.VALUE.DATE","11", "D", "")

    EB.Template.TableAddfielddefinition("SUPPRESS.POSITION","1", "A", "")
    EB.Template.TableAddfielddefinition("CRF.TYPE","12", "A", "")
    EB.Template.TableAddfielddefinition("CRF.TXN.CODE","3", "A", "")
    EB.Template.FieldSetcheckfile("RE.TXN.CODE")

    EB.Template.TableAddfielddefinition("CRF.CURRENCY","3", "A", "")
    EB.Template.FieldSetcheckfile("CURRENCY")

    EB.Template.TableAddfielddefinition("CONSOL.KEY","85", "A", "")
    EB.Template.TableAddfielddefinition("CRF.MAT.DATE","8", "A", "")
    EB.Template.TableAddfielddefinition("CRF.PROD.CAT","6", "A", "")
    EB.Template.FieldSetcheckfile("CATEGORY")

    EB.Template.TableAddfielddefinition("PM.TYPE","1", "A", "")
    EB.Template.TableAddfielddefinition("DEALER.DESK","1", "A", "")

    EB.Template.TableAddfielddefinition("COUNTERPARTY","35", "A", "")
    EB.Template.FieldSetcheckfile("CUSTOMER")

    EB.Template.TableAddfielddefinition("LIQUIDATION.MODE","9", "A", "")
    EB.Template.TableAddfielddefinition("REPAYMENT.DATE","11", "A", "")

    EB.Template.TableAddfielddefinition("XX<REPAYMENT.TYPE","2", "A", "")
    EB.Template.TableAddfielddefinition("XX>REPAYMENT.AMT","19", "A", "")

    EB.Template.TableAddfielddefinition("OUTSTANDING.BAL","19", "A", "")
    EB.Template.TableAddfielddefinition("CONTRACT.INT.RATE","11", "A", "")
    EB.Template.TableAddfielddefinition("CONTRACT.INT.KEY","3", "A", "")

    EB.Template.TableAddfielddefinition("CYCLE.FORWARD","", "A", "")
    EB.Template.TableAddfielddefinition("ORIG.LOCAL.EQUIV","19", "A", "")
    EB.Template.TableAddfielddefinition("ORIGINAL.AMOUNT","19", "A", "")
    EB.Template.TableAddfielddefinition("ORIGINAL.CCY","3", "A", "")

    EB.Template.TableAddfielddefinition("ORIGINAL.ACCT","16", "A", "")
    EB.Template.TableAddfielddefinition("ORIGINAL.EXCH.RATE","11", "A", "")
    EB.Template.TableAddfielddefinition("XX<EXP.SPLIT.DATE","11", "A", "")
    EB.Template.TableAddfielddefinition("XX>EXP.SPLIT.AMT","19", "A", "")

    EB.Template.TableAddfielddefinition("ORIG.AMOUNT.LCY","16", "A", "")
    EB.Template.TableAddfielddefinition("XX<BANK.SORT.CDE","11", "A", "")
    EB.Template.TableAddfielddefinition("XX>CHEQUE.NUMBER","11", "A", "")
    EB.Template.TableAddfielddefinition("CHQ.COLL.ID","19", "A", "")

    EB.Template.TableAddfielddefinition("DRAWN.ACCOUNT","16..C", "A", "")
    EB.Template.FieldSetcheckfile("ACCOUNT")

    EB.Template.TableAddfielddefinition("ACCOUNTING.DATE","11", "D", "")
    EB.Template.TableAddfielddefinition("XX<PC.PERIOD.END","11", "D", "")
    EB.Template.TableAddfielddefinition("XX>PC.APPLIED","11", "A", "")
    EB.Template.TableAddfielddefinition("GROSS.INT.TAX.LCY","19", "A", "")

    EB.Template.TableAddfielddefinition("TAX.ALLOW.ADJ.LCY","19", "A", "")
    EB.Template.TableAddfielddefinition("TAX.EXEMPT.ADJ.LCY","19", "A", "")
    EB.Template.TableAddfielddefinition("POOL2.ADJ.LCY","19", "A", "")
    EB.Template.TableAddfielddefinition("GROSS.INT.TAX.FCY","19", "A", "")

    EB.Template.TableAddfielddefinition("TAX.ALLOW.ADJ.FCY","19", "A", "")
    EB.Template.TableAddfielddefinition("TAX.EXEMPT.ADJ.FCY","19", "A", "")
    EB.Template.TableAddfielddefinition("POOL2.ADJ.FCY","19", "A", "")
    EB.Template.TableAddfielddefinition("UPDATE.POOL.SEQ","18", "A", "")


    EB.Template.TableAddfielddefinition("NET.INT.TAX.LCY","19", "A", "")
    EB.Template.TableAddfielddefinition("NET.INT.TAX.FCY","19", "A", "")
    EB.Template.TableAddfielddefinition("TAX.ALLOWANCE.CCY","3", "A", "")
    EB.Template.TableAddfielddefinition("POOL1.MOVEMENT","19", "A", "")

    EB.Template.TableAddfielddefinition("POOL2.MOVEMENT","19", "A", "")
    EB.Template.TableAddfielddefinition("AMOUNT.DEAL.CCY","19", "A", "")
    EB.Template.TableAddfielddefinition("DEAL.CCY","3", "A", "")
    EB.Template.TableAddfielddefinition("DEAL.EXCH.RATE","11", "A", "")

    EB.Template.TableAddfielddefinition("MASK.PRINT","6", "" : @FM : "YES_NO_SYSTEM_", "")
    EB.Template.TableAddfielddefinition("MASK.NARRATIVE","35", "A", "")

    EB.Template.TableAddfielddefinition("STMT1.DATE","11", "D", "")
    EB.Template.TableAddfielddefinition("XX.STMT2.DATE","14", "A", "")
    EB.Template.TableAddfielddefinition("CHQ.TYPE","4", "A", "")
    EB.Template.FieldSetcheckfile("CHEQUE.TYPE")

    EB.Template.TableAddfielddefinition("TAX.EXCH.RATE","35", "A", "")
    EB.Template.TableAddfielddefinition("NET.PARAM","40", "A", "")
    EB.Template.TableAddfielddefinition("MASTER.ACCOUNT","19", "A", "")
    EB.Template.TableAddfielddefinition("XX.ADDL.TRANS.REF","60", "A", "")

    EB.Template.TableAddfielddefinition("INTEREST.RATE","11", "A", "")
    EB.Template.TableAddfielddefinition("DD.MANDATE.REF","25", "A", "")
    EB.Template.TableAddfielddefinition("DD.ITEM.REF","35", "A", "")
    EB.Template.TableAddfielddefinition("DD.MANDATE.DATE","11", "D", "")

    EB.Template.TableAddfielddefinition("CONTRACT.BAL.ID","35", "A", "")
    EB.Template.TableAddfielddefinition("TRADE.DATE","11", "A", "")
    EB.Template.TableAddfielddefinition("PROCESSING.DATE","11", "A", "")
    EB.Template.TableAddfielddefinition("BALANCE.TYPE","11", "D", "")

    EB.Template.TableAddfielddefinition("AA.ITEM.REF","40", "A", "")
    EB.Template.TableAddfielddefinition("XX.ACCRUAL.DATA","40", "A", "")
    EB.Template.TableAddfielddefinition("ORIG.CCY.MARKET","1", "D", "")


    EB.Template.TableAddoverridefield()


    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
