#tag Window
Begin Window DesignerWindow Implements pfReceiver
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   True
   Compatibility   =   ""
   Composite       =   False
   Frame           =   0
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   740
   ImplicitInstance=   False
   LiveResize      =   True
   MacProcID       =   0
   MaxHeight       =   32000
   MaximizeButton  =   False
   MaxWidth        =   32000
   MenuBar         =   1145562693
   MenuBarVisible  =   True
   MinHeight       =   400
   MinimizeButton  =   True
   MinWidth        =   500
   Placement       =   4
   Resizeable      =   True
   Title           =   "Shorts Report Designer"
   Visible         =   True
   Width           =   1180
   Begin PagePanel ppView
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   700
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      PanelCount      =   2
      Panels          =   ""
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      Top             =   20
      Value           =   1
      Visible         =   True
      Width           =   1140
      Begin DesignerCC DesignSpace
         AcceptFocus     =   False
         AcceptTabs      =   True
         AutoDeactivate  =   True
         BackColor       =   &cFFFF00FF
         Backdrop        =   0
         Enabled         =   True
         EraseBackground =   False
         HasBackColor    =   False
         Height          =   692
         HelpTag         =   ""
         InitialParent   =   "ppView"
         Left            =   24
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   23
         Transparent     =   False
         UseFocusRing    =   False
         Visible         =   True
         Width           =   1132
      End
      Begin PreviewCC PreviewCC1
         AcceptFocus     =   False
         AcceptTabs      =   True
         AutoDeactivate  =   True
         BackColor       =   &cFFFF00FF
         Backdrop        =   0
         Enabled         =   True
         EraseBackground =   True
         HasBackColor    =   False
         Height          =   692
         HelpTag         =   ""
         InitialParent   =   "ppView"
         Left            =   24
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   23
         Transparent     =   True
         UseFocusRing    =   False
         Visible         =   True
         Width           =   1132
      End
   End
   Begin MainToolbar MainToolbar1
      Enabled         =   True
      Height          =   32
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   20
      LockedInPosition=   False
      Scope           =   0
      TabPanelIndex   =   0
      Top             =   20
      Visible         =   True
      Width           =   100
   End
   Begin Canvas ResizeMask
      AcceptFocus     =   False
      AcceptTabs      =   False
      AutoDeactivate  =   True
      Backdrop        =   0
      DoubleBuffer    =   True
      Enabled         =   True
      EraseBackground =   False
      Height          =   700
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
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   20
      Transparent     =   False
      UseFocusRing    =   True
      Visible         =   False
      Width           =   1140
   End
   Begin Placard Placard1
      AutoDeactivate  =   True
      Enabled         =   True
      Height          =   25
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Left            =   24
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   False
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Top             =   715
      Value           =   False
      Visible         =   False
      Width           =   1136
      Begin Label lblLoadStatus
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   17
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Placard1"
         Italic          =   False
         Left            =   53
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   0
         Text            =   ""
         TextAlign       =   0
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   717
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   790
      End
      Begin ProgressWheel ProgressWheel1
         AutoDeactivate  =   True
         Enabled         =   True
         Height          =   16
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "Placard1"
         Left            =   29
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   1
         TabPanelIndex   =   0
         TabStop         =   True
         Top             =   719
         Visible         =   True
         Width           =   16
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Function CancelClose(appQuitting as Boolean) As Boolean
		  #Pragma Unused appQuitting
		  
		  if DesignSpace.Scroller.Designer.UndoQ.Ubound > -1 then
		    
		    Dim d as New MessageDialog                  //declare the MessageDialog object
		    Dim b as MessageDialogButton                //for handling the result
		    d.icon=MessageDialog.GraphicCaution         //display warning icon
		    d.ActionButton.Caption="Save"
		    d.CancelButton.Visible=True                 //show the Cancel button
		    d.AlternateActionButton.Visible=True        //show the "Don't Save" button
		    d.AlternateActionButton.Caption="Don't Save"
		    if DesignSpace.Scroller.Designer.ReportName <> "" then
		      d.Message="Do you want to save changes to " + DesignSpace.Scroller.Designer.ReportName + " before closing?"
		    else
		      d.Message="Do you want to save changes to this report before closing?"
		    end if
		    d.Explanation="If you don't save, your changes will be lost. "
		    
		    b=d.ShowModal                              //display the dialog
		    Select Case b                              //determine which button was pressed.
		    Case d.ActionButton
		      //user pressed Save
		      DesignSpace.SaveReport
		    Case d.AlternateActionButton
		      //user pressed Don't Save
		    Case d.CancelButton
		      //user pressed Cancel
		      Return true
		    End select
		    
		  else
		    
		  end if
		  
		End Function
	#tag EndEvent

	#tag Event
		Sub EnableMenuItems()
		  Dim SchemaIsLoaded As Boolean = DesignSpace.oDBWrapper <> nil
		  if SchemaIsLoaded then SchemaIsLoaded = DesignSpace.oDBWrapper.SchemaDict <> nil
		  
		  FileNewWindow.Enabled = True
		  FileConnect.Enabled = True
		  FileNew.Enabled = SchemaIsLoaded
		  FileOpen.Enabled = True
		  FileSave.Enabled = SchemaIsLoaded and DesignSpace.Scroller.Designer.undoQ.Ubound > -1
		  FileSaveAs.Enabled = SchemaIsLoaded
		  FilePageSetup.Enabled = SchemaIsLoaded
		  FilePrint.Enabled = SchemaIsLoaded and PreviewCC1.ctlViewer.Document <> nil
		  FileExport.Enabled = SchemaIsLoaded and PreviewCC1.ctlViewer.Document <> nil
		  
		  ReportDesign.Enabled = True
		  ReportPreview.Enabled = True
		  ReportRun.Enabled = SchemaIsLoaded
		  ReportUpdateSQL.Visible = false
		  ReportUpdateSQL.Enabled = false
		  ReportRelations.Enabled = SchemaIsLoaded
		  ReportBands.Enabled = SchemaIsLoaded
		  
		  WhereUniversalWhere.Enabled = SchemaIsLoaded
		  
		  ToolsCreateDatabase.Visible = true
		  ToolsAddTable.Visible = true
		  ToolsCreateDatabase.Enabled = true
		  ToolsAddTable.Enabled = true
		  ToolsSchema.Enabled = SchemaIsLoaded
		  ToolsStoreImage.Enabled = true
		  ToolsAddBodyAsView.Enabled = SchemaIsLoaded
		  ToolsHTMLPageLinks.Enabled = SchemaIsLoaded
		  ToolsPreferences.Enabled = true
		  ToolsRecoverLastReportRun.Enabled = true
		  
		  ViewTextBorders.Enabled = True
		  ViewTextBorders.Checked = DesignSpace.Scroller.Designer.ShowBoundaries
		  ViewInvisibleItems.Visible = false
		  ViewInvisibleItems.Enabled = false
		  ViewInvisibleItems.Checked = DesignSpace.Scroller.Designer.ShowInvisibleItems
		  
		  
		  if UBound(DesignSpace.Scroller.Designer.UndoQ) > -1 then
		    EditUndo.Enabled = true
		    EditUndo.Text = "Undo " + DesignSpace.Scroller.Designer.UndoQ(UBound(DesignSpace.Scroller.Designer.UndoQ)).Action
		  else
		    EditUndo.Text = "Can't Undo"
		    EditUndo.Enabled = false
		  end if
		  
		  if UBound(DesignSpace.Scroller.Designer.RedoQ) > -1 then
		    EditRedo.Enabled = true
		    EditRedo.Text = "Redo " + DesignSpace.Scroller.Designer.RedoQ(UBound(DesignSpace.Scroller.Designer.RedoQ)).Action
		  else
		    EditRedo.Text = "Can't Redo"
		    EditRedo.Enabled = false
		  end if
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Sub Open()
		  DesignSpace.Init
		  
		  me.listen array( "ReportRun","UpdateToolbar" )
		  
		  Dim myBounds As New REALbasic.Rect
		  
		  myBounds.Left = GetPref("winLeft")
		  myBounds.top = GetPref("winTop")
		  myBounds.Width = GetPref("winWidth")
		  myBounds.Height = GetPref("winHeight")
		  
		  if myBounds.Left <= 0 then myBounds.Left = screen(0).AvailableLeft
		  if myBounds.Top <= 0 then myBounds.top = screen(0).AvailableTop
		  if myBounds.Width <= 0 then myBounds.Width = min(1180,screen(0).AvailableWidth)
		  if myBounds.Height <= 0 then myBounds.Height = min(740, screen(0).AvailableHeight)
		  
		  self.TrueWindow.Bounds = myBounds
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resized()
		  #if TargetWin32 then
		    
		    ppView.top = 20
		    ppView.Left = 20
		    
		    ResizeMask.Visible = false
		    
		    ResizingWin = false
		    
		    ResizeBuffer = nil
		    
		  #endif
		End Sub
	#tag EndEvent

	#tag Event
		Sub Resizing()
		  #if TargetWin32 then
		    
		    ppView.Width = ResizeMask.Width
		    ppView.Height = ResizeMask.Height
		    
		    ResizeBuffer = new Picture(ResizeMask.Width, ResizeMask.Height)
		    
		    ppView.DrawInto ResizeBuffer.Graphics, 0, 0
		    
		    if ResizingWin = false then
		      
		      ResizingWin = true
		      
		      ResizeMask.Visible = true
		      
		      ppView.top = -5000
		      ppView.Left = -5000
		      
		    end if
		    
		    ResizeMask.Invalidate
		    
		    
		  #endif
		  
		  
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function EditRedo() As Boolean Handles EditRedo.Action
			HandleRedo
			
			
			Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function EditUndo() As Boolean Handles EditUndo.Action
			HandleUndo
			
			Return True
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ExportHTML() As Boolean Handles ExportHTML.Action
			HandleExportHTML
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ExportPDF() As Boolean Handles ExportPDF.Action
			HandleExportPDF
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileConnect() As Boolean Handles FileConnect.Action
			HandleConnect
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileNew() As Boolean Handles FileNew.Action
			HandleNew
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileNewWindow() As Boolean Handles FileNewWindow.Action
			HandleNewWindow
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileOpen() As Boolean Handles FileOpen.Action
			HandleOpen
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FilePageSetup() As Boolean Handles FilePageSetup.Action
			HandlePrintSetup
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FilePrint() As Boolean Handles FilePrint.Action
			HandlePrint
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileSave() As Boolean Handles FileSave.Action
			HandleSave
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function FileSaveAs() As Boolean Handles FileSaveAs.Action
			HandleSaveAs
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ReportBands() As Boolean Handles ReportBands.Action
			HandleBands
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ReportDesign() As Boolean Handles ReportDesign.Action
			HandleDesign
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ReportPreview() As Boolean Handles ReportPreview.Action
			HandlePreview
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ReportRelations() As Boolean Handles ReportRelations.Action
			HandleRelations
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ReportRun() As Boolean Handles ReportRun.Action
			HandleRun
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ReportUpdateSQL() As Boolean Handles ReportUpdateSQL.Action
			HandleUpdateSQL
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ToolsAddBodyAsView() As Boolean Handles ToolsAddBodyAsView.Action
			HandleAddBodyAsView
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ToolsAddTable() As Boolean Handles ToolsAddTable.Action
			HandleAddTable
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ToolsCreateDatabase() As Boolean Handles ToolsCreateDatabase.Action
			HandleCreateDB
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ToolsHTMLPageLinks() As Boolean Handles ToolsHTMLPageLinks.Action
			HandleHTMLLinks
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ToolsPreferences() As Boolean Handles ToolsPreferences.Action
			PreferencesWindow.ShowModal
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function toolsRecoverLastReportRun() As Boolean Handles toolsRecoverLastReportRun.Action
			HandleRecoverReport
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ToolsSchema() As Boolean Handles ToolsSchema.Action
			HandleSchema
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ToolsStoreImage() As Boolean Handles ToolsStoreImage.Action
			HandleStoreImage
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewInvisibleItems() As Boolean Handles ViewInvisibleItems.Action
			ViewInvisibleItems.Checked = not ViewInvisibleItems.Checked
			HandleInvisibleItems
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function ViewTextBorders() As Boolean Handles ViewTextBorders.Action
			ViewTextBorders.Checked = not ViewTextBorders.Checked
			
			HandleTextBorders
			
			Return True
			
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function WhereUniversalWhere() As Boolean Handles WhereUniversalWhere.Action
			HandleWhere
			Return True
			
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h21
		Private Sub HandleAddBodyAsView()
		  DesignSpace.Scroller.Designer.AddTemporaryView(DesignSpace.oDBWrapper)
		  DesignSpace.Scroller.LoadSchema
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleAddTable()
		  DesignSpace.Scroller.Designer.AddDBTable(DesignSpace.BuildReportJSON)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleBands()
		  DesignSpace.Scroller.Designer.EditBands
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleConnect()
		  if DesignSpace.Scroller.Designer.UndoQ.Ubound > -1 then
		    
		    Dim d as New MessageDialog                  //declare the MessageDialog object
		    Dim b as MessageDialogButton                //for handling the result
		    d.icon=MessageDialog.GraphicCaution         //display warning icon
		    d.ActionButton.Caption="Save"
		    d.CancelButton.Visible=True                 //show the Cancel button
		    d.AlternateActionButton.Visible=True        //show the "Don't Save" button
		    d.AlternateActionButton.Caption="Don't Save"
		    if DesignSpace.Scroller.Designer.ReportName <> "" then
		      d.Message="Do you want to save changes to " + DesignSpace.Scroller.Designer.ReportName + " before closing?"
		    else
		      d.Message="Do you want to save changes to this report before closing?"
		    end if
		    d.Explanation="If you don't save, your changes will be lost. "
		    
		    b=d.ShowModal                              //display the dialog
		    Select Case b                              //determine which button was pressed.
		    Case d.ActionButton
		      //user pressed Save
		      DesignSpace.SaveReport
		      ppView.Value = 0
		      NewConnection
		    Case d.AlternateActionButton
		      //user pressed Don't Save
		      ppView.Value = 0
		      NewConnection
		    Case d.CancelButton
		      //user pressed Cancel
		    End select
		    
		  else
		    
		    ppView.Value = 0
		    NewConnection
		    
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleCreateDB()
		  PAF_DatabaseKit.CreateSQLiteDatabase
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleDesign()
		  ppView.Value = 0
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleExportHTML()
		  //Find a place to put the outout html file
		  
		  Dim sReport As String = PAFInputWin.GetInput("Enter name for html report","Save","Cancel","")
		  
		  if sReport <> "Cancel" then
		    
		    Dim fDirectory as FolderItem = SpecialFolder.Desktop.Child(sReport)
		    
		    if fDirectory.Exists then
		      
		      MsgBox "Please choose a different name for your report"
		      
		    else
		      
		      fDirectory.CreateAsFolder
		      
		      if fDirectory <> nil then
		        
		        Dim iPageCount As Integer = PreviewCC1.ctlViewer.Document.PageCount - 1
		        dim f() as FolderItem
		        ReDim f(iPageCount)
		        for i as integer = 0 to iPageCount
		          f(i) = fDirectory.Child(sReport + str(i + 1) + ".html")
		        Next
		        
		        //Create a Document Object.
		        dim oDoc as BKS_Shorts.Document
		        oDoc = PreviewCC1.ctlViewer.Document
		        
		        if oDoc=nil then
		          return
		        end if
		        
		        //Create a page to hold everything
		        dim oPage as BKS_Shorts.Page
		        
		        for iPage as integer = 0 to f.Ubound
		          'dim oPage as BKS_Shorts.Page
		          oPage = oDoc.Page(iPage)
		          
		          dim oView as new BKS_Shorts.View
		          oView.ViewLeft = 0
		          oView.ViewTop = 0
		          oView.ViewWidth = oPage.Width
		          oView.ViewHeight = oPage.Height
		          oView.Scale = 1.0
		          
		          dim o as new BKS_Shorts.HTMLRenderer(f(iPage))
		          oPage.Render(o, oView)
		        next
		        
		        Do
		          
		          if Keyboard.AsyncKeyDown(&h35) then
		            MsgBox "Break"
		            exit
		          end if
		          
		        loop until fDirectory.Count = iPageCount + 1
		        
		        dim tIn As TextInputStream
		        Dim tOut As TextOutputStream
		        
		        Dim sHTML As String
		        
		        For i as integer = 0 to f.Ubound
		          tIn = TextInputStream.Open(f(i))
		          if tIn <> nil then
		            sHTML = tIn.ReadAll
		            tIn.Close
		            if i = 0 then sHTML = ReplaceAll(sHTML,"LINK_Prev","")
		            if i = f.Ubound then sHTML = ReplaceAll(sHTML,"LINK_Next","")
		            if i > 0 and i <= f.Ubound then
		              sHTML = replaceAll(sHTML,"LINK_Prev","<a href=" + chr(34) + sReport + str(i) + ".html" + chr(34) + ">Prev</a>")
		            end if
		            if i < f.Ubound then
		              sHTML = replaceAll(sHTML,"LINK_Next","<a href=" + chr(34) + sReport + str(i+2) + ".html" + chr(34) + ">Next</a>")
		            end if
		            tOut = TextOutputStream.Create(f(i))
		            if tOut <> nil then
		              tOut.Write sHTML
		              tOut.Close
		            end if
		          end if
		          
		        next
		        
		        //Launch it so the user can see it.
		        f(0).Launch
		        
		      end if
		    end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleExportPDF()
		  PreviewCC1.SaveAsPDF
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub HandleHTMLLinks()
		  DesignSpace.Scroller.Designer.AddHTMLLinks
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleInvisibleItems()
		  DesignSpace.Scroller.Designer.ShowInvisibleItems = ViewInvisibleItems.Checked
		  
		  DesignSpace.Invalidate(false)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleNew()
		  dim connType, sHost, sPort, sName, sUser As String
		  dim connString as string = DesignSpace.oDBWrapper.ConnectionString
		  ' connType = DesignSpace.oDBWrapper.type
		  ' sHost = DesignSpace.oDBWrapper.Host
		  ' sPort = Str(DesignSpace.oDBWrapper.Port)
		  ' sName = DesignSpace.oDBWrapper.DatabaseName
		  ' sUser = DesignSpace.oDBWrapper.UserName
		  Dim w as new DesignerWindow
		  w.Hide
		  w.NewConnection(connString)
		  'w.NewConnection(connType + "," + sHost + "," + sPort + "," + sName + "," + sUser + "," + DesignSpace.oDBWrapper.Password)
		  w.show
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleNewWindow()
		  Dim w As new DesignerWindow
		  
		  w.Show
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleOpen()
		  if DesignSpace.oDBWrapper = nil then
		    
		    DesignSpace.Init
		    DesignSpace.OpenReport
		    
		  else
		    
		    dim w As new DesignerWindow
		    
		    w.DesignSpace.Init
		    w.DesignSpace.OpenReport
		    
		    w.show
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlePreview()
		  ppView.Value = 1
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlePrint()
		  dim oDoc as BKS_Shorts.Document = PreviewCC1.ctlViewer.Document
		  if oDoc=nil or oDoc.PageCount=0 then
		    return
		  end if
		  
		  dim g as Graphics
		  dim oPageSetup as new PrinterSetup
		  
		  if DesignSpace.PrinterSetup <> nil then
		    
		    oPageSetup = DesignSpace.PrinterSetup
		    
		  end if
		  oPageSetup.MaxHorizontalResolution = 300
		  oPageSetup.MaxVerticalResolution = 300
		  if oPageSetup.PageSetupDialog then
		    g = OpenPrinterDialog(oPageSetup)
		  end if
		  if g=nil then
		    return
		  end if
		  
		  dim iPageWidth as integer = oPageSetup.PageWidth
		  dim iPageHeight as integer = oPageSetup.PageHeight
		  
		  dim iFirstPage as integer = g.FirstPage - 1
		  dim iLastPage as integer = Min(g.LastPage, oDoc.PageCount) - 1
		  
		  for iPage as integer = iFirstPage to iLastPage
		    dim oPage as BKS_Shorts.Page
		    oPage = oDoc.Page(iPage)
		    
		    dim dScale as double
		    dScale = Min(iPageWidth/oPage.Width, iPageHeight/oPage.Height)
		    
		    dim oView as new BKS_Shorts.View
		    oView.ViewLeft = oPageSetup.PageLeft
		    oView.ViewTop = oPageSetup.PageTop
		    oView.ViewWidth = iPageWidth
		    oView.ViewHeight = iPageHeight
		    oView.Scale = dScale
		    
		    dim o as new BKS_Shorts.GraphicsRenderer(g)
		    oPage.Render(o, oView)
		    if iPage<>iLastPage then
		      g.NextPage
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandlePrintSetup()
		  dim ps as PrinterSetup
		  ps = new PrinterSetup
		  ps.MaxHorizontalResolution = 300
		  ps.MaxVerticalResolution = 300
		  
		  if DesignSpace.PrinterSetup <> nil then ps.SetupString = DesignSpace.PrinterSetup.SetupString
		  
		  if ps.PageSetupDialog then
		    
		    DesignSpace.PrinterSetup = ps
		    
		    DesignSpace.ResizePage
		    
		  else
		    // Setup Cancelled
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleRecoverReport()
		  Dim bLoad As Boolean = True
		  
		  if DesignSpace.Scroller.Designer.UndoQ.Ubound > -1 then
		    
		    Dim d as New MessageDialog                  //declare the MessageDialog object
		    Dim b as MessageDialogButton                //for handling the result
		    d.icon=MessageDialog.GraphicCaution         //display warning icon
		    d.ActionButton.Caption="Save"
		    d.CancelButton.Visible=True                 //show the Cancel button
		    d.AlternateActionButton.Visible=True        //show the "Don't Save" button
		    d.AlternateActionButton.Caption="Don't Save"
		    if DesignSpace.Scroller.Designer.ReportName <> "" then
		      d.Message="Do you want to save changes to " + DesignSpace.Scroller.Designer.ReportName + " before closing?"
		    else
		      d.Message="Do you want to save changes to this report before closing?"
		    end if
		    d.Explanation="If you don't save, your changes will be lost. "
		    
		    b=d.ShowModal                              //display the dialog
		    Select Case b                              //determine which button was pressed.
		    Case d.ActionButton
		      //user pressed Save
		      DesignSpace.SaveReport
		      
		    Case d.AlternateActionButton
		      //user pressed Don't Save
		      
		    Case d.CancelButton
		      //user pressed Cancel
		      
		      bLoad = false
		      
		    End select
		    
		  end if
		  
		  if bLoad then
		    
		    ppView.Value = 0
		    DesignSpace.Init
		    
		    DesignSpace.SchemaFilter = nil
		    DesignSpace.Scroller.Designer.ReportPath = ""
		    DesignSpace.Scroller.Designer.ReportName = ""
		    DesignSpace.Scroller.Designer.InitialState = nil
		    
		    Dim f As FolderItem = SpecialFolder.ApplicationData.Child(kAppName).Child("LastReportRun.shorts_report")
		    
		    if f <> nil and f.Exists then
		      
		      DesignSpace.OpenReport(f)
		      
		      self.Title = "Shorts Designer (" + DesignSpace.oDBWrapper.type + ": " + DesignSpace.oDBWrapper.DatabaseName + ")"
		      
		      //Clear path and name to force save as
		      DesignSpace.Scroller.Designer.ReportPath = ""
		      DesignSpace.Scroller.Designer.ReportName = ""
		      
		      HandleSave
		      
		    else
		      
		      MsgBox "There is no cached report data to load"
		      
		    end if
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleRedo()
		  if UBound(DesignSpace.Scroller.Designer.RedoQ) > -1 then
		    
		    dim i as Integer
		    
		    dim u as New PAF_PrintKit.ReportUndo
		    u = DesignSpace.Scroller.Designer.RedoQ.Pop
		    
		    DesignSpace.Scroller.Designer.UndoAdd(u.Action)
		    
		    Redim DesignSpace.Scroller.Designer.Bands(-1)
		    
		    for i = 0 to u.Bands.Ubound
		      DesignSpace.Scroller.Designer.Bands.Append u.Bands(i).Clone
		    Next
		    
		    DesignSpace.Scroller.Designer.Invalidate(false)
		  end if
		  
		  pfDispatcher.send "RefreshPList"
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleRelations()
		  if DesignSpace.oDBWrapper <> nil then
		    
		    Dim arsTable() as String = PAF_PrintKit.ExtractReportTables(DesignSpace.Scroller.Designer.Bands)
		    
		    RelationsWin.AssignRelations(DesignSpace.oDBWrapper, arsTable)
		    
		  else
		    
		    MsgBox "You are not connected to a database"
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleRun()
		  ppView.Value = 1
		  DesignSpace.Scroller.Designer.UpdateSQL
		  
		  // Safety Net (save report state in event of crash user can recover work)
		  Dim f As FolderItem = SpecialFolder.ApplicationData.Child(kAppName).Child("LastReportRun.shorts_report")
		  
		  if f <> nil then
		    
		    Try
		      dim t as TextOutputStream = TextOutputStream.Create(f)
		      Try
		        t.Write DesignSpace.BuildReportJSON.ToString.DefineEncoding(Encodings.UTF8)
		      finally
		        t.Close
		        t = nil
		      end try
		    Catch e as IOException
		    end try
		    
		  end if
		  
		  // Now run the report
		  PreviewCC1.LoadReportJSON(DesignSpace.oDBWrapper,DesignSpace.BuildReportJSON(true))
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleSave()
		  if DesignSpace.oDBWrapper <> nil then
		    ppView.Value = 0
		    DesignSpace.SaveReport
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleSaveAs()
		  ppView.Value = 0
		  DesignSpace.SaveReportAs
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleSchema()
		  if DesignSpace.oDBWrapper <> nil then
		    
		    SchemaSetupWin.AssignSchema(DesignSpace.oDBWrapper)
		    
		  end if
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleStoreImage()
		  PAF_PrintKit.StoreImage
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleStyles()
		  ppView.Value = 0
		  // grab current styles
		  PAF_PrintKit.BuildStyles(DesignSpace.Scroller.Designer.Bands)
		  
		  StyleWin.ShowModal
		  
		  // update any changes (any deleted styles applied to items will revert to default style)
		  DesignSpace.Scroller.Designer.UpdateStyles
		  
		  DesignSpace.Scroller.Designer.Invalidate(false)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleTextBorders()
		  
		  DesignSpace.Scroller.Designer.ShowBoundaries = ViewTextBorders.Checked
		  
		  DesignSpace.Invalidate(false)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleUndo()
		  if UBound(DesignSpace.Scroller.Designer.UndoQ) > -1 then
		    
		    dim i as Integer
		    
		    dim u as New PAF_PrintKit.ReportUndo
		    u = DesignSpace.Scroller.Designer.UndoQ.Pop
		    
		    DesignSpace.Scroller.Designer.RedoAdd(u.Action)
		    
		    Redim DesignSpace.Scroller.Designer.Bands(-1)
		    
		    for i = 0 to u.Bands.Ubound
		      DesignSpace.Scroller.Designer.Bands.Append u.Bands(i).clone
		    Next
		    
		    DesignSpace.Scroller.Designer.Invalidate(false)
		    
		  end if
		  
		  pfDispatcher.send "RefreshPList"
		  
		  
		  
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleUpdateSQL()
		  ppView.Value = 0
		  DesignSpace.Scroller.Designer.UpdateSQL
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub HandleWhere()
		  if DesignSpace.oDBWrapper <> nil then
		    
		    Dim aroNewConditions() As PAFQueryCondition
		    
		    Dim arsfields() as String = PAF_PrintKit.ExtractReportFields(DesignSpace.Scroller.Designer.Bands)
		    
		    aroNewConditions = WhereWin.Setup(DesignSpace.oDBWrapper, DesignSpace.Scroller.Designer.WhereConditions,arsfields)
		    
		    if aroNewConditions <> nil then
		      
		      DesignSpace.Scroller.Designer.WhereConditions = aroNewConditions
		      
		    end if
		    
		  else
		    MsgBox "You are not connected to a database."
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub NewConnection(optional connectString as String)
		  DesignSpace.NewConnection(connectString)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub notificationReceived(key as string, value as variant, sender as variant)
		  // Part of the pfReceiver interface.
		  
		  select case key
		    
		  case "ReportRun"
		    
		    if DesignSpace.oDBWrapper <> nil and PreviewCC1.ctlViewer.Document <> nil then
		      SetToolbarItem("SaveHTML",true)
		      SetToolbarItem("SavePDF",true)
		      SetToolbarItem("Print",true)
		    else
		      SetToolbarItem("SaveHTML",false)
		      SetToolbarItem("SavePDF",false)
		      SetToolbarItem("Print",false)
		    end if
		    
		  case "UpdateToolbar"
		    
		    UpdateToolbar
		    
		  end select
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetToolbarItem(sName As String, bState As Boolean)
		  for i as integer = 0 to MainToolbar1.Count
		    if MainToolbar1.item(i).Name = sName then
		      MainToolbar1.item(i).Enabled = bState
		      exit
		    end if
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub UpdateToolbar()
		  if MainToolbar1 <> nil then
		    
		    SetToolbarItem("NewReport",DesignSpace.oDBWrapper <> nil)
		    SetToolbarItem("Run",DesignSpace.oDBWrapper <> nil)
		    SetToolbarItem("Relations",DesignSpace.oDBWrapper <> nil)
		    SetToolbarItem("Bands",DesignSpace.oDBWrapper <> nil)
		    SetToolbarItem("Setup",DesignSpace.oDBWrapper <> nil)
		    if DesignSpace.oDBWrapper <> nil and PreviewCC1.ctlViewer.Document <> nil then
		      SetToolbarItem("SaveHTML",true)
		      SetToolbarItem("SavePDF",true)
		      SetToolbarItem("Print",true)
		    else
		      SetToolbarItem("SaveHTML",false)
		      SetToolbarItem("SavePDF",false)
		      SetToolbarItem("Print",False)
		    end if
		    
		    SetToolbarItem("SaveReport",DesignSpace.oDBWrapper <> nil and DesignSpace.Scroller.Designer.undoQ.Ubound > -1)
		    self.ContentsChanged = DesignSpace.oDBWrapper <> nil and DesignSpace.Scroller.Designer.undoQ.Ubound > -1
		    
		  end if
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private ResizeBuffer As Picture
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ResizingWin As Boolean = false
	#tag EndProperty


#tag EndWindowCode

#tag Events DesignSpace
	#tag Event
		Sub LoadStatusUpdate(msg As String)
		  lblLoadStatus.Text = msg
		  Placard1.Visible = msg <> ""
		  Placard1.Refresh
		End Sub
	#tag EndEvent
	#tag Event
		Function TableViewAddCheck(TableViewName as String) As boolean
		  ' if TableViewName.left(2) = "v_" then
		  ' return false
		  ' else
		  ' return true
		  ' end
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events MainToolbar1
	#tag Event
		Sub Action(item As ToolItem)
		  ' sets the Preview.ToolbarItem which is detected in mousedown
		  if item.Name = "Connect" then
		    
		    HandleConnect
		    
		  elseif item.name = "Preview" then
		    
		    HandlePreview
		    
		  elseif item.name = "Run" then
		    
		    HandleRun
		    
		  elseif item.name = "Design" then
		    
		    HandleDesign
		    
		  elseif item.Name = "NewReport" then
		    
		    HandleNew
		    
		  elseif item.Name = "OpenReport" then
		    
		    HandleOpen
		    
		  elseif item.name = "SaveReport" then
		    
		    HandleSave
		    
		  elseif item.name = "Styles" then
		    
		    HandleStyles
		    
		  elseif item.Name = "Bands" then
		    
		    HandleBands
		    
		  elseif item.name = "relations" then
		    
		    HandleRelations
		    
		  elseif item.name = "UpdateSQL" then
		    
		    HandleUpdateSQL
		    
		  elseif item.Name = "SavePDF" then
		    
		    HandleExportPDF
		    
		  elseif item.name = "SaveHTML" then
		    
		    HandleExportHTML
		    
		  elseif item.Name = "Setup" then
		    
		    HandlePrintSetup
		    
		  elseif item.name = "Print" then
		    
		    HandlePrint
		    
		  end if
		  
		  
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ResizeMask
	#tag Event
		Sub Paint(g As Graphics, areas() As REALbasic.Rect)
		  if ResizeBuffer <> nil then
		    g.ForeColor = &cF0F0F0
		    g.FillRect(0,0,g.Width,g.Height)
		    g.DrawPicture(ResizeBuffer, 0,0)
		  end if
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
