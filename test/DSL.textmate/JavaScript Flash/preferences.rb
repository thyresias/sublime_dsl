# encoding: utf-8

preferences 'Comments' => 'source.js.jsfl' do
  shell_variable 'TM_COMMENT_START', '// '
  shell_variable 'TM_COMMENT_START_2', '/*'
  shell_variable 'TM_COMMENT_END_2', '*/'
  uuid "A70164EE-FD9F-4448-8ED7-E599CBFC1E3B"
end

preferences 'Completions' => 'source.js.jsfl' do
  completions %w(
    accName actionScript actionsPanel activeEffect activeTool aliasText alignment
    allowSmoothing altIsDown angle antiAliasSharpness antiAliasThickness
    as3AutoDeclare as3Dialect as3ExportFrame as3PackagePaths as3StrictMode
    as3WarningsMode asVersion autoExpand autoKern autoLabel backgroundColor bitRate
    bits blendMode blurX blurY bold border bottomLeftRadius bottomRightRadius
    breakAtCorners brightness buttonTracking cacheAsBitmap capType category
    characterPosition characters characterSpacing childScreens closePath color
    colorAlphaAmount colorAlphaPercent colorArray colorBlueAmount colorBluePercent
    colorGreenAmount colorGreenPercent colorMode colorRedAmount colorRedPercent
    compilerErrors componentsPanel compressionType configDirectory configURI
    contactSensitiveSelection contours contrast convertStereoToMono createNewDocList
    createNewDocListType createNewTemplateList ctlIsDown currentFrame currentLayer
    currentPublishProfile currentScreen currentTimeline curve dash1 dash2
    defaultItem density depth description displayName distance docClass documents
    dotSize dotSpace drawingLayer duration edges effectName effects elements
    elementType embeddedCharacters embedRanges enabled endAngle face fillColor
    filters firstFrame focalPoint fontRenderingMode forceSimple frameCount frameRate
    frames groupName hasCustomEase hatchThickness height hidden hideObject
    highlightColor hPixels hue iconID id indent index inner innerRadius instanceName
    instanceType interior isDrawingObject isGroup isLine isMissing isOvalObject
    isRectangleObject italic items itemType itemURI jiggle joinType knockout
    labelType layer layerCount layers layerType left leftMargin length letterSpacing
    library libraryItem linearRGB lineSpacing lineType linkageBaseClass
    linkageClassName linkageExportForAS linkageExportForRS linkageExportInFirstFrame
    linkageIdentifier linkageImportForRS linkageURL listIndex livePreview locked
    lockFlag loop Math matrix maxCharacters miterLimit motionTweenOrientToPath
    motionTweenRotate motionTweenRotateTimes motionTweenScale motionTweenSnap
    motionTweenSync mouseIsDown mruRecentFileList mruRecentFileListType name
    nextScreen nPts objectDrawingMode orientation outline outputPanel overflow
    packagePaths parameters parentLayer parentScreen path pattern penDownLoc penLoc
    posArray position prevScreen projectURI publishProfile publishProfiles quality
    renderAsHTML rightMargin rootScreen rotate rotation sampleRate saturation
    scaleType scaleX scaleY scalingGrid scalingGridRect screenOutline screens
    scriptURI scrollable selectable selected selection selectionEnd selectionStart
    shadowColor shapeFill shapeTweenBlend shiftIsDown shortcut silent size skewX
    skewY soundEffect soundLibraryItem soundLoop soundLoopMode soundName soundSync
    sourceAutoUpdate sourceFile sourceFilePath sourceLibraryName space startAngle
    startFrame strength strokeHinting style symbolType tabIndex target textAttrs
    textRuns textType thickness timeline timelines toolObjs tools top topLeftRadius
    topRightRadius transformX transformY tweenEasing tweenType tx ty type url
    useDeviceFonts useImportedJPEGQuality useImportedMP3Quality useSingleEaseCurve
    useXMLToUI value valueType variableName variation verbose version vertices
    videoType viewMatrix visible vPixels waveHeight waveLength width xmlui
    zoomFactor accept activate addCubicCurve addCurve addData addDataToDocument
    addDataToSelection addEventListener addFile addFilter addItem addItemToDocument
    addMotionGuide addNewItem addNewLayer addNewLine addNewOval addNewPublishProfile
    addNewRectangle addNewScene addNewText addPoint alert align allowScreens arrange
    beginDraw beginEdit beginFrame breakApart browseForFileURL browseForFolderURL
    cancel canEditSymbol canPublish canPublishProject canRevert canSaveAVersion
    canTest canTestMovie canTestProject canTestScene changeFilterOrder clear
    clearFrames clearKeyframes clipCopy clipCopyString clipCut clipPaste close
    closeAll closeAllPlayerDocuments closeDocument closeProject concatMatrix
    configureEffect configureTool confirm constrainPoint convertLinesToFills
    convertToBlankKeyframes convertToCompiledClip convertToKeyframes convertToSymbol
    copy copyFrames copyMotion copyMotionAsAS3 copyScreenFromFile createDocument
    createFolder createMotionTween createProject crop cubicCurveTo curveTo cutFrames
    deactivate deleteEdge deleteEnvelope deleteItem deleteLayer deletePublishProfile
    deleteScene deleteScreen deleteSelection disableAllFilters disableFilter
    disableOtherFilters distribute distributeToLayers documentHasData
    downloadLatestVersion drawPath duplicateItem duplicatePublishProfile
    duplicateScene duplicateScreen duplicateSelection editItem editScene
    enableAllFilters enableFilter enableImmediateUpdates enablePIControl endDraw
    endEdit endFrame enterEditMode executeEffect exists exitEditMode expandFolder
    exportPNG exportPublishProfile exportSWC exportSWF fileExists findDocumentDOM
    findDocumentIndex findItemIndex findLayerIndex findObjectInDocByName
    findObjectInDocByType findProjectItem get getAlignToDocument getAppMemoryInfo
    getAttributes getBits getBlendMode getClassForObject getControl
    getControlItemElement getCreationDate getCreationDateObj getCustomEase
    getCustomFill getCustomStroke getData getDataFromDocument getDocumentDOM getEdge
    getElementProperty getElementTextAttr getEnabled getFilters getFrameProperty
    getHalfEdge getItemProperty getItemType getKeyDown getLayerProperty getMetadata
    getMobileSettings getModificationDate getModificationDateObj getNext
    getOppositeHalfEdge getPersistentData getPlayerVersion getPrev getProject
    getScriptAssistMode getSelectedFrames getSelectedItems getSelectedLayers
    getSelectedScreens getSelectedText getSelectionRect getSize getText getTextAttr
    getTextString getTimeline getTransformationPoint getVertex getVisible group
    hasData hasPersistentData hasSelection importEmbeddedSWF importFile
    importPublishProfile importSWF insertBlankKeyframe insertFrames insertItem
    insertKeyframe insertNestedScreen insertScreen intersect invertMatrix itemExists
    keyDown keyUp lineTo listFolder makeShape mapPlayerURL match mouseClick
    mouseDblClk mouseDoubleClick mouseDown mouseMove mouseUp moveScreen
    moveSelectedBezierPointsBy moveSelectionBy moveTo moveToFolder newContour
    newFolder newPath notifySettingsChanged openDocument openProject openScript
    optimizeCurves pasteFrames pasteMotion pointDistance prompt publish
    publishProject punch quit read reload reloadEffects reloadTools remove
    removeAllFilters removeData removeDataFromDocument removeDataFromSelection
    removeEffect removeEventListener removeFilter removeFrames removeItem
    removePersistentData renameItem renamePublishProfile renameScene renameScreen
    reorderLayer reorderScene replaceSelectedText resetAS3PackagePaths
    resetOvalObject resetPackagePaths resetRectangleObject resetTransformation
    reverseFrames revert revertDocument revertDocumentToLastVersion
    revertToLastVersion rotateSelection runScript save saveAll saveAndCompact
    saveAVersion saveAVersionOfDocument saveDocument saveDocumentAs scaleSelection
    selectAll selectAllFrames selectElement selectItem selectNone selectTool set
    setActiveWindow setAlignToDocument setAttributes setBits setBlendMode setColor
    setControl setControlItemElement setControlItemElements setCurrentScreen
    setCursor setCustomEase setCustomFill setCustomStroke setElementProperty
    setElementTextAttr setEnabled setFillColor setFilterProperty setFilters
    setFrameProperty setIcon setInstanceAlpha setInstanceBrightness setInstanceTint
    setItemProperty setLayerProperty setLocation setMenuString setMetadata
    setMobileSettings setOptionsFile setOvalObjectProperty setPersistentData setPI
    setPlayerVersion setRectangleObjectProperty setScreenProperty
    setScriptAssistMode setSelectedFrames setSelectedLayers setSelectedScreens
    setSelection setSelectionBounds setSelectionRect setStroke setStrokeColor
    setStrokeSize setStrokeStyle setText setTextAttr setTextRectangle
    setTextSelection setTextString setToolName setToolTip setTransformationPoint
    setVisible showIdleMessage showLayerMasking showPIControl showTransformHandles
    skewSelection smoothSelection snapPoint space splitEdge straightenSelection
    swapElement swapStrokeAndFill synchronizeDocumentWithHeadVersion
    synchronizeWithHeadVersion test testMovie testProject testScene trace
    traceBitmap transformSelection unGroup union unlockAllElements updateItem write
    xmlPanel actionsPanel BitmapInstance BitmapItem CompiledClipInstance
    compilerErrors ComponentInstance componentsPanel Contour Document drawingLayer
    Edge Effect Element Fill Filter fl FLfile folderItem fontItem Frame HalfEdge
    Instance Item Layer library Math Matrix outputPanel Oval Parameter Path Project
    ProjectItem Rectangle Screen ScreenOutline Shape SoundItem Stroke SymbolInstance
    SymbolItem Text TextAttrs TextRun Timeline ToolObj Tools Vertex VideoItem XMLUI
  )
  uuid "E4ACF90F-4643-4E3C-83FE-06C4464247A2"
end

preferences 'Symbol List: Hidden' => 'source.js.jsfl meta.property.function entity.name.function', file: 'Symbol List Banned' do
  show_in_symbol_list false
  uuid "2DDE2259-EE26-4344-AC47-652D1AA90C7A"
end
