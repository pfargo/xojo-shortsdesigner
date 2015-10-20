#tag Window
Begin ContainerControl PAFWhereCC
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   262
   HelpTag         =   ""
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   False
   LockLeft        =   False
   LockRight       =   False
   LockTop         =   False
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Top             =   0
   Transparent     =   True
   UseFocusRing    =   False
   Visible         =   True
   Width           =   784
   Begin GroupBox GroupBox1
      AutoDeactivate  =   True
      Bold            =   False
      Caption         =   "Add / Edit Condition"
      Enabled         =   True
      Height          =   102
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   0
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
      Top             =   0
      Underline       =   False
      Visible         =   True
      Width           =   784
      Begin PopupMenu pmWhereOperator
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         InitialValue    =   ""
         Italic          =   False
         Left            =   363
         ListIndex       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   34
         Underline       =   False
         Visible         =   True
         Width           =   125
      End
      Begin TextField tfWhereValue
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   False
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         CueText         =   ""
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   510
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   34
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   264
      End
      Begin RadioButton rbAndOr
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "And"
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   0
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   10
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   3
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   37
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   49
      End
      Begin RadioButton rbAndOr
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Or"
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   1
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   63
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
         Top             =   38
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   38
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
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   116
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   5
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Field:"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   15
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   42
      End
      Begin Label Label2
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   374
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   6
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Operator:"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   15
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   66
      End
      Begin Label Label3
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   510
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   7
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Value:"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   16
         Transparent     =   True
         Underline       =   False
         Visible         =   True
         Width           =   42
      End
      Begin PushButton pbWhereAddSave
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Add"
         Default         =   False
         Enabled         =   False
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   694
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   8
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   68
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin PushButton pbWhereReset
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Reset"
         Default         =   False
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   602
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   9
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   68
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin PopupMenu pmWhereField
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         InitialValue    =   ""
         Italic          =   False
         Left            =   116
         ListIndex       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   10
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   34
         Underline       =   False
         Visible         =   True
         Width           =   235
      End
      Begin PushButton pbWhereDelete
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Delete"
         Default         =   False
         Enabled         =   False
         Height          =   22
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   510
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   12
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   68
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin RadioButton rbShow
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "All Report Table Fields"
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   0
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   71
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
         Top             =   72
         Underline       =   False
         Value           =   True
         Visible         =   True
         Width           =   168
      End
      Begin RadioButton rbShow
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Just Report Fields"
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   1
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   251
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   15
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   72
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   147
      End
      Begin RadioButton rbShow
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "All Fields"
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   2
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   410
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   16
         TabPanelIndex   =   0
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   72
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   100
      End
      Begin Label Label4
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "GroupBox1"
         Italic          =   False
         Left            =   10
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   17
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Show:"
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   72
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   48
      End
   End
   Begin Listbox lbWhere
      AutoDeactivate  =   True
      AutoHideScrollbars=   True
      Bold            =   False
      Border          =   True
      ColumnCount     =   1
      ColumnsResizable=   False
      ColumnWidths    =   ""
      DataField       =   ""
      DataSource      =   ""
      DefaultRowHeight=   -1
      Enabled         =   True
      EnableDrag      =   False
      EnableDragReorder=   False
      GridLinesHorizontal=   0
      GridLinesVertical=   0
      HasHeading      =   True
      HeadingIndex    =   -1
      Height          =   157
      HelpTag         =   ""
      Hierarchical    =   False
      Index           =   -2147483648
      InitialParent   =   ""
      InitialValue    =   "Condition"
      Italic          =   False
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      RequiresSelection=   False
      Scope           =   0
      ScrollbarHorizontal=   False
      ScrollBarVertical=   True
      SelectionType   =   1
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   105
      Underline       =   False
      UseFocusRing    =   False
      Visible         =   True
      Width           =   784
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin BevelButton bbDateTime
      AcceptFocus     =   True
      AutoDeactivate  =   True
      BackColor       =   &cFFFFFF00
      Bevel           =   0
      Bold            =   False
      ButtonType      =   0
      Caption         =   ""
      CaptionAlign    =   3
      CaptionDelta    =   0
      CaptionPlacement=   1
      Enabled         =   True
      HasBackColor    =   True
      HasMenu         =   1
      Height          =   22
      HelpTag         =   ""
      Icon            =   359190022
      IconAlign       =   0
      IconDX          =   0
      IconDY          =   0
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   715
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MenuValue       =   0
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   -46
      Underline       =   False
      Value           =   False
      Visible         =   False
      Width           =   25
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub BuildWhereTableFieldsMenu()
		  pmWhereField.DeleteAllRows
		  
		  
		  if rbShow(0).Value then
		    
		    For i as integer = 0 to ReportTableFieldMenu.Count - 1 ' tables
		      
		      For j as integer = 0 to ReportTableFieldMenu.Item(i).Count - 1 ' fields
		        
		        pmWhereField.AddRow ReportTableFieldMenu.Item(i).Item(j).Name
		        
		      next
		      
		    next
		    
		  elseif rbShow(1).Value then
		    
		    For i as integer = 0 to ReportFieldMenu.Count - 1 ' tables
		      
		      For j as integer = 0 to ReportFieldMenu.Item(i).Count - 1 ' fields
		        
		        pmWhereField.AddRow ReportFieldMenu.Item(i).Item(j).Name
		        
		      next
		      
		    next
		    
		  else
		    
		    For i as integer = 0 to AllFieldMenu.Count - 1 ' tables
		      
		      For j as integer = 0 to AllFieldMenu.Item(i).Count - 1 ' fields
		        
		        pmWhereField.AddRow AllFieldMenu.Item(i).Item(j).Name
		        
		      next
		      
		    next
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ClearWhereCondition()
		  pmWhereField.ListIndex = -1
		  pmWhereOperator.ListIndex = -1
		  tfWhereValue.text = ""
		  rbAndOr(0).Value = true
		  rbAndOr(1).Value = False
		  lbWhere.ListIndex = -1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetupMenus(arsReportFields() As String)
		  me.arsReportFields = arsReportFields
		  
		  AllFieldMenu = oDBWrapper.BuildSchemaMenu
		  ReportFieldMenu = oDBWrapper.BuildSchemaMenu(arsReportFields,false)
		  ReportTableFieldMenu = oDBWrapper.BuildSchemaMenu(arsReportFields,true)
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		AllFieldMenu As MenuItem
	#tag EndProperty

	#tag Property, Flags = &h0
		arsReportFields() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		oDBWrapper As PAF_DatabaseKit.DBWrapper
	#tag EndProperty

	#tag Property, Flags = &h0
		ReportFieldMenu As MenuItem
	#tag EndProperty

	#tag Property, Flags = &h0
		ReportTableFieldMenu As MenuItem
	#tag EndProperty


#tag EndWindowCode

#tag Events pmWhereOperator
	#tag Event
		Sub Open()
		  me.addRow "="
		  me.addRow "<>"
		  me.addRow "<"
		  me.addRow "<="
		  me.addRow ">"
		  me.addRow ">="
		  me.AddRow "In"
		  me.AddRow "Starts With"
		  me.addRow "Contains"
		  me.AddRow "Ends With"
		  me.addRow "Is Null"
		  me.addRow "Is Not Null"
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  if me.Text = "Is Null" or me.Text = "Is Not Null" then
		    
		    tfWhereValue.Text = ""
		    tfWhereValue.Enabled = false
		    
		    pbWhereAddSave.Enabled = pmWhereField.Text <> "" and pmWhereOperator.text <> ""
		    
		  elseif me.Text = "In" then
		    
		    
		  else
		    
		    tfWhereValue.Enabled = true
		    
		    pbWhereAddSave.Enabled = pmWhereField.Text <> "" and pmWhereOperator.text <> "" and tfWhereValue.Text <> ""
		    
		  end if
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tfWhereValue
	#tag Event
		Sub TextChange()
		  if pmWhereField.Text = "Is Null" or pmWhereField.Text = "Is Not Null" then
		    
		    pbWhereAddSave.Enabled = pmWhereField.Text <> "" and pmWhereOperator.text <> ""
		    
		  else
		    
		    pbWhereAddSave.Enabled = pmWhereField.Text <> "" and pmWhereOperator.text <> "" and tfWhereValue.Text <> ""
		    
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbWhereAddSave
	#tag Event
		Sub Action()
		  Dim qc As New PAFQueryCondition
		  
		  qc.Field = pmWhereField.Text
		  qc.Operator = pmWhereOperator.text
		  qc.Value = tfWhereValue.text
		  
		  
		  dim tblName, fldName as Text
		  
		  tblName = NthField(qc.Field,".",1).ToText
		  fldName = NthField(qc.Field,".",2).ToText
		  
		  Dim fldDict As xojo.Core.Dictionary = oDBWrapper.SchemaDict.Lookup(tblName,nil)
		  dim test As auto
		  
		  if fldDict <> nil then
		    
		    test = fldDict.Value(fldName)
		    
		  end if
		  
		  qc.Type = oDBWrapper.type + "|" + test
		  
		  #if PAF_DatabaseKit.Settings.kUseODBC then
		    'May be special cases for various odbc databases so we attach the DBMS
		    if oDBWrapper.type = "ODBC" then
		      
		      qc.Type = qc.Type + "|" + ODBCDatabase(oDBWrapper.db).DBMS
		      
		    end if
		  #endif
		  
		  Dim sAndOr As String
		  
		  if rbAndOr(1).Value then
		    sAndOr = "Or"
		  else
		    sAndOr = "And"
		  end if
		  
		  
		  if lbWhere.ListIndex = -1 then
		    
		    if lbWhere.ListCount > 0 then
		      
		      // not first condition so and/or applies
		      
		      qc.AndOr = sAndOr
		      
		    end if
		    
		    lbWhere.AddRow ""
		    
		    lbWhere.RowTag(lbWhere.LastIndex) = qc
		    
		  else
		    
		    if lbWhere.ListIndex > 0 then
		      
		      // not first condition so and/or applies
		      
		      qc.AndOr = sAndOr
		      
		    end if
		    
		    lbWhere.Cell(lbWhere.ListIndex,0) =  qc.ConditionString
		    
		    lbWhere.RowTag(lbWhere.ListIndex) = qc
		    
		  end if
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbWhereReset
	#tag Event
		Sub Action()
		  ClearWhereCondition
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pmWhereField
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  dim mItem As MenuItem
		  
		  if rbShow(0).Value then
		    mItem = ReportTableFieldMenu.PopUp(me.TrueWindow.Left + self.left + me.left, me.TrueWindow.top + self.top + me.top)
		  elseif rbShow(1).Value then
		    mItem = ReportFieldMenu.PopUp(me.TrueWindow.Left + self.left + me.left, me.TrueWindow.top + self.top + me.top)
		  else
		    mItem = AllFieldMenu.PopUp(me.TrueWindow.Left + self.left + me.left, me.TrueWindow.top + self.top + me.top)
		  end if
		  
		  if mItem <> nil then
		    
		    if mItem.Text <> "" then
		      
		      me.SetPMText = mItem.Name
		      
		    end if
		    
		  end if
		  
		  Return True
		End Function
	#tag EndEvent
	#tag Event
		Sub Change()
		  if pmWhereOperator.Text = "Is Null" or pmWhereOperator.Text = "Is Not Null" then
		    
		    pbWhereAddSave.Enabled = pmWhereField.Text <> "" and pmWhereOperator.text <> ""
		    
		  else
		    
		    pbWhereAddSave.Enabled = pmWhereField.Text <> "" and pmWhereOperator.text <> "" and tfWhereValue.Text <> ""
		    
		  end if
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbWhereDelete
	#tag Event
		Sub Action()
		  lbWhere.RemoveRow(lbWhere.ListIndex)
		  lbWhere.ListIndex = -1
		  ClearWhereCondition
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events lbWhere
	#tag Event
		Sub Change()
		  if me.ListIndex = -1 then
		    
		    pbWhereAddSave.Caption = "Add"
		    
		    pbWhereDelete.Enabled = false
		    
		  else
		    
		    
		    pbWhereAddSave.Caption = "Save"
		    
		    pbWhereDelete.Enabled = true
		    
		    dim qc As PAFQueryCondition = me.RowTag(me.ListIndex)
		    
		    if qc.AndOr = "Or" then
		      rbAndOr(1).Value = True
		    else
		      rbAndOr(0).Value = True
		    end if
		    
		    pmWhereField.SetPMText = qc.Field
		    pmWhereOperator.SetPMText = qc.Operator
		    tfWhereValue.Text = qc.Value
		    
		  end if
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function CellTextPaint(g As Graphics, row As Integer, column As Integer, x as Integer, y as Integer) As Boolean
		  if row > -1 and row < me.ListCount then
		    g.DrawString(PAFQueryCondition(me.RowTag(row)).ConditionString, 4, 10)
		  end if
		  
		  Return true
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events bbDateTime
	#tag Event
		Sub Open()
		  me.addrow "Date"
		  me.AddRow "Time"
		  me.AddRow "TimeStamp"
		End Sub
	#tag EndEvent
	#tag Event
		Sub Action()
		  
		  
		  'tfWhereValue.Text = DateTimeWin.Process(Me.List(Me.MenuValue), tfWhereValue.Text)
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="AcceptFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AcceptTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
	#tag EndViewProperty
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
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="EraseBackground"
		Visible=true
		Group="Behavior"
		InitialValue="True"
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
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="HelpTag"
		Visible=true
		Group="Appearance"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Group="Position"
		Type="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Position"
		Type="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		Type="String"
		EditorType="String"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabPanelIndex"
		Group="Position"
		InitialValue="0"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabStop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		Type="Integer"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType="Boolean"
	#tag EndViewProperty
	#tag ViewProperty
		Name="UseFocusRing"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType="Boolean"
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
		InitialValue="300"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
