#tag Window
Begin ContainerControl PreviewCC
   AcceptFocus     =   False
   AcceptTabs      =   True
   AutoDeactivate  =   True
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   Compatibility   =   ""
   Enabled         =   True
   EraseBackground =   True
   HasBackColor    =   False
   Height          =   792
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
   Width           =   852
   Begin PlaceHolderCanvas ctlViewer
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   734
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   38
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   812
      Begin ScrollBar vScroll
         AcceptFocus     =   True
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   619
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ctlViewer"
         Left            =   694
         LineStep        =   1
         LiveScroll      =   False
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   True
         LockTop         =   True
         Maximum         =   100
         Minimum         =   0
         PageStep        =   20
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   45
         Value           =   0
         Visible         =   True
         Width           =   15
      End
      Begin ScrollBar hScroll
         AcceptFocus     =   True
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   15
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "ctlViewer"
         Left            =   177
         LineStep        =   1
         LiveScroll      =   False
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   False
         Maximum         =   100
         Minimum         =   0
         PageStep        =   20
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   606
         Value           =   0
         Visible         =   True
         Width           =   440
      End
   End
   Begin BKS_Thread rptThread
      Enabled         =   True
      Height          =   "32"
      Index           =   -2147483648
      Left            =   "0"
      LockedInPosition=   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   "853"
      Visible         =   True
      Width           =   "32"
   End
   Begin Timer tmrReportDone
      Enabled         =   True
      Height          =   "32"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   60
      LockedInPosition=   False
      Mode            =   0
      Period          =   1000
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   60
      Visible         =   True
      Width           =   "32"
   End
   Begin Timer tmrStartReport
      Enabled         =   True
      Height          =   "32"
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   94
      LockedInPosition=   False
      Mode            =   0
      Period          =   100
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   661
      Visible         =   True
      Width           =   "32"
   End
   Begin Canvas cvsMessage
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   False
      Enabled         =   True
      EraseBackground =   True
      Height          =   83
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   279
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   -234
      Transparent     =   True
      UseFocusRing    =   True
      Visible         =   True
      Width           =   224
      Begin ProgressWheel ProgressWheel1
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   32
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "cvsMessage"
         Left            =   375
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   -214
         Visible         =   True
         Width           =   32
      End
      Begin Label Label2
         AutoDeactivate  =   True
         Bold            =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "cvsMessage"
         Italic          =   False
         Left            =   299
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Text            =   "Generating Report..."
         TextAlign       =   1
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   16.0
         TextUnit        =   0
         Top             =   -179
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   200
      End
   End
   Begin Label stPage
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   91
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
      Text            =   "x/y"
      TextAlign       =   1
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   74
   End
   Begin Label Label3
      AutoDeactivate  =   True
      Bold            =   True
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   654
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
      Text            =   "Scale:"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   66
   End
   Begin PushButton pbNext
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   ">"
      Default         =   False
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   166
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
      Width           =   59
   End
   Begin PushButton pbPrev
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "<"
      Default         =   False
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
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   0
      Underline       =   False
      Visible         =   True
      Width           =   59
   End
   Begin Slider Slider1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   23
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   732
      LineStep        =   1
      LiveScroll      =   True
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Maximum         =   100
      Minimum         =   0
      PageStep        =   20
      Scope           =   0
      TabIndex        =   9
      TabPanelIndex   =   0
      TabStop         =   True
      TickStyle       =   "0"
      Top             =   3
      Value           =   50
      Visible         =   True
      Width           =   100
   End
End
#tag EndWindow

#tag WindowCode
	#tag Method, Flags = &h21
		Private Sub CreateReport()
		  rptThread.Run
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub DisplayPage()
		  if ctlViewer.Document=nil then
		    stPage.Text = "(no document)"
		    return
		  end if
		  stPage.Text = Str(ctlViewer.CurrentPage+1) + "/" + Str(ctlViewer.Document.PageCount)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadReportJSON(oDBWrapper as PAF_DatabaseKit.DBWrapper, jReport as JSONItem)
		  if jReport <> nil then
		    
		    ctlViewer.CurrentPage = 0
		    
		    oReport = New ReportPF(oDBWrapper,jReport,Designer)
		    
		    tmrStartReport.mode = timer.ModeSingle
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SaveAsPDF()
		  //Get a folderitem to store our PDF
		  dim f as FolderItem = GetSaveFolderItem("", "test.pdf")
		  if f=nil then
		    return
		  end if
		  
		  //Create an Document instance
		  dim oDoc as BKS_Shorts.Document
		  
		  oDoc = ctlViewer.Document
		  
		  if oDoc=nil then
		    return
		  end if
		  
		  //Create our view
		  dim oView as new BKS_Shorts.View
		  oView.ViewLeft = 0
		  oView.ViewTop = 0
		  oView.Scale = 1.0
		  
		  //Create DynaPDF Renderer
		  dim o as new BKS_ShortsDynaPDF.Renderer(f)
		  
		  //Now Render
		  oDoc.Render(o, oView)
		  
		  //Now launch it so the user can see it in a native viewer.
		  f.Launch
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Designer As PAF_PrintKit.DesignCanvas
	#tag EndProperty

	#tag Property, Flags = &h21
		Private oDBWrapper As PAF_DatabaseKit.DBWrapper
	#tag EndProperty

	#tag Property, Flags = &h0
		oReport As ReportPF
	#tag EndProperty

	#tag Property, Flags = &h21
		Private starttick As Integer
	#tag EndProperty


#tag EndWindowCode

#tag Events ctlViewer
	#tag Event
		Sub Open()
		  me.VerticalScrollbar = vScroll
		  me.HorizontalScrollbar = hScroll
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events rptThread
	#tag Event
		Sub UIUpdate(d as Dictionary)
		  if d.HasKey("Document") = false then return
		  
		  dim oDoc as BKS_Shorts.Document = d.value("Document")
		  
		  ctlViewer.Document = oDoc
		  tmrReportDone.mode = tmrReportDone.ModeSingle
		End Sub
	#tag EndEvent
	#tag Event
		Sub Run()
		  //Create a new instance of our BKS_Shorts object
		  dim oDoc as new BKS_Shorts.Document
		  
		  'dim rpt as new ReportPF
		  
		  //We call our class that creates the individual pages and then add the pages into our Document class
		  'for each oPage as BKS_Shorts.Page in rpt.CreateItemReport(db, bShowGrid)
		  'oDoc.AppendPage(oPage)
		  'next
		  
		  for each oPage as BKS_Shorts.Page in oReport.CreateReport(oReport.oDBWrapper, me)
		    oDoc.AppendPage(oPage)
		  next
		  
		  dim d as new Dictionary
		  d.value("Document") = oDoc
		  
		  me.UpdateUI d
		End Sub
	#tag EndEvent
	#tag Event
		Sub HandleEvent(sEvent as String)
		  Select case sEvent
		  case me.kStart
		    ctlViewer.Visible = false
		    cvsMessage.Visible = true
		    ProgressWheel1.Visible = true
		  case me.kFinished
		    
		    
		  case me.kKilled
		    
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tmrReportDone
	#tag Event
		Sub Action()
		  me.Mode = timer.ModeOff
		  
		  ctlViewer.Visible = true
		  cvsMessage.Visible = false
		  ProgressWheel1.Visible = false
		  
		  DisplayPage
		  
		  // Adjust scale to show full page
		  // -30 accounts for space around page
		  dim dPreviewH, dPreviewW As double
		  
		  dPreviewH = ((ctlViewer.Height - 30)/ReportPF(oReport).GetPageHeight) * 50
		  dPreviewW = ((ctlViewer.Width - 30)/ReportPF(oReport).GetPageWidth) * 50
		  
		  Slider1.Value = min(dPreviewH, dPreviewW)
		  pfDispatcher.send "ReportRun"
		  
		  'MsgBox "Report took " + str((Ticks - starttick)/60) + " seconds to process"
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tmrStartReport
	#tag Event
		Sub Action()
		  me.mode = timer.ModeOff
		  ctlViewer.Visible = false
		  cvsMessage.top = (self.Height - cvsMessage.Height)/2
		  cvsMessage.width = (self.Width - cvsMessage.Width)/2
		  cvsMessage.Visible = true
		  cvsMessage.Refresh
		  self.Refresh
		  
		  starttick = ticks
		  
		  CreateReport
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Label3
	#tag Event
		Function MouseDown(X As Integer, Y As Integer) As Boolean
		  MsgBox str(Slider1.Value)
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events pbNext
	#tag Event
		Sub Action()
		  ctlViewer.NextPage
		  DisplayPage
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbPrev
	#tag Event
		Sub Action()
		  ctlViewer.PreviousPage
		  DisplayPage
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Slider1
	#tag Event
		Sub ValueChanged()
		  dim dScale as double = me.Value/50.0
		  ctlViewer.Scale = dScale
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
		InitialValue="400"
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
		InitialValue="600"
		Type="Integer"
	#tag EndViewProperty
#tag EndViewBehavior
