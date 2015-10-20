#tag Window
Begin Window BandsWin
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   512
   ImplicitInstance=   True
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   True
   MinWidth        =   64
   Placement       =   0
   Resizeable      =   True
   Title           =   "Report Bands"
   Visible         =   True
   Width           =   690
   Begin Listbox lbFields
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
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   446
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Report Fields"
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
      Top             =   14
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   269
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin Listbox lbGroups
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   2
      ColumnsResizable=   False
      ColumnWidths    =   "35%"
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   True
      EnableDragReorder=   True
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   446
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Type	Group"
      Italic          =   False
      Left            =   301
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   True
      ScrollBarVertical=   True
      SelectionType   =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   14
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   369
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin PushButton pbOk
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "OK"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   590
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   472
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton pbCancel
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   True
      Caption         =   "Cancel"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   498
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   472
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      Text            =   "Double click to edit bands"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   472
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   269
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
      Left            =   301
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   False
      Scope           =   0
      State           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   472
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   171
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h21
		Private Sub AdjustBandItemTops(pb as PAF_PrintKit.PrintBand, offset as Integer)
		  for each item as PAF_PrintKit.PrintItem in pb.Items
		    
		    item.top = item.top + offset
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub FillFieldListbox()
		  lbFields.DeleteAllRows
		  
		  lbFields.Addrow "Grand Summary"
		  
		  dim sTable, arsTable() As String
		  
		  // grab report tables if we are limiting
		  if cbLimit.Value = true then
		    
		    arsTable = PAF_PrintKit.ExtractReportTables(Bands)
		    
		  end if
		  
		  // fill the listbox
		  For Each entry as Xojo.Core.DictionaryEntry In oDBWrapper.SchemaDict
		    
		    if cbLimit.Value = false or arsTable.IndexOf(entry.Key) <> - 1 then
		      lbFields.AddFolder entry.key
		      lbFields.RowTag(lbFields.LastIndex) = entry.Value
		    end if
		    
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetBodyPosition() As Integer
		  dim i, count as Integer
		  
		  count = lbGroups.ListCount - 1
		  
		  for i = 0 to count
		    if lbGroups.cell(i,0) = "Body" then
		      Return i
		      exit
		    end if
		  Next
		  
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub InsertBand(newBand as PAF_PrintKit.PrintBand)
		  // Get the body position and insert the band just above it.
		  
		  dim bodyPosition as Integer = GetBodyPosition
		  
		  dim i, count, moveOffset as Integer
		  
		  dim pb, trailingBand as PAF_PrintKit.PrintBand
		  
		  trailingBand = newBand.Clone
		  trailingBand.BandType = "Trailing"
		  
		  ' Get the top of the current body and assign it to the new band
		  newBand.Top = PAF_PrintKit.PrintBand(lbGroups.rowtag(bodyPosition)).Top
		  
		  AdjustBandItemTops(newBand,newBand.Top)
		  
		  ' Move and adjust the body
		  pb = PAF_PrintKit.PrintBand(lbGroups.RowTag(bodyPosition))
		  
		  pb.top = pb.top + 30
		  
		  AdjustBandItemTops(pb,30)
		  
		  ' calc the offset (Height of body band plus 30 (new band height))
		  moveOffset = PAF_PrintKit.PrintBand(lbGroups.RowTag(bodyPosition)).Height + 30
		  
		  ' Move the trailingband and adjust
		  trailingBand.Top = PAF_PrintKit.PrintBand(lbGroups.RowTag(bodyPosition)).Bottom
		  
		  AdjustBandItemTops(trailingBand,trailingBand.Top)
		  
		  count = lbGroups.ListCount - 1
		  
		  ' adjust all the bands and their items tops
		  
		  for i = bodyPosition + 2 to count
		    
		    pb = PAF_PrintKit.PrintBand(lbGroups.RowTag(i))
		    
		    pb.Top = pb.top + moveOffset
		    
		    AdjustBandItemTops(pb,moveOffset)
		    
		  Next
		  
		  ' bodyPosition still represents the original position
		  lbGroups.InsertRow(bodyPosition, newBand.BandType)
		  
		  lbGroups.cell(lbGroups.LastIndex,1) = newBand.GroupBy
		  
		  lbGroups.RowTag(lbGroups.LastIndex) = newBand
		  
		  lbGroups.InsertRow(bodyPosition + 2, trailingBand.BandType)
		  
		  lbGroups.cell(lbGroups.LastIndex,1) = trailingBand.GroupBy
		  
		  lbGroups.RowTag(lbGroups.LastIndex) = trailingBand
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub InsertGrandSummary(newBand as PAF_PrintKit.PrintBand)
		  // Insert below the header or at the top if no header
		  
		  dim i, count as Integer
		  
		  dim headerPosition,footerPosition as Integer
		  
		  
		  
		  headerPosition = 1 ' Add 1 so it is below header
		  footerPosition = lbGroups.ListCount - 1
		  
		  
		  dim pb, trailingBand as PAF_PrintKit.PrintBand
		  
		  
		  'if headerPosition <> -1 then
		  
		  ' Get the top of the current body and assign it to the new band
		  newBand.Top = PAF_PrintKit.PrintBand(lbGroups.rowtag(headerPosition)).Top
		  
		  trailingBand = newBand.Clone
		  trailingBand.BandType = "Trailing" '"Grand Summary Trailing"
		  trailingBand.Top = PAF_PrintKit.PrintBand(lbGroups.RowTag(footerPosition)).Top
		  
		  
		  ' adjust the break bands item tops
		  for each bItem as PAF_PrintKit.PrintItem in newBand.Items
		    
		    bItem.top = bItem.Top + newBand.Top
		    
		  Next
		  
		  for each bItem as PAF_PrintKit.PrintItem in trailingBand.Items
		    
		    bItem.Top = bItem.Top + trailingBand.Top
		    
		  Next
		  
		  
		  count = lbGroups.ListCount - 1
		  
		  ' adjust all the bands and their items tops
		  for i = headerPosition to count
		    
		    pb = PAF_PrintKit.PrintBand(lbGroups.RowTag(i))
		    
		    pb.Top = pb.top + 30
		    
		    for each item as PAF_PrintKit.PrintItem in pb.Items
		      item.top = item.top + 30
		      
		    Next
		    
		  Next
		  
		  lbGroups.InsertRow(headerPosition, newBand.BandType)
		  
		  lbGroups.cell(lbGroups.LastIndex,1) = newBand.GroupBy
		  
		  lbGroups.RowTag(lbGroups.LastIndex) = newBand
		  
		  lbGroups.InsertRow(footerPosition + 1, trailingBand.BandType)
		  
		  lbGroups.Cell(lbGroups.LastIndex,1) = trailingBand.GroupBy
		  
		  lbGroups.RowTag(lbGroups.LastIndex) = trailingBand
		  
		  'End if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Setup(oDBWrapper as PAF_Databasekit.DBWrapper, previewBands() as PAF_PrintKit.PrintBand) As PAF_PrintKit.PrintBand()
		  me.oDBWrapper = oDBWrapper
		  
		  dFields = New Dictionary
		  
		  dim newB as PAF_PrintKit.PrintBand
		  
		  ' clone the original bands and put into "Bands" array
		  
		  for each pb as PAF_PrintKit.PrintBand in previewBands
		    
		    newb = pb.Clone
		    
		    Bands.Append newB
		  Next
		  
		  
		  ' Set up listboxes
		  
		  For Each pb as PAF_PrintKit.PrintBand in bands
		    
		    lbGroups.addrow pb.BandType
		    
		    lbGroups.RowTag(lbGroups.LastIndex) = pb
		    
		    if pb.BandType = "Break" or pb.BandType = "Trailing" then
		      
		      lbGroups.cell(lbGroups.LastIndex,1) = pb.GroupBy
		      
		      dFields.Value(pb.GroupBy) = pb.GroupBy ' value doesn't matter
		      
		    end if
		    
		    
		  Next
		  
		  FillFieldListbox
		  
		  me.ShowModal
		  
		  Return newBands
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Bands() As PAF_PrintKit.PrintBand
	#tag EndProperty

	#tag Property, Flags = &h21
		Private dFields As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		iFieldRow As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private newBands() As PAF_PrintKit.PrintBand
	#tag EndProperty

	#tag Property, Flags = &h0
		oDBWrapper As PAF_DatabaseKit.DBWrapper
	#tag EndProperty


#tag EndWindowCode

#tag Events lbFields
	#tag Event
		Sub DoubleClick()
		  Dim oDesigner As PAF_PrintKit.DesignCanvas = bands(0).Designer
		  
		  if not me.RowIsFolder(iFieldRow) then
		    
		    
		    dim pb as New PAF_PrintKit.PrintBand(oDesigner)
		    pb.Left = pb.Designer.LeftRightMargin
		    pb.Width = pb.Designer.GetWidth - pb.Designer.leftRightMargin * 2
		    
		    dim pf as New PAF_PrintKit.PrintField(oDesigner)
		    pf.left = pf.Designer.LeftRightMargin
		    
		    
		    if me.cell(me.ListIndex,0) = "Grand Summary" then
		      
		      pb.GroupBy = "Grand Summary"
		      pb.BandType = "Grand Summary"
		      pb.Height = 30
		      
		      InsertGrandSummary(pb)
		      
		    else
		      
		      pb.GroupBy = me.RowTag(me.ListIndex) + "." + me.cell(me.ListIndex,0)
		      pb.BandType = "Break"
		      pb.Height = 30
		      
		      InsertBand(pb)
		      
		    end if
		    
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub ExpandRow(row As Integer)
		  Dim tblName, fldName As string
		  
		  tblName = me.Cell(row,0)
		  
		  for each fld as xojo.Core.DictionaryEntry in xojo.core.Dictionary(me.RowTag(row))
		    
		    fldName = fld.key
		    
		    lbFields.addrow fldName
		    lbFields.RowTag(lbFields.LastIndex) = tblName
		    
		  Next
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  iFieldRow = me.RowFromXY(x,y)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events lbGroups
	#tag Event
		Function DragReorderRows(newPosition as Integer, parentRow as Integer) As Boolean
		  dim bodyPosition as Integer = GetBodyPosition
		  
		  dim dragType as String = me.cell(me.ListIndex,0)
		  
		  if dragType = "Header" or dragType = "Body" or dragType = "Footer" then
		    beep
		    Return true
		  end if
		  
		  if dragType = "Break" then
		    
		    if newPosition = 0 or newPosition >= bodyPosition then
		      beep
		      Return true
		    end if
		    
		  end if
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events pbOk
	#tag Event
		Sub Action()
		  dim i, count, bandTop, deltaY as Integer
		  
		  bandTop = bands(0).Top
		  
		  dim pb as PAF_PrintKit.PrintBand
		  
		  count = lbGroups.ListCount -1
		  
		  ' take each band from the group listbox rowtag and
		  ' append to newbands adjusting tops in the process
		  for i = 0 to count
		    
		    pb = lbGroups.RowTag(i)
		    
		    if pb.Top > bandTop then
		      deltaY = abs(pb.Top - bandTop) * -1
		    else
		      deltaY = abs(pb.Top - bandTop)
		    end if
		    
		    pb.Top = bandTop
		    
		    for each item as PAF_PrintKit.PrintItem in pb.Items
		      item.top = item.top + deltaY
		    next
		    
		    bandTop = bandtop + pb.Height
		    
		    newBands.Append pb
		    
		  Next
		  
		  
		  self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbCancel
	#tag Event
		Sub Action()
		  newBands = nil
		  
		  
		  self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cbLimit
	#tag Event
		Sub Action()
		  FillFieldListbox
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
		Visible=true
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
		Visible=true
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
		Name="iFieldRow"
		Group="Behavior"
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
		Visible=true
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
		InitialValue="False"
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
		Visible=true
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
