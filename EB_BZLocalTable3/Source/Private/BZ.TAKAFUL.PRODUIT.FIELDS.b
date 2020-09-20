* @ValidationCode : Mjo4MTc0MDIxOTE6Q3AxMjUyOjE2MDA1NjI3NTQ0NTI6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIyMF9TUDQuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 20 Sep 2020 01:45:54
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
$PACKAGE EB.BZLocalTable3
SUBROUTINE BZ.TAKAFUL.PRODUIT.FIELDS
*-----------------------------------------------------------------------------
*MAJ le 07/12/2012
*Auteur : MASTOURI ABDELMONAAM
*Description : Ajout de trois champs (TAUX.TAXE,FRAIS,FONDS.ASSOCIE)
*-----------------------------------------------------------------------------
*ZIT-UPG-R13-R19-FM TO @FM
*-----------------------------------------------------------------------------
*** <region name= Header>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*** </region>
*-----------------------------------------------------------------------------
* <Main controlling section>
*----------------------------------------------------------------------


    EB.Template.TableDefineid("ID", "" : @FM : "4" : @FM : "A")

    EB.Template.TableAddfielddefinition("DESCRIPTION","35","A","")

    EB.Template.TableAddfielddefinition("COMPTE","35","A","")
    EB.Template.FieldSetcheckfile("ACCOUNT")

    EB.Template.TableAddfielddefinition("TAUX.COM","10","A","")
    EB.Template.TableAddfielddefinition("TAUX.RS","10","A","")

    EB.Template.TableAddfielddefinition("CATEGORY.COM","5","","")
    EB.Template.FieldSetcheckfile("CATEGORY")
    EB.Template.TableAddfielddefinition("TAUX.TAXE","10","A","")
    EB.Template.TableAddfielddefinition("FRAIS","12","A","")
    EB.Template.TableAddfielddefinition("FONDS.ASSOCIE","12","A","")
*** RESERVED
    EB.Template.TableAddfielddefinition("RESERVED1","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED2","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED3","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED4","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED5","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED6","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED7","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED8","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED9","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED10","15", "A", "")


    EB.Template.TableAddoverridefield()
    EB.Template.TableSetauditposition()         ;* Poputale audit information

* ----------------------------------------------------------------------------
END
