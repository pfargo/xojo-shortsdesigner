#tag Class
Protected Class PrintImage
Inherits PAF_PrintKit.PrintItem
	#tag Method, Flags = &h0
		Sub Clone(item as PAF_PrintKit.PrintItem)
		  super.Clone(item)
		  
		  Image = PAF_PrintKit.PrintImage(item).Image
		  Name = PAF_PrintKit.PrintImage(item).Name
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(jItem as JSONItem, oDesigner As PAF_PrintKit.DesignCanvas)
		  super.Constructor(oDesigner)
		  
		  dim jPosition as JSONItem
		  
		  Name = jItem.Lookup("name","").StringValue.DefineEncoding(Encodings.UTF8)
		  Visible = jItem.Lookup("visible",True).BooleanValue
		  UID = jItem.Lookup("uid","").StringValue.DefineEncoding(Encodings.UTF8)
		  
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
		Sub Draw(g as Graphics, scale as Double, xOffset As double, yOffset As Double)
		  #pragma DisableBackgroundTasks
		  #pragma DisableBoundsChecking
		  
		  Image = PAF_PrintKit.ResolveImage(Name)
		  
		  dim xPos as double = (me.left + xOffset) * scale
		  dim yPos as double = (me.top + yOffset) * scale
		  
		  
		  if Image <> nil then
		    
		    g.DrawPicture(Image,xPos, yPos, me.Width * scale, me.Height * scale, 0, 0, Image.Width, Image.Height)
		    
		  end if
		  
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
		  
		  Items.Append New PAF_PropertyListKit.SectionProperty("Image")
		  
		  Items.Append New PAF_PropertyListKit.MenuProperty("Name", me.Name, GetImageNames)
		  
		  For i as Integer = 0 to Items.Ubound
		    
		    Items(i).PropertyObjects.Append Self
		    
		  Next
		  
		  Return items
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTemplateMultiple(oDBWrapper as PAF_DatabaseKit.DBWrapper) As PAF_PropertyListKit.ListItem()
		  // Part of the PListUpdatable interface.
		  
		  dim item,items() as PAF_PropertyListKit.ListItem
		  
		  ' Items.Append new PAF_PropertyListKit.SectionProperty("ID")
		  ' Items.Append New PAF_PropertyListKit.TextProperty("UID", me.UID)
		  
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
		  
		  jOut.Value("type") = "image"
		  
		  jOut.Value("name") = me.Name
		  
		  jOut.Value("visible") = me.Visible
		  
		  jOut.Value("uid") = me.UID
		  
		  jPosition.Append me.Left
		  
		  // adjust top
		  jPosition.Append me.Top - me.Band.Top
		  
		  jPosition.Append me.Width
		  jPosition.Append me.Height
		  
		  
		  
		  jOut.Value("position") = jPosition
		  
		  Return jOut
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Image As Picture
	#tag EndProperty

	#tag Property, Flags = &h0
		Name As String
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
			Name="Image"
			Group="Behavior"
			Type="Picture"
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
