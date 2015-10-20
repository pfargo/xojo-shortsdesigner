#tag Window
Begin ContainerControl PAF_ScrollerCC
   AcceptFocus     =   False
   AcceptTabs      =   False
   AutoDeactivate  =   True
   BackColor       =   &cDDDDDD00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   False
   HasBackColor    =   False
   Height          =   300
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   False
   LockRight       =   True
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   False
   Top             =   0
   Transparent     =   False
   UseFocusRing    =   False
   Visible         =   True
   Width           =   568
   Begin PAF_PrintKit.DesignCanvas Designer
      AcceptFocus     =   True
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   True
      Enabled         =   True
      EraseBackground =   False
      extentHeight    =   0
      extentWidth     =   0
      Height          =   285
      HelpTag         =   ""
      HScrollBarName  =   "HScroll"
      Index           =   -2147483648
      Initialized     =   False
      InitialParent   =   ""
      Left            =   241
      LeftRightMargin =   0.0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      ReportName      =   ""
      ReportPath      =   ""
      Scope           =   0
      ShowBoundaries  =   True
      ShowInvisibleItems=   True
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      TopBottomMargin =   0.0
      Transparent     =   False
      UseFocusRing    =   False
      Visible         =   True
      VScrollBarName  =   "VScroll"
      Width           =   312
      xOrigin         =   0
      yOrigin         =   0
   End
   Begin SCScrollBar VScroll
      AcceptFocus     =   True
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   284
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   552
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      Maximum         =   100
      Minimum         =   0
      noReportChange  =   False
      PageStep        =   20
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Value           =   0
      Visible         =   True
      Width           =   16
   End
   Begin SCScrollBar HScroll
      AcceptFocus     =   True
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   16
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   241
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   False
      Maximum         =   100
      Minimum         =   0
      noReportChange  =   False
      PageStep        =   20
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   284
      Value           =   0
      Visible         =   True
      Width           =   311
   End
   Begin Listbox lbSchema
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
      Height          =   300
      HelpTag         =   ""
      Hierarchical    =   True
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   0
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
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   230
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
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
      Height          =   300
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      IsDocked        =   False
      IsDockedPosition=   ""
      Left            =   230
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MinAfterArea    =   20
      MinBeforeArea   =   30
      Scope           =   0
      TabIndex        =   4
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
		Sub Resized()
		  if me.Designer.Initialized then
		    
		    me.Designer.Invalidate(false)
		    
		    me.Designer.ScrollbarValueChanged
		    
		    me.Invalidate(false)
		    
		    if PList <> nil then
		      PList.Invalidate(false)
		    end if
		    
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  
		  me.Invalidate(false)
		  
		  me.Designer.Invalidate(false)
		  
		  Designer.ScrollbarValueChanged
		  
		  PList.Invalidate(false)
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub BuildPListTemplate(selectedItems() As PAF_PrintKit.PrintItem)
		  if selectedItems.Ubound > -1 then
		    
		    dim item as PAF_PrintKit.PrintItem
		    
		    dim prop as PAF_PropertyListKit.ListItem
		    
		    dim resultTemplate(), template() as PAF_PropertyListKit.ListItem
		    
		    // for now in order for the PropertyList to show properties
		    // all selected items must be of the same type
		    // Exception being printfield and printtext
		    
		    dim baseType, allTypes() as Introspection.TypeInfo
		    
		    // get unique types
		    
		    For i as integer = 0 to selectedItems.ubound
		      
		      baseType = Introspection.GetType(selectedItems(i))
		      
		      if allTypes.IndexOf(baseType) = -1 then
		        
		        allTypes.Append(baseType)
		        
		      end if
		      
		    next
		    
		    // too many types nil out plist and return
		    if allTypes.Ubound > 1 then
		      
		      PList.Update()
		      
		      Return
		      
		      // if only printtext and printfield then proceed with PrintText template
		    elseif allTypes.Ubound = 1 then
		      
		      if (allTypes(0).Name = "PrintText" and allTypes(1).Name = "PrintField") or (allTypes(0).Name = "PrintField" and allTypes(1).Name = "PrintText") then
		        
		        if selectedItems(0) isa PAF_PrintKit.PrintField then
		          
		          resultTemplate = PAF_PrintKit.PrintField(selectedItems(0)).GetSuperTemplateMultiple(Designer.oDBWrapper)
		          
		        else
		          
		          resultTemplate = selectedItems(0).GetTemplateMultiple(Designer.oDBWrapper)
		          
		        end if
		        
		        for i as integer = 1 to selectedItems.Ubound
		          
		          item = selectedItems(i)
		          
		          // get next template
		          
		          if item isa PAF_PrintKit.PrintField then
		            
		            template = PAF_PrintKit.PrintField(item).GetSuperTemplateMultiple(Designer.oDBWrapper)
		            
		          else
		            
		            template = item.GetTemplateMultiple(Designer.oDBWrapper)
		            
		          end if
		          
		          // compare item values and nil out any that are not the same
		          For index as integer = 0 to template.Ubound
		            
		            prop = template(index)
		            
		            // ignore section headers
		            if prop isA PAF_PropertyListKit.SectionProperty then continue
		            
		            // add item to be updated if more than one
		            resultTemplate(index).PropertyObjects.Append item
		            
		            if prop.Value <> resultTemplate(index).Value then
		              
		              resultTemplate(index).Value = nil
		              
		            end if
		            
		          next
		          
		        next
		        
		        PList.Update(resultTemplate)
		        
		      else
		        
		        PList.Update()
		        
		        Return
		        
		      end if
		      
		      // all the same or single selection
		    else
		      
		      if selectedItems.Ubound = 0 then
		        
		        resultTemplate = selectedItems(0).GetTemplate(Designer.oDBWrapper)
		        
		      else
		        
		        resultTemplate = selectedItems(0).GetTemplateMultiple(designer.oDBWrapper)
		        
		      end if
		      
		      for i as integer = 1 to selectedItems.Ubound
		        
		        item = selectedItems(i)
		        
		        // get next template
		        template = item.GetTemplateMultiple(Designer.oDBWrapper)
		        
		        // compare item values and nil out any that are not the same
		        For index as integer = 0 to template.Ubound
		          
		          prop = template(index)
		          
		          // ignore section headers
		          if prop isA PAF_PropertyListKit.SectionProperty then continue
		          
		          // add item to be updated if more than one
		          resultTemplate(index).PropertyObjects.Append item
		          
		          if prop.Value <> resultTemplate(index).Value then
		            
		            resultTemplate(index).Value = nil
		            
		          end if
		          
		        next
		        
		      next
		      
		      PList.Update(resultTemplate)
		      
		    end if
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadSchema()
		  lbSchema.DeleteAllRows
		  
		  if Designer.oDBWrapper <> nil then
		    
		    lbSchema.AddFolder "Objects"
		    
		    if Designer.oDBWrapper.TableDict.Count > 0 then
		      
		      lbSchema.AddFolder "Tables"
		      
		    end if
		    
		    if Designer.oDBWrapper.ViewDict.Count > 0 then
		      
		      lbSchema.AddFolder "Views"
		      
		    end if
		    
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		PList As PAF_PropertyListCC
	#tag EndProperty


#tag EndWindowCode

#tag Events Designer
	#tag Event
		Sub SelectionChanged(selectedItems() as PAF_PrintKit.PrintItem)
		  if PList = nil then Return
		  
		  if selectedItems.Ubound > -1 then
		    
		    BuildPListTemplate(selectedItems)
		    
		  else
		    
		    PList.Update()
		    
		  end if
		  
		  me.Invalidate(false)
		  
		  pfDispatcher.send("UpdateToolbar")
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lbSchema
	#tag Event
		Sub DoubleClick()
		  if not me.RowIsFolder(me.ListIndex) then
		    
		    if me.RowTag(me.ListIndex) = "New Text" then
		      
		      Designer.AddText
		      
		    elseif me.RowTag(me.ListIndex) = "New Image" then
		      
		      Designer.AddPicture
		      
		    elseif me.RowTag(me.ListIndex) = "New Rect" then
		      
		      Designer.AddRect
		      
		    elseif me.RowTag(me.ListIndex) = "New Oval" then
		      
		      Designer.AddOval
		      
		    else
		      
		      Designer.addfield(me.RowTag(me.ListIndex) + "." + me.cell(me.ListIndex,0))
		      
		    end if
		    
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub ExpandRow(row As Integer)
		  if me.cell(row,0) = "Objects" then
		    
		    lbSchema.AddRow "Text Object"
		    lbSchema.RowTag(lbSchema.LastIndex) = "New Text"
		    lbSchema.AddRow "Image Object"
		    lbSchema.RowTag(lbSchema.LastIndex) = "New Image"
		    lbSchema.AddRow "Rect Object"
		    lbSchema.RowTag(lbSchema.LastIndex) = "New Rect"
		    lbSchema.AddRow "Oval Object"
		    lbSchema.RowTag(lbSchema.LastIndex) = "New Oval"
		    
		  elseif me.cell(row,0) = "Tables" then
		    
		    For Each entry as Xojo.Core.DictionaryEntry In Designer.oDBWrapper.TableDict
		      
		      lbSchema.AddFolder entry.key
		      lbSchema.RowTag(lbSchema.LastIndex) = entry.Value
		      
		    next
		    
		  elseif me.cell(row,0) = "Views" then
		    
		    For Each entry as Xojo.Core.DictionaryEntry In Designer.oDBWrapper.ViewDict
		      
		      lbSchema.AddFolder entry.key
		      lbSchema.RowTag(lbSchema.LastIndex) = entry.Value
		      
		    next
		    
		  else
		    
		    Dim tblName, fldName As string
		    
		    tblName = me.Cell(row,0)
		    
		    for each fld as xojo.Core.DictionaryEntry in xojo.core.Dictionary(me.RowTag(row))
		      
		      fldName = fld.key
		      
		      lbSchema.addrow fldName
		      lbSchema.RowTag(lbSchema.LastIndex) = tblName
		      
		    Next
		    
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Function DragRow(drag As DragItem, row As Integer) As Boolean
		  if not me.RowIsFolder(row) then
		    
		    dim h,w As double
		    
		    if me.RowTag(me.ListIndex) = "New Text" then
		      
		      drag.Text = me.RowTag(me.ListIndex)
		      
		    elseif me.RowTag(me.ListIndex) = "New Image" then
		      
		      drag.Text = me.RowTag(me.ListIndex)
		      
		    elseif me.RowTag(me.ListIndex) = "New Rect" then
		      
		      drag.Text = me.RowTag(me.ListIndex)
		      
		    elseif me.RowTag(me.ListIndex) = "New Oval" then
		      
		      drag.Text = me.RowTag(me.ListIndex)
		      
		    else
		      
		      drag.Text = me.RowTag(me.ListIndex) + "." + me.cell(me.ListIndex,0)
		      
		    end if
		    
		    ScratchGraphics.TextFont = "Arial"
		    ScratchGraphics.TextSize = 12
		    
		    h = ScratchGraphics.TextHeight
		    
		    w = ScratchGraphics.StringWidth(drag.Text) + 12
		    
		    Dim p as new Picture(w,h,32)
		    p.Graphics.DrawString(drag.Text,0,12)
		    
		    drag.DragPicture = p
		    
		    Return true
		    
		  end if
		End Function
	#tag EndEvent
	#tag Event
		Function CellBackgroundPaint(g As Graphics, row As Integer, column As Integer) As Boolean
		  if me.ListCount > 0 and row < me.ListCount then
		    
		    If me.cell(row,0) = "Tables" or me.Cell(row,0) = "Views" or me.cell(row,0) = "Objects" then
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
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  If me.cell(row,0) = "Tables" or me.Cell(row,0) = "Views" or me.cell(row,0) = "Objects" then
		    
		    Return True
		    
		  end if
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events imSplitter1
	#tag Event
		Sub Open()
		  me.AddControl(lbSchema,true)
		  me.AddControl(Designer,false)
		  me.AddControl(HScroll,false)
		  
		  me.MinBeforeArea = 40
		  me.MinAfterArea = 400
		  
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
		InitialValue="300"
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
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
