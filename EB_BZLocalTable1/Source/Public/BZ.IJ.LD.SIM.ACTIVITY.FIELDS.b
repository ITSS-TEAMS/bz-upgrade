* @ValidationCode : MjotNDc2MjY3NTEyOkNwMTI1MjoxNjAwNDc5MDk0NDM0OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:31:34
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
* <Rating>-4</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.IJ.LD.SIM.ACTIVITY.FIELDS
*-----------------------------------------------------------------------------
* Author      : ITSS India Pvt Ltd
* Date        : 18 June 2018
* Description : Field definition
*-----------------------------------------------------------------------------
* Modification History :
*ZIT-UPG-R13-R19   :  removed BP's and changed INCLUDE to INSERT
*                     FM covnerted to @FM
*-----------------------------------------------------------------------------
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
*    CALL Table.defineId("ID", T24_String) ;* Define Table id
    EB.SystemTables.setIdF('ID'); EB.SystemTables.setIdN('25.1'); EB.SystemTables.setIdT('ANY')
    EB.SystemTables.setIdCheckfile('LD.LOANS.AND.DEPOSITS')
*-----------------------------------------------------------------------------
    neighbour = ''
    EB.Template.TableAddfielddefinition('INIT.OUTS.AMT', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfield('XX<GOOD.REF', EB.Template.T24String, EB.Template.FieldNoInput, neighbour)
    EB.Template.TableAddfield('XX-ACTIVITY', EB.Template.T24String, EB.Template.FieldNoInput, neighbour)
    EB.Template.TableAddfielddefinition('XX-PAYMENT.AMOUNT', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddoptionsfield("XX>CONTRACT.STATUS", "UNDER.PROCESS_COMPLETED", EB.Template.FieldNoInput,neighbour)
    EB.Template.TableAddfielddefinition('TOT.OUTS.AMT', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
