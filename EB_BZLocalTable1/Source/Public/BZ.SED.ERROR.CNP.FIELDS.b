* @ValidationCode : Mjo4OTk4ODMzMTU6Q3AxMjUyOjE2MDA0NzkyNzE3MjI6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIxOV9BTVIuMDotMTotMQ==
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
SUBROUTINE BZ.SED.ERROR.CNP.FIELDS
*-----------------------------------------------------------------------------
*<doc>
*TODO add a description of the application here.
*AUTEUR : FIRAS YENGUI
*
*
*
*-----------------------------------------------------------------------------
* TODO - You MUST write a .FIELDS routine for the field definitions
*-----------------------------------------------------------------------------
* Modification History :
*-----------------------
* 08 / 07 / 2010
*ZITUNA-UPG-R13-R19 :  removed BP's and changed INCLUDE to INSERT
*                      FM converted to @FM
* ----------------------------------------------------------------------------
*** <region name= Header>
*** <desc>Inserts and control logic</desc>
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
 
*** </region>

*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "50" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("LIGNE","5","A","")

    EB.Template.TableAddfielddefinition("CODE","20","A","")
  
    EB.Template.TableAddfielddefinition("DESCRIPTION","220","A","")

    
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
