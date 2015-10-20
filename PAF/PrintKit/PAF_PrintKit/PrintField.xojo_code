#tag Class
Protected Class PrintField
Inherits PAF_PrintKit.PrintText
	#tag Method, Flags = &h0
		Sub Clone(item as PAF_PrintKit.PrintItem)
		  Super.Clone(item)
		  
		  Alias = PAF_PrintKit.PrintField(item).Alias
		  FieldName = PAF_PrintKit.PrintField(item).FieldName
		  Aggregate = PAF_PrintKit.PrintField(item).Aggregate
		  IsFunction = PAF_PrintKit.PrintField(item).IsFunction
		  IsImage = PAF_PrintKit.PrintField(item).IsImage
		  Format = PAF_PrintKit.PrintField(item).Format
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(jItem as JSONItem, oDesigner As PAF_PrintKit.DesignCanvas)
		  super.constructor(jItem, oDesigner)
		  
		  FieldName = jItem.Lookup("FieldName","").StringValue.DefineEncoding(Encodings.UTF8)
		  Alias = jItem.Lookup("Alias","").StringValue.DefineEncoding(Encodings.UTF8)
		  Aggregate = jItem.Lookup("Aggregate","").StringValue.DefineEncoding(Encodings.UTF8)
		  IsFunction = jItem.Lookup("IsFunction",False).BooleanValue
		  IsImage = jItem.Lookup("IsImage",False).BooleanValue
		  Format = jItem.Lookup("Format","").StringValue.DefineEncoding(Encodings.UTF8)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(oDesigner As PAF_PrintKit.DesignCanvas)
		  super.constructor(oDesigner)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw(g as Graphics, scale as Double, xOffset as double, yOffset as double)
		  if me.Alias <> "" then
		    
		    me.Data = me.Alias
		    
		  else
		    
		    if me.Aggregate <> "" then
		      
		      me.Data = me.Aggregate + "(" + me.FieldName + ")"
		      
		    else
		      
		      me.Data = me.FieldName
		      
		    end if
		    
		  end if
		  
		  super.Draw(g,Scale,xOffset, yOffset)
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetSuperTemplateMultiple(oDBWrapper as PAF_DatabaseKit.DBWrapper) As PAF_PropertyListKit.ListItem()
		  Return super.GetTemplateMultiple(oDBWrapper)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTemplate(oDBWrapper as PAF_DatabaseKit.DBWrapper) As PAF_PropertyListKit.ListItem()
		  // Part of the PListUpdatable interface.
		  
		  dim item, items() as PAF_PropertyListKit.ListItem
		  
		  items() = super.GetTemplate(oDBWrapper)
		  
		  Items.Append New PAF_PropertyListKit.SectionProperty("DataField")
		  
		  dim tblName, fldName, FieldNames() as String
		  if oDBWrapper <> nil then
		    
		    For Each entry as Xojo.Core.DictionaryEntry In oDBWrapper.SchemaDict
		      for each fld as xojo.Core.DictionaryEntry in xojo.Core.Dictionary(entry.Value)
		        
		        tblName = entry.Key
		        fldName = fld.key
		        
		        FieldNames.Append tblName + "." + fldName
		        
		      Next
		    next
		    
		  end if
		  
		  If me.IsFunction then
		    
		    item = New PAF_PropertyListKit.TextProperty("FieldName", me.FieldName)
		    PAF_PropertyListKit.TextProperty(item).IsTextArea = true
		    Items.Append item
		    
		  else
		    
		    Items.Append New PAF_PropertyListKit.MenuProperty("FieldName", me.FieldName, BuildSchemaMenu(oDBWrapper))
		    
		  end if
		  
		  if oDBWrapper.DBMS_DataTypeDict <> nil then
		    
		    item = new PAF_PropertyListKit.TextProperty("DBMS_Type", oDBWrapper.DBMS_DataTypeDict.Lookup(me.FieldName,""))
		    PAF_PropertyListKit.TextProperty(item).ReadOnly = true
		    items.Append item
		    
		  end if
		  
		  Items.Append New PAF_PropertyListKit.TextProperty("Alias", me.Alias)
		  
		  Items.Append New PAF_PropertyListKit.MenuProperty("Aggregate", me.Aggregate, BuildAggregateMenu)
		  
		  Items.Append New PAF_PropertyListKit.CheckboxProperty("IsFunction", me.IsFunction)
		  
		  Items.Append New PAF_PropertyListKit.CheckboxProperty("IsImage", me.IsImage)
		  
		  Items.Append New PAF_PropertyListKit.TextProperty("Format", me.Format)
		  
		  For i as Integer = 0 to Items.Ubound
		    
		    Items(i).PropertyObjects.Append Self
		    
		  Next
		  
		  
		  Return items
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetTemplateMultiple(oDBWrapper as PAF_DatabaseKit.DBWrapper) As PAF_PropertyListKit.ListItem()
		  // Part of the PListUpdatable interface.
		  
		  dim items() as PAF_PropertyListKit.ListItem = super.GetTemplateMultiple(oDBWrapper)
		  
		  Items.Append New PAF_PropertyListKit.SectionProperty("DataField")
		  
		  Items.Append New PAF_PropertyListKit.MenuProperty("Aggregate", me.Aggregate, BuildAggregateMenu)
		  
		  Items.Append New PAF_PropertyListKit.CheckboxProperty("IsFunction", me.IsFunction)
		  
		  Items.Append New PAF_PropertyListKit.CheckboxProperty("IsImage", me.IsImage)
		  
		  Items.Append New PAF_PropertyListKit.TextProperty("Format", me.Format)
		  
		  For i as Integer = 0 to Items.Ubound
		    
		    Items(i).PropertyObjects.Append Self
		    
		  Next
		  
		  Return items
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SerializeJSON() As JSONItem
		  dim jOut as JSONItem = super.SerializeJSON
		  
		  jOut.Value("FieldName") = FieldName
		  
		  jOut.Value("Alias") = Alias
		  
		  jOut.Value("Aggregate") = Aggregate
		  
		  jOut.Value("IsFunction") = IsFunction
		  
		  jOut.Value("IsImage") = IsImage
		  
		  jOut.Value("Format") = Format
		  
		  Return jOut
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Aggregate As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Alias As String
	#tag EndProperty

	#tag Property, Flags = &h0
		FieldName As String
	#tag EndProperty

	#tag Property, Flags = &h0
		IsFunction As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private IsImage As Boolean = False
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Aggregate"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Alias"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
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
			Name="FieldName"
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
			Name="IsFunction"
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
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
