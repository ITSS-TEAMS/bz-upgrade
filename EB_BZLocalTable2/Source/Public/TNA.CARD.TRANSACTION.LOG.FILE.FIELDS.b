* @ValidationCode : MjoxODg0MjczMDQ5OkNwMTI1MjoxNjAwNTYwMTQ0ODkxOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMjBfU1A0LjA6LTE6LTE=
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
*-------------------------------------------------------------------------
* <Rating>-3</Rating>
*-------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable2
SUBROUTINE TNA.CARD.TRANSACTION.LOG.FILE.FIELDS
*-------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author rababa@temenos.com
* @stereotype H
*
*
*-------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-------------------------------------------------------------------------
* Modification History :

*ZIT-UPG-R13-R19 : NO CHANGES
*                  ROUTINE NAME LEGTH IS MORE THAN 35 CHARCTERS.
*------------------------------------------------------------------------

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
*-------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", EB.Template.T24String)         ;* Define Table id
*-------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("XX<DATE.TRAITEMENT", "8","D", "")

    EB.Template.TableAddfielddefinition("XX-NUM.COMMERCANT","10","A","")

    EB.Template.TableAddfielddefinition("XX-DATE.TRX","8","A","")

    EB.Template.TableAddfielddefinition("XX-TIME.TRX", "6", EB.Template.T24String, "") ;* Add a new f

    EB.Template.TableAddfielddefinition("XX-NUM.CARTE","19",EB.Template.T24String,"")
    EB.Template.TableAddfielddefinition("XX-SERVICE.CODE","3",EB.Template.T24String,"")

    EB.Template.TableAddfielddefinition("XX-CODE.TRX","2", EB.Template.T24String,"")

    EB.Template.TableAddfielddefinition("XX-SEQ.TRX","13", EB.Template.T24String,"")
    EB.Template.TableAddfielddefinition("XX-MESSAGE","4", EB.Template.T24String,"")
    EB.Template.TableAddfielddefinition("XX-REV.REASON","2", EB.Template.T24String,"")
    EB.Template.TableAddfielddefinition("XX-ACQ.ID","4", EB.Template.T24String,"")
    EB.Template.TableAddfielddefinition("XX-ISS.ID","4", EB.Template.T24String,"")
    EB.Template.TableAddfielddefinition("XX-AUTO","6", EB.Template.T24String,"")
    EB.Template.TableAddfielddefinition("XX-MONTANT","10", EB.Template.T24String,"")
    EB.Template.TableAddfielddefinition("XX-RESP.CODE","3", EB.Template.T24String,"")
    EB.Template.TableAddfielddefinition("XX-INVOICE.NBR","10", EB.Template.T24String,"")
    EB.Template.TableAddfielddefinition("XX-TERM.ID","10", EB.Template.T24String,"")
    EB.Template.TableAddfielddefinition("XX-COM.LOCALITE","25", EB.Template.T24String,"")
    EB.Template.TableAddfielddefinition("XX-TXN.COM.ENS","22", EB.Template.T24String,"")
    EB.Template.TableAddfielddefinition("XX-COMM.ZONE","13", EB.Template.T24String,"")
    EB.Template.TableAddfielddefinition("XX-COMM.PAYS","2", EB.Template.T24String,"")
    EB.Template.TableAddfielddefinition("XX-TRX.MONNAIE","3", EB.Template.T24String,"")
    EB.Template.TableAddfielddefinition("XX-TYPE.COMPTE","2", EB.Template.T24String,"")


    EB.Template.TableAddfielddefinition("XX>TABLE.ORIGINE","5", EB.Template.T24String,"")
*-------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-------------------------------------------------------------------------
RETURN
*-------------------------------------------------------------------------
END
