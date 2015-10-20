#tag Class
Protected Class App
Inherits Application
	#tag Event
		Sub Close()
		  if dictPrefs <> nil then WritePrefs
		  
		  if DictStyles <> nil then SaveStyles
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  me.AutoQuit = true
		  
		  ReadPrefs
		  
		  LoadStyles
		  
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub OpenDocument(item As FolderItem)
		  dim w as new DesignerWindow
		  
		  w.DesignSpace.OpenReport(item)
		  
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub LoadStyles()
		  '## Customize ##
		  
		  ' provide path to saved styles (logical place is your app support directory)
		  ' kAppName is a constant in a module for my use
		  
		  if DictStyles = nil then DictStyles = new Dictionary
		  
		  Dim f, fAppDataDirectory as FolderItem
		  Dim t As TextInputStream
		  
		  Dim jStyles, jStyle As JSONItem
		  Dim oStyle As PAF_PrintKit.PrintStyle
		  
		  fAppDataDirectory = SpecialFolder.ApplicationData.Child(kAppName)
		  if Not fAppDataDirectory.Exists then fAppDataDirectory.CreateAsFolder
		  if fAppDataDirectory.Exists then
		    
		    f = fAppDataDirectory.Child("Styles")
		    
		    if f <> nil and f.exists then
		      t = TextInputStream.Open(f)
		      if t <> nil then
		        jStyles = New JSONItem(t.ReadAll)
		        t.Close
		        
		        if DictStyles = nil then
		          DictStyles = new Dictionary
		        end if
		        
		        For i as integer = 0 to jStyles.Count - 1
		          
		          jStyle = jStyles(i)
		          
		          oStyle = new PAF_PrintKit.PrintStyle(jStyle)
		          
		          if not DictStyles.HasKey(oStyle.name) then
		            
		            DictStyles.Value(oStyle.name) = oStyle
		            
		          end if
		          
		          
		        next
		        
		      end if
		      
		    end if
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PrepStylesForSave() As String
		  dim sKeys() as string = VariantArrayToStringArray(DictStyles.keys)
		  
		  dim oStyle as PAF_PrintKit.PrintStyle
		  
		  dim jStyle, jStyles as JSONItem
		  
		  jStyles = new JSONItem
		  
		  for i as integer = 0 to sKeys.Ubound
		    
		    oStyle = DictStyles.Value(sKeys(i))
		    
		    if left(oStyle.name,11) <> "ShapeStyle_" then
		      
		      jStyle = PAF_PrintKit.PrintStyle.SerializeJSON(oStyle)
		      
		      jStyles.Append jStyle
		      
		    end if
		    
		  next
		  
		  jStyles.Compact = false
		  
		  return jStyles.ToString
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveStyles()
		  '## Customize ##
		  
		  ' provide path to saved styles (logical place is your app support directory)
		  ' kAppName is a constant in a module for my use
		  
		  Dim f, fAppDataDirectory as FolderItem
		  Dim t As TextOutputStream
		  
		  Dim sOutStyles As String = PrepStylesForSave
		  
		  fAppDataDirectory = SpecialFolder.ApplicationData.Child(kAppName)
		  if Not fAppDataDirectory.Exists then fAppDataDirectory.CreateAsFolder
		  if fAppDataDirectory.Exists then
		    
		    f = fAppDataDirectory.Child("Styles")
		    
		    if f <> nil then
		      t = TextOutputStream.Create(f)
		      if t <> nil then
		        t.Write sOutStyles
		        t.Close
		      end if
		      
		    end if
		  end if
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Log As Logger
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
	#tag EndViewBehavior
End Class
#tag EndClass
