* @ValidationCode : MjotMTMwMjM1NTM3MjpDcDEyNTI6MTYwMDU2MDE0MzUwNTpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjIwX1NQNC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:02:23
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
* <Rating>-24</Rating>
*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE TNA.CARD.FEES.FIELDS
*-----------------------------------------------------------------------------
*********************************************************************
*                      PROJET CHALLENGE 24
*********************************************************************
*
* @author    RANIA
* @stereotype H
*********************************************************************
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19  :NO CHANGES
*-----------------------------------------------------------------------------
*** <region name= Header>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*** </region>
*-----------------------------------------------------------------------------
* <Main controlling section>
*----------------------------------------------------------------------

    GOSUB INITIALISATION
    GOSUB MAIN.PROCESS

RETURN
*---------------------------------------------------------------------------
INITIALISATION:
*file opening, variable set up

RETURN

*---------------------------------------------------------------------------
MAIN.PROCESS:
*main subroutine processing

    EB.Template.TableDefineid("ID", EB.Template.T24String)       ;* Define Table id

    EB.Template.TableAddfielddefinition("DESCRIPTION","30","A","");*
    EB.Template.TableAddfield("CURRENCY.CODE",EB.Template.T24String,EB.Template.FieldMandatory, "")
    EB.Template.FieldSetcheckfile("CURRENCY")
    EB.Template.TableAddamountfield("ISSUANCE.FEE","CURRENCY","","");*
    EB.Template.TableAddamountfield("RENEWAL.FEE","CURRENCY","","");*
    EB.Template.TableAddamountfield("PIN.FEE","15","","");*
    EB.Template.TableAddamountfield("DAMAGED.REPL.FEE","15","","");*
    EB.Template.TableAddamountfield("STOLEN.REPL.FEE","15","","");*
    EB.Template.TableAddamountfield("ERRONOUS.REPL.FEE","15","","");*
    EB.Template.TableAddamountfield("LOST.REPL.FEE","15","","");*
    EB.Template.TableAddamountfield("OTHER.REPL.FEE","15","","");*
    EB.Template.TableAddamountfield("COUNTREFEIT.REPL.F","15","","");*
    EB.Template.TableAddamountfield("STOP.LIST.FEE.1","15","","");*
    EB.Template.TableAddamountfield("STOP.LIST.FEE.2","15","","");*
    EB.Template.TableAddamountfield("OTHERS.FEES","15","","");*
    EB.Template.TableAddfielddefinition("TRANSACTION.CODE","","","");*
    EB.Template.FieldSetcheckfile("TRANSACTION")

    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
    EB.Template.TableSetauditposition() ;* Poputale audit information

RETURN
* ----------------------------------------------------------------------------
END
