#tag Window
Begin Window ConnectionWin
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   164
   ImplicitInstance=   True
   LiveResize      =   False
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   0
   MenuBarVisible  =   True
   MinHeight       =   64
   MinimizeButton  =   False
   MinWidth        =   64
   Placement       =   1
   Resizeable      =   False
   Title           =   "Database Connection"
   Visible         =   True
   Width           =   540
   Begin PAFODBCConnectWinCC ODBCHostCC
      AcceptFocus     =   False
      AcceptTabs      =   True
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      Backdrop        =   0
      Enabled         =   True
      EraseBackground =   True
      HasBackColor    =   False
      Height          =   83
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   507
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   500
   End
   Begin PAFHostConnectCC HostCC
      AcceptFocus     =   False
      AcceptTabs      =   True
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      Backdrop        =   0
      Enabled         =   True
      EraseBackground =   True
      HasBackColor    =   False
      Height          =   147
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   341
      Transparent     =   True
      UseFocusRing    =   False
      Visible         =   True
      Width           =   500
   End
   Begin PushButton pbCancel
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   True
      Caption         =   "Cancel"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   348
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   124
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin PushButton pbConnect
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Connect"
      Default         =   True
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   440
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   124
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin RadioButton rbConnectionType
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "SQLite"
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   75
      Underline       =   False
      Value           =   True
      Visible         =   True
      Width           =   68
   End
   Begin RadioButton rbConnectionType
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "CubeSQL"
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   1
      InitialParent   =   ""
      Italic          =   False
      Left            =   115
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   75
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   77
   End
   Begin RadioButton rbConnectionType
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "PostgreSQL"
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   2
      InitialParent   =   ""
      Italic          =   False
      Left            =   219
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   75
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   90
   End
   Begin RadioButton rbConnectionType
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "ODBC"
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   3
      InitialParent   =   ""
      Italic          =   False
      Left            =   336
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   75
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   77
   End
   Begin Separator Separator1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   1
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   107
      Visible         =   True
      Width           =   500
   End
   Begin PopupMenu pmFavorites
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   ""
      Italic          =   False
      Left            =   110
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   350
   End
   Begin Label Label1
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Favorites"
      TextAlign       =   0
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   21
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   78
   End
   Begin Separator Separator2
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   1
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   62
      Visible         =   True
      Width           =   500
   End
   Begin BevelButton bbAddFavorite
      AcceptFocus     =   True
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   4
      Bold            =   False
      ButtonType      =   0
      Caption         =   ""
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   181872639
      IconAlign       =   1
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   469
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   12
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   21
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   22
   End
   Begin BevelButton bbDeleteFavorite
      AcceptFocus     =   True
      AutoDeactivate  =   True
      BackColor       =   &c00000000
      Bevel           =   4
      Bold            =   False
      ButtonType      =   0
      Caption         =   ""
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   False
      HasMenu         =   0
      Height          =   22
      HelpTag         =   ""
      Icon            =   1103990783
      IconAlign       =   1
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   498
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   13
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   21
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   22
   End
   Begin RadioButton rbConnectionType
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "MySQL"
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   4
      InitialParent   =   ""
      Italic          =   False
      Left            =   440
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   75
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   77
   End
   Begin CheckBox cbAddToFavorites
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Add to favorites"
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      State           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   124
      Underline       =   False
      Value           =   False
      Visible         =   True
      Width           =   153
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Close()
		  dim arsFavorites(), sFavorite as String
		  
		  For i as Integer = 0 to pmFavorites.ListCount - 1
		    
		    sFavorite = pmFavorites.list(i) + "," + pmFavorites.RowTag(i).StringValue
		    
		    arsFavorites.Append sFavorite
		    
		  Next
		  
		  if dictPrefs <> nil then
		    
		    SetPref("ConnectionFavorites","Array",Join(arsFavorites,"||"))
		    
		    WritePrefs
		    
		  end if
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  if dictPrefs <> nil then
		    
		    dim sFavorites as String = GetPref("ConnectionFavorites")
		    
		    dim arsFavorites() as string = split(sFavorites,"||")
		    
		    dim sName as String
		    
		    dim iBreak as Integer
		    
		    for i as Integer = 0 to arsFavorites.Ubound
		      
		      sName = NthField(arsFavorites(i),",",1)
		      
		      iBreak = InStr(arsFavorites(i),",") + 1
		      
		      pmFavorites.AddRow sName
		      
		      pmFavorites.RowTag(pmFavorites.ListCount-1) = mid(arsFavorites(i),iBreak)
		      
		    next
		    
		  end if
		  
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h21
		Private Sub AddFavorite()
		  dim sName as string = PAFInputWin.GetInput("Please name this favorite","OK","Cancel","You need to enter a name or select cancel")
		  
		  if sName <> "Cancel" then
		    
		    if pmFavorites.IndexOf(sName) = -1 then
		      
		      dim connString as String = BuildConnectionString
		      
		      pmFavorites.AddRow(sName)
		      
		      pmFavorites.RowTag(pmFavorites.ListCount-1) = connString
		      
		      pmFavorites.SetPMText = sName
		      
		    else
		      
		      MsgBox "There is already a favorite with that name"
		      
		      AddFavorite
		      
		    end if
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function BuildConnectionString() As String
		  if rbConnectionType(3).Value then
		    
		    Return "ODBC," + ODBCHostCC.tfDSN.Text + "," + ODBCHostCC.tfUser.Text
		    
		    // not sqlite
		  elseif not rbConnectionType(0).Value then
		    
		    dim s as String
		    
		    if rbConnectionType(1).Value then
		      
		      s = "CubeSQL,"
		      
		    elseif rbConnectionType(2).Value then
		      
		      s = "PostgreSQL,"
		      
		    elseif rbConnectionType(4).Value then
		      
		      s = "MySQL,"
		      
		    end if
		    
		    Return s + HostCC.tfHost.Text + "," + HostCC.tfPort.Text + "," + HostCC.tfDatabase.Text + "," + HostCC.tfUser.Text
		    
		  else 'SQLite
		    
		    if oDBWrapper.db <> nil then
		      
		      Return "SQLite," + EncodeBase64(oDBWrapper.DatabaseFile.GetSaveInfo(app.ExecutableFile,0))
		      
		    end if
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub CheckConnection(optional sqliteConnect As Boolean = false)
		  // If we have an SQLite favorite then we don't want to
		  // close the connection window when a favorite is selected
		  // in the popup. Otherwise there would be no way to delete them
		  // optional parameter is passed from pbConnect to close window
		  // when appropriate
		  
		  if oDBWrapper <> nil then
		    
		    if oDBWrapper.Connect then
		      
		      if oDBWrapper.type = "SQLite" then
		        
		        oDBWrapper.SQLExecute("PRAGMA cache_size = 10000")
		        
		        if cbAddToFavorites.Value then
		          
		          AddFavorite
		          
		          self.Close
		          
		        elseif pmFavorites.ListIndex = -1 then
		          
		          self.close
		          
		        elseif sqliteConnect then
		          
		          self.Close
		          
		        end if
		        
		      else
		        
		        self.close
		        
		      end if
		      
		    else
		      
		      MsgBox oDBWrapper.ErrorMessage
		      
		    end if
		    
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ClearEntry()
		  if rbConnectionType(1).Value or rbConnectionType(2).Value then 'cubesql or postgresql
		    HostCC.tfDatabase.text = ""
		    HostCC.tfHost.Text = ""
		    HostCC.tfPass.Text = ""
		    HostCC.tfPort.Text = ""
		    HostCC.tfUser.Text = ""
		    HostCC.tfHost.SetFocus
		  elseif rbConnectionType(3).Value then 'odbc
		    ODBCHostCC.tfDSN.Text = ""
		    ODBCHostCC.tfPass.Text = ""
		    ODBCHostCC.tfUser.Text = ""
		    ODBCHostCC.tfDSN.SetFocus
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function Connect(optional connectString as String) As PAF_DatabaseKit.DBWrapper
		  dim dbType as String = NthField(connectString ,",",1)
		  
		  if dbType = "SQLite" then
		    
		    if connectString <> "" then
		      
		      LoadConnectionString(connectString)
		      
		    else
		      
		      me.ShowModal
		      
		    end if
		    
		  else
		    
		    if connectString <> "" then
		      
		      LoadConnectionString(connectString)
		      
		    end if
		    
		    me.ShowModal
		    
		  end if
		  
		  
		  
		  if Cancelled then
		    
		    Return nil
		    
		  else
		    
		    Return oDBWrapper
		    
		  end if
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadConnectionString(connectString as String)
		  dim dbType as String = NthField(connectString ,",",1)
		  
		  if dbType = "odbc" then
		    
		    rbConnectionType(3).Value = true
		    ODBCHostCC.tfDSN.Text = NthField(connectString,",",2)
		    ODBCHostCC.tfUser.Text = NthField(connectString,",",3)
		    ODBCHostCC.tfPass.SetFocus
		    
		  elseif dbType = "CubeSQL"  or dbType = "PostgreSQL" or dbType = "MySQL" then
		    
		    if dbType = "CubeSQL" then
		      
		      rbConnectionType(1).Value = true
		      
		    elseif dbType = "PostgreSQL" then
		      
		      rbConnectionType(2).Value = true
		      
		    elseif dbType = "MySQL" then
		      
		      rbConnectionType(4).Value = true
		      
		    end if
		    
		    HostCC.tfHost.Text = NthField(connectString,",",2)
		    HostCC.tfPort.Text = NthField(connectString,",",3)
		    HostCC.tfDatabase.Text = NthField(connectString,",",4)
		    HostCC.tfUser.Text = NthField(connectString,",",5)
		    if connectString.CountFields(",") = 6 then
		      HostCC.tfPass.Text = NthField(connectString,",",6)
		    else
		      HostCC.tfPass.SetFocus
		    end if
		    
		  elseif dbType = "SQLite" then
		    
		    // Don't want favorites dialog to appear
		    cbAddToFavorites.Value = false
		    
		    oDBWrapper = New PAF_DatabaseKit.DBWrapper("SQLite")
		    
		    'dim iTest As integer = CountFields(connectString,",")
		    
		    dim fileString as String = DecodeBase64(NthField(connectString,",",2).DefineEncoding(Encodings.UTF8))
		    
		    oDBWrapper.DatabaseFile = GetFolderItem(fileString, FolderItem.PathTypeNative)
		    
		    if oDBWrapper.DatabaseFile <> nil then
		      
		      CheckConnection
		      
		    else
		      
		      MsgBox "There seems to be a problem with this favorite"
		      
		      //Leave window open
		      
		    end if
		    
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private Cancelled As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LoadingFavorite As Boolean = False
	#tag EndProperty

	#tag Property, Flags = &h21
		Private oDBWrapper As PAF_DatabaseKit.DBWrapper
	#tag EndProperty


#tag EndWindowCode

#tag Events pbCancel
	#tag Event
		Sub Action()
		  Cancelled = True
		  
		  self.Close
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbConnect
	#tag Event
		Sub Action()
		  if rbConnectionType(0).Value then 'SQLite
		    
		    if oDBWrapper = nil and pmFavorites.ListIndex = -1 then
		      
		      oDBWrapper = New PAF_DatabaseKit.DBWrapper("SQLite")
		      
		      dim dlg as New OpenDialog
		      
		      dlg.PromptText = "Select SQLite Database"
		      dlg.Filter = ProjectFileTypes.SpecialAny
		      
		      dlg.Title = "Open Database"
		      
		      oDBWrapper.DatabaseFile = dlg.ShowModal()
		      
		      if oDBWrapper.DatabaseFile <> nil then
		        
		        CheckConnection
		        
		      else
		        
		        oDBWrapper = nil ' prevent potential crash if tried again
		        
		        MsgBox "No file selected"
		        
		        //Leave window open
		        
		      end if
		      
		    else
		      
		      CheckConnection(true)
		      
		    end if
		    
		    
		    
		  elseif rbConnectionType(1).Value then 'CubeSQL
		    
		    oDBWrapper = New PAF_DatabaseKit.DBWrapper("CubeSQL")
		    
		    oDBWrapper.Host = HostCC.tfHost.Text
		    oDBWrapper.Port = val(HostCC.tfPort.Text)
		    oDBWrapper.DatabaseName = HostCC.tfDatabase.Text
		    oDBWrapper.UserName = HostCC.tfUser.Text
		    oDBWrapper.Password = HostCC.tfPass.Text
		    
		    CheckConnection
		    
		  elseif rbConnectionType(2).Value then 'PostgreSQL
		    
		    oDBWrapper = New PAF_DatabaseKit.DBWrapper("PostgreSQL")
		    
		    oDBWrapper.Host = HostCC.tfHost.Text
		    oDBWrapper.Port = val(HostCC.tfPort.Text)
		    oDBWrapper.DatabaseName = HostCC.tfDatabase.Text
		    oDBWrapper.UserName = HostCC.tfUser.Text
		    oDBWrapper.Password = HostCC.tfPass.Text
		    
		    CheckConnection
		    
		  elseif rbConnectionType(3).Value then 'ODBC
		    
		    oDBWrapper = New PAF_DatabaseKit.DBWrapper("odbc")
		    oDBWrapper.DataSource = "DSN=" + ODBCHostCC.tfDSN.Text + ";UID=" + ODBCHostCC.tfUser.Text + ";PWD=" + ODBCHostCC.tfPass.Text
		    
		    CheckConnection
		    
		  elseif rbConnectionType(4).Value then 'MySQL
		    
		    oDBWrapper = New PAF_DatabaseKit.DBWrapper("MySQL")
		    
		    oDBWrapper.Host = HostCC.tfHost.Text
		    oDBWrapper.Port = val(HostCC.tfPort.Text)
		    oDBWrapper.DatabaseName = HostCC.tfDatabase.Text
		    oDBWrapper.UserName = HostCC.tfUser.Text
		    oDBWrapper.Password = HostCC.tfPass.Text
		    
		    CheckConnection
		    
		  end if
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rbConnectionType
	#tag Event
		Sub Action(index as Integer)
		  #pragma Unused index
		  
		  dim dbType as String = me.Caption
		  
		  Select Case dbType
		    
		  case "SQLite"
		    
		    cbAddToFavorites.Enabled = true
		    cbAddToFavorites.Visible = true
		    
		    pbConnect.Caption = "Select"
		    pbConnect.Enabled = true
		    HostCC.Enabled = false
		    HostCC.Visible = false
		    HostCC.top = 300
		    ODBCHostCC.Enabled = false
		    ODBCHostCC.Visible = false
		    ODBCHostCC.top = 500
		    self.Height = 164
		    
		  case "CubeSQL", "PostgreSQL", "MySQL"
		    
		    cbAddToFavorites.Enabled = false
		    cbAddToFavorites.Visible = false
		    
		    pbConnect.Caption = "Connect"
		    pbConnect.Enabled = HostCC.okToConnect
		    HostCC.Enabled = true
		    HostCC.Visible = true
		    HostCC.Top = 124
		    ODBCHostCC.Enabled = false
		    ODBCHostCC.Visible = false
		    ODBCHostCC.top = 500
		    self.Height = 330
		    HostCC.tfHost.SetFocus
		    
		  case "ODBC"
		    
		    cbAddToFavorites.Enabled = false
		    cbAddToFavorites.Visible = false
		    
		    pbConnect.Caption = "Connect"
		    pbConnect.Enabled = ODBCHostCC.okToConnect
		    HostCC.Enabled = false
		    HostCC.Visible = false
		    HostCC.Top = 500
		    ODBCHostCC.Enabled = true
		    ODBCHostCC.Visible = true
		    ODBCHostCC.Top = 124
		    self.Height = 266
		    ODBCHostCC.tfDSN.SetFocus
		    
		  end select
		  
		  if not LoadingFavorite then
		    pmFavorites.ListIndex = -1
		  end if
		End Sub
	#tag EndEvent
	#tag Event
		Sub Open(index as Integer)
		  #Pragma unused index
		  
		  rbConnectionType(1).Enabled = PAF_DatabaseKit.Settings.kUseCubeSQL
		  rbConnectionType(2).Enabled = PAF_DatabaseKit.Settings.kUsePostgreSQL
		  rbConnectionType(3).Enabled = PAF_DatabaseKit.Settings.kUseODBC
		  rbConnectionType(4).Enabled = PAF_DatabaseKit.Settings.kUseMySQL
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pmFavorites
	#tag Event
		Sub Change()
		  if me.Text <> "" then
		    LoadingFavorite = True
		    
		    LoadConnectionString(me.RowTag(me.ListIndex).StringValue)
		    
		    bbDeleteFavorite.Icon = minus_color
		    bbDeleteFavorite.Enabled = true
		    
		    LoadingFavorite = False
		    
		  else
		    
		    bbDeleteFavorite.Icon = minus_disabled
		    bbDeleteFavorite.Enabled = false
		    
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events bbAddFavorite
	#tag Event
		Sub Action()
		  AddFavorite
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events bbDeleteFavorite
	#tag Event
		Sub Action()
		  dim d as New MessageDialog //declare the MessageDialog object
		  dim b as MessageDialogButton //for handling the result
		  d.icon = MessageDialog.GraphicCaution //display ? icon
		  d.ActionButton.Caption = "Delete"
		  d.CancelButton.Visible = True //show the Cancel button
		  d.AlternateActionButton.Visible = False //show the "Don't Save" button
		  d.AlternateActionButton.Caption = "No"
		  d.Message = "Are you sure you want to delete this favorite?"
		  d.Explanation = ""
		  
		  b = d.ShowModal //display the dialog
		  Select Case b //determine which button was pressed.
		  Case d.ActionButton
		    
		    pmFavorites.RemoveRow(pmFavorites.ListIndex)
		    pmFavorites.ListIndex = -1
		    ClearEntry
		    
		  Case d.AlternateActionButton
		    
		  Case d.CancelButton
		    //user pressed Cancel
		  End select
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="BackColor"
		Visible=true
		Group="Appearance"
		InitialValue="&hFFFFFF"
		Type="Color"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Appearance"
		Type="Picture"
		EditorType="Picture"
	#tag EndViewProperty
	#tag ViewProperty
		Name="CloseButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Frame"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Metal Window"
			"10 - Drawer Window"
			"11 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreenButton"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackColor"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Position"
		InitialValue="400"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LiveResize"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=true
		Group="Appearance"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxHeight"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaxWidth"
		Visible=true
		Group="Position"
		InitialValue="32000"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Appearance"
		Type="MenuBar"
		EditorType="MenuBar"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinHeight"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimizeButton"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinWidth"
		Visible=true
		Group="Position"
		InitialValue="64"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Placement"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Appearance"
		InitialValue="Untitled"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Position"
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
