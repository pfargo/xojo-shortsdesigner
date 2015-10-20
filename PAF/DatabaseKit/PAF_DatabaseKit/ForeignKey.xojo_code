#tag Class
Protected Class ForeignKey
	#tag Method, Flags = &h0
		Sub Constructor()
		  // Default Constructor
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub constructor(jRelation as JSONItem)
		  Table = jRelation.Lookup("Table","").StringValue.DefineEncoding(Encodings.UTF8)
		  Column = jRelation.Lookup("Column","").StringValue.DefineEncoding(Encodings.UTF8)
		  ForeignTable = jRelation.Lookup("ForeignTable","").StringValue.DefineEncoding(Encodings.UTF8)
		  ForeignColumn = jRelation.Lookup("ForeignColumn","").StringValue.DefineEncoding(Encodings.UTF8)
		  Name = jRelation.Lookup("Name","").StringValue.DefineEncoding(Encodings.UTF8)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(rs as RecordSet)
		  'Name = rs.field("constraint_name").StringValue
		  Table = rs.Field("table_name").StringValue
		  Column = rs.Field("column_name").StringValue
		  ForeignTable = rs.Field("foreign_table_name").StringValue
		  ForeignColumn = rs.Field("foreign_column_name").StringValue
		  Name = Table + "." + Column + " = " + ForeignTable + "." + ForeignColumn
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(fk as String)
		  Name = replaceAll(fk," -> "," = ")
		  
		  dim data(), table1(), table2() as String
		  
		  data = Split(fk, " -> ")
		  table1 = Split(data(0),".")
		  table2 = Split(data(1),".")
		  
		  Table = table1(0)
		  Column = table1(1)
		  ForeignTable = table2(0)
		  ForeignColumn = Table2(1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(sName as String, entry As xojo.Core.Dictionary)
		  Table = entry.Value("Table")
		  Column = entry.Value("Column")
		  ForeignTable = entry.Value("ForeignTable")
		  ForeignColumn = entry.Value("ForeignColumn")
		  Name = Table + "." + Column + " = " + ForeignTable + "." + ForeignColumn
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SerializeJSON() As JSONItem
		  dim jKey as New JSONItem
		  
		  jKey.Value("Table") = Table
		  jKey.Value("Column") = Column
		  jKey.Value("ForeignTable") = ForeignTable
		  jKey.Value("ForeignColumn") = ForeignColumn
		  jKey.Value("Name") = Name
		  
		  Return jKey
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Column As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ForeignColumn As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ForeignTable As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Name As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Table As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Column"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ForeignColumn"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ForeignTable"
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
			Name="Super"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Table"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
