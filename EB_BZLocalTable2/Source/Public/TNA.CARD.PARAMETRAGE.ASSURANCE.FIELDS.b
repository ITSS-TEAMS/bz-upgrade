* @ValidationCode : Mjo2NDU2NzYxNTpDcDEyNTI6MTYwMDU2MDE0NDI0MDpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjIwX1NQNC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:02:24
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
* <Rating>-12</Rating>
* Modification History :
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE TNA.CARD.PARAMETRAGE.ASSURANCE.FIELDS
*-----------------------------------------------------------------------------
*********************************************************************
*                      PROJET CHALLENGE 24
*********************************************************************
*
* @author    :RELMEDYER@TEMENOS.COM
*
* @Mail
*
* @desc      TABLE PARAMETRAGE  ASSURANCE SUR CARTE
* @desc
*
* @create    03/10/2010 10:40:25
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


*---------------------------------------------------------------------------
MAIN.PROCESS:
*main subroutine processing

    EB.Template.TableDefineid("ID", EB.Template.T24String)         ;* Define Table id

    EB.Template.TableAddfielddefinition("COMPTE.ASSURANCE","20","A","")     ;*
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("FILE.NAME","20","A","")  ;*
*CALL Table.addFieldDefinition("FILE.PATH","35","A","");*
    EB.Template.TableAddfielddefinition("XX<FILE.PATH","35","A","")
    EB.Template.TableAddfielddefinition("COMPTE.TVA","20","A","") ;*
    EB.Template.TableAddfielddefinition("COMPTE.PL","20","A","")  ;*
    EB.Template.TableAddfielddefinition("TAUX.COMMISSION","2","A","")       ;*
    EB.Template.TableAddfielddefinition("TAUX.TVA","2","A","")    ;*
    EB.Template.TableAddfielddefinition("FTTC.TVA","4","A","")
    EB.Template.TableAddfielddefinition("XX<SECTOR","6","A","")
    EB.Template.FieldSetcheckfile("SECTOR")

    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
    EB.Template.TableSetauditposition()         ;* Poputale audit information

RETURN
* ----------------------------------------------------------------------------
END
