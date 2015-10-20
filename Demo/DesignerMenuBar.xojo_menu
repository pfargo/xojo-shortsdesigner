#tag Menu
Begin Menu DesignerMenuBar
   Begin MenuItem FileMenu
      SpecialMenu = 0
      Text = "&File"
      Index = -2147483648
      AutoEnable = True
      Visible = True
      Begin MenuItem FileNewWindow
         SpecialMenu = 0
         Text = "New Window"
         Index = -2147483648
         ShortcutKey = "N"
         Shortcut = "Cmd+Shift+N"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem FileConnect
         SpecialMenu = 0
         Text = "Connect..."
         Index = -2147483648
         ShortcutKey = "C"
         Shortcut = "Cmd+Shift+C"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem FileNew
         SpecialMenu = 0
         Text = "New"
         Index = -2147483648
         ShortcutKey = "N"
         Shortcut = "Cmd+N"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem FileOpen
         SpecialMenu = 0
         Text = "Open..."
         Index = -2147483648
         ShortcutKey = "O"
         Shortcut = "Cmd+O"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem UntitledSeparator
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem FileSave
         SpecialMenu = 0
         Text = "Save"
         Index = -2147483648
         ShortcutKey = "S"
         Shortcut = "Cmd+S"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem FileSaveAs
         SpecialMenu = 0
         Text = "Save As..."
         Index = -2147483648
         ShortcutKey = "S"
         Shortcut = "Cmd+Shift+S"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem FileExport
         SpecialMenu = 0
         Text = "Export"
         Index = -2147483648
         AutoEnable = True
         SubMenu = True
         Visible = True
         Begin MenuItem ExportHTML
            SpecialMenu = 0
            Text = "HTML..."
            Index = -2147483648
            AutoEnable = True
            Visible = True
         End
         Begin MenuItem ExportPDF
            SpecialMenu = 0
            Text = "PDF..."
            Index = -2147483648
            AutoEnable = True
            Visible = True
         End
      End
      Begin MenuItem UntitledSeparator0
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem FilePrint
         SpecialMenu = 0
         Text = "Print..."
         Index = -2147483648
         ShortcutKey = "P"
         Shortcut = "Cmd+P"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem FilePageSetup
         SpecialMenu = 0
         Text = "Page Setup..."
         Index = -2147483648
         ShortcutKey = "P"
         Shortcut = "Cmd+Shift+P"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem UntitledSeparator1
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin QuitMenuItem FileQuit
         SpecialMenu = 0
         Text = "#App.kFileQuit"
         Index = -2147483648
         ShortcutKey = "#App.kFileQuitShortcut"
         Shortcut = "#App.kFileQuitShortcut"
         AutoEnable = True
         Visible = True
      End
   End
   Begin MenuItem EditMenu
      SpecialMenu = 0
      Text = "&Edit"
      Index = -2147483648
      AutoEnable = True
      Visible = True
      Begin MenuItem EditUndo
         SpecialMenu = 0
         Text = "&Undo"
         Index = -2147483648
         ShortcutKey = "Z"
         Shortcut = "Cmd+Z"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditRedo
         SpecialMenu = 0
         Text = "Redo"
         Index = -2147483648
         ShortcutKey = "Z"
         Shortcut = "Cmd+Shift+Z"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem UntitledMenu1
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditCut
         SpecialMenu = 0
         Text = "Cu&t"
         Index = -2147483648
         ShortcutKey = "X"
         Shortcut = "Cmd+X"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditCopy
         SpecialMenu = 0
         Text = "&Copy"
         Index = -2147483648
         ShortcutKey = "C"
         Shortcut = "Cmd+C"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditPaste
         SpecialMenu = 0
         Text = "&Paste"
         Index = -2147483648
         ShortcutKey = "V"
         Shortcut = "Cmd+V"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditClear
         SpecialMenu = 0
         Text = "#App.kEditClear"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem UntitledMenu0
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem EditSelectAll
         SpecialMenu = 0
         Text = "Select &All"
         Index = -2147483648
         ShortcutKey = "A"
         Shortcut = "Cmd+A"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
   End
   Begin MenuItem ViewMenu
      SpecialMenu = 0
      Text = "View"
      Index = -2147483648
      AutoEnable = True
      Visible = True
      Begin MenuItem ViewTextBorders
         SpecialMenu = 0
         Text = "Text Borders"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ViewInvisibleItems
         SpecialMenu = 0
         Text = "Invisible Items"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
   End
   Begin MenuItem ReportMenu
      SpecialMenu = 0
      Text = "Report"
      Index = -2147483648
      AutoEnable = True
      Visible = True
      Begin MenuItem ReportDesign
         SpecialMenu = 0
         Text = "Design"
         Index = -2147483648
         ShortcutKey = "D"
         Shortcut = "Cmd+Shift+D"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ReportPreview
         SpecialMenu = 0
         Text = "Preview"
         Index = -2147483648
         ShortcutKey = "U"
         Shortcut = "Cmd+Shift+U"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ReportRun
         SpecialMenu = 0
         Text = "Run"
         Index = -2147483648
         ShortcutKey = "R"
         Shortcut = "Cmd+R"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem UntitledSeparator2
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ReportUpdateSQL
         SpecialMenu = 0
         Text = "Update SQL"
         Index = -2147483648
         ShortcutKey = "L"
         Shortcut = "Cmd+L"
         MenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ReportRelations
         SpecialMenu = 0
         Text = "Relations..."
         Index = -2147483648
         ShortcutKey = "R"
         Shortcut = "Cmd+Shift+R"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ReportBands
         SpecialMenu = 0
         Text = "Bands..."
         Index = -2147483648
         ShortcutKey = "B"
         Shortcut = "Cmd+Shift+B"
         MenuModifier = True
         AltMenuModifier = True
         AutoEnable = True
         Visible = True
      End
   End
   Begin MenuItem WhereMenu
      SpecialMenu = 0
      Text = "Where"
      Index = -2147483648
      AutoEnable = True
      Visible = True
      Begin MenuItem WhereUniversalWhere
         SpecialMenu = 0
         Text = "Universal Where..."
         Index = -2147483648
         ShortcutKey = "W"
         Shortcut = "Cmd+Shift+Option+Control+Alt+W"
         MenuModifier = True
         AltMenuModifier = True
         MacOptionKey = True
         MacControlKey = True
         PCAltKey = True
         AutoEnable = True
         Visible = True
      End
   End
   Begin MenuItem ToolsMenu
      SpecialMenu = 0
      Text = "Tools"
      Index = -2147483648
      AutoEnable = True
      Visible = True
      Begin MenuItem ToolsStoreImage
         SpecialMenu = 0
         Text = "StoreImage..."
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ToolsSchema
         SpecialMenu = 0
         Text = "Schema..."
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ToolsAddBodyAsView
         SpecialMenu = 0
         Text = "Add Body As View..."
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ToolsHTMLPageLinks
         SpecialMenu = 0
         Text = "HTML Page Links"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ToolsCreateDatabase
         SpecialMenu = 0
         Text = "Create Database"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ToolsAddTable
         SpecialMenu = 0
         Text = "Add Table"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem UntitledSeparator4
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem ToolsRecoverLastReportRun
         SpecialMenu = 0
         Text = "Recover Last Report Run"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin MenuItem UntitledSeparator3
         SpecialMenu = 0
         Text = "-"
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
      Begin PrefsMenuItem ToolsPreferences
         SpecialMenu = 0
         Text = "Preferences..."
         Index = -2147483648
         AutoEnable = True
         Visible = True
      End
   End
   Begin MenuItem HelpMenu
      SpecialMenu = 0
      Text = "Help"
      Index = -2147483648
      AutoEnable = True
      Visible = True
   End
End
#tag EndMenu
