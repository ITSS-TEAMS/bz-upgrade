* @ValidationCode : Mjo4NjU3NDI4MzM6Q3AxMjUyOjE2MDA0NzkxNjgyMTM6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIxOV9BTVIuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:32:48
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
* <Rating>-12</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.MDP.LIBELLE.CHEQUIER.FIELDS
*-----------------------------------------------------------------------------

*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
*ZIT-UPG-R13-R19:FM converted to @FM
* ----------------------------------------------------------------------------

*** <region name= Header>
*** <desc>Inserts and control logic</desc>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
* $INSERT I_F.ACCOUNT - Not Used anymore;

    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
    $USING AC.AccountOpening
*** </region>
*-----------------------------------------------------------------------------


    EB.SystemTables.setIdF("ID")
    EB.SystemTables.setIdN("10")
    EB.SystemTables.setIdT("A")
*CALL Table.defineId("ID", T24_Numeric : FM : "10")
    CHK.ACCOUNT = "ACCOUNT": @FM : AC.AccountOpening.Account.ShortTitle: @FM :"L"
    EB.SystemTables.setIdCheckfile(CHK.ACCOUNT)
*-----------------------------------------------------------------------------

    EB.Template.TableAddfielddefinition("LIBELLE","75", "A", "")

*-----------------------------------------------------------------------------


    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddreservedfield("Reserved")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
