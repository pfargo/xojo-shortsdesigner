#tag Class
Protected Class ScriptContext
	#tag Method, Flags = &h0
		Sub Constructor(oBand As PAF_PrintKit.PrintBand, oDict As Dictionary)
		  mBand = oBand
		  DictFields = oDict
		  
		  DictItems = New Dictionary
		  
		  For each item as PAF_PrintKit.PrintItem in mBand.Items
		    
		    if item.UID <> "" then
		      
		      DictItems.Value(item.UID) = item
		      
		    end if
		    
		  Next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SC_GetFieldDoubleValue(sFieldName as String) As Double
		  Dim oPrintItem as PAF_PrintKit.PrintItem = DictItems.Lookup(sFieldName,nil)
		  
		  if oPrintItem isa PAF_PrintKit.PrintField then
		    
		    Return DictFields.lookup(PAF_PrintKit.PrintField(oPrintItem).Data,nil)
		    
		  else
		    
		    Return 0.00
		    
		  end if
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SC_GetFieldIntegerValue(sFieldName as String) As Integer
		  Dim oPrintItem as PAF_PrintKit.PrintItem = DictItems.Lookup(sFieldName,nil)
		  
		  if oPrintItem isa PAF_PrintKit.PrintField then
		    
		    Return DictFields.lookup(PAF_PrintKit.PrintField(oPrintItem).Alias,nil)
		    
		  else
		    
		    Return 0
		    
		  end if
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SC_GetFieldRecordsetName(sFieldName as String) As String
		  Dim oPrintItem as PAF_PrintKit.PrintItem =  DictItems.Lookup(sFieldName,nil)
		  
		  if oPrintItem isa PAF_PrintKit.PrintField then
		    
		    Return DictFields.lookup(PAF_PrintKit.PrintField(oPrintItem).Data,"")
		    
		  else
		    
		    Return ""
		    
		  end if
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SC_GetFieldStringValue(sFieldName as String) As String
		  Dim oPrintItem as PAF_PrintKit.PrintItem = DictItems.Lookup(sFieldName,nil)
		  
		  if oPrintItem isa PAF_PrintKit.PrintField then
		    
		    Return DictFields.lookup(PAF_PrintKit.PrintField(oPrintItem).Data,nil)
		    
		  else
		    
		    Return ""
		    
		  end if
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SC_SetPicture(sItem As String, sImageName As String)
		  if DictItems.Lookup(sItem,nil) <> nil then
		    
		    if DictItems.Value(sItem) isa PAF_PrintKit.PrintImage then
		      
		      PAF_PrintKit.PrintImage(DictItems.Value(sItem)).name = sImageName
		      
		    end if
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SC_SetStyle(sItem as string, sStyle As String)
		  Dim oPrintItem as PAF_PrintKit.PrintItem =  DictItems.Lookup(sItem,nil)
		  
		  if oPrintItem isa PAF_PrintKit.PrintText then
		    
		    PAF_PrintKit.PrintText(oPrintItem).ShortsStyle = sStyle
		    
		  elseif oPrintItem isa PAF_PrintKit.PrintRect then
		    
		    PAF_PrintKit.PrintRect(oPrintItem).ShortsStyle = sStyle
		    
		  elseif oPrintItem isa PAF_PrintKit.PrintOval then
		    
		    PAF_PrintKit.PrintOval(oPrintItem).ShortsStyle = sStyle
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SC_SetTextItemValue(sItem as string, sValue As String)
		  Dim oPrintItem as PAF_PrintKit.PrintItem =  DictItems.Lookup(sItem,nil)
		  
		  if oPrintItem isa PAF_PrintKit.PrintText then
		    
		    PAF_PrintKit.PrintText(oPrintItem).Data = sValue
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private DictFields As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private DictItems As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private mBand As PAF_PrintKit.PrintBand
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
