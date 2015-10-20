#tag Class
Protected Class HierarchalListSelector
Inherits Listbox
	#tag Event
		Sub CellAction(row As Integer, column As Integer)
		  #Pragma Unused column
		  
		  if me.cell(row,0) = "Tables" or me.cell(row,0) = "Views" then Return
		  
		  Dim sTableField As String
		  
		  if me.CellCheck(row,0) then ' row is checked
		    
		    if me.RowIsFolder(row) then
		      
		      arsSelected.Append me.cell(row,column)
		      
		      if not me.Expanded(row) then ' expand and process all
		        
		        me.Expanded(row) = true
		        
		      end if
		      
		      CheckChildren(row)
		      
		    else ' manage expanded row
		      
		      sTableField = me.RowTag(row) + "." + me.cell(row,0)
		      
		      if me.arsSelected.IndexOf(sTableField) = -1 then
		        
		        arsSelected.Append sTableField
		        
		        // add parent if not in selected array
		        if arsSelected.IndexOf(me.RowTag(row)) = -1 then
		          
		          arsSelected.Append me.RowTag(row)
		          
		        end if
		        
		      end if
		      
		      CheckChild(row)
		      
		    end if
		    
		  else ' row is unchecked
		    
		    if me.RowIsFolder(row) then
		      
		      arsSelected.remove arsSelected.IndexOf(me.cell(row,column))
		      
		      if not me.Expanded(row) then ' expand and process all
		        
		        me.Expanded(row) = true
		        
		      end if
		      
		      UncheckChildren(row)
		      
		    else ' manage expanded row
		      
		      Dim iTableFieldIndex As Integer
		      
		      sTableField = me.RowTag(row) + "." + me.cell(row,0)
		      
		      iTableFieldIndex = me.arsSelected.IndexOf(sTableField)
		      
		      if iTableFieldIndex <> -1 then
		        
		        arsSelected.Remove(iTableFieldIndex)
		        
		      end if
		      
		      UncheckChild(row)
		      
		    end if
		    
		  end if
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub ExpandRow(row As Integer)
		  if me.cell(row,0) = "Tables" or me.cell(row,0) = "Views" then
		    
		    For Each entry as Xojo.Core.DictionaryEntry In xojo.core.Dictionary(me.RowTag(row))
		      
		      me.AddFolder entry.key
		      me.RowTag(me.LastIndex) = entry.Value
		      
		      if arsSelected.IndexOf(entry.Key) > -1 then
		        me.CellCheck(me.LastIndex,0) = true
		      end if
		      
		    next
		    
		  else
		    
		    Dim tblName, fldName As string
		    
		    Dim iTableFieldIndex, newRow as Integer
		    
		    tblName = me.Cell(row,0)
		    
		    newRow = row
		    
		    for each fld as xojo.Core.DictionaryEntry in xojo.core.Dictionary(me.RowTag(row))
		      
		      newRow = newRow + 1
		      
		      fldName = fld.key
		      
		      me.addrow fldName
		      me.RowTag(me.LastIndex) = tblName
		      
		      iTableFieldIndex = me.arsSelected.IndexOf(tblName + "." + fldName)
		      
		      if iTableFieldIndex <> -1 then
		        
		        me.CellCheck(newRow,0) = True
		        
		      end if
		      
		    Next
		    
		  end if
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub CheckChild(childRow As Integer)
		  'Get the parent folder
		  
		  Dim parentRow as integer = childRow
		  
		  do
		    
		    parentRow = parentRow - 1
		    
		  loop until me.RowIsFolder(parentRow)
		  
		  'check for mixed states
		  
		  Dim testRow As Integer = parentRow
		  
		  Dim bMixed As Boolean = false
		  
		  Do
		    
		    testRow = testRow + 1
		    
		    if not CellCheck(testRow,0) then
		      
		      bMixed = true
		      
		      exit
		      
		    end if
		    
		  loop until testRow = me.ListCount - 1 or me.Cell(testRow + 1,0) = "VIEWS" or me.RowIsFolder(testRow + 1)
		  
		  
		  if bMixed then
		    
		    me.CellState(parentRow,0) = CheckBox.CheckedStates.Indeterminate
		    
		  else
		    
		    me.CellState(parentRow,0) = CheckBox.CheckedStates.Checked
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckChildren(parentRow As Integer)
		  Dim rowToCheck as Integer = parentRow + 1
		  
		  Dim sTableField As String
		  
		  while rowToCheck < me.ListCount and not me.RowIsFolder(rowToCheck)
		    
		    sTableField = me.RowTag(rowToCheck) + "." + me.cell(rowToCheck,0)
		    
		    me.CellCheck(rowToCheck,0) = true
		    
		    if me.arsSelected.IndexOf(sTableField) = -1 then
		      
		      arsSelected.Append sTableField
		      
		    end if
		    
		    rowToCheck = rowToCheck + 1
		    
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UncheckChild(childRow As Integer)
		  'Get the parent folder
		  
		  Dim parentRow as integer = childRow
		  
		  do
		    
		    parentRow = parentRow - 1
		    
		  loop until me.RowIsFolder(parentRow)
		  
		  'check for mixed states
		  
		  Dim testRow As Integer = parentRow
		  
		  Dim bMixed As Boolean = false
		  
		  Do
		    
		    testRow = testRow + 1
		    
		    if CellCheck(testRow,0) then
		      
		      bMixed = true
		      
		      exit
		      
		    end if
		    
		  loop until testRow = me.ListCount - 1 or me.Cell(testRow + 1,0) = "VIEWS" or me.RowIsFolder(testRow + 1)
		  
		  
		  if bMixed then
		    
		    me.CellState(parentRow,0) = CheckBox.CheckedStates.Indeterminate
		    
		  else
		    
		    me.CellState(parentRow,0) = CheckBox.CheckedStates.Unchecked
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UncheckChildren(parentRow As Integer)
		  Dim rowToCheck as Integer = parentRow + 1
		  
		  Dim sTableField As String
		  
		  Dim iTableFieldIndex as Integer
		  
		  while rowToCheck < me.ListCount and not me.RowIsFolder(rowToCheck)
		    
		    sTableField = me.RowTag(rowToCheck) + "." + me.cell(rowToCheck,0)
		    
		    iTableFieldIndex = me.arsSelected.IndexOf(sTableField)
		    
		    if iTableFieldIndex <> -1 then
		      
		      arsSelected.Remove(iTableFieldIndex)
		      
		    end if
		    
		    me.CellCheck(rowToCheck,0) = false
		    
		    rowToCheck = rowToCheck + 1
		    
		  wend
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		arsSelected() As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoHideScrollbars"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Border"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnCount"
			Visible=true
			Group="Appearance"
			InitialValue="1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnsResizable"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ColumnWidths"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataField"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataField"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DataSource"
			Visible=true
			Group="Database Binding"
			Type="String"
			EditorType="DataSource"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DefaultRowHeight"
			Visible=true
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableDrag"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EnableDragReorder"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GridLinesHorizontal"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - None"
				"2 - ThinDotted"
				"3 - ThinSolid"
				"4 - ThickSolid"
				"5 - DoubleThinSolid"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="GridLinesVertical"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - None"
				"2 - ThinDotted"
				"3 - ThinSolid"
				"4 - ThickSolid"
				"5 - DoubleThinSolid"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasHeading"
			Visible=true
			Group="Appearance"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HeadingIndex"
			Visible=true
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Hierarchical"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialValue"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Italic"
			Visible=true
			Group="Font"
			Type="Boolean"
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
			Name="RequiresSelection"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollbarHorizontal"
			Visible=true
			Group="Appearance"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ScrollBarVertical"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SelectionType"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Single"
				"1 - Multiple"
			#tag EndEnumValues
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
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextFont"
			Visible=true
			Group="Font"
			InitialValue="System"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="Single"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextUnit"
			Visible=true
			Group="Font"
			InitialValue="0"
			Type="FontUnits"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Pixel"
				"2 - Point"
				"3 - Inch"
				"4 - Millimeter"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Underline"
			Visible=true
			Group="Font"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UseFocusRing"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_ScrollOffset"
			Group="Appearance"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_ScrollWidth"
			Group="Appearance"
			InitialValue="-1"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
