#tag Class
Protected Class Logger
	#tag Method, Flags = &h0
		Sub constructor()
		  Dim d as new date
		  
		  Dim sDate As string = "Designer_Debug_" + d.SQLDate + ".txt"
		  
		  DebugLog = SpecialFolder.Desktop.Child(sDate)
		  
		  if DebugLog <> nil then
		    
		    Post("##### App launched: " + d.SQLDateTime)
		    
		  else
		    
		    MsgBox "Could not create debug log"
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Post(entry As String)
		  if DebugLog <> nil then
		    
		    if DebugLog.Exists then
		      
		      Try
		        Dim t as TextOutputStream = TextOutputStream.Append(DebugLog)
		        Try
		          t.WriteLine(entry)
		        Finally
		          t.Close
		          t = nil
		        End Try
		      Catch e as IOException
		        MsgBox "IOException writing to debug log" + EndOfLine + e.Message
		      End Try
		      
		    else
		      
		      Try
		        Dim t as TextOutputStream = TextOutputStream.Create(DebugLog)
		        Try
		          t.WriteLine(entry)
		        Finally
		          t.Close
		          t = nil
		        End Try
		      Catch e as IOException
		        MsgBox "IOException creating debug log" + EndOfLine + e.Message
		      End Try
		      
		    end if
		    
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		DebugLog As FolderItem
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
	#tag EndViewBehavior
End Class
#tag EndClass
