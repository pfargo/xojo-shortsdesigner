#tag Class
Protected Class TextProperty
Inherits ListItem
	#tag Method, Flags = &h1000
		Sub Constructor(sCaption as String, vValue as Variant, optional bReadOnly As Boolean = false)
		  Caption = sCaption
		  Value = vValue
		  ReadOnly = bReadOnly
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw(g as Graphics, iTop as Integer)
		  g.Bold = false
		  
		  dim sProperty, sValue, sDisplayString as String
		  
		  dim idisplayWidth as Integer = g.Width/2 - 8
		  
		  sProperty = me.Caption + ":"
		  
		  if me.Value = nil then
		    
		    sValue = ""
		    
		  else
		    
		    dim typ as Introspection.TypeInfo = Introspection.GetType(me.Value)
		    
		    if typ = nil then
		      
		      sValue =  me.Value.StringValue
		      
		      if g.StringWidth(sValue) > idisplayWidth then
		        
		        me.IsTextArea = true
		        
		        dim i as Integer
		        
		        while g.StringWidth(sDisplayString) < idisplayWidth - 10 - 4
		          
		          sDisplayString = sDisplayString + mid(sValue,i,1)
		          
		          i = i + 1
		          
		        Wend
		        
		      end if
		      
		    else
		      
		      sValue = typ.name
		      
		    end if
		    
		    
		  end if
		  
		  g.DrawString(sProperty, g.Width/2 - g.StringWidth(sProperty) - 4, iTop + g.TextHeight - (g.TextHeight-g.TextAscent))
		  
		  If sDisplayString = "" then
		    
		    g.DrawString(sValue, g.Width/2 + 4, iTop + g.TextHeight - (g.TextHeight-g.TextAscent))
		    
		  else
		    
		    g.DrawString(sDisplayString, g.Width/2 + 4, iTop + g.TextHeight - (g.TextHeight-g.TextAscent),idisplayWidth)
		    
		  end if
		  
		  if IsTextArea and not ReadOnly then
		    
		    g.ForeColor = &cA4A4A4
		    
		    g.fillOval(g.Width - 10 - 4, iTop, 10, 10)
		    
		    g.ForeColor = &cFFFFFF
		    
		    g.DrawString("...", g.Width - 10 - 4, itop + 7)
		    
		    g.ForeColor = &c000000
		    
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		BlankAllowed As Boolean = True
	#tag EndProperty

	#tag Property, Flags = &h0
		IsTextArea As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		ReadOnly As Boolean = false
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="BlankAllowed"
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="IsTextArea"
			Group="Behavior"
			InitialValue="false"
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
			Name="Name"
			Visible=true
			Group="ID"
			Type="String"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ReadOnly"
			Group="Behavior"
			InitialValue="false"
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
	#tag EndViewBehavior
End Class
#tag EndClass
