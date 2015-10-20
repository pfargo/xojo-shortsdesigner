#tag Class
Protected Class PAFQueryCondition
	#tag Method, Flags = &h0
		Function Compare(other As PAFQueryCondition) As Integer
		  if self.Field = other.Field then
		    
		    if self.Operator = other.Operator then
		      
		      if self.AndOr = other.AndOr then
		        
		        if other.Value = "?" then
		          
		          Return 1
		          
		        else
		          
		          Return 0
		          
		        end if
		        
		      end if
		      
		    end if
		    
		  end if
		  
		  Return 0
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor()
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(nCondition As JSONItem)
		  me.Field = nCondition.Lookup("field","").StringValue.DefineEncoding(Encodings.UTF8)
		  me.Type = nCondition.Lookup("type","").StringValue.DefineEncoding(Encodings.UTF8)
		  me.Operator = nCondition.Lookup("operator","").StringValue.DefineEncoding(Encodings.UTF8)
		  me.Value = nCondition.Lookup("value","").StringValue.DefineEncoding(Encodings.UTF8)
		  me.AndOr = nCondition.Lookup("andOr","").StringValue.DefineEncoding(Encodings.UTF8)
		  me.Leading = nCondition.Lookup("leading",0).IntegerValue
		  me.Trailing = nCondition.Lookup("trailing",0).IntegerValue
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SerializeJSON() As JSONItem
		  dim jOut as New JSONItem
		  
		  jOut.Value("andOr") = me.AndOr
		  
		  jOut.Value("field") = me.Field
		  
		  'jOut.Value("leading") = me.Leading
		  
		  jOut.Value("operator") = me.Operator
		  
		  'jOut.Value("trailing") = me.Trailing
		  
		  jOut.Value("type") = me.Type
		  
		  jOut.Value("value") = me.Value
		  
		  Return jOut
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		AndOr As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim sql, fldType, dbType, dbms As String
			  
			  Dim specialOperators() As string = Array("IS NULL", "IS NOT NULL")
			  
			  dbType = NthField(Type,"|",1)
			  fldType = NthField(Type,"|",2)
			  
			  if dbType = "ODBC" then
			    dbms = NthField(Type,"|",3)
			  end if
			  
			  
			  if me.Leading > 0 then
			    For i As Integer = 1 to me.Leading
			      sql = sql + "("
			    Next
			  end if
			  
			  if specialOperators.IndexOf(me.Operator) > -1 then
			    
			    sql = me.Field + " " + me.Operator
			    
			  elseif me.Operator = "Starts With" then
			    
			    sql = sql + me.Field + " " + "Like" + " '" + me.Value + "%'"
			    
			  elseif me.Operator = "Contains" then
			    
			    sql = sql + me.Field + " " + "Like" + " '%" + me.Value + "%'"
			    
			  elseif me.Operator = "Ends With" then
			    
			    sql = sql + me.Field + " " + "Like" + " '%" + me.Value + "'"
			    
			  elseif me.Operator = "In" then
			    
			    sql = sql + me.Field + " " + me.Operator + " " + me.Value
			    
			  else
			    
			    Select Case fldType
			      
			    Case "String", "Date", "Time", "TimeStamp", "Unknown"
			      
			      if dbType = "odbc" and dbms = "FileMaker" and fldType = "Date" then
			        
			        sql = sql + me.Field + " " + me.Operator + "{D '" + me.Value + "'}"
			        
			      else
			        
			        sql = sql + me.Field + " " + me.Operator + " '" + me.Value + "'"
			        
			      end if
			      
			    Case "Integer", "Double", "Int32", "Int64"
			      
			      sql = sql + me.Field + " " + me.Operator + " " + me.Value
			      
			    end Select
			    
			  end if
			  
			  if me.Trailing > 0 then
			    For i As Integer = 1 to me.Trailing
			      sql = sql + ")"
			    Next
			  end if
			  
			  Return sql
			End Get
		#tag EndGetter
		ConditionString As String
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Field As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Leading As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Operator As String
	#tag EndProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  Dim sql, fldType, dbType As String
			  
			  Dim specialOperators() As string = Array("IS NULL", "IS NOT NULL")
			  
			  dbType = NthField(Type,"|",1)
			  fldType = NthField(Type,"|",2)
			  
			  
			  if me.Leading > 0 then
			    For i As Integer = 1 to me.Leading
			      sql = sql + "("
			    Next
			  end if
			  
			  if specialOperators.IndexOf(me.Operator) > -1 then
			    
			    sql = me.Field + " " + me.Operator
			    
			  elseif me.Operator = "Like" or me.OPerator = "Starts With" or me.Operator =  "Contains" or me.Operator = "Ends With" then
			    
			    sql = sql + me.Field + " " + "Like" + " ?"
			    
			  elseif me.Operator = "In" then
			    
			    sql = sql + me.Field + " " + me.Operator + " ?"
			    
			  else
			    
			    Select Case fldType
			      
			    Case "String", "Date", "Time", "TimeStamp", "Unknown"
			      
			      sql = sql + me.Field + " " + me.Operator + " ?"
			      
			    Case "Integer", "Double", "Int32", "Int64"
			      
			      sql = sql + me.Field + " " + me.Operator + " ?"
			      
			    end Select
			    
			  end if
			  
			  if me.Trailing > 0 then
			    For i As Integer = 1 to me.Trailing
			      sql = sql + ")"
			    Next
			  end if
			  
			  Return sql
			End Get
		#tag EndGetter
		PreparedString As String
	#tag EndComputedProperty

	#tag ComputedProperty, Flags = &h0
		#tag Getter
			Get
			  if me.Operator = "Starts With" then
			    
			    Return me.Value + "%"
			    
			  elseif me.Operator = "Contains" then
			    
			    Return "%" + me.Value + "%"
			    
			  elseif me.Operator = "Ends With" then
			    
			    Return "%" + me.Value
			    
			  elseif me.Operator = "Is Not Null" or me.operator = "Is Null" then
			    
			    Return me.Operator
			    
			  else
			    
			    Return me.Value
			    
			  end if
			End Get
		#tag EndGetter
		PreparedValue As String
	#tag EndComputedProperty

	#tag Property, Flags = &h0
		Trailing As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		Type As String
	#tag EndProperty

	#tag Property, Flags = &h0
		Value As String
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AndOr"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="ConditionString"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Field"
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
			Name="Leading"
			Group="Behavior"
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
			Name="Operator"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PreparedString"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="PreparedValue"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
		#tag ViewProperty
			Name="Trailing"
			Group="Behavior"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Type"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Value"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
