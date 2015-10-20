#tag Window
Begin ContainerControl PAF_PropertyListCC
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   False
   HasBackColor    =   False
   Height          =   200
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
   Transparent     =   False
   UseFocusRing    =   False
   Visible         =   True
   Width           =   200
   Begin Canvas PropList
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   True
      Enabled         =   True
      EraseBackground =   False
      Height          =   200
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   0
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   0
      Transparent     =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   200
      Begin TextField TextEntry
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
         InitialParent   =   "PropList"
         Italic          =   False
         Left            =   57
         LimitText       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "Geneva"
         TextSize        =   10.0
         TextUnit        =   0
         Top             =   73
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   False
         Width           =   80
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h21
		Private Sub AddProperties(g as Graphics)
		  dim iTop as Integer = kCellHeight
		  
		  for each oItem as PAF_PropertyListKit.ListItem in Items
		    
		    oItem.Draw(g, iTop)
		    
		    iTop = iTop + kCellHeight
		    
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CheckAndUpdateOrAppend(chkItem as PAF_PropertyListKit.ListItem, objType as String)
		  dim foundItem as Boolean
		  
		  For Each oItem as PAF_PropertyListKit.ListItem in Items
		    
		    foundItem = (chkItem.Caption = oItem.Caption)
		    
		    if foundItem then
		      
		      oItem.PropertyObjects.Append chkItem.PropertyObjects(0)
		      
		      if chkItem.Value <> oItem.Value then
		        
		        oItem.Value = ""
		        
		      end if
		      
		      exit
		    end if
		    
		  Next
		  
		  if not foundItem then
		    
		    items.Append chkItem
		    
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DrawHeader(g as Graphics)
		  g.ForeColor = &cFFFFFF
		  
		  g.FillRect(0,0,Width,Height)
		  
		  dim startColor, endColor as Color
		  endColor = &cFFFFFF
		  startColor = &cDFDFDF
		  
		  g.GradientFill(1,1,g.Width-2,15,startColor,endColor)
		  
		  g.ForeColor = &cBDBDBD
		  
		  g.DrawRect(0,0,g.Width,17)
		  
		  g.DrawLine(g.Width/2,0,g.Width/2,16)
		  
		  g.ForeColor = &c000000
		  
		  g.DrawString("Property", g.Width/2 - g.StringWidth("Property") - 4, 12)
		  
		  g.DrawString("Value", g.Width/2 + 4, 12)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function IsInlineEditable(item as PAF_PropertyListKit.ListItem) As Boolean
		  If item IsA PAF_PropertyListKit.TextProperty then
		    
		    ' Don't want to edit read only item
		    if PAF_PropertyListKit.TextProperty(item).ReadOnly then Return false
		    
		    if PAF_PropertyListKit.TextProperty(item).IsTextArea then
		      
		      Return false
		      
		    else
		      
		      Return true
		      
		    end if
		    
		  else
		    
		    Return false
		    
		  end if
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Update(optional aroItems() as PAF_PropertyListKit.ListItem)
		  if aroItems = nil then
		    
		    Redim Items(-1)
		    
		  else
		    
		    Items = aroItems
		    
		  end if
		  
		  me.Invalidate(false)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateText(tf as TextField)
		  if Items.Ubound >= CurrentRow - 1 then
		    
		    Items(CurrentRow-1).Update(tf.Text)
		    
		  end if
		  
		  tf.Visible = false
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ValidateClick(X as Integer, Y as Integer) As Boolean
		  dim row as Integer = Y \ kCellHeight
		  
		  if row > 0 and row <= Items.Ubound + 1 then
		    
		    if X > me.Width/2 then
		      
		      Return true
		      
		    end if
		    
		  end if
		  
		  Return false
		End Function
	#tag EndMethod


	#tag Property, Flags = &h21
		Private CurrentRow As Integer
	#tag EndProperty

	#tag Property, Flags = &h21
		Private Items() As PAF_PropertyListKit.ListItem
	#tag EndProperty

	#tag Property, Flags = &h0
		ParentContainer As DesignerCC
	#tag EndProperty


	#tag Constant, Name = kCellHeight, Type = Double, Dynamic = False, Default = \"17", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kShiftTabKey, Type = Double, Dynamic = False, Default = \"25", Scope = Public
	#tag EndConstant

	#tag Constant, Name = kTabKey, Type = Double, Dynamic = False, Default = \"9", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events PropList
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  self.TrueWindow.SetFocus
		  
		  If ValidateClick(X,Y) then
		    
		    currentRow = y \ kCellHeight
		    
		    dim clicked as Integer = currentRow - 1
		    
		    select case Items(clicked)
		      
		    case IsA PAF_PropertyListKit.CheckboxProperty
		      
		      Items(clicked).Update Not Items(clicked).Value
		      
		    case IsA PAF_PropertyListKit.ColorProperty
		      
		      dim c as Color = Items(clicked).Value
		      
		      Call SelectColor(c,"Select a Color")
		      
		      Items(clicked).Update(c)
		      
		    case IsA PAF_PropertyListKit.MenuProperty
		      
		      dim result as MenuItem = PAF_PropertyListKit.MenuProperty(Items(clicked)).oMenu.PopUp
		      
		      if result <> nil then
		        
		        // may be a field listing where we want table.field
		        // check the name property for a value
		        
		        if result.name <> "" then
		          
		          items(clicked).Update(result.Name)
		          
		        else
		          
		          Items(clicked).Update(result.Text)
		          
		        end if
		        
		      end if
		      
		    case IsA PAF_PropertyListKit.EnumProperty
		      
		      dim m as New MenuItem
		      
		      dim s, values() as String
		      
		      dim dict as New Dictionary
		      
		      dict =  PAF_PropertyListKit.EnumProperty(Items(clicked)).ItemsDict
		      
		      For i as Integer = 0 to dict.Count - 1
		        values.Append dict.Value(i).StringValue
		      Next
		      
		      m.Append( New MenuItem ( "" ))
		      
		      For each s in Values
		        
		        m.Append( New MenuItem ( s ))
		        
		      Next
		      
		      dim result as MenuItem = m.PopUp
		      
		      if result <> nil then
		        
		        For i as Integer = 0 to dict.Count - 1
		          
		          if dict.Value(i) = result.Text then
		            
		            Items(clicked).Update(i)
		            
		            exit
		            
		          End if
		          
		        Next
		        
		        
		      end if
		      
		    case IsA PAF_PropertyListKit.TextProperty
		      
		      if not PAF_PropertyListKit.TextProperty(Items(clicked)).ReadOnly then
		        
		        if Not PAF_PropertyListKit.TextProperty(Items(clicked)).IsTextArea and not Keyboard.AsyncShiftKey then
		          
		          TextEntry.Left = me.Left + me.Width/2
		          
		          TextEntry.Width = me.Width/2 - 2
		          
		          TextEntry.top = me.Top + (currentRow * kCellHeight) - 4
		          
		          TextEntry.Height = kCellHeight
		          
		          TextEntry.Text = Items(clicked).Value.StringValue
		          
		          TextEntry.Visible = true
		          
		          TextEntry.SelectAll
		          
		          TextEntry.SetFocus
		          
		        else
		          
		          dim propItem as PAF_PropertyListKit.TextProperty = PAF_PropertyListKit.TextProperty(Items(clicked))
		          dim newText as String
		          
		          // Open text editing Window
		          
		          newText = EditTextPropertyWin.EditText(ParentContainer.oDBWrapper, ParentContainer.Scroller.Designer.Bands, propItem.Value.StringValue, propItem.Caption)
		          
		          propItem.Update(newText)
		          
		        End if
		        
		      end if
		      
		    end Select
		    
		    me.Invalidate(false)
		    
		  end if
		  
		End Function
	#tag EndEvent
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  DrawHeader g
		  AddProperties g
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events TextEntry
	#tag Event
		Sub LostFocus()
		  UpdateText(me)
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  if asc(key) = kTabKey or asc(key) = kShiftTabKey then
		    
		    dim i as Integer
		    
		    if asc(key) = kShiftTabKey or Keyboard.AsyncShiftKey then
		      
		      i = CurrentRow - 2
		      
		      if i = - 1 then i = items.Ubound
		      
		      while Not IsInlineEditable(items(i))
		        
		        if i = 0 then
		          i = Items.Ubound
		        else
		          i = i - 1
		        end if
		        
		      wend
		      
		    else
		      ' tab key
		      
		      i = CurrentRow
		      
		      if CurrentRow > Items.Ubound then i = 0
		      
		      while Not IsInlineEditable(items(i))
		        
		        if i = items.Ubound then
		          i = 0
		        else
		          i = i + 1
		        end if
		        
		      wend
		      
		    end if
		    
		    ' force update of current property
		    UpdateText(me)
		    
		    ' Move entry field
		    TextEntry.top = PropList.Top + (i + 1) * kCellHeight - 4
		    
		    ' Update current row
		    CurrentRow = i + 1
		    
		    'GetProperties(CurrentObjects)
		    
		    PropList.Invalidate(false)
		    
		    TextEntry.Text = Items(i).Value.StringValue
		    
		    TextEntry.Visible = true
		    
		    TextEntry.SetFocus
		    
		    TextEntry.SelectAll
		    
		    Return True
		    
		  end if
		  
		  
		  
		End Function
	#tag EndEvent
	#tag Event
		Function ConstructContextualMenu(base as MenuItem, x as Integer, y as Integer) As Boolean
		  BuildDateTimeMenu(base)
		  
		End Function
	#tag EndEvent
	#tag Event
		Function ContextualMenuAction(hitItem as MenuItem) As Boolean
		  if hitItem.Tag <> nil then
		    me.Text = hitItem.Tag.StringValue
		  end if
		End Function
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="AcceptFocus"
		Visible=true
		Group="Behavior"
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
