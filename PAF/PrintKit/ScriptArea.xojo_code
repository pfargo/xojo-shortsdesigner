#tag Class
Protected Class ScriptArea
Inherits TextArea
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  Dim charPos As Integer
		  Dim curWord As String
		  
		  CharPos = me.CharPosAtXY(X,Y)
		  
		  curWord = GetWord(CharPos)
		  
		  if EditorType = "Script" then
		    
		    ScriptMenuBuild(base,curWord)
		    
		  elseif EditorType = "SQLite" then
		    
		    SQLiteMenuBuild(base,curWord)
		    
		  end if
		  
		  Return True
		End Function
	#tag EndEvent

	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  if hitItem <> nil then
		    
		    if EditorType = "Script" then
		      
		      ScriptMenuAction(hitItem)
		      
		    elseif EditorType = "SQLite" then
		      
		      SQLiteMenuAction(hitItem)
		      
		    end if
		    
		  end if
		End Function
	#tag EndEvent

	#tag Event
		Function KeyDown(Key As String) As Boolean
		  Dim s, indent As String
		  Dim start As Integer
		  
		  if key = chr(13) then
		    s = endOfLine + GetIndent(me.LineNumAtCharPos(me.SelStart))
		    me.SelText = s
		    return true
		    'elseif key = chr(9) then
		    's = "    "
		    'me.SelText = s
		    'return true
		  elseif key = "{" and BalanceBrackets then
		    start = me.SelStart
		    indent = GetIndent(me.LineNumAtCharPos(me.SelStart))
		    s = "{" +  endOfLine + indent  + "    " + endOfLine + indent + "}"
		    me.SelText = s
		    me.selStart = start + len(indent) + 6
		    return true
		  elseif key = chr(8) then
		    
		    
		  end if
		  
		End Function
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Function AlphaTest(s As String) As Boolean
		  if  asc(s) = 60 or asc(s) = 62 then Return true
		  
		  if Not Keyboard.AsyncControlKey then
		    if (asc(s) > 64 and asc(s) < 91) or (asc(s) > 96 and asc(s) < 123) or (asc(s) > 47 and asc(s) < 58) or asc(s) = 95 or asc(s) = 46 then return true else return false
		  else
		    if (asc(s) > 64 and asc(s) < 91) or (asc(s) > 96 and asc(s) < 123) or (asc(s) > 47 and asc(s) < 58) or asc(s) = 95 or asc(s) = 46 then return true else return false
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function BuildStyles() As MenuItem
		  dim p as New Picture(16,16,32)
		  
		  dim styleNames() as String = VariantArrayToStringArray(DictStyles.Keys)
		  
		  dim oStyle as PAF_PrintKit.PrintStyle
		  
		  dim base, mItem as MenuItem
		  
		  base = new MenuItem("Styles")
		  
		  for i as Integer = 0 to styleNames.Ubound
		    
		    oStyle = DictStyles.Value(styleNames(i))
		    
		    dim pic as Picture = oStyle.Draw
		    
		    mItem = New MenuItem("")
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
		Private Sub BuildSubFieldMenu(base as menuitem, sParentKey As String)
		  dim mTable, mField as MenuItem
		  
		  if oDBWrapper <> nil then
		    
		    For Each entry as Xojo.Core.DictionaryEntry In oDBWrapper.SchemaDict
		      
		      mTable = New MenuItem
		      mTable.Text = entry.Key
		      
		      for each fld as xojo.Core.DictionaryEntry in xojo.Core.Dictionary(entry.Value)
		        
		        mField = New MenuItem
		        mField.Text = fld.key
		        mField.Name = mTable.Text + "." + fld.key
		        mField.Tag = sParentKey
		        
		        mTable.Append mField
		        
		      Next
		      
		      base.Append mTable
		      
		    next
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetIndent(line As Integer) As String
		  Dim s, result As String
		  Dim i As Integer
		  
		  i = me.CharPosAtLineNum(line) // get the above line
		  s = mid(me.Text, i, 1)
		  while s = chr(32) or s = chr(9)
		    result = result + s
		    i = i + 1
		    s = mid(me.Text,i, 1)
		  wend
		  return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetUIDs() As String()
		  dim arsUID() as String
		  
		  For each oBand as PAF_PrintKit.PrintBand in aroBand
		    For each oItem as PAF_PrintKit.PrintItem in oBand.Items
		      if oItem.UID <> "" then
		        arsUID.Append oItem.UID
		      end if
		    next
		  next
		  
		  Return arsUID
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetWord(StartPosition As Integer) As String
		  Dim wordStart, wordLength, curPosition As Integer
		  Dim lineStart, lineEnd, lineNum As Integer
		  Dim curChar As String
		  
		  lineNum = me.LineNumAtCharPos(StartPosition)
		  lineStart = me.CharPosAtLineNum(lineNum)
		  lineEnd = me.CharPosAtLineNum(lineNum + 1) - 1
		  
		  wordStart = startPosition
		  if wordStart = lineStart or wordstart = lineend then return ""
		  
		  curChar = mid(me.Text, wordStart, 1)
		  if curChar = chr(22) then return ""
		  While AlphaTest(curChar) and wordStart >= lineStart
		    wordStart = wordStart - 1
		    curChar = mid(me.Text, wordStart, 1)
		  wend
		  
		  curPosition = wordStart + 1
		  curChar = mid(me.Text, curPosition,1)
		  While AlphaTest(curChar) and curPosition <= lineEnd
		    curPosition = curPosition + 1
		    wordLength = wordLength + 1
		    curChar = mid(me.Text, curPosition, 1)
		  wend
		  
		  me.SelStart = wordStart
		  me.SelLength = wordLength
		  
		  return me.SelText
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ScriptMenuAction(hitItem As MenuItem)
		  if hitItem.text = "Set Style" then
		    me.SelText = "SC_SetStyle(""<UID>"",""<STYLE>"")"
		  elseif hitItem.Text = "Get String Value" then
		    me.SelText = "SC_GetFieldStringValue(""<UID>"")"
		  elseif hitItem.Text = "Get Integer Value" then
		    me.SelText = "SC_GetFieldIntegerValue(""<UID>"")"
		  elseif hitItem.Text = "Get Double Value" then
		    me.SelText = "SC_GetFieldDoubleValue(""<UID>"")"
		  elseif hitItem.Text = "Set Picture" then
		    me.SelText = "SC_SetPicture(""<UID>"",""<IMAGE>"")"
		  elseif hitItem.Text = "Set TextItem String Value" then
		    me.SelText = "SC_SetTextItemValue(""<UID>"",""VALUE"")"
		  elseif me.SelText = "<STYLE>" then
		    // due to stylized style menu (uses icon)
		    // we store the style name in the tag and
		    // must extract it here
		    me.SelText = hitItem.Tag.StringValue
		  else
		    if hitItem.Text <> "" then
		      me.SelText = hitItem.Text
		    else
		      me.SelText = hitItem.tag.StringValue
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ScriptMenuBuild(base As MenuItem, curWord As String)
		  dim uids() As String = GetUIDs
		  
		  dim styles(), imageNames() As String
		  
		  dim miStyle as MenuItem = BuildStyles
		  for i as integer = 0 to miStyle.Count - 1
		    styles.Append miStyle.Item(i).Tag.StringValue
		  next
		  
		  Dim miUID As new MenuItem("UIDs")
		  For i as integer = 0 to uids.Ubound
		    miUID.Append(new MenuItem(uids(i)))
		  next
		  
		  Dim miImage As MenuItem = BuildImageMenu
		  for i as integer = 0 to miImage.Count - 1
		    imageNames.Append(miImage.Item(i).Text)
		  next
		  
		  if curWord = "" then
		    
		    dim miCommands As new MenuItem("Commands")
		    miCommands.Append(new MenuItem("Get String Value"))
		    miCommands.Append(new MenuItem("Get Integer Value"))
		    miCommands.Append(new MenuItem("Get Double Value"))
		    miCommands.Append(new MenuItem("Set TextItem String Value"))
		    miCommands.Append(new MenuItem("Set Style"))
		    miCommands.Append(new MenuItem("Set Picture"))
		    base.Append miCommands
		    
		    'base.Append miUID
		    
		    'base.Append miStyle
		  end if
		  
		  
		  if curWord = "<UID>" or uids.IndexOf(curWord) <> -1 then
		    base.Append miUID
		  elseif curWord = "<STYLE>" or styles.IndexOf(curWord) <> - 1 then
		    base.Append miStyle
		  elseif curWord = "<IMAGE>" or imageNames.IndexOf(curWord) <> - 1 then
		    base.Append miImage
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SQLiteMenuAction(hitItem As MenuItem)
		  if hitItem.text = "abs" then
		    me.SelText = "abs(<FIELD>)"
		  elseif hitItem.Text = "coalesce" then
		    me.SelText = "coalesce(<FIELD>,<FIELD> or literals)"
		  elseif hitItem.Text = "concatenate" then
		    me.SelText = " || ' ' || "
		  elseif hitItem.Text = "length" then
		    me.SelText = "length(<FIELD>)"
		  elseif hitItem.Text = "lower" then
		    me.SelText = "lower(<FIELD>)"
		  elseif hitItem.Text = "max" then
		    me.SelText = "max(<FIELD>,<FIELD>,...)"
		  elseif hitItem.Text = "min" then
		    me.SelText = "min(<FIELD>,<FIELD>,...)"
		  elseif hitItem.Text = "trim" then
		    me.SelText = "trim(<FIELD>)"
		  elseif hitItem.Text = "upper" then
		    me.SelText = "upper(<FIELD>)"
		  else
		    if hitItem.Name <> "" then
		      if hitItem.Tag = "titlecase" then
		        me.SelText = "upper(substr(" + hitItem.Name + ",1,1)) || lower(substr(" + hitItem.Name + ",2))"
		      else
		        me.SelText =  hitItem.Name
		      end if
		    else
		      me.SelText = hitItem.Text
		    end if
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SQLiteMenuBuild(base As MenuItem, curWord As String)
		  Dim miAllFields As MenuItem = oDBWrapper.BuildSchemaMenu
		  
		  Dim mi As MenuItem
		  
		  if curWord = "" then
		    
		    dim miFunctions As new MenuItem("Functions")
		    miFunctions.Append New MenuItem("abs")
		    miFunctions.Append New MenuItem("coalesce")
		    miFunctions.Append New MenuItem("concatenate")
		    miFunctions.Append New MenuItem("length")
		    miFunctions.Append New MenuItem("lower")
		    miFunctions.Append New MenuItem("max")
		    miFunctions.Append New MenuItem("min")
		    mi = new MenuItem("titlecase")
		    BuildSubFieldMenu(mi,"titlecase")
		    miFunctions.Append mi
		    miFunctions.Append New MenuItem("trim")
		    miFunctions.Append New MenuItem("upper")
		    
		    base.Append miFunctions
		  end if
		  
		  
		  if curWord = "<FIELD>" or oDBWrapper.StringIsTableDotField(curWord) then
		    mi = new MenuItem("titlecase")
		    BuildSubFieldMenu(mi,"titlecase")
		    base.Append mi
		    base.Append miAllFields
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		aroBand() As PAF_PrintKit.PrintBand
	#tag EndProperty

	#tag Property, Flags = &h21
		Private BalanceBrackets As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		EditorType As String
	#tag EndProperty

	#tag Property, Flags = &h0
		oDBWrapper As PAF_DatabaseKit.DBWrapper
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Alignment"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType="Enum"
			#tag EnumValues
				"0 - Default"
				"1 - Left"
				"2 - Center"
				"3 - Right"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutomaticallyCheckSpelling"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BackColor"
			Visible=true
			Group="Appearance"
			InitialValue="&hFFFFFF"
			Type="Color"
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
			Name="EditorType"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Format"
			Visible=true
			Group="Appearance"
			Type="String"
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
			Name="HideSelection"
			Visible=true
			Group="Appearance"
			InitialValue="True"
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
			Name="LimitText"
			Visible=true
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LineHeight"
			Visible=true
			Group="Appearance"
			InitialValue="0"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LineSpacing"
			Visible=true
			Group="Appearance"
			InitialValue="1"
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
			Name="Mask"
			Visible=true
			Group="Behavior"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Multiline"
			Visible=true
			Group="Appearance"
			InitialValue="True"
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
			Name="ReadOnly"
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
			Name="ScrollbarVertical"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Styled"
			Visible=true
			Group="Appearance"
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
			Name="Text"
			Visible=true
			Group="Initial State"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="TextColor"
			Visible=true
			Group="Appearance"
			InitialValue="&h000000"
			Type="Color"
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
	#tag EndViewBehavior
End Class
#tag EndClass
