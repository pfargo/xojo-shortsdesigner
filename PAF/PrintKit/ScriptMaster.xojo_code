#tag Class
Protected Class ScriptMaster
Inherits xojoscript
	#tag Event
		Function CompilerError(location As XojoScriptLocation, error As XojoScript.Errors, errorInfo As Dictionary) As Boolean
		  #Pragma Unused errorInfo
		  
		  system.debuglog "Error: " + ErrorCodeToString(error) + " Line (" + str(location.Line) + ")"
		  
		  LastError = ErrorCodeToString(error) + " Line (" + str(location.Line) + ")"
		End Function
	#tag EndEvent


	#tag Property, Flags = &h0
		LastError As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastError"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=true
			Group="Position"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Source"
			Visible=true
			Type="String"
			EditorType="String"
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
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
