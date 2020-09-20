* @ValidationCode : Mjo1OTYyMTYwNzk6Q3AxMjUyOjE2MDA0NzkyNzExMDU6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIxOV9BTVIuMDotMTotMQ==
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
SUBROUTINE BZ.SED.DEC.CONCAT.FIELDS
*-----------------------------------------------------------------------------
*<doc>
* TODO add a description of the application here.
* @DEVT24@BANQUEZITOUNA
*
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* 08 / 07 / 2010
*ZIT-UPG-R13-R19  : FM CHANGES TO @FM
* ----------------------------------------------------------------------------
*** <region name= Header>
*** <desc>Inserts and control logic</desc>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.SystemTables
    $USING EB.API
    $USING EB.Template
*** </region>

*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "90" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("ID.OPERATION","10", "A", "")
    EB.Template.TableAddfielddefinition("DTE.OPERATION","8", "D", "")
    EB.Template.TableAddfielddefinition("ANNEXE","15", "A", "")
    EB.Template.TableAddfielddefinition("DATE.DEC","8", "D", "")
    EB.Template.TableAddfielddefinition("FICHIER.DEC","50", "A", "")
    EB.Template.TableAddfielddefinition("STATUT","5", "A", "")

*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("RESERVED.1","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.2","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.3","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.4","10", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED.5","10", "A", "")
*-----------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()         ;* Poputale audit information
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
