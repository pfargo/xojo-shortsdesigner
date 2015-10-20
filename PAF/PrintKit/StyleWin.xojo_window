#tag Window
Begin Window StyleWin
   BackColor       =   &cFFFFFF00
   Backdrop        =   0
   CloseButton     =   False
   Compatibility   =   ""
   Composite       =   False
   Frame           =   1
   FullScreen      =   False
   FullScreenButton=   False
   HasBackColor    =   False
   Height          =   505
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
   Placement       =   0
   Resizeable      =   False
   Title           =   "Style"
   Visible         =   True
   Width           =   465
   Begin TextField tfName
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
      Italic          =   False
      Left            =   80
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
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   53
      Underline       =   False
      UseFocusRing    =   True
      Visible         =   True
      Width           =   283
   End
   Begin Label lblLabel
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   0
      InitialParent   =   ""
      Italic          =   False
      Left            =   28
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
      Text            =   "Name:"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   55
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   40
   End
   Begin Label lblLabel
      AutoDeactivate  =   True
      Bold            =   False
      DataField       =   ""
      DataSource      =   ""
      Enabled         =   True
      Height          =   20
      HelpTag         =   ""
      Index           =   16
      InitialParent   =   ""
      Italic          =   False
      Left            =   28
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   14
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Styles:"
      TextAlign       =   2
      TextColor       =   &c00000000
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   21
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   40
   End
   Begin PopupMenu pmStyles
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
      Left            =   80
      ListIndex       =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Scope           =   0
      TabIndex        =   15
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   20
      Underline       =   False
      Visible         =   True
      Width           =   283
   End
   Begin PushButton pbDone
      AutoDeactivate  =   True
      Bold            =   False
      ButtonStyle     =   "0"
      Cancel          =   False
      Caption         =   "Done"
      Default         =   True
      Enabled         =   True
      Height          =   22
      HelpTag         =   ""
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   365
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
      Top             =   463
      Underline       =   False
      Visible         =   True
      Width           =   80
   End
   Begin TabPanel TabPanel1
      AutoDeactivate  =   True
      Bold            =   False
      Enabled         =   True
      Height          =   364
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
      Panels          =   ""
      Scope           =   0
      SmallTabs       =   False
      TabDefinition   =   "Text\rShapes"
      TabIndex        =   35
      TabPanelIndex   =   0
      TabStop         =   True
      TextFont        =   "System"
      TextSize        =   0.0
      TextUnit        =   0
      Top             =   87
      Underline       =   False
      Value           =   1
      Visible         =   True
      Width           =   425
      Begin Label lblLabel
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   2
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   47
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   0
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Text Color:"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   256
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   71
      End
      Begin Label lblLabel
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   18
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   285
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Fill Color:"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   256
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   71
      End
      Begin PAF_PrintKit.ColorCanvas cvFillColorText
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         cColor          =   &c00000000
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   32
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Left            =   368
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   244
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   32
      End
      Begin Label lblLabel
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   14
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   40
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   3
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Alignment:"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   180
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   71
      End
      Begin PopupMenu pmAlignment
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         InitialValue    =   ""
         Italic          =   False
         Left            =   117
         ListIndex       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   4
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   179
         Underline       =   False
         Visible         =   True
         Width           =   101
      End
      Begin Label lblLabel
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   10
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   281
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   5
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Size:"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   180
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   56
      End
      Begin Label lblLabel
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   12
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   65
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   6
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   "Font:"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   149
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   40
      End
      Begin PAF_PrintKit.ColorCanvas cvTextColor
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         cColor          =   &c00000000
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   32
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Left            =   139
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   7
         TabPanelIndex   =   1
         TabStop         =   True
         Top             =   244
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   32
      End
      Begin TextField tfSize
         AcceptTabs      =   False
         Alignment       =   3
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
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   349
         LimitText       =   3
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   "###.0"
         Password        =   False
         ReadOnly        =   False
         Scope           =   0
         TabIndex        =   8
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   180
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   51
      End
      Begin CheckBox cbUnderline
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Underline"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   313
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   9
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   212
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   100
      End
      Begin CheckBox cbItalic
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Italic"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   214
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   10
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   212
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   73
      End
      Begin CheckBox cbBold
         AutoDeactivate  =   True
         Bold            =   False
         Caption         =   "Bold"
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   117
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         State           =   0
         TabIndex        =   11
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   212
         Underline       =   False
         Value           =   False
         Visible         =   True
         Width           =   80
      End
      Begin PopupMenu pmFonts
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         InitialValue    =   ""
         Italic          =   False
         Left            =   117
         ListIndex       =   0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   12
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   148
         Underline       =   False
         Visible         =   True
         Width           =   283
      End
      Begin TextArea taSample
         AcceptTabs      =   False
         Alignment       =   0
         AutoDeactivate  =   True
         AutomaticallyCheckSpelling=   True
         BackColor       =   &cFFFFFF00
         Bold            =   False
         Border          =   True
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Format          =   ""
         Height          =   102
         HelpTag         =   ""
         HideSelection   =   True
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   117
         LimitText       =   0
         LineHeight      =   0.0
         LineSpacing     =   1.0
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Mask            =   ""
         Multiline       =   True
         ReadOnly        =   True
         Scope           =   0
         ScrollbarHorizontal=   False
         ScrollbarVertical=   True
         Styled          =   True
         TabIndex        =   13
         TabPanelIndex   =   1
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   288
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   283
      End
      Begin PushButton pbSaveText
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Save"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   323
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   14
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   403
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin PushButton pbDeleteText
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
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   117
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   15
         TabPanelIndex   =   1
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   402
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin TextField tfCornerHeight
         AcceptTabs      =   False
         Alignment       =   3
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
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   342
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
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   241
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   51
      End
      Begin Label lblLabel
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   4
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   232
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   1
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "Corner Height:"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   241
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   98
      End
      Begin TextField tfCornerWidth
         AcceptTabs      =   False
         Alignment       =   3
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
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   147
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
         TabIndex        =   2
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   241
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   51
      End
      Begin Label lblLabel
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   8
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   40
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   3
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "Corner Width:"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   241
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   95
      End
      Begin TextField tfLineWidth
         AcceptTabs      =   False
         Alignment       =   3
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
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   147
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
         TabIndex        =   4
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   ""
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   207
         Underline       =   False
         UseFocusRing    =   True
         Visible         =   True
         Width           =   51
      End
      Begin Label lblLabel
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   6
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   60
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   5
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "Line Width:"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   208
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   75
      End
      Begin Label lblLabel
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   20
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   74
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   6
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "Line Color:"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   159
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   71
      End
      Begin PAF_PrintKit.ColorCanvas cvLineColor
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         cColor          =   &c00000000
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   32
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Left            =   166
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   7
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   147
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   32
      End
      Begin PushButton pbSaveShape
         AutoDeactivate  =   True
         Bold            =   False
         ButtonStyle     =   "0"
         Cancel          =   False
         Caption         =   "Save"
         Default         =   False
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   313
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   8
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   410
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin PushButton pbDeleteShape
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
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   107
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Scope           =   0
         TabIndex        =   9
         TabPanelIndex   =   2
         TabStop         =   True
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   409
         Underline       =   False
         Visible         =   True
         Width           =   80
      End
      Begin PAF_PrintKit.ColorCanvas cvFillColorShape
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         cColor          =   &c00000000
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   32
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Left            =   361
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   11
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   147
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   32
      End
      Begin Label lblLabel
         AutoDeactivate  =   True
         Bold            =   False
         DataField       =   ""
         DataSource      =   ""
         Enabled         =   True
         Height          =   20
         HelpTag         =   ""
         Index           =   22
         InitialParent   =   "TabPanel1"
         Italic          =   False
         Left            =   278
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   False
         LockTop         =   True
         Multiline       =   False
         Scope           =   0
         Selectable      =   False
         TabIndex        =   12
         TabPanelIndex   =   2
         TabStop         =   True
         Text            =   "Fill Color:"
         TextAlign       =   2
         TextColor       =   &c00000000
         TextFont        =   "System"
         TextSize        =   0.0
         TextUnit        =   0
         Top             =   159
         Transparent     =   False
         Underline       =   False
         Visible         =   True
         Width           =   71
      End
      Begin PAF_PrintKit.ShapeCanvas cvShapeSample
         AcceptFocus     =   False
         AcceptTabs      =   False
         AutoDeactivate  =   True
         Backdrop        =   0
         DoubleBuffer    =   False
         Enabled         =   True
         EraseBackground =   True
         Height          =   100
         HelpTag         =   ""
         Index           =   -2147483648
         InitialParent   =   "TabPanel1"
         Left            =   183
         LockBottom      =   False
         LockedInPosition=   False
         LockLeft        =   False
         LockRight       =   False
         LockTop         =   False
         Scope           =   0
         TabIndex        =   13
         TabPanelIndex   =   2
         TabStop         =   True
         Top             =   286
         Transparent     =   True
         UseFocusRing    =   True
         Visible         =   True
         Width           =   100
      End
   End
End
#tag EndWindow

#tag WindowCode
	#tag Event
		Sub Open()
		  LoadStyleMenu
		  
		  pmStyles.SetPMText = "DefaultStyle"
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub ClearAll()
		  tfName.Text = ""
		  tfSize.Text = "12"
		  pmAlignment.SetPMText = "Left"
		  pmFonts.ListIndex = -1
		  cbBold.Value = False
		  cbItalic.Value = False
		  cbUnderline.Value = False
		  tfLineWidth.Text = "1.0"
		  tfCornerWidth.Text = "0.0"
		  tfCornerHeight.Text = "0.0"
		  cvTextColor.cColor = &c00000000
		  cvTextColor.Invalidate
		  cvFillColorText.cColor = &cFFFFFF00
		  cvFillColorText.Invalidate
		  cvFillColorShape.cColor = &cFFFFFF00
		  cvFillColorShape.Invalidate
		  cvLineColor.cColor = &c00000000
		  cvLineColor.Invalidate
		  
		  taSample.BackColor = &cFFFFFF00
		  taSample.Text = ""
		  
		  cvShapeSample.oSample = nil
		  cvShapeSample.Invalidate
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadStyle(EditStyle As PAF_PrintKit.PrintStyle)
		  tfName.Text = EditStyle.name
		  tfSize.Text = Format(EditStyle.TextSize,"###")
		  pmAlignment.SetPMText = EditStyle.TextAlign
		  pmFonts.SetPMText = EditStyle.TextFont
		  cbBold.Value = EditStyle.Bold
		  cbItalic.Value = EditStyle.Italic
		  cbUnderline.Value = EditStyle.Underline
		  tfLineWidth.Text = Format(EditStyle.LineWidth,"##.0")
		  tfCornerWidth.Text = Format(EditStyle.CornerWidth,"##.0")
		  tfCornerHeight.Text = Format(EditStyle.CornerHeight,"##.0")
		  cvTextColor.cColor = EditStyle.TextColor
		  cvTextColor.Invalidate
		  cvFillColorText.cColor = EditStyle.FillColor
		  cvFillColorText.Invalidate
		  cvFillColorShape.cColor = EditStyle.FillColor
		  cvFillColorShape.Invalidate
		  cvLineColor.cColor = EditStyle.LineColor
		  cvLineColor.Invalidate
		  
		  if EditStyle.Type = "Shape" then
		    TabPanel1.Value = 1
		  else
		    TabPanel1.Value = 0
		  end if
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub LoadStyleMenu()
		  if DictStyles = nil then
		    DictStyles = new Dictionary
		  end if
		  
		  pmStyles.DeleteAllRows
		  
		  dim oKeys() as String
		  dim oStyles() as PAF_PrintKit.PrintStyle
		  
		  For Each key as Variant In DictStyles.Keys
		    
		    oKeys.Append key.StringValue
		    oStyles.Append DictStyles.Value(key.StringValue)
		    
		  next
		  
		  oKeys.SortWith oStyles
		  
		  For i as integer = 0 to oStyles.Ubound
		    
		    pmStyles.AddRow ReplaceAll(oKeys(i),"&","&&")
		    pmStyles.RowTag(pmStyles.ListCount - 1) = oStyles(i)
		    
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub UpdateSample()
		  // update text tab
		  taSample.TextFont = pmFonts.Text
		  taSample.TextSize = val(tfSize.Text)
		  taSample.Bold = cbBold.Value
		  taSample.Italic = cbItalic.Value
		  taSample.Underline = cbUnderline.Value
		  taSample.TextColor = cvTextColor.cColor
		  taSample.BackColor = cvFillColorText.cColor
		  
		  if pmAlignment.Text = "Left" then
		    taSample.Alignment = TextArea.AlignLeft
		  elseif pmAlignment.Text = "Right" then
		    taSample.Alignment = TextArea.AlignRight
		  else
		    taSample.Alignment = TextArea.AlignCenter
		  end if
		  
		  taSample.Text = kSample
		  
		  // update shape tab
		  
		  Dim oShape As new RoundRectShape
		  
		  oShape.Width = cvShapeSample.Width - oShape.BorderWidth * 4
		  oShape.Height = cvShapeSample.Height - oShape.BorderWidth * 4
		  oShape.Border = 100
		  oShape.FillColor = cvFillColorShape.cColor
		  oShape.BorderColor = cvLineColor.cColor
		  oShape.BorderWidth = val(tfLineWidth.Text)
		  oShape.CornerWidth = val(tfCornerWidth.Text)
		  oShape.CornerHeight = val(tfCornerHeight.Text)
		  
		  cvShapeSample.oSample = oShape
		  cvShapeSample.Refresh
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		Mode As String
	#tag EndProperty


	#tag Constant, Name = kSample, Type = String, Dynamic = False, Default = \"The quick brown fox jumps over the lazy dog.", Scope = Public
	#tag EndConstant


#tag EndWindowCode

#tag Events pmStyles
	#tag Event
		Sub Change()
		  if me.Text <> "" then
		    
		    LoadStyle(me.RowTag(me.ListIndex))
		    
		    if me.Text <> "DefaultStyle" then
		      
		      pbDeleteText.Enabled = true
		      pbDeleteShape.Enabled = true
		      
		    end if
		    
		  else
		    
		    pbDeleteText.Enabled = false
		    pbDeleteShape.Enabled = false
		    
		  end if
		  
		  UpdateSample
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbDone
	#tag Event
		Sub Action()
		  self.Close
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cvFillColorText
	#tag Event
		Sub Open()
		  me.cColor = &cFFFFFF00
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(x as integer, y as Integer) As boolean
		  UpdateSample
		  
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events pmAlignment
	#tag Event
		Sub Open()
		  me.AddRow "Left"
		  me.AddRow "Center"
		  me.AddRow "Right"
		  
		  me.ListIndex = 0
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  UpdateSample
		  
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cvTextColor
	#tag Event
		Sub Open()
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(x as integer, y as Integer) As boolean
		  UpdateSample
		  
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events tfSize
	#tag Event
		Sub TextChange()
		  UpdateSample
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cbUnderline
	#tag Event
		Sub Action()
		  UpdateSample
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cbItalic
	#tag Event
		Sub Action()
		  UpdateSample
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cbBold
	#tag Event
		Sub Action()
		  UpdateSample
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pmFonts
	#tag Event
		Sub Open()
		  dim nFonts as Integer
		  nFonts=FontCount-1
		  //build the font menu
		  For i as Integer=0 to nFonts
		    me.AddRow Font(i)
		  Next i
		End Sub
	#tag EndEvent
	#tag Event
		Sub Change()
		  UpdateSample
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbSaveText
	#tag Event
		Sub Action()
		  dim oStyle as New PAF_PrintKit.PrintStyle
		  
		  oStyle.name = tfName.Text
		  oStyle.TextFont = pmFonts.Text
		  oStyle.Bold = cbBold.Value
		  oStyle.Italic = cbItalic.Value
		  oStyle.Underline = cbUnderline.Value
		  oStyle.TextSize = val(tfSize.Text)
		  oStyle.TextAlign = pmAlignment.Text
		  oStyle.TextColor = cvTextColor.cColor
		  oStyle.FillColor = cvFillColorText.cColor
		  oStyle.LineColor = cvLineColor.cColor
		  oStyle.LineWidth = val(tfLineWidth.Text)
		  oStyle.CornerWidth = val(tfCornerWidth.Text)
		  oStyle.CornerHeight = val(tfCornerHeight.Text)
		  
		  oStyle.Type = "Text"
		  
		  
		  DictStyles.Value(oStyle.name) = oStyle
		  
		  LoadStyleMenu
		  
		  ClearAll
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbDeleteText
	#tag Event
		Sub Action()
		  if pmStyles.Text = "DefaultStyle" then
		    
		    MsgBox "You can not delete the default style"
		    
		  else
		    
		    
		    dim d as New MessageDialog //declare the MessageDialog object
		    dim b as MessageDialogButton //for handling the result
		    d.icon = MessageDialog.GraphicCaution //display ? icon
		    d.ActionButton.Caption = "Delete"
		    d.CancelButton.Visible = True //show the Cancel button
		    d.AlternateActionButton.Visible = False //show the "Don't Save" button
		    d.AlternateActionButton.Caption = "No"
		    d.Message = "Are you sure you want to delete this style"
		    d.Explanation = "Any report items using it will convert to the default style"
		    
		    b = d.ShowModal //display the dialog
		    Select Case b //determine which button was pressed.
		    Case d.ActionButton
		      
		      if DictStyles.HasKey(pmStyles.Text) then
		        DictStyles.Remove(pmStyles.Text)
		        pmStyles.RemoveRow(pmStyles.ListIndex)
		      end if
		      
		      pmStyles.SetPMText = "DefaultStyle"
		      
		    Case d.AlternateActionButton
		      
		    Case d.CancelButton
		      //user pressed Cancel
		    End select
		    
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events tfCornerHeight
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  static allowedKeys() as string = array("0","1","2","3","4","5","6","7","8","9",".")
		  
		  if allowedKeys.IndexOf(key) <> -1 then
		    
		    Return false
		    
		  else
		    
		    Return true
		    
		  end if
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events tfCornerWidth
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  static allowedKeys() as string = array("0","1","2","3","4","5","6","7","8","9",".")
		  
		  if allowedKeys.IndexOf(key) <> -1 then
		    
		    Return false
		    
		  else
		    
		    Return true
		    
		  end if
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events tfLineWidth
	#tag Event
		Sub TextChange()
		  UpdateSample
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function KeyDown(Key As String) As Boolean
		  static allowedKeys() as string = array("0","1","2","3","4","5","6","7","8","9",".")
		  
		  if allowedKeys.IndexOf(key) <> -1 then
		    
		    Return false
		    
		  else
		    
		    Return true
		    
		  end if
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events cvLineColor
	#tag Event
		Sub Open()
		  
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(x as integer, y as Integer) As boolean
		  UpdateSample
		  
		  
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events pbSaveShape
	#tag Event
		Sub Action()
		  dim oStyle as New PAF_PrintKit.PrintStyle
		  
		  oStyle.name = tfName.Text
		  oStyle.TextFont = pmFonts.Text
		  oStyle.Bold = cbBold.Value
		  oStyle.Italic = cbItalic.Value
		  oStyle.Underline = cbUnderline.Value
		  oStyle.TextSize = val(tfSize.Text)
		  oStyle.TextAlign = pmAlignment.Text
		  oStyle.TextColor = cvTextColor.cColor
		  oStyle.FillColor = cvFillColorShape.cColor
		  oStyle.LineColor = cvLineColor.cColor
		  oStyle.LineWidth = val(tfLineWidth.Text)
		  oStyle.CornerWidth = val(tfCornerWidth.Text)
		  oStyle.CornerHeight = val(tfCornerHeight.Text)
		  
		  oStyle.Type = "Shape"
		  
		  DictStyles.Value(oStyle.name) = oStyle
		  
		  LoadStyleMenu
		  
		  ClearAll
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events pbDeleteShape
	#tag Event
		Sub Action()
		  if pmStyles.Text = "DefaultStyle" then
		    
		    MsgBox "You can not delete the default style"
		    
		  else
		    
		    
		    dim d as New MessageDialog //declare the MessageDialog object
		    dim b as MessageDialogButton //for handling the result
		    d.icon = MessageDialog.GraphicCaution //display ? icon
		    d.ActionButton.Caption = "Delete"
		    d.CancelButton.Visible = True //show the Cancel button
		    d.AlternateActionButton.Visible = False //show the "Don't Save" button
		    d.AlternateActionButton.Caption = "No"
		    d.Message = "Are you sure you want to delete this style"
		    d.Explanation = "Any report items using it will convert to the default style"
		    
		    b = d.ShowModal //display the dialog
		    Select Case b //determine which button was pressed.
		    Case d.ActionButton
		      
		      if DictStyles.HasKey(pmStyles.Text) then
		        DictStyles.Remove(pmStyles.Text)
		        pmStyles.RemoveRow(pmStyles.ListIndex)
		      end if
		      
		      pmStyles.SetPMText = "DefaultStyle"
		      
		    Case d.AlternateActionButton
		      
		    Case d.CancelButton
		      //user pressed Cancel
		    End select
		    
		  end if
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events cvFillColorShape
	#tag Event
		Sub Open()
		  me.cColor = &cFFFFFF00
		End Sub
	#tag EndEvent
	#tag Event
		Function MouseDown(x as integer, y as Integer) As boolean
		  UpdateSample
		  
		  
		End Function
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
		Name="Mode"
		Group="Behavior"
		Type="String"
		EditorType="MultiLineEditor"
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
