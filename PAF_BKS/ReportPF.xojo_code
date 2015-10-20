#tag Class
Protected Class ReportPF
	#tag Method, Flags = &h21
		Private Function AdjustFooterTops(jFooter as JSONItem, oldTop as Double, newTop as Double) As JSONItem
		  dim jItems, jItem, jPos as JSONItem
		  
		  dim offset as double
		  
		  jItems = jFooter.Lookup("Items", nil)
		  
		  if jItems <> nil then
		    
		    For i as integer = 0 to jItems.Count - 1
		      
		      jItem = jItems(i)
		      
		      jPos = jItem.Value("position")
		      
		      offset = jPos.Value(1) - oldTop
		      
		      jPos.Value(1) = newTop + offset
		      
		    next
		    
		  end if
		  
		  Return jFooter
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AppendBindArrays(sql as String, byRef arsFieldName() as String, byRef arsFieldType() as String, byRef arvFieldValue() as Variant)
		  dim r as RegEx
		  dim m as RegExMatch
		  dim sMatch, sMatchAlias as string
		  dim fieldTypeDict as New xojo.Core.Dictionary
		  
		  // we know we have already added the universal where conditions
		  // so we don't want to add them again. They will always be
		  // the first items in the sql so we skip them in our while loop
		  // using  "currentCount" variable
		  
		  dim currentCount As integer = 0
		  
		  'find the recordset fields to replace the "?" placeholders
		  r = new regex
		  
		  // where and or -> white space
		  // optional number of opening parenthesis
		  // (table.field) this is what we want
		  // white space -> anything -> ending in "?"
		  
		  r.SearchPattern = "(?Umi-s)[where|and|or]\s+\(*(\w+\.\w+)\s.*\?"
		  
		  m = r.Search(sql)
		  
		  while m <> nil
		    
		    if currentCount > arsFieldName.Ubound then
		      
		      sMatch = m.SubExpressionString(1)
		      
		      arsFieldName.Append sMatch
		      
		      // db.SchemaDict is a dictionary (Tablename:Dictionary)
		      // the sub dictionary is (FieldName:FieldType)
		      
		      fieldTypeDict = oDBWrapper.SchemaDict.Value(NthField(sMatch,".",1))
		      arsFieldType.Append fieldTypeDict.Value(NthField(sMatch,".",2))
		      
		      sMatchAlias = oDBWrapper.AliasResolutionDict.Value(sMatch)
		      
		      
		      if fieldDict.HasKey(sMatchAlias) then
		        
		        arvFieldValue.Append fieldDict.Value(sMatchAlias)
		        
		      else
		        // group by may not resolve
		        arvFieldValue.Append fieldDict.Value(sMatch)
		        
		      end if
		      
		    end if
		    
		    currentCount = currentCount + 1
		    
		    m = r.Search
		    
		  wend
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub AppendPageFooter(oPage as BKS_Shorts.Page, jFooter as JSONItem, iPageNo as Integer)
		  dim oRow as GroupItemPF = CreateRow(jFooter)
		  
		  ApplyRowColoring(oRow)
		  
		  oRow.Top = jFooter.Lookup("top",0.0)
		  
		  static dtReport as new date
		  
		  dim s as String
		  
		  For each oItem as BKS_Shorts.Item in oRow.items
		    
		    if oItem isa BKS_Shorts.TextItem then
		      
		      s = BKS_Shorts.TextItem(oItem).Text
		      
		      if InStr(s, "//") > 0  then
		        
		        Dim sFormat as string = GetPref("DateFormat")
		        
		        if sFormat <> "" then
		          
		          dim d As xojo.Core.Date = xojo.core.Date.Now
		          
		          s = replace(s,"//", DateFormatLocale(sFormat,d))
		          
		        else
		          
		          s = replace(s,"//", dtReport.ShortDate + " " + dtReport.ShortTime)
		          
		        end if
		        
		      end if
		      
		      if InStr(s, "##") > 0 then
		        
		        s = replace(s,"##", Str(iPageNo))
		        
		      end if
		      
		      if InStr(s, "%%") > 0 then
		        
		        s = replace(s,"%%", Str(aroPage.Ubound + 1))
		        
		      end if
		      
		      BKS_Shorts.TextItem(oItem).Text = s
		      
		    end if
		    
		  next
		  
		  oPage.Append(oRow)
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ApplyRowColoring(oRow As GroupItemPF)
		  Dim oRect As BKS_Shorts.RectItem
		  
		  if oRow.AlternateColors then
		    oRect = new BKS_Shorts.RectItem(oRow.Bounds.Left, oRow.Bounds.Top, PageWidthPt, oRow.bounds.Height)
		    oRect.Style.LineWidth = 0
		    if oRow.EvenRow then
		      oRect.Style.LineColor = oRow.EvenColor
		      oRect.Style.FillColor = oRow.EvenColor
		    else
		      oRect.Style.LineColor = oRow.OddColor
		      oRect.style.FillColor = oRow.OddColor
		    end if
		    oRow.Insert 0, oRect
		  elseif oRow.EvenColor <> &cFFFFFFFF and oRow.EvenColor <> &cFFFFFF00 then
		    oRect = new BKS_Shorts.RectItem(oRow.Bounds.Left, oRow.Bounds.Top, PageWidthPt, oRow.bounds.Height)
		    oRect.Style.LineWidth = 0
		    oRect.Style.LineColor = oRow.EvenColor
		    oRect.Style.FillColor = oRow.EvenColor
		    oRow.Insert 0, oRect
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ApplyRowsToPage(thrd as BKS_Thread)
		  dim iRowCount, counter, iRowHeight as integer
		  dim oRow as GroupItemPF
		  dim d as new Dictionary
		  dim oPage As BKS_Shorts.Page
		  dim dPageWidth, dAvailableHeight, dY as double
		  
		  oPage = NewPage
		  dPageWidth = oPage.Width - LeftMarginPt - RightMarginPt
		  dAvailableHeight = oPage.Height - BottomMarginPt - dFooterHeight
		  dY = dHeaderHeight
		  iRowCount = aroRows.Ubound
		  
		  for i as integer = 0 to iRowCount
		    
		    oRow = aroRows(i)
		    
		    if not oRow.Visible then continue
		    
		    if oRow.PageBreak and DictPageBreak.HasKey(oRow.Index) then
		      dy = dAvailableHeight
		      if DictPageBreak.HasKey(oRow.Index + 1) then
		        // the next section should have at least 1 item under it's parent band - so we reset
		        DictPageBreak.Remove(oRow.Index + 1)
		      end if
		    else
		      // any value will work. just need to check for existence
		      DictPageBreak.Value(oRow.Index) = 1
		    end if
		    
		    // allows sliding of objects based on size of items above
		    if orow.HasGrowableItems then
		      orow.GetGroupHeight
		    end if
		    
		    iRowHeight = oRow.Bounds.Height
		    
		    ApplyRowColoring(oRow)
		    
		    if oRow.RepeatEachPage then
		      DictRepeatRow.value(oRow.Index) = oRow.Clone
		    end if
		    
		    if dY + iRowHeight > dAvailableHeight then
		      //Add the page to our array
		      aroPage.Append(oPage)
		      
		      // Create New page
		      oPage = NewPage
		      
		      // Handle any "RepeatEachPage" sections
		      dy = RepeatEachPage(oPage,oRow.Index)
		      
		    end
		    
		    //Set the top of the row
		    oRow.top = dy
		    //Add the row to the page
		    oPage.Append oRow
		    //Get our new bottom
		    dy = dy + iRowHeight
		    d.Value("Page") = counter
		    thrd.UpdateUI d
		    counter = counter + 1
		  next
		  
		  aroPage.Append(oPage)
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub BuildBindArrays(byRef arsFieldName() as String, byRef arsFieldType() as String, byRef arvFieldValue() as Variant)
		  Dim oWhere As PAFQueryCondition
		  // we want to capture the universal where conditions
		  For i as integer = 0 to aroWhereConditions.Ubound
		    oWhere = aroWhereConditions(i)
		    if oWhere.Operator <> "Is Null" and oWhere.Operator <> "Is Not Null" then
		      arsFieldName.append oWhere.Field
		      arsFieldType.Append NthField(oWhere.Type,"|",2)
		      arvFieldValue.Append oWhere.PreparedValue
		    end if
		  Next
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub Constructor(oDBWrapper as PAF_Databasekit.DBWrapper, jReport as JSONItem, oDesigner As PAF_PrintKit.DesignCanvas)
		  StyleDict = New Dictionary
		  ReportJSON = jReport
		  
		  ScriptRunner = new ScriptMaster
		  
		  me.oDBWrapper = oDBWrapper
		  me.designer = oDesigner
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CreateItem(oItem as JSONItem, optional pic As Picture = nil) As BKS_Shorts.Item()
		  dim sType, sData, sStyle as String
		  dim iPosition() as Double
		  dim jPositionItems as JSONItem
		  dim oItems() As BKS_Shorts.Item
		  
		  sType = oItem.Lookup("type","").StringValue
		  sData = oItem.Lookup("data","").StringValue
		  sStyle = oItem.Lookup("style","").StringValue
		  
		  jPositionItems = oItem.Child("position")
		  
		  dim defaultStyle as BKS_Shorts.StyleSet = StyleDict.Value("DefaultStyle")
		  
		  For i as integer = 0 to jPositionItems.Count - 1
		    iPosition.Append jPositionItems.Value(i).IntegerValue
		  next
		  
		  select case sType
		    
		  case "text", "field"
		    
		    dim dLeft, dTop, dWidth, dHeight as Double
		    dLeft = jPositionItems.Value(0).DoubleValue
		    dTop = jPositionItems.Value(1).DoubleValue
		    dWidth = jPositionItems.Value(2).DoubleValue
		    dHeight = jPositionItems.Value(3).DoubleValue
		    if sType = "field" and oItem.Lookup("IsImage",FALSE) = True then
		      oItems.Append New BKS_Shorts.ImageItem(pic,dLeft,dTop,dWidth,dHeight)
		      Return oItems
		    end if
		    
		    dim oTextItem as New BKS_Shorts.TextItem(sData,dLeft,dTop,dWidth,dHeight)
		    oTextItem.Style = StyleDict.Lookup(sStyle,defaultStyle)
		    
		    if oItem.Lookup("canGrow",False).BooleanValue = True then
		      oTextItem.AutoAdjustHeight = true
		      oTextItem.WrapLines = true
		    end if
		    
		    if oTextItem.Style.FillColor <> &cFFFFFFFF and oTextItem.Style.FillColor <> &cFFFFFF00 then
		      
		      Dim oRectItem as New BKS_Shorts.RectItem(dLeft,dTop,dWidth,oTextItem.Bounds.Height)
		      oRectItem.Style = oTextItem.Style.Clone
		      oRectItem.Style.LineWidth = 0
		      oRectItem.Style.LineColor = oTextItem.Style.FillColor
		      oItems.Append oRectItem
		      
		    end if
		    
		    oItems.Append oTextItem
		    
		    
		    Return oItems
		    
		  case "line"
		    
		    dim x1,y1,x2,y2 as double
		    x1 = jPositionItems.Value(0).DoubleValue
		    y1 = jPositionItems.Value(1).DoubleValue
		    x2 = jPositionItems.Value(2).DoubleValue
		    y2 = jPositionItems.Value(3).DoubleValue
		    oItems.Append new BKS_Shorts.LineItem(x1,y1,x2,y2)
		    Return oItems
		    
		  case "image"
		    
		    dim dLeft, dTop, dWidth, dHeight as Double
		    dLeft = jPositionItems.Value(0).DoubleValue
		    dTop = jPositionItems.Value(1).DoubleValue
		    dWidth = jPositionItems.Value(2).DoubleValue
		    dHeight = jPositionItems.Value(3).DoubleValue
		    
		    Dim p as Picture = PAF_PrintKit.ResolveImage(oItem.Lookup("name",""))
		    if p = nil then
		      p = new Picture(dWidth,dHeight)
		    end if
		    oItems.Append new BKS_Shorts.ImageItem(p,dLeft,dTop,dWidth,dHeight)
		    Return oItems
		    
		  case "rect"
		    
		    dim dLeft, dTop, dWidth, dHeight, dCornerWidth, dCornerHeight as Double
		    dLeft = jPositionItems.Value(0).DoubleValue
		    dTop = jPositionItems.Value(1).DoubleValue
		    dWidth = jPositionItems.Value(2).DoubleValue
		    dHeight = jPositionItems.Value(3).DoubleValue
		    dCornerWidth = oItem.Lookup("cornerwidth",0.0).DoubleValue
		    dCornerHeight = oItem.Lookup("cornerheight",0.0).DoubleValue
		    
		    if dCornerWidth <> 0.0 or dCornerHeight <> 0.0 then
		      Dim oRectItem as New BKS_Shorts.RoundRectItem(dLeft,dTop,dWidth,dHeight,dCornerWidth,dCornerHeight)
		      oRectItem.Style = StyleDict.Lookup(sStyle,defaultStyle)
		      oItems.Append oRectItem
		    else
		      Dim oRectItem as New BKS_Shorts.RectItem(dLeft,dTop,dWidth,dHeight)
		      oRectItem.Style = StyleDict.Lookup(sStyle,defaultStyle)
		      oItems.Append oRectItem
		    end if
		    Return oItems
		    
		  case "oval"
		    
		    dim dLeft, dTop, dWidth, dHeight as Double
		    dLeft = jPositionItems.Value(0).DoubleValue
		    dTop = jPositionItems.Value(1).DoubleValue
		    dWidth = jPositionItems.Value(2).DoubleValue
		    dHeight = jPositionItems.Value(3).DoubleValue
		    
		    Dim oOvalItem as New BKS_Shorts.OvalItem(dLeft,dTop,dWidth,dHeight)
		    oOvalItem.Style = StyleDict.Lookup(sStyle,defaultStyle)
		    
		    oItems.Append oOvalItem
		    Return oItems
		    
		  else
		    break
		  end Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CreateItem(jItem As JSONItem, rs As RecordSet) As BKS_Shorts.Item()
		  dim fieldName, fieldAlias, sFormat As string
		  dim oItem, oItems() as BKS_Shorts.Item
		  
		  fieldName = jItem.Lookup("FieldName","").StringValue.DefineEncoding(Encodings.UTF8)
		  
		  fieldAlias = jItem.Lookup("Alias","").StringValue.DefineEncoding(Encodings.UTF8)
		  
		  if jItem.Lookup("IsImage",false) = true then ' it is an image
		    
		    dim p As Picture = DBFieldToPicture(rs.Field(fieldAlias))
		    if p <> nil then
		      oItems = CreateItem(jItem, p)
		    end if
		    
		  else
		    
		    oItems = CreateItem(jItem)
		    
		    sFormat = jItem.Lookup("Format","").StringValue.DefineEncoding(Encodings.UTF8)
		    
		    // TO DO TO DO TO DO TODO
		    if jItem.Lookup("type","") = "field" then
		      
		      if oItems.Ubound = 1 then ' there is a fill rect attached
		        
		        oItem = oItems(1)
		        
		      else
		        
		        oItem = oItems(0)
		        
		      end if
		      
		      if sFormat = "" then
		        
		        BKS_Shorts.TextItem(oItem).Text = Trim(rs.Field(fieldAlias).StringValue.DefineEncoding(Encodings.UTF8))
		        
		      else
		        ' check for date, time or timestamp format
		        if left(sFormat,2) = "T_" or left(sFormat,2) = "D_" or left(sFormat,3) = "TS_" or left(sFormat,4) = "SQL_" then
		          
		          ' be sure date value is not nil
		          if rs.Field(fieldAlias).StringValue <> "" then
		            
		            // lookup original schema name for field
		            'dim sFieldType as String = xojo.Core.Dictionary(oDBWrapper.SchemaDict.Value(NthField(fieldName,".",1))).Value(NthField(fieldName,".",2))
		            
		            Dim d As New Xojo.Core.Date(rs.Field(fieldAlias).DateValue.TotalSeconds - 2082844800, Xojo.Core.TimeZone.Current)
		            
		            BKS_Shorts.TextItem(oItem).Text = DateFormatLocale(sFormat,d)
		            
		          end if
		        else
		          
		          BKS_Shorts.TextItem(oItem).Text = format(val(Trim(rs.Field(fieldAlias).StringValue.DefineEncoding(Encodings.UTF8))),sFormat)
		          
		        end if
		      end if
		    end if
		    
		  end if
		  
		  Return oItems
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function CreateReport(oDBWrapper as PAF_DatabaseKit.DBWrapper, thrd as BKS_Thread) As BKS_Shorts.Page()
		  dim jStyles, jSetup as JSONItem
		  
		  DictPageBreak = new Dictionary 'keeps track of page break by section
		  DictRepeatRow = New Dictionary 'keeps track of breaks that cross page - repeating on each page
		  fieldDict = new Dictionary
		  
		  if oDBWrapper <> nil and oDBWrapper.type = "SQLite" then
		    SQLiteDatabase(oDBWrapper.db).ShortColumnNames = false
		  end if
		  
		  LoadQueryConditions
		  
		  jStyles = ReportJSON.Lookup("Styles", nil)
		  if jStyles <> nil then
		    SetupStyles(jStyles)
		  end if
		  // now with multiwindow we use all styles
		  'SetupStyles
		  
		  // apply printer settings or defauls (US Letter Portrait)
		  jSetup = ReportJSON.Lookup("Setup", nil)
		  SetupDocumentSettings(jSetup)
		  
		  // Build an array of the band ordering (jReportOrder)
		  dim jBands as JSONItem = ReportJSON.Lookup("Bands",nil)
		  if jBands <> nil then
		    
		    ExtractBandInfo(jBands)
		    
		    // grab band sql
		    dim bandSQL, sql() as String
		    For i as integer = 0 to jReportOrder.Ubound
		      bandSQL = JSONItem(jReportOrder(i)).Lookup("sql","")
		      sql.Append bandSQL
		    next
		    
		    CreateRows(oDBWrapper,jReportOrder,sql)
		    ApplyRowsToPage(thrd)
		    
		  end if
		  
		  //Before we leave we need to add a footer to each page.  We do this by iterating through each of our pages in the
		  //aroPage array.
		  if jFooter <> nil then
		    for i as integer = 0 to aroPage.Ubound
		      AppendPageFooter(aroPage(i),jFooter, i+1)
		    next
		  end if
		  
		  if ScriptError.Ubound > -1 then
		    pfDispatcher.send("ScriptError", "Script Error(s): " +  endofline + endofline + Join(ScriptError,endofline + EndOfLine))
		  end if
		  
		  Return aroPage
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CreateRow(rs as RecordSet = nil, jLine as JSONItem, bEvenRow as Boolean = false) As GroupItemPF
		  dim oItems() as BKS_Shorts.Item
		  dim oRect as BKS_Shorts.RectItem
		  dim oLine as BKS_Shorts.LineItem
		  dim padTop as Integer = jLine.Lookup("paddingTop",0)
		  dim padBottom as integer = jLine.Lookup("paddingBottom",0)
		  dim jItem, jItems as JSONItem
		  
		  if jLine.Lookup("script","") <> "" then
		    jLine = ProcessBandScript(rs,jLine)
		  end if
		  
		  // we use rectItems to force bksshorts to respect top and bottom padding on
		  // our bands. due to rect borders showing up even with linewidth = 0 on pdf output
		  // we will make them the same color as background (temp fix)
		  
		  dim cBandColor As color = jLine.Lookup("fillcolor",&cFFFFFFFF).ColorValue
		  
		  dim oRow As new GroupItemPF(jLine)
		  oRow.EvenRow = bEvenRow
		  
		  // we create a default 1pt padding on the top. This is key as it
		  // establishes the left edge of the row/group
		  oRect = new BKS_Shorts.RectItem(0, 0, 1, max(padTop,1))
		  oRect.Style.LineWidth = 0
		  oRect.Style.LineColor = cBandColor
		  oRect.Style.FillColor = cBandColor
		  oRow.Append oRect
		  
		  jItems = jLine.Lookup("Items", nil)
		  if jItems <> nil then
		    
		    for i as integer = 0 to jItems.Count -1
		      jItem = jItems.Child(i)
		      oItems = CreateItem(jItem,rs)
		      For each oItem as BKS_Shorts.Item in oItems
		        if jItem.Lookup("visible",True).BooleanValue then
		          oRow.Append oItem
		        end if
		      next
		    next
		  end if
		  
		  if padBottom > 0 then
		    oRect = new BKS_Shorts.RectItem(oRow.Bounds.Left, oRow.Bounds.Top + oRow.Bounds.Height, 1, padBottom)
		    oRect.Style.LineWidth = 0
		    oRect.Style.LineColor = cBandColor
		    oRect.Style.FillColor = cBandColor
		    oRow.Append oRect
		  end if
		  
		  if oRow.BorderTop = True then
		    oLine = New BKS_Shorts.LineItem(0,0,PageWidthPt,0)
		    oLine.Style.LineWidth = 1
		    oLine.Style.LineColor = &c00000000
		    oRow.append oLine
		  end if
		  
		  if oRow.BorderBottom = True then
		    oLine = New BKS_Shorts.LineItem(0,oRow.Bounds.Top + oRow.Bounds.Height-1,PageWidthPt,oRow.Bounds.Top + oRow.Bounds.Height-1)
		    oLine.Style.LineWidth = 1
		    oLine.Style.LineColor = &c00000000
		    oRow.append oLine
		  end if
		  
		  return oRow
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub CreateRows(oDBWrapper as PAF_DatabaseKit.DBWrapper, jBands() as JSONItem, arsSQL() as String, index as Integer = 0)
		  dim oRow as GroupItemPF
		  dim sql, arsFieldName(), arsFieldType() as String
		  dim arvFieldValue() as Variant
		  dim rs as RecordSet
		  dim iOddEvenCounter, trailingBandIndex as Integer
		  BuildBindArrays(arsFieldName,arsFieldType,arvFieldValue)
		  // Be sure we have more levels to process
		  if index <= arsSQL.Ubound then
		    trailingBandIndex = GetTrailingBandIndex(jBands,index)
		    // Grab the sql for this level
		    sql = arsSQL(index)
		    if sql <> "" then
		      // Top level may not have "?" placeholders so don't process level 0
		      // extract any fieldnames from sql
		      if index > 0 then
		        AppendBindArrays(sql,arsFieldName,arsFieldType,arvFieldValue)
		      end if
		      // grab the RecordSet
		      rs = GetRecords(sql,arsFieldName,arsFieldType,arvFieldValue)
		      if oDBWrapper.Error then
		        System.DebugLog "Database Error" + EndOfLine + sql + EndOfLine + oDBWrapper.ErrorMessage
		      end if
		      if rs <> nil and not rs.EOF then
		        while not rs.EOF
		          // add row to report
		          oRow = CreateRow(rs, jBands(index), iOddEvenCounter mod 2 = 0)
		          iOddEvenCounter = iOddEvenCounter + 1
		          aroRows.Append oRow
		          // capture current field values
		          For i as integer = 1 to rs.FieldCount
		            fieldDict.Value(rs.IdxField(i).Name) = rs.IdxField(i).StringValue
		          next
		          // Recursion for next level
		          CreateRows(oDBWrapper, jBands, arsSQL,index + 1)
		          // Create trailing band if it exists
		          if trailingBandIndex <> - 1 then
		            oRow = CreateRow(rs, jBands(trailingBandIndex), iOddEvenCounter mod 2 = 0)
		            aroRows.Append oRow
		          end if
		          rs.MoveNext
		        wend
		      end if
		    end if
		  end if
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function CreateRTFItem(oItem as JSONItem, optional pic As Picture = nil) As BKS_Shorts.Item
		  dim sType, sData as String
		  dim iPosition() as Double
		  dim jPositionItems as JSONItem
		  
		  sType = oItem.Lookup("type","").StringValue
		  sData = oItem.Lookup("data","").StringValue
		  
		  jPositionItems = oItem.Child("position")
		  
		  For i as integer = 0 to jPositionItems.Count - 1
		    iPosition.Append jPositionItems.Value(i).IntegerValue
		  next
		  
		  select case sType
		    
		  case "text", "field"
		    
		    dim iLeft, iTop, iWidth, iHeight as Double
		    iLeft = jPositionItems.Value(0).DoubleValue
		    iTop = jPositionItems.Value(1).DoubleValue
		    iWidth = jPositionItems.Value(2).DoubleValue
		    iHeight = jPositionItems.Value(3).DoubleValue
		    
		    dim oRTFTextItem as New BKS_Shorts.RTFTextItem(sData,iLeft,iTop,iWidth,iHeight)
		    
		    Return oRTFTextItem
		    
		  case "line"
		    
		    dim x1,y1,x2,y2 as double
		    x1 = jPositionItems.Value(0).DoubleValue
		    y1 = jPositionItems.Value(1).DoubleValue
		    x2 = jPositionItems.Value(2).DoubleValue
		    y2 = jPositionItems.Value(3).DoubleValue
		    Return new BKS_Shorts.LineItem(x1,y1,x2,y2)
		    
		  case "image"
		    
		    dim iLeft, iTop, iWidth, iHeight as Double
		    iLeft = jPositionItems.Value(0).DoubleValue
		    iTop = jPositionItems.Value(1).DoubleValue
		    iWidth = jPositionItems.Value(2).DoubleValue
		    iHeight = jPositionItems.Value(3).DoubleValue
		    
		    Dim p as Picture = PAF_PrintKit.ResolveImage(oItem.Lookup("name",""))
		    if p = nil then
		      p = new Picture(iWidth,iHeight)
		    end if
		    
		    Return new BKS_Shorts.ImageItem(p,iLeft,itop,iWidth,iHeight)
		    
		    
		  else
		    break
		  end Select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function DateFormatLocale(sFormat as string, d as xojo.Core.Date) As Text
		  Dim dOld As new Global.Date(d.Year,d.Month,d.day,d.Hour,d.Minute,d.Second)
		  
		  select case sFormat
		    
		  case "SQL_Date"
		    Return dOld.SQLDate.ToText
		  case "SQL_Time"
		    Return Right(dOld.SQLDateTime,8).ToText
		  case "SQL_Timestamp"
		    Return dOld.SQLDateTime.ToText
		  case "TS_FullMedium"
		    Return d.ToText(xojo.core.locale.current, xojo.core.Date.FormatStyles.Full, xojo.core.Date.FormatStyles.medium)
		  case "TS_FullShort"
		    Return d.ToText(xojo.core.locale.current, xojo.core.Date.FormatStyles.Full, xojo.core.Date.FormatStyles.Short)
		  case "D_FullNone"
		    Return d.ToText(xojo.core.locale.current, xojo.core.Date.FormatStyles.Full, xojo.core.Date.FormatStyles.None)
		  case "TS_LongMedium"
		    Return d.ToText(xojo.core.locale.current, xojo.core.Date.FormatStyles.Long, xojo.core.Date.FormatStyles.medium)
		  case "TS_LongShort"
		    Return d.ToText(xojo.core.locale.current, xojo.core.Date.FormatStyles.Long, xojo.core.Date.FormatStyles.Short)
		  case "D_LongNone"
		    Return d.ToText(xojo.core.locale.current, xojo.core.Date.FormatStyles.Long, xojo.core.Date.FormatStyles.None)
		  case "TS_MediumMedium"
		    Return d.ToText(xojo.core.locale.current, xojo.core.Date.FormatStyles.Medium, xojo.core.Date.FormatStyles.medium)
		  case "TS_MediumShort"
		    Return d.ToText(xojo.core.locale.current, xojo.core.Date.FormatStyles.Medium, xojo.core.Date.FormatStyles.Short)
		  case "D_MediumNone"
		    Return d.ToText(xojo.core.locale.current, xojo.core.Date.FormatStyles.Medium, xojo.core.Date.FormatStyles.None)
		  case "TS_ShortMedium"
		    Return d.ToText(xojo.core.locale.current, xojo.core.Date.FormatStyles.Short, xojo.core.Date.FormatStyles.medium)
		  case "TS_ShortShort"
		    Return d.ToText(xojo.core.locale.current, xojo.core.Date.FormatStyles.Short, xojo.core.Date.FormatStyles.Short)
		  case "D_ShortNone"
		    Return d.ToText(xojo.core.locale.current, xojo.core.Date.FormatStyles.Short, xojo.core.Date.FormatStyles.None)
		  case "T_NoneMedium"
		    Return d.ToText(xojo.core.locale.current, xojo.core.Date.FormatStyles.None, xojo.core.Date.FormatStyles.medium)
		  case "T_NoneShort"
		    Return d.ToText(xojo.core.locale.current, xojo.core.Date.FormatStyles.None, xojo.core.Date.FormatStyles.Short)
		  end select
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function DBFieldToPicture(oField As DatabaseField) As Picture
		  //##########################################################
		  //# There are many ways to store Picture info and it is    #
		  //# up to you to create the routines for converting either #
		  //# the databasefield value into a picture or to fetch     #
		  //# the picture based on encoding, a path, url or whatever #
		  //##########################################################
		  
		  Select Case oDBWrapper.type
		    
		  case "SQLite"
		    
		    if oField.PictureValue <> nil then
		      
		      Return oField.PictureValue
		      
		    else
		      
		      Return Nil
		      
		    end if
		    
		  case "PostgreSQL"
		    
		    If Len(oField.StringValue)>0 then
		      
		      Dim picString as string = DecodeHex(oField.StringValue)
		      Dim p as Picture = Picture.FromData(picString)
		      
		      Return p
		      
		    else
		      
		      Return nil
		      
		    end if
		    
		  case "ODBC"
		    
		    'if Len(oField.StringValue)>0 then
		    
		  case "MySQL"
		    
		    
		    
		  else
		    
		    Return nil
		    
		  end Select
		  
		  Return nil
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub ExtractBandInfo(jBands As JSONItem)
		  Dim jBand As JSONItem
		  
		  For i as integer = 0 to jBands.Count - 1
		    jBand = jBands.Child(i)
		    if jBand.Value("type") = "Header" then
		      jHeader = jBand
		      dHeaderHeight = GetHeaderHeight(jHeader)
		    elseif jBand.Value("type") = "Footer" then
		      jFooter = jBand
		      dFooterHeight = GetFooterHeight(jFooter)
		      dFooterTop = jBand.Lookup("top",0.0)
		    else
		      jReportOrder.Append jBand
		    end if
		  next
		  
		  
		  if jFooter <> nil then
		    jFooter.Value("top") = PageHeightPt - BottomMarginPt - dFooterHeight
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetFooterHeight(jFooter as JSONItem) As Double
		  dim oRow as GroupItemPF = CreateRow(jFooter)
		  
		  Return oRow.Bounds.Height
		  
		  
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetHeaderHeight(jHeader as JSONItem) As Double
		  dim oRow as GroupItemPF = CreateRow(jHeader)
		  
		  if jHeader.Lookup("borderBottom",False).BooleanValue = True then
		    
		    Return oRow.Bounds.Height + 1
		    
		  else
		    
		    Return oRow.Bounds.Height
		    
		  end if
		  
		  
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPageHeight() As Double
		  Return PageHeightPt
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetPageWidth() As Double
		  Return PageWidthPt
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetRecords(sql As String, arsFieldName() As String, arsFieldType() As String, arvFieldValue() As Variant) As RecordSet
		  Select Case oDBWrapper.type
		    
		  case "PostgreSQL"
		    
		    Return GetRecordsPostgreSQL(sql,arsFieldName,arsFieldType,arvFieldValue)
		    
		  case "SQLite"
		    
		    Return GetRecordsSQLite(sql,arsFieldName,arsFieldType,arvFieldValue)
		    
		  case "CubeSQL"
		    
		    Return GetRecordsCubeSQL(sql,arsFieldName,arsFieldType,arvFieldValue)
		    
		  case "ODBC"
		    
		    Return GetRecordsODBC(sql,arsFieldName,arsFieldType,arvFieldValue)
		    
		  case "MySQL"
		    
		    Return GetRecordsMySQL(sql,arsFieldName,arsFieldType,arvFieldValue)
		    
		  end Select
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetRecordsCubeSQL(sql As String, arsFieldName() As String, arsFieldType() As String, arvFieldValue() As Variant) As RecordSet
		  #if PAF_DatabaseKit.Settings.kUseCubeSQL then
		    
		    Dim vm As Variant = oDBWrapper.PrepareCube(sql)
		    
		    Dim ps As CubeSQLVM = CubeSQLVM(vm)
		    
		    if oDBWrapper.Error then system.DebugLog "Database Error: " + oDBWrapper.ErrorMessage
		    
		    for i as integer = 0 to arsFieldName.Ubound
		      
		      select case arsFieldType(i)
		        
		      case "String"
		        
		        CubeSQLVM(ps).BindText(i+1,arvFieldValue(i))
		        
		      case "Integer"
		        
		        CubeSQLVM(ps).BindInt(i+1,arvFieldValue(i))
		        
		      case "Double"
		        
		        CubeSQLVM(ps).BindDouble(i+1,arvFieldValue(i))
		        
		      case "Date"
		        
		        dim d As new date(arvFieldValue(i).DateValue)
		        
		        CubeSQLVM(ps).BindText(i+1, d.SQLDateTime)
		        
		      end select
		    next
		    
		    Return ps.VMSelect()
		    
		  #endif
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function GetRecordsetForAddTable() As RecordSet
		  dim sql As String
		  
		  DictPageBreak = new Dictionary 'keeps track of page break by section
		  DictRepeatRow = New Dictionary 'keeps track of breaks that cross page - repeating on each page
		  fieldDict = new Dictionary
		  
		  if oDBWrapper <> nil and oDBWrapper.type = "SQLite" then
		    SQLiteDatabase(oDBWrapper).ShortColumnNames = false
		  end if
		  
		  LoadQueryConditions
		  
		  // Build an array of the band ordering (jReportOrder)
		  dim jBands as JSONItem = ReportJSON.Lookup("Bands",nil)
		  if jBands <> nil then
		    
		    Dim jBand As JSONItem
		    
		    For i as integer = 0 to jBands.Count - 1
		      jBand = jBands.Child(i)
		      if jBand.Value("type") = "Body" then
		        sql = jBand.Lookup("sql","")
		        exit
		      end if
		    next
		    
		    dim arsFieldName(), arsFieldType() as String
		    dim arvFieldValue() as Variant
		    
		    BuildBindArrays(arsFieldName,arsFieldType,arvFieldValue)
		    
		    Return GetRecords(sql,arsFieldName,arsFieldType,arvFieldValue)
		  end if
		  
		  
		  Return nil
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetRecordsMySQL(sql As String, arsFieldName() As String, arsFieldType() As String, arvFieldValue() As Variant) As RecordSet
		  #if PAF_DatabaseKit.Settings.kUseMySQL then
		    
		    Dim ps As PreparedSQLStatement = MySQLPreparedStatement(oDBWrapper.Prepare(sql))
		    
		    for i as integer = 0 to arsFieldName.Ubound
		      
		      ps.BindType(i, oDBWrapper.BindType(arsFieldName(i)))
		      ps.Bind(i,arvFieldValue(i))
		      
		    next
		    
		    Return ps.SQLSelect
		  #Endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetRecordsODBC(sql As String, arsFieldName() As String, arsFieldType() As String, arvFieldValue() As Variant) As RecordSet
		  #if PAF_DatabaseKit.Settings.kUseODBC then
		    Dim ps As PreparedSQLStatement = ODBCPreparedStatement(oDBWrapper.Prepare(sql))
		    
		    'break ' note only string and date have been implemented
		    
		    For i as integer = 0 to arsFieldName.Ubound
		      
		      ps.BindType(i, oDBWrapper.BindType(arsFieldName(i)))
		      ps.Bind(i,arvFieldValue(i))
		      
		    next
		    
		    Return ps.SQLSelect
		  #Endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetRecordsPostgreSQL(sql As String, arsFieldName() As String, arsFieldType() As String, arvFieldValue() As Variant) As RecordSet
		  #if PAF_DatabaseKit.Settings.kUsePostgreSQL then
		    Dim ps As PreparedSQLStatement
		    
		    // Update placeholders for PostgreSQL (? -> $1, $2...)
		    sql = PAF_DatabaseKit.PostgreSQLChangePlaceholders(sql)
		    
		    ps = PostgreSQLPreparedStatement(oDBWrapper.Prepare(sql))
		    
		    For i as integer = 0 to arsFieldName.Ubound
		      
		      if arsFieldType(i) = "Date" then
		        
		        dim d as New Date
		        d.SQLDate = arvFieldValue(i)
		        
		        ps.Bind(i, d)
		        
		      else
		        
		        ps.Bind(i, arvFieldValue(i))
		        
		      end if
		      
		    Next
		    
		    Return ps.SQLSelect
		  #Endif
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetRecordsSQLite(sql As String, arsFieldName() As String, arsFieldType() As String, arvFieldValue() As Variant) As RecordSet
		  Dim ps As PreparedSQLStatement = SQLitePreparedStatement(oDBWrapper.Prepare(sql))
		  
		  For i as integer = 0 to arsFieldName.Ubound
		    
		    ps.BindType(i, oDBWrapper.BindType(arsFieldName(i)))
		    ps.Bind(i,arvFieldValue(i))
		    
		  next
		  
		  Return ps.SQLSelect
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function GetTrailingBandIndex(jBands() as JSONItem, index as Integer) As Integer
		  dim groupBy as String = jBands(index).Lookup("groupBy","")
		  
		  if groupby = "" then Return -1
		  
		  For i as integer = 0 to jBands.Ubound
		    
		    if jBands(i).Lookup("type","") = "Trailing" then 'or jBands(i).Lookup("type","") = "Grand Summary Trailing" then
		      
		      if jBands(i).Lookup("groupBy","") = groupby then
		        
		        Return i
		        
		      end if
		      
		    end if
		    
		  next
		  
		  Return -1
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub LoadQueryConditions()
		  dim jWhereConditions As JSONItem = ReportJSON.Lookup("WhereConditions",nil)
		  
		  dim jWhere as JSONItem
		  
		  if jWhereConditions <> nil then
		    
		    For i as integer = 0 to jWhereConditions.Count - 1
		      
		      jWhere = jWhereConditions.Child(i)
		      
		      aroWhereConditions.Append New PAFQueryCondition(jWhere)
		      
		    next
		    
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function NewPage(optional iRowIndex As Integer) As BKS_Shorts.Page
		  dim oPage as new BKS_Shorts.Page(PageWidthPt, PageHeightPt, StyleDict.Value("DefaultStyle"))
		  dim oRow As GroupItemPF
		  
		  // add header
		  if jHeader <> nil then
		    orow = CreateRow(jHeader)
		    ApplyRowColoring(oRow)
		    oPage.Append oRow 'ApplyRowColoring(CreateRow(jHeader))
		  end if
		  
		  
		  
		  Return oPage
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function ProcessBandScript(rs As RecordSet, jBand As JSONItem) As JSONItem
		  Dim oBand As PAF_PrintKit.PrintBand = New PAF_PrintKit.PrintBand(jBand,Designer)
		  Dim errorString As String
		  
		  // process the band script
		  if oBand.Script <> "" then
		    
		    Dim DictFields As New Dictionary
		    
		    if rs <> nil then
		      For i as integer = 0 to rs.FieldCount - 1
		        
		        DictFields.Value(rs.IdxField(i+1).Name) = rs.IdxField(i+1).Value
		        
		      next
		    end if
		    
		    ScriptRunner.Context = New ScriptContext(oBand,DictFields)
		    ScriptRunner.Source = oBand.Script
		    
		    if ScriptRunner.Precompile(XojoScript.OptimizationLevels.None) then
		      ScriptRunner.run
		    else
		      
		      if oBand.BandType = "Break" or oBand.BandType = "Trailing" then
		        errorString = oBand.BandType + "_" + oBand.GroupBy + EndOfLine + ScriptRunner.LastError
		      else
		        errorString = oBand.BandType + EndOfLine + ScriptRunner.LastError
		      end if
		      
		      if ScriptError.IndexOf(errorString) = -1 then
		        ScriptError.Append errorString
		      end if
		      
		    end if
		    
		  end if
		  
		  Return oBand.SerializeJSON
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Function RepeatEachPage(oPage As BKS_Shorts.Page, iRowIndex As Integer) As Double
		  Dim iBreak as Integer = 0
		  Dim oRepeatRow As GroupItemPF
		  Dim dNewTop as Double = dHeaderHeight
		  
		  while iBreak < iRowIndex
		    if DictRepeatRow.HasKey(iBreak) then
		      oRepeatRow = DictRepeatRow.Value(iBreak)
		      oRepeatRow.top = dNewtop
		      oPage.Append oRepeatRow
		      dNewtop = dNewtop + oRepeatRow.Bounds.Height
		    end if
		    iBreak = iBreak + 1
		  wend
		  
		  Return dNewTop
		End Function
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetupDocumentSettings(jSetup as JSONItem)
		  Dim bApplyDefaults As Boolean = false
		  
		  if jSetup <> nil then
		    Dim sSetup As string = DecodeBase64(jSetup.Lookup("setupString","").StringValue.DefineEncoding(Encodings.UTF8))
		    if sSetup <> "" then
		      Dim ps as new PrinterSetup
		      ps.SetupString = sSetup
		      if ps = nil then
		        bApplyDefaults = true
		      else
		        Dim scale As Double
		        scale = ps.HorizontalResolution/72
		        PageWidthPt = ps.PageWidth/scale
		        PageHeightPt = ps.PageHeight/scale
		        LeftMarginPt = (abs(ps.PageLeft)/scale)/2
		        RightMarginPt = LeftMarginPt
		        TopMarginPt = (abs(ps.PageTop)/scale)/2
		        BottomMarginPt = TopMarginPt
		      end if
		    end if
		  else
		    bApplyDefaults = true
		  end if
		  
		  if bApplyDefaults then
		    // default settings
		    PageWidthPt = 612
		    PageHeightPt = 792
		    LeftMarginPt = 18
		    RightMarginPt = 18
		    BottomMarginPt = 18
		    TopMarginPt = 18
		  end if
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h21
		Private Sub SetupStyles(jStyles as JSONItem)
		  dim oStyle as BKS_Shorts.StyleSet
		  dim jStyle as JSONItem
		  dim styleName as String
		  
		  for i as integer = 0 to jStyles.Count - 1
		    jStyle = jStyles(i)
		    jStyle.Compact = false
		    oStyle = new BKS_Shorts.StyleSet
		    
		    oStyle.TextFont = jStyle.lookup("TextFont","Arial").StringValue
		    oStyle.TextColor = jStyle.Lookup("TextColor",&c00000000).ColorValue
		    oStyle.TextSize = jStyle.Lookup("TextSize",12).IntegerValue
		    oStyle.TextBold = jStyle.Lookup("Bold",false).BooleanValue
		    oStyle.TextItalic = jStyle.Lookup("Italic",false).BooleanValue
		    oStyle.TextUnderline = jStyle.Lookup("Underline",false).BooleanValue
		    
		    select case jStyle.Lookup("TextAlign","Left").StringValue
		    case "Left"
		      oStyle.TextAlign = BKS_Shorts.TextAlignment.Left
		    case "Right"
		      oStyle.TextAlign = BKS_Shorts.TextAlignment.Right
		    case "Center"
		      oStyle.TextAlign = BKS_Shorts.TextAlignment.Center
		    end select
		    
		    oStyle.LineColor = jStyle.lookup("LineColor",&c000000).ColorValue
		    oStyle.FillColor = jStyle.Lookup("FillColor",&cFFFFFFFF).ColorValue
		    oStyle.LineWidth = jStyle.lookup("LineWidth",1.0).DoubleValue
		    styleName = jStyle.Lookup("name","DefaultStyle").StringValue
		    StyleDict.Value(styleName) = oStyle
		    
		  next
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h21
		Private aroPage() As BKS_Shorts.Page
	#tag EndProperty

	#tag Property, Flags = &h21
		Private aroRows() As GroupItemPF
	#tag EndProperty

	#tag Property, Flags = &h21
		Private aroWhereConditions() As PAFQueryCondition
	#tag EndProperty

	#tag Property, Flags = &h21
		Private BottomMarginPt As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		Designer As PAF_PrintKit.DesignCanvas
	#tag EndProperty

	#tag Property, Flags = &h21
		Private dFooterHeight As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private dFooterTop As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private dHeaderHeight As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private DictPageBreak As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private DictRepeatRow As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private fieldDict As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private jFooter As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private jHeader As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private jReportOrder() As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private LeftMarginPt As Double
	#tag EndProperty

	#tag Property, Flags = &h0
		oDBWrapper As PAF_DatabaseKit.DBWrapper
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PageHeightPt As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private PageWidthPt As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ReportJSON As JSONItem
	#tag EndProperty

	#tag Property, Flags = &h21
		Private RightMarginPt As Double
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ScriptError() As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private ScriptRunner As ScriptMaster
	#tag EndProperty

	#tag Property, Flags = &h21
		Private sSQL As String
	#tag EndProperty

	#tag Property, Flags = &h21
		Private StyleDict As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h21
		Private TopMarginPt As Double
	#tag EndProperty


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
End Class
#tag EndClass
