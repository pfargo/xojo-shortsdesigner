#tag Window
Begin Window SchemaSetupWin
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   640
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   840
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Schema Accessibility Setup"
   Visible         =   True
   Width           =   840
   Begin HierarchalListSelector lbSchema
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   True
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   568
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   267
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Listbox lbFields2
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   296
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   570
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   52
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   250
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Listbox lbRelations
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   4
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   196
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Table	Key	Related Table	Related Key"
      Italic          =   False
      Left            =   299
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   1
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   392
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   521
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PopupMenu pmTable2
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   570
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   250
   End
   Begin PopupMenu pmTable1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   299
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   250
   End
   Begin PushButton pbAdd
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Add"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   299
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   360
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Listbox lbFields1
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   False
      HeadingIndex    =   -1
      Height          =   296
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   299
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   52
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   250
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton pbCancel
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Cancel"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   648
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   600
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton pbsSave
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Save"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   740
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   600
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton pbDelete
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Delete"
      Default         =   False
      Enabled         =   False
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   299
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   600
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton pbRelations
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Set Up Relations"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   445
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   600
      Underline       =   False
      Visible         =   True
      Width           =   135
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub AssignSchema(oDBWrapper as PAF_DatabaseKit.DBWrapper)
		  me.oDBWrapper = oDBWrapper
		  
		  // Setup Popup Menus
		  
		  For each entry as xojo.Core.DictionaryEntry in oDBWrapper.SchemaDict
		    
		    pmTable1.AddRow entry.Key
		    pmTable1.RowTag(pmTable1.ListCount - 1) = entry.Value
		    
		    pmTable2.AddRow entry.Key
		    pmTable2.RowTag(pmTable1.ListCount - 1) = entry.Value
		    
		  next
		  
		  ' For each oKey as PAF_DatabaseKit.ForeignKey in oDBWrapper.ForeignKeys
		  '
		  ' lbRelations.AddRow oKey.Table, oKey.Column, oKey.ForeignTable, oKey.ForeignColumn
		  '
		  ' next
		  
		  // Setup Schema list
		  // Expansion is handled by HierarchalListSelector
		  
		  lbSchema.DeleteAllRows
		  
		  if oDBWrapper.TableDict.Count > 0 then
		    
		    lbSchema.AddFolder "Tables"
		    lbSchema.RowTag(lbSchema.LastIndex) = oDBWrapper.TableDict
		    
		  end if
		  
		  if oDBWrapper.ViewDict.Count > 0 then
		    
		    lbSchema.Addfolder "Views"
		    lbSchema.RowTag(lbSchema.LastIndex) = oDBWrapper.ViewDict
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ProcessReleations()
		  dim dRelations As new xojo.Core.Dictionary
		  dim dFkey As xojo.Core.Dictionary
		  
		  dim sTable, sCol, sFTable, sFCol As string
		  
		  for i as integer = 0 to lbRelations.ListCount -1
		    
		    sTable = lbRelations.cell(i,0)
		    sCol = lbRelations.Cell(i,1)
		    sFTable = lbRelations.cell(i,2)
		    sFCol = lbRelations.cell(i,3)
		    
		    dFkey = new xojo.Core.Dictionary
		    dFkey.Value("Table") = sTable
		    dFkey.Value("Column") = sCol
		    dFkey.Value("ForeignTable") = sFTable
		    dFkey.Value("ForeignColumn") = sFCol
		    
		    dRelations.Value(sTable + "." + sCol + " = " + sFTable + "." + sFCol) = dFkey
		    
		  next
		  
		  DictOut.Value("Relations") = dRelations
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ProcessSchema()
		  Dim d_LookupDict, d_FieldDict, d_TableDict, d_viewDict, d_allDict, d_outDict As xojo.Core.Dictionary
		  d_TableDict = new xojo.Core.Dictionary
		  d_ViewDict = new xojo.Core.Dictionary
		  d_AllDict = new xojo.Core.Dictionary
		  d_OutDict = new xojo.Core.Dictionary
		  
		  Dim bViewHeader As Boolean = false
		  
		  dim sType, sTable, sField As text
		  
		  Dim iRow As integer
		  
		  while iRow < lbSchema.ListCount
		    
		    if lbSchema.RowIsFolder(iRow) then
		      
		      lbSchema.Expanded(iRow) = true
		      
		    end if
		    
		    iRow = iRow + 1
		    
		  wend
		  
		  For i as integer = 0 to lbSchema.ListCount - 1
		    
		    if lbSchema.cell(i,0) = "TABLES" then
		      
		      sType = "Table"
		      
		      continue
		      
		    end if
		    
		    if lbSchema.cell(i,0) = "VIEWS" then
		      
		      bViewHeader = true
		      
		    end if
		    
		    if lbSchema.RowIsFolder(i) and lbSchema.CellState(i,0) <> CheckBox.CheckedStates.Unchecked then
		      
		      ' create table
		      
		      if d_FieldDict <> nil and d_FieldDict.Count > -1 then
		        
		        if sType = "Table" then
		          
		          d_TableDict.Value(sTable) = d_FieldDict
		          d_AllDict.Value(sTable) = d_FieldDict
		          
		        elseif sType = "View" then
		          
		          d_ViewDict.Value(sTable) = d_FieldDict
		          d_AllDict.Value(sTable) = d_FieldDict
		          
		        end if
		        
		      end if
		      
		      sTable = lbSchema.cell(i,0).ToText
		      
		      d_LookupDict = oDBWrapper.SchemaDict.Value(sTable)
		      
		      d_FieldDict = New xojo.Core.Dictionary
		      
		    elseif lbSchema.CellState(i,0) = CheckBox.CheckedStates.Checked then
		      
		      if not bViewHeader then
		        ' add field
		        
		        sField = lbSchema.cell(i,0).ToText
		        
		        d_FieldDict.Value(sField) = d_LookupDict.Value(sField)
		        
		      else
		        
		        bViewHeader = false
		        
		        sType = "View"
		        
		      end if
		    end if
		    
		  next
		  
		  if d_FieldDict <> nil and d_FieldDict.Count > -1 then
		    
		    if sType = "Table" then
		      
		      d_TableDict.Value(sTable) = d_FieldDict
		      d_AllDict.Value(sTable) = d_FieldDict
		      
		    elseif sType = "View" then
		      
		      d_ViewDict.Value(sTable) = d_FieldDict
		      d_AllDict.Value(sTable) = d_FieldDict
		      
		    end if
		    
		  end if
		  
		  d_OutDict.Value("Tables") = d_TableDict
		  
		  d_OutDict.Value("Views") = d_ViewDict
		  
		  d_OutDict.Value("All") = d_AllDict
		  
		  DictOut.Value("Schema") = d_OutDict
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private DictOut As xojo.Core.Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private oDBWrapper As PAF_DatabaseKit.DBWrapper
	#tag EndProperty


#tag EndWindowCode

#tag Events lbSchema
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  if me.ListCount > 0 and row < me.ListCount then
		    
		    If me.cell(row,0) = "Tables" or me.Cell(row,0) = "Views" then
		      me.CellType(row,0) = Listbox.TypeNormal
		      
		      if me.Selected(row) then
		        g.ForeColor = &cFFFFFF00
		      else
		        g.ForeColor = &c0000FF00
		      end if
		      
		      g.Bold = true
		      g.DrawString(me.cell(row,0), 20, 14)
		      Return true
		      
		    end if
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Sub Open()
		  me.ColumnType(0) = Listbox.TypeCheckbox
		End Sub
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  If me.cell(row,0) = "Tables" or me.Cell(row,0) = "Views" then
		    
		    Return True
		    
		  end if
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events lbFields2
	#tag Event
		Sub Change()
		  pbAdd.Enabled = me.ListIndex <> -1 and lbFields1.ListIndex <> -1
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lbRelations
	#tag Event
		Sub Change()
		  pbDelete.Enabled = me.ListIndex <> -1
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pmTable2
	#tag Event
		Sub Change()
		  dim dict as xojo.Core.Dictionary = me.RowTag(me.ListIndex)
		  
		  dim sField as String
		  
		  if dict <> nil then
		    
		    lbFields2.DeleteAllRows
		    
		    for each entry as xojo.Core.DictionaryEntry in dict
		      
		      sField = entry.Key
		      
		      lbFields2.AddRow sField
		      
		    next
		    
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pmTable1
	#tag Event
		Sub Change()
		  dim dict as xojo.Core.Dictionary = me.RowTag(me.ListIndex)
		  
		  dim sField as String
		  
		  if dict <> nil then
		    
		    lbFields1.DeleteAllRows
		    
		    for each entry as xojo.Core.DictionaryEntry in dict
		      
		      sField = entry.Key
		      
		      lbFields1.AddRow sField
		      
		    next
		    
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbAdd
	#tag Event
		Sub Action()
		  lbRelations.AddRow pmTable1.Text, lbFields1.cell(lbFields1.ListIndex,0), pmTable2.Text, lbFields2.cell(lbFields2.ListIndex,0)
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lbFields1
	#tag Event
		Sub Change()
		  pbAdd.Enabled = me.ListIndex <> -1 and lbFields2.ListIndex <> -1
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbCancel
	#tag Event
		Sub Action()
		  self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbsSave
	#tag Event
		Sub Action()
		  DictOut = New xojo.Core.Dictionary
		  
		  ProcessReleations
		  ProcessSchema
		  
		  dim outText As String = EncodeBase64(xojo.data.GenerateJSON(DictOut)).DefineEncoding(Encodings.UTF8)
		  
		  dim dlg as New SaveAsDialog
		  dim f as FolderItem
		  
		  dlg.promptText="Save Schema As"
		  dlg.SuggestedFileName="Filtered Schema"
		  dlg.Title="Save Schema"
		  dlg.Filter=ProjectFileTypes.Text
		  f=dlg.ShowModal()
		  
		  If f <> Nil then
		    
		    Try
		      dim t as TextOutputStream = TextOutputStream.Create(f)
		      Try
		        t.Write outText
		      finally
		        t.Close
		        t = nil
		      end try
		    Catch e as IOException
		    end try
		    
		  Else
		    //user canceled
		  End if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbDelete
	#tag Event
		Sub Action()
		  
		  
		  
		  For i as integer = lbRelations.ListCount -1 DownTo 0
		    
		    if lbRelations.Selected(i) then
		      
		      lbRelations.RemoveRow(i)
		      
		    end if
		    
		  next
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbRelations
	#tag Event
		Sub Action()
		  Dim arsTables() As String
		  
		  for i as integer = 0 to lbSchema.ListCount - 1
		    
		    if lbSchema.RowIsFolder(i) and lbSchema.CellState(i,0) <> checkbox.CheckedStates.Unchecked then
		      
		      arsTables.Append lbSchema.cell(i,0)
		      
		    end if
		    
		  next
		  
		  
		  For each oKey as PAF_DatabaseKit.ForeignKey in oDBWrapper.ForeignKeys
		    
		    if arsTables.IndexOf(oKey.Table) > -1 and arsTables.IndexOf(oKey.ForeignTable) > -1 then
		      
		      lbRelations.AddRow oKey.Table, oKey.Column, oKey.ForeignTable, oKey.ForeignColumn
		      
		    end if
		    
		  next
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
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
		Name="CloseButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"10 - Drawer Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Appearance"
		InitialValue="False"
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
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
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
