#tag Class
Protected Class PrintItem
Implements PListUpdatable
	#tag Method, Flags = &h0
		Sub Clone(item as PAF_PrintKit.PrintItem)
		  Designer = PAF_PrintKit.PrintItem(item).Designer
		  FillColor = PAF_PrintKit.PrintItem(item).FillColor
		  ForeColor = PAF_PrintKit.PrintItem(item).ForeColor
		  Height = PAF_PrintKit.PrintItem(item).Height
		  Left = PAF_PrintKit.PrintItem(item).Left
		  Locked = PAF_PrintKit.PrintItem(item).Locked
		  Band = PAF_PrintKit.PrintItem(item).Band
		  ParentID = PAF_PrintKit.PrintItem(item).ParentID
		  selected = PAF_PrintKit.PrintItem(item).Selected
		  Top = PAF_PrintKit.PrintItem(item).Top
		  Width = PAF_PrintKit.PrintItem(item).Width
		  Visible = PAF_PrintKit.PrintItem(item).Visible
		  UID = PAF_PrintKit.PrintItem(item).UID
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(oDesigner As PAF_PrintKit.DesignCanvas)
		  Designer = oDesigner
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw(g as Graphics, Scale as Double, xOffset As Double, yOffset As Double)
		  if Selected then
		    
		    DrawSelectionRect(g,scale, xOffset, yOffset)
		    
		  else
		    
		    if designer.ShowBoundaries or me isa PrintSelectionRect then
		      
		      DrawBoundaryRect(g,scale, xOffset, yOffset)
		      
		    end if
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawBoundaryRect(g as Graphics, scale as Double, xOffset As double, yOffset As Double)
		  
		  dim c as Color = g.ForeColor
		  
		  If not me isA PAF_PrintKit.PrintBand and not me isa PrintRect then
		    
		    g.ForeColor = &cA7A7A7
		    
		    g.DrawRect((Left + xOffset) * scale, (Top + yOffset) * scale, Width * scale, Height * scale)
		    
		  end if
		  
		  g.ForeColor = c
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawSelectionRect(g as Graphics, scale as Double, xOffset as double, yOffset as double)
		  
		  if Selected and not me IsA PAF_PrintKit.PrintBand then
		    dim handleOffset, handleSize as Integer
		    handleOffset = kSizingHandleSize/2 * Scale
		    handleSize = kSizingHandleSize * scale
		    
		    If me isA PAF_PrintKit.PrintBand then
		      g.ForeColor = &c0000FF
		    else
		      g.ForeColor = &c000000
		    end if
		    
		    if not me isa PrintRect then
		      g.DrawRect((Left + xOffset) * scale, (Top + yOffset) * scale, Width * scale, Height * scale)
		    end if
		    
		    g.ForeColor = &c2F26FA
		    
		    g.FillRect((Left + xOffset) * Scale - handleOffset , (Top + yOffset) * Scale - handleOffset, handleSize, handleSize)
		    g.FillRect((Left + xOffset) * Scale - handleOffset, (Top + yOffset) * Scale + Height * Scale - handleOffset, handleSize, handleSize)
		    g.FillRect((Left + xOffset) * Scale + Width * Scale - handleOffset, (Top + yOffset) * Scale - handleOffset, handleSize, handleSize)
		    g.FillRect((Left + xOffset) * Scale + Width * Scale - handleOffset, (Top + yOffset) * Scale + Height * Scale - handleOffset, handleSize, handleSize)
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTemplate(oDBWrapper as PAF_DatabaseKit.DBWrapper) As PAF_PropertyListKit.ListItem()
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTemplateMultiple(oDBWrapper as PAF_DatabaseKit.DBWrapper) As PAF_PropertyListKit.ListItem()
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InBand(band as PAF_PrintKit.PrintBand) As Boolean
		  Return Left > band.Left and Top > band.Top and me.Right < band.Right and me.Bottom < band.Bottom
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function InSelection(sRect as PAF_PrintKit.PrintSelectionRect) As Boolean
		  dim l, t, r, b as Integer
		  
		  if sRect.Width >= 0 then
		    l = sRect.Left
		    r = sRect.Right
		  else
		    l = sRect.Left + sRect.Width
		    r = l + abs(sRect.Width)
		  end if
		  
		  if sRect.Height >= 0 then
		    t = sRect.Top
		    b = sRect.Bottom
		  else
		    t = sRect.Top + sRect.Height
		    b = t + abs(sRect.Height)
		  end if
		  
		  Return Left > l and Top > t and me.Right < r and me.Bottom < b
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Move(direction as String, offset as Integer, limit as Integer)
		  
		  If direction = "Right" then
		    
		    me.Left =  min(me.Left + offset, me.Left + limit)
		    
		  elseif direction = "Left" then
		    
		    me.Left = max(me.Left + offset, me.Left - limit)
		    
		  elseif direction = "Down" then
		    
		    me.top = min(me.top + offset, me.Top + limit)
		    
		  elseif direction = "Up" then
		    
		    me.top = max(me.top + offset, me.top - limit)
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function OnSizingHandle(X as Integer, Y as Integer) As String
		  dim iHalfSize As Integer = kSizingHandleSize/2
		  
		  
		  if X >= me.Left - iHalfSize and X <= me.Left + iHalfSize then
		    If Y >= me.Top - iHalfSize and Y <= me.Top + iHalfSize then
		      Return "UpperLeft"
		    elseif Y >= me.Top + me.Height -iHalfSize and Y <= me.Top + me.Height + iHalfSize then
		      Return "LowerLeft"
		    end if
		  elseif X >= me.Left + me.Width -iHalfSize and X <= me.Left + me.Width + iHalfSize then
		    If Y >= me.Top - iHalfSize and Y <= me.Top + iHalfSize then
		      Return "UpperRight"
		    elseif Y >= me.Top + me.Height -iHalfSize and Y <= me.Top + me.Height + iHalfSize then
		      Return "LowerRight"
		    end if
		  end if
		  
		  
		  Return ""
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Output(Optional rowName as String) As String
		  dim output, cProps() as String
		  
		  dim pName as String
		  dim pValue as Variant
		  
		  dim typ as Introspection.TypeInfo
		  
		  dim prop, Props() as Introspection.PropertyInfo
		  
		  dim obj as Object = me
		  
		  typ = Introspection.GetType(obj)
		  
		  if rowName <> "" then
		    output = rowName + "&" + typ.FullName
		  else
		    output = typ.FullName
		  end if
		  
		  
		  Props = typ.GetProperties
		  
		  for each prop in Props
		    
		    if prop.PropertyType.isPrimitive then
		      
		      pName = prop.name
		      pValue = prop.Value(obj)
		      
		      cProps.Append pName + "^^" + ReplaceAll(pValue, EndOfLine, "\n")
		      
		    end if
		    
		  Next
		  
		  return Output + "||" + join(cProps, "__")
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Print(g as Graphics)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ValueChanged(sCaption as String, bDoneFlag as Boolean)
		  'MainWindow.DesignSpace.Designer.Invalidate
		  
		  if bDoneFlag then
		    Designer.UndoSaveState.action = sCaption + " Change"
		    Designer.UndoAdd(Designer.UndoSaveState)
		    Designer.SaveUndoState("")
		  end if
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Band As PAF_PrintKit.PrintBand
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.Top + me.Height
			End Get
		#tag EndGetter
		Bottom As Double
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Designer As DesignCanvas
	#tag EndProperty

	#tag Property, Flags = &h0
		FillColor As Color = &cFFFFFF
	#tag EndProperty

	#tag Property, Flags = &h0
		ForeColor As Color = &c000000
	#tag EndProperty

	#tag Property, Flags = &h0
		Height As Double = 14
	#tag EndProperty

	#tag Property, Flags = &h0
		Left As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		Locked As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		ParentID As Integer
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Return me.Left + me.Width
			End Get
		#tag EndGetter
		Right As Double
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Selected As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Top As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		UID As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Visible As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		Width As Double = 100
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Bottom"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="FillColor"
			Group="Behavior"
			InitialValue="&cFFFFFF"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ForeColor"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Group="Behavior"
			InitialValue="14"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Locked"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ParentID"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Right"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Selected"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="UID"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Group="Behavior"
			InitialValue="100"
			Type="Double"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
