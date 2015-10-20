#tag Class
Protected Class CheckboxProperty
Inherits ListItem
	#tag Method, Flags = &h1000
		Sub Constructor(sCaption as String, vValue as Variant)
		  Caption = sCaption
		  Value = vValue
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw(g as Graphics, iTop as Integer)
		  g.Bold = false
		  
		  dim sProperty as String = me.Caption + ":"
		  dim sValue as String = me.Value.StringValue
		  
		  g.DrawString(sProperty, g.Width/2 - g.StringWidth(sProperty) - 4, iTop + g.TextHeight - (g.TextHeight-g.TextAscent))
		  
		  #IF TargetWin32 then
		    
		    if sValue = "true" then
		      
		      g.DrawPicture(ChkSmallCheckedWin,g.Width/2 + 4, iTop)
		      
		    elseif sValue = "false" then
		      
		      g.DrawPicture(ChkSmallWin,g.Width/2 + 4, iTop)
		      
		    else
		      
		      g.DrawPicture(ChkSmallOtherWin,g.Width/2 + 4, iTop)
		      
		    end if
		    
		  #elseif TargetMacOS then
		    
		    if sValue = "true" then
		      
		      g.DrawPicture(ChkSmallChecked,g.Width/2 + 4, iTop)
		      
		    elseif sValue = "false" then
		      
		      g.DrawPicture(ChkSmall,g.Width/2 + 4, iTop)
		      
		    else
		      
		      g.DrawPicture(ChkSmallOther,g.Width/2 + 4, iTop)
		      
		    end if
		    
		  #EndIf
		  
		End Sub
	#tag EndMethod


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
