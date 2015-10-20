#tag Class
Protected Class Pref
	#tag Method, Flags = &h0
		Sub constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(jPref As JSONItem)
		  
		  me.Name = jPref.Value("name").StringValue.DefineEncoding(Encodings.UTF8)
		  me.Type = jPref.Value("type").StringValue.DefineEncoding(Encodings.UTF8)
		  me.Value = jPref.Value("data").StringValue.DefineEncoding(Encodings.UTF8)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Name As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Type As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Value As Variant
	#tag EndProperty


	#tag ViewBehavior
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Type"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
