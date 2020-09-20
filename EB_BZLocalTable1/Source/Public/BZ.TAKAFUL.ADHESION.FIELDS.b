* @ValidationCode : MjoyMDY2NTcwMDc5OkNwMTI1MjoxNjAwNDc5MzI3MTc4OkFkbWluaXN0cmF0ZXVyOi0xOi0xOjA6MTp0cnVlOk4vQTpSMTlfQU1SLjA6LTE6LTE=
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
* <Rating>-2</Rating>
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.TAKAFUL.ADHESION.FIELDS
*-----------------------------------------------------------------------------
*
* @author    REDOUANE AKROUTE
*
* @Mail         rakroute@temenos.com
*
* @desc      BZ.TAKAFUL.ADHESION.FIELDS - (TEMPLATE GENERATOR TOOL)
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
*Modification History :
*ZIT-UPG-R13-R19 :  No Changes.
*-----------------------------------------------------------------------------
*** <region name= Header>
* $INSERT I_COMMON - Not Used anymore;N
* $INSERT I_EQUATE - Not Used anymore;E
* $INSERT I_DataTypes - Not Used anymore;s
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*** </region>
*-----------------------------------------------------------------------------
* <Main controlling section>
*----------------------------------------------------------------------


    EB.Template.TableDefineid("ID",EB.Template.T24String)          ;* Define Table id

    EB.Template.TableAddfielddefinition("TYPE.TAKAFUL","4","","")
    EB.Template.FieldSetcheckfile("BZ.TAKAFUL.PRODUIT")
    EB.Template.TableAddfielddefinition("TYPE.FINANCEMENT","15","A","")
    EB.Template.FieldSetcheckfile("IS.H.PRODUCTS")
    EB.Template.TableAddfielddefinition("XX.REF.FINANCEMENT","15","A","")
    EB.Template.TableAddfielddefinition("COMPTE","15","A","")
    EB.Template.FieldSetcheckfile("ACCOUNT")
    EB.Template.TableAddfielddefinition("DATE.CREATION","8","D","")
    EB.Template.TableAddfielddefinition("DATE.EFFET","8","D","")
    EB.Template.TableAddfielddefinition("REF.CONTRIBUTION","15","A","")
    EB.Template.TableAddfielddefinition("REF.COMMISSION","15","A","")
    EB.Template.TableAddfielddefinition("REF.RS","15","A","")


*** RESERVED
    EB.Template.TableAddfielddefinition("RESERVED1","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED2","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED3","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED4","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED5","15", "A", "")



    EB.Template.TableAddoverridefield()
    EB.Template.TableSetauditposition()         ;* Poputale audit information

* ----------------------------------------------------------------------------
END
