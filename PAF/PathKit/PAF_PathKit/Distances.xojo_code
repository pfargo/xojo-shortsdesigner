#tag Class
Private Class Distances
	#tag Method, Flags = &h0
		Sub Constructor(oRoot As Cell)
		  Root = oRoot
		  Cells = New Dictionary
		  
		  cells.Value(Root) = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetCells() As Cell()
		  Dim oCells() As Cell
		  
		  For each oCell as Cell in Cells.keys
		    oCells.Append oCell
		  Next
		  
		  Return oCells
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetDistance(oCell As Cell) As Integer
		  Return Cells.Lookup(oCell, -1).IntegerValue
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function KeysToCells() As Cell()
		  Dim oCells() As Cell
		  
		  Dim v() As Variant
		  
		  v = Cells.Keys
		  
		  For i as integer = 0 to v.Ubound
		    
		    oCells.Append Cell(v(i))
		    
		  Next
		  
		  Return oCells
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Max() As Cell
		  Dim maxCell As Cell = root
		  
		  For i as integer = 1 to Cells.Count
		    
		    if Cells.Value(Cells.key(i-1)).IntegerValue > Cells.Value(maxCell).IntegerValue then
		      
		      maxCell = Cells.Key(i-1)
		      
		    end if
		    
		  Next
		  
		  Return maxCell
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function MaxDistance() As Integer
		  Dim iDist() As Integer = ValuesToInteger
		  
		  iDist.Sort
		  
		  Return IDist(idist.Ubound)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PathTo(goal As Cell) As Distances
		  Dim neighbors(), neighbor As Cell
		  
		  Dim current as cell = goal
		  
		  Dim breadcrumbs As New Distances(root)
		  
		  if not Cells.HasKey(Current) then
		    
		    Return nil
		    
		  end if
		  
		  breadcrumbs.Cells.value(Current) = cells.Value(current)
		  
		  Do
		    
		    neighbors = Current.GetLinks
		    
		    For i as integer = 0 to neighbors.Ubound
		      
		      neighbor = neighbors(i)
		      
		      if cells.Value(neighbor) < cells.Value(Current) then
		        
		        breadcrumbs.Cells.Value(neighbor) = cells.Value(neighbor)
		        
		        current = neighbor
		        
		        exit
		        
		      end if
		      
		    next
		    
		  loop until current = root
		  
		  Return breadcrumbs
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetDistance(oCell As Cell, distance As Integer)
		  Cells.Value(oCell) = distance
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ValuesToInteger() As Integer()
		  Dim iDistances() As Integer
		  
		  Dim v() As Variant
		  
		  v = Cells.Values
		  
		  For i as integer = 0 to v.Ubound
		    
		    iDistances.Append v(i).IntegerValue
		    
		  Next
		  
		  Return iDistances
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		Cells As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		Root As Cell
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
