* @ValidationCode : MjotNjY3Njc1NzE1OkNwMTI1MjoxNjAwNDc5MDk0MDU2OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
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
* <Rating>-2</Rating>
*------------------------------------------------------------------------
* Modification History :

*ZIT-UPG-R13-R19: FM CHANGED @FM
*-----------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.HABILITATION.FIELDS
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
*** </region>
*-----------------------------------------------------------------------------
*CALL Table.defineId("@ID", T24_String)        ;* Define Table id
    EB.Template.TableDefineid("ID", "" : @FM : "20" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfield("USER.REMPLACE.1", EB.Template.T24String, EB.Template.FieldMandatory, '')
    EB.Template.FieldSetcheckfile("USER")
    EB.Template.TableAddfield("USER.REMPLACE.2", EB.Template.T24String,'', '')
    EB.Template.FieldSetcheckfile("USER")
    EB.Template.TableAddfield("USER.REMPLACANT", EB.Template.T24String, EB.Template.FieldMandatory, '')
    EB.Template.FieldSetcheckfile("USER")
    EB.Template.TableAddfield("DATE.DEBUT", EB.Template.T24Date, EB.Template.FieldMandatory, '')
    EB.Template.TableAddfield("DATE.FIN", EB.Template.T24Date, EB.Template.FieldMandatory, '')
    EB.Template.TableAddfield("DATE.OPERATION", EB.Template.T24Date, '', '')
    EB.Template.TableAddfield("STATUT.HABIL", EB.Template.T24String,'','')
    EB.Template.TableAddfield("STATUT.REHABIL", EB.Template.T24String,'','')
    EB.Template.TableAddfielddefinition("XX.OVERRIDE.1", "500","A" : @FM :"" : @FM :"NOINPUT", "")
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
