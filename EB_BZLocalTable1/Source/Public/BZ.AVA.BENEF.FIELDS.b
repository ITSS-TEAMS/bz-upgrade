* @ValidationCode : MjotMjE0OTA3OTI6Q3AxMjUyOjE2MDA0Nzg5MzQyMjY6QWRtaW5pc3RyYXRldXI6LTE6LTE6MDoxOnRydWU6Ti9BOlIxOV9BTVIuMDotMTotMQ==
* @ValidationInfo : Timestamp         : 19 Sep 2020 02:28:54
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
* <Rating>0</Rating>
*-----------------------------------------------------------------------------
*Modification History:

*ZIT-UPG-R13-R19: FM CHANGED TO @FM
*-----------------------------------------------------------------------------
$PACKAGE EB.BZLocalTable1
SUBROUTINE BZ.AVA.BENEF.FIELDS
*-----------------------------------------------------------------------------
* $INSERT I_COMMON - Not Used anymore;
* $INSERT I_EQUATE - Not Used anymore;
* $INSERT I_DataTypes - Not Used anymore;
    
    $USING EB.API
    $USING EB.SystemTables
    $USING EB.Template
        
*-----------------------------------------------------------------------------
    EB.Template.TableDefineid("ID", "" : @FM : "10" : @FM : "A")
*-----------------------------------------------------------------------------
    EB.Template.TableAddfielddefinition("ID.CLIENT","10","A","")
    EB.Template.FieldSetcheckfile('CUSTOMER')

    EB.Template.TableAddfielddefinition("NOM.PRENOM.BEN","35","A","")

    EB.Template.TableAddfielddefinition("TYPE.BENEF.TRF","2","A","")
    EB.Template.FieldSetcheckfile('BZ.AVA.TYPE.BENEF')

    EB.Template.TableAddfielddefinition("NUM.IDENTIF.BEN","20","A","")
    EB.Template.TableAddfielddefinition("QUALITE.BEN","20","A","")
    EB.Template.FieldSetcheckfile('JOB.TITLE')

    EB.Template.TableAddfielddefinition("REF.AVA","20","A","")
    EB.Template.FieldSetcheckfile('BZ.AVA.DOSSIER')

    EB.Template.TableAddfielddefinition("ACTIVE","3","":@FM:"OUI_NON","")

    EB.Template.TableAddfielddefinition("DATE.MODIFICATION","8","D","")

    EB.Template.TableAddfielddefinition("AGENCE","20","A","")
    EB.Template.FieldSetcheckfile('DEPT.ACCT.OFFICER')

    EB.Template.TableAddfielddefinition("RESERVED1","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED2","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED3","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED4","15", "A", "")
    EB.Template.TableAddfielddefinition("RESERVED5","15", "A", "")
*-----------------------------------------------------------------------------
    EB.Template.TableAddlocalreferencefield("")
    EB.Template.TableAddoverridefield()
*-----------------------------------------------------------------------------
    EB.Template.TableSetauditposition()
*-----------------------------------------------------------------------------
RETURN
*-----------------------------------------------------------------------------
END
