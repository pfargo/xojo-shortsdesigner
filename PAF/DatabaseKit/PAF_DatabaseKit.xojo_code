#tag Module
Protected Module PAF_DatabaseKit
	#tag Method, Flags = &h0
		Function BuildAggregateMenu() As MenuItem
		  Dim mi As New MenuItem
		  
		  mi.Append new MenuItem("")
		  mi.Append new menuitem("avg")
		  mi.Append new menuitem("count")
		  mi.Append new menuitem("max")
		  mi.Append new menuitem("min")
		  mi.Append new menuitem("sum")
		  
		  Return mi
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub BuildDateTimeMenu(base As MenuItem)
		  dim d As xojo.core.date = Xojo.core.Date.Now
		  
		  dim oItem As MenuItem
		  
		  dim dOld As new Global.Date(d.Year,d.Month,d.day,d.Hour,d.Minute,d.Second)
		  
		  oItem = new MenuItem(dOld.SQLDate)
		  oItem.tag = "SQL_Date"
		  base.Append oItem
		  
		  oItem = new MenuItem(Right(dOld.SQLDateTime,8))
		  oItem.tag = "SQL_Time"
		  base.Append oItem
		  
		  oItem = new MenuItem(dOld.SQLDateTime)
		  oItem.tag = "SQL_Timestamp"
		  base.Append oItem
		  
		  oItem = new MenuItem(MenuItem.TextSeparator)
		  base.Append oItem
		  
		  oItem = new MenuItem(d.ToText(xojo.core.locale.current, xojo.core.Date.FormatStyles.Full, xojo.core.Date.FormatStyles.medium))
		  oItem.tag = "TS_FullMedium"
		  base.Append oItem
		  
		  oItem = new MenuItem(d.ToText(xojo.core.locale.current, xojo.core.Date.FormatStyles.Full, xojo.core.Date.FormatStyles.Short))
		  oItem.tag = "TS_FullShort"
		  base.Append oItem
		  
		  oItem = new MenuItem(d.ToText(xojo.core.locale.current, xojo.core.Date.FormatStyles.Full, xojo.core.Date.FormatStyles.None))
		  oItem.tag = "D_FullNone"
		  base.Append oItem
		  
		  oItem = new MenuItem(d.ToText(xojo.core.locale.current, xojo.core.Date.FormatStyles.Long, xojo.core.Date.FormatStyles.medium))
		  oItem.tag = "TS_LongMedium"
		  base.Append oItem
		  
		  oItem = new MenuItem(d.ToText(xojo.core.locale.current, xojo.core.Date.FormatStyles.Long, xojo.core.Date.FormatStyles.Short))
		  oItem.tag = "TS_LongShort"
		  base.Append oItem
		  
		  oItem = new MenuItem(d.ToText(xojo.core.locale.current, xojo.core.Date.FormatStyles.Long, xojo.core.Date.FormatStyles.None))
		  oItem.tag = "D_LongNone"
		  base.Append oItem
		  
		  oItem = new MenuItem(d.ToText(xojo.core.locale.current, xojo.core.Date.FormatStyles.Medium, xojo.core.Date.FormatStyles.medium))
		  oItem.tag = "TS_MediumMedium"
		  base.Append oItem
		  
		  oItem = new MenuItem(d.ToText(xojo.core.locale.current, xojo.core.Date.FormatStyles.Medium, xojo.core.Date.FormatStyles.Short))
		  oItem.tag = "TS_MediumShort"
		  base.Append oItem
		  
		  oItem = new MenuItem(d.ToText(xojo.core.locale.current, xojo.core.Date.FormatStyles.Medium, xojo.core.Date.FormatStyles.None))
		  oItem.tag = "D_MediumNone"
		  base.Append oItem
		  
		  oItem = new MenuItem(d.ToText(xojo.core.locale.current, xojo.core.Date.FormatStyles.Short, xojo.core.Date.FormatStyles.medium))
		  oItem.tag = "TS_ShortMedium"
		  base.Append oItem
		  
		  oItem = new MenuItem(d.ToText(xojo.core.locale.current, xojo.core.Date.FormatStyles.Short, xojo.core.Date.FormatStyles.Short))
		  oItem.tag = "TS_ShortShort"
		  base.Append oItem
		  
		  oItem = new MenuItem(d.ToText(xojo.core.locale.current, xojo.core.Date.FormatStyles.Short, xojo.core.Date.FormatStyles.None))
		  oItem.tag = "D_ShortNone"
		  base.Append oItem
		  
		  oItem = new MenuItem(d.ToText(xojo.core.locale.current, xojo.core.Date.FormatStyles.None, xojo.core.Date.FormatStyles.medium))
		  oItem.tag = "T_NoneMedium"
		  base.Append oItem
		  
		  oItem = new MenuItem(d.ToText(xojo.core.locale.current, xojo.core.Date.FormatStyles.None, xojo.core.Date.FormatStyles.Short))
		  oItem.tag = "T_NoneShort"
		  base.Append oItem
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CreateSQLiteDatabase()
		  dim dbNew as New SQLiteDatabase
		  
		  dim dlg as New SaveAsDialog
		  dim f as FolderItem
		  dlg.InitialDirectory = GetFolderItem("")
		  
		  'dlg.Filter = NrptFIleType.NData
		  dlg.promptText = "Name your Database"
		  dlg.SuggestedFileName = "My Database.data"
		  dlg.Title = "Create Report Database"
		  
		  f = dlg.ShowModal()
		  
		  If f <> Nil then
		    
		    dbNew.DatabaseFile = f
		    
		    If not dbNew.CreateDatabaseFile() then
		      
		      MsgBox "Could not create database" + EndOfLine + dbNew.ErrorMessage
		      
		    end if
		    
		  Else
		    //user canceled
		  End if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function fieldTypeIntegerToDatabaseColumnType(fieldType as Integer, dbType as String) As String
		  Select Case fieldType
		    
		  Case 2,3,19
		    Return "integer"
		  Case 6,7,11,13
		    if dbType = "sqlite" OR dbType = "odbc" then
		      Return "double"
		    elseif dbType = "postgresql" then
		      Return "real"
		    end if
		  Case 4,5,18
		    Return "varchar"
		  Case 8
		    Return "Date"
		  Case 9
		    Return "Time"
		  Case 10
		    Return "TimeStamp"
		  Case 12
		    Return "Boolean"
		  else
		    return "Other"
		  end Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexOf(extends lb As Listbox, column As Integer, value As String) As Integer
		  For i As integer = 0 to lb.ListCount - 1
		    
		    if lb.Cell(i,column) = value then
		      
		      Return i
		      
		    end if
		    
		  next
		  
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function IndexOf(extends pm as PopupMenu, s as String) As Integer
		  for i as integer = 0 to pm.ListCount-1
		    if pm.list(i) = s then
		      Return i
		    end
		  next
		  
		  Return -1
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function PostgreSQLChangePlaceholders(sql as String) As String
		  // We need to replace the placeholders "?" with
		  // PostgreSQL placeholders (1 based)
		  // ie: $1, $2, $3 ...
		  
		  dim iPlaceHolderIndex as Integer = 0
		  
		  while InStr(sql,"?") > 0
		    
		    sql = Replace(sql,"?","$" + str(iPlaceHolderIndex+1))
		    
		    iPlaceHolderIndex = iPlaceHolderIndex + 1
		    
		  wend
		  
		  Return sql
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub RecordSetToDBTable(oDBWrapper as DBWrapper, rs as RecordSet)
		  if oDBWrapper = nil then
		    MsgBox "Database does not exist"
		    Return
		  end if
		  
		  if rs = nil or rs.EOF then
		    
		    MsgBox "There are no records to create a table with"
		    
		    Return
		    
		  end if
		  
		  Dim sTableName As String = PAFInputWin.GetInput("Enter name for new table","OK","Cancel","")
		  
		  if sTableName <> "" then
		    
		    oDBWrapper.SQLExecute "BEGIN TRANSACTION"
		    
		    oDBWrapper.SQLExecute "DROP Table IF EXISTS " + sTableName
		    
		    dim colCount, index, colType as Integer
		    dim fld, fldType, fieldDef, fieldList, valueList, insertDef, insertSQL, tableSQL as String
		    
		    insertDef = "INSERT INTO " + sTableName + " ("
		    fld = RemoveSpaces(rs.IdxField(1).Name)
		    
		    if instr(fld,".") > 0 then
		      
		      fld = NthField(fld,".",2)
		      
		    end if
		    
		    colType = rs.ColumnType(0)
		    
		    fldType = fieldTypeIntegerToDatabaseColumnType(colType, "sqlite")
		    
		    fieldDef = fld + " " + fldType
		    fieldList = fld
		    
		    tableSQL = "CREATE TABLE " + sTableName + " (" + fieldDef
		    
		    colCount = rs.FieldCount
		    for index = 2 to colCount
		      fld = RemoveSpaces(rs.IdxField(index).Name)
		      
		      if instr(fld,".") > 0 then
		        
		        fld = NthField(fld,".",2)
		        
		      end if
		      
		      colType = rs.ColumnType(index-1)
		      fldType = fieldTypeIntegerToDatabaseColumnType(colType, "sqlite")
		      
		      
		      fieldDef = fld + " " + fldType
		      tableSQL = tableSQL + ", " + fieldDef
		      fieldList = fieldList + "," + fld
		    Next
		    tableSQL = tableSQL + ")"
		    fieldList = fieldList + ")"
		    
		    oDBWrapper.SQLExecute(tableSQL)
		    
		    while not rs.EOF
		      
		      valueList = "(" + "'" + SQLFriendly(rs.IdxField(1).StringValue)
		      
		      
		      For index = 2 to colCount
		        
		        valueList = valueList + "'" + "," + "'" + SQLFriendly(rs.IdxField(index).StringValue)
		        
		      Next
		      
		      valueList = valueList + "'" + ")"
		      insertSQL = insertDef + fieldList + " VALUES " + valueList
		      oDBWrapper.SQLExecute(insertSQL)
		      If oDBWrapper.error then
		        MsgBox oDBWrapper.ErrorMessage + EndOfLine + insertSQL
		      End if
		      rs.MoveNext
		    wend
		    
		    oDBWrapper.SQLExecute "COMMIT"
		    
		    if oDBWrapper.Error then
		      
		      MsgBox "Error creating the table" + EndOfLine + oDBWrapper.ErrorMessage
		      
		    end if
		    
		  else
		    
		    MsgBox "You must provide a table name"
		    
		  end if
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RecordSetToInMemorySQLiteDatabase(rs as RecordSet) As SQLiteDatabase
		  if rs <> nil and not rs.EOF then
		    
		    
		    dim dbNew as New SQLiteDatabase
		    
		    call dbNew.Connect()
		    
		    dim colCount, index, colType as Integer
		    dim fld, fldType, fieldDef, fieldList, insertDef, insertSQL, tableSQL as String
		    
		    dim vList(), delimiter as string
		    
		    delimiter = chr(34) + "," + chr(34)
		    
		    insertDef = "INSERT INTO Report ("
		    fld = RemoveSpaces(rs.IdxField(1).Name)
		    
		    colType = rs.ColumnType(0)
		    
		    fldType = fieldTypeIntegerToDatabaseColumnType(colType, "sqlite")
		    
		    fieldDef = fld + " " + fldType
		    fieldList = fld
		    
		    tableSQL = "CREATE TABLE Report (" + fieldDef
		    
		    colCount = rs.FieldCount
		    for index = 2 to colCount
		      fld = RemoveSpaces(rs.IdxField(index).Name)
		      
		      colType = rs.ColumnType(index-1)
		      fldType = fieldTypeIntegerToDatabaseColumnType(colType, "sqlite")
		      
		      
		      fieldDef = fld + " " + fldType
		      tableSQL = tableSQL + ", " + fieldDef
		      fieldList = fieldList + "," + fld
		    Next
		    tableSQL = tableSQL + ")"
		    fieldList = fieldList + ")"
		    
		    dbNew.SQLExecute(tableSQL)
		    
		    dbNew.SQLExecute "BEGIN TRANSACTION"
		    
		    while not rs.EOF
		      
		      Redim vList(-1)
		      
		      vList.Append SQLFriendly(rs.IdxField(1).StringValue)
		      
		      For index = 2 to colCount
		        
		        vlist.Append SQLFriendly(rs.IdxField(index).StringValue)
		        
		      Next
		      
		      insertSQL = insertDef + fieldList + " VALUES " + "(" + chr(34) + Join(vList,delimiter) + chr(34) + ")"
		      
		      dbNew.SQLExecute(insertSQL)
		      
		      rs.MoveNext
		      
		    wend
		    
		    dbNew.SQLExecute "COMMIT"
		    
		    Return dbNew
		  else
		    MsgBox "The recordset is empty"
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RecordSetToOnDiskSqliteDatabase(rs as RecordSet) As SQLiteDatabase
		  if rs <> nil and not rs.EOF then
		    
		    dim dbNew as New SQLiteDatabase
		    
		    dim dlg as New SaveAsDialog
		    dim f as FolderItem
		    dlg.InitialDirectory = GetFolderItem("")
		    
		    'dlg.Filter = NrptFIleType.NData
		    dlg.promptText = "Name your BaseView"
		    dlg.SuggestedFileName = "My BaseView.data"
		    dlg.Title = "Create Report Base View"
		    
		    f = dlg.ShowModal()
		    
		    If f <> Nil then
		      
		      dbNew.DatabaseFile = f
		      
		      call dbNew.CreateDatabaseFile()
		      
		      dbNew.SQLExecute "BEGIN TRANSACTION"
		      
		      dbNew.SQLExecute "DROP Table IF EXISTS Report"
		      
		      dim colCount, index, colType as Integer
		      dim fld, fldType, fieldDef, fieldList, valueList, insertDef, insertSQL, tableSQL as String
		      
		      insertDef = "INSERT INTO Report ("
		      fld = RemoveSpaces(rs.IdxField(1).Name)
		      
		      colType = rs.ColumnType(0)
		      
		      fldType = fieldTypeIntegerToDatabaseColumnType(colType, "sqlite")
		      'if fldType = "Other" then
		      'fldType = UserSelectFieldType(fld)
		      'end if
		      
		      fieldDef = fld + " " + fldType
		      fieldList = fld
		      
		      tableSQL = "CREATE TABLE Report (" + fieldDef
		      
		      colCount = rs.FieldCount
		      for index = 2 to colCount
		        fld = RemoveSpaces(rs.IdxField(index).Name)
		        
		        colType = rs.ColumnType(index-1)
		        fldType = fieldTypeIntegerToDatabaseColumnType(colType, "sqlite")
		        'if fldType = "Other" then
		        'fldType = UserSelectFieldType(fld)
		        'end if
		        
		        fieldDef = fld + " " + fldType
		        tableSQL = tableSQL + ", " + fieldDef
		        fieldList = fieldList + "," + fld
		      Next
		      tableSQL = tableSQL + ")"
		      fieldList = fieldList + ")"
		      
		      dbNew.SQLExecute(tableSQL)
		      
		      while not rs.EOF
		        
		        valueList = "(" + "'" + SQLFriendly(rs.IdxField(1).StringValue)
		        
		        
		        For index = 2 to colCount
		          
		          valueList = valueList + "'" + "," + "'" + SQLFriendly(rs.IdxField(index).StringValue)
		          
		        Next
		        
		        valueList = valueList + "'" + ")"
		        insertSQL = insertDef + fieldList + " VALUES " + valueList
		        dbNew.SQLExecute(insertSQL)
		        If dbNew.error then
		          MsgBox dbNew.ErrorMessage + EndOfLine + insertSQL
		        End if
		        rs.MoveNext
		      wend
		      
		      dbNew.SQLExecute "COMMIT"
		      
		      Return dbNew
		    else
		      MsgBox "The recordset is empty"
		    end if
		    
		  Else
		    //user canceled
		  End if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RemoveSpaces(s as String) As String
		  return ReplaceAll(s, " ", "_")
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function SQLFriendly(data as String) As String
		  'data = ConvertEncoding(data, Encodings.UTF8)
		  'data = ConvertToUTF8(data)
		  data = ReplaceAll(data, "'", "''")
		  data = ReplaceAll(data, chr(34),chr(34) + chr(34))
		  Return data
		End Function
	#tag EndMethod


	#tag Constant, Name = kSchema, Type = Text, Dynamic = False, Default = \"", Scope = Public
	#tag EndConstant


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
