* @ValidationCode : MjotMTUxNDA3NTg1ODpDcDEyNTI6MTYwMDU2MjE5MjEzMjpBZG1pbmlzdHJhdGV1cjotMTotMTowOjE6dHJ1ZTpOL0E6UjIwX1NQNC4wOi0xOi0x
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:36:32
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
* <Rating>-2</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable3
SUBROUTINE BZ.ETAT.HABILITATION.FIELDS
*------------------------------------------------------
*MODIFICATION HISTORY:
*ZIT-UPG-R13-R19-FM TO @FM
********************************************************
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*** </region>
*-----------------------------------------------------------------------------
*CALL Table.defineId("@ID", T24_String)        ;* Define Table id
    EB.Template.TableDefineid("ID", "" : @FM : "20" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfield("USER.R1", EB.Template.T24String,'', '')
    EB.Template.TableAddfield("APP.R1", EB.Template.T24String,'', '')
    EB.Template.TableAddfield("FUNCTION.R1", EB.Template.T24String,'', '')
    EB.Template.TableAddfield("OVERRIDE.R1", EB.Template.T24String,'', '')
    EB.Template.TableAddfield("DAO.R1", EB.Template.T24String,'', '')
    EB.Template.TableAddfield("TT.R1", EB.Template.T24String,'', '')
    EB.Template.TableAddfield("TT.STATUS.1", EB.Template.T24String,'', '')
    EB.Template.TableAddfield("USER.R2", EB.Template.T24String,'', '')
    EB.Template.TableAddfield("APP.R2", EB.Template.T24String,'', '')
    EB.Template.TableAddfield("FUNCTION.R2", EB.Template.T24String,'', '')
    EB.Template.TableAddfield("OVERRIDE.R2", EB.Template.T24String,'', '')
    EB.Template.TableAddfield("DAO.R2", EB.Template.T24String,'', '')
    EB.Template.TableAddfield("TT.R2", EB.Template.T24String,'', '')
    EB.Template.TableAddfield("TT.STATUS.2", EB.Template.T24String,'', '')
    EB.Template.TableAddfield("USER.R3", EB.Template.T24String,'', '')
    EB.Template.TableAddfield("APP.R3", EB.Template.T24String,'', '')
    EB.Template.TableAddfield("FUNCTION.R3", EB.Template.T24String,'', '')
    EB.Template.TableAddfield("OVERRIDE.R3", EB.Template.T24String,'', '')
    EB.Template.TableAddfield("DAO.R3", EB.Template.T24String,'', '')
    EB.Template.TableAddfield("TT.R3", EB.Template.T24String,'', '')
    EB.Template.TableAddfield("TT.STATUS.3", EB.Template.T24String,'', '')
    EB.Template.TableAddfield("ID.REF", EB.Template.T24String,'', '')
    EB.Template.TableAddfield("DATE.DEBUT", EB.Template.T24Date, '', '')
    EB.Template.TableAddfield("DATE.FIN", EB.Template.T24Date, '', '')
    EB.Template.TableAddfield("DATE.OPERATION", EB.Template.T24Date, '', '')


*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
