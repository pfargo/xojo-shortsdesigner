#tag Class
Protected Class PrintOval
Inherits PAF_PrintKit.PrintItem
	#tag Method, Flags = &h0
		Sub ApplyStyle(oStyle as PAF_PrintKit.PrintStyle)
		  me.LineColor = oStyle.LineColor
		  me.LineWidth = oStyle.LineWidth
		  me.FillColor = oStyle.FillColor
		  
		  me.ShortsStyle = oStyle.name
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Clone(item as PAF_PrintKit.PrintItem)
		  super.Clone(item)
		  
		  me.ShortsStyle = PAF_PrintKit.PrintOval(item).ShortsStyle
		  me.LineColor = PAF_PrintKit.PrintOval(item).LineColor
		  me.LineWidth = PAF_PrintKit.PrintOval(item).LineWidth
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub constructor(iLeft as double, iTop as double, iWidth as double, iHeight as Double, oDesigner As PAF_PrintKit.DesignCanvas)
		  super.Constructor(oDesigner)
		  
		  me.Left = iLeft
		  me.top = itop
		  me.Width = iWidth
		  me.Height = iHeight
		  me.FillColor = &cFFFFFFFF
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(jItem as JSONItem, oDesigner As PAF_PrintKit.DesignCanvas)
		  super.Constructor(oDesigner)
		  
		  dim oStyle as PrintStyle
		  dim jPosition as JSONItem
		  dim styleName As String
		  
		  Visible = jItem.Lookup("visible",True).BooleanValue
		  UID = jItem.Lookup("uid","").StringValue.DefineEncoding(Encodings.UTF8)
		  
		  styleName = jItem.Lookup("style","DefaultStyle").StringValue.DefineEncoding(Encodings.UTF8)
		  
		  oStyle = DictStyles.Lookup(styleName,DictStyles.Value("DefaultStyle"))
		  
		  ApplyStyle(oStyle)
		  
		  jPosition = jItem.Lookup("position",nil)
		  
		  if jPosition <> nil then
		    
		    left = jPosition.Value(0)
		    top = jPosition.Value(1)
		    Width = jPosition.Value(2)
		    Height = jPosition.Value(3)
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub constructor(oDesigner As PAF_PrintKit.DesignCanvas)
		  super.Constructor(oDesigner)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw(g as Graphics, Scale as Double, xOffset As Double, yOffset As Double)
		  Dim oOval As New OvalShape
		  
		  // drawn as an object2d Ovalshape which has its origin at the center
		  
		  dim xPos as double = (me.left + me.Width/2 + xOffset) * scale
		  dim yPos as double = (me.top + me.Height/2 + yOffset) * scale
		  
		  oOval.Width = Width
		  oOval.Height = Height
		  oOval.Border = 100
		  oOval.BorderWidth = LineWidth
		  oOval.BorderColor = LineColor
		  oOval.FillColor = FillColor
		  
		  g.DrawObject(oOval, xPos, yPos)
		  
		  super.Draw(g,Scale, xOffset, yOffset)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTemplate(oDBWrapper as PAF_DatabaseKit.DBWrapper) As PAF_PropertyListKit.ListItem()
		  // Part of the PListUpdatable interface.
		  
		  dim item, items() as PAF_PropertyListKit.ListItem
		  
		  Items.Append new PAF_PropertyListKit.SectionProperty("ID")
		  Items.Append New PAF_PropertyListKit.TextProperty("UID", me.UID)
		  
		  Items.Append New PAF_PropertyListKit.SectionProperty("Position")
		  
		  item = New PAF_PropertyListKit.TextProperty("Left", str(me.Left))
		  PAF_PropertyListKit.TextProperty(item).BlankAllowed = false
		  Items.Append item
		  
		  item = New PAF_PropertyListKit.TextProperty("Top", str(me.Top))
		  PAF_PropertyListKit.TextProperty(item).BlankAllowed = false
		  Items.Append item
		  
		  item = New PAF_PropertyListKit.TextProperty("Width", str(me.Width))
		  PAF_PropertyListKit.TextProperty(item).BlankAllowed = false
		  Items.Append item
		  
		  item = New PAF_PropertyListKit.TextProperty("Height", str(me.Height))
		  PAF_PropertyListKit.TextProperty(item).BlankAllowed = false
		  Items.Append item
		  
		  Items.Append New PAF_PropertyListKit.SectionProperty("Appearance")
		  Items.Append New PAF_PropertyListKit.CheckboxProperty("Visible", me.Visible)
		  Items.Append New PAF_PropertyListKit.ColorProperty("LineColor",me.LineColor)
		  Items.Append New PAF_PropertyListKit.ColorProperty("FillColor",me.FillColor)
		  Items.Append New PAF_PropertyListKit.TextProperty("LineWidth",me.LineWidth)
		  
		  
		  For i as Integer = 0 to Items.Ubound
		    
		    Items(i).PropertyObjects.Append Self
		    
		  Next
		  
		  Return items
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTemplateMultiple(oDBWrapper as PAF_DatabaseKit.DBWrapper) As PAF_PropertyListKit.ListItem()
		  // Part of the PListUpdatable interface.
		  
		  dim item, items() as PAF_PropertyListKit.ListItem
		  
		  'Items.Append new PAF_PropertyListKit.SectionProperty("ID")
		  'Items.Append New PAF_PropertyListKit.TextProperty("UID", me.UID)
		  
		  Items.Append New PAF_PropertyListKit.SectionProperty("Position")
		  
		  item = New PAF_PropertyListKit.TextProperty("Left", str(me.Left))
		  PAF_PropertyListKit.TextProperty(item).BlankAllowed = false
		  Items.Append item
		  
		  item = New PAF_PropertyListKit.TextProperty("Top", str(me.Top))
		  PAF_PropertyListKit.TextProperty(item).BlankAllowed = false
		  Items.Append item
		  
		  item = New PAF_PropertyListKit.TextProperty("Width", str(me.Width))
		  PAF_PropertyListKit.TextProperty(item).BlankAllowed = false
		  Items.Append item
		  
		  item = New PAF_PropertyListKit.TextProperty("Height", str(me.Height))
		  PAF_PropertyListKit.TextProperty(item).BlankAllowed = false
		  Items.Append item
		  
		  Items.Append New PAF_PropertyListKit.SectionProperty("Appearance")
		  Items.Append New PAF_PropertyListKit.CheckboxProperty("Visible", me.Visible)
		  Items.Append New PAF_PropertyListKit.ColorProperty("LineColor",me.LineColor)
		  Items.Append New PAF_PropertyListKit.ColorProperty("FillColor",me.FillColor)
		  Items.Append New PAF_PropertyListKit.TextProperty("LineWidth",me.LineWidth)
		  
		  
		  For i as Integer = 0 to Items.Ubound
		    
		    Items(i).PropertyObjects.Append Self
		    
		  Next
		  
		  Return items
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SerializeJSON() As JSONItem
		  dim jOut as New JSONItem
		  dim jPosition as New JSONItem
		  
		  jOut.Value("type") = "oval"
		  
		  jOut.Value("visible") = me.Visible
		  
		  jOut.Value("uid") = me.UID
		  
		  jPosition.Append me.Left
		  
		  // adjust top
		  jPosition.Append me.Top - me.Band.Top
		  
		  jPosition.Append me.Width
		  jPosition.Append me.Height
		  
		  jOut.Value("position") = jPosition
		  
		  jOut.Value("style") = me.ShortsStyle
		  
		  Return jOut
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		LineColor As Color = &c00000000
	#tag EndProperty

	#tag Property, Flags = &h0
		LineWidth As Double = 1.0
	#tag EndProperty

	#tag Property, Flags = &h0
		ShortsStyle As String
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
			Name="LineColor"
			Group="Behavior"
			InitialValue="&c00000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LineWidth"
			Group="Behavior"
			InitialValue="1.0"
			Type="Double"
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
			Name="ShortsStyle"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
