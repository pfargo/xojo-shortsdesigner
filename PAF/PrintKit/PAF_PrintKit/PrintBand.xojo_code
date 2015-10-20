#tag Class
Protected Class PrintBand
Inherits PAF_PrintKit.PrintItem
	#tag Method, Flags = &h0
		Sub AdjustTops(rowTop as Integer)
		  dim yDelta as integer
		  
		  for each item as PrintItem in Items
		    
		    yDelta = (item.top - me.top)
		    
		    item.top = rowTop + yDelta
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CalcHeight(g as Graphics)
		  #pragma DisableBackgroundTasks
		  
		  dim iBottom, itemHeight as Integer
		  
		  me.top = 100000
		  
		  for Each item as PrintItem in Items
		    
		    if item IsA PrintText then
		      
		      me.Top = min(me.Top, PrintText(Item).Top)
		      me.Left = min(me.Left, PrintText(Item).Left)
		      
		      itemHeight = PrintText(item).CalcHeight(g)
		      
		      item.Height = itemHeight
		      
		      iBottom = Max(iBottom, PrintText(item).Top + itemHeight)
		      
		    else
		      
		      me.Top = min(me.Top, item.Top)
		      me.Left = min(me.Left, item.Left)
		      
		      iBottom = max(iBottom, item.Top + Item.Height)
		      
		    end if
		    
		  Next
		  
		  me.Height = iBottom - me.Top
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CalcWidth()
		  dim iRight as Integer
		  
		  me.Left = 10000.0
		  
		  for Each item as PrintItem in Items
		    
		    me.Left = min(Item.Left, me.Left)
		    
		    iRight = max(iRight, Item.Right)
		    
		  Next
		  
		  me.Width = iRight - me.Left
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Clone() As PrintBand
		  Return New PrintBand(self)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(jBand as JSONItem, oDesigner As PAF_PrintKit.DesignCanvas)
		  super.Constructor(oDesigner)
		  
		  BandType = jBand.Lookup("type","").StringValue.DefineEncoding(Encodings.UTF8)
		  Left = jBand.Lookup("left",0).IntegerValue
		  Top = jBand.lookup("top",0).IntegerValue
		  Width = jBand.Lookup("width",100).IntegerValue
		  Height = jBand.lookup("height",40).IntegerValue
		  BorderTop = jBand.Lookup("borderTop",False).BooleanValue
		  BorderBottom = jBand.Lookup("borderBottom",False).BooleanValue
		  FillColor = jBand.Lookup("fillcolor",&cFFFFFFFF).ColorValue
		  Alternate = jBand.Lookup("alternate",False).BooleanValue
		  AlternateColor = jBand.lookup("alternateColor",&cFFFFFFFF).ColorValue
		  SQL = jBand.Lookup("sql","").StringValue.DefineEncoding(Encodings.UTF8)
		  GroupBy = jBand.Lookup("groupBy","").StringValue.DefineEncoding(Encodings.UTF8)
		  OrderBy = jBand.Lookup("orderBy","").StringValue.DefineEncoding(Encodings.UTF8)
		  Visible = jBand.Lookup("visible",True).BooleanValue
		  PageBreak = jBand.Lookup("pageBreak",False).BooleanValue
		  RepeatEachPage = jBand.Lookup("repeatEachPage",False).BooleanValue
		  Index = jBand.Lookup("index",-1).IntegerValue
		  Script = jBand.Lookup("script","").StringValue.DefineEncoding(Encodings.UTF8)
		  Limit = jBand.Lookup("limit",0).IntegerValue
		  
		  DeserializeItems(jBand.Lookup("Items",nil),oDesigner)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(oDesigner As PAF_PrintKit.DesignCanvas)
		  super.Constructor(oDesigner)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(oItem as PrintBand)
		  Super.Clone(oItem)
		  
		  Designer = oItem.Designer
		  AlternateColor = oItem.AlternateColor
		  Alternate = oItem.Alternate
		  BandType = oItem.BandType
		  BorderBottom = oItem.BorderBottom
		  BorderTop = oItem.BorderTop
		  PageBreak = oItem.PageBreak
		  RepeatEachPage = oItem.RepeatEachPage
		  GroupBy = oItem.GroupBy
		  OrderBy = oItem.OrderBy
		  Index = oItem.Index
		  MinimumHeight = oItem.MinimumHeight
		  OrderBy = oItem.OrderBy
		  SQL = oItem.SQL
		  Script = oItem.Script
		  Limit = oItem.Limit
		  
		  dim pt as PrintText
		  dim pf as PrintField
		  dim pp As PrintImage
		  dim pr As PrintRect
		  dim po As printOval
		  
		  ' Be sure these are in reverse class hierarchy
		  
		  for each subItem as PrintItem in oItem.Items
		    
		    If subItem IsA PrintField then
		      
		      pf = New PrintField(Designer)
		      pf.Clone(PrintField(subItem))
		      me.Items.Append pf
		      
		      
		    elseif subItem IsA PrintText then
		      
		      pt = New PrintText(Designer)
		      pt.Clone(PrintText(subItem))
		      me.Items.Append pt
		      
		    elseif subItem isa PrintImage then
		      
		      pp = new PrintImage(Designer)
		      pp.clone(PrintImage(subItem))
		      me.Items.Append pp
		      
		    elseif subItem isa PrintRect then
		      
		      pr = new PrintRect(Designer)
		      pr.clone(PrintRect(subItem))
		      me.Items.Append pr
		      
		    elseif subItem isa PrintOval then
		      
		      po = new PrintOval(Designer)
		      po.clone(PrintOval(subItem))
		      me.Items.Append po
		      
		    else
		      
		      MsgBox "Oops - Houston we have a problem..."
		      
		    end if
		    
		  Next
		  
		  For Each pi as PrintItem in me.Items
		    pi.Band = me
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DeserializeItems(jItems as JSONItem, oDesigner As PAF_PrintKit.DesignCanvas)
		  super.Constructor(oDesigner)
		  
		  
		  dim oItem as PrintItem
		  
		  dim jItem as JSONItem
		  
		  dim sType As String
		  
		  if jItems <> nil then
		    
		    for j as integer = 0 to jItems.Count -1
		      
		      jItem = jItems.Child(j)
		      
		      sType = jItem.Lookup("type","")
		      
		      if sType = "field" then
		        
		        oItem = New PrintField(jItem,Designer)
		        
		      elseif sType = "text" then
		        
		        oItem = New PrintText(jItem,Designer)
		        
		      elseif sType = "image" then
		        
		        oItem = New PrintImage(jItem,Designer)
		        
		      Elseif sType = "rect" then
		        
		        oItem = new PrintRect(jItem,Designer)
		        
		      elseif sType = "oval" then
		        
		        oItem = new PrintOval(jItem,Designer)
		        
		      else
		        
		        break
		        
		      end if
		      
		      oItem.Band = me
		      
		      // PAF_PrintKit.PrintText.SerializeJSON adjusts tops for BKS_Shorts.
		      // This adusts back for proper loading into designer
		      if oItem.top < me.top then
		        oItem.top = me.top + oItem.top
		      elseif oItem.top >= me.top then
		        oItem.top = me.top + oItem.top
		      end if
		      
		      Items.Append oItem
		      
		    next
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawPass1(g as Graphics, Scale as Double, xOffset As double, yOffset As Double)
		  super.Draw(g, scale, xOffset, yOffset)
		  
		  // band background
		  ' sanity check
		  me.left = me.Designer.LeftRightMargin
		  me.Width = me.Designer.getWidth - me.Designer.LeftRightMargin * 2
		  
		  Dim gBand As Graphics = g.clip (me.Left + xOffset,me.top + yOffset,me.Width,me.Height)
		  
		  if not Visible then
		    
		    gBand.ForeColor = &cD0D7FF00
		    
		    For i as integer = 0 to gBand.Width step 20
		      
		      gBand.DrawLine i,0, i + 20, gBand.Height
		      
		    next
		    
		    For i as integer = 20 to gBand.Width + 20 step 20
		      
		      gBand.DrawLine i, 0, i - 20, gBand.Height
		      
		    next
		    
		  else
		    
		    if FillColor <> &cFFFFFFFF and fillcolor <> &cFFFFFF00 then
		      gBand.ForeColor = me.FillColor
		      gBand.FillRect(0,0,gBand.Width,gBand.Height)
		    end if
		    
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DrawPass2(g as Graphics, Scale as Double, xOffset As double, yOffset As Double)
		  super.Draw(g, scale, xOffset, yOffset)
		  
		  // All items and band borders
		  Dim gBand As Graphics = g.clip (me.Left + xOffset,me.top + yOffset,me.Width,me.Height)
		  
		  gBand.ForeColor = &cB5D5FF
		  gBand.DrawLine(0, gBand.Height-1, gband.Width, gBand.Height-1)
		  
		  if BorderTop then
		    gBand.ForeColor = &c000000
		    gBand.DrawLine(0,0,gBand.Width,0)
		  end if
		  
		  // draw band handles
		  
		  gBand.TextSize = 10
		  gBand.TextFont = "system"
		  gBand.Bold = false
		  gBand.Underline = false
		  gBand.Italic = false
		  
		  if BandType = "Break" or BandType = "Trailing" then
		    gBand.ForeColor = &cE2E0FF
		    gBand.FillRect 0, gBand.height - 10 , gBand.Width , 11
		    gBand.ForeColor = &c000000
		    gBand.DrawString(BandType + " (" + GroupBy + ")", 5 , gBand.height - 1 )
		  else
		    gBand.ForeColor = &cE2E0FF
		    gBand.FillRect 0, gBand.height - 10 , gBand.width , 11
		    gBand.ForeColor = &c000000
		    gBand.DrawString(BandType, 5 , gBand.height - 1 )
		  end if
		  
		  
		  if BorderBottom then
		    gBand.ForeColor = &c000000
		    gBand.DrawLine(0, gBand.Height - 11, gBand.Width, gBand.Height - 11)
		    
		  end if
		  
		  for Each item as PrintItem in Items
		    
		    if item.Visible or me.Designer.ShowInvisibleItems then
		      
		      item.Draw(g,scale, xOffset, yOffset)
		      
		    end if
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTemplate(oDBWrapper as PAF_DatabaseKit.DBWrapper) As PAF_PropertyListKit.ListItem()
		  // Part of the PListUpdatable interface.
		  
		  dim item, items() as PAF_PropertyListKit.ListItem
		  
		  Items.Append New PAF_PropertyListKit.SectionProperty("Position")
		  
		  item = New PAF_PropertyListKit.TextProperty("Top", str(me.Top))
		  PAF_PropertyListKit.TextProperty(item).ReadOnly = True
		  Items.Append item
		  
		  item = New PAF_PropertyListKit.TextProperty("Height", str(me.Height))
		  PAF_PropertyListKit.TextProperty(item).ReadOnly = true
		  Items.Append item
		  
		  Items.Append New PAF_PropertyListKit.SectionProperty("Appearance")
		  
		  items.Append New PAF_PropertyListKit.ColorProperty("FillColor",me.FillColor)
		  
		  if not (BandType = "Header" or BandType = "Footer") then
		    Items.Append New PAF_PropertyListKit.CheckboxProperty("Alternate", me.Alternate)
		    Items.Append New PAF_PropertyListKit.ColorProperty("AlternateColor", me.AlternateColor)
		  end if
		  
		  Items.Append New PAF_PropertyListKit.CheckboxProperty("Visible", me.Visible)
		  if not (BandType = "Header") then
		    Items.Append New PAF_PropertyListKit.CheckboxProperty("BorderTop", me.BorderTop)
		  end if
		  
		  if not (BandType = "Footer") then
		    Items.Append New PAF_PropertyListKit.CheckboxProperty("BorderBottom", me.BorderBottom)
		  end if
		  
		  items.Append New PAF_PropertyListKit.SectionProperty("Behavior")
		  if BandType = "Break" or BandType = "Trailing" then
		    items.Append New PAF_PropertyListKit.CheckboxProperty("PageBreak", me.PageBreak)
		    items.Append New PAF_PropertyListKit.CheckboxProperty("RepeatEachPage", me.RepeatEachPage)
		  end
		  
		  item = New PAF_PropertyListKit.TextProperty("Script", me.Script)
		  PAF_PropertyListKit.TextProperty(item).IsTextArea = true
		  items.Append item
		  
		  Items.Append New PAF_PropertyListKit.TextProperty("BandType", me.BandType, true)
		  
		  if BandType = "Break" then
		    item = New PAF_PropertyListKit.TextProperty("GroupBy", me.GroupBy)
		    PAF_PropertyListKit.TextProperty(item).ReadOnly = True
		    Items.Append item
		  end if
		  
		  if BandType = "Break" or BandType = "Body" then
		    Items.Append New PAF_PropertyListKit.TextProperty("Limit",me.Limit)
		  end if
		  
		  if BandType = "Break" or BandType = "Body" or BandType = "Grand Summary" then
		    Items.Append New PAF_PropertyListKit.TextProperty("OrderBy", me.OrderBy)
		    Items.Append New PAF_PropertyListKit.TextProperty("SQL",me.SQL)
		  end if
		  
		  
		  For i as Integer = 0 to Items.Ubound
		    
		    Items(i).PropertyObjects.Append Self
		    
		  Next
		  
		  Return items
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SerializeJSON() As JSONItem
		  dim jBand, jBandItems, jItem as JSONItem
		  
		  jBand = new JSONItem
		  jBandItems = new JSONItem
		  
		  jBand.Value("type") = BandType
		  jBand.Value("index") = Index
		  jBand.Value("left") = Left
		  jBand.Value("top") = Top
		  jBand.Value("height") = Height
		  jBand.Value("borderTop") = BorderTop
		  jBand.Value("borderBottom") = BorderBottom
		  dim vFillcolor as Variant = FillColor
		  jBand.Value("fillcolor") = vFillcolor.StringValue
		  jBand.Value("alternate") = Alternate
		  dim vAlternateColor as Variant = AlternateColor
		  jBand.Value("alternateColor") = vAlternateColor.StringValue
		  jBand.Value("groupBy") = GroupBy
		  jBand.Value("orderBy") = OrderBy
		  jBand.Value("sql") = SQL
		  jBand.Value("visible") = Visible
		  jBand.Value("pageBreak") = PageBreak
		  jBand.Value("repeatEachPage") = RepeatEachPage
		  jBand.Value("script") = Script
		  jBand.Value("limit") = Limit
		  
		  for each item as PrintItem in Items
		    
		    if item isa PrintText then
		      
		      jItem = PrintText(item).SerializeJSON
		      
		    elseif item isa PrintImage then
		      
		      jItem = PrintImage(item).SerializeJSON
		      
		    elseif item isa PrintRect then
		      
		      jItem = PrintRect(item).SerializeJSON
		      
		    elseif item isa PrintOval then
		      
		      jItem = PrintOval(item).SerializeJSON
		      
		    else
		      
		      break
		      
		    end if
		    
		    jBandItems.Append jItem
		    
		  next
		  
		  jBand.Value("Items") = jBandItems
		  
		  //Auto toggle visibility if no items
		  if items.Ubound = -1 then
		    jBand.Value("visible") = false
		  end if
		  
		  // Computed properties based on items so have to be
		  // called last
		  jBand.Value("paddingTop") = PaddingTop
		  jBand.Value("paddingBottom") = PaddingBottom
		  
		  Return jBand
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateMinimumHeight()
		  dim testPoint as Integer
		  
		  MinimumHeight = 10
		  
		  For each item as PrintItem in Items
		    
		    testPoint = (item.Top - me.Top) + item.Height + 10
		    
		    MinimumHeight = max(MinimumHeight,testPoint)
		    
		  Next
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Alternate As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		AlternateColor As Color = &cFFFFFF00
	#tag EndProperty

	#tag Property, Flags = &h0
		BandType As String
	#tag EndProperty

	#tag Property, Flags = &h0
		BorderBottom As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		BorderTop As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		GroupBy As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Index As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Items() As PAF_PrintKit.PrintItem
	#tag EndProperty

	#tag Property, Flags = &h0
		Limit As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		MinimumHeight As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		OrderBy As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  dim iBottom as integer = me.top + me.Height
			  
			  dim iPad as integer = me.Height
			  
			  For each item as PrintItem in items
			    
			    iPad = min(iPad, iBottom - (item.Top + item.Height))
			    
			  next
			  
			  Return iPad
			End Get
		#tag EndGetter
		PaddingBottom As Integer
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  
			  dim dTopMostItemTop As Double = 10000.0
			  
			  For each item as PrintItem in items
			    
			    dTopMostItemTop = min(dTopMostItemTop, item.top)
			    
			  next
			  
			  Return dTopMostItemTop - me.Top
			End Get
		#tag EndGetter
		PaddingTop As Integer
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		PageBreak As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Parent As DesignCanvas
	#tag EndProperty

	#tag Property, Flags = &h0
		RepeatEachPage As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Script As String
	#tag EndProperty

	#tag Property, Flags = &h0
		SQL As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Alternate"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AlternateColor"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BandType"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BorderBottom"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BorderTop"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
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
			Name="GroupBy"
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
			Name="MinimumHeight"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="OrderBy"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PaddingBottom"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PaddingTop"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PageBreak"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ParentID"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RepeatEachPage"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Right"
			Group="Behavior"
			Type="Double"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Script"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Selected"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="SQL"
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
