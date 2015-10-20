#tag Class
Protected Class Cell
	#tag Method, Flags = &h0
		Sub Constructor(sName As String)
		  Links = New Dictionary
		  
		  Table = sName
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Distances() As Distances
		  Dim oDistances as new Distances(self)
		  
		  Dim frontier(), newFrontier(), oLink As Cell
		  
		  Dim vValues() As Variant
		  
		  frontier.Append self
		  
		  while frontier.Ubound > -1
		    
		    ReDim newFrontier(-1)
		    
		    For each oCell as Cell in frontier
		      
		      vValues() = oCell.Links.Values
		      
		      For i as integer = 0 to vValues.Ubound
		        
		        oLink = vValues(i)
		        
		        if oDistances.GetDistance(oLink) > -1 then
		          
		          continue
		          
		        end if
		        
		        oDistances.Cells.Value(oLink) = oDistances.Cells.Value(oCell).IntegerValue + 1
		        
		        newFrontier.Append oLink
		      next
		      
		    next
		    
		    Redim frontier(-1)
		    
		    For i as integer = 0 to newFrontier.Ubound
		      
		      frontier.Append newFrontier(i)
		      
		    Next
		    
		  wend
		  
		  Return oDistances
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetLinks() As Cell()
		  Dim oCells() As Cell
		  
		  Dim oValues() As Variant = links.Values
		  
		  For each v as Variant in oValues
		    
		    oCells.Append v
		    
		  Next
		  
		  Return oCells
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Link(oCell As Cell, bidirectional As Boolean = true)
		  Links.Value(oCell) = true
		  
		  if bidirectional then
		    oCell.Link(me, false)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Linked(oCell As Cell) As Boolean
		  Dim oResultCell As Variant = links.Lookup(oCell,nil)
		  
		  if oResultCell = nil then
		    
		    Return false
		    
		  else
		    
		    Return Links.Value(oCell).BooleanValue
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Neighbors() As Cell()
		  ' Dim list() As Cell
		  '
		  ' if North <> nil then list.Append North
		  ' if South <> nil then list.Append South
		  ' if East <> nil then list.Append East
		  ' if West <> nil then list.Append West
		  '
		  ' Return list
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function RandomNeighbor() As Cell
		  dim aroNeighbors() As cell = Neighbors
		  
		  dim i As integer = RandomSeed.InRange(0,aroNeighbors.Ubound)
		  
		  Return aroNeighbors(i)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetLinks(oDBWrapper as PAF_DatabaseKit.DBWrapper)
		  For each oKey as PAF_DatabaseKit.ForeignKey in oDBWrapper.ForeignKeys
		    
		    if oKey.Table = Table then
		      
		      if DictCells.HasKey(oKey.ForeignTable) then
		        
		        links.Value(oKey.ForeignTable) = DictCells.Value(oKey.ForeignTable)
		        
		      else
		        
		        Dim sAlert As String = "This report uses a table named " + oKey.ForeignTable _
		        + EndOfLine + "which is not present in the database schema."
		        
		        MsgBox sAlert
		        
		      end if
		      
		    elseif oKey.ForeignTable = Table then
		      
		      if DictCells.HasKey(oKey.Table) then
		        
		        links.Value(oKey.Table) = DictCells.Value(oKey.Table)
		        
		      else
		        
		        Dim sAlert As String = "This report uses a table named " + oKey.Table _
		        + EndOfLine + "which is not present in the database schema."
		        
		        MsgBox sAlert
		        
		      end if
		      
		    end if
		    
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Unlink(oCell As Cell, bidirectional As Boolean = true)
		  Links.Remove(oCell)
		  
		  if bidirectional then
		    oCell.Unlink(me, false)
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UnlinkedNeighbors() As Cell()
		  dim result() As Cell
		  
		  For each oNeighbor as Cell in Neighbors
		    
		    if not me.Linked(oNeighbor) then
		      
		      result.Append oNeighbor
		      
		    end if
		    
		  next
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UnvisitedNeighbors() As Cell()
		  dim result() As Cell
		  
		  For each oNeighbor as Cell in Neighbors
		    
		    if oNeighbor.GetLinks.Ubound = -1 then
		      
		      result.Append oNeighbor
		      
		    end if
		    
		  next
		  
		  Return result
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VisitedNeighbors() As Cell()
		  dim result() As Cell
		  
		  For each oNeighbor as Cell in Neighbors
		    
		    if oNeighbor.GetLinks.Ubound <> -1 then
		      
		      result.Append oNeighbor
		      
		    end if
		    
		  next
		  
		  Return result
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Links As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		Table As String
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
			Name="Table"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
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
