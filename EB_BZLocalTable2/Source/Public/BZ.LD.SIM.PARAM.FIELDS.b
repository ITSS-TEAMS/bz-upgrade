* @ValidationCode : MjotNTM5MTQwODAwOkNwMTI1MjoxNjAwNDg0NzE5NzgyOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
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
SUBROUTINE BZ.LD.SIM.PARAM.FIELDS
*-----------------------------------------------------------------------------
* Author      : ITSS India Pvt Ltd
* Date        : 16 May 2018
* Description : Field definition
*-----------------------------------------------------------------------------
* Modification History :

*ZIT-UPG-R13-R19 : FM CHANGED TO @FM
*-----------------------------------------------------------------------------
*** <region name= Header>
*** <desc>Inserts and control logic</desc>

*ZIT-UPG-R13-R19/S
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
* $INSERT I_F.LMM.CHARGE.CONDITIONS - Not Used anymore;
    
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
    $USING LM.Fees
*ZIT-UPG-R13-R19/E

*** </region>
*-----------------------------------------------------------------------------
*    CALL Table.defineId("ID", T24_String) ;* Define Table id
    EB.SystemTables.setIdF('ID'); EB.SystemTables.setIdN('25.1'); EB.SystemTables.setIdT('ANY')
    EB.SystemTables.setIdCheckfile('CATEGORY')
*-----------------------------------------------------------------------------
    neighbour = ''
    EB.Template.TableAddfielddefinition('VAT.ADJUST.CODE', '3', '', neighbour)
    EB.Template.FieldSetcheckfile('LMM.CHARGE.CONDITIONS':@FM:LM.Fees.LmmChargeConditions.LdTwoOneShortName)
    EB.Template.TableAddfielddefinition('XX.GEN.CHRG.CODE', '3', '', neighbour)
    EB.Template.FieldSetcheckfile('LMM.CHARGE.CONDITIONS':@FM:LM.Fees.LmmChargeConditions.LdTwoOneShortName)
    EB.Template.TableAddoptionsfield("XX<OPERATION", "SALE_INCIDENT_LITIGATION_MUTUAL.AGREEMENT",neighbour,neighbour)
    EB.Template.TableAddfielddefinition('XX>XX.OPR.CHRG.CODE', '3', '', neighbour)
    EB.Template.FieldSetcheckfile('LMM.CHARGE.CONDITIONS':@FM:LM.Fees.LmmChargeConditions.LdTwoOneShortName)
    EB.Template.TableAddfielddefinition('XX.TKFL.BONUS.CODE', '3', '', neighbour)
    EB.Template.FieldSetcheckfile('LMM.CHARGE.CONDITIONS':@FM:LM.Fees.LmmChargeConditions.LdTwoOneShortName)
    EB.Template.TableAddfielddefinition('OTHER.CHRGS.CODE', '3', '', neighbour)
    EB.Template.FieldSetcheckfile('LMM.CHARGE.CONDITIONS':@FM:LM.Fees.LmmChargeConditions.LdTwoOneShortName)
    EB.Template.TableAddoptionsfield("XX<TERMINATION.TYPE", "INCIDENT_LITIGATION_MUTUAL.AGREEMENT",neighbour,neighbour)
    EB.Template.TableAddfield('XX-WITHHLD.TAX.AC', EB.Template.T24Account, '', neighbour)
    EB.Template.TableAddfield('XX-VAT.ADJ.ACCOUNT', EB.Template.T24Account, '', neighbour)
    EB.Template.TableAddfielddefinition('XX-PLACCT.DEBIT', '10', 'ANY', neighbour)
    EB.Template.TableAddfielddefinition('XX>PLACCT.CREDIT', '10', 'ANY', neighbour)
    EB.Template.TableAddfielddefinition('CER.FEES.CODE', '3', '', neighbour)
    EB.Template.FieldSetcheckfile('LMM.CHARGE.CONDITIONS':@FM:LM.Fees.LmmChargeConditions.LdTwoOneShortName)
    EB.Template.TableAddfield('TER.REFUND.ACC', EB.Template.T24Account, EB.Template.FieldMandatory, neighbour)
    EB.Template.TableAddfield('TKFL.ACCT', EB.Template.T24Account, '', neighbour)
    EB.Template.TableAddfield("XX<INCOME.NATURE", EB.Template.T24String, neighbour, neighbour)
    EB.Template.TableAddfield('XX>XX.ACCOUNT', EB.Template.T24Account, '', neighbour)
    EB.Template.TableAddfielddefinition('REV.P.DEB.ACC', '15', 'ANY', neighbour)
    EB.Template.TableAddfielddefinition('REV.P.CRE.ACC', '15', 'ANY', neighbour)
    EB.Template.TableAddfielddefinition('REV.L.DEB.ACC', '15', 'ANY', neighbour)
    EB.Template.TableAddfielddefinition('REV.L.CRE.ACC', '15', 'ANY', neighbour)
    EB.Template.TableAddoptionsfield("XX<DS.OPERATION", "SALE_INCIDENT_LITIGATION_MUTUAL.AGREEMENT",neighbour,neighbour)
    EB.Template.TableAddfielddefinition('XX>DS.STAMP.DT.CODE', '3', '', neighbour)
*-----------------------------------------------------------------------------
    FOR XX = 1 TO 20
        EB.Template.TableAddfield("RESERVED.":FMT(XX,"R%2"), EB.Template.T24Text, EB.Template.FieldNoInput,"")
    NEXT XX
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
