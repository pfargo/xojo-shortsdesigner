#tag Module
Protected Module PAF_PathKit
	#tag Method, Flags = &h1
		Protected Sub BuildPathingCells(oDBWrapper as PAF_DatabaseKit.DBWrapper)
		  RandomSeed = New Random
		  
		  DictCells = New Dictionary
		  
		  Dim oCell As Cell
		  // because the SchemaDict for a filtered schema is brought in
		  // in a parseJSON call the keys are text. We need string
		  // Ah the joy of using 2 frameworks!
		  Dim sKey As String
		  
		  For each entry as xojo.Core.DictionaryEntry in oDBWrapper.SchemaDict
		    sKey = entry.key
		    DictCells.Value(sKey) = New Cell(entry.Key)
		    
		  next
		  
		  Dim oKeys() As Variant = DictCells.Keys
		  
		  Dim vValues() As Variant = DictCells.Values
		  
		  For i as integer = 0 to oKeys.Ubound
		    
		    oCell = vValues(i)
		    
		    oCell.SetLinks(oDBWrapper)
		    
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function DijkstraPathTo(StartCell As Cell, EndCell As Cell) As String()
		  dim startDistances, oDistances As Distances
		  
		  Dim oCell As Cell
		  
		  dim arsJoinPath() As string
		  
		  // perform the Dijkstra distance Algorithm
		  startDistances = StartCell.Distances
		  
		  // perform the pathTo algorithm
		  oDistances = startDistances.PathTo(EndCell)
		  
		  if oDistances = nil then
		    
		    Return arsJoinPath
		    
		  end if
		  
		  // assign the values
		  
		  Dim vKeys() As Variant = oDistances.Cells.Keys
		  
		  // we start from the start table
		  arsJoinPath.Append StartCell.Table
		  
		  // index(0) is the start table. The rest of the cells are in reverse order
		  For i as integer = vKeys.Ubound DownTo 1
		    
		    oCell = vKeys(i)
		    
		    arsJoinPath.Append oCell.Table
		    
		  next
		  
		  Return arsJoinPath
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		DictCells As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		RandomSeed As Random
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
End Module
#tag EndModule
