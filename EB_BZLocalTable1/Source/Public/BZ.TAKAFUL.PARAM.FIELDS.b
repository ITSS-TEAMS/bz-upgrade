* @ValidationCode : MjoxNDQ2NTYwMDQ4OkNwMTI1MjoxNjAwNDc5MzI3MzcyOkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:35:27
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
* Modification History :
* ZIT-UPG-R13-R19 : Converted $INCLUDE TO $INSERT, Converted FM to @FM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.TAKAFUL.PARAM.FIELDS
*-----------------------------------------------------------------------------
*
* @author    REDOUANE AKROUTE
*
* @Mail         rakroute@temenos.com
*
* @desc      BZ.TAKAFUL.PARAM.FIELDS - (TEMPLATE GENERATOR TOOL)
*
* @create    04/04/2012
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
*
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


    EB.Template.TableDefineid("ID", "" : @FM : "6" : @FM : "A")
    EB.Template.TableAddfielddefinition("ID.TAKAFUL","35","A","")

    EB.Template.TableAddfielddefinition("COMPTE.RS","35","A","")
    EB.Template.FieldSetcheckfile("ACCOUNT")

*** RESERVED
    EB.Template.TableAddfielddefinition("RESERVED1","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED2","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED3","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED4","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED5","15", "A", "")



    EB.Template.TableAddlocalreferencefield("")

    EB.Template.TableAddoverridefield()
    EB.Template.TableSetauditposition()         ;* Poputale audit information

* ----------------------------------------------------------------------------
END
