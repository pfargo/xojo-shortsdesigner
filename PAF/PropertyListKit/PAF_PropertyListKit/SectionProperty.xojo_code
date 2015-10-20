#tag Class
Protected Class SectionProperty
Inherits ListItem
	#tag Method, Flags = &h1000
		Sub Constructor(sCaption as String)
		  Caption = sCaption
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Draw(g as Graphics, iTop as Integer)
		  g.Bold = true
		  
		  g.ForeColor = &cDBDFFF
		  
		  g.FillRect(0,iTop,g.Width,14)
		  
		  g.ForeColor = &c000000
		  g.Bold = true
		  
		  g.DrawString(me.Caption,4, iTop +  g.TextHeight - (g.TextHeight-g.TextAscent))
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
