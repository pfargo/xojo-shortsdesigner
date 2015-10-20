#tag Class
Protected Class ListItem
	#tag Method, Flags = &h0
		Sub Draw(g as Graphics, iTop as Integer)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Update(vValue as Variant)
		  if not vValue.equals(Value) then
		    
		    if me isa TextProperty and vValue = "" and not TextProperty(me).BlankAllowed then
		      
		      // do nothing - blank not allowed
		      
		    else
		      
		      Value = vValue
		      
		      UpdatePropertyObject
		      
		      dim typ as Introspection.TypeInfo
		      
		      typ = Introspection.GetType(me)
		      
		      if typ.FullName = "EnumProperty" then
		        
		        Value = PAF_PropertyListKit.EnumProperty(me).ItemsDict.Value(vValue)
		        
		      end if
		      
		      pfDispatcher.send "PListChanged", me.Caption, me
		      
		    end if
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdatePropertyObject()
		  dim obj as Object
		  
		  dim bDoneFlag as Boolean = false
		  
		  dim count as integer = PropertyObjects.Ubound
		  
		  For i as integer = 0 to count
		    
		    obj = PropertyObjects(i)
		    
		    if i = count then bDoneFlag = true
		    
		    dim typ as Introspection.TypeInfo = Introspection.GetType(obj)
		    
		    dim Prop, Props() as Introspection.PropertyInfo
		    
		    Props = typ.GetProperties
		    
		    For each prop in Props
		      if prop.name = caption then
		        prop.Value(obj) = me.Value
		        if obj IsA pListUpdatable then
		          PListUpdatable(obj).ValueChanged(caption, bDoneFlag)
		        end if
		        exit
		      end if
		    Next
		    
		  Next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Caption As String
	#tag EndProperty

	#tag Property, Flags = &h0
		PropertyObjects() As Object
	#tag EndProperty

	#tag Property, Flags = &h0
		Value As Variant
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="Caption"
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
			Name="Top"
			Visible=true
			Group="Position"
			InitialValue="0"
			Type="Integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
