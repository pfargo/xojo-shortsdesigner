#tag Window
Begin Window RelationsWin
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   594
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   True
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Table Relations"
   Visible         =   True
   Width           =   479
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
      Left            =   20
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   200
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
      Left            =   259
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   200
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
      Height          =   246
      HelpTag         =   ""
      Hierarchical    =   False
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
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   52
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   200
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
      Height          =   246
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   259
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
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   52
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   200
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
      Height          =   200
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Table	Key	Related Table	Related Key"
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   342
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   439
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
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
      Left            =   20
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
      Top             =   310
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
      Left            =   379
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   554
      Underline       =   False
      Visible         =   True
      Width           =   80
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
      Left            =   287
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
      Top             =   554
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
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   554
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin CheckBox cbLimit
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Limit to tables in report"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   112
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      State           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   554
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   171
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub AssignRelations(oDBWrapper as PAF_DatabaseKit.DBWrapper, arsTable() As String)
		  me.oDBWrapper = oDBWrapper
		  me.arsTable = arsTable
		  Update
		  
		  me.ShowModal
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Update()
		  pmTable1.DeleteAllRows
		  pmTable2.DeleteAllRows
		  lbFields1.DeleteAllRows
		  lbFields2.DeleteAllRows
		  lbRelations.DeleteAllRows
		  
		  
		  if cbLimit.Value = false then
		    
		    For each entry as xojo.Core.DictionaryEntry in oDBWrapper.SchemaDict
		      
		      pmTable1.AddRow entry.Key
		      pmTable1.RowTag(pmTable1.ListCount - 1) = entry.Value
		      
		      pmTable2.AddRow entry.Key
		      pmTable2.RowTag(pmTable1.ListCount - 1) = entry.Value
		      
		    next
		    
		    For each oKey as PAF_DatabaseKit.ForeignKey in oDBWrapper.ForeignKeys
		      
		      lbRelations.AddRow oKey.Table, oKey.Column, oKey.ForeignTable, oKey.ForeignColumn
		      
		    next
		    
		  else
		    
		    For each entry as xojo.Core.DictionaryEntry in oDBWrapper.SchemaDict
		      
		      if arsTable.IndexOf(entry.key) <> -1 then
		        
		        pmTable1.AddRow entry.Key
		        pmTable1.RowTag(pmTable1.ListCount - 1) = entry.Value
		        
		        pmTable2.AddRow entry.Key
		        pmTable2.RowTag(pmTable1.ListCount - 1) = entry.Value
		        
		      end if
		      
		    next
		    
		    For each oKey as PAF_DatabaseKit.ForeignKey in oDBWrapper.ForeignKeys
		      
		      if arsTable.IndexOf(oKey.Table) <> -1 or arsTable.IndexOf(oKey.ForeignTable) <> - 1 then
		        
		        lbRelations.AddRow oKey.Table, oKey.Column, oKey.ForeignTable, oKey.ForeignColumn
		        
		      end if
		      
		    next
		    
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		arsTable() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private oDBWrapper As PAF_DatabaseKit.DBWrapper
	#tag EndProperty


#tag EndWindowCode

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
#tag Events lbFields1
	#tag Event
		Sub Change()
		  pbAdd.Enabled = me.ListIndex <> -1 and lbFields2.ListIndex <> -1
		End Sub
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
		  pbDelete.Enabled = me.ListIndex <> - 1
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbAdd
	#tag Event
		Sub Action()
		  Dim bAlreadyThere As Boolean = false
		  
		  Dim sTable, sKey, sRelatedTable, sRelatedKey as String
		  
		  sTable = pmTable1.Text
		  sKey =lbFields1.cell(lbFields1.ListIndex,0)
		  sRelatedTable = pmTable2.Text
		  sRelatedKey = lbFields2.cell(lbFields2.ListIndex,0)
		  
		  for i as integer = 0 to lbRelations.ListCount - 1
		    
		    if lbRelations.cell(i,0) = sTable and lbRelations.cell(i,1) = sKey and lbRelations.cell(i,2) = sRelatedTable and lbRelations.cell(i,3) = sRelatedKey then
		      bAlreadyThere = true
		      exit
		    end if
		    
		  next
		  
		  if not bAlreadyThere then
		    lbRelations.AddRow sTable, sKey, sRelatedTable, sRelatedKey
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbsSave
	#tag Event
		Sub Action()
		  dim oKey as PAF_DatabaseKit.ForeignKey
		  
		  Redim oDBWrapper.ForeignKeys(-1)
		  
		  for i as integer = 0 to lbRelations.ListCount -1
		    
		    oKey = New PAF_DatabaseKit.ForeignKey
		    oKey.Table = lbRelations.cell(i,0)
		    oKey.Column = lbRelations.Cell(i,1)
		    oKey.ForeignTable = lbRelations.cell(i,2)
		    oKey.ForeignColumn = lbRelations.Cell(i,3)
		    oKey.Name = oKey.Table + "." + oKey.Column + " = " + oKey.ForeignTable + "." + oKey.ForeignColumn
		    
		    oDBWrapper.ForeignKeys.Append oKey
		    
		  next
		  
		  PAF_PathKit.BuildPathingCells(oDBWrapper)
		  
		  self.Close
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
#tag Events pbDelete
	#tag Event
		Sub Action()
		  lbRelations.RemoveRow(lbRelations.ListIndex)
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cbLimit
	#tag Event
		Sub Action()
		  Update
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
