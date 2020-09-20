* @ValidationCode : MjoxMjI2NzA2NTk5OkNwMTI1MjoxNjAwNDc5MjUxMjc3OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:34:11
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
SUBROUTINE BZ.REPORTING.ETR.FIELDS
	
*------------------------------------------------------------------------
* Modification History :
*-----------------------

*ZIT-UPG-R13-R19 : FM TO @FM;
*-----------------------------------------------------------------------
*ZIT-UPG-R13-R19/S
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
*ZIT-UPG-R13-R19/E
*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "25" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("DATE.OPERATION","8","D","")
    EB.Template.TableAddfielddefinition("NOM","50","A","")
    EB.Template.TableAddfielddefinition("TYPE.DOCUMENT","20","A","")
    EB.Template.TableAddfielddefinition("NUMERO.DOCUMENT","20","A","")
    EB.Template.TableAddfielddefinition("ID.BENEFICIAIRE","35","A","")
    EB.Template.TableAddfielddefinition("PAYS","35","A","")
    EB.Template.TableAddfielddefinition("MONTANT.TRANSFERT","15","AMT","")
    EB.Template.TableAddfielddefinition("DEVISE","3","A","")
    EB.Template.TableAddfielddefinition("NATURE.TRANSFERT","35","A","")
    EB.Template.TableAddfielddefinition("RETENUE.SOURCE","15","AMT","")
    EB.Template.TableAddfielddefinition("REFERENCE.FT","12","A","")
    EB.Template.TableAddfielddefinition("TYPE.TRANSACTION","4","A","")
    EB.Template.TableAddfielddefinition("STATUT","1","A","")
    EB.Template.TableAddfielddefinition("RESERVED1","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED2","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED3","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED4","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED5","15", "A", "")
*-----------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
