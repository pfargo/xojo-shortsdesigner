#tag Class
Protected Class DesignCanvas
Inherits ScrollCanvas
Implements pfReceiver
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  // do not allow menu if not connected to database
		  if (oDBWrapper <> nil) then
		    
		    //Account for scrolling
		    x = x - xOrigin
		    y = y - yOrigin
		    
		    If SelectedItems.Ubound = -1 and OverBand <> nil then
		      
		      dim bandIndex as Integer = InBandIndex(y)
		      
		      if bandIndex > -1 then
		        
		        DownX = x
		        DownY = y
		        
		        dim bandMenu as New MenuItem("Edit Bands" )
		        bandMenu.Name = "Edit Bands"
		        
		        dim textMenu as New MenuItem("Add Text")
		        textMenu.Name = "Add Text"
		        
		        dim pictureMenu as New MenuItem("Add Picture")
		        pictureMenu.Name = "Add Picture"
		        
		        dim rectMenu as New MenuItem("Add Rect")
		        rectMenu.Name = "Add Rect"
		        
		        dim ovalMenu as New MenuItem("Add Oval")
		        ovalMenu.Name = "Add Oval"
		        
		        dim fieldMenu as MenuItem = BuildSchemaMenuCompact(oDBWrapper)
		        fieldMenu.Text = "Add Field"
		        
		        base.Append bandMenu
		        base.Append textMenu
		        base.Append pictureMenu
		        base.Append rectMenu
		        base.Append ovalMenu
		        base.Append fieldMenu
		        
		        base.Append(new MenuItem(MenuItem.TextSeparator))
		        base.Append(new menuItem("Minimize Band Size"))
		        
		        'End If
		        
		        
		      end if
		      
		    elseIf SelectedItems.Ubound > 0 then
		      
		      base.Append(new MenuItem("Duplicate"))
		      base.Append(new MenuItem("Align Left Edges"))
		      base.Append(new MenuItem("Align Top Edges"))
		      base.Append(new MenuItem("Align Right Edges"))
		      base.Append(new MenuItem("Align Bottom Edges"))
		      base.Append(new MenuItem("Distribute Horizontally"))
		      base.Append(new MenuItem("Distribute Vertically"))
		      
		      If IncludesPrintField then
		        base.Append(new MenuItem(MenuItem.TextSeparator))
		        base.Append(new MenuItem("Create Field Labels Left"))
		        base.Append(new MenuItem("Create Field Labels Above"))
		        base.Append(new MenuItem("Create Field Labels In Header"))
		      end if
		      
		    elseif SelectedItems.Ubound = 0 then
		      
		      base.Append(new MenuItem("Move Forward"))
		      base.Append(new MenuItem("Move Backward"))
		      base.Append(new MenuItem("Move To Front"))
		      base.Append(new MenuItem("Move To Back"))
		      base.Append(new MenuItem(MenuItem.TextSeparator))
		      base.Append(new MenuItem("Duplicate"))
		      
		      if IncludesPrintField then
		        base.Append(new MenuItem("Duplicate Right"))
		      end if
		      
		      If IncludesPrintField then
		        base.Append(new MenuItem(MenuItem.TextSeparator))
		        base.Append(new MenuItem("Create Field Label Left"))
		        base.Append(new MenuItem("Create Field Label Above"))
		        base.Append(new MenuItem("Create Field Label In Header"))
		      end if
		      
		      base.Append(new MenuItem(MenuItem.TextSeparator))
		      
		      dim mStyles as MenuItem = BuildStyleMenu
		      
		      base.Append mStyles
		      
		    end if
		    
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  If hitItem <> nil then
		    
		    if hitItem.Name <> "" then
		      
		      if hitItem.Name = "Edit Bands" then
		        
		        editBands
		        
		      elseif hitItem.Name = "Add Text" Then
		        
		        AddText(DownX, DownY)
		        
		      elseif hitItem.Name = "Add Rect" then
		        
		        AddRect(DownX, DownY)
		        
		      elseif hitItem.Name = "Add Oval" then
		        
		        AddOval(DownX, DownY)
		        
		      elseif hitItem.Name = "Add Picture" then
		        
		        AddPicture(DownX, DownY)
		        
		      else ' it is a field
		        
		        AddField(DownX, DownY, hitItem.Name)
		        
		      end if
		      
		    else
		      
		      if hitItem.text = "Align Left Edges" then
		        
		        AlignEdges("Left", SelectedItems)
		        
		      elseif hitItem.text = "Align Right Edges" then
		        
		        AlignEdges("Right", SelectedItems)
		        
		      elseif hitItem.text = "Align Top Edges" then
		        
		        AlignEdges("Top", SelectedItems)
		        
		      elseif hitItem.text = "Align Bottom Edges" then
		        
		        AlignEdges("Bottom", SelectedItems)
		        
		      elseif hitItem.Text = "Move Forward" then
		        
		        MoveForward(OverItem,OverBand.Items)
		        
		      elseif hitItem.Text = "Move Backward" then
		        
		        MoveBackward(OverItem,OverBand.Items)
		        
		      elseif hitItem.Text = "Move To Front" then
		        
		        MoveToFront(OverItem,OverBand.Items)
		        
		      elseif hitItem.Text = "Move To Back" then
		        
		        MoveToBack(OverItem,OverBand.Items)
		        
		      elseif hitItem.Text = "Duplicate" then
		        
		        DuplicateItems
		        
		      elseif hitItem.Text = "Duplicate Right" then
		        
		        DuplicateRight(OverItem)
		        
		      elseif hitItem.Text = "Create Field Label Left" or hitItem.Text = "Create Field Labels Left" then
		        
		        AddLabelsLeft
		        
		      elseif hitItem.Text = "Distribute Horizontally" then
		        
		        distributeHorizontally
		        
		      elseif hitItem.Text = "Distribute Vertically" then
		        
		        distributeVertically
		        
		      elseif hitItem.Text = "Create Field Label Above" or hitItem.Text = "Create Field Labels Above" then
		        
		        AddLabelsAbove
		        
		      elseif hitItem.Text = "Create Field Label in Header" or hitItem.Text = "Create Field Labels in Header" then
		        
		        AddLabelsToHeader
		        
		      elseif hitItem.Text = "Minimize Band Size" then
		        
		        MinimizeBandSize
		        
		      elseif DictStyles.Lookup(hitItem.Tag.StringValue,nil) <> nil then
		        
		        ApplyStyle DictStyles.Value(hitItem.Tag.StringValue)
		        
		      end if
		      
		    end if
		    
		    RaiseEvent SelectionChanged(me.selectedItems)
		    
		    me.Invalidate(false)
		    
		  end if
		  
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub DropObject(obj As DragItem, action As Integer)
		  #Pragma Unused action
		  
		  if obj.TextAvailable then
		    
		    ClearSelections
		    
		    if obj.Text <> "" then
		      
		      if obj.Text = "New Text" then
		        
		        AddText(obj.DropLeft, obj.DropTop)
		        
		      elseif obj.Text = "New Image" then
		        
		        AddPicture(obj.DropLeft, obj.DropTop)
		        
		      elseif obj.Text = "New Rect" then
		        
		        AddRect(obj.DropLeft, obj.DropTop)
		        
		      elseif obj.Text = "New Oval" then
		        
		        AddOval(obj.DropLeft, obj.DropTop)
		        
		      else
		        
		        AddField(obj.DropLeft, obj.DropTop, obj.Text)
		        
		      end if
		      
		      AdjustBandMembers
		      
		      DesignCanvas.SetFocus
		      
		      // force plist refresh
		      RaiseEvent SelectionChanged(me.selectedItems)
		      
		    end if
		  end if
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  #Pragma Unused key
		  
		  if SelectedItems.Ubound > -1 then
		    
		    If Keyboard.AsyncKeyDown(kBackspaceKey) or Keyboard.AsyncKeyDown(kDeleteKey) then
		      
		      DeleteSelection
		      
		    elseif Keyboard.AsyncKeyDown(kUpArrow) then
		      
		      UndoAdd("Nudge Up")
		      
		      NudgeItems("up")
		      
		    elseif Keyboard.AsyncKeyDown(kDownArrow) then
		      
		      UndoAdd("Nudge Down")
		      
		      NudgeItems("down")
		      
		    elseif Keyboard.AsyncKeyDown(kRightArrow) then
		      
		      UndoAdd("Nudge Right")
		      
		      NudgeItems("right")
		      
		    elseif Keyboard.AsyncKeyDown(kLeftArrow) then
		      
		      UndoAdd("Nudge Left")
		      
		      NudgeItems("left")
		      
		    End if
		    
		  end if
		  
		  'AdjustBandMembers
		  
		  me.Invalidate(false)
		  
		  Return true
		End Function
	#tag EndEvent

	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  me.SetFocus
		  
		  //Account for scrolling
		  x = x - xOrigin
		  y = y - yOrigin
		  
		  ' A Drag may be starting so capture X and Y
		  
		  LastX = X
		  LastY = Y
		  
		  DownX = X
		  DownY = Y
		  
		  ' RIGHT CLICK?
		  if IsContextualClick then
		    
		    if OverItem <> nil then
		      ' Yes over item
		      If Keyboard.AsyncShiftKey then
		        
		        'Yes - add / remove from selection
		        
		        ToggleItemSelection(OverItem)
		        
		      else
		        
		        'No - shift key
		        ' is item selected
		        
		        if OverItem.Selected then
		          
		          ' yes process drag
		          
		        else
		          
		          ' no - Clear selected items and select item
		          ClearSelections
		          
		          ToggleItemSelection(OverItem)
		          
		        end if
		        
		        
		      end if
		      
		      
		      
		    else ' Not over Item
		      
		      ClearSelections
		      
		    end if
		    
		    me.Refresh(false)
		    
		    Return false
		    
		  end if
		  
		  ' LEFT CLICK
		  
		  // Give items priority over bands
		  // as item handles can be partially in band handles
		  
		  If OverItem <> nil then
		    
		    DragType = "Dragging"
		    
		    // We don't want bands and items both showing in the propertylist so remove any bands
		    DeselectAnyBands
		    
		    ' Is cursor over sizing handle
		    dim corner as String = OverItem.OnSizingHandle(X,Y)
		    
		    if corner <> "" then
		      
		      SaveUndoState("Resize Item(s)")
		      dragType = corner
		      
		    else
		      
		      SaveUndoState("Move Item(s)")
		      
		      If Keyboard.AsyncShiftKey then
		        'Yes - add / remove from selection
		        ToggleItemSelection(OverItem)
		      else
		        'No - shift key
		        ' is item selected
		        if OverItem.Selected then
		          ' yes process drag
		        else
		          ' no - Clear selected items and select item
		          ClearSelections
		          ToggleItemSelection(OverItem)
		          
		        end if
		        
		      end if
		      
		      me.Invalidate(OverItem.Left - 2, OverItem.Top - 2, OverItem.Width + 4, OverItem.Height + 4, false)
		      
		    end if
		    
		  else ' Not over item
		    
		    if DraggingBand <> -1 then
		      
		      SaveUndoState("Band Resize")
		      
		      DragType = "Band"
		      
		      Bands(DraggingBand).UpdateMinimumHeight
		      
		      return true
		      
		    end if
		    
		    // Not on item and not on band so treat click as the
		    // start of a selection rectangle
		    
		    DragType = "Selection"
		    
		    ' Is Shift key down?
		    if Not Keyboard.AsyncShiftKey then
		      
		      ' No - clear all
		      ClearSelections
		      
		    end if
		    
		    ' Setup for Selection Rectangle
		    dim dragRect as New PAF_PrintKit.PrintSelectionRect(me)
		    
		    dragRect.Left = x
		    dragRect.top = y
		    dragRect.Width = 0
		    dragRect.Height = 0
		    
		    SelectionRectItem = dragRect
		    
		  end if
		  
		  Return true
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub MouseDrag(X As Integer, Y As Integer)
		  //Account for scrolling
		  x = x - xOrigin
		  y = y - yOrigin
		  
		  Dim sDirection As String
		  
		  ' Has the mouse actually moved
		  If X = LastX and Y = LastY then return
		  
		  ' calculate movement
		  dim offsetX, offsetY as Integer
		  
		  offsetX = abs(X - LastX)
		  offsetY = abs(Y - LastY)
		  
		  if Y < LastY then
		    offsetY = offsetY * -1
		    sDirection = "Up"
		  else
		    sDirection = "Down"
		  end if
		  
		  if X < LastX then
		    offsetX = offsetX * -1
		    sDirection = sDirection + "Left"
		  else
		    sDirection = sDirection + "Right"
		  end if
		  
		  ' Is anything selected?
		  if DragType = "Band" and DraggingBand <> -1 then
		    
		    ResizeBand(X,Y)
		    
		    // create a bounds rect of the band
		    dim oBounds As xojo.Core.Rect
		    
		    if OverBand <> nil then
		      oBounds = new xojo.Core.Rect(0, OverBand.Bottom, me.Width, GetBandByType("Footer").Height)
		    else
		      oBounds = new xojo.Core.Rect(0, Y, me.Width, GetBandByType("Footer").Height)
		    end if
		    
		    ScrollAdjust(offsetX, offsetY, sDirection, oBounds)
		    
		  elseIf DragType = "Dragging" then ' Moving Items
		    
		    MoveItems(offsetX, offsetY)
		    
		    ScrollAdjust(offsetX, offsetY, sDirection)
		    
		  elseif dragType = "UpperRight" then ' Resizing Items
		    
		    ResizeItemRight("UpperRight", offsetX, offsetY)
		    ScrollAdjust(offsetX, offsetY, sDirection)
		    
		  elseif dragType = "LowerRight" then
		    
		    ResizeItemRight("LowerRight", offsetX, offsetY)
		    ScrollAdjust(offsetX, offsetY, sDirection)
		    AdjustBandMembers
		  elseif dragType = "UpperLeft" then
		    
		    ResizeItemLeft("UpperLeft", offsetX, offsetY)
		    ScrollAdjust(offsetX, offsetY, sDirection)
		    
		  elseif dragType = "LowerLeft" then
		    
		    ResizeItemLeft("LowerLeft", offsetX, offsetY)
		    ScrollAdjust(offsetX, offsetY, sDirection)
		    AdjustBandMembers
		  elseif DragType = "Selection" then
		    
		    ' We are using a selection rectangle
		    UpdateSelectionRectangle(OffsetX, OffsetY)
		    
		    // create a bounds rect of the selection rectangle
		    // account for negative values
		    dim r as PAF_PrintKit.PrintItem = SelectionRectItem
		    dim dLeft as double = max(min(r.Left, r.Right), 0)
		    dim dTop as double = max(min(r.top, r.Bottom), 0)
		    dim dwidth as double = min(abs(r.width), me.buffer.Width - abs(downX))
		    dim dHeight as double = min(abs(r.height), me.buffer.Height - abs(downY))
		    
		    dim oBounds as new xojo.Core.Rect(dLeft, dTop, dWidth, dHeight)
		    
		    ScrollAdjust(offsetX, offsetY, sDirection, oBounds)
		    
		  end if
		  
		  
		  ' update coordinates
		  LastX = X
		  LastY = Y
		  
		  me.Invalidate(false)
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseExit()
		  OverBand = nil
		  OverItem = nil
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseMove(X As Integer, Y As Integer)
		  //Account for scrolling
		  x = x - xOrigin
		  y = y - yOrigin
		  
		  if bands.Ubound <> -1 then ' prevent out of bounds
		    
		    Dim oWorkspaceBounds As New xojo.Core.Rect(LeftRightMargin,TopBottomMargin,me.Buffer.Width - LeftRightMargin * 2, bands(bands.Ubound).Bottom - TopBottomMargin)
		    Dim oPoint As new xojo.Core.Point(x,y)
		    
		    if oWorkspaceBounds.Contains(oPoint) then
		      
		      ' check if on a section sizing handle
		      DraggingBand = OnHandle(y)
		      
		      If DraggingBand <> -1 then
		        MouseCursor = System.Cursors.ArrowNorthSouth
		      else
		        MouseCursor = System.Cursors.StandardPointer
		      end if
		      
		      OverBand = InBand(Y)
		      
		      if OverBand = nil then
		        
		        OverItem = nil
		        
		      else
		        
		        OverItem = InItem(x,y)
		        
		        if OverItem <> nil then
		          
		          if OverItem.Selected then
		            ' Is cursor over sizing handle
		            dim corner as String = OverItem.OnSizingHandle(X,Y)
		            
		            if corner = "UpperLeft" then
		              MouseCursor = System.Cursors.ArrowNorthwestSoutheast
		            elseif corner = "UpperRight" then
		              MouseCursor = System.Cursors.ArrowNortheastSouthwest
		            elseif corner = "LowerLeft" then
		              MouseCursor = System.Cursors.ArrowNortheastSouthwest
		            elseif corner = "LowerRight" then
		              MouseCursor = System.Cursors.ArrowNorthwestSoutheast
		            else
		              MouseCursor = system.Cursors.StandardPointer
		            end if
		            
		          end if
		          
		        end if
		        
		      end if
		      
		    else
		      
		      DraggingBand = -1
		      OverBand = nil
		      OverItem = nil
		      MouseCursor = System.Cursors.StandardPointer
		      
		    end if
		    
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub MouseUp(X As Integer, Y As Integer)
		  //Account for scrolling
		  x = x - xOrigin
		  y = y - yOrigin
		  
		  DragConstrain = ""
		  
		  dim band as PAF_PrintKit.PrintBand
		  dim item as PAF_PrintKit.PrintItem
		  
		  If DragType = "Selection" then
		    
		    For each Band in Bands
		      for each item in band.Items
		        
		        If item.InSelection(PAF_PrintKit.PrintSelectionRect(SelectionRectItem)) then
		          
		          if item.Visible or ShowInvisibleItems then
		            
		            ToggleItemSelection(item)
		            
		          end if
		          
		        end if
		        
		        
		      Next
		    Next
		    
		    ' nil selection rectangle so it won't draw
		    SelectionRectItem = nil
		    
		  end if
		  
		  if DragType = "UpperRight" or DragType = "UpperLeft" or DragType = "LowerRight" or DragType = "LowerLeft" then
		    
		    UndoAdd(UndoSaveState)
		    
		    AdjustBandMembers
		    
		  end if
		  
		  if DragType = "Dragging" AND (X <> DownX or y <> DownY) then
		    
		    UndoAdd(UndoSaveState)
		    
		    AdjustBandMembers
		    
		  end if
		  
		  if SelectedItems.Ubound = -1 then
		    
		    if OverBand <> nil then
		      
		      OverBand.Selected = true
		      
		    end if
		    
		  end if
		  
		  if DragType = "band" then
		    
		    UndoAdd(UndoSaveState)
		    
		  end if
		  
		  pfDispatcher.send "PListGotFocus"
		  
		  DragType = ""
		  
		  DraggingBand = -1
		  
		  // force plist refresh
		  RaiseEvent SelectionChanged(me.selectedItems)
		  
		  me.Invalidate(false)
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  #if TargetMacOS then
		    
		    DoubleBuffer = false
		    EraseBackground = false
		    Transparent = False
		    
		  #elseif TargetWin32 then
		    
		    DoubleBuffer = true
		    EraseBackground = False
		    Transparent = false
		    
		  #Endif
		  
		  ScratchPicture = New Picture(1,1)
		  ScratchGraphics = ScratchPicture.Graphics
		  
		  me.AcceptTextDrop
		  
		  Reset
		  
		  me.listen array( "PListChanged", "PListGotFocus", "RefreshPList", "ScriptError" )
		  
		  RaiseEvent Open
		  
		  me.Initialized = true
		End Sub
	#tag EndEvent

	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  #Pragma Unused areas
		  
		  if Buffer = nil then Return
		  
		  g.ForeColor = &cEDE0B200
		  g.FillRect(0,0,g.Width,g.Height)
		  
		  'g.DrawPicture(Buffer, xOrigin, yOrigin)
		  
		  'ClearBuffer
		  
		  g.ForeColor = &cFFFFFF00
		  g.FillRect 0,0,buffer.Width,buffer.height
		  
		  Draw(g)
		  
		  g.ForeColor = &c00000000
		  g.DrawRect 0,0, buffer.Width, buffer.Height
		  
		  g.ForeColor = &cD7D7D700
		  g.DrawRect LeftRightMargin + xOrigin, TopBottomMargin + yOrigin, Buffer.Width - LeftRightMargin * 2, Buffer.Height - TopBottomMargin * 2
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub AddDBTable(jReport As JSONItem)
		  Dim liteDB As New PAF_DatabaseKit.DBWrapper("SQLite")
		  
		  dim dlg as New OpenDialog
		  
		  dlg.PromptText = "Select SQLite Database"
		  dlg.Filter = ProjectFileTypes.SpecialAny
		  
		  dlg.Title = "Open Database"
		  
		  liteDB.DatabaseFile = dlg.ShowModal()
		  
		  if liteDB.DatabaseFile <> nil then
		    
		    if liteDB <> nil then
		      
		      if liteDB.Connect then
		        
		        if liteDB.type = "SQLite" then
		          
		          liteDB.SQLExecute("PRAGMA cache_size = 10000")
		          
		          Dim oReport As new ReportPF(oDBWrapper,jReport,me)
		          
		          Dim rs As RecordSet = oReport.GetRecordsetForAddTable
		          
		          if rs <> nil and not rs.EOF then
		            
		            PAF_DatabaseKit.RecordSetToDBTable(liteDB,rs)
		            
		          end if
		          
		        end if
		        
		      else
		        
		        MsgBox liteDB.ErrorMessage
		        
		      end if
		      
		    end if
		    
		  else
		    
		    MsgBox "No file selected"
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AddField(x as integer, y as Integer, fieldName as String)
		  dim bandIndex as Integer = InBandIndex(y)
		  
		  if bandIndex > -1 then
		    
		    UndoAdd("Add Field")
		    
		    dim pf as New PAF_PrintKit.PrintField(me)
		    
		    if fieldName = "Function" then
		      
		      pf.IsFunction = True
		      pf.Alias = "Function"
		      
		    end if
		    
		    pf.Top = y
		    pf.Left = x
		    
		    pf.FieldName = fieldName
		    pf.Data = pf.FieldName
		    
		    pf.Width = GetStringWidth(pf) + 6
		    pf.Height = GetTextHeight(pf)
		    pf.Band = me.Bands(bandIndex)
		    
		    ClearSelections
		    
		    pf.Selected = true
		    
		    me.Bands(bandIndex).Items.append pf
		    
		    FindOrphanedItems("Item extended beyond the visible area" + EndOfLine + "It has been confined to the available space")
		    
		    AutoAlias
		    
		    AdjustBandMembers
		    
		    RaiseEvent SelectionChanged(selectedItems)
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddField(fieldName As String)
		  Dim oBand As PAF_PrintKit.PrintBand = GetBandByType("Header")
		  
		  UndoAdd("Add Field")
		  
		  dim pf as New PAF_PrintKit.PrintField(me)
		  
		  if fieldName = "Function" then
		    
		    pf.IsFunction = True
		    pf.Alias = "Function"
		    
		  end if
		  
		  pf.Top =  oBand.Top + 5
		  pf.Left = oBand.Left + 5
		  
		  pf.FieldName = fieldName
		  pf.Data = pf.FieldName
		  
		  pf.Width = GetStringWidth(pf) + 6
		  pf.Height = GetTextHeight(pf)
		  pf.Band = oBand
		  
		  ClearSelections
		  
		  pf.Selected = true
		  
		  oBand.Items.append pf
		  
		  FindOrphanedItems("Item extended beyond the visible area" + EndOfLine + "It has been confined to the available space")
		  
		  AutoAlias
		  
		  AdjustBandMembers
		  
		  RaiseEvent SelectionChanged(selectedItems)
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddHTMLLinks()
		  Dim oBand As PAF_PrintKit.PrintBand = GetBandByType("Header")
		  
		  DeselectAnyBands
		  ClearSelections
		  
		  dim oLinkPrev as New PAF_PrintKit.PrintText(me)
		  oLinkPrev.Data = "LINK_Prev"
		  oLinkPrev.Band = oBand
		  
		  dim oLinkNext as New PAF_PrintKit.PrintText(me)
		  oLinkNext.Data = "LINK_Next"
		  oLinkNext.Band = oBand
		  
		  
		  oLinkPrev.left = oBand.Left + oband.Width - 140
		  oLinkPrev.top = TopBottomMargin + 10
		  oLinkPrev.selected = true
		  oLinkPrev.Width = 65
		  oLinkNext.left = oLinkPrev.left + olinkPrev.width + 10
		  oLinkNext.top = oLinkPrev.Top
		  oLinkNext.selected = true
		  oLinkNext.Width = 65
		  
		  oband.Items.Append oLinkPrev
		  oband.Items.Append oLinkNext
		  
		  me.Invalidate(false)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AddLabelsAbove()
		  dim newItem, newItems() as PAF_PrintKit.PrintText
		  
		  For each item as PAF_PrintKit.PrintItem in SelectedItems
		    
		    if Item IsA PAF_PrintKit.PrintField then
		      
		      newItem = New PAF_PrintKit.PrintText(me)
		      
		      newItem.Data = PAF_PrintKit.PrintField(Item).alias
		      
		      newItem.Band = item.Band
		      
		      newItem.Left = item.Left
		      
		      newItem.Bold = true
		      
		      newItem.Alignment = PAF_PrintKit.PrintField(item).alignment
		      
		      newItem.Width = PAF_PrintKit.PrintField(item).Width
		      
		      newItem.Height = GetTextHeight(newItem)
		      
		      newItem.top = item.Top - newItem.Height - 4
		      
		      newItem.Band.Items.Append newItem
		      
		      newItems.Append newItem
		      
		    end if
		    
		    item.Selected = false
		    
		  Next
		  
		  Redim SelectedItems(-1)
		  
		  for each newItem in newItems
		    
		    ToggleItemSelection(newItem)
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AddLabelsLeft()
		  dim newItem as PAF_PrintKit.PrintText
		  
		  UndoAdd("Label(s) Left")
		  
		  For each item as PAF_PrintKit.PrintItem in SelectedItems
		    
		    if Item IsA PAF_PrintKit.PrintField then
		      
		      newItem = New PAF_PrintKit.PrintText(me)
		      
		      if PAF_PrintKit.PrintField(Item).Alias <> "" then
		        newItem.Data = PAF_PrintKit.PrintField(Item).Alias
		      else
		        newItem.Data = PAF_PrintKit.PrintField(Item).FieldName
		      end if
		      
		      newItem.Band = item.Band
		      
		      newItem.Bold = true
		      
		      newItem.Alignment = 3 ' right
		      
		      newItem.Width = GetStringWidth(newItem) + 6
		      
		      newItem.Height = GetTextHeight(newItem)
		      
		      newItem.top = item.Top
		      
		      newItem.Left = max(0, item.Left - 4 - newItem.Width)
		      
		      newItem.Band.Items.Append newItem
		      
		    end if
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AddLabelsToHeader()
		  dim newItem, newItems() as PAF_PrintKit.PrintText
		  
		  UndoAdd("Header Label(s)")
		  
		  For each item as PAF_PrintKit.PrintItem in SelectedItems
		    
		    if Item IsA PAF_PrintKit.PrintField then
		      
		      newItem = New PAF_PrintKit.PrintText(me)
		      
		      newItem.Data = PAF_PrintKit.PrintField(Item).Alias
		      
		      newItem.Band = GetBandByType("Header")
		      
		      newItem.Left = item.Left
		      
		      newItem.Bold = true
		      
		      newItem.Alignment = PAF_PrintKit.PrintField(item).alignment
		      
		      newItem.Width = PAF_PrintKit.PrintField(item).Width
		      
		      newItem.Height = GetTextHeight(newItem)
		      
		      newItem.top = newItem.Band.top + newItem.Band.Height - newItem.Height - 11
		      
		      newItem.Band.Items.Append newItem
		      
		      newItems.Append newItem
		      
		    end if
		    
		    item.Selected = false
		    
		  Next
		  
		  Redim SelectedItems(-1)
		  
		  for each newItem in newItems
		    
		    ToggleItemSelection(newItem)
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddOval()
		  Dim oBand As PAF_PrintKit.PrintBand = GetBandByType("Header")
		  
		  UndoAdd("Add Oval")
		  
		  dim pp as New PAF_PrintKit.PrintOval(me)
		  pp.Top = oBand.Top + 5
		  pp.Left = oBand.Left + 5
		  pp.Width = 16
		  pp.Height = 16
		  pp.Band = oBand
		  
		  ClearSelections
		  
		  pp.Selected = true
		  
		  oBand.Items.Append pp
		  
		  FindOrphanedItems("Item extended beyond the visible area" + EndOfLine + "It has been confined to the available space")
		  
		  AdjustBandMembers
		  
		  RaiseEvent SelectionChanged(selectedItems)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AddOval(x as Integer, y as Integer)
		  dim bandIndex as Integer = InBandIndex(y)
		  
		  if bandIndex > -1 then
		    
		    UndoAdd("Add Oval")
		    
		    dim pp as New PAF_PrintKit.PrintOval(me)
		    pp.Top = y
		    pp.Left = x
		    pp.Width = 16
		    pp.Height = 16
		    pp.Band = me.Bands(bandIndex)
		    
		    pp.Selected = true
		    
		    me.Bands(bandIndex).Items.Append pp
		    
		    FindOrphanedItems("Item extended beyond the visible area" + EndOfLine + "It has been confined to the available space")
		    
		    RaiseEvent SelectionChanged(selectedItems)
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddPicture()
		  Dim oBand As PAF_PrintKit.PrintBand = GetBandByType("Header")
		  
		  UndoAdd("Add Picture")
		  
		  dim pp as New PAF_PrintKit.PrintImage(me)
		  pp.Top = oBand.Top + 5
		  pp.Left = oBand.Left + 5
		  pp.Width = 16
		  pp.Height = 16
		  pp.Name = "New Image"
		  pp.Band = oBand
		  
		  ClearSelections
		  
		  pp.Selected = true
		  
		  oBand.Items.Append pp
		  
		  AdjustBandMembers
		  
		  FindOrphanedItems("Item extended beyond the visible area" + EndOfLine + "It has been confined to the available space")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AddPicture(x as Integer, y as Integer)
		  dim bandIndex as Integer = InBandIndex(y)
		  
		  if bandIndex > -1 then
		    
		    UndoAdd("Add Picture")
		    
		    dim pp as New PAF_PrintKit.PrintImage(me)
		    pp.Top = y
		    pp.Left = x
		    pp.Width = 16
		    pp.Height = 16
		    pp.Name = "New Image"
		    pp.Band = me.Bands(bandIndex)
		    
		    pp.Selected = true
		    
		    me.Bands(bandIndex).Items.Append pp
		    
		    FindOrphanedItems("Item extended beyond the visible area" + EndOfLine + "It has been confined to the available space")
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddRect()
		  Dim oBand As PAF_PrintKit.PrintBand = GetBandByType("Header")
		  
		  UndoAdd("Add Rect")
		  
		  dim pp as New PAF_PrintKit.PrintRect(me)
		  pp.Top = oBand.Top + 5
		  pp.Left = oBand.Left + 5
		  pp.Width = 16
		  pp.Height = 16
		  pp.Band = oBand
		  
		  ClearSelections
		  
		  pp.Selected = true
		  
		  oBand.Items.Append pp
		  
		  AdjustBandMembers
		  
		  FindOrphanedItems("Item extended beyond the visible area" + EndOfLine + "It has been confined to the available space")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AddRect(x as Integer, y as Integer)
		  dim bandIndex as Integer = InBandIndex(y)
		  
		  if bandIndex > -1 then
		    
		    UndoAdd("Add Rect")
		    
		    dim pp as New PAF_PrintKit.PrintRect(me)
		    pp.Top = y
		    pp.Left = x
		    pp.Width = 16
		    pp.Height = 16
		    pp.Band = me.Bands(bandIndex)
		    
		    pp.Selected = true
		    
		    me.Bands(bandIndex).Items.Append pp
		    
		    FindOrphanedItems("Item extended beyond the visible area" + EndOfLine + "It has been confined to the available space")
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddTemporaryView(oDBWrapper as PAF_DatabaseKit.DBWrapper)
		  // coming from the menu command add body as view
		  
		  me.oDBWrapper = oDBWrapper
		  
		  if oDBWrapper.TempViewDict = nil then oDBWrapper.TempViewDict = new xojo.Core.Dictionary
		  
		  AutoAlias
		  
		  UpdateSQL
		  
		  Dim sql as string = PAF_PrintKit.PrintBand(GetBandByType("Body")).SQL
		  
		  Dim viewName As String = PAFInputWin.GetInput("Enter View Name", "OK","Cancel", "You must enter a name or press cancel to continue")
		  
		  if viewName <> "Cancel" then
		    
		    if oDBWrapper.type = "MySQL" then ' No temp views in MySQL
		      
		      sql = "Create Temporary Table if not exists " + viewName + " As (" + sql + ")"
		      
		    else
		      
		      sql  = "Create Temporary View " + viewName + " As " + sql
		      
		    end if
		    
		    oDBWrapper.SQLExecute(sql)
		    
		    if oDBWrapper.Error then
		      
		      MsgBox "Error creating temporary view" + EndOfLine + oDBWrapper.ErrorMessage
		      
		    else
		      oDBWrapper.TempViewDict.Value(viewName) = sql
		      oDBWrapper.ViewDict.Value(viewName) = oDBWrapper.GetViewSchema(viewName)
		      oDBWrapper.SchemaDict.Value(viewName) = oDBWrapper.GetViewSchema(viewName)
		      
		    end if
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddTemporaryView(oDBWrapper as PAF_DatabaseKit.DBWrapper, sName as string, sql As String)
		  // coming from open report area
		  
		  me.oDBWrapper = oDBWrapper
		  
		  oDBWrapper.SQLExecute(sql)
		  
		  if oDBWrapper.Error then
		    
		    MsgBox "Error creating temporary view" + EndOfLine + oDBWrapper.ErrorMessage
		    
		  else
		    
		    oDBWrapper.TempViewDict.Value(sName) = sql
		    oDBWrapper.ViewDict.Value(sName) = oDBWrapper.GetViewSchema(sName)
		    oDBWrapper.SchemaDict.Value(sName) = oDBWrapper.GetViewSchema(sName)
		    
		  end if
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub AddText()
		  Dim oBand As PAF_PrintKit.PrintBand = GetBandByType("Header")
		  
		  UndoAdd("Add Text")
		  
		  dim pt as New PAF_PrintKit.PrintText(me)
		  pt.Data = "New Text Item"
		  pt.Top = oBand.Top + 5
		  pt.Left = oBand.Left + 5
		  pt.Width = GetStringWidth(pt) + 6
		  pt.Height = GetTextHeight(pt)
		  pt.Band = oBand
		  
		  ClearSelections
		  
		  pt.Selected = true
		  
		  oBand.Items.Append pt
		  
		  AdjustBandMembers
		  
		  FindOrphanedItems("Item extended beyond the visible area" + EndOfLine + "It has been confined to the available space")
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AddText(x as Integer, y as Integer)
		  dim bandIndex as Integer = InBandIndex(y)
		  
		  if bandIndex > -1 then
		    
		    UndoAdd("Add Text")
		    
		    dim pt as New PAF_PrintKit.PrintText(me)
		    pt.Data = "New Text Item"
		    pt.Top = y
		    pt.Left = x
		    pt.Width = GetStringWidth(pt) + 6
		    pt.Height = GetTextHeight(pt)
		    pt.Band = me.Bands(bandIndex)
		    
		    pt.Selected = true
		    
		    me.Bands(bandIndex).Items.Append pt
		    
		    FindOrphanedItems("Item extended beyond the visible area" + EndOfLine + "It has been confined to the available space")
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AdjustBandMembers()
		  Dim oBand As PAF_PrintKit.PrintBand
		  
		  Dim dItemBandTest As Double
		  
		  For each item as PAF_PrintKit.PrintItem in SelectedItems
		    
		    For i as integer = bands.Ubound downto 0
		      
		      oBand = Bands(i)
		      
		      if item.top >= oBand.top then
		        
		        if item.Band = oBand then
		          
		          exit
		          
		        else
		          
		          item.Band.Items.Remove(item.Band.Items.indexof(item))
		          item.Band = oBand
		          oBand.Items.Append item
		          
		          exit
		          
		        end if
		        
		      end if
		      
		    next
		    
		    dItemBandTest = (oBand.top + oband.Height - 10) - (item.top + item.Height)
		    
		    if dItemBandTest < 0 then
		      oBand.Height = oBand.Height + abs(dItemBandTest)
		    end if
		    
		  Next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AdjustBands()
		  #pragma DisableBackgroundTasks
		  #pragma DisableBoundsChecking
		  
		  
		  if bands.Ubound > -1 then
		    
		    dim i, iTop, iDelta as Integer
		    
		    dim band As PAF_PrintKit.PrintBand
		    
		    SortBandsByTop(Bands)
		    
		    iTop = bands(0).Top
		    
		    'For each band as PAF_PrintKit.PrintBand in Bands
		    
		    for iBand as integer = 0 to Bands.Ubound
		      
		      band = Bands(iBand)
		      
		      if band.Visible or ShowInvisibleItems then
		        
		        iDelta = band.Top - itop
		        
		        band.top = iTop
		        
		        band.Index = i
		        
		        i = i + 1
		        
		        itop = itop + band.Height
		        
		        For each item as PAF_PrintKit.PrintItem in band.Items
		          
		          item.top = item.top - iDelta
		          
		        next
		        
		      end if
		      
		    Next
		    
		  end if
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AlignEdges(edge as String, items() as PAF_PrintKit.PrintItem)
		  dim item as PAF_PrintKit.PrintItem
		  
		  dim alignTo as Integer
		  
		  If edge = "left" then
		    
		    UndoAdd("Align Left")
		    
		    alignTo = 100000
		    
		    for each item in items
		      
		      alignTo = min(item.Left,alignTo)
		      
		    Next
		    
		    for each item in items
		      
		      item.Left = alignTo
		      
		    next
		    
		  elseif edge = "right" then
		    
		    UndoAdd("Align Right")
		    
		    AlignTo = 0
		    
		    for each item in items
		      
		      alignTo = max(item.Right,alignTo)
		      
		    Next
		    
		    for each item in items
		      
		      item.Left = alignTo - item.Width
		      
		    next
		    
		  elseif edge = "top" then
		    
		    UndoAdd("Align Tops")
		    
		    AlignTo = 100000
		    
		    for each item in items
		      
		      alignTo = min(item.Top,alignTo)
		      
		    Next
		    
		    for each item in items
		      
		      item.Top = alignTo
		      
		    next
		    
		  elseif edge = "bottom" then
		    
		    UndoAdd("Align Bottoms")
		    
		    AlignTo = 0
		    
		    for each item in items
		      
		      alignTo = max(item.Bottom,alignTo)
		      
		    Next
		    
		    for each item in items
		      
		      item.Top = alignTo - item.Height
		      
		    next
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ApplyStyle(oStyle as PAF_PrintKit.PrintStyle)
		  For each item as PAF_PrintKit.PrintItem in SelectedItems
		    
		    if Item IsA PAF_PrintKit.PrintText then
		      
		      PAF_PrintKit.PrintText(Item).ApplyStyle(oStyle)
		      
		    elseif Item isa PAF_PrintKit.PrintRect then
		      
		      PAF_PrintKit.PrintRect(Item).ApplyStyle(oStyle)
		      
		    elseif item isa PAF_PrintKit.PrintOval then
		      
		      PAF_PrintKit.PrintOval(item).ApplyStyle(oStyle)
		      
		    end if
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AutoAlias()
		  oDBWrapper.AliasResolutionDict = new Dictionary
		  dim fldName, aliasTestName as String
		  dim bFoundGroupByField As Boolean
		  dim oField, bandFieldItems() As PAF_PrintKit.PrintField
		  
		  For each band as PAF_PrintKit.PrintBand in Bands
		    
		    if band.BandType = "break" or band.BandType = "body" or band.BandType = "Grand Summary" then
		      
		      AliasDict = new Dictionary
		      bandFieldItems = ExtractFieldsFromBand(band)
		      
		      // need to capture the groupby field which may not be on the layout
		      if band.BandType = "break" then
		        bFoundGroupByField = false
		        For i as integer = 0 to bandFieldItems.Ubound
		          if PAF_PrintKit.PrintField(bandFieldItems(i)).FieldName = band.GroupBy then
		            bFoundGroupByField = true
		            exit
		          end if
		        next
		        if not bFoundGroupByField then
		          oField = New PAF_PrintKit.PrintField(me)
		          oField.FieldName = band.GroupBy
		          bandFieldItems.Append oField
		        end if
		      end if
		      
		      for each pf as PAF_PrintKit.PrintField in bandFieldItems
		        fldName = NthField(pf.FieldName,".",2)
		        // create aliases if missing
		        if pf.Alias = "" then
		          // add aggregate type if needed
		          if pf.Aggregate <> "" then
		            pf.alias = pf.Aggregate + "_" + fldName
		          else
		            pf.alias = fldName
		            pf.uid = fldName
		          end if
		        else
		          // add aggregate type if needed
		          if pf.Aggregate <> "" then
		            pf.alias = pf.Aggregate + "_" + fldName
		          else
		            // remove aggregate if needed
		            if instr(pf.Alias,"_") <> 0 then
		              pf.Alias = fldName
		            end if
		          end if
		          fldName = pf.alias
		        end if
		        
		        // Resolve aliases
		        Dim incrementer As Integer = AliasDict.Lookup(pf.Alias,-1).IntegerValue
		        
		        if incrementer = -1 then
		          AliasDict.Value(pf.alias) = 1
		        else
		          Do
		            incrementer = incrementer + 1
		            aliasTestName = fldName + "_" + str(incrementer)
		          loop until AliasDict.Lookup(aliasTestName,-1).IntegerValue = - 1
		          AliasDict.Value(pf.alias) = incrementer
		          pf.Alias = aliasTestName
		          pf.uid = aliasTestName
		        end if
		        oDBWrapper.AliasResolutionDict.Value(pf.FieldName) = pf.Alias
		      next
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function BuildJoins(sBaseTable as String, sTables() as String) As String
		  if oDBWrapper.DictRelations = nil then
		    oDBWrapper.DictRelations = New Dictionary
		  end if
		  
		  dim sResult as string
		  
		  dim sLinks(), tablesInLinks(), testTable as String
		  
		  dim sResultLinks(), sKey as String
		  
		  For i as integer = 0 to sTables.Ubound
		    
		    sKey = sBaseTable + "_" + sTables(i)
		    
		    if not oDBWrapper.DictRelations.HasKey(sKey) then
		      
		      oDBWrapper.LazyLoadRelation(sBaseTable,sTables(i))
		      
		    end if
		    
		    if oDBWrapper.DictRelations.HasKey(sKey) then
		      
		      sLinks = oDBWrapper.DictRelations.Value(sKey)
		      
		      For each link as String in sLinks
		        
		        testTable = left(link,instr(link," ") - 1)
		        
		        if tablesInLinks.IndexOf(testTable) = -1 then
		          
		          tablesInLinks.Append testTable
		          
		          if sResultLinks.IndexOf(link) = -1 then
		            
		            sResultLinks.Append link
		            
		            if sResult = "" then
		              
		              sResult = "Inner Join "  + link
		              
		            else
		              
		              sResult = sResult + EndOfLine + "Inner Join " + link
		              
		            end if
		            
		          end if
		          
		        end if
		        
		      next
		      
		    else
		      
		      MsgBox "Could not find relation info for " + sBaseTable + " and " + sTables(i)
		      
		    end if
		    
		  next
		  
		  Return sResult
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildStyleMenu() As MenuItem
		  // This updates the Styles in the report style dictionary
		  BuildStyles(Bands)
		  
		  dim p as New Picture(16,16,32)
		  
		  dim styleNames() as String = VariantArrayToStringArray(DictStyles.Keys)
		  
		  dim oStyle as PAF_PrintKit.PrintStyle
		  
		  dim base, mItem as MenuItem
		  
		  base = new MenuItem("Styles")
		  
		  for i as Integer = 0 to styleNames.Ubound
		    
		    oStyle = DictStyles.Value(styleNames(i))
		    
		    dim pic as Picture = oStyle.Draw
		    
		    mItem = New MenuItem("")'(oStyle.name)
		    mItem.Tag = oStyle.name
		    p.Graphics.ForeColor = oStyle.TextColor
		    p.Graphics.FillRect(0,0,p.Graphics.Width,p.Graphics.Height)
		    mItem.Icon = pic
		    
		    base.Append mItem
		    
		  next
		  
		  Return base
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function BuildWhereConditions() As String
		  dim sResult As String
		  dim i, count As integer
		  dim oCondition As PAFQueryCondition
		  
		  count = WhereConditions.Ubound
		  
		  For i = 0 to count
		    
		    oCondition = WhereConditions(i)
		    
		    if i = 0 then
		      
		      sResult = oCondition.PreparedString
		      
		    else
		      
		      sResult = sResult + EndOfLine + oCondition.AndOr + " " + oCondition.PreparedString
		      
		    end if
		    
		  Next
		  
		  Return sResult
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CheckGroupByFields(oBand As PAF_PrintKit.PrintBand) As String
		  // we need to be sure all group by fields that are not
		  // aggregates are contained in the groupby clause
		  
		  Dim sResult() As String
		  
		  Dim oFld As PAF_PrintKit.PrintField
		  
		  sResult.Append oBand.GroupBy
		  
		  For each oitem as PAF_PrintKit.PrintItem in oBand.Items
		    
		    if oitem isa PAF_PrintKit.PrintField then
		      
		      oFld = PAF_PrintKit.PrintField(oItem)
		      
		      if oFld.Aggregate = "" then
		        
		        if oFld.IsFunction then
		          //todo to do temp fix
		          if instr(oFld.FieldName, "group_concat") = 0 and instr(oFld.FieldName,"array_agg") = 0 and instr(oFld.FieldName,"sum(") = 0 then
		            
		            if sResult.IndexOf(oFld.alias) = -1 then
		              
		              sResult.Append oFld.alias
		              
		            end if
		            
		          end if
		          
		        else
		          
		          if sResult.IndexOf(oFld.FieldName) = -1 then
		            
		            sResult.Append oFld.FieldName
		            
		          end if
		          
		        end if
		        
		      end if
		      
		    end if
		    
		  next
		  
		  Return Join(sResult,",")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ClearBuffer()
		  Buffer.Graphics.ClearRect(0,0,Buffer.Width,Buffer.Height)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ClearSelections()
		  For each item as PAF_PrintKit.PrintItem in SelectedItems
		    
		    item.Selected = false
		    
		  Next
		  
		  me.Invalidate(false)
		  
		  Redim SelectedItems(-1)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DeleteSelection()
		  // Determine selection item(s) type and present correct dialog wording
		  
		  dim oItem as PAF_PrintKit.PrintItem
		  
		  dim aroItems() as PAF_PrintKit.PrintItem = SelectedItems
		  
		  if aroItems.Ubound = 0 and aroItems(0) isa PAF_PrintKit.PrintBand then
		    
		    dim sBandType as string = PAF_PrintKit.PrintBand(aroItems(0)).BandType
		    
		    if sBandType = "Header" or sBandType = "Body" or sBandType = "Footer" then
		      
		      Dim sMsg As String = "You can not delete the Header, Body or Footer at this time."_
		      + EndOfLine + EndOfLine +_
		      "You can toggle the bands visibility in the PropertyInfo"_
		      + EndOfLine + "and deselect Show Invisible Items from the View menu."
		      
		      MsgBox sMsg
		      
		    else
		      
		      if PAFConfirm("Are you sure you want to delete this band and all its items?", "Delete") then
		        
		        UndoAdd("Delete Band")
		        
		        Bands.Remove(Bands.Indexof(PAF_PrintKit.PrintBand(aroItems(0))))
		        
		        // adjust the tops of bands and their items
		        AdjustBands
		        
		        redim SelectedItems(-1)
		        
		      end if
		      
		    end if
		    
		  else
		    
		    if aroItems.Ubound = 0 then
		      
		      oItem = aroItems(0)
		      
		      if PAFConfirm("Are you sure you want to delete this item?", "Delete", true) then
		        
		        UndoAdd("Delete Item")
		        
		        oItem.Band.Items.Remove(oItem.Band.Items.IndexOf(oItem))
		        
		        redim SelectedItems(-1)
		        
		      end if
		      
		    else
		      
		      if PAFConfirm("Are you sure you want to delete these items?", "Delete", true) then
		        
		        UndoAdd("Delete Items")
		        
		        for i as integer = 0 to aroItems.Ubound
		          
		          oItem = aroItems(i)
		          
		          oItem.Band.Items.Remove(oItem.Band.Items.IndexOf(oItem))
		          
		        next
		        
		        redim SelectedItems(-1)
		        
		      end if
		      
		    end if
		    
		  end if
		  
		  RaiseEvent SelectionChanged(me.selecteditems)
		  
		  me.Invalidate
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DeselectAnyBands()
		  For each b as PAF_PrintKit.PrintBand in Bands
		    b.Selected = false
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub distributeHorizontally()
		  dim itemLeft() as Integer
		  
		  dim i, leftEdge, rightEdge, numItems, betweenSpace, newWidth, currentLeft as Integer
		  
		  dim distributeItems() as PAF_PrintKit.PrintItem = me.SelectedItems
		  
		  UndoAdd("Distribute Horizontally")
		  
		  numItems = UBound(distributeItems)
		  
		  ' Build an array of left edge values
		  For i = 0 to numItems
		    itemLeft.Append distributeItems(i).Left
		  Next
		  
		  ' sort the item array by the left edge value to get them in left to right order
		  itemLeft.SortWith(distributeItems)
		  
		  ' get the left edge of group
		  
		  leftEdge = distributeItems(0).Left
		  
		  ' get the right edge of group
		  
		  rightEdge = distributeItems(numItems).Left + distributeItems(numItems).Width
		  
		  ' 3 pixel gap
		  
		  betweenSpace = 3 * numItems
		  
		  ' calc width so they are all equal
		  
		  newWidth = (rightEdge - leftEdge - betweenSpace)/(numItems + 1)
		  
		  ' distribute the items
		  ' set the first item
		  
		  distributeItems(0).Left = leftEdge
		  distributeItems(0).Width = newWidth
		  
		  ' calc the next items left edge
		  currentLeft = leftEdge + currentLeft + newWidth + 3
		  
		  ' iterate through the balance and set each item
		  for i = 1 to numItems
		    distributeItems(i).Left = currentLeft
		    distributeItems(i).Width = newWidth
		    currentLeft = currentLeft + newWidth + 3
		  Next
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub distributeVertically()
		  dim iCount, iTops() as Integer
		  
		  dim i, dTopEdge, dBottomEdge, dBetweenSpace, dCurrentTop as double
		  
		  dim dTotalItemHeight, dTotalSpace As double
		  
		  dim oItems() as PAF_PrintKit.PrintItem = me.SelectedItems
		  
		  UndoAdd("Distribute Vertically")
		  
		  iCount = UBound(oItems)
		  
		  // Build an array of top edge values
		  // and calc total height of items
		  For i = 0 to iCount
		    iTops.Append oItems(i).Top
		    dTotalItemHeight = dTotalItemHeight + oItems(i).Height
		  Next
		  
		  // sort the item array by the top edge value to get them in left to right order
		  iTops.SortWith(oItems)
		  
		  // get the top edge of group
		  
		  dTopEdge = oItems(0).Top
		  
		  // get the bottom edge of group
		  
		  dBottomEdge = oItems(iCount).Top + oItems(iCount).Height
		  
		  // calc the empty space
		  dTotalSpace = dBottomEdge - dTopEdge - dTotalItemHeight
		  
		  // calc the new gap between items
		  dBetweenSpace = dTotalSpace/(iCount)
		  
		  dCurrentTop = dTopEdge
		  
		  // iterate through the items
		  for i = 0 to iCount
		    oItems(i).Top = dCurrentTop
		    dCurrentTop = dCurrentTop + oItems(i).Height + dBetweenSpace
		  Next
		  
		  // account for item moving to new band
		  AdjustBandMembers
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub Draw(g as Graphics)
		  '#pragma DisableBackgroundTasks
		  '#pragma DisableBoundsChecking
		  
		  g.ForeColor = &cFFFFFF00
		  g.FillRect(0,0,Buffer.Width,Buffer.Height)
		  
		  dim i as Integer
		  
		  SortBandsByTop(Bands)
		  
		  AdjustBands
		  
		  // two drawing passes
		  // first draws band background and non visible fields
		  // second draws visible items and band borders
		  
		  For each band as PAF_PrintKit.PrintBand in Bands
		    
		    if band.Visible or ShowInvisibleItems then
		      
		      band.Index = i
		      
		      band.DrawPass1(g,QualityScale, xOrigin, yOrigin)
		      
		      i = i + 1
		      
		    end if
		    
		  Next
		  
		  For each band as PAF_PrintKit.PrintBand in Bands
		    
		    if band.Visible or ShowInvisibleItems then
		      
		      band.DrawPass2(g,QualityScale, xOrigin, yOrigin)
		      
		    end if
		    
		  Next
		  
		  if SelectionRectItem <> nil then
		    SelectionRectItem.Draw(g,QualityScale, xOrigin, yOrigin)
		  end if
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DuplicateItems()
		  dim dupeItems() as PAF_PrintKit.PrintItem
		  
		  dim pf as PAF_PrintKit.PrintField
		  dim pt as PAF_PrintKit.PrintText
		  dim pp as PAF_PrintKit.PrintImage
		  dim pr As PAF_PrintKit.PrintRect
		  dim po As PAF_PrintKit.PrintOval
		  
		  dupeItems = SelectedItems
		  
		  UndoAdd("Duplicate")
		  
		  For each pi as PAF_PrintKit.PrintItem in dupeItems
		    
		    if pi IsA PAF_PrintKit.PrintField then
		      
		      pf = New PAF_PrintKit.PrintField(me)
		      pf.Clone(pi)
		      pf.top = pf.Top + 5
		      pf.Left = pf.Left + 5
		      pf.Band.Items.Append pf
		      pi.Selected = false
		      
		    elseif pi IsA PAF_PrintKit.PrintText then
		      
		      pt = New PAF_PrintKit.PrintText(me)
		      pt.Clone(pi)
		      pt.top =pt.Top + 5
		      pt.Left = pt.Left + 5
		      pt.Band.Items.Append pt
		      pi.Selected = false
		      
		    Elseif pi isa PAF_PrintKit.PrintImage then
		      
		      pp = new PAF_PrintKit.PrintImage(me)
		      pp.Clone(pi)
		      pp.Top = pp.top + 5
		      pp.Left = pp.Left + 5
		      pp.Band.Items.Append pp
		      pi.Selected = false
		      
		    elseif pi isa PAF_PrintKit.PrintRect then
		      
		      pr = new PAF_PrintKit.PrintRect(me)
		      pr.Clone(pi)
		      pr.Top = pr.top + 5
		      pr.Left = pr.Left + 5
		      pr.Band.Items.Append pr
		      pr.ShortsStyle = ""
		      pi.Selected = false
		      
		    elseif pi isa PAF_PrintKit.PrintOval then
		      
		      po = new PAF_PrintKit.PrintOval(me)
		      po.Clone(pi)
		      po.Top = po.Top + 5
		      po.Left = po.Left + 5
		      po.Band.Items.Append po
		      po.ShortsStyle = ""
		      pi.Selected = false
		      
		    else
		      
		      break
		      
		    end if
		    
		  Next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DuplicateRight(item as PAF_PrintKit.PrintItem)
		  dim pf as PAF_PrintKit.PrintField
		  
		  dim lastRight as Integer
		  
		  dim flds() as String
		  
		  me.ClearSelections
		  
		  flds = DupeRightWin.Setup(oDBWrapper)
		  
		  UndoAdd("Duplicate")
		  
		  lastRight = item.Right + 5
		  
		  for each s as string in flds
		    
		    pf = new PAF_PrintKit.PrintField(me)
		    
		    pf.Clone(item)
		    
		    pf.Alias = ""
		    
		    pf.left = lastRight
		    
		    lastRight = pf.Right + 5
		    
		    pf.Data = ""
		    
		    pf.FieldName = s
		    
		    item.Band.Items.Append pf
		    
		    pf.Selected = true
		    
		    SelectedItems.Append pf
		    
		  next
		  
		  FindOrphanedItems("Items extended beyond the visible area" + EndOfLine + "They have been confined to the available space")
		  
		  me.Invalidate(false)
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EditBands()
		  dim newBands() as PAF_PrintKit.PrintBand
		  
		  SortBandsByTop(bands)
		  
		  UndoAdd("Add Band(s)")
		  
		  newBands = BandsWin.Setup(oDBWrapper,Bands)
		  
		  if newBands <> nil then
		    
		    Bands = newBands
		    
		    Invalidate(false)
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function EnquoteOrderBy(inString As String) As String
		  Dim outString, sPieces(), sParts(), sOutPart As String
		  
		  sPieces = Split(inString,",")
		  
		  For i as integer = 0 to sPieces.Ubound
		    
		    sParts = Split(Trim(sPieces(i))," ")
		    
		    if sParts.Ubound > 0 then
		      
		      if trim(sParts(1)) = "Desc" then
		        
		        sOutPart = chr(34) + trim(sParts(0)) + chr(34) + " Desc"
		        
		      else
		        
		        sOutPart = chr(34) + trim(sParts(0)) + chr(34)
		        
		      end if
		      
		    else
		      
		      sOutPart = chr(34) + trim(sParts(0)) + chr(34)
		      
		    end if
		    
		    if outString = "" then
		      
		      outString = sOutPart
		      
		    else
		      
		      outString = outString + ", " + sOutPart
		      
		    end if
		    
		  next
		  
		  Return outString
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ExtractFieldNamesFromBand(band as PAF_PrintKit.PrintBand, optional breakFields() as String) As String()
		  dim flds(), sField as String
		  
		  dim pf as PAF_PrintKit.PrintField
		  
		  if breakFields <> nil then
		    flds = breakFields
		  end if
		  
		  For each item as PAF_PrintKit.PrintItem in band.Items
		    
		    if item isa PAF_PrintKit.PrintField then
		      
		      pf = PAF_PrintKit.PrintField(item)
		      
		      if pf.Aggregate <> "" then
		        
		        sField = pf.Aggregate + "(" + pf.FieldName + ") " + chr(34) + pf.alias + chr(34)
		        
		      else
		        
		        sField = pf.FieldName + " " + chr(34) + pf.alias + chr(34)
		        
		      end if
		      
		      if flds.IndexOf(sField) = -1 then
		        
		        flds.Append sField
		        
		      end if
		      
		    end if
		    
		  next
		  
		  // we need to be sure the groupby field in a break band is included even if not on the layout
		  if band.BandType = "Break" or band.BandType = "Trailing" then
		    if band.GroupBy <> "Grand Summary" then
		      if flds.IndexOf(band.GroupBy) = -1 then
		        flds.Insert(0,band.GroupBy)
		      end if
		    end if
		  end if
		  
		  Return flds
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ExtractFieldsFromBand(band As PAF_PrintKit.PrintBand) As PAF_PrintKit.PrintField()
		  dim bandFieldItems() As PAF_PrintKit.PrintField
		  
		  dim trailingBand As PAF_PrintKit.PrintBand
		  
		  For each item as PAF_PrintKit.PrintItem in band.Items
		    
		    if item isa PAF_PrintKit.PrintField then
		      
		      bandFieldItems.append PAF_PrintKit.PrintField(item)
		      
		    end if
		    
		  next
		  
		  if band.BandType = "Break" then
		    
		    trailingBand = GetTrailingBand(bands,band)
		    
		    if trailingBand <> nil then
		      
		      For each item as PAF_PrintKit.PrintItem in trailingBand.Items
		        
		        if item isa PAF_PrintKit.PrintField then
		          
		          bandFieldItems.append PAF_PrintKit.PrintField(item)
		          
		        end if
		        
		      next
		      
		    end if
		    
		  end if
		  
		  Return bandFieldItems
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ExtractTablesFromBand(flds() as String, keyTable as String, where as String) As String()
		  
		  dim tblName, tbls() as String
		  
		  dim r as RegEx
		  
		  dim m as RegExMatch
		  
		  // search each field for the tablename
		  For i as integer = 0 to flds.Ubound
		    
		    r = new regex
		    
		    r.SearchPattern = "(?Umi-s)\b(\w*)\."
		    
		    m = r.Search(flds(i))
		    
		    // use while because a function could reference many fields
		    while m <> nil
		      
		      tblName = m.SubExpressionString(1)
		      
		      if tblName <> keyTable then
		        
		        if tbls.IndexOf(tblName) = -1 then
		          
		          tbls.Append tblName
		          
		        end if
		        
		      end if
		      
		      m = r.search
		      
		    wend
		    
		  next
		  
		  // Extract any tables from where conditions
		  
		  r = new regex
		  
		  r.SearchPattern = "(?Umi-s)\b(\w*)\."
		  
		  m = r.Search(where)
		  
		  while m <> nil
		    
		    tblName = m.SubExpressionString(1)
		    
		    if tblName <> keyTable then
		      
		      if tbls.IndexOf(tblName) = -1 then
		        
		        tbls.Append tblName
		        
		      end if
		      
		    end if
		    
		    m = r.Search
		    
		  wend
		  
		  Return tbls
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub FindOrphanedItems(alertMessage As String)
		  // Looks for items outside the preview area and moves them in
		  
		  dim band as PAF_PrintKit.PrintBand
		  dim item as PAF_PrintKit.PrintItem
		  
		  dim bAlert As Boolean = false
		  
		  For each band in bands
		    
		    For each item in band.Items
		      
		      if item.Left < LeftRightMargin then
		        bAlert = true
		        item.Left = LeftRightMargin
		        'item.Selected = true
		      end if
		      
		      if item.top < TopBottomMargin then
		        bAlert = true
		        item.top = TopBottomMargin
		        'item.Selected = true
		      end if
		      
		      if item.Right > me.Buffer.Width - LeftRightMargin then
		        bAlert = true
		        item.Left = me.Buffer.Width - LeftRightMargin - item.Width
		        'item.Selected = true
		      end if
		      
		      if item.Bottom > me.Buffer.Height - TopBottomMargin then
		        bAlert = true
		        item.top = me.Buffer.Height - TopBottomMargin - item.Height
		        'item.Selected = true
		      end if
		    Next
		    
		  Next
		  
		  if bAlert then
		    
		    MsgBox alertMessage
		    
		  end if
		  
		  me.Invalidate(false)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetBandByType(sType As String) As PAF_PrintKit.PrintBand
		  For i as integer = 0 to Bands.Ubound
		    if bands(i).BandType = sType then
		      Return bands(i)
		    end if
		  Next
		  Return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetHeight() As Double
		  if buffer = nil then
		    
		    break
		    
		  else
		    
		    Return buffer.Height
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetStringWidth(pt as PAF_PrintKit.PrintText) As Integer
		  dim g as Graphics = ScratchGraphics
		  
		  g.TextFont = pt.TextFont
		  g.TextSize = pt.TextSize
		  g.Bold = pt.Bold
		  g.Italic = pt.Italic
		  
		  
		  Return g.StringWidth(pt.Data)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetTextHeight(pt as PAF_PrintKit.PrintText) As Integer
		  dim g as Graphics = ScratchGraphics
		  
		  g.TextFont = pt.TextFont
		  g.TextSize = pt.TextSize
		  
		  Return g.TextHeight
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetTrailingBand(bands() as PAF_PrintKit.PrintBand, band as PAF_PrintKit.PrintBand) As PAF_PrintKit.PrintBand
		  For i as integer = 0 to bands.Ubound
		    
		    if bands(i).BandType = "Trailing" then
		      
		      if bands(i).GroupBy = band.groupby then
		        
		        Return bands(i)
		        
		      end if
		      
		    end if
		    
		  next
		  
		  Return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetWidth() As Double
		  if buffer = nil then
		    
		    break
		    
		  else
		    
		    Return buffer.Width
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function InBand(Y as Integer) As PAF_PrintKit.PrintBand
		  dim i, count as integer
		  
		  count = Bands.Ubound
		  
		  For i = count downto 0
		    
		    if y >= Bands(i).Top and y <= Bands(i).Bottom then
		      
		      if bands(i).Visible or ShowInvisibleItems then
		        
		        Return Bands(i)
		        
		      end if
		      
		    end if
		    
		  Next
		  
		  Return nil
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function InBandIndex(Y as Integer) As Integer
		  dim i, count as integer
		  
		  count = Bands.Ubound
		  
		  For i = count downto 0
		    
		    if y >= Bands(i).Top and y <= Bands(i).Bottom then
		      
		      Return i
		      
		    end if
		    
		    
		    
		  Next
		  
		  Return -1
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IncludesPrintField() As Boolean
		  dim item as PAF_PrintKit.PrintItem
		  
		  For each item in SelectedItems
		    
		    if item IsA PAF_PrintKit.PrintField then Return true
		    
		  Next
		  
		  Return False
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function InItem(X as Integer, Y as Integer) As PAF_PrintKit.PrintItem
		  Dim item as PrintItem
		  Dim itemCount As integer
		  
		  Dim iHalfSize As Integer = kSizingHandleSize/2
		  
		  for each band as printband in bands
		    
		    itemCount = band.items.ubound
		    
		    for i as integer = itemCount DownTo 0
		      
		      item = band.items(i)
		      
		      if item.Selected then
		        
		        // allow for selection handles
		        if x >= item.Left - iHalfSize and x <= item.Left + item.Width + iHalfSize and y >= item.Top - iHalfSize and y <= item.Top + item.Height + iHalfSize then
		          
		          if item.visible or ShowInvisibleItems then
		            
		            Return item
		            
		          end if
		          
		        end if
		        
		      else
		        
		        if x >= item.Left and x <= item.Left + item.Width and y >= item.Top and y <= item.Top + item.Height then
		          
		          if item.visible or ShowInvisibleItems then
		            
		            Return item
		            
		          end if
		          
		        end if
		        
		      end if
		      
		    Next
		    
		  next
		  
		  Return nil
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MinimizeBandSize()
		  Dim dBandTop As Double = OverBand.Top
		  
		  Dim dTallestItem As Double
		  
		  For each item as PrintItem in OverBand.Items
		    
		    item.top = dBandTop + 1
		    
		    dTallestItem = max(dTallestItem,item.Height)
		    
		  next
		  
		  OverBand.Height = dTallestItem + 10
		  
		  AdjustBands
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MoveBackward(item as PAF_PrintKit.PrintItem, items() as PAF_PrintKit.PrintItem)
		  UndoAdd("Move Backward")
		  
		  dim tempItem as PAF_PrintKit.PrintItem
		  
		  dim itemIndex as Integer = items.IndexOf(item)
		  
		  if itemIndex > 0 then
		    
		    tempItem = items(itemIndex)
		    items.Remove(itemIndex)
		    items.Insert(itemIndex - 1,tempItem)
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MoveForward(item as PAF_PrintKit.PrintItem, items() as PAF_PrintKit.PrintItem)
		  UndoAdd("Move Forward")
		  
		  dim tempItem as PAF_PrintKit.PrintItem
		  
		  dim itemIndex as Integer = items.IndexOf(item)
		  
		  if itemIndex < items.Ubound then
		    
		    tempItem = items(itemIndex)
		    items.Remove(itemIndex)
		    items.Insert(itemIndex + 1,tempItem)
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MoveItems(offsetX as Integer, offsetY as Integer)
		  ' update any selected items position
		  dim item as PAF_PrintKit.PrintItem
		  
		  dim limitRight, limitDown as Double
		  
		  'Just to be sure
		  SortBandsByTop(Bands)
		  
		  Dim oSelectionBounds As xojo.Core.Rect = SelectionBounds
		  
		  Dim oWorkspaceBounds As New xojo.Core.Rect(LeftRightMargin,TopBottomMargin,me.Buffer.Width - LeftRightMargin * 2, bands(bands.Ubound).Bottom - TopBottomMargin)
		  
		  limitRight = oWorkspaceBounds.Right - oSelectionBounds.Right
		  limitDown = oWorkspaceBounds.Bottom - oSelectionBounds.Bottom
		  
		  if Keyboard.AsyncShiftKey and DragConstrain = "" then
		    
		    if offsetX <> 0 then
		      
		      DragConstrain = "width"
		      
		    else
		      
		      DragConstrain = "height"
		      
		    end if
		    
		  end if
		  
		  if DragConstrain <> "Height" then
		    
		    if offsetX > 0 then ' dragging to the right
		      
		      if oSelectionBounds.Right < oWorkspaceBounds.Right then
		        
		        For each item in SelectedItems
		          
		          if not item.Locked then
		            
		            item.Move("Right",offsetX,limitRight)
		            
		          end if
		          
		        Next
		        
		      End if
		      
		    else ' dragging to the left
		      
		      if oSelectionBounds.Left > oWorkspaceBounds.Left then
		        
		        For each item in SelectedItems
		          
		          if not item.Locked then
		            
		            item.Move("Left",offsetX,oSelectionBounds.Left - LeftRightMargin)
		            
		          end if
		          
		        Next
		        
		      end if
		      
		    end if
		    
		  end if
		  
		  if DragConstrain <> "Width" then
		    
		    if offsetY > 0 then ' dragging down
		      
		      If oSelectionBounds.Bottom < oWorkspaceBounds.Bottom then
		        
		        For each item in SelectedItems
		          
		          if not item.Locked then
		            item.Move("Down", offsetY, limitDown)
		          end if
		          
		        Next
		        
		      End if
		      
		    else ' dragging up
		      
		      if oSelectionBounds.Top > oWorkspaceBounds.Top then
		        
		        For each item in SelectedItems
		          
		          if not item.Locked then
		            
		            item.Move("Up",offsetY,oSelectionBounds.Top - TopBottomMargin)
		            
		          end if
		          
		        Next
		        
		      End If
		      
		    End If
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MoveToBack(item as PAF_PrintKit.PrintItem, items() as PAF_PrintKit.PrintItem)
		  UndoAdd("Move To Back")
		  
		  dim tempItem as PAF_PrintKit.PrintItem
		  
		  dim itemIndex as Integer = items.IndexOf(item)
		  
		  if itemIndex > 0 then
		    
		    tempItem = items(itemIndex)
		    items.Remove(itemIndex)
		    items.Insert(0,tempItem)
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub MoveToFront(item as PAF_PrintKit.PrintItem, items() as PAF_PrintKit.PrintItem)
		  UndoAdd("Move To Front")
		  
		  dim tempItem as PAF_PrintKit.PrintItem
		  
		  dim itemIndex as Integer = items.IndexOf(item)
		  
		  if itemIndex < items.Ubound then
		    
		    tempItem = items(itemIndex)
		    items.Remove(itemIndex)
		    items.Append tempItem
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub notificationReceived(key as string, value as variant, sender as variant)
		  // Part of the pfReceiver interface.
		  
		  select case key
		    
		  case "RefreshPList"
		    
		    RaiseEvent SelectionChanged(me.selectedItems)
		    
		  case "PListGotFocus"
		    
		    SaveUndoState("Property Change")
		    
		  case "PListChanged"
		    
		    if value.StringValue = "LineColor" or value.StringValue = "LineWidth" or value.StringValue = "FillColor" then
		      
		      For each oItem as PAF_PrintKit.PrintItem in me.SelectedItems
		        
		        if oItem isa PAF_PrintKit.PrintRect then
		          PAF_PrintKit.PrintRect(oItem).ShortsStyle = ""
		        elseif oItem isa PAF_PrintKit.PrintOval then
		          PAF_PrintKit.PrintOval(oItem).ShortsStyle = ""
		        end if
		        
		      next
		      
		    elseif value.StringValue = "Aggregate" then
		      
		      AutoAlias
		      
		    end if
		    
		    RaiseEvent SelectionChanged(me.selectedItems)
		    
		  case "ScriptError"
		    
		    MsgBox value.StringValue
		    
		  end select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub NudgeItems(direction as String)
		  ' update any selected items position
		  dim item as PAF_PrintKit.PrintItem
		  
		  dim leftBounds, topBounds, rightBounds, bottomBounds as Integer
		  
		  for each Item in SelectedItems
		    
		    if not item isA PAF_PrintKit.PrintBand then
		      
		      leftBounds = 0
		      rightBounds = me.Width
		      bottomBounds = item.Band.Bottom
		      topBounds = item.Band.Top
		      
		      if direction = "right" then ' nudge right
		        
		        if item.right < rightBounds then
		          
		          item.Move("Right",1,rightBounds)
		          
		        End if
		        
		      elseif direction = "left" then ' nudge left
		        
		        if item.Left > leftBounds then
		          
		          item.Move("Left",-1,item.Left)
		          
		        end if
		        
		      elseif direction = "down" then ' nudge down
		        
		        If item.Bottom < bottomBounds then
		          
		          item.Move("Down", 1, bottomBounds)
		          
		          AdjustBandMembers
		          
		        End if
		        
		      elseif direction = "up" then ' nudge up
		        
		        if item.Top > topBounds then
		          
		          item.Move("Up",-1,item.Top)
		          
		        End If
		        
		      End If
		      
		    end if
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function OnHandle(y as Integer) As Integer
		  // Find the Report Section handle if mouse is over it
		  
		  
		  dim i as Integer
		  
		  for i = UBound(Bands) downTo 0
		    
		    if y >= Bands(i).Bottom - 11 and Y <= Bands(i).Bottom + 1 then Return i
		    
		  next
		  
		  return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RedoAdd(action as String)
		  dim i as Integer
		  
		  dim u as New ReportUndo
		  
		  u.Action = action
		  
		  for i = 0 to Bands.Ubound
		    u.Bands.Append bands(i).clone
		  Next
		  
		  if UBound(RedoQ) = 25 then
		    RedoQ.Remove(0)
		  end if
		  
		  'MainWin.IsDirty = true
		  RedoQ.Append u
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub RemoveFromSelection()
		  SelectedItems.Remove(SelectedItems.IndexOf(OverBand))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ReportFields() As String()
		  dim aroReportFields() As String
		  
		  for each oBand as PAF_PrintKit.PrintBand in Bands
		    for each oItem as PAF_PrintKit.PrintItem in oBand.Items
		      if oItem isa PAF_PrintKit.PrintField then
		        
		        if aroReportFields.IndexOf(PAF_PrintKit.PrintField(oItem).FieldName) = - 1 then
		          
		          aroReportFields.Append PAF_PrintKit.PrintField(oItem).FieldName
		          
		        end if
		      end if
		    next
		  next
		  
		  Return aroReportFields
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Reset(optional newWidth As Double = 612, optional newHeight As Double = 792, optional dLeftRightMargin As Double = 18, optional dTopBottomMargin As Double = 18)
		  'if buffer = nil or buffer.Width <> newWidth or buffer.Height <> newHeight then
		  me.Buffer = New Picture(newWidth,newHeight)
		  me.LeftRightMargin = dLeftRightMargin
		  me.TopBottomMargin = dTopBottomMargin
		  SetExtent(newWidth, newHeight)
		  'end if
		  
		  For each band as PrintBand in Bands
		    
		    band.width = newWidth
		    
		  Next
		  
		  FindOrphanedItems("Items have been moved to fit the new orientation")
		  
		  RaiseEvent SelectionChanged(me.SelectedItems)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ResizeBand(X as Integer, Y as Integer)
		  if LastY <> Y then
		    
		    dim topBand, bottomBand as PAF_PrintKit.PrintBand
		    dim i, j, moveDelta as integer
		    
		    dim dragLimit As double = me.Buffer.Height - TopBottomMargin
		    dim lowestBandBottom As double = bands(bands.Ubound).Bottom
		    
		    moveDelta = abs(LastY - Y)
		    
		    if DraggingBand = Bands.Ubound then
		      topBand = Bands(DraggingBand)
		      bottomBand = nil
		    else
		      topBand = Bands(DraggingBand)
		      bottomBand = Bands(DraggingBand + 1)
		    end if
		    
		    if Y > LastY then ' (dragging down)
		      
		      if lowestBandBottom < dragLimit then
		        
		        moveDelta = min(moveDelta, dragLimit - lowestBandBottom)
		        
		        ' adjust top section
		        topBand.Height = topBand.Height + moveDelta
		        ' adjust bottom Bands
		        if bottomBand <> nil then
		          for i = DraggingBand + 1 to Bands.Ubound
		            Bands(i).Top = Bands(i).Top + moveDelta
		            for j = 0 to Bands(i).Items.Ubound
		              Bands(i).Items(j).Top = Bands(i).Items(j).Top + moveDelta
		            Next
		          Next
		        end if
		        LastY = Y
		        
		      end if
		      
		    else ' Y is < LastY (dragging up)
		      
		      if topBand.Height - moveDelta >= topBand.MinimumHeight then
		        topBand.Height = topBand.Height - moveDelta
		        for i = DraggingBand + 1 to Bands.Ubound
		          Bands(i).Top = Bands(i).Top - moveDelta
		          for j = 0 to Bands(i).Items.Ubound
		            Bands(i).Items(j).Top = Bands(i).Items(j).Top - moveDelta
		            
		          Next
		        Next
		        LastY = Y
		      else
		        ' to avoid odd dragging behavior due to mouse moving faster than drawing routines
		        if topBand.Height < topBand.MinimumHeight then
		          moveDelta = topBand.Height - topBand.MinimumHeight
		          topBand.Height = topBand.MinimumHeight
		          for i = DraggingBand + 1 to Bands.Ubound
		            Bands(i).Top = Bands(i-1).Top + moveDelta
		            for j = 0 to Bands(i).Items.Ubound
		              Bands(i).Items(j).Top = Bands(i).Items(j).Top + moveDelta
		              
		            Next
		          Next
		        end if
		      end if
		      
		    end if
		    
		    
		    me.Invalidate(false)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ResizeItemLeft(hndl as String, deltaX as Integer, deltaY as Integer)
		  
		  dim item as PAF_PrintKit.PrintItem
		  dim minWidth, minHeight, iRight, iBottom as Integer
		  
		  dim resizeItems() as PAF_PrintKit.PrintItem = me.SelectedItems
		  
		  
		  if Keyboard.AsyncShiftKey and DragConstrain = "" then
		    
		    if deltaX <> 0 then
		      
		      DragConstrain = "width"
		      
		    else
		      
		      DragConstrain = "height"
		      
		    end if
		    
		  end if
		  
		  For theItem as Integer = 0 to resizeItems.Ubound
		    
		    'Item = New PAF_PrintKit.PrintItem
		    
		    item = resizeItems(theItem)
		    
		    minWidth = 10
		    minHeight = 10
		    
		    // Adjustments for Types
		    if item IsA PAF_PrintKit.PrintText then
		      
		      ScratchGraphics.TextFont = PAF_PrintKit.PrintText(item).TextFont
		      ScratchGraphics.TextSize = PAF_PrintKit.PrintText(item).TextSize
		      minHeight = ScratchGraphics.TextHeight
		      
		      if item IsA PAF_PrintKit.PrintField then
		        
		        minWidth = 10 'ScratchGraphics.StringWidth(PAF_PrintKit.PrintField(item).FieldName) + 4
		        
		      end if
		      
		    end if
		    
		    if DragConstrain <> "height" then
		      
		      If deltaX > 0 then ' left handle dragging right
		        
		        if item.Width >= minWidth then
		          
		          item.Left = min(item.Left + deltaX, item.Right - minWidth)
		          item.Width = max(item.Width - deltaX, minWidth)
		          
		        else
		          
		          item.Width = minWidth
		          
		        end if
		        
		      else ' left handle dragging left
		        
		        if item.left >= 0 then
		          
		          iRight = item.Right
		          item.Left = max(LeftRightMargin,item.Left + deltaX)
		          item.Width = iRight - item.Left
		          
		        end if
		        
		      end if
		      
		    end if
		    
		    if DragConstrain <> "width" then
		      
		      if hndl = "UpperLeft" then
		        
		        If deltaY > 0 then ' dragging down
		          
		          if item.Height >= minHeight then
		            
		            item.Top = min(item.Top + deltaY, item.Bottom - minHeight)
		            item.Height = max(item.Height - deltaY, minHeight)
		            
		          else
		            
		            item.Height = minHeight
		            
		          end if
		          
		        else ' dragging up
		          
		          iBottom = item.Bottom
		          item.Top = max(TopBottomMargin, item.Top + deltaY)
		          item.Height = iBottom - item.top
		          
		        end if
		        
		      elseif hndl = "LowerLeft" then
		        
		        If deltaY > 0 then ' dragging down
		          
		          item.Height = min(item.Height + deltaY, bands(bands.Ubound).Bottom - item.top)
		          
		        else ' dragging up
		          
		          if item.Height > minHeight then
		            
		            item.Height = item.Height + deltaY
		            
		          else
		            
		            item.Height = minHeight
		            
		          end if
		          
		        end if
		        
		      end if
		      
		    end if
		  Next
		  
		  if DragConstrain = "" then
		    
		    LastX = LastX + deltaX
		    LastY = LastY + deltaY
		    
		  elseif DragConstrain = "width" then
		    
		    LastX = LastX + deltaX
		    
		  else
		    
		    LastY = LastY + deltaY
		    
		  End if
		  
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ResizeItemRight(hndl as String, deltaX as Integer, deltaY as Integer)
		  dim item as PAF_PrintKit.PrintItem
		  dim minWidth, minHeight, iBottom as Integer
		  
		  dim rightBound, bottomBound as Integer
		  
		  dim resizeItems() as PAF_PrintKit.PrintItem = me.SelectedItems
		  
		  rightBound =  me.Buffer.Width - LeftRightMargin
		  bottomBound = Bands(bands.Ubound).Bottom
		  
		  if Keyboard.AsyncShiftKey and DragConstrain = "" then
		    
		    if deltaX <> 0 then
		      
		      DragConstrain = "width"
		      
		    else
		      
		      DragConstrain = "height"
		      
		    end if
		    
		  end if
		  
		  For theItem as Integer = 0 to resizeItems.Ubound
		    
		    'item = New PAF_PrintKit.PrintItem
		    
		    item = resizeItems(theItem)
		    
		    minWidth = 10
		    minHeight = 10
		    
		    // Adjustments for Types
		    if item IsA PAF_PrintKit.PrintText then
		      
		      ScratchGraphics.TextFont = PAF_PrintKit.PrintText(item).TextFont
		      ScratchGraphics.TextSize = PAF_PrintKit.PrintText(item).TextSize
		      minHeight = ScratchGraphics.TextHeight
		      
		      if item IsA PAF_PrintKit.PrintField then
		        
		        minWidth = 10 'ScratchGraphics.StringWidth(PAF_PrintKit.PrintField(item).FieldName) + 6
		        
		      end if
		      
		      
		    end if
		    
		    If DragConstrain <> "height" then
		      
		      If deltaX > 0 then ' dragging right
		        
		        item.Width = min(item.Width + deltaX, rightBound - item.Left)
		        
		      else ' dragging left
		        
		        if item.Width > minWidth then
		          
		          item.Width = max(item.Width + deltaX, minWidth)
		          
		        else
		          
		          item.Width = minWidth
		          
		        end if
		        
		      end if
		      
		    end if
		    
		    if DragConstrain <> "width" then
		      
		      if hndl = "UpperRight" then
		        
		        If deltaY > 0 then ' dragging down
		          
		          if item.Height > minHeight then
		            
		            item.Top = min(item.top + deltaY, item.Bottom - minHeight)
		            item.Height = max(item.Height - deltaY, minHeight)
		            
		          else
		            
		            item.Top = item.Bottom - minHeight
		            
		          end if
		          
		        else ' dragging up
		          
		          iBottom = item.Bottom
		          item.Top = max(item.Top + deltaY, TopBottomMargin)
		          item.Height = iBottom - Item.Top
		          
		        end if
		        
		      elseif hndl = "LowerRight" then
		        
		        If deltaY > 0 then ' dragging down
		          
		          item.Height = min(item.Height + deltaY, bottomBound - item.Top)
		          
		        else ' dragging up
		          
		          if item.Height > minHeight then
		            
		            item.Height = max(item.Height + deltaY, minHeight)
		            
		          end if
		          
		        end if
		        
		      end if
		      
		    end if
		    
		  Next
		  
		  if DragConstrain = "" then
		    
		    LastX = LastX + deltaX
		    LastY = LastY + deltaY
		    
		  elseif DragConstrain = "width" then
		    
		    LastX = LastX + deltaX
		    
		  else
		    
		    LastY = LastY + deltaY
		    
		  End if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveUndoState(action as String)
		  dim i as Integer
		  
		  dim u as New ReportUndo
		  
		  u.Action = action
		  
		  for i = 0 to Bands.Ubound
		    u.Bands.Append bands(i).Clone
		  Next
		  
		  UndoSaveState = u
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ScrollAdjust(amountX as integer, amountY as integer, sDirection As String, optional oBounds As xojo.Core.Rect)
		  'Just to be sure
		  SortBandsByTop(Bands)
		  
		  dim oTestBounds, oWorkspaceBounds As xojo.Core.Rect
		  
		  if oBounds <> nil then
		    // we are passing in the selection rectangle or a bounds based on bands
		    oTestBounds = oBounds
		  else
		    // calc bounds from selected items
		    oTestBounds = SelectionBounds
		  end if
		  
		  dim oViewableAreaBounds As xojo.Core.Rect = VisibleBounds
		  
		  if DraggingBand = -1 then
		    // we are not resizing bands so the lowest band bottom is our bottom bounds
		    oWorkspaceBounds = new xojo.Core.Rect(LeftRightMargin,TopBottomMargin,me.Buffer.Width - LeftRightMargin * 2, bands(bands.Ubound).Bottom)
		  else
		    // we are resizing a band so our bottom bounds is the page bottom
		    oWorkspaceBounds = new xojo.Core.Rect(LeftRightMargin,TopBottomMargin, me.Buffer.Width - LeftRightMargin * 2, me.Buffer.Height - TopBottomMargin * 2)
		  end if
		  
		  if InStr(sDirection, "Left") > 0 then
		    if (oTestBounds.Left < oViewableAreaBounds.Left) and (oTestBounds.Left >= oWorkspaceBounds.Left) then
		      me.Scrollby(amountX,0)
		    end if
		  end if
		  
		  if InStr(sDirection, "Right") > 0 then
		    if (oTestBounds.Right > oViewableAreaBounds.Right) and (oTestBounds.Right <= oWorkspaceBounds.Right) then
		      me.Scrollby(amountX,0)
		    end if
		  end if
		  
		  if InStr(sDirection, "Up") > 0 then
		    if (oTestBounds.Top < oViewableAreaBounds.Top) and (oTestBounds.Top >= oWorkspaceBounds.Top) then
		      me.Scrollby(0,amountY)
		    end if
		  end if
		  
		  if InStr(sDirection, "Down") > 0 then
		    if (oTestBounds.Bottom > oViewableAreaBounds.Bottom) and (oTestBounds.Bottom <= oWorkspaceBounds.Bottom) then
		      me.Scrollby(0,amountY)
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SelectedItems() As PAF_PrintKit.PrintItem()
		  dim Band as PAF_PrintKit.PrintBand
		  
		  dim item, selItems() as PAF_PrintKit.PrintItem
		  
		  For each band in Bands
		    
		    if band.Selected then selItems.Append band
		    
		    For each item in band.Items
		      
		      if item.Selected then
		        
		        selItems.Append item
		        
		      end if
		      
		    Next
		    
		  Next
		  
		  Return selItems
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SortBandsByTop(aroBands() As PAF_PrintKit.PrintBand)
		  Dim ariTops() As integer
		  
		  For each oBand as PAF_PrintKit.PrintBand in aroBands
		    
		    ariTops.Append oBand.Top
		    
		  Next
		  
		  ariTops.SortWith aroBands
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ToggleItemSelection(item as PAF_PrintKit.PrintItem)
		  
		  If item.Selected then
		    
		    SelectedItems.Remove(SelectedItems.IndexOf(item))
		    item.Selected = false
		    
		  else
		    
		    item.Selected = true
		    SelectedItems.Append item
		    
		  end if
		  
		  if item IsA PAF_PrintKit.PrintBand then
		    item.Locked = true
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UndoAdd(u as ReportUndo)
		  
		  if UBound(undoQ) = 25 then
		    UndoQ.Remove(0)
		  end if
		  
		  'MainWin.IsDirty = true
		  undoQ.Append u
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UndoAdd(action as String)
		  dim i as Integer
		  
		  dim u as New ReportUndo
		  
		  u.Action = action
		  
		  for i = 0 to Bands.Ubound
		    u.Bands.Append Bands(i).Clone
		  Next
		  
		  if UBound(undoQ) = 25 then
		    UndoQ.Remove(0)
		  end if
		  
		  'MainWin.IsDirty = true
		  undoQ.Append u
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateSelectionRectangle(OffsetX as Integer, OffsetY as Integer)
		  If OffsetX <> 0 then
		    
		    SelectionRectItem.Width = SelectionRectItem.Width + OffsetX
		    
		    if SelectionRectItem.Width < 0 then
		      
		    end if
		    
		  end if
		  
		  If OffsetY <> 0 then
		    
		    SelectionRectItem.Height = SelectionRectItem.Height + OffsetY
		    
		    if SelectionRectItem.Height < 0 then
		      
		    end if
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateSQL()
		  AutoAlias
		  
		  dim tbls(), flds(), sql(), sJoin, sWhere, groupBy, orderBy as String
		  
		  dim trailingBand as PAF_PrintKit.PrintBand
		  
		  dim baseTable as String
		  
		  // grab and universal where conditions
		  sWhere = BuildWhereConditions
		  
		  For i as integer = 0 to Bands.Ubound
		    
		    bands(i).sql = ""
		    groupBy = ""
		    
		    'if bands(i).Visible then
		    
		    if bands(i).BandType = "Break" or bands(i).BandType = "Body" or bands(i).BandType = "Grand Summary" then
		      
		      flds = ExtractFieldNamesFromBand(bands(i))
		      
		      if bands(i).BandType = "Break" or bands(i).BandType = "Grand Summary" then
		        
		        trailingBand = GetTrailingBand(bands,bands(i))
		        
		        if trailingBand <> nil then
		          
		          flds = ExtractFieldNamesFromBand(trailingBand, flds())
		          
		        end if
		        // we need to be sure all non aggregate fields are in the groupby clause
		        groupBy = CheckGroupByFields(bands(i))
		        // if grand summary we don't use group by
		        if Bands(i).BandType = "Grand Summary" then groupBy = ""
		      end if
		      
		      if flds.Ubound > -1 then
		        
		        if bands(i).BandType = "Break" then
		          // The base table should be the first table
		          if baseTable = "" then baseTable = NthField(bands(i).groupBy,".",1)
		        elseif Bands(i).BandType = "Grand Summary" then
		          Dim r as new regex
		          dim m as RegExMatch
		          r.SearchPattern = "(?Umi-s)\b(\w*)\."
		          for fldIndex as integer = 0 to flds.Ubound
		            m = r.Search(flds(fldIndex))
		            if m <> nil then
		              baseTable = m.SubExpressionString(1)
		              exit
		            end if
		          next
		          if baseTable = "" then
		            MsgBox "There is a problem with your grand summary. " + endofline + "Either no fields present or non aggregate fields present"
		          end if
		        else
		          if baseTable = "" then baseTable = NthField(flds(0),".",1)
		        end if
		        
		        // make sure we have any trailingBand items before extracting tables
		        tbls = ExtractTablesFromBand(flds,baseTable,sWhere)
		        
		        sJoin = BuildJoins(baseTable, tbls)
		        
		        orderBy = bands(i).OrderBy
		        
		        'if sql.Ubound = -1 then
		        
		        if sWhere = "" then
		          
		          sql.Append "Select " + join(flds,"," + EndOfLine)_
		          + EndOfLine + "From " + baseTable _
		          + EndOfLine + sJoin _
		          + EndOfLine + "Group By " + groupBy
		          
		        else
		          
		          sql.Append "Select " + join(flds,"," + EndOfLine)_
		          + EndOfLine + "From " + baseTable _
		          + EndOfLine + sJoin _
		          + EndOfLine + "Where " + sWhere _
		          + EndOfLine + "Group By " + groupBy
		          
		        end if
		        
		        
		        if bands(i).BandType = "Body" or bands(i).BandType = "Grand Summary" then
		          
		          sql(sql.Ubound) = Replace(sql(sql.Ubound),EndOfLine + "Group By ", "")
		          
		        end if
		        
		        if orderBy <> "" then
		          
		          sql(sql.Ubound) = sql(sql.Ubound) + EndOfLine + "Order By " + orderBy
		          
		        end if
		        
		        if bands(i).BandType = "Break" or bands(i).BandType = "Body" then
		          
		          if bands(i).Limit > 0 then
		            
		            sql(sql.Ubound) = sql(sql.Ubound) + EndOfLine + "Limit " + str(bands(i).Limit)
		            
		          end if
		          
		        end if
		        
		        // Update where for the next band
		        
		        if bands(i).BandType <> "Grand Summary" then
		          
		          if sWhere = "" then
		            
		            sWhere = bands(i).GroupBy + " = ?"
		            
		          else
		            
		            sWhere = sWhere + endofline + "And " + bands(i).GroupBy + " = ?"
		            
		          end if
		          
		        end if
		        
		        bands(i).SQL = sql(sql.Ubound)
		        
		        // want to reset the basetable
		        if bands(i).BandType = "Grand Summary" then
		          baseTable = ""
		        end if
		        
		      end if
		      
		      Redim flds(-1)
		      
		    end if
		    
		    'end if
		  next
		  
		  RaiseEvent SelectionChanged(me.selectedItems)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateStyles()
		  For each band as PrintBand in Bands
		    
		    For each item as PrintItem in band.Items
		      
		      if item isa PrintText then
		        
		        if Not DictStyles.HasKey(PrintText(item).ShortsStyle) then
		          
		          PrintText(item).ApplyStyle(DictStyles.Value("DefaultStyle"))
		          
		        end if
		        
		      elseif item isa PrintRect then
		        
		        if Not DictStyles.HasKey(PrintRect(item).ShortsStyle) then
		          
		          PrintRect(item).ApplyStyle(DictStyles.Value("DefaultStyle"))
		          
		        end if
		        
		      elseif item isa PrintOval then
		        
		        if Not DictStyles.HasKey(PrintOval(item).ShortsStyle) then
		          
		          PrintOval(item).ApplyStyle(DictStyles.Value("DefaultStyle"))
		          
		        end if
		        
		      end if
		      
		    next
		    
		  next
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook

	#tag Hook, Flags = &h0
		Event SelectionChanged(selectedItems() as PAF_PrintKit.PrintItem)
	#tag EndHook


	#tag Property, Flags = &h21
		Private AliasDict As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		Bands() As PAF_PrintKit.PrintBand
	#tag EndProperty

	#tag Property, Flags = &h21
		Private BandsIndexDict As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Buffer As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private DownX As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private DownY As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private DragConstrain As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private DraggingBand As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private DragType As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Initialized As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		InitialState As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LastX As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LastY As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		LeftRightMargin As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		oDBWrapper As PAF_DatabaseKit.DBWrapper
	#tag EndProperty

	#tag Property, Flags = &h21
		Private oProgressWheel As ProgressWheel
	#tag EndProperty

	#tag Property, Flags = &h21
		Private OverBand As PAF_PrintKit.PrintBand
	#tag EndProperty

	#tag Property, Flags = &h21
		Private OverItem As PAF_PrintKit.PrintItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PrintScale As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private QualityScale As Double = 1.0
	#tag EndProperty

	#tag Property, Flags = &h0
		RedoQ() As ReportUndo
	#tag EndProperty

	#tag Property, Flags = &h0
		ReportName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ReportPath As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim dLeft, dTop, dRight, dBottom As Double
			  
			  dLeft = 100000
			  dTop = 100000
			  
			  // Get the leftmost, topmost, rightmost and bottommost edge of the selection
			  for each Item as PAF_PrintKit.PrintItem in SelectedItems
			    
			    if not item isA PAF_PrintKit.PrintBand then
			      
			      dLeft = min(dLeft, item.Left)
			      dTop = min(dTop, item.Top)
			      dRight = max(dRight, item.Right)
			      dBottom = max(dBottom, item.Bottom)
			      
			    end if
			    
			  next
			  
			  Return new xojo.Core.Rect(dLeft, dTop, dRight - dLeft, dBottom - dTop)
			End Get
		#tag EndGetter
		SelectionBounds As xojo.Core.Rect
	#tag EndComputedProperty

	#tag Property, Flags = &h21
		Private SelectionRectItem As PAF_PrintKit.PrintItem
	#tag EndProperty

	#tag Property, Flags = &h0
		ShowBoundaries As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		ShowInvisibleItems As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		TopBottomMargin As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		UndoQ() As ReportUndo
	#tag EndProperty

	#tag Property, Flags = &h0
		UndoSaveState As ReportUndo
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return new xojo.Core.Rect(abs(xOrigin), abs(yOrigin), me.Width, me.Height)
			End Get
		#tag EndGetter
		VisibleBounds As xojo.Core.Rect
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		WhereConditions() As PAFQueryCondition
	#tag EndProperty


	#tag Constant, Name = kBackspaceKey, Type = Double, Dynamic = False, Default = \"&h33", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDeleteKey, Type = Double, Dynamic = False, Default = \"&h75", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kDownArrow, Type = Double, Dynamic = False, Default = \"&h7d", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kLeftArrow, Type = Double, Dynamic = False, Default = \"&h7b", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kRightArrow, Type = Double, Dynamic = False, Default = \"&h7c", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kUpArrow, Type = Double, Dynamic = False, Default = \"&h7e", Scope = Public
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="extentHeight"
			Group="Behavior"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="extentWidth"
			Group="Behavior"
			Type="integer"
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
			Name="HScrollBarName"
			Visible=true
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Initialized"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LeftRightMargin"
			Group="Behavior"
			Type="Double"
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
			Name="ReportName"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReportPath"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowBoundaries"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ShowInvisibleItems"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
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
			Name="Top"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TopBottomMargin"
			Group="Behavior"
			Type="Double"
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
			Name="VScrollBarName"
			Visible=true
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="xOrigin"
			Group="Behavior"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="yOrigin"
			Group="Behavior"
			Type="integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
