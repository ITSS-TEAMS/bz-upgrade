* @ValidationCode : Mjo2NDQ1NDQyMjU6Q3AxMjUyOjE2MDA0ODQ3MjEzOTg6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIyMF9TUDQuMDotMTotMQ==
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
$PACKAGE EB.BZLocalTable2
SUBROUTINE BZ.TT.TSF.FONDS.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author fehmi bounouara
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* 08 / 07 / 09 - Obenhalima New Template changes

*ZIT-UPG-R13-R19 : NO CHANGES
* ----------------------------------------------------------------------------
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

*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID",EB.Template.T24String)          ;* Define Table id
*-----------------------------------------------------------------------------
*CALL Table.addFieldDefinition("ID", "20", "", "")
    EB.Template.TableAddfielddefinition("DATE.OPERATION", "8", "D", "")
    EB.Template.TableAddfielddefinition("UNITE.ENVOI", "4", "A", "")
    EB.Template.FieldSetcheckfile('DEPT.ACCT.OFFICER')
    EB.Template.TableAddfielddefinition("CAISSE.EMET", "4", "A", "")
    EB.Template.FieldSetcheckfile('TELLER.ID')
    EB.Template.TableAddfielddefinition("CAISSIER.EMET", "35", "A", "")
    EB.Template.TableAddfielddefinition("UNITE.RECEPTRICE", "4", "A", "")
    EB.Template.FieldSetcheckfile('DEPT.ACCT.OFFICER')
    EB.Template.TableAddfielddefinition("CAISSE.RECEPTRICE", "4", "A", "")
    EB.Template.FieldSetcheckfile('TELLER.ID')
    EB.Template.TableAddfielddefinition("CAISSIER.RECEPTEUR", "35", "A", "")
    EB.Template.TableAddfielddefinition("MONTANT", "15", "AMT", "")
    EB.Template.TableAddfielddefinition("DEVISE", "3", "CCY", "")
    EB.Template.FieldSetcheckfile('CURRENCY')
    EB.Template.TableAddfielddefinition("DATE.RECEPTION", "8", "D", "")
    EB.Template.TableAddfielddefinition("COURS", "10", "A", "")

    EB.Template.TableAddoptionsfield("STATUT", "Envoie_Reception_Annulation", "", "")
    EB.Template.TableAddoptionsfield("TYPE", "BBE_DEVISE.EN.COMPTE", "", "")

*-----------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
