#tag Class
Protected Class ScrollCanvas
Inherits Canvas
	#tag Event
		Function MouseWheel(X As Integer, Y As Integer, deltaX as Integer, deltaY as Integer) As Boolean
		  #Pragma Unused x
		  #Pragma Unused y
		  
		  Scrollby(deltax,deltay)
		End Function
	#tag EndEvent

	#tag Event
		Sub Open()
		  dim w as Window
		  dim c as Control
		  //w = self.FindParentWindow
		  w = self.Window
		  if w <> nil then
		    c = self.FindControlByName(w, self.HScrollBarName)
		    if c <> nil and c isa SCScrollBar then
		      self.hScrollBar = SCScrollBar(c)
		      self.hScrollBar.client = self
		    end
		    c = self.FindControlByName(w, self.VScrollBarName)
		    if c <> nil and c isa SCScrollBar then
		      self.vScrollBar = SCScrollBar(c)
		      self.vScrollBar.client = self
		    end
		  end
		  self.UpdateScrollBars
		  Open
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h1
		Protected Function FindControlByName(w as Window, name as string) As Control
		  dim i, n as integer
		  dim c as Control
		  n = w.ControlCount
		  for i = 0 to n - 1
		    c = w.Control(i)
		    if c.name = name then
		      return c
		    end
		  next
		  return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScrollbarValueChanged()
		  dim x, y as integer
		  if self.hScrollBar <> nil then
		    x = self.hScrollBar.Value
		  else
		    x = 0
		  end
		  if self.vScrollBar <> nil then
		    y = self.vScrollBar.Value
		  else
		    y = 0
		  end
		  self.ScrollTo x, y
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScrollBy(dx as integer, dy as integer)
		  self.ScrollTo -self.xOrigin + dx, -self.yOrigin + dy
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ScrollTo(x as integer, y as integer)
		  dim x0, y0 as integer // Old offset
		  dim x1, y1 as integer // New offset
		  dim dx, dy as integer // Amount to scroll by
		  dim l, r as integer // Left and right sides of horizontal strip to refresh
		  x0 = -self.xOrigin
		  y0 = -self.yOrigin
		  x1 = max(0, min(x, self.extentWidth - self.width))
		  y1 = max(0, min(y, self.extentHeight - self.height))
		  self.xOrigin = -x1
		  self.yOrigin = -y1
		  dx = x1 - x0
		  dy = y1 - y0
		  self.Scroll -dx, -dy
		  if dx < 0 then
		    self.Invalidate false '0, 0, -dx, self.height, false
		    l = -dx
		    r = self.width
		  else
		    self.Invalidate  false 'self.width - dx, 0, dx, self.height, false
		    l = 0
		    r = self.width - dx
		  end
		  if dy < 0 then
		    self.Invalidate false ' l, 0, r - l, -dy, false
		  else
		    self.Invalidate false ' l, self.height - dy, r - l, dy, false
		  end
		  self.UpdateScrollBars
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetExtent(width as integer, height as integer)
		  self.extentWidth = width
		  self.extentHeight = height
		  self.ScrollTo -self.xOrigin, -self.yOrigin
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub UpdateScrollBars()
		  dim maxx, maxy as integer
		  maxx = max(0, self.extentWidth - self.width)
		  maxy = max(0, self.extentHeight - self.height)
		  if self.hScrollBar <> nil then
		    self.hScrollBar.SetValues(-self.xOrigin, maxx)
		    
		  end
		  if self.vScrollBar <> nil then
		    self.vScrollBar.SetValues(-self.yOrigin, maxy)
		    
		  end
		  
		  self.hScrollBar.Refresh(false)
		  self.vScrollBar.Refresh(false)
		End Sub
	#tag EndMethod


	#tag Hook, Flags = &h0
		Event Open()
	#tag EndHook


	#tag Property, Flags = &h0
		extentHeight As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		extentWidth As integer
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected hScrollBar As SCScrollbar
	#tag EndProperty

	#tag Property, Flags = &h4
		HScrollBarName As string
	#tag EndProperty

	#tag Property, Flags = &h1
		Protected vScrollBar As SCScrollBar
	#tag EndProperty

	#tag Property, Flags = &h4
		VScrollBarName As string
	#tag EndProperty

	#tag Property, Flags = &h0
		xOrigin As integer
	#tag EndProperty

	#tag Property, Flags = &h0
		yOrigin As integer
	#tag EndProperty


	#tag ViewBehavior
		#tag ViewProperty
			Name="AcceptFocus"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AcceptTabs"
			Visible=true
			Group="Behavior"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="AutoDeactivate"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Backdrop"
			Visible=true
			Group="Appearance"
			Type="Picture"
			EditorType="Picture"
		#tag EndViewProperty
		#tag ViewProperty
			Name="DoubleBuffer"
			Visible=true
			Group="Behavior"
			InitialValue="False"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Enabled"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="EraseBackground"
			Visible=true
			Group="Behavior"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="extentHeight"
			Group="Behavior"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="extentWidth"
			Group="Behavior"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Height"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HelpTag"
			Visible=true
			Group="Appearance"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="HScrollBarName"
			Visible=true
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=true
			Group="ID"
			Type="Integer"
			EditorType="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="InitialParent"
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
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Visible"
			Visible=true
			Group="Appearance"
			InitialValue="True"
			Type="Boolean"
		#tag EndViewProperty
		#tag ViewProperty
			Name="VScrollBarName"
			Visible=true
			Group="Behavior"
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Width"
			Visible=true
			Group="Position"
			InitialValue="100"
			Type="Integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="xOrigin"
			Group="Behavior"
			Type="integer"
		#tag EndViewProperty
		#tag ViewProperty
			Name="yOrigin"
			Group="Behavior"
			Type="integer"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
