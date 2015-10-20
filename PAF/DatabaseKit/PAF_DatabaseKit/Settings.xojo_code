#tag Module
Protected Module Settings
	#tag Constant, Name = kUseCubeSQL, Type = Boolean, Dynamic = False, Default = \"True", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kUseMySQL, Type = Boolean, Dynamic = False, Default = \"True", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kUseODBC, Type = Boolean, Dynamic = False, Default = \"True", Scope = Protected
	#tag EndConstant

	#tag Constant, Name = kUsePostgreSQL, Type = Boolean, Dynamic = False, Default = \"True", Scope = Protected
	#tag EndConstant


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
	#tag EndViewBehavior
End Module
#tag EndModule
