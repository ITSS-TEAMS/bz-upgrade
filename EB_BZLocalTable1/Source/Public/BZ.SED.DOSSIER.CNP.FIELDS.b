* @ValidationCode : MjotNDM5MDE0OTQ3OkNwMTI1MjoxNjAwNDc5MjcxNjI3OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:34:31
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
SUBROUTINE BZ.SED.DOSSIER.CNP.FIELDS
*-----------------------------------------------------------------------------
*<doc>
*TODO add a description of the application here.
*AUTEUR : FEHMI BOUNOUARA
*
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* 08 / 07 / 2010
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
    EB.Template.TableDefineid("ID", "" : @FM : "50" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("EVT.DEC","6","A","")

    EB.Template.TableAddfielddefinition("ID.DOSSIER","35","A","")

    EB.Template.TableAddfielddefinition("STATUT","10","A","")

    EB.Template.TableAddfielddefinition("DATE.EVT","8","D","")

    EB.Template.TableAddfielddefinition("FICHIER.EMIS","50","A","")

    EB.Template.TableAddfielddefinition("DATE.EMISSION","8","D","")

    EB.Template.TableAddfielddefinition("FICHIER.RECU","50","A","")

    EB.Template.TableAddfielddefinition("DATE.RECEPTION","8","D","")

    EB.Template.TableAddfielddefinition("XX<CODE.REJET","15","A","")

    EB.Template.TableAddfielddefinition("XX-COMMENTAIRE","220","A","")

    EB.Template.TableAddfielddefinition("XX>LIGNE","3","A","")
*-----------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
