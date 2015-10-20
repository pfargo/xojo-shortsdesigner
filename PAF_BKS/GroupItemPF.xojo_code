#tag Class
Protected Class GroupItemPF
Inherits BKS_Shorts.GroupItem
	#tag Method, Flags = &h1000
		Function Clone() As GroupItemPF
		  Return New GroupItemPF(self)
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub Constructor(oItem as GroupItemPF)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From GroupItem
		  // Constructor(oItem as BKS_Shorts.GroupItem) -- From GroupItem
		  // Constructor(aroItem() as BKS_Shorts.Item) -- From GroupItem
		  // Constructor(dLeft as double, dTop as double) -- From GroupItem
		  // Constructor(dLeft as double, dTop as double, aroItem() as BKS_Shorts.Item) -- From GroupItem
		  // Constructor(dLeft as double, dTop as double, aroItem() as BKS_Shorts.Item, oStyleSet as BKS_Shorts.StyleSet) -- From GroupItem
		  // Constructor(dLeft as double, dTop as double, oStyleSet as BKS_Shorts.StyleSet) -- From GroupItem
		  // Constructor() -- From Base
		  // Constructor(oStyle as BKS_Shorts.StyleSet) -- From Base
		  Super.Constructor(oItem)
		  
		  AlternateColors = oItem.AlternateColors
		  EvenColor = oItem.EvenColor
		  EvenRow = oItem.EvenRow
		  GroupType = oItem.GroupType
		  Index = oItem.Index
		  OddColor = oItem.OddColor
		  PageBreak = oItem.PageBreak
		  RepeatEachPage = oItem.RepeatEachPage
		  BorderBottom = oItem.BorderBottom
		  BorderTop = oItem.BorderTop
		  Visible = oItem.Visible
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1000
		Sub constructor(jItem As JSONItem)
		  // Calling the overridden superclass constructor.
		  // Note that this may need modifications if there are multiple constructor choices.
		  // Possible constructor calls:
		  // Constructor() -- From GroupItem
		  // Constructor(oItem as BKS_Shorts.GroupItem) -- From GroupItem
		  // Constructor(aroItem() as BKS_Shorts.Item) -- From GroupItem
		  // Constructor(dLeft as double, dTop as double) -- From GroupItem
		  // Constructor(dLeft as double, dTop as double, aroItem() as BKS_Shorts.Item) -- From GroupItem
		  // Constructor(dLeft as double, dTop as double, aroItem() as BKS_Shorts.Item, oStyleSet as BKS_Shorts.StyleSet) -- From GroupItem
		  // Constructor(dLeft as double, dTop as double, oStyleSet as BKS_Shorts.StyleSet) -- From GroupItem
		  // Constructor() -- From Base
		  // Constructor(oStyle as BKS_Shorts.StyleSet) -- From Base
		  Super.Constructor()
		  
		  me.GroupType = jItem.Lookup("type","").StringValue.DefineEncoding(Encodings.UTF8)
		  me.AlternateColors = jItem.Lookup("alternate",False).BooleanValue
		  me.EvenColor = jItem.Lookup("fillcolor", &cFFFFFFFF).ColorValue
		  me.OddColor = jItem.Lookup("alternateColor", &cFFFFFFFF).ColorValue
		  me.PageBreak = jItem.Lookup("pageBreak",False).BooleanValue
		  me.RepeatEachPage = jItem.Lookup("repeatEachPage",False).BooleanValue
		  me.Index = jItem.Lookup("index",-1).IntegerValue
		  me.BorderBottom = jItem.Lookup("borderBottom",False).BooleanValue
		  me.BorderTop = jItem.Lookup("borderTop",False).BooleanValue
		  me.Visible = jItem.Lookup("visible",false).BooleanValue
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub GetGroupHeight(currentGap As double = 0, optional sortedItems() As BKS_Shorts.Item)
		  //Recursive method to determine the topmost items in the group
		  //It then expands those and adjusts any below them
		  
		  dim dTopmost, dGap As Double
		  
		  Dim oItem, aroSortedItems() As BKS_Shorts.Item
		  
		  if sortedItems <> nil then
		    aroSortedItems = sortedItems
		  end if
		  
		  // get the topmost item position (top)
		  
		  dTopmost = 10000
		  
		  For i as integer = 0 to me.Ubound
		    
		    oItem = me.Item(i)
		    
		    ' if currentGap > 0 then
		    '
		    ' SetItemTop(oItem, currentGap)
		    '
		    ' end if
		    
		    dTopmost = min(dTopmost,oItem.Bounds.Top)
		    
		  Next
		  
		  // append all the items whose top is at the topmost position
		  // to the sorted items array
		  // Also save the tallest items height minus it's single line height as dGap
		  // the difference between the design height and the printed height
		  
		  dGap = 0
		  
		  For i as integer = me.Ubound DownTo 0
		    
		    oItem = me.item(i)
		    
		    if oItem.Bounds.Top = dTopmost then
		      
		      if currentGap > 0 then
		        
		        SetItemTop(oItem, currentGap)
		        
		      end if
		      
		      if oItem isa BKS_Shorts.TextItem then
		        
		        if BKS_Shorts.TextItem(oItem).AutoAdjustHeight then
		          
		          if BKS_Shorts.TextItem(oItem).Text = "" then
		            
		            ' no text -> no gap - negate from lower items
		            
		            dGap = BKS_Shorts.TextItem(oItem).Height * -1
		            
		          else
		            
		            dim dSingleLineHeight As double = BKS_Shorts.TextItem(oItem).Height
		            
		            dim dFullHeight as double = oItem.Bounds.Height
		            
		            if dFullHeight > dSingleLineHeight then
		              
		              dGap = max(dGap, dFullHeight - dSingleLineHeight)
		              
		            else
		              
		              dGap = max(dGap, dSingleLineHeight)
		              
		            end if
		            
		            'System.DebugLog str(dGap) + "__" + BKS_Shorts.TextItem(oItem).Text
		            
		          end if
		          
		        end if
		        
		      else
		        
		        'System.DebugLog str(dGap)
		        
		      end if
		      
		      
		      aroSortedItems.Append me.Item(i)
		      
		      me.Remove(i)
		      
		    end if
		    
		  Next
		  
		  
		  if me.Ubound <= 0 then
		    
		    For i as integer = 0 to aroSortedItems.Ubound
		      // Don't account for empty text
		      if aroSortedItems(i) isa BKS_Shorts.TextItem then
		        
		        if BKS_Shorts.TextItem(aroSortedItems(i)).Text <> "" then
		          
		          me.Append aroSortedItems(i)
		          
		        end if
		        
		      else
		        
		        me.Append aroSortedItems(i)
		        
		      end if
		      
		    next
		    
		  else
		    
		    GetGroupHeight(dGap + currentGap, aroSortedItems)
		    
		  end if
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function HasGrowableItems() As Boolean
		  For each item as BKS_Shorts.Item in Items
		    if item isa BKS_Shorts.TextItem then
		      if BKS_Shorts.TextItem(item).AutoAdjustHeight then
		        Return true
		      end if
		    end if
		  next
		  
		  Return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetItemTop(oItem as bks_shorts.Item, dAmount as Double)
		  if oItem isa BKS_Shorts.TextItem then
		    BKS_Shorts.TextItem(oItem).Top = BKS_Shorts.TextItem(oItem).Top + dAmount
		  elseif oItem isa BKS_Shorts.ImageItem then
		    BKS_Shorts.ImageItem(oItem).Top = BKS_Shorts.ImageItem(oItem).Top + dAmount
		  elseif oItem isa BKS_Shorts.LineItem then
		    BKS_Shorts.LineItem(oItem).Top = BKS_Shorts.LineItem(oItem).Top + dAmount
		  elseif oItem isa BKS_Shorts.OvalItem then
		    BKS_Shorts.OvalItem(oItem).Top = BKS_Shorts.OvalItem(oItem).Top + dAmount
		  elseif oItem isa BKS_Shorts.RectItem then
		    BKS_Shorts.RectItem(oItem).Top = BKS_Shorts.RectItem(oItem).Top + dAmount
		  elseif oItem isa BKS_Shorts.RoundRectItem then
		    BKS_Shorts.RoundRectItem(oItem).Top = BKS_Shorts.RoundRectItem(oItem).Top + dAmount
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		AlternateColors As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		BorderBottom As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		BorderTop As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		EvenColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		EvenRow As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		GroupType As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Index As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		OddColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		PageBreak As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h0
		RepeatEachPage As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		Visible As Boolean
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AlternateColors"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BorderBottom"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="BorderTop"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EvenColor"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EvenRow"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="GroupType"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="OddColor"
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PageBreak"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="RepeatEachPage"
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
			Name="Visible"
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
