* @ValidationCode : MjotMjAyNjU3MTkxNzpDcDEyNTI6MTYwMDQ4MzI0Nzc3NzpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjIwX1NQNC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 19 Sep 2020 03:40:47
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
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.MA.REVALUATION.FIELDS
*-----------------------------------------------------------------------------
* Author      : ITSS India Pvt Ltd
* Date        : 09 JUN 2018
* Description : Field definition
*-----------------------------------------------------------------------------
* Modification History :
*ZIT-UPG-R13-R19 :  removed BP's and changed INCLUDE to INSERT
*                   FM converted to @FM , added INSERT file
*-----------------------------------------------------------------------------
*** <region name= Header>
*** <desc>Inserts and control logic</desc>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
* $INSERT I_F.CUSTOMER - Not Used anymore;
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
    $USING ST.Customer
    

*** </region>
*-----------------------------------------------------------------------------
    EB.SystemTables.setIdF('REV.ID'); EB.SystemTables.setIdN('35.1'); EB.SystemTables.setIdT('ANY')
*-----------------------------------------------------------------------------
    neighbour = ''
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition('LD.REFERENCE', '35', 'ANY':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('GOOD.TYPE', '35', 'ANY':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('GOOD.REF', '35', 'ANY':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('CUSTOMER', '15', 'ANY':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.FieldSetcheckfile('CUSTOMER':@FM:ST.Customer.Customer.EbCusShortName)
    EB.Template.TableAddfielddefinition('PRODUCT', '15', 'ANY':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('ORIG.VAT.AMT', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('ORIG.GOOD.AMT', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfield('ORIG.INC.DATE', EB.Template.T24Date, EB.Template.FieldNoInput, neighbour)

    EB.Template.TableAddfield('CUR.REV.DATE', EB.Template.T24Date, EB.Template.FieldNoInput, neighbour)
    EB.Template.TableAddfielddefinition('CUR.VAT.AMT', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('CUR.GOOD.AMT', '18', 'AMT', neighbour)
    EB.Template.TableAddfielddefinition('CUR.PL.AMT', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
*-----------------------------------------------------------------------------
    EB.Template.TableAddfield('XX<REV.DATE', EB.Template.T24Date, EB.Template.FieldNoInput, neighbour)
    EB.Template.TableAddfielddefinition('XX-VAT.AMT', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('XX-GOOD.AMT', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
    EB.Template.TableAddfielddefinition('XX>PL.AMT', '18', 'AMT':@FM:@FM:'NOINPUT', neighbour)
*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
