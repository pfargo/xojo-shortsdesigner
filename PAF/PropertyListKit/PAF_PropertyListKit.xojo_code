#tag Module
Protected Module PAF_PropertyListKit
	#tag Method, Flags = &h0
		Sub GradientFill(extends g as Graphics, x as Integer, y as Integer, iWidth as Integer, iHeight as Integer, startColor as Color, endcolor as Color)
		  // Modified from an old Resexcellence article by Seth Willitis
		  // http://www.resexcellence.com/realbasic/articles/2004/02-07-04/index.shtml
		  
		  dim i as integer, ratio, endratio as Double
		  
		  // Draw the gradient
		  for i = iHeight DownTo 0
		    
		    // Determine the current line's color
		    ratio = (i/iHeight)
		    endratio = ((iHeight-i)/iHeight)
		    g.ForeColor = RGB(EndColor.Red * endratio + StartColor.Red * ratio, EndColor.Green * endratio + StartColor.Green * ratio, EndColor.Blue * endratio + StartColor.Blue * ratio)
		    
		    // Draw the step
		    g.DrawLine 0, i, iWidth, i
		  next
		  
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
End Module
#tag EndModule
