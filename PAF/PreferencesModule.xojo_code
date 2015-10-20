#tag Module
Protected Module PreferencesModule
	#tag Method, Flags = &h0
		Function GetPref(Name As String) As Variant
		  if dictPrefs = nil then Return nil
		  
		  Dim p As New Pref
		  
		  
		  If dictPrefs.HasKey(Name) then
		    P = dictPrefs.Value(Name)
		    if p.Type = "String" then
		      return p.Value.StringValue
		    elseif p.Type = "Boolean" then
		      return p.Value.BooleanValue
		    elseif p.Type = "Integer" then
		      Return p.Value.IntegerValue
		    elseif p.Type = "Array" then
		      Return p.Value.StringValue
		    end if
		  else
		    
		    
		    
		    Return nil
		  end if
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ReadPrefs()
		  //Read Prefs
		  
		  if dictPrefs = nil then dictPrefs = new Dictionary
		  
		  Dim f As FolderItem
		  Dim t As TextInputStream
		  Dim s As String
		  Dim p As Pref
		  
		  
		  f = SpecialFolder.ApplicationData.Child(kAppName)
		  if Not f.Exists then f.CreateAsFolder
		  f = f.Child(kAppName + " preferences.json")
		  
		  if f <> nil and f.Exists then
		    t = TextInputStream.Open(f)
		    if t <> nil then
		      s = t.ReadAll
		      t.Close
		      
		      if s <> "" then
		        
		        try
		          
		          Dim jPrefs As New JSONItem
		          
		          jPrefs.Load(s)
		          
		          for i as integer = 0 to jPrefs.Count - 1
		            
		            p = new pref(jPrefs.Child(i))
		            
		            dictPrefs.Value(p.name) = p
		            
		          next
		        catch JSONException
		          
		          MsgBox "It appears your preference file is obsolete or corrupted" + EndOfLine + "Please reset your preferences"
		          
		          PreferencesWindow.Show
		          
		        end try
		        
		      end if
		      
		    end if
		    
		  end if
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetPref(Name As String, Type As String, Value As Variant)
		  Dim p As New Pref
		  
		  If dictPrefs.HasKey(Name) then
		    P = dictPrefs.Value(Name)
		    p.Value = Value
		  else
		    p.Name = Name
		    p.Type = Type
		    p.Value = Value
		    dictPrefs.Value(Name) = p
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub WritePrefs()
		  //WritePrefs
		  
		  Dim f As FolderItem
		  Dim t As TextOutputStream
		  Dim i, count As Integer
		  Dim p As New Pref
		  
		  f = SpecialFolder.ApplicationData.Child(kAppName).Child(kAppName + " preferences.json")
		  
		  Dim jPrefs As New JSONItem
		  Dim jItem As JSONItem
		  
		  if f <> nil then
		    t = TextOutputStream.Create(f)
		    if t <> nil then
		      count = dictPrefs.Count - 1
		      for i = 0 to count
		        p = dictPrefs.Value(dictPrefs.Key(i))
		        
		        jItem = new JSONItem
		        jItem.Value("name") = p.name
		        jItem.Value("type") = p.type
		        jItem.Value("data") = p.value
		        
		        jPrefs.Append jItem
		        
		      Next
		      jPrefs.Compact = false
		      t.Write jPrefs.ToString
		      t.Close
		    end if
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		dictPrefs As Dictionary
	#tag EndProperty


	#tag Constant, Name = kAppName, Type = String, Dynamic = False, Default = \"Shorts Designer", Scope = Public
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
