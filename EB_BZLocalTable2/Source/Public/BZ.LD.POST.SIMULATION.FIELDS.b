* @ValidationCode : MjotMTM4MjExNTQ2OkNwMTI1MjoxNjAwNDg0NzE5NzIzOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
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
SUBROUTINE BZ.LD.POST.SIMULATION.FIELDS
*-----------------------------------------------------------------------------
* Author      : ITSS India Pvt Ltd
* Date        : 02 May 2018
* Description : Field definition
*-----------------------------------------------------------------------------
* Modification History:
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Converted FM to @FM
*-----------------------------------------------------------------------------
*** <region name= Header>
*** <desc>Inserts and control logic</desc>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
* $INSERT I_F.DEPT.ACCT.OFFICER - Not Used anymore;
* $INSERT I_F.LMM.CHARGE.CONDITIONS - Not Used anymore;
* $INSERT I_F.CURRENCY - Not Used anymore;
* $INSERT I_F.CATEGORY - Not Used anymore;
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
    $USING ST.Config
    $USING LM.Fees
    $USING ST.CurrencyConfig

*** </region>
*-----------------------------------------------------------------------------
*    CALL Table.defineId("ID", T24_String) ;* Define Table id
    EB.SystemTables.setIdF('SIM.ID'); EB.SystemTables.setIdN('25.1'); EB.SystemTables.setIdT('ANY')
    EB.SystemTables.setIdCheckfile('LD.LOANS.AND.DEPOSITS')
*-----------------------------------------------------------------------------
    neighbour = ''
    EB.Template.TableAddfield('CUSTOMER.ID', EB.Template.T24Customer, EB.Template.FieldNoInput, neighbour)
    EB.Template.TableAddfielddefinition('CATEGORY', '6', 'ANY':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.FieldSetcheckfile('CATEGORY':@FM:ST.Config.Category.EbCatShortName)
    EB.Template.TableAddfielddefinition('IS.CON.ID', '35', 'ANY':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.FieldSetcheckfile('IS.H.CONTRACTS':@FM:ST.Config.Category.EbCatShortName)
    EB.Template.TableAddfielddefinition('LOAN.TYPE', '10', 'ANY':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('AGENCY', '18', '':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.FieldSetcheckfile('DEPT.ACCT.OFFICER':@FM:ST.Config.DeptAcctOfficer.EbDaoName)
    EB.Template.TableAddfielddefinition('IS.CON.TOT.AMT', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('IS.CON.DOWN.PAY', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('CURRENCY', '3', 'A':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.FieldSetcheckfile('CURRENCY':@FM:ST.CurrencyConfig.Currency.EbCurCcyName)
    EB.Template.TableAddfield('VALUE.DATE', EB.Template.T24Date, EB.Template.FieldNoInput, neighbour)
    EB.Template.TableAddfield('FIN.MAT.DATE', EB.Template.T24Date, EB.Template.FieldNoInput, neighbour)
    EB.Template.TableAddfield('PRIN.LIQ.ACCT', EB.Template.T24Account, '', neighbour)
    EB.Template.TableAddfield('INT.LIQ.ACCT', EB.Template.T24Account, '', neighbour)
    EB.Template.TableAddfield('CHRG.LIQ.ACCT', EB.Template.T24Account, '', neighbour)
    EB.Template.TableAddfield('LITIG.LIQ.ACCT', EB.Template.T24Account, '', neighbour)
    EB.Template.TableAddfielddefinition('AMT.SUB.VAT.0', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('AMT.SUB.VAT.6', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('AMT.SUB.VAT.12', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('AMT.SUB.VAT.18', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('TOTAL.VAT', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
*-----------------------------------------------------------------------------
    EB.Template.TableAddoptionsfield("CUR.OPERATION.TYPE", "SALE_LOSS",EB.Template.FieldMandatory,neighbour)
    EB.Template.TableAddoptionsfield("CUR.OPERATION", "TOTAL.SALE_PARTIAL.SALE_TOTAL.LOSS_PARTIAL.LOSS",EB.Template.FieldNoInput,neighbour)
    EB.Template.TableAddoptionsfield("CUR.LOSS.REASON", "_INCIDENT_LITIGATION_MUTUAL.AGREEMENT",'',neighbour)
    EB.Template.TableAddfield('CUR.GOOD.TYPE', EB.Template.T24String, EB.Template.FieldMandatory, neighbour)
    EB.Template.TableAddfield('CUR.GOOD.REF', EB.Template.T24String, EB.Template.FieldMandatory, neighbour)
    EB.Template.TableAddfielddefinition('CUR.OUTS.TOT.AMT', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('CUR.OUTS.LD.AMOUNT', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('CUR.PAYMENT.AMT', '20.1', 'AMT', neighbour)
    EB.Template.TableAddfield('CUR.PAYMENT.DATE', EB.Template.T24Date, EB.Template.FieldNoInput, neighbour)
    EB.Template.TableAddfield('CUR.INCIDENT.DATE', EB.Template.T24Date, '', neighbour)
    EB.Template.TableAddfielddefinition('CUR.VAT.ON.GOOD', '020.1', 'AMT', neighbour)
    EB.Template.TableAddfielddefinition('CUR.PROFIT', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('CUR.PD.TOT.AMT', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('CUR.GOOD.PRORATA', '18', 'ANY':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('CUR.AMOUNT.PRORATA', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('CUR.OD.PRORATA', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('CUR.VAT.ADJ.CODE', '3', '':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.FieldSetcheckfile('LMM.CHARGE.CONDITIONS':@FM:LM.Fees.LmmChargeConditions.LdTwoOneShortName)
    EB.Template.TableAddfielddefinition('CUR.VAT.ADJUST.AMT', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('XX<CUR.CHRG.CODE', '3', '', neighbour)
    EB.Template.FieldSetcheckfile('LMM.CHARGE.CONDITIONS':@FM:LM.Fees.LmmChargeConditions.LdTwoOneShortName)
    EB.Template.TableAddfielddefinition('XX>CUR.CHRG.AMT', '18', 'AMT', neighbour)
    EB.Template.TableAddfielddefinition('CUR.OTHER.CHARGES', '18', 'AMT', neighbour)
    EB.Template.TableAddfielddefinition('CUR.NOU.PRIME.TAK ', '18', 'AMT', neighbour)
    EB.Template.TableAddfielddefinition('CUR.TOT.AMT', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
*-----------------------------------------------------------------------------
    EB.Template.TableAddfield("XX<OPERATION.TYPE", EB.Template.T24String, EB.Template.FieldNoInput,neighbour)
    EB.Template.TableAddfield("XX-OPERATION", EB.Template.T24String, EB.Template.FieldNoInput,neighbour)
    EB.Template.TableAddfield("XX-LOSS.REASON", EB.Template.T24String, EB.Template.FieldNoInput,neighbour)
    EB.Template.TableAddfield('XX-GOOD.TYPE', EB.Template.T24String, EB.Template.FieldNoInput, neighbour)
    EB.Template.TableAddfield('XX-GOOD.REF', EB.Template.T24String, EB.Template.FieldNoInput, neighbour)
    EB.Template.TableAddfielddefinition('XX-OUTS.TOT.AMT', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('XX-OUTS.LD.AMOUNT', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('XX-PAYMENT.AMT', '20', 'AMT':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfield('XX-PAYMENT.DATE', EB.Template.T24Date, EB.Template.FieldNoInput, neighbour)
    EB.Template.TableAddfield('XX-INCIDENT.DATE', EB.Template.T24Date, EB.Template.FieldNoInput, neighbour)
    EB.Template.TableAddfield('XX-VAT.ON.GOOD', EB.Template.T24String, EB.Template.FieldNoInput, neighbour)
    EB.Template.TableAddfielddefinition('XX-PROFIT', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('XX-PD.TOT.AMT', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('XX-GOOD.PRORATA', '18', 'ANY':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('XX-AMOUNT.PRORATA', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('XX-OVERDUE.PRORATA', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('XX-VAT.ADJUST.CODE', '3', '':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.FieldSetcheckfile('LMM.CHARGE.CONDITIONS':@FM:LM.Fees.LmmChargeConditions.LdTwoOneShortName)
    EB.Template.TableAddfielddefinition('XX-VAT.ADJUST.AMT', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('XX-XX<CHRG.CODE', '3', '':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.FieldSetcheckfile('LMM.CHARGE.CONDITIONS':@FM:LM.Fees.LmmChargeConditions.LdTwoOneShortName)
    EB.Template.TableAddfielddefinition('XX-XX>CHRG.AMT', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('XX-OTHER.CHARGES', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('XX-NOUV.PRIME.TAK ', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('XX-TOT.AMT', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfield("XX-OPERATION.STATUS", EB.Template.T24String, EB.Template.FieldNoInput,neighbour)
    EB.Template.TableAddfield('XX-XPRIN.LIQ.ACCT', EB.Template.T24Account, EB.Template.FieldNoInput, neighbour)
    EB.Template.TableAddfield('XX-XINT.LIQ.ACCT', EB.Template.T24Account, EB.Template.FieldNoInput, neighbour)
    EB.Template.TableAddfield('XX-XCHRG.LIQ.ACCT', EB.Template.T24Account, EB.Template.FieldNoInput, neighbour)
    EB.Template.TableAddfield('XX>XLITIG.LIQ.ACCT', EB.Template.T24Account, EB.Template.FieldNoInput, neighbour)
*-----------------------------------------------------------------------------
    EB.Template.TableAddoptionsfield("CONTRACT.STATUS", "LIVE_MATURED_SIMULATED_UNDER.PROCESS", EB.Template.FieldNoInput,neighbour)
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition('CUR.OD.BEF.INC', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddoverridefield()
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
