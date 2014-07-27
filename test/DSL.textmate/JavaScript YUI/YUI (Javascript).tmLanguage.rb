# encoding: utf-8

language 'Javascript (YUI)' => 'source.js.yui', file: 'YUI (Javascript)' do
  # Yahoo User Interface Library 2.8.0
  # FIXME: no file types
  key_equivalent "^~J"  # TextMate only
  uuid "62E7EF93-5574-4063-BF18-AD38620236B9"  # TextMate only

  rule 'support.class.js.yui' do
    match %r/\b(YAHOO|YAHOO_config)\b/
  end
  rule 'support.class.js.yui' do
    match %r/\.(util|lang|env|widget|example)\b/
  end
  rule 'support.class.js.yui' do
    match %r/\.(CustomEvent|Subscriber|Event|EventProvider|Dom|Point|Region|Connect|DD|DDProxy|DDTarget|DragDrop|DragDropMgr|DDM|Anim|AnimMgr|Bezier|ColorAnim|Easing|Motion|Scroll|AutoComplete|DataSource|DS_JSArray|DS_JSFunction|DS_XHR|Config|KeyListener|Attribute|AttributeProvider|Element|History|Cookie|Get|ImageLoader|Resize|Selector|Storage|StorageEngineGears|StorageEngineHTML5|StorageEngineKeyed|StorageEngineSWF|StorageEvent|StorageManager|SWFStore|StyleSheet|YUILoader)\b/
  end
  rule 'support.class.js.yui' do
    match %r/\.(AutoComplete|DataSource|DS_JSArray|DS_JSFunction|DS_XHR|Calendar|Calendar2up|Calendar_Core|CalendarGroup|DateMath|Module|Overlay|OverlayManager|Tooltip|Panel|Dialog|SimpleDialog|ContainerEffect|Logger|LogMsg|LogReader|LogWriter|Menu|MenuItem|Menubar|MenuBarItem|MenuManager|MenuModule|MenuModuleItem|ContextMenu|ContextMenuItem|Slider|SliderThumb|Tab|TabView|TreeView|Node|HTMLNode|MenuNode|TextNode|RootNode|TVAnim|TVFadeIn|TVFadeOut|Column|ColumnEditor|ColumnSet|DataTable|Record|RecordSet|Sort|WidthResizer|SWF|DateCellEditor|DropdownCellEditor|RadioCellEditor|ScrollingDataTable|TextareaCellEditor|TextboxCellEditor)\b/
  end
  rule 'support.function.YAHOO.js.yui' do
    match %r/\.(log|namespace|register)\b(?=\()/
  end
  rule 'support.function.lang.js.yui' do
    match %r/\.(augment|augmentObject|augmentProto|dump|extend|hasOwnProperty|isArray|isBoolean|isFunction|isNull|isNumber|isObject|isString|isUndefined|isValue|later|merge|substitute|trim|JSON)\b(?=\()/
  end
  rule 'support.function.Subscriber.js.yui' do
    match %r/\.(getScope)\b(?=\()/
  end
  rule 'support.function.CustomEvent.js.yui' do
    match %r/\.(fire|subscribe|unsubscribe|unsubscribeAll)\b(?=\()/
  end
  rule 'support.function.Event.js.yui' do
    match %r/\.(addListener|clearCache|delegate|fireLegacyEvent|generateId|getCharCode|getEl|getEvent|getLegacyIndex|getListeners|getPageX|getPageY|getRelatedTarget|getTarget|getTime|getXY|on|onAvailable|onContentReady|onDOMReady|preventDefault|purgeElement|removeListener|resolveTextNode|startInterval|stopEvent|stopPropagation|useLegacyEvent)\b(?=\()/
  end
  rule 'support.function.EventProvider.js.yui' do
    match %r/\.(createEvent|fireEvent|hasEvent|subscribe|unsubscribe)\b(?=\()/
  end
  rule 'support.function.Dom.js.yui' do
    match %r/\.(addClass|batch|generateId|get|getAncestorBy|getAncestorByClassName|getAncestorByTagName|getAttribute|getChildren|getChildrenBy|getClientHeight|getClientWidth|getClientRegion|getDocumentHeight|getDocumentScrollLeft|getDocumentScrollTop|getDocumentWidth|getElementBy|getElementsBy|getElementsByClassName|getFirstChild|getFirstChildBy|getLastChild|getLastChildBy|getNextSibling|getNextSiblingBy|getPreviousSibling|getPreviousSiblingBy|getRegion|getStyle|getViewportHeight|getViewportWidth|getX|getXY|getY|hasClass|inDocument|insertAfter|insertBefore|isAncestor|removeClass|replaceClass|setAttribute|setStyle|setX|setXY|setY)\b(?=\()/
  end
  rule 'support.function.Region.js.yui' do
    match %r/\.(contains|getArea|intersect|union|getRegion)\b(?=\()/
  end
  rule 'support.function.Connect.js.yui' do
    match %r/\.(abort|appendPostData|asyncRequest|createExceptionObject|createFrame|createResponseObject|createXhrObject|getConnectionObject|handleReadyState|handleTransactionResponse|initHeader|isCallInProgress|releaseObject|resetDefaultHeaders|resetFormState|setDefaultPostHeader|setDefaultXhrHeader|setForm|setHeader|setPollingInterval|setProgId|uploadFile)\b(?=\()/
  end
  rule 'support.function.Anim.js.yui' do
    match %r/\.(animate|doMethod|getAttribute|getDefaultUnit|getEl|getStartTime|init|isAnimated|onTween|setAttribute|setEl|setRuntimeAttribute|stop|toString)\b(?=\()/
  end
  rule 'support.function.AnimMgr.js.yui' do
    match %r/\.(correctFrame|registerElement|run|start|stop|unRegister)\b(?=\()/
  end
  rule 'support.function.Bezier.js.yui' do
    match %r/\.(getPosition)\b(?=\()/
  end
  rule 'support.function.ColorAnim.js.yui' do
    match %r/\.(parseColor)\b(?=\()/
  end
  rule 'support.function.Easing.js.yui' do
    match %r/\.(backBoth|backIn|backOut|bounceBoth|bounceIn|bounceOut|easeBoth|easeBothStrong|easeIn|easeInStrong|easeNone|easeOut|easeOutStrong|elasticBoth|elasticIn|elasticOut)\b/
  end
  rule 'support.function.Motion.js.yui' do
    match %r/\.()\b(?=\()/
  end
  rule 'support.function.Scroll.js.yui' do
    match %r/\.()\b(?=\()/
  end
  rule 'support.function.DragDrop.js.yui' do
    match %r/\.(addInvalidHandleClass|addInvalidHandleId|addInvalidHandleType|addToGroup|applyConfig|b4Drag|b4DragDrop|b4DragOut|b4DragOver|b4EndDrag|b4MouseDown|b4StartDrag|clearConstraints|clearTicks|endDrag|getDragEl|getEl|getTick|handleMouseDown|handleOnAvailable|init|initTarget|isLocked|isValidHandleChild|lock|onAvailable|onDrag|onDragDrop|onDragEnter|onDragOut|onDragOver|onInvalidDrop|onMouseDown|onMouseUp|padding|removeFromGroup|removeInvalidHandleClass|removeInvalidHandleId|removeInvalidHandleType|resetContraints|setDragElId|setHandleElId|setInitPosition|setOuterHandleElId|setPadding|setStartPosition|setXConstraint|setXTicks|setYConstraint|setYTicks|startDrag|unlock|unreg)\b(?=\()/
  end
  rule 'support.function.DragDropMgr.js.yui' do
    match %r/\.(fireEvents|getBestMatch|getClientHeight|getClientWidth|getCss|getDDById|getElement|getElWrapper|getLocation|getPosX|getPosY|getRelated|getScrollLeft|getScrollTop|getStyle|handleMouseDown|handleMouseMove|handleMouseUp|handleWasClicked|init|isDragDrop|isHandle|isLegalTarget|isLocked|isOverTarget|isTypeOfDD|lock|moveToEl|numericSort|refreshCache|regDragDrop|regHandle|removeDDFromGroup|startDrag|stopDrag|stopEvent|swapNode|unlock|unregAll|verifyEl)\b(?=\()/
  end
  rule 'support.function.DD.js.yui' do
    match %r/\.(alignElWithMouse|applyConfig|autoOffset|autoScroll|cachePosition|getTargetCoord|setDelta|setDragElPos)\b(?=\()/
  end
  rule 'support.function.DDProxy.js.yui' do
    match %r/\.(createFrame|initFrame|showFrame)\b(?=\()/
  end
  rule 'support.function.DDTarget.js.yui' do
    match %r/\.()\b(?=\()/
  end
  rule 'support.function.History.js.yui' do
    match %r/\.(getBookmarkedState|getCurrentState|getQueryStringParameter|initialize|multiNavigate|navigate|onReady|register)\b(?=\()/
  end
  rule 'support.function.DataSource.js.yui' do
    match %r/\.(addToCache|flushCache|getCachedResponse|handleResponse|isCacheHit|makeConnection|parseArrayData|parseJSONData|parseTextData|parseXMLData|sendRequest)\b(?=\()/
  end
  rule 'support.function.AutoComplete.js.yui' do
    match %r/\.(doBeforeExpandContainer|formatResult|getListItemData|getListItems|isContainerOpen|sendQuery|setBody|setFooter|setHeader)\b(?=\()/
  end
  rule 'support.function.DS_JSArray.js.yui' do
    match %r/\.()\b(?=\()/
  end
  rule 'support.function.DS_JSFunction.js.yui' do
    match %r/\.()\b(?=\()/
  end
  rule 'support.function.DS_XHR.js.yui' do
    match %r/\.(parseResponse)\b(?=\()/
  end
  rule 'support.function.Calendar.js.yui' do
    match %r/\.(addMonthRenderer|addMonths|addRenderer|addWeekdayRenderer|addYears|applyListeners|buildDayLabel|buildMonthLabel|buildWeekdays|clear|clearAllBodyCellStyles|clearElement|configClose|configIframe|configLocale|configLocaleValues|configMaxDate|configMinDate|configOptions|configPageDate|configSelected|configTitle|deselect|deselectAll|deselectCell|doCellMouseOut|doCellMouseOver|doSelectCell|getDateByCellId|getDateFieldsByCellId|getSelectedDates|hide|init|initEvents|initStyles|isDateOOM|nextMonth|nextYear|onBeforeDeselect|onBeforeSelect|onChangePage|onClear|onDeselect|onRender|onReset|onSelect|previousMonth|previousYear|refreshLocale|render|renderBody|renderBodyCellRestricted|renderCellDefault|renderCellNotThisMonth|renderCellStyleHighlight1|renderCellStyleHighlight2|renderCellStyleHighlight3|renderCellStyleHighlight4|renderCellStyleSelected|renderCellStyleToday|renderFooter|renderHeader|renderOutOfBoundsDate|renderRowFooter|renderRowHeader|reset|resetRenderers|select|selectCell|setMonth|setYear|show|styleCellDefault|subtractMonths|substractYears|validate)\b(?=\()/
  end
  rule 'support.function.CalendarGroup.js.yui' do
    match %r/\.(addMonthRenderer|addMonths|addRenderer|addWeekdayRenderer|addYears|callChildFunction|clear|configPageDate|configPages|constructChild|delegateConfig|deselect|deselectAll|deselectCell|getSelectedDates|init|initEvents|nextMonth|nextYear|previousMonth|previousYear|render|renderFooter|renderHeader|reset|select|selectCell|setChildFunction|setMonth|setYear|sub|subtractMonths|subtractYears|unsub)\b(?=\()/
  end
  rule 'support.function.DateMath.js.yui' do
    match %r/\.(add|after|before|between|clearTime|findMonthEnd|findMonthStart|getDayOffset|getJan1|getWeekNumber|isMonthOverlapWeek|isYearOverlapWeek|subtract)\b(?=\()/
  end
  rule 'support.function.Config.js.yui' do
    match %r/\.(addProperty|alreadySubscribed|applyConfig|checkBoolean|checkNumber|fireEvent|fireQueue|getConfig|getProperty|init|outputEventQueue|queueProperty|refireEvent|refresh|resetProperty|setProperty|subscribeToConfigEvent|unsubscribeFromConfigEvent)\b(?=\()/
  end
  rule 'support.function.KeyListener.js.yui' do
    match %r/\.(disable|enable|handleKeyPress)\b(?=\()/
  end
  rule 'support.function.Module.js.yui' do
    match %r/\.(appendToBody|appendToFooter|appendToHeader|configMonitorResize|configVisible|destroy|hide|init|initDefaultConfig|initEvents|initResizeMonitor|onDomResize|render|setBody|setFooter|setHeader|show)\b(?=\()/
  end
  rule 'support.function.Overlay.js.yui' do
    match %r/\.(align|center|configConstrainToViewport|configContext|configFixedCenter|configHeight|configIframe|configVisible|configWidth|configX|configXY|configY|configZIndex|destroy|doCenterOnDOMEvent|enforceContraints|hideIframe|hideMacGeckoScrollbars|init|initDefaultConfig|initEvenrts|moveTo|onDomResize|showIframe|showMacGeckoScrollbars|syncPosition|windowResizeHandle|windowScrollHandler)\b(?=\()/
  end
  rule 'support.function.OverlayManager.js.yui' do
    match %r/\.(blurAll|compareZIndexDesc|find|focus|getActive|hideAll|init|initDefaultConfig|register|remove|showAll)\b(?=\()/
  end
  rule 'support.function.Tooltip.js.yui' do
    match %r/\.(configContainer|configContext|configText|doHide|doShow|init|initDefaultConfig|onContextMouseMove|onContextMouseOut|onContextMouseOver|preventOverlay)\b(?=\()/
  end
  rule 'support.function.Panel.js.yui' do
    match %r/\.(buildMask|buildWrapper|configClose|configDraggable|configHeight|configKeyListeners|configModal|configUnderlay|configWidth|configzIndex|hideMask|init|initDefaultConfig|initEvents|onDomResize|registerDragDrop|removeMask|render|showMask|sizeMask|sizeUnderlay)\b(?=\()/
  end
  rule 'support.function.Dialog.js.yui' do
    match %r/\.(blurButtons|cancel|configButtons|doSubmit|focusDefaultButton|focusFirst|focusFirstButton|focusLast|focusLastButton|getData|init|initDefaultConfig|initEvents|registerForm|submit|validate)\b(?=\()/
  end
  rule 'support.function.SimpleDialog.js.yui' do
    match %r/\.(configIcon|configText|init|initDefaultConfig|registerForm)\b(?=\()/
  end
  rule 'support.function.ContainerEffect.js.yui' do
    match %r/\.(animateIn|animateOut|FADE|handleCompleteAnimateIn|handleCompleteAnimateOut|handleStartAnimateIn|handleStartAnimateOut|handleTweenAnimateIn|handleTweenAnimateOut|init|SLIDE)\b(?=\()/
  end
  rule 'support.function.Logger.js.yui' do
    match %r/\.(disableBrowserConsole|enableBrowserConsole|getStack|getStartTime|log|reset)\b(?=\()/
  end
  rule 'support.function.LogMsg.js.yui' do
    match %r/\.()\b(?=\()/
  end
  rule 'support.function.LogReader.js.yui' do
    match %r/\.(formatMsg|getLastTime|hide|html2Text|pause|resume|setTitle|show)\b(?=\()/
  end
  rule 'support.function.LogWriter.js.yui' do
    match %r/\.(getSource|log|setSource)\b(?=\()/
  end
  rule 'support.function.Menu.js.yui' do
    match %r/\.(addItem|addItems|clearActiveItem|configContainer|configHideDelay|configIframe|configPosition|configVisible|destroy|disableAutoSubmenuDisplay|enforceConstraints|getItem|getItemGroups|getRoot|init|initDefaultConfig|initEvents|insertItem|onDomResize|removeItem|setInitialFocus|setInitialSelection|setItemGroupTitle)\b(?=\()/
  end
  rule 'support.function.MenuItem.js.yui' do
    match %r/\.(blur|configChecked|configDisabled|configEmphasis|configHelpText|configSelected|configStrongEmphasis|configSubmenu|configTarget|configText|configUrl|destroy|focus|getFirstItemIndex|getNextArrayItem|getNextEnabledSibling|getPreviousArrayItem|getPreviousEnabledSibling|init|initDefaultConfig|initHelpText|removeHelpText)\b(?=\()/
  end
  rule 'support.function.Menubar.js.yui' do
    match %r/\.(init|initDefaultConfig)\b(?=\()/
  end
  rule 'support.function.MenuBarItem.js.yui' do
    match %r/\.(init)\b(?=\()/
  end
  rule 'support.function.MenuManager.js.yui' do
    match %r/\.(addItem|addMenu|getMenu|getMenuRootElement|getMenus|hideVisible|onDOMEvent|onItemAdded|onItemDestroy|onItemRemoved|onMenuDestroy|onMenuVisibleConfigChange|removeItem|removeMenu)\b(?=\()/
  end
  rule 'support.function.MenuModule.js.yui' do
    match %r/\.()\b(?=\()/
  end
  rule 'support.function.MenuModuleItem.js.yui' do
    match %r/\.()\b(?=\()/
  end
  rule 'support.function.ContextMenu.js.yui' do
    match %r/\.(configTrigger|destroy|init|initDefaultConfig)\b(?=\()/
  end
  rule 'support.function.ContextMenuItem.js.yui' do
    match %r/\.(init)\b(?=\()/
  end
  rule 'support.function.Slider.js.yui' do
    match %r/\.(b4MouseDown|endMove|fireEvents|focus|getThumb|getValue|getXValue|getYValue|handleThumbChange|lock|moveOneTick|moveThumb|onChange|onDrag|onMouseDown|onSliderEnd|onSlideStart|setRegionValue|setSliderStartState|setThumbCenterPoint|setValue|thumbMouseUp|unlock|verifyOffset|getHorizSlider|getSliderRegion|getVertSlider)\b(?=\()/
  end
  rule 'support.function.SliderThumb.js.yui' do
    match %r/\.(clearTicks|getOffsetFromParent|getValue|getXValue|getYValue|initSlider|onChange)\b(?=\()/
  end
  rule 'support.function.AttributeProvider.js.yui' do
    match %r/\.(configureAttribute|fireBeforeChangeEvent|fireChangeEvent|get|getAttributeConfig|getAttributeKeys|refresh|register|resetAttributeConfig|resetValue|set|setAttributes)\b(?=\()/
  end
  rule 'support.function.Attribute.js.yui' do
    match %r/\.(configure|getValue|refresh|resetConfig|resetValue|setValue|getValue|refresh|resetConfig|resetValue|setValue)\b(?=\()/
  end
  rule 'support.function.Element.js.yui' do
    match %r/\.(addClass|addListener|appendChild|appendTo|fireQueue|getElementsByClassName|getElementsByTagName|getStyle|hasChildNodes|hasClass|initAttributes|insertBefore|on|removeChild|removeClass|removeListener|replaceChild|replaceClass|setStyle)\b(?=\()/
  end
  rule 'support.function.TabView.js.yui' do
    match %r/\.(addTab|contentTransition|createTabs|DOMEventHandler|getTab|getTabIndex|initAttributes|removeTab)\b(?=\()/
  end
  rule 'support.function.Tab.js.yui' do
    match %r/\.(initAttributes)\b(?=\()/
  end
  rule 'support.function.TreeView.js.yui' do
    match %r/\.(animateCollapse|animateExpand|collapseAll|collapseComplete|draw|expandAll|expandComplete|generateId|getEl|getNodeByIndex|getNodeByProperty|getNodesByProperty|getRoot|init|onCollapse|onExpand|popNode|regNode|removeChildren|removeNode|setCollapseAnim|setDynamicLoad|setExpandAnim|setUpLabel|addHandler|getNode|getTree|preload|removeHandler)\b(?=\()/
  end
  rule 'support.function.Node.js.yui' do
    match %r/\.(appendChild|appendTo|applyParent|collapseToggleStyle|collapseAll|completeRender|expand|expandAll|getAncestor|getChildrenEl|getChildrenElId|getChildrenHtml|getDepthStyle|getEl|getElId|getHoverStyle|getHtml|getIconMode|getNodeHtml|getSiblings|getStyle|getToggleEl|getToggleElId|getToggleLink|hasChildren|hideChildren|init|insertAfter|insertBefore|isChildOf|isDynamic|isRoot|loadComplete|refresh|renderChildren|setDynamicLoad|showChildren|toggle)\b(?=\()/
  end
  rule 'support.function.HTMLNode.js.yui' do
    match %r/\.(getContentEl)\b(?=\()/
  end
  rule 'support.function.MenuNode.js.yui' do
    match %r/\.()\b(?=\()/
  end
  rule 'support.function.TextNode.js.yui' do
    match %r/\.(getLabelEl|onLabelClick)\b(?=\()/
  end
  rule 'support.function.RootNode.js.yui' do
    match %r/\.()\b(?=\()/
  end
  rule 'support.function.TVAnim.js.yui' do
    match %r/\.(getAnim|isValid)\b(?=\()/
  end
  rule 'support.function.TVFadeIn.js.yui' do
    match %r/\.(animate|onComplete)\b(?=\()/
  end
  rule 'support.function.TVFadeOut.js.yui' do
    match %r/\.(animate|onComplete)\b(?=\()/
  end
  rule 'support.function.Column.js.yui' do
    match %r/\.(format|formatCheckbox|formatCurrency|formatDate|formatEmail|formatLink|formatNumber|formatSelect|getColSpan|getId|getRowSpan|parse|parseCheckbox|parseCurrency|parseDate|parseNumber|parseSelect|showEditor)\b(?=\()/
  end
  rule 'support.function.ColumnEditor.js.yui' do
    match %r/\.(createTextareaEditor|createTextboxEditor|getTextareaEditorValue|getTextboxEditorValue|getValue|hide|show|showTextareaEditor|showTextboxEditor)\b(?=\()/
  end
  rule 'support.function.ColumnSet.js.yui' do
    match %r/\.()\b(?=\()/
  end
  rule 'support.function.DataTable.js.yui' do
    match %r/\.(addRow|appendRow|deleteRow|deleteSelectedRows|doBeforeLoadData|editCell|focusTable|formatCell|getBody|getCell|getColumnSet|getHead|getRecordSet|getRow|getSelectedCells|getSelectedRecordIds|getSelectedRows|getTable|hideTableMessages|highlight|insertRows|isSelected|onDataReturnAppendRows|onDataReturnInsertRows|onDataReturnPaginateRows|onDataReturnReplaceRows|onEventEditCell|onEventFormatCell|onEventHighlightCell|onEventSelectCell|onEventSelectRow|onEventSortColumn|onEventUnhighlightCell|paginateRows|replaceRows|select|showEmptyMessage|showLoadingMessage|showPage|sortColumn|unhighlight|unselect|unselectedAllCells|unselectAllRows|updateRow)\b(?=\()/
  end
  rule 'support.function.Record.js.yui' do
    match %r/\.()\b(?=\()/
  end
  rule 'support.function.RecordSet.js.yui' do
    match %r/\.(addRecord|addRecords|append|deleteRecord|getLength|getRecord|getRecordBy|getRecordIndex|getRecords|insert|replace|reset|sort|updateRecord)\b(?=\()/
  end
  rule 'support.function.Sort.js.yui' do
    match %r/\.(compareAsc|compareDesc)\b(?=\()/
  end
  rule 'support.function.WidthResizer.js.yui' do
    match %r/\.(onDrag|onMouseDown|onMouseUp)\b(?=\()/
  end
  rule 'support.function.Cookie.js.yui' do
    match %r/\.(exists|get|getSub|getSubs|remove|removeSubs|set|setSub|setSubs)\b(?=\()/
  end
  rule 'support.function.Get.js.yui' do
    match %r/\.(abort|css|script)\b(?=\()/
  end
  rule 'support.function.ImageLoader.js.yui' do
    match %r/\.(bgImgObj|fetch|group|imgObj|pngBgImgObj|srcImgObj)\b(?=\()/
  end
  rule 'support.function.JSON.js.yui' do
    match %r/\.(dateToString|isSafe|parse|stringify|stringToDate)\b(?=\()/
  end
  rule 'support.function.Resize.js.yui' do
    match %r/\.(destroy|getActiveHandleEl|getProxyEl|getResizeById|getStatusEl|getWrapEl|isActive|isLocked|lock|reset|toString|unlock)\b(?=\()/
  end
  rule 'support.function.Selector.js.yui' do
    match %r/\.(filter|query|test)\b(?=\()/
  end
  rule 'support.function.Storage.js.yui' do
    match %r/\.(clear|getItem|getName|hasKey|key|setItem)\b(?=\()/
  end
  rule 'support.function.StorageManager.js.yui' do
    match %r/\.(get|register)\b(?=\()/
  end
  rule 'support.function.SWFStore.js.yui' do
    match %r/\.(addListener|calculateCurrentSize|clear|displaySettings|getItems|getLength|getModificationDate|getShareData|getTypeAt|getTypeOf|getUseCompression|getValueAt|getValueOf|hasAdequateDimensions|on|removeItem|setItem|setShareData|setSize|setUseCompression|toString)\b(?=\()/
  end
  rule 'support.function.SWF.js.yui' do
    match %r/\.(callSWF|toString)\b(?=\()/
  end
  rule 'support.function.StyleSheet.js.yui' do
    match %r/\.(disable|enable|getCssText|getId|isEnabled|set|isValidSelector|register|toCssText|unset)\b(?=\()/
  end
  rule 'support.function.YUILoader.js.yui' do
    match %r/\.(addModule|calculate|formatSkin|getProvides|getRequires|insert|loadNext|onFailure|onProgress|onSuccess|onTimeout|parseSkin|require|sandbox)\b(?=\()/
  end
  rule 'support.function.DateCellEditor.js.yui' do
    match %r/\.(focus|getInputValue|handleDisabledBtns|renderForm|resetForm)\b(?=\()/
  end
  rule 'support.function.DropdownCellEditor.js.yui' do
    match %r/\.(focus|getInputValue|handleDisabledBtns|renderForm|resetForm)\b(?=\()/
  end
  rule 'support.function.RadioCellEditor.js.yui' do
    match %r/\.(focus|getInputValue|handleDisabledBtns|renderForm|resetForm)\b(?=\()/
  end
  rule 'support.function.ScrollingDataTable.js.yui' do
    match %r/\.(disable|getBdContainerEl|getBdTableEl|getHdContainerEl|getHdTableEl|insertColumn|onColumnChange|removeColumn|reorderColumn|scrollTo|setColumnWidth|showTableMessage|validateColumnWidths)\b(?=\()/
  end
  rule 'support.function.TextareaCellEditor.js.yui' do
    match %r/\.(focus|getInputValue|handleDisabledBtns|move|renderForm|resetForm)\b(?=\()/
  end
  rule 'support.function.TextboxCellEditor.js.yui' do
    match %r/\.(focus|getInputValue|move|renderForm|resetForm)\b(?=\()/
  end
  include "source.js"
end
