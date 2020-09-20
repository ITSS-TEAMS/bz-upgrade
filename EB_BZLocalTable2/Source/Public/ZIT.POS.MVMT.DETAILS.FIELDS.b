* @ValidationCode : MjotMTY1NjQxMzg1OTpDcDEyNTI6MTYwMDU2MDE0NTA3MDpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjIwX1NQNC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:02:25
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
* Modification History :
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Converted FM to @FM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE ZIT.POS.MVMT.DETAILS.FIELDS
*-----------------------------------------------------------------------------
*********************************************************************
*                      PROJET CHALLENGE 24
*********************************************************************
*
* @author    OBennhalima
*
* @Mail
*
* @desc      THIS IS AN AUTO-GENERATED ROUTINE
* @desc      ZIT.POS.MVMT.DETAILS TEMPLATE - (TEMPLATE GENERATOR TOOL)
*
* @create    16/07/2010 17:34:32
*
* @param
*
* @calls
*
* @error
*
* @change
*
* @revby
*
* @stereotype H
*********************************************************************
*-----------------------------------------------------------------------------
*** <region name= Header>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.API
    $USING EB.SystemTables
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

    EB.Template.TableDefineid("ID", "" : @FM : "60" : @FM : "")     ;* Define Table id

    EB.Template.TableAddfielddefinition("REQUETE","60","A","")    ;*
    EB.Template.TableAddfielddefinition("MONTANT","20","AMT","")  ;*

    EB.Template.TableAddfielddefinition("DEVISE.DEBIT","3","A","")          ;*
    EB.Template.FieldSetcheckfile("CURRENCY")
    EB.Template.TableAddfielddefinition("DEVISE.CREDIT","3","A","")         ;*
    EB.Template.FieldSetcheckfile("CUSRRENCY")
    EB.Template.TableAddfielddefinition("COMPTE.DEBIT","15","ACC","")       ;*
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("COMPTE.CREDIT","15","ACC","")      ;*
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("EXCH.RATE","15","A","")  ;*
    EB.Template.TableAddfielddefinition("ABS.MONTANT","20","AMT","")
    EB.Template.TableAddfielddefinition("DEALER.DESK","20","AMT","")
    EB.Template.TableAddfielddefinition("MONTANT.CREDIT","20","AMT","")
    EB.Template.TableAddfielddefinition("MONTANT.DEBIT","20","AMT","")

    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
    EB.Template.TableSetauditposition()         ;* Poputale audit information

RETURN
* ----------------------------------------------------------------------------
END
