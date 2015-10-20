#tag Window
Begin ContainerControl DesignerCC
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   False
   HasBackColor    =   False
   Height          =   600
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   0
   Transparent     =   True
   UseFocusRing    =   False
   Visible         =   True
   Width           =   860
   Begin PAF_PropertyListCC PList
      AcceptFocus     =   False
      AcceptTabs      =   True
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      Backdrop        =   0
      Enabled         =   True
      EraseBackground =   False
      HasBackColor    =   False
      Height          =   600
      HelpTag         =   ""
      InitialParent   =   ""
      Left            =   632
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   228
   End
   Begin PAF_ScrollerCC Scroller
      AcceptFocus     =   False
      AcceptTabs      =   True
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      Backdrop        =   0
      Enabled         =   True
      EraseBackground =   False
      HasBackColor    =   False
      Height          =   600
      HelpTag         =   ""
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   620
   End
   Begin imSplitter imSplitter1
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Backdrop        =   0
      DockAfter       =   True
      DockAfterSize   =   40
      DockBefore      =   True
      DockBeforeSize  =   40
      DoubleBuffer    =   True
      DoubleClickAction=   0
      Enabled         =   True
      EraseBackground =   False
      HasBackColor    =   False
      Height          =   600
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      IsDocked        =   False
      IsDockedPosition=   ""
      Left            =   621
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MinAfterArea    =   20
      MinBeforeArea   =   30
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   10
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  Scroller.Plist = PList
		  Plist.ParentContainer = self
		  
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #Pragma Unused areas
		  
		  g.ClearRect(0,0,g.Width,g.Height)
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Function BuildReportBands(bAdjustBandsForPrint as boolean = false) As JSONItem
		  
		  
		  dim jBands as new JSONItem
		  
		  dim oBand,aroReportBands() as PAF_PrintKit.PrintBand
		  
		  // need to adjust for the thickness (10) of the band info area
		  if bAdjustBandsForPrint then
		    
		    dim iDelta As integer
		    
		    for i as integer = 0 to Scroller.Designer.Bands.Ubound
		      
		      oBand = scroller.Designer.Bands(i).Clone
		      
		      oBand.top = oBand.top - iDelta
		      
		      oband.Height = oBand.Height - 10
		      
		      For each oItem as PAF_PrintKit.PrintItem in oBand.Items
		        
		        oItem.top = oItem.top - iDelta
		        
		      next
		      
		      aroReportBands.Append oBand
		      
		      iDelta = iDelta + 10
		      
		    next
		    
		    for each band as PAF_PrintKit.PrintBand in aroReportBands
		      
		      jBands.Append band.SerializeJSON
		      
		    next
		    
		  else
		    
		    for each band as PAF_PrintKit.PrintBand in Scroller.Designer.Bands
		      
		      jBands.Append band.SerializeJSON
		      
		    next
		    
		  end if
		  
		  Return jBands
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildReportConnection() As JSONItem
		  
		  
		  dim jConnection as New JSONItem
		  
		  if oDBWrapper <> nil then
		    
		    jConnection.Value("db")= oDBWrapper.type
		    
		    if oDBWrapper.type = "CubeSQL" or oDBWrapper.type = "PostgreSQL" or oDBWrapper.type = "MySQL" then
		      
		      jConnection.Value("host") = oDBWrapper.Host
		      jConnection.Value("port") = oDBWrapper.Port
		      jConnection.Value("name") = oDBWrapper.DatabaseName
		      jConnection.Value("user") = oDBWrapper.UserName
		      
		    elseif oDBWrapper.type = "ODBC" then
		      
		      dim sDatasource as String = oDBWrapper.DataSource
		      dim sDSN as String = NthField(sDatasource,";",1)
		      dim sUser as String = NthField(sDatasource,";",2)
		      
		      jConnection.Value("dsn") = NthField(sDSN,"=",2)
		      jConnection.Value("user") = NthField(sUser,"=",2)
		      
		    elseif oDBWrapper.type = "SQLite" then
		      
		      jConnection.Value("dbFile") = EncodeBase64(oDBWrapper.DatabaseFile.GetSaveInfo(app.ExecutableFile,0))
		      
		    end if
		    
		    
		    Return jConnection
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildReportJSON(bAdjustBandsForPrint As Boolean = false) As JSONItem
		  
		  
		  dim jOut as new JSONItem
		  
		  jOut.Value("Name") = Scroller.Designer.ReportName
		  
		  jOut.Child("Window") = BuildReportWindow
		  
		  jOut.Child("Connection") = BuildReportConnection
		  
		  jOut.Child("Styles") = BuildReportStyles
		  
		  if not oDBWrapper.HasForeignKeys then
		    
		    jOut.Child("Relations") = BuildReportRelations
		    
		  end if
		  
		  jOut.Child("Bands") = BuildReportBands(bAdjustBandsForPrint)
		  
		  jOut.value("WhereConditions") = BuildWhereConditions
		  
		  jOut.Value("Views") = BuildTempViews
		  
		  if PrinterSetup <> nil then
		    
		    jOut.Child("Setup") = BuildReportSetup
		    
		  end if
		  
		  jOut.Compact = False
		  
		  Return jOut
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildReportRelations() As JSONItem
		  
		  
		  dim jRelations as New JSONItem
		  
		  if not oDBWrapper.HasForeignKeys then
		    
		    For each oKey as PAF_DatabaseKit.ForeignKey in oDBWrapper.ForeignKeys
		      
		      jRelations.Append oKey.SerializeJSON
		      
		    next
		    
		    Return jRelations
		    
		  end if
		  
		  Return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildReportSetup() As JSONItem
		  dim jSetup As new JSONItem
		  
		  jSetup.Value("setupString") = EncodeBase64(PrinterSetup.SetupString)
		  
		  return jSetup
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildReportStyles() As JSONItem
		  
		  
		  Dim ReportStyleDict As Dictionary = PAF_PrintKit.ExtractReportStyles(Scroller.Designer.Bands)
		  
		  dim sKeys() as string = VariantArrayToStringArray(ReportStyleDict.keys)
		  
		  dim oStyle as PAF_PrintKit.PrintStyle
		  
		  dim jStyle, jStyles as JSONItem
		  
		  jStyles = new JSONItem
		  
		  for i as integer = 0 to sKeys.Ubound
		    
		    oStyle = ReportStyleDict.Value(sKeys(i))
		    
		    jStyle = PAF_PrintKit.PrintStyle.SerializeJSON(oStyle)
		    
		    jStyles.Append jStyle
		    
		  next
		  
		  return jStyles
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildReportWindow() As JSONItem
		  
		  
		  Dim jWindow as new JSONItem
		  
		  Dim myBounds As REALbasic.Rect = self.TrueWindow.Bounds
		  
		  jWindow.Append myBounds.Left
		  jWindow.Append myBounds.Top
		  jWindow.Append myBounds.Width
		  jWindow.Append myBounds.Height
		  
		  Return jWindow
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildTempViews() As JSONItem
		  
		  
		  dim jViews as New JSONItem
		  
		  dim jView As JSONItem
		  
		  if oDBWrapper.TempViewDict <> nil then
		    for each entry as xojo.Core.DictionaryEntry in oDBWrapper.TempViewDict
		      jView = new JSONItem
		      jView.Value("name") = entry.Key
		      jView.Value("sql") = entry.Value
		      
		      jViews.Append jView
		      
		    next
		  end if
		  
		  Return jViews
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildWhereConditions() As JSONItem
		  
		  
		  // Where Conditions
		  Dim oCondition As PAFQueryCondition
		  
		  dim jWhere As New JSONItem
		  
		  For i As integer = 0 to Scroller.Designer.WhereConditions.Ubound
		    
		    oCondition = Scroller.Designer.WhereConditions(i)
		    
		    jWhere.Append oCondition.SerializeJSON
		    
		  Next
		  
		  Return jWhere
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CheckForExistingConnection(dbHash as String) As Boolean
		  ' For i as integer = 0 to WindowCount - 1
		  '
		  ' if Window(i) isa MainWindow then
		  '
		  ' dim reportDB as PAF_DatabaseKit.DBWrapper
		  '
		  ' dim matchString as String
		  '
		  ' reportDB = db
		  '
		  ' if reportDB <> nil then
		  '
		  ' dim jConnection as JSONItem
		  '
		  ' jConnection = New JSONItem
		  ' jConnection.Value("db")= reportDB.type
		  '
		  ' if reportDB.type = "cubesql" or reportDB.type = "PostgreSQL" then
		  '
		  ' jConnection.Value("host") = reportDB.Host
		  ' jConnection.Value("port") = reportDB.Port
		  ' jConnection.Value("name") = reportDB.DatabaseName
		  ' jConnection.Value("user") = reportDB.UserName
		  '
		  ' elseif reportDB.type = "odbc" then
		  '
		  ' dim sDatasource as String = reportDB.DataSource
		  ' dim sDSN as String = NthField(sDatasource,";",1)
		  ' dim sUser as String = NthField(sDatasource,";",2)
		  '
		  ' jConnection.Value("dsn") = NthField(sDSN,"=",2)
		  ' jConnection.Value("user") = NthField(sUser,"=",2)
		  '
		  ' elseif reportDB.type = "sqlite" then
		  '
		  ' jConnection.Value("dbFile") = reportDB.DatabaseFile.GetSaveInfo(app.ExecutableFile,0)
		  '
		  ' end if
		  '
		  ' matchString = EncodeHex(MD5(jConnection.ToString()))
		  '
		  ' if matchString = dbHash then
		  '
		  ' Return True
		  '
		  ' end if
		  '
		  ' end if
		  '
		  ' end if
		  '
		  ' next
		  '
		  ' Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ConnectSQLite(optional dbFile as FolderItem)
		  oDBWrapper = New PAF_DatabaseKit.DBWrapper("sqlite")
		  oDBWrapper.type = "sqlite"
		  
		  dim sqliteDB as New SQLiteDatabase
		  
		  sqliteDB.DatabaseFile = dbFile
		  
		  if  dbFile <> nil and sqliteDB.Connect then
		    
		    ConnectSQLite(sqliteDB)
		    
		  else
		    
		    dim Cypher_Key as String
		    
		    dim dlg as New OpenDialog
		    
		    dlg.PromptText = "Select SQLite Database"
		    dlg.Filter = ProjectFileTypes.SpecialAny
		    
		    dlg.Title = "Open Database"
		    
		    sqliteDB.DatabaseFile = dlg.ShowModal()
		    
		    if sqliteDB.DatabaseFile <> nil then
		      
		      if sqliteDB.Connect then
		        
		        ConnectSQLite(sqliteDB)
		        
		      else
		        
		        If sqliteDB.ErrorCode = 21 Or sqliteDB.errorcode = 26 Then' File is encrypted or is not a database
		          //
		          Do
		            
		            Cypher_Key = PAFInputWin.GetInput("The database appears to be encrypted." + EndOfLine + "Please enter the key.","OK", "Cancel","You must enter a key or press cancel to continue",true,true) ' ask user for key
		            
		            If Cypher_Key = "Cancel" Then  'user gave up
		              
		              exit
		              
		            End If
		            
		            sqliteDB.EncryptionKey=Cypher_Key
		            
		            If sqliteDB.Connect Then Exit Do
		            
		          Loop
		          
		          ConnectSQLite(sqliteDB)
		          
		        Else
		          
		          msgbox "connection error"
		          
		          'Quit
		          
		        End If
		      end if
		      
		      'user cancelled
		      
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ConnectSQLite(sqliteDB as SQLiteDatabase)
		  sqliteDB.ShortColumnNames = false
		  
		  oDBWrapper.db = sqliteDB
		  
		  Scroller.Designer.oDBWrapper = oDBWrapper
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Init()
		  Reset
		  
		  dim printBandHeader, printBandBody, printBandFooter as PAF_PrintKit.PrintBand
		  dim printTextTitle, printTextPrintedOn, printTextNumPages as PAF_PrintKit.PrintText
		  
		  printBandHeader = New PAF_PrintKit.PrintBand(Scroller.Designer)
		  printBandHeader.Top = 18
		  printBandHeader.Left = 18
		  printBandHeader.Width = 576
		  printBandHeader.height = 60
		  printBandHeader.BandType = "Header"
		  printBandHeader.BorderBottom = True
		  Scroller.Designer.Bands.Append printBandHeader
		  
		  printBandBody = new PAF_PrintKit.PrintBand(Scroller.Designer)
		  printBandBody.Left = 18
		  printBandBody.Width = 576
		  printBandBody.Top = 78
		  printBandBody.height = 50
		  printBandBody.BandType = "Body"
		  Scroller.Designer.Bands.Append printBandBody
		  
		  printBandFooter = new PAF_PrintKit.PrintBand(Scroller.Designer)
		  printBandFooter.Left = 18
		  printBandFooter.Width = 576
		  printBandFooter.Top = 128
		  printBandFooter.height = 27
		  printBandFooter.BandType = "Footer"
		  printBandFooter.BorderTop = True
		  Scroller.Designer.Bands.Append printBandFooter
		  
		  if oDBWrapper <> nil then
		    printTextTitle = New PAF_PrintKit.PrintText(Scroller.Designer)
		    
		    printTextTitle.Band = printBandHeader
		    printTextTitle.top = 20
		    printTextTitle.TextSize = 16
		    printTextTitle.Bold = true
		    printTextTitle.Alignment = 2
		    printTextTitle.Data = "Report Title"
		    printTextTitle.Width = 612
		    printTextTitle.Height = printTextTitle.CalcHeight(ScratchGraphics)
		    printTextTitle.Width = printTextTitle.CalcWidth(ScratchGraphics) + 20
		    printTextTitle.Left = Scroller.Designer.GetWidth/2 - printTextTitle.Width/2
		    
		    printBandHeader.Items.Append printTextTitle
		    
		    printTextPrintedOn = New PAF_PrintKit.PrintText(Scroller.Designer)
		    
		    printTextPrintedOn.Band = printBandFooter
		    
		    printTextPrintedOn.Data = "Printed: //"
		    printTextPrintedOn.Height = printTextPrintedOn.CalcHeight(ScratchGraphics)
		    printTextPrintedOn.Width = printTextPrintedOn.CalcWidth(ScratchGraphics) + 200
		    printTextPrintedOn.Left = 18
		    printTextPrintedOn.top = printBandFooter.Top + 3
		    
		    printBandFooter.Items.Append printTextPrintedOn
		    
		    printTextNumPages = New PAF_PrintKit.PrintText(Scroller.Designer)
		    
		    printTextNumPages.Band = printBandFooter
		    
		    printTextNumPages.Alignment = 3
		    printTextNumPages.Data = "Page ## of %%"
		    printTextNumPages.Height = printTextNumPages.CalcHeight(ScratchGraphics)
		    printTextNumPages.Width = printTextNumPages.CalcWidth(ScratchGraphics) + 100
		    printTextNumPages.Left = 18 + printTextNumPages.Band.Width - printTextNumPages.Width - 1
		    printTextNumPages.top = printBandFooter.Top + 3
		    
		    printBandFooter.Items.Append printTextNumPages
		    
		  end if
		  
		  Scroller.Designer.Invalidate(false)
		  
		  'PAF_PrintKit.BuildStyles(Scroller.Designer.Bands)
		  
		  Scroller.Designer.SaveUndoState("Initial State")
		  
		  pfDispatcher.send("UpdateToolbar")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadReport(jReport as JSONItem, bFilterSchema As Boolean = false)
		  Reset
		  
		  Scroller.Designer.ReportName = jReport.Lookup("Name","").StringValue.DefineEncoding(Encodings.UTF8)
		  
		  '## Customize next line ##
		  me.TrueWindow.Title = "Shorts Designer (" + oDBWrapper.type + ": " + oDBWrapper.DatabaseName + ") - " + scroller.Designer.ReportName
		  
		  LoadReportWindow(jReport.Lookup("Window",nil))
		  
		  LoadReportSetup(jReport.Lookup("Setup",nil))
		  
		  LoadReportStyles(jReport.Lookup("Styles", nil))
		  
		  if not bFilterSchema then
		    
		    Dim jRelations as JSONItem = jReport.Lookup("Relations",nil)
		    
		    LoadReportRelations(jRelations)'jReport.Lookup("Relations",nil))
		    
		  end if
		  
		  LoadReportBands(jReport.Lookup("Bands", nil))
		  
		  LoadReportWhereConditions(jReport.Lookup("WhereConditions", nil))
		  
		  dim jViews As JSONItem = jReport.Lookup("Views", nil)
		  if jViews <> nil then
		    LoadReportTempViews(jViews)
		    scroller.LoadSchema
		  end if
		  
		  Scroller.Designer.Invalidate(false)
		  
		  scroller.Designer.SaveUndoState("Initial State")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadReportBands(jBands as JSONItem)
		  dim jBand as JSONItem
		  
		  if jBands <> nil then
		    
		    For i as integer = 0 to jBands.Count - 1
		      
		      jBand = jBands.Child(i)
		      
		      jBand.Value("width") = Scroller.Designer.GetWidth - scroller.Designer.LeftRightMargin * 2
		      
		      Scroller.Designer.Bands.Append New PAF_PrintKit.PrintBand(jBand,scroller.Designer)
		      
		    next
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadReportRelations(JRelations as JSONItem)
		  dim jRelation as JSONItem
		  
		  dim oKey as PAF_DatabaseKit.ForeignKey
		  
		  if jRelations <> nil then
		    
		    For i as integer = 0 to jRelations.Count - 1
		      
		      jRelation = jRelations.Child(i)
		      
		      oKey = New PAF_DatabaseKit.ForeignKey(jRelation)
		      
		      oDBWrapper.ForeignKeys.Append oKey
		      
		    next
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadReportRelations(DictRelations As xojo.Core.Dictionary)
		  dim sKey As String
		  For each entry as xojo.Core.DictionaryEntry in DictRelations
		    sKey = entry.Key
		    oDBWrapper.ForeignKeys.Append new PAF_DatabaseKit.ForeignKey(sKey, entry.Value)
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadReportSetup(jSetup As JSONItem)
		  if jSetup <> nil then
		    
		    Dim sSetup As string = DecodeBase64(jSetup.Lookup("setupString","").StringValue.DefineEncoding(Encodings.UTF8))
		    
		    if sSetup <> "" then
		      PrinterSetup = new PrinterSetup
		      
		      PrinterSetup.SetupString = sSetup
		    end if
		    
		  end if
		  
		  ResizePage
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadReportStyles(jStyles as JSONItem)
		  if DictStyles = nil then
		    DictStyles = new Dictionary
		  end if
		  
		  dim  jStyle as JSONItem
		  
		  dim oStyle as PAF_PrintKit.PrintStyle
		  
		  if jStyles <> nil then
		    
		    For i as integer = 0 to jStyles.Count - 1
		      
		      jStyle = jStyles(i)
		      
		      oStyle = new PAF_PrintKit.PrintStyle(jStyle)
		      
		      if not DictStyles.HasKey(oStyle.name) then
		        
		        DictStyles.Value(oStyle.name) = oStyle
		        
		      end if
		      
		    next
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadReportTempViews(jViews as JSONItem)
		  dim jView As JSONItem
		  
		  dim name,sql As String
		  
		  if jViews <> nil then
		    
		    For i as integer = 0 to jViews.Count - 1
		      
		      jView = jViews.Child(i)
		      
		      name = jView.Value("name").StringValue.DefineEncoding(Encodings.UTF8)
		      sql = jView.Value("sql").StringValue.DefineEncoding(Encodings.UTF8)
		      
		      scroller.Designer.AddTemporaryView(oDBWrapper,name, sql)
		      
		    next
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadReportWhereConditions(jConditions As JSONItem)
		  dim jWhere as JSONItem
		  
		  if jConditions <> nil then
		    
		    For i as integer = 0 to jConditions.Count - 1
		      
		      jWhere = jConditions.Child(i)
		      
		      Scroller.Designer.WhereConditions.Append New PAFQueryCondition(jWhere)
		      
		    next
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadReportWindow(jWindow As JSONItem)
		  Dim myBounds As New REALbasic.Rect
		  
		  if jWindow = nil then
		    
		    myBounds.Left = self.TrueWindow.Left
		    myBounds.top = self.TrueWindow.top
		    myBounds.Width = self.TrueWindow.Width
		    myBounds.Height = self.TrueWindow.Height
		    
		  else
		    
		    myBounds.Left = jWindow.Value(0)
		    myBounds.Top = jWindow.Value(1)
		    myBounds.Width = jWindow.Value(2)
		    myBounds.Height = jWindow.Value(3)
		    
		    if myBounds.Left <= 0 then myBounds.Left = self.TrueWindow.Left
		    if myBounds.Top <= 0 then myBounds.top = self.TrueWindow.top
		    if myBounds.Width <= 0 then myBounds.Width = self.TrueWindow.Width
		    if myBounds.Height <= 0 then myBounds.Height = self.TrueWindow.Height
		    
		  end if
		  
		  self.TrueWindow.Bounds = myBounds
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadSchema()
		  
		  oDBWrapper.LoadSchema(self)
		  
		  UpdateLoadStatus("")
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NewConnection(optional connectString as String)
		  dim oNewDBWrapper As PAF_DatabaseKit.DBWrapper
		  oNewDBWrapper = ConnectionWin.Connect(connectString)
		  if oNewDBWrapper <> nil then
		    if oDBWrapper <> nil then
		      oDBWrapper.Close
		      oDBWrapper = nil
		      init
		    end if
		    oDBWrapper = oNewDBWrapper
		    Scroller.Designer.oDBWrapper = oNewDBWrapper
		    
		    if SchemaFilter = nil then
		      LoadSchema
		      PAF_PathKit.BuildPathingCells(oDBWrapper)
		    else
		      Dim DictIn As xojo.Core.Dictionary = SchemaFilter
		      Dim FullSchemDict as xojo.Core.Dictionary = DictIn.Value("Schema")
		      oDBWrapper.TableDict = FullSchemDict.Value("Tables")
		      oDBWrapper.ViewDict = FullSchemDict.Value("Views")
		      oDBWrapper.SchemaDict = FullSchemDict.Value("All")
		      Dim RelationDict As xojo.Core.Dictionary = DictIn.Value("Relations")
		      LoadReportRelations(RelationDict)
		    end if
		    Scroller.LoadSchema
		    PAF_PathKit.BuildPathingCells(oDBWrapper)
		    Title = "Shorts Designer (" + oDBWrapper.type + ": " + oDBWrapper.DatabaseName + ")"
		    Init
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OpenReport(optional jFile as folderitem = nil)
		  dim jNode as New JSONItem
		  
		  'Make a folderitem to hold the filename and location
		  'dim jFile as FolderItem
		  
		  if jFile = nil then
		    dim dlg as New OpenDialog
		    
		    dlg.PromptText = "Select Report to Load"
		    
		    dlg.Filter = ProjectFileTypes.ShortsDesigner
		    
		    dlg.Title = "Load Report"
		    
		    jFile = dlg.ShowModal()
		    
		  end if
		  
		  if jFile <> nil then
		    
		    if jFile.Exists then
		      
		      dim t as TextInputStream = TextInputStream.Open(jFile)
		      
		      if t <> nil then
		        
		        jNode.Load(t.ReadAll(Encodings.UTF8))
		        
		        t.Close
		        
		        // save location
		        Scroller.Designer.ReportPath = jFile.GetSaveInfo(app.ExecutableFile,0)
		        scroller.Designer.ReportName = jFile.Name
		        
		        // clone file json to preserve initial state
		        Dim sJSON As string = jNode.ToString
		        
		        Scroller.Designer.InitialState = New JSONItem(sJSON)
		        
		        OpenReport(jNode)
		        
		        pfDispatcher.send("UpdateToolbar")
		        
		      end if
		      
		    else
		      
		      // no file
		      
		    end if
		    
		  else
		    
		    // user cancelled
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub OpenReport(jReport as JSONItem)
		  dim jConnection as JSONItem = jReport.Lookup("Connection", nil)
		  
		  if jConnection <> nil then
		    
		    // Are we using the same database?
		    if CheckForExistingConnection(EncodeHex(MD5(jConnection.ToString()))) then
		      
		      // Yes so do not reload schema
		      
		      LoadReport(jReport)
		      
		    else
		      
		      dim connType as String = jConnection.Value("db").StringValue
		      
		      Select Case connType
		        
		      Case "cubesql", "PostgreSQL", "MySQL"
		        
		        dim sHost, sPort, sName, sUser as String
		        
		        sHost = jConnection.Value("host").StringValue
		        sPort = jConnection.Value("port").StringValue
		        sName = jConnection.Value("name").StringValue
		        sUser = jConnection.Value("user").StringValue
		        
		        oDBWrapper = ConnectionWin.Connect(connType + "," + sHost + "," + sPort + "," + sName + "," + sUser)
		        
		      case "odbc"
		        
		        dim sDSN, sUser as String
		        
		        sDSN = jConnection.Value("dsn").StringValue
		        sUser = jConnection.Value("user").StringValue
		        
		        oDBWrapper = ConnectionWin.Connect(connType + "," + sDSN + "," + sUser)
		        
		      case "sqlite"
		        
		        dim dbFile as FolderItem
		        
		        dim fileString as String = DecodeBase64(jConnection.Value("dbFile").StringValue)
		        
		        dbFile = GetFolderItem(fileString, FolderItem.PathTypeNative)
		        
		        ConnectSQLite(dbFile)
		        
		      end Select
		      
		      if oDBWrapper = nil then
		        
		        SchemaFilter = nil
		        Scroller.Designer.ReportName = ""
		        scroller.Designer.ReportPath = ""
		        Scroller.Designer.InitialState = nil
		        
		        
		      else
		        
		        
		        if SchemaFilter = nil then
		          
		          LoadSchema
		          PAF_PathKit.BuildPathingCells(oDBWrapper)
		          Scroller.Designer.oDBWrapper = oDBWrapper
		          Scroller.LoadSchema
		          LoadReport(jReport)
		          
		          if not oDBWrapper.HasForeignKeys then
		            
		            PAF_PathKit.BuildPathingCells(oDBWrapper)
		            
		          end if
		          
		        else
		          
		          oDBWrapper.ResetSchema
		          Dim DictIn As xojo.Core.Dictionary = SchemaFilter
		          Dim FullSchemDict as xojo.Core.Dictionary = DictIn.Value("Schema")
		          oDBWrapper.TableDict = FullSchemDict.Value("Tables")
		          oDBWrapper.ViewDict = FullSchemDict.Value("Views")
		          oDBWrapper.SchemaDict = FullSchemDict.Value("All")
		          
		          Dim RelationDict As xojo.Core.Dictionary = DictIn.Value("Relations")
		          LoadReportRelations(RelationDict)
		          PAF_PathKit.BuildPathingCells(oDBWrapper)
		          Scroller.Designer.oDBWrapper = oDBWrapper
		          Scroller.LoadSchema
		          LoadReport(jReport, true)
		          
		        end if
		        
		      end if
		      
		    end if
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset()
		  
		  if scroller.Designer.Bands.Ubound > -1 then
		    redim Scroller.Designer.WhereConditions(-1)
		  end if
		  Redim Scroller.Designer.SelectedItems(-1)
		  Redim Scroller.Designer.Bands(-1)
		  Redim Scroller.Designer.UndoQ(-1)
		  Redim Scroller.Designer.RedoQ(-1)
		  
		  Scroller.Designer.Reset(612,792)
		  
		  Scroller.Designer.Invalidate(false)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResizePage()
		  if PrinterSetup = nil then
		    // default settings
		    Scroller.Designer.Reset(612,792,18, 18)
		    
		  else
		    
		    Dim scale, dWidth, dHeight, dLeftRightMargin, dTopBottomMargin As Double
		    
		    scale = PrinterSetup.HorizontalResolution/72
		    
		    dWidth = PrinterSetup.PageWidth/scale
		    dHeight = PrinterSetup.PageHeight/scale
		    
		    dLeftRightMargin = abs(PrinterSetup.PageLeft)/scale
		    dTopBottomMargin = abs(PrinterSetup.PageTop)/scale
		    
		    Scroller.Designer.Reset(dWidth,dHeight,dLeftRightMargin, dTopBottomMargin)
		    
		    Scroller.Designer.Invalidate(false)
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveReport()
		  if Scroller.Designer.ReportPath = "" then
		    
		    SaveReportAs
		    
		  else
		    
		    Dim jReport As JSONItem
		    
		    Dim f As FolderItem = GetFolderItem(Scroller.Designer.ReportPath,FolderItem.PathTypeNative)
		    
		    if f = nil then
		      
		      Dim dlg as new SaveAsDialog
		      
		      dlg.Filter = ProjectFileTypes.ShortsDesigner
		      
		      dlg.PromptText = "Save Report"
		      
		      f = dlg.showmodal()
		      
		    end if
		    
		    if f <> nil then
		      
		      jReport = BuildReportJSON
		      
		      jReport.Compact = false
		      
		      Try
		        dim t as TextOutputStream = TextOutputStream.Create(f)
		        Try
		          t.Write(jReport.ToString().DefineEncoding(Encodings.UTF8))
		        finally
		          t.Close
		          t = nil
		        end try
		      Catch e as IOException
		      end try
		      
		      Scroller.Designer.InitialState = jReport
		      Scroller.Designer.ReportPath = f.GetSaveInfo(app.ExecutableFile,0)
		      scroller.Designer.ReportName = f.name
		      ReDim Scroller.Designer.UndoQ(-1)
		      ReDim Scroller.Designer.RedoQ(-1)
		      pfDispatcher.send("UpdateToolbar")
		      
		    end if
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveReportAs()
		  dim jOut as JSONItem
		  
		  dim dlg as New SaveAsDialog
		  dim f as FolderItem
		  
		  dlg.promptText="Save Report As"
		  dlg.SuggestedFileName="MyReport"
		  dlg.Title="Save Report"
		  dlg.Filter=ProjectFileTypes.ShortsDesigner
		  f=dlg.ShowModal()
		  
		  If f <> Nil then
		    
		    Scroller.Designer.ReportPath = f.GetSaveInfo(app.ExecutableFile,0)
		    scroller.Designer.ReportName = f.name
		    jOut = BuildReportJSON
		    
		    Try
		      dim t as TextOutputStream = TextOutputStream.Create(f)
		      Try
		        t.Write jOut.ToString
		      finally
		        t.Close
		        t = nil
		      end try
		    Catch e as IOException
		    end try
		    
		    Scroller.Designer.InitialState = jOut
		    '## Customize next line ##
		    me.TrueWindow.Title = "Shorts Designer (" + oDBWrapper.type + ": " + oDBWrapper.DatabaseName + ") - " + f.Name
		    ReDim Scroller.Designer.UndoQ(-1)
		    ReDim Scroller.Designer.RedoQ(-1)
		    pfDispatcher.send("UpdateToolbar")
		    
		  Else
		    //user canceled
		  End if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TableViewAddIsOkay(sTableViewName as String) As boolean
		  //Called by ????.  Event is passed to the user.  If return true it means to NOT include it.
		  
		  //RaiseEvent
		  return TableViewAddCheck(sTableViewName)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateLoadStatus(msg As String)
		  RaiseEvent LoadStatusUpdate(msg)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ValueChanged()
		  // Part of the PListUpdatable interface.
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event LoadStatusUpdate(msg As String)
	#tag EndHook

	#tag Hook, Flags = &h0
		Event TableViewAddCheck(TableViewName as String) As boolean
	#tag EndHook


	#tag Property, Flags = &h0
		oDBWrapper As PAF_DatabaseKit.DBWrapper
	#tag EndProperty

	#tag Property, Flags = &h0
		PrinterSetup As PrinterSetup
	#tag EndProperty

	#tag Property, Flags = &h0
		SchemaFilter As xojo.Core.Dictionary
	#tag EndProperty


#tag EndWindowCode

#tag Events imSplitter1
	#tag Event
		Sub Open()
		  me.AddControl(Scroller,true)
		  me.AddControl(PList,false)
		  
		  me.MinBeforeArea = 620
		  me.MinAfterArea = 228
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="AcceptFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AcceptTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Appearance"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="EraseBackground"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HelpTag"
		Visible=true
		Group="Appearance"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Group="Position"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabPanelIndex"
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabStop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="UseFocusRing"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
