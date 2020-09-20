* @ValidationCode : MjoyMTA1OTI0MzIzOkNwMTI1MjoxNjAwNDc5Mjk1MjAzOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:34:55
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
* <Rating>-1</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.SM.PARAMETER.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @author Bounouara fehmi
* @stereotype H
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19 : Converted FM to @FM.
* ----------------------------------------------------------------------------

*** <region name= Header>
*** <desc>Inserts and control logic</desc>
* $INSERT I_COMMON - Not Used anymore;N
* $INSERT I_EQUATE - Not Used anymore;E
* $INSERT I_DataTypes - Not Used anymore;s
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*** </region>

*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "6" : @FM : "A")
*-----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("XX<DEVISE", "3.1","A","")
    EB.Template.FieldSetcheckfile("CURRENCY")
    EB.Template.TableAddfielddefinition("XX-TAUX", "10.1","A","")
    EB.Template.TableAddfielddefinition("XX>TOLERANCE", "10.1","A","")

    EB.Template.TableAddfielddefinition("FRAIS.VISA", "6.1","A","")
    EB.Template.TableAddfielddefinition("FRAIS.MDC", "6.1","A","")

    EB.Template.TableAddfielddefinition("FRAIS.CASH.ADVC", "7.1","A","")
    EB.Template.TableAddfielddefinition("CASH.ADVANCE.VAR", "7.1","A","")

    EB.Template.TableAddfielddefinition("FRAIS.RET.DAB.FIXE", "7.1","A","")
    EB.Template.TableAddfielddefinition("RETRAIT.DAB.VAR", "7.1","A","")

    EB.Template.TableAddfielddefinition("CPT.NOSTRO", "10","ACC","")
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("CPT.TECHNIQUE", "10","ACC","")
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("FRAIS.ATB", "10.1","A","")
*-----------------------------------------------------------------------------
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
