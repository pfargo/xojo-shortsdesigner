#tag Class
Protected Class DBWrapper
	#tag Method, Flags = &h0
		Function BindType(fieldName as String) As Integer
		  dim sTable as Text = NthField(fieldName,".",1).ToText
		  dim sField as Text = NthField(fieldName,".",2).ToText
		  
		  dim sFieldType as String = xojo.Core.Dictionary(SchemaDict.Value(sTable)).Value(sField)
		  
		  select case Type
		    
		  case "sqlite"
		    
		    Select Case sFieldType
		      
		    Case "String", "Date", "Time", "TimeStamp"
		      
		      Return SQLitePreparedStatement.SQLITE_TEXT
		      
		    Case "Integer"
		      
		      Return SQLitePreparedStatement.SQLITE_INT64
		      
		    Case "Double"
		      
		      Return SQLitePreparedStatement.SQLITE_DOUBLE
		      
		    Case "Boolean"
		      
		      Return SQLitePreparedStatement.SQLITE_BOOLEAN
		      
		      
		    else
		      
		      Return SQLitePreparedStatement.SQLITE_TEXT
		      
		    end Select
		    
		    #if PAF_DatabaseKit.Settings.kUseODBC then
		  case "odbc"
		    
		    Select Case sFieldType
		      
		    case "String"
		      
		      Return ODBCPreparedStatement.ODBC_TYPE_STRING
		      
		    case "Date"
		      
		      Return ODBCPreparedStatement.ODBC_TYPE_DATE
		      
		    case "Double"
		      
		      Return ODBCPreparedStatement.ODBC_TYPE_DOUBLE
		      
		    else
		      
		      break
		      
		    end select
		    #Endif
		    
		  case "PostgreSQL"
		    
		    
		    #if PAF_DatabaseKit.Settings.kUseMySQL then
		  case "MySQL"
		    
		    select case sFieldType
		      
		    Case "String"
		      
		      Return MySQLPreparedStatement.MYSQL_TYPE_STRING
		      
		    case "Date"
		      
		      Return MySQLPreparedStatement.MYSQL_TYPE_DATE
		      
		    case "Time"
		      
		      Return MySQLPreparedStatement.MYSQL_TYPE_TIME
		      
		    case "TimeStamp"
		      
		      Return MySQLPreparedStatement.MYSQL_TYPE_TIMESTAMP
		      
		    case "Integer"
		      
		      Return MySQLPreparedStatement.MYSQL_TYPE_LONG
		      
		    case "Double"
		      
		      Return MySQLPreparedStatement.MYSQL_TYPE_DOUBLE
		      
		    else
		      
		      break
		      
		    end select
		    #Endif
		  end Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildJoinArray(sChain() as String) As String()
		  dim sTableName1, sTableName2, arsJoins() as String
		  
		  while sChain.Ubound > 0
		    
		    sTableName1 = sChain(0)
		    sTableName2 = sChain(1)
		    
		    For each oKey as PAF_DatabaseKit.ForeignKey in ForeignKeys
		      
		      if oKey.Table = sTableName1 and oKey.ForeignTable = sTableName2 then
		        
		        arsJoins.Append oKey.ForeignTable + " On " + oKey.Name
		        
		        exit
		        
		      elseif oKey.Table = sTableName2 and oKey.ForeignTable = sTableName1 then
		        
		        arsJoins.Append oKey.Table + " On " + oKey.ForeignTable + "." + oKey.ForeignColumn + " = " + oKey.Table + "." + oKey.Column
		        
		        exit
		        
		      end if
		      
		    next
		    
		    sChain.Remove(0)
		    
		  wend
		  
		  Return arsJoins
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildSchemaMenu() As MenuItem
		  dim base, mTable, mField as MenuItem
		  
		  base = new MenuItem("Fields")
		  
		  
		  
		  base.Append( New MenuItem( MenuItem.TextSeparator ))
		  
		  For Each entry as Xojo.Core.DictionaryEntry In SchemaDict
		    
		    mTable = New MenuItem
		    mTable.Text = entry.Key
		    
		    for each fld as xojo.Core.DictionaryEntry in xojo.Core.Dictionary(entry.Value)
		      
		      mField = New MenuItem
		      mField.Text = fld.key
		      mField.Name = mTable.Text + "." + fld.key
		      mField.Tag = fld.Value
		      
		      mTable.Append mField
		      
		    Next
		    
		    base.Append mTable
		    
		  next
		  
		  
		  
		  Return base
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function BuildSchemaMenu(arsFieldList() As string, optional bAllTableFields As Boolean = true) As MenuItem
		  dim base, mTable, mField as MenuItem
		  
		  // First extract tableNames
		  
		  dim arsTableNames() As string
		  
		  For each sTableField as string in arsFieldList
		    
		    arsTableNames.Append NthField(sTableField,".",1)
		    
		  Next
		  
		  base = new MenuItem("Fields")
		  
		  base.Append( New MenuItem( MenuItem.TextSeparator ))
		  
		  For Each entry as Xojo.Core.DictionaryEntry In SchemaDict
		    
		    mTable = New MenuItem
		    mTable.Text = entry.Key
		    
		    if arsTableNames.IndexOf(entry.Key) <> - 1 then
		      
		      for each fld as xojo.Core.DictionaryEntry in xojo.Core.Dictionary(entry.Value)
		        
		        mField = New MenuItem
		        mField.Text = fld.key
		        mField.Name = mTable.Text + "." + fld.key
		        mField.Tag = fld.Value
		        
		        if bAllTableFields or arsFieldList.IndexOf(mField.Name) <> -1 then
		          
		          mTable.Append mField
		          
		        end if
		        
		      Next
		      
		      base.Append mTable
		      
		    end if
		    
		  next
		  
		  Return base
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Close()
		  db.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Commit()
		  db.Commit
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Connect() As Boolean
		  
		  
		  if type = "sqlite" then
		    
		    if SQLiteDatabase(db).DatabaseFile.Exists then
		      
		      Return db.Connect
		      
		    else
		      
		      Return SQLiteDatabase(db).CreateDatabaseFile
		      
		    end if
		    
		  else
		    
		    Return db.Connect
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ConnectionString() As String
		  select case me.type
		    
		  case "ODBC"
		    
		    Dim parts() As string = Split(me.DataSource,";") '0 (DSN=???) 1 (UID=User Name), 2 (PWD=???)
		    
		    Return "ODBC," + NthField(parts(0),"=",2) + "," + NthField(parts(1),"=",2)
		    
		    // not sqlite
		  case "CubeSQL", "PostgreSQL", "MySQL"
		    
		    Return me.type + "," + me.Host + "," + str(me.Port) + "," + me.DatabaseName + "," + me.UserName
		    
		  else 'SQLite
		    
		    if me.db <> nil then
		      
		      Return "SQLite," + EncodeBase64(me.DatabaseFile.GetSaveInfo(app.ExecutableFile,0))
		      
		    end if
		    
		  end Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(dbtype as String)
		  type = dbtype
		  
		  select case dbtype
		    
		  case "sqlite"
		    
		    db = New SQLiteDatabase
		    
		    #if PAF_DatabaseKit.Settings.kUseCubeSQL then
		  case "CubeSQL"
		    db = New CubeSQLServer
		    #endif
		    
		    #if PAF_DatabaseKit.Settings.kUseODBC then
		  case "odbc"
		    
		    db = New ODBCDatabase
		    #Endif
		    
		    #if PAF_DatabaseKit.Settings.kUsePostgreSQL then
		  case "PostgreSQL"
		    
		    db = new PostgreSQLDatabase
		    #Endif
		    
		    #if PAF_DatabaseKit.Settings.kUseMySQL then
		  case "mysql"
		    
		    db = new MySQLCommunityServer
		    #endif
		    
		  else
		    
		    MsgBox "Database type not supported at this time"
		    
		  end Select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DatabaseFile() As FolderItem
		  If db isa SQLiteDatabase then
		    
		    Return SQLiteDatabase(db).DatabaseFile
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DatabaseFile(assigns F as FolderItem)
		  if db isa SQLiteDatabase then
		    
		    SQLiteDatabase(db).DatabaseFile = f
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DatabaseName() As String
		  if db isa SQLiteDatabase then
		    
		    if SQLiteDatabase(db).DatabaseFile = nil then Return "*** NO DATABASE FILE SELECTED ***"
		    
		    Return SQLiteDatabase(db).DatabaseFile.DisplayName
		    
		    #if PAF_DatabaseKit.Settings.kUseCubeSQL then
		  elseif db isa CubeSQLServer then
		    
		    Return CubeSQLServer(db).DatabaseName
		    #endif
		    
		    #if PAF_DatabaseKit.Settings.kUsePostgreSQL then
		  elseif db isa PostgreSQLDatabase then
		    
		    Return PostgreSQLDatabase(db).DatabaseName
		    #endif
		    
		    #if PAF_DatabaseKit.Settings.kUseMySQL then
		  elseif db isa MySQLCommunityServer then
		    
		    Return MySQLCommunityServer(db).DatabaseName
		    #Endif
		    
		    #if PAF_DatabaseKit.Settings.kUseODBC then
		  elseif db isa ODBCDatabase then
		    
		    Return ODBCDatabase(db).DBMS + " - " + ODBCDatabase(db).DatabaseName
		    #endif
		    
		  else
		    
		    Return db.DatabaseName
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DatabaseName(Assigns dbName as String)
		  #if PAF_DatabaseKit.Settings.kUseCubeSQL then
		    if db isa CubeSQLServer then
		      
		      CubeSQLServer(db).DatabaseName = dbName
		      
		    end if
		  #endif
		  
		  #if PAF_DatabaseKit.Settings.kUsePostgreSQL then
		    if db isa PostgreSQLDatabase then
		      
		      PostgreSQLDatabase(db).DatabaseName = dbName
		      
		    end if
		  #Endif
		  
		  #if PAF_DatabaseKit.Settings.kUseMySQL then
		    if db isa MySQLCommunityServer then
		      
		      MySQLCommunityServer(db).DatabaseName = dbName
		      
		    end if
		  #endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DataSource() As String
		  #if PAF_DatabaseKit.Settings.kUseODBC then
		    If db isa ODBCDatabase then
		      
		      Return ODBCDatabase(db).DataSource
		      
		    end if
		  #Endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DataSource(Assigns dbSource as String)
		  #if PAF_DatabaseKit.Settings.kUseODBC then
		    if db isa ODBCDatabase then
		      
		      ODBCDatabase(db).DataSource = dbSource
		      
		    end if
		  #Endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DBFieldType(iType as Integer) As String
		  
		  Select Case iType
		    
		  Case 0
		    
		    Return "Null"
		    
		  Case  2,3,19
		    
		    Return "Integer"
		    
		  Case 4,5,18
		    
		    Return "String"
		    
		  Case  6,7,11,13
		    
		    Return "Double"
		    
		  Case 8
		    
		    Return "Date"
		    
		  Case 9
		    
		    Return "Time"
		    
		  Case 10
		    
		    Return "Timestamp"
		    
		  Case 12
		    
		    Return "Boolean"
		    
		  Case 15,16
		    
		    Return "Blob"
		    
		  Case 14
		    
		    Return "Binary"
		    
		  Case 1
		    
		    Return "Byte"
		    
		  Case 17
		    
		    Return "MacPICT"
		    
		  Case 255
		    
		    Return "Unknown"
		    
		  else
		    
		    Return "Unknown"
		    
		  End Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DBMSMySQL()
		  dim rsFields as RecordSet
		  
		  dim sTable, sField, sfieldName As String
		  
		  for each entry as xojo.Core.DictionaryEntry in SchemaDict
		    
		    sTable = entry.key
		    
		    rsFields = SQLSelect("SELECT column_name,column_type "_
		    + "FROM information_schema.columns "_
		    + "WHERE table_schema = DATABASE() "_
		    + "AND table_name='" + sTable + "' "_
		    + "ORDER BY ordinal_position;")
		    
		    if rsFields <> nil and not rsFields.EOF then
		      
		      while not rsFields.EOF
		        
		        sField = rsFields.Field("column_name").StringValue.DefineEncoding(Encodings.UTF8)
		        
		        sFieldName = sTable + "." + sField
		        
		        DBMS_DataTypeDict.Value(sFieldName) = rsFields.Field("column_type").StringValue.DefineEncoding(Encodings.UTF8)
		        
		        rsFields.MoveNext
		        
		      wend
		      
		    end if
		    
		  next
		  break
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DBMSPostgreSQL()
		  dim rsFields as RecordSet
		  
		  dim sTable As String
		  
		  for each entry as xojo.Core.DictionaryEntry in SchemaDict
		    
		    sTable = entry.key
		    
		    rsFields = SQLSelect("SELECT attname as Name, format_type(atttypid, atttypmod) AS Type "_
		    + "FROM pg_attribute "_
		    + "WHERE  attrelid = '" + sTable + "'::regclass "_
		    + "AND attnum > 0 AND NOT attisdropped "_
		    + "ORDER  BY attnum")
		    
		    if rsFields <> nil and not rsFields.EOF then
		      
		      while not rsFields.EOF
		        
		        DBMS_DataTypeDict.Value(sTable + "." + rsFields.Field("Name").StringValue) = rsFields.Field("Type").StringValue
		        
		        rsFields.MoveNext
		        
		      wend
		      
		    end if
		    
		  next
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub DBMSSQLite()
		  // SQLite does not provide data types for view fields which are expressions
		  // ie: not a field from a table
		  // example person.lastname || ', ' || person.firstname will not have a data type
		  // example lineitem.units * lineitem.price will not have a data type
		  // Casting the type in the view definition does not work either.
		  
		  dim rsFields as RecordSet
		  
		  dim sTable As String
		  
		  for each entry as xojo.Core.DictionaryEntry in SchemaDict
		    
		    sTable = entry.key
		    
		    rsFields = SQLSelect("PRAGMA Table_Info(" + sTable + ")")
		    
		    if rsFields <> nil and not rsFields.EOF then
		      
		      while not rsFields.EOF
		        
		        DBMS_DataTypeDict.Value(sTable + "." + rsFields.Field("Name").StringValue) = rsFields.Field("Type").StringValue
		        
		        rsFields.MoveNext
		        
		      wend
		      
		    end if
		    
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub EncryptionKey(assigns key as String)
		  if db isa SQLiteDatabase then
		    
		    SQLiteDatabase(db).EncryptionKey = key
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Error() As Boolean
		  Return db.Error
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ErrorCode() As Integer
		  Return db.ErrorCode
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ErrorMessage() As String
		  Return db.ErrorMessage
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function FieldSchema(tableName as String) As RecordSet
		  Return db.FieldSchema(tableName)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ForeignKeysMySQL()
		  dim fk as PAF_DatabaseKit.ForeignKey
		  
		  
		  dim sql as string = "SELECT CONCAT( table_name, '.', column_name, ' -> ', " + _
		  "referenced_table_name, '.', referenced_column_name ) as list_of_fks " + _
		  "FROM information_schema.KEY_COLUMN_USAGE WHERE REFERENCED_TABLE_SCHEMA = '" + DatabaseName  + "' " + _
		  "AND REFERENCED_TABLE_NAME is not null ORDER BY TABLE_NAME, COLUMN_NAME"
		  
		  dim rs as RecordSet = SQLSelect(sql)
		  
		  if rs <> nil then
		    
		    while not rs.EOF
		      
		      fk = New PAF_DatabaseKit.ForeignKey(rs.Field("list_of_fks").StringValue.DefineEncoding(Encodings.UTF8))
		      
		      ForeignKeys.Append fk
		      
		      rs.MoveNext
		      
		    wend
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ForeignKeysPostgreSQL()
		  dim fk as PAF_DatabaseKit.ForeignKey
		  
		  dim rsTables as RecordSet = TableSchema
		  
		  if rsTables <> nil then
		    
		    while not rsTables.EOF
		      
		      dim sql as string = "SELECT "_
		      + "tc.constraint_name, tc.table_name, kcu.column_name, "_
		      + "ccu.table_name as foreign_table_name, "_
		      + "ccu.column_name as foreign_column_name "_
		      + "FROM "_
		      + "information_schema.table_constraints as tc "_
		      + "JOIN information_schema.key_column_usage as kcu "_
		      + "ON tc.constraint_name = kcu.constraint_name "_
		      + "JOIN information_schema.constraint_column_usage as ccu "_
		      + "ON ccu.constraint_name = tc.constraint_name "_
		      + "WHERE constraint_type = 'FOREIGN KEY' AND tc.table_name='" + rsTables.Field("TableName").StringValue  + "';"
		      
		      dim rs as RecordSet = SQLSelect(sql)
		      
		      if rs <> nil then
		        
		        while not rs.EOF
		          
		          fk = New PAF_DatabaseKit.ForeignKey(rs)
		          
		          ForeignKeys.Append fk
		          
		          rs.MoveNext
		          
		        wend
		      end if
		      
		      rsTables.MoveNext
		      
		    wend
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ForeignKeysSQLite()
		  dim sTable as String
		  
		  dim fk as PAF_DatabaseKit.ForeignKey
		  
		  // Used to check for duplicates
		  dim arsFKNames() as String
		  
		  dim rsSchema as RecordSet = TableSchema
		  
		  dim rsFK as RecordSet
		  
		  if rsSchema <> nil then
		    
		    while not rsSchema.EOF
		      
		      sTable = rsSchema.Field("tablename").StringValue
		      
		      rsFK = SQLSelect("PRAGMA Foreign_Key_List('" + sTable + "')")
		      
		      if rsFK <> nil and not rsFK.EOF then
		        
		        while not rsFK.EOF
		          
		          fk = New PAF_DatabaseKit.ForeignKey
		          
		          fk.Name = sTable + "." + rsFK.Field("From").StringValue + " = " + rsFK.Field("table").StringValue + "." + rsFK.Field("to").StringValue
		          fk.Table = sTable
		          fk.Column = rsFK.Field("From").StringValue
		          fk.ForeignTable = rsFK.Field("table").StringValue
		          fk.ForeignColumn = rsFK.Field("to").StringValue
		          
		          ForeignKeys.Append fk
		          arsFKNames.Append fk.Name
		          
		          rsFK.MoveNext
		          
		        wend
		        
		      end if
		      
		      rsSchema.MoveNext
		      
		    wend
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetViewSchema(sViewName As String) As xojo.Core.Dictionary
		  Dim fieldDict As xojo.Core.Dictionary
		  
		  Dim rsFields As RecordSet
		  
		  dim sfieldName, sFieldType As String
		  
		  fieldDict = New xojo.core.Dictionary
		  
		  if type = "SQLite" and type = "CubeSQL" then
		    
		    rsFields = SQLSelect("pragma table_info(" + sViewName + ")")
		    
		    if rsFields <> nil and not rsFields.EOF then
		      
		      while not rsFields.EOF
		        
		        sFieldName = rsFields.Field("Name").StringValue
		        
		        sFieldType = rsFields.Field("type").StringValue
		        
		        fieldDict.Value(sFieldName) = sFieldType
		        
		        rsFields.MoveNext
		        
		      wend
		      
		    end if
		    
		    
		  else
		    
		    rsFields = FieldSchema(sViewName)
		    
		    if rsFields <> nil and not rsFields.EOF then
		      
		      while not rsFields.EOF
		        
		        sFieldName = rsFields.Field("ColumnName").StringValue
		        
		        sFieldType = DBFieldType(rsFields.Field("FieldType").IntegerValue)
		        
		        fieldDict.Value(sFieldName) = sFieldType
		        
		        rsFields.MoveNext
		        
		      wend
		      
		    end if
		  end if
		  
		  Return fieldDict
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Host() As String
		  if not db isa SQLiteDatabase then
		    
		    Return db.Host
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Host(Assigns hostName as String)
		  if not db isa SQLiteDatabase then
		    
		    db.Host = hostName
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LazyLoadRelation(sStartTable As String, sEndTable As String)
		  Dim startCell, endCell as PAF_PathKit.Cell
		  
		  startCell = DictCells.lookup(sStartTable,nil)
		  endCell = DictCells.lookup(sEndTable,nil)
		  
		  if startCell = nil or endCell = nil then
		    break
		  else
		    
		    Dim arsPath() as String = BuildJoinArray(PAF_PathKit.DijkstraPathTo(startCell,endCell))
		    
		    if arsPath.Ubound <> -1 then
		      
		      DictRelations.Value(startCell.Table + "_" + endCell.Table) = arsPath
		      
		    end if
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadSchema(oDesigner as DesignerCC)
		  ResetSchema
		  
		  oDesigner.UpdateLoadStatus  "Processing Schema..."
		  
		  dim tblName, fldName, sTables() as text
		  dim fldType As String
		  
		  dim rsTables, rsFields as RecordSet
		  
		  dim fieldDict as xojo.core.Dictionary
		  
		  if type = "MySQL" then
		    
		    rsTables = SQLSelect("Show full tables where table_type like 'BASE TABLE'")
		    
		  else
		    
		    rsTables = TableSchema
		    
		  end if
		  
		  if rsTables <> nil and not rsTables.EOF then
		    
		    while not rsTables.EOF
		      
		      'tblName = rsTables.Field("TableName").StringValue
		      tblName = rsTables.IdxField(1).StringValue.DefineEncoding(Encodings.UTF8).ToText
		      
		      oDesigner.UpdateLoadStatus "Processing Schema: " + tblName + "..."
		      
		      if left(tblName,4) <> "SSD_" and left(tblName,7) <> "sqlite_" then
		        
		        sTables.Append(tblName)
		        
		        fieldDict = New xojo.core.Dictionary
		        
		        rsFields = FieldSchema(tblName)
		        
		        if rsFields <> nil and not rsFields.EOF then
		          
		          while not rsFields.EOF
		            
		            fldName = rsFields.Field("ColumnName").StringValue.DefineEncoding(Encodings.UTF8).ToText
		            
		            fldType = DBFieldType(rsFields.Field("FieldType").IntegerValue)
		            
		            fieldDict.Value(fldName) = fldType
		            
		            rsFields.MoveNext
		            
		          wend
		          
		        end if
		        
		        //BK call the designer and then ask the user if it's being used.
		        if oDesigner.TableViewAddIsOkay(tblName) = false then
		          TableDict.Value(tblName) = fieldDict
		          SchemaDict.Value(tblName) = fieldDict
		        end
		        
		      end if
		      
		      rsTables.MoveNext
		      
		    wend
		    
		  end if
		  
		  if type = "SQLite" or type = "CubeSQL" then
		    
		    LoadViewsSQLite(oDesigner)
		    oDesigner.UpdateLoadStatus "Loading Foreign Keys..."
		    ForeignKeysSQLite
		    DBMSSQLite
		    
		  elseif type = "PostgreSQL" then
		    
		    LoadViewsPostgreSQL(oDesigner)
		    oDesigner.UpdateLoadStatus "Loading Foreign Keys..."
		    ForeignKeysPostgreSQL
		    DBMSPostgreSQL
		    
		  elseif type = "MySQL" then
		    
		    LoadViewsMySQL(oDesigner)
		    oDesigner.UpdateLoadStatus "Loading Foreign Keys..."
		    ForeignKeysMySQL
		    DBMSMySQL
		    
		  end if
		  
		  oDesigner.UpdateLoadStatus "Calculating Relationship Paths..."
		  
		  PAF_PathKit.BuildPathingCells(me)
		  
		  if ForeignKeys.Ubound > -1 then
		    HasForeignKeys = true
		  else
		    HasForeignKeys = false
		  end if
		  
		  StatusWin.Close
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadViewsMySQL(oDesigner As DesignerCC)
		  Dim rs, rsFields As RecordSet
		  
		  Dim fieldDict As xojo.Core.Dictionary
		  
		  dim sTableName, sFieldName, sFieldType As string
		  
		  Dim sql As string = "SHOW FULL TABLES WHERE TABLE_TYPE LIKE 'VIEW';"
		  
		  rs = SQLSelect(sql)
		  
		  if rs <> nil and not rs.EOF then
		    
		    while not rs.EOF
		      
		      sTableName = rs.IdxField(1).StringValue
		      
		      oDesigner.UpdateLoadStatus "Processing Schema: " + sTableName + "..."
		      
		      fieldDict = New xojo.core.Dictionary
		      
		      rsFields = FieldSchema(sTableName)
		      
		      if rsFields <> nil and not rsFields.EOF then
		        
		        while not rsFields.EOF
		          
		          sFieldName = rsFields.Field("ColumnName").StringValue
		          
		          sFieldType = DBFieldType(rsFields.Field("FieldType").IntegerValue)
		          
		          fieldDict.Value(sFieldName) = sFieldType
		          
		          rsFields.MoveNext
		          
		        wend
		        
		      end if
		      
		      ViewDict.Value(sTableName) = fieldDict
		      SchemaDict.Value(sTableName) = fieldDict
		      
		      rs.MoveNext
		      
		    wend
		    
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadViewsPostgreSQL(oDesigner As DesignerCC)
		  Dim rs, rsFields As RecordSet
		  
		  Dim fieldDict As xojo.Core.Dictionary
		  
		  dim sql, sTableName, sViewSQL, sFieldName, sFieldType As string
		  
		  sql = "select viewname, definition from pg_catalog.pg_views "_
		  + "where schemaname NOT IN ('pg_catalog', 'information_schema') "_
		  + "order by viewname;"
		  
		  rs = SQLSelect(sql)
		  
		  
		  if rs <> nil and not rs.EOF then
		    
		    
		    while not rs.EOF
		      
		      sTableName = rs.Field("viewname").StringValue
		      
		      oDesigner.UpdateLoadStatus "Processing Schema: " + sTableName + "..."
		      
		      // not used here but available
		      sViewSQL = rs.Field("definition").StringValue
		      
		      fieldDict = New xojo.core.Dictionary
		      
		      rsFields = FieldSchema(sTableName)
		      
		      if rsFields <> nil and not rsFields.EOF then
		        
		        while not rsFields.EOF
		          
		          sFieldName = rsFields.Field("ColumnName").StringValue
		          
		          sFieldType = DBFieldType(rsFields.Field("FieldType").IntegerValue)
		          
		          fieldDict.Value(sFieldName) = sFieldType
		          
		          rsFields.MoveNext
		          
		        wend
		        
		      end if
		      
		      ViewDict.Value(sTableName) = fieldDict
		      SchemaDict.Value(sTableName) = fieldDict
		      
		      rs.MoveNext
		      
		    wend
		    
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadViewsSQLite(oDesigner As DesignerCC)
		  Dim rs, rsFields As RecordSet
		  
		  Dim fieldDict As xojo.Core.Dictionary
		  
		  dim sTableName, sFieldName, sFieldType As string
		  
		  Dim sql As string = "select name, sql from sqlite_master where type = 'view'"
		  
		  rs = SQLSelect(sql)
		  
		  if rs <> nil and not rs.EOF then
		    
		    while not rs.EOF
		      
		      sTableName = rs.Field("name").StringValue
		      
		      oDesigner.UpdateLoadStatus "Processing Schema: " + sTableName + "..."
		      
		      fieldDict = New xojo.core.Dictionary
		      
		      rsFields = SQLSelect("pragma table_info(" + sTableName + ")")
		      
		      if rsFields <> nil and not rsFields.EOF then
		        
		        while not rsFields.EOF
		          
		          sFieldName = rsFields.Field("Name").StringValue
		          
		          sFieldType = rsFields.Field("type").StringValue
		          
		          if sFieldType <> "" then
		            
		            fieldDict.Value(sFieldName) = sFieldType
		            
		          else
		            ' System.DebugLog sTableName + "." + sFieldName
		            ' dim a As auto
		            ' dim rsGetOne As RecordSet = SQLSelect("select * from " + sTableName + " limit 1")
		            ' if rsGetOne <> nil then
		            ' a = rsGetOne.Field(sFieldName).Value
		            ' Dim info As Xojo.Introspection.TypeInfo
		            ' info = Xojo.Introspection.GetType(a)
		            '
		            ' if left(info.Name,3) = "Int" then
		            ' sFieldType = "Integer"
		            ' else
		            ' sFieldType = info.Name
		            ' end if
		            ' end if
		            ' system.DebugLog sFieldType
		            ' fieldDict.Value(sFieldName) = sFieldType
		            
		            fieldDict.Value(sFieldName) = "String"
		            
		          end if
		          
		          rsFields.MoveNext
		          
		        wend
		        
		      end if
		      
		      ViewDict.Value(sTableName) = fieldDict
		      SchemaDict.Value(sTableName) = fieldDict
		      
		      rs.MoveNext
		      
		    wend
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Password() As String
		  if not db isa SQLiteDatabase then
		    
		    Return db.Password
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Password(Assigns pWord as String)
		  if not db isa SQLiteDatabase then
		    
		    db.Password = pWord
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Port() As Integer
		  #if PAF_DatabaseKit.Settings.kUseCubeSQL then
		    if db isa CubeSQLServer then
		      
		      Return CubeSQLServer(db).Port
		      
		    end if
		  #Endif
		  
		  #if PAF_DatabaseKit.Settings.kUsePostgreSQL then
		    if db isa PostgreSQLDatabase then
		      
		      Return PostgreSQLDatabase(db).Port
		      
		    end if
		  #Endif
		  
		  #if PAF_DatabaseKit.Settings.kUseMySQL then
		    if db isa MySQLCommunityServer then
		      
		      Return MySQLCommunityServer(db).Port
		      
		    end if
		  #Endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Port(Assigns portValue as Integer)
		  #if PAF_DatabaseKit.Settings.kUseCubeSQL then
		    if db isa CubeSQLServer then
		      
		      CubeSQLServer(db).Port = portValue
		      
		    end if
		  #Endif
		  
		  #if PAF_DatabaseKit.Settings.kUsePostgreSQL then
		    if db isa PostgreSQLDatabase then
		      
		      PostgreSQLDatabase(db).Port = portValue
		      
		    end if
		  #Endif
		  
		  #if PAF_DatabaseKit.Settings.kUseMySQL then
		    if db isa MySQLCommunityServer then
		      
		      MySQLCommunityServer(db).Port = portValue
		      
		    end if
		  #Endif
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Prepare(statement as String) As PreparedSQLStatement
		  select case type
		    
		  case "sqlite"
		    
		    Return SQLitePreparedStatement(db.Prepare(statement))
		    
		    #if PAF_DatabaseKit.Settings.kUseODBC then
		  case "odbc"
		    
		    Return ODBCPreparedStatement(db.Prepare(statement))
		    #Endif
		    
		    #if PAF_DatabaseKit.Settings.kUsePostgreSQL then
		  case "PostgreSQL"
		    
		    Return PostgreSQLPreparedStatement(db.Prepare(statement))
		    #Endif
		    
		    #if PAF_DatabaseKit.Settings.kUseMySQL then
		  case "mysql"
		    
		    Return MySQLPreparedStatement(db.Prepare(statement))
		    #Endif
		    
		  end Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PrepareCube(statement as String) As Variant
		  #if PAF_DatabaseKit.Settings.kUseCubeSQL then
		    select case type
		      
		    case "cubesql"
		      
		      Return CubeSQLVM(CubeSQLServer(db).VMPrepare(statement))
		      
		    else
		      
		      Return nil
		      
		    end select
		  #Endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ResetSchema()
		  SchemaDict = new xojo.Core.Dictionary
		  TableDict = new xojo.Core.Dictionary
		  ViewDict = new xojo.Core.Dictionary
		  TempViewDict = new xojo.Core.Dictionary
		  DictRelations = new Dictionary
		  DBMS_DataTypeDict = new xojo.Core.Dictionary
		  Redim ForeignKeys(-1)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Rollback()
		  db.Rollback
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SQLExecute(executeString as String)
		  db.SQLExecute(executeString)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function SQLSelect(query as String) As RecordSet
		  Return db.SQLSelect(query)
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function StringIsTableDotField(s As String) As boolean
		  Dim dTable As xojo.Core.Dictionary = SchemaDict.Lookup(NthField(s,".",1),nil)
		  
		  if dTable = nil then
		    Return false
		  else
		    if dTable.HasKey(NthField(s,".",2)) then
		      Return true
		    end if
		  end if
		  Return false
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TableNames() As String()
		  dim tableNames() as String
		  
		  Select Case type
		    
		  case "SQLite", "PostgreSQL", "ODBC"
		    
		    dim rs as RecordSet = db.TableSchema
		    
		    if rs <> nil and not rs.EOF then
		      
		      while not rs.EOF
		        
		        tableNames.Append rs.Field("TableName").StringValue
		        
		        rs.MoveNext
		        
		      wend
		      
		    end if
		    
		    Return tableNames
		    
		  case "MySQL"
		    
		    dim sql as String = "SHOW FULL TABLES WHERE TABLE_TYPE LIKE 'BASE TABLE';"
		    
		    dim rs as RecordSet = db.SQLSelect(sql)
		    
		    if rs <> nil and not rs.EOF then
		      
		      while not rs.EOF
		        
		        tableNames.Append rs.IdxField(1).StringValue.DefineEncoding(Encodings.UTF8)
		        
		        rs.MoveNext
		        
		      wend
		      
		    end if
		    
		    Return tableNames
		    
		  end select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function TableSchema() As RecordSet
		  Return db.TableSchema
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function UserName() As String
		  if not db isa SQLiteDatabase then
		    
		    Return db.UserName
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UserName(Assigns userName as String)
		  if not db isa SQLiteDatabase then
		    
		    db.UserName = userName
		    
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		AliasResolutionDict As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		db As Database
	#tag EndProperty

	#tag Property, Flags = &h0
		DBMS_DataTypeDict As xojo.Core.Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		DictRelations As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		ForeignKeys() As PAF_DatabaseKit.ForeignKey
	#tag EndProperty

	#tag Property, Flags = &h0
		HasForeignKeys As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		SchemaDict As xojo.Core.Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		TableDict As xojo.Core.Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		TempViewDict As xojo.Core.Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		type As String
	#tag EndProperty

	#tag Property, Flags = &h0
		ViewDict As xojo.Core.Dictionary
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="db"
			Group="Behavior"
			Type="Database"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HasForeignKeys"
			Group="Behavior"
			InitialValue="false"
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
		#tag ViewProperty
			Name="type"
			Group="Behavior"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
