#tag Module
Protected Module PAF_PrintKit
	#tag Method, Flags = &h0
		Function BuildImageMenu() As MenuItem
		  Dim base As New MenuItem("Images")
		  
		  Dim fAppDataDirectory, fImageDirectory as xojo.io.FolderItem
		  
		  fAppDataDirectory = xojo.io.SpecialFolder.applicationSupport.Child(kAppName.totext)
		  if Not fAppDataDirectory.Exists then fAppDataDirectory.CreateAsFolder
		  if fAppDataDirectory.Exists then
		    
		    fImageDirectory = fAppDataDirectory.Child("Images")
		    if Not fImageDirectory.Exists then fImageDirectory.CreateAsFolder
		    if fImageDirectory.Exists then
		      
		      for each f as xojo.io.FolderItem in fImageDirectory.Children
		        if f.Name.Right(4) = ".png" then
		          base.Append new MenuItem( f.Name.Left(f.Name.IndexOf(".") ) )
		        end if
		      next
		      
		    end if
		  end if
		  
		  Return base
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function BuildSchemaMenu(oDBWrapper as PAF_Databasekit.DBWrapper) As MenuItem
		  dim base, mTable, mField as MenuItem
		  
		  base = new MenuItem
		  
		  if oDBWrapper <> nil then
		    
		    mTable = New MenuItem
		    mTable.Text = "Function"
		    mTable.Name = "Function"
		    
		    base.Append mTable
		    base.Append( New MenuItem( MenuItem.TextSeparator ))
		    
		    For Each entry as Xojo.Core.DictionaryEntry In oDBWrapper.SchemaDict
		      
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
		    
		  end if
		  
		  Return base
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function BuildSchemaMenuCompact(oDBWrapper as PAF_Databasekit.DBWrapper) As MenuItem
		  dim base, mTable, mField, mTables, mViews as MenuItem
		  
		  base = new MenuItem
		  
		  if oDBWrapper <> nil then
		    
		    mTable = New MenuItem
		    mTable.Text = "Function"
		    mTable.Name = "Function"
		    
		    base.Append mTable
		    base.Append( New MenuItem( MenuItem.TextSeparator ))
		    
		    if oDBWrapper.TableDict.Count > -1 then
		      
		      mTables = New MenuItem("Tables")
		      
		      For Each entry as Xojo.Core.DictionaryEntry in oDBWrapper.TableDict
		        
		        mTable = New MenuItem
		        mTable.Text = entry.Key
		        
		        for each fld as xojo.Core.DictionaryEntry in xojo.Core.Dictionary(entry.Value)
		          
		          mField = New MenuItem
		          mField.Text = fld.key
		          mField.Name = mTable.Text + "." + fld.key
		          mField.Tag = fld.Value
		          
		          mTable.Append mField
		          
		        Next
		        
		        mTables.Append mTable
		        
		      next
		      
		      base.Append mTables
		      
		    end if
		    
		    if oDBWrapper.ViewDict.Count > -1 then
		      
		      mViews = New MenuItem("Views")
		      
		      For Each entry as Xojo.Core.DictionaryEntry in oDBWrapper.ViewDict
		        
		        mTable = New MenuItem
		        mTable.Text = entry.Key
		        
		        for each fld as xojo.Core.DictionaryEntry in xojo.Core.Dictionary(entry.Value)
		          
		          mField = New MenuItem
		          mField.Text = fld.key
		          mField.Name = mTable.Text + "." + fld.key
		          mField.Tag = fld.Value
		          
		          mTable.Append mField
		          
		        Next
		        
		        mViews.Append mTable
		        
		      next
		      
		      base.Append mViews
		      
		    end if
		    
		  end if
		  
		  Return base
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Sub BuildStyles(Bands() as PAF_PrintKit.PrintBand, bPurge as Boolean = false)
		  //bPurge flag will recreate dictionary and eliminate any unused styles
		  if DictStyles = nil or bPurge = true then
		    
		    DictStyles = New Dictionary
		    
		  end if
		  
		  dim oStyle as PAF_PrintKit.PrintStyle
		  
		  dim styleIndexCounter As Integer
		  
		  oStyle = new PAF_PrintKit.PrintStyle
		  
		  oStyle.name = "DefaultStyle"
		  
		  if not DictStyles.HasKey(oStyle.name) then
		    
		    DictStyles.Value(oStyle.name) = oStyle
		    
		  end if
		  
		  For each band as PAF_PrintKit.PrintBand in Bands
		    
		    for each item as PAF_PrintKit.PrintItem in band.Items
		      
		      if item isa PAF_PrintKit.PrintText then
		        
		        if DictStyles.HasKey(PAF_PrintKit.PrintText(item).ShortsStyle) then
		          
		          oStyle = DictStyles.Value(PAF_PrintKit.PrintText(item).ShortsStyle)
		          
		        else
		          
		          oStyle = new PAF_PrintKit.PrintStyle
		          
		          oStyle.TextFont = PAF_PrintKit.PrintText(item).TextFont
		          oStyle.TextSize = PAF_PrintKit.PrintText(item).TextSize
		          oStyle.TextColor = PAF_PrintKit.PrintText(item).ForeColor
		          oStyle.Bold = PAF_PrintKit.PrintText(item).Bold
		          oStyle.Italic = PAF_PrintKit.PrintText(item).Italic
		          oStyle.Underline = PAF_PrintKit.PrintText(item).Underline
		          oStyle.FillColor = PAF_PrintKit.PrintText(item).FillColor
		          
		          select case PAF_PrintKit.PrintText(item).Alignment
		            
		          case 0,1
		            
		            oStyle.TextAlign = "Left"
		            
		          case 2
		            
		            oStyle.TextAlign = "Center"
		            
		          case 3
		            
		            oStyle.TextAlign = "Right"
		            
		          end select
		          
		          oStyle.name = oStyle.TextFont + "_"_
		          + str(oStyle.TextSize) + "_"_
		          + str(oStyle.TextAlign)
		          
		          if oStyle.Bold then oStyle.name = oStyle.name + "_Bold"
		          if oStyle.Italic then oStyle.name = oStyle.name + "_Italic"
		          if oStyle.Underline then oStyle.name = oStyle.name + "_Underline"
		          if oStyle.TextColor = &c00000000 then
		            oStyle.name = oStyle.name + "_Black"
		          else
		            dim v as Variant = oStyle.TextColor
		            oStyle.name = oStyle.name + "_" + v.StringValue
		          end if
		          if oStyle.FillColor <> &cFFFFFFFF and oStyle.FillColor <> &cFFFFFF00 then
		            dim v as Variant = oStyle.FillColor
		            oStyle.name = oStyle.name + "_" + v.StringValue
		          end if
		          
		          oStyle.Type = "Text"
		          
		          PAF_PrintKit.PrintText(item).ShortsStyle = oStyle.name
		          
		        end if
		        
		      elseif item isa PAF_PrintKit.PrintRect then
		        
		        if DictStyles.HasKey(PAF_PrintKit.PrintRect(item).ShortsStyle) then
		          
		          oStyle = DictStyles.Value(PAF_PrintKit.PrintRect(item).ShortsStyle)
		          
		        else
		          
		          oStyle = new PAF_PrintKit.PrintStyle
		          
		          oStyle.FillColor = PAF_PrintKit.PrintRect(item).FillColor
		          oStyle.LineColor = PAF_PrintKit.PrintRect(item).LineColor
		          oStyle.LineWidth = PAF_PrintKit.PrintRect(item).LineWidth
		          oStyle.CornerHeight = PAF_PrintKit.PrintRect(item).CornerHeight
		          oStyle.CornerWidth = PAF_PrintKit.PrintRect(item).CornerWidth
		          
		          oStyle.name = "ShapeStyle_" + styleIndexCounter.ToText
		          
		          while DictStyles.HasKey(oStyle.name)
		            styleIndexCounter = styleIndexCounter + 1
		            oStyle.name = "ShapeStyle_" + styleIndexCounter.ToText
		          wend
		          
		          oStyle.Type = "Shape"
		          
		          PAF_PrintKit.PrintRect(item).ShortsStyle = oStyle.name
		          
		        end if
		        
		      elseif item isa PAF_PrintKit.PrintOval then
		        
		        if DictStyles.HasKey(PAF_PrintKit.PrintOval(item).ShortsStyle) then
		          
		          oStyle = DictStyles.Value(PAF_PrintKit.PrintOval(item).ShortsStyle)
		          
		        else
		          
		          oStyle = new PAF_PrintKit.PrintStyle
		          
		          oStyle.FillColor = PAF_PrintKit.PrintOval(item).FillColor
		          oStyle.LineColor = PAF_PrintKit.PrintOval(item).LineColor
		          oStyle.LineWidth = PAF_PrintKit.PrintOval(item).LineWidth
		          
		          oStyle.name = "ShapeStyle_" + styleIndexCounter.ToText
		          
		          while DictStyles.HasKey(oStyle.name)
		            styleIndexCounter = styleIndexCounter + 1
		            oStyle.name = "ShapeStyle_" + styleIndexCounter.ToText
		          wend
		          
		          oStyle.Type = "Shape"
		          
		          PAF_PrintKit.PrintOval(item).ShortsStyle = oStyle.name
		          
		        end if
		        
		      end if
		      
		      if not DictStyles.HasKey(oStyle.name) then
		        
		        DictStyles.Value(oStyle.name) = oStyle
		        
		      end if
		      
		    next
		    
		  next
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExtractReportFields(aroBands() As PAF_PrintKit.PrintBand) As String()
		  dim aroReportFields() As String
		  
		  for each oBand as PAF_PrintKit.PrintBand in aroBands
		    for each oItem as PAF_PrintKit.PrintItem in oBand.Items
		      if oItem isa PAF_PrintKit.PrintField then
		        
		        if aroReportFields.IndexOf(PAF_PrintKit.PrintField(oItem).FieldName) = - 1 then
		          
		          aroReportFields.Append PAF_PrintKit.PrintField(oItem).FieldName
		          
		        end if
		      end if
		    next
		  next
		  
		  Return aroReportFields
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExtractReportStyles(Bands() as PAF_PrintKit.PrintBand) As Dictionary
		  // This will extract only the styles used in the report
		  // to save in the report file making the styles portable
		  // This assumes nothing it will either find an existing named
		  // style with the same settings or create a new one
		  
		  dim reportStylesDict As new Dictionary
		  
		  dim oStyle as PAF_PrintKit.PrintStyle
		  
		  dim styleIndexCounter As Integer
		  
		  oStyle = new PAF_PrintKit.PrintStyle
		  
		  oStyle.name = "DefaultStyle"
		  
		  // gotta have the default style
		  if not reportStylesDict.HasKey(oStyle.name) then
		    
		    reportStylesDict.Value(oStyle.name) = oStyle
		    
		  end if
		  
		  For each band as PAF_PrintKit.PrintBand in Bands
		    // we need to account for conditional formatting in scripts
		    // so if a script exists we will strip the styles from
		    // andy SetStyle commands
		    if band.Script <> "" then
		      ExtractScriptStyles(band.Script, reportStylesDict)
		    end if
		    
		    for each item as PAF_PrintKit.PrintItem in band.Items
		      
		      if item isa PAF_PrintKit.PrintText then
		        
		        // build the style
		        
		        oStyle = new PAF_PrintKit.PrintStyle
		        
		        oStyle.Bold = PAF_PrintKit.PrintText(item).Bold
		        oStyle.FillColor = PAF_PrintKit.PrintText(item).FillColor
		        oStyle.Italic = PAF_PrintKit.PrintText(item).Italic
		        oStyle.name = PAF_PrintKit.PrintText(item).ShortsStyle
		        select case PAF_PrintKit.PrintText(item).Alignment
		          
		        case 0,1
		          
		          oStyle.TextAlign = "Left"
		          
		        case 2
		          
		          oStyle.TextAlign = "Center"
		          
		        case 3
		          
		          oStyle.TextAlign = "Right"
		          
		        end select
		        oStyle.TextFont = PAF_PrintKit.PrintText(item).TextFont
		        oStyle.TextSize = PAF_PrintKit.PrintText(item).TextSize
		        oStyle.TextColor = PAF_PrintKit.PrintText(item).ForeColor
		        oStyle.FillColor = PAF_PrintKit.PrintText(item).FillColor
		        oStyle.Underline = PAF_PrintKit.PrintText(item).Underline
		        
		        oStyle.Type = "Text"
		        
		        // now compare
		        
		        Dim bExists as Boolean = false
		        
		        Dim oExistingStyle As PAF_PrintKit.PrintStyle
		        
		        Dim arvValues() As Variant = DictStyles.Values
		        
		        
		        for i as integer = 0 to arvValues.Ubound
		          
		          oExistingStyle = PAF_PrintKit.PrintStyle(arvValues(i))
		          
		          if oStyle.CompareAllButName(oExistingStyle) = true then
		            
		            bExists = true
		            
		            PAF_PrintKit.PrintText(item).ShortsStyle = oExistingStyle.name
		            
		            exit
		            
		          end if
		          
		        next
		        
		        if not bExists then ' create the name and add it
		          
		          select case PAF_PrintKit.PrintText(item).Alignment
		            
		          case 0,1
		            
		            oStyle.TextAlign = "Left"
		            
		          case 2
		            
		            oStyle.TextAlign = "Center"
		            
		          case 3
		            
		            oStyle.TextAlign = "Right"
		            
		          end select
		          
		          oStyle.name = oStyle.TextFont + "_"_
		          + str(oStyle.TextSize) + "_"_
		          + str(oStyle.TextAlign)
		          
		          if oStyle.Bold then oStyle.name = oStyle.name + "_Bold"
		          if oStyle.Italic then oStyle.name = oStyle.name + "_Italic"
		          if oStyle.Underline then oStyle.name = oStyle.name + "_Underline"
		          
		          dim v as Variant = oStyle.TextColor
		          oStyle.name = oStyle.name + "_" + v.StringValue
		          
		          if oStyle.FillColor <> &cFFFFFFFF and oStyle.FillColor <> &cFFFFFF00 then
		            v = oStyle.FillColor
		            oStyle.name = oStyle.name + "_" + v.StringValue
		          end if
		          
		          oStyle.Type = "Text"
		          
		          PAF_PrintKit.PrintText(item).ShortsStyle = oStyle.name
		          // add to main style Dictionary
		          DictStyles.Value(oStyle.name) = oStyle
		          
		        end if
		        
		      elseif item isa PAF_PrintKit.PrintRect then
		        
		        if DictStyles.HasKey(PAF_PrintKit.PrintRect(item).ShortsStyle) then
		          
		          oStyle = DictStyles.Value(PAF_PrintKit.PrintRect(item).ShortsStyle)
		          
		        else
		          
		          oStyle = new PAF_PrintKit.PrintStyle
		          
		          oStyle.FillColor = PAF_PrintKit.PrintRect(item).FillColor
		          oStyle.LineColor = PAF_PrintKit.PrintRect(item).LineColor
		          oStyle.LineWidth = PAF_PrintKit.PrintRect(item).LineWidth
		          oStyle.CornerWidth = PAF_PrintKit.PrintRect(item).CornerWidth
		          oStyle.CornerHeight = PAF_PrintKit.PrintRect(item).CornerHeight
		          
		          oStyle.name = "ShapeStyle_" + styleIndexCounter.ToText
		          
		          while reportStylesDict.HasKey(oStyle.name) or DictStyles.HasKey(oStyle.name) ' prevent duplication
		            styleIndexCounter = styleIndexCounter + 1
		            oStyle.name = "ShapeStyle_" + styleIndexCounter.ToText
		          wend
		          
		          oStyle.Type = "Shape"
		          
		          PAF_PrintKit.PrintRect(item).ShortsStyle = oStyle.name
		          
		        end if
		        
		      elseif item isa PAF_PrintKit.PrintOval then
		        
		        if DictStyles.HasKey(PAF_PrintKit.PrintOval(item).ShortsStyle) then
		          
		          oStyle = DictStyles.Value(PAF_PrintKit.PrintOval(item).ShortsStyle)
		          
		        else
		          
		          oStyle = new PAF_PrintKit.PrintStyle
		          
		          oStyle.FillColor = PAF_PrintKit.PrintOval(item).FillColor
		          oStyle.LineColor = PAF_PrintKit.PrintOval(item).LineColor
		          oStyle.LineWidth = PAF_PrintKit.PrintOval(item).LineWidth
		          
		          oStyle.name = "ShapeStyle_" + styleIndexCounter.ToText
		          
		          while reportStylesDict.HasKey(oStyle.name) or DictStyles.HasKey(oStyle.name) ' prevent duplication
		            styleIndexCounter = styleIndexCounter + 1
		            oStyle.name = "ShapeStyle_" + styleIndexCounter.ToText
		          wend
		          
		          oStyle.Type = "Shape"
		          
		          PAF_PrintKit.PrintOval(item).ShortsStyle = oStyle.name
		          
		        end if
		        
		      end if
		      
		      if not reportStylesDict.HasKey(oStyle.name) then
		        
		        reportStylesDict.Value(oStyle.name) = oStyle
		        
		      end if
		      
		    next
		    
		  next
		  
		  Return reportStylesDict
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function ExtractReportTables(aroBands() As PAF_PrintKit.PrintBand) As String()
		  dim sTable, arsTable() As String
		  
		  for each oBand as PAF_PrintKit.PrintBand in aroBands
		    
		    for each oItem as PAF_PrintKit.PrintItem in oBand.Items
		      
		      if oItem isa PAF_PrintKit.PrintField then
		        
		        sTable = NthField(PAF_PrintKit.PrintField(oItem).FieldName,".",1)
		        
		        if arsTable.IndexOf(sTable) = - 1 then
		          
		          arsTable.Append sTable
		          
		        end if
		        
		      end if
		      
		    next
		    
		  next
		  
		  Return arsTable
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub ExtractScriptStyles(sScript As String, reportStylesDict as Dictionary)
		  Dim r As New regex
		  
		  r.SearchPattern = "(?Umi-s)SC_SetStyle\(.*,""(.*)""\)"
		  
		  Dim m as regexmatch
		  
		  Dim sStyleName As string
		  
		  Dim oStyle As PAF_PrintKit.PrintStyle
		  
		  m = r.Search(sScript)
		  
		  while m <> nil
		    
		    sStyleName = m.SubExpressionString(1)
		    
		    if not DictStyles.HasKey(sStyleName) then
		      
		      MsgBox "You have a script referencing a style named " + sStyleName + " which does not exist."
		      
		    else
		      
		      oStyle = DictStyles.Value(sStyleName)
		      
		      if not reportStylesDict.HasKey(oStyle.name) then
		        
		        reportStylesDict.Value(oStyle.name) = oStyle
		        
		      end if
		      
		    end if
		    
		    m = r.Search
		    
		  wend
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetImageNames() As MenuItem
		  Dim miImages As New MenuItem
		  
		  Dim fAppDataDirectory, fImageDirectory as xojo.IO.FolderItem
		  
		  fAppDataDirectory = xojo.io.SpecialFolder.applicationSupport.Child(kAppName.totext)
		  if Not fAppDataDirectory.Exists then fAppDataDirectory.CreateAsFolder
		  if fAppDataDirectory.Exists then
		    
		    fImageDirectory = fAppDataDirectory.Child("Images")
		    if Not fImageDirectory.Exists then fImageDirectory.CreateAsFolder
		    if fImageDirectory.Exists then
		      
		      for each f as xojo.io.FolderItem in fImageDirectory.Children
		        if f.Name.Right(4) = ".png" then
		          miImages.Append new MenuItem(f.Name.Left(f.Name.IndexOf(".")))
		        end if
		      next
		      
		    end if
		  end if
		  
		  Return miImages
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetWrapLines(extends g as Graphics, sData as string, width as integer, height as Integer = - 1) As string()
		  #pragma DisableBackgroundTasks
		  
		  // Given a string and a width
		  // return the string as an array of lines that fit
		  
		  dim s as String
		  
		  // Get known sLine endings
		  s = ReplaceLineEndings(sData,EndOfLine)
		  
		  // Is height involved?
		  if height <> -1 then
		    
		    // determine number of sLines that will fit
		    dim sLinesThatFit as Integer = floor(height/g.TextHeight)
		    
		    // Use optional method
		    Return g.GetXWrapLines(s,width,sLinesThatFit)
		    
		  end if
		  
		  dim sParagraphs(), sWords(), sLines(), sParagraph, sWord, sLine as String
		  
		  sParagraphs = Split(s, EndOfLine)
		  
		  For each sParagraph in sParagraphs
		    
		    if Floor(g.StringWidth(sParagraph)) > width  then
		      
		      sWords = Split(sParagraph," ")
		      
		      For each sWord in sWords
		        
		        if g.StringWidth(sLine) + g.stringwidth(" ") + g.StringWidth(sWord) < width then
		          
		          if sLine = "" then
		            sLine = sWord
		          else
		            sLine = sLine + " " + sWord
		          end if
		          
		          sWord = ""
		          
		        else
		          
		          sLines.Append sLine
		          
		          sLine = sWord
		          
		        end if
		        
		      next
		      
		    else
		      
		      sline = sParagraph
		      
		    end if
		    
		    sLines.Append sLine
		    
		    sLine = ""
		    
		  Next
		  
		  if sLines.Ubound > -1 then
		    if sLines(sLines.Ubound) = "" then sLines.Remove(sLines.Ubound)
		  end if
		  
		  Return sLines
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetXWrapLines(extends g as Graphics, sData as string, width as integer, numLines as Integer) As string()
		  // Given a string, a width and a number of lines
		  // return the string as an array of lines that fit
		  // within the width
		  
		  dim s as String
		  
		  s = ReplaceLineEndings(sData,EndOfLine)
		  
		  dim sParagraphs(), sWords(), sLines(), sParagraph, sWord, sLine as String
		  
		  sParagraphs = Split(s, EndOfLine)
		  
		  For each sParagraph in sParagraphs
		    
		    sWords = Split(sParagraph," ")
		    
		    For each sWord in sWords
		      
		      if g.StringWidth(sLine) + g.StringWidth(sWord) < width then
		        
		        sLine = sLine + " " + sWord
		        
		        sWord = ""
		        
		      else
		        
		        sLines.Append sLine
		        
		        if sLines.Ubound = numLines -1 then Return sLines
		        
		        sLine = sWord
		        
		      end if
		      
		    next
		    
		    sLines.Append sLine
		    
		    sLine = ""
		    
		  Next
		  
		  Return sLines
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function PAFConfirm(sMessage as String, ActionButtonCaption as String, ActionDefault as Boolean = False) As Boolean
		  dim d as New MessageDialog                  //declare the MessageDialog object
		  
		  dim b as MessageDialogButton                //for handling the result
		  
		  d.icon = MessageDialog.GraphicQuestion         //display question icon
		  
		  d.ActionButton.Caption = ActionButtonCaption
		  
		  d.ActionButton.Default = ActionDefault
		  
		  d.CancelButton.Visible = True                //show the Cancel button
		  
		  d.CancelButton.Cancel = True
		  
		  d.Message = sMessage
		  
		  b = d.ShowModal                              //display the dialog
		  
		  Select Case b                              //determine which button was pressed.
		    
		  Case d.ActionButton
		    
		    Return True
		    
		    //user pressed Confirm
		  Case d.AlternateActionButton
		    
		    //user pressed Cancel
		  Case d.CancelButton
		    
		    Return False
		    
		    //user pressed Cancel
		  End select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h1
		Protected Function ResolveImage(sName As String) As Picture
		  Dim f, fAppDataDirectory, fImageDirectory as FolderItem
		  
		  fAppDataDirectory = SpecialFolder.ApplicationData.Child(kAppName)
		  if Not fAppDataDirectory.Exists then fAppDataDirectory.CreateAsFolder
		  if fAppDataDirectory.Exists then
		    
		    fImageDirectory = fAppDataDirectory.Child("Images")
		    if Not fImageDirectory.Exists then fImageDirectory.CreateAsFolder
		    
		    if fImageDirectory.Exists then
		      
		      dim iCount as integer = fImageDirectory.Count
		      dim fName as String
		      
		      for i as integer = 1 to iCount
		        
		        f = fImageDirectory.Item(i)
		        
		        fName = NthField(f.Name,".",1)
		        
		        if fName = sName then
		          
		          return Picture.Open(f)
		          
		        end if
		      next
		    end if
		  end if
		  
		  Return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub SetPMText(extends pm as PopupMenu, assigns s as String)
		  for i as integer = 0 to pm.ListCount-1
		    if pm.list(i) = s then
		      pm.ListIndex = i
		      exit
		    end
		  next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub StoreImage()
		  Dim picFile As FolderItem
		  picFile = GetOpenFolderItem("")
		  Dim pic As Picture
		  
		  If picFile <> Nil Then
		    pic = Picture.Open(picFile)
		  End If
		  
		  if pic <> nil then
		    
		    Dim f, fAppDataDirectory, fImageDirectory as FolderItem
		    Dim sSaveName as String = PAFInputWin.GetInput("Please name this image", "Store", "Cancel", "")
		    if sSaveName <> "" then
		      
		      fAppDataDirectory = SpecialFolder.ApplicationData.Child(kAppName)
		      if Not fAppDataDirectory.Exists then fAppDataDirectory.CreateAsFolder
		      if fAppDataDirectory.Exists then
		        
		        fImageDirectory = fAppDataDirectory.Child("Images")
		        if Not fImageDirectory.Exists then fImageDirectory.CreateAsFolder
		        if fImageDirectory.Exists then
		          
		          f = fImageDirectory.Child(sSaveName + ".png")
		          
		          if f <> nil then
		            pic.Save(f,Picture.SaveAsPNG)
		          end if
		        end if
		      end if
		      
		    end if
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Function VariantArrayToStringArray(v() as Variant) As String()
		  dim s() as string
		  
		  For i as integer = 0 to v.Ubound
		    
		    s.Append v(i).StringValue
		    
		  Next
		  
		  Return s
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function WhichScreen(win As Window) As screen
		  for i as integer = 0 to ScreenCount
		    if win.left >= screen(i).left and win.left <= screen(i).left + screen(i).width then
		      Return screen(i)
		    end if
		  next i
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		DictStyles As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		InstalledFonts As MenuItem
	#tag EndProperty

	#tag Property, Flags = &h0
		ScratchGraphics As Graphics
	#tag EndProperty

	#tag Property, Flags = &h0
		ScratchPicture As Picture
	#tag EndProperty


	#tag Constant, Name = kSizingHandleSize, Type = Double, Dynamic = False, Default = \"6", Scope = Public
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
			Name="ScratchPicture"
			Group="Behavior"
			Type="Picture"
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
