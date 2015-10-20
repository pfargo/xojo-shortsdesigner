#tag Class
Protected Class PrintText
Inherits PAF_PrintKit.PrintItem
	#tag Method, Flags = &h0
		Sub ApplyStyle(oStyle as PAF_PrintKit.PrintStyle)
		  me.TextFont = oStyle.TextFont
		  me.TextSize = oStyle.TextSize
		  me.Bold = oStyle.Bold
		  me.Italic = oStyle.Italic
		  me.Underline = oStyle.Underline
		  
		  if oStyle.TextAlign = "Left" then
		    me.Alignment = 1
		  elseif oStyle.TextAlign = "Center" then
		    me.Alignment = 2
		  elseif oStyle.TextAlign = "Right" then
		    me.Alignment = 3
		  else
		    me.Alignment = 0
		  end if
		  
		  me.ForeColor = oStyle.TextColor
		  me.FillColor = oStyle.FillColor
		  
		  me.ShortsStyle = oStyle.name
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CalcHeight(g as Graphics) As Integer
		  #pragma DisableBackgroundTasks
		  
		  dim lines() as String
		  dim numlines as integer
		  
		  
		  g.Bold = Bold
		  g.Italic = Italic
		  g.Underline = Underline
		  g.TextFont = TextFont
		  g.TextSize = TextSize
		  
		  lines = g.GetWrapLines(Data, Width)
		  
		  numLines = min(lines.Ubound + 1, MaxLines)
		  
		  If CanGrow then
		    
		    Return max(g.TextHeight,( g.TextHeight * numlines))
		    
		  end if
		  
		  
		  // Allows for shrinking section
		  
		  if g.TextHeight * numlines < Height then
		    
		    Return g.TextHeight * numlines
		    
		  else
		    
		    Return max(me.Height, g.TextHeight)
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CalcWidth(g as Graphics) As Integer
		  #pragma DisableBackgroundTasks
		  
		  dim lines() as String
		  
		  g.Bold = Bold
		  g.Italic = Italic
		  g.Underline = Underline
		  g.TextFont = TextFont
		  g.TextSize = TextSize
		  
		  lines = g.GetWrapLines(Data, Width)
		  
		  if lines.Ubound = -1 then Return -1
		  
		  if lines.Ubound = 0 then
		    
		    Return g.StringWidth(lines(0))
		    
		  else
		    
		    dim s as String
		    
		    dim longest as Integer
		    
		    For each s in Lines
		      
		      longest = max(longest, g.StringWidth(s))
		      
		    Next
		    
		    
		    Return longest
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Clone(item as PAF_PrintKit.PrintItem)
		  super.Clone(item)
		  
		  Alignment = PAF_PrintKit.PrintText(item).Alignment
		  bold = PAF_PrintKit.PrintText(item).Bold
		  CanGrow = PAF_PrintKit.PrintText(item).CanGrow
		  data = PAF_PrintKit.PrintText(item).Data
		  Italic = PAF_PrintKit.PrintText(item).Italic
		  MaxLines = PAF_PrintKit.PrintText(item).MaxLines
		  ShortsStyle = PAF_PrintKit.PrintText(item).ShortsStyle
		  TextFont = PAF_PrintKit.PrintText(item).TextFont
		  TextSize = PAF_PrintKit.PrintText(item).TextSize
		  Underline = PAF_PrintKit.PrintText(item).Underline
		  UID = PAF_PrintKit.PrintText(item).UID
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(jItem as JSONItem, oDesigner As PAF_PrintKit.DesignCanvas)
		  Super.Constructor(oDesigner)
		  
		  dim oStyle as PrintStyle
		  dim jPosition as JSONItem
		  dim styleName As string
		  
		  Data = jItem.Lookup("data","").StringValue.DefineEncoding(Encodings.UTF8)
		  Visible = jItem.Lookup("visible",True).BooleanValue
		  CanGrow = jItem.Lookup("canGrow",False).BooleanValue
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

	#tag Method, Flags = &h0
		Sub constructor(oDesigner As PAF_PrintKit.DesignCanvas)
		  super.Constructor(oDesigner)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw(g as Graphics, scale as Double, xOffset As double, yOffset As Double)
		  #pragma DisableBackgroundTasks
		  #pragma DisableBoundsChecking
		  
		  dim line, lines(), drawText as String
		  dim lineWidth, topLine1, topLine2Plus, leftPosition, lineIndex, numLines as Integer
		  
		  Dim gItem As Graphics = g.clip (me.Left+xOffset, me.top+yOffset, me.Width, me.Height)
		  
		  gItem.Bold = Bold
		  gItem.Italic = Italic
		  gItem.Underline = Underline
		  gItem.TextFont = TextFont
		  gItem.TextSize = TextSize * Scale
		  gItem.ForeColor = ForeColor
		  
		  drawText = me.Data
		  lines = gItem.GetWrapLines(drawText, Width * Scale)
		  
		  if lines(0) = "" then lines(0) = drawText
		  
		  height = height * Scale
		  if height < gItem.TextHeight then height = gItem.TextHeight
		  
		  dim linesThatFit as Integer = ( Height  ) / gItem.TextHeight
		  
		  numLines = min(lines.Ubound + 1, linesThatFit)
		  if numLines < lines.Ubound + 1 then
		    Redim lines(numLines - 1)
		  end if
		  
		  if not visible then
		    gItem.ForeColor = &cD0D7FF00
		    
		    For i as integer = 0 to gItem.Width - 10 step 10
		      gItem.DrawLine i, 0, i + 10, gItem.Height
		    next
		    
		    For i as integer = 10 to gItem.Width step 10
		      gItem.DrawLine i, 0, i - 10, gItem.Height
		    next
		    
		  else
		    
		    if FillColor <> &cFFFFFFFF and FillColor <> &cFFFFFF00 then
		      gItem.ForeColor = FillColor
		      gItem.FillRect(0, 0, gItem.Width * scale, gItem.height * scale)
		      gItem.ForeColor = ForeColor
		    end if
		    
		    lineIndex = 1
		    topLine1 = gItem.TextHeight - (gItem.TextHeight-gItem.TextAscent)
		    
		    For each line in Lines
		      topLine2Plus = topLine1 + gItem.TextHeight * (lineIndex - 1)
		      lineWidth = gItem.StringWidth(line)
		      
		      while gItem.StringWidth(line) > me.Width
		        line = mid(line,2)
		      wend
		      
		      if Alignment = 0 or Alignment = 1 then
		        
		        if lineIndex = 1 then
		          gItem.DrawString(line, 0 , topLine1)
		        else
		          gItem.DrawString(line, 0 , topLine2Plus)
		        end if
		        
		      elseif Alignment = 2 then
		        
		        if lineWidth > me.Width then
		          leftPosition = ((width * Scale) /2) - (me.Width/2)
		        else
		          leftPosition = ((width * Scale) /2) - (lineWidth/2)
		        end if
		        
		        if lineIndex = 1 then
		          gItem.DrawString(line, leftPosition, topLine1)
		        else
		          gItem.DrawString(line, leftPosition, topLine2Plus)
		        end if
		        
		      else ' right
		        
		        if lineWidth > me.Width then
		          leftPosition = width * Scale - me.Width
		        else
		          leftPosition = width * Scale - lineWidth
		        end if
		        
		        if lineIndex = 1 then
		          gItem.DrawString(line, leftPosition, topLine1)
		        else
		          gItem.DrawString(line, leftPosition, topLine2Plus)
		        end if
		        
		      end if
		      
		      lineIndex = lineIndex + 1
		    Next
		    
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
		  items.Append New PAF_PropertyListKit.ColorProperty("ForeColor",me.ForeColor)
		  items.Append New PAF_PropertyListKit.ColorProperty("FillColor",me.FillColor)
		  Items.Append New PAF_PropertyListKit.CheckboxProperty("Visible", me.Visible)
		  
		  Items.Append New PAF_PropertyListKit.SectionProperty("Font")
		  
		  if InstalledFonts = nil then
		    InstalledFonts = new MenuItem
		    dim nFonts as Integer
		    nFonts=FontCount-1
		    //build the font menu
		    For i as Integer=0 to nFonts
		      InstalledFonts.Append new MenuItem(font(i))
		    Next
		  end if
		  
		  Items.Append New PAF_PropertyListKit.MenuProperty("TextFont", me.TextFont, InstalledFonts)
		  item = New PAF_PropertyListKit.TextProperty("TextSize", str(me.TextSize))
		  PAF_PropertyListKit.TextProperty(item).BlankAllowed = false
		  Items.Append item
		  Items.Append New PAF_PropertyListKit.CheckboxProperty("Bold", me.Bold)
		  Items.Append New PAF_PropertyListKit.CheckboxProperty("Italic", me.Italic)
		  Items.Append New PAF_PropertyListKit.CheckboxProperty("Underline", me.Underline)
		  
		  Static oAlignmentDict as New Dictionary
		  
		  oAlignmentDict.Value(0) = "Default"
		  oAlignmentDict.Value(1) = "Left"
		  oAlignmentDict.Value(2) = "Center"
		  oAlignmentDict.Value(3) = "Right"
		  items.Append New PAF_PropertyListKit.EnumProperty("Alignment", oAlignmentDict.Lookup(me.Alignment, "Default"), oAlignmentDict)
		  
		  'item = new PAF_PropertyListKit.TextProperty("ShortsStyle", me.ShortsStyle)
		  'PAF_PropertyListKit.TextProperty(item).ReadOnly = True
		  'items.Append item
		  
		  items.Append New PAF_PropertyListKit.SectionProperty("Display Value")
		  
		  item = New PAF_PropertyListKit.TextProperty("Data", me.Data)
		  PAF_PropertyListKit.TextProperty(item).IsTextArea = true
		  if me isa PAF_PrintKit.PrintField then
		    PAF_PropertyListKit.TextProperty(item).ReadOnly = true
		  end if
		  items.Append item
		  
		  items.Append New PAF_PropertyListKit.SectionProperty("Behavior")
		  items.Append New PAF_PropertyListKit.CheckboxProperty("CanGrow", me.CanGrow)
		  'items.Append New PAF_PropertyListKit.TextProperty("Format", me.For)
		  
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
		  items.Append New PAF_PropertyListKit.ColorProperty("ForeColor",me.ForeColor)
		  items.Append New PAF_PropertyListKit.ColorProperty("FillColor",me.FillColor)
		  Items.Append New PAF_PropertyListKit.CheckboxProperty("Visible", me.Visible)
		  
		  Items.Append New PAF_PropertyListKit.SectionProperty("Font")
		  
		  if InstalledFonts = nil then
		    InstalledFonts = new MenuItem
		    dim nFonts as Integer
		    nFonts=FontCount-1
		    //build the font menu
		    For i as Integer=0 to nFonts
		      InstalledFonts.Append new MenuItem(font(i))
		    Next
		  end if
		  
		  Items.Append New PAF_PropertyListKit.MenuProperty("TextFont", me.TextFont, InstalledFonts)
		  Items.Append New PAF_PropertyListKit.TextProperty("TextSize", str(me.TextSize))
		  Items.Append New PAF_PropertyListKit.CheckboxProperty("Bold", me.Bold)
		  Items.Append New PAF_PropertyListKit.CheckboxProperty("Italic", me.Italic)
		  Items.Append New PAF_PropertyListKit.CheckboxProperty("Underline", me.Underline)
		  Static oAlignmentDict as New Dictionary
		  
		  oAlignmentDict.Value(0) = "Default"
		  oAlignmentDict.Value(1) = "Left"
		  oAlignmentDict.Value(2) = "Center"
		  oAlignmentDict.Value(3) = "Right"
		  items.Append New PAF_PropertyListKit.EnumProperty("Alignment", oAlignmentDict.Lookup(me.Alignment, "Default"), oAlignmentDict)
		  
		  'item = new PAF_PropertyListKit.TextProperty("ShortsStyle", me.ShortsStyle)
		  'PAF_PropertyListKit.TextProperty(item).ReadOnly = True
		  'items.Append item
		  
		  items.Append New PAF_PropertyListKit.SectionProperty("Behavior")
		  items.Append New PAF_PropertyListKit.CheckboxProperty("CanGrow", me.CanGrow)
		  
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
		  
		  if me isa PAF_PrintKit.PrintField then
		    jOut.Value("type") = "field"
		  else
		    jOut.Value("type") = "text"
		  end if
		  
		  jOut.Value("uid") = me.UID
		  
		  jOut.Value("data") = me.Data
		  
		  jOut.Value("visible") = me.Visible
		  
		  jOut.Value("canGrow") = me.CanGrow
		  
		  jPosition.Append me.Left
		  
		  // adjust top
		  jPosition.Append me.Top - me.Band.Top
		  
		  jPosition.Append me.Width
		  jPosition.Append me.Height
		  
		  jOut.Value("style") = me.ShortsStyle
		  
		  jOut.Value("position") = jPosition
		  
		  
		  
		  Return jOut
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Alignment As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Bold As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		CanGrow As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		Data As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Format As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Italic As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		MaxLines As Integer = 100
	#tag EndProperty

	#tag Property, Flags = &h0
		ShortsStyle As String
	#tag EndProperty

	#tag Property, Flags = &h0
		TextFont As String = "Arial"
	#tag EndProperty

	#tag Property, Flags = &h0
		TextSize As Integer = 12
	#tag EndProperty

	#tag Property, Flags = &h0
		Underline As Boolean
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Alignment"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bold"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Bottom"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="CanGrow"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Data"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="Format"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="Italic"
			Group="Behavior"
			Type="Boolean"
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
			Name="MaxLines"
			Group="Behavior"
			InitialValue="100"
			Type="Integer"
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
			Name="TextFont"
			Group="Behavior"
			InitialValue="Arial"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextSize"
			Group="Behavior"
			InitialValue="12"
			Type="Integer"
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
			Name="Underline"
			Group="Behavior"
			Type="Boolean"
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
