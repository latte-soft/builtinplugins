local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.Src.ContextItems);
local v8 = require(l_Parent_0.Src.Components.InfoDialog);
local l_ToolParts_0 = script.Parent.ToolParts;
local v10 = require(l_ToolParts_0.ButtonGroup);
local v11 = require(l_ToolParts_0.LabeledElementPair);
local v12 = require(l_ToolParts_0.LocalImageSelector);
local v13 = require(l_ToolParts_0.MapSettingsWithPreviewFragment);
local v14 = require(l_ToolParts_0.Panel);
local v15 = require(l_ToolParts_0.MaterialSelector);
local v16 = require(l_ToolParts_0.ModeSelector);
local v17 = require(l_ToolParts_0.RegionFragment);
local _ = require(l_ToolParts_0.VolumeDragger);
local v19 = require(l_Parent_0.Src.Components.ProgressDialog);
local v20 = require(l_Parent_0.Src.Components.TeachingCallout);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v22 = require(l_Actions_0.ApplyToolAction);
local v23 = require(l_Actions_0.ChangePosition);
local v24 = require(l_Actions_0.ChangeSelection);
local v25 = require(l_Actions_0.ChangeSize);
local v26 = require(l_Actions_0.SelectColormap);
local v27 = require(l_Actions_0.SetColormapWarningId);
local v28 = require(l_Actions_0.SelectHeightmap);
local v29 = require(l_Actions_0.SetDefaultMaterial);
local v30 = require(l_Actions_0.SetImportMaterialMode);
local v31 = require(l_Actions_0.SetSnapToVoxels);
local v32 = require(l_Actions_0.SetSizeChangedByUser);
local v33 = require(l_Parent_0.Src.Util.Constants);
local v34 = require(l_Parent_0.Src.Util.TerrainEnums);
local l_ImportMaterialMode_0 = v34.ImportMaterialMode;
local l_HeightmapImporterService_0 = game:GetService("HeightmapImporterService");
local l_BrowserService_0 = game:GetService("BrowserService");
local l_TerrainEditorOverhaul_0 = game:GetFastFlag("TerrainEditorOverhaul");
local v39 = 4294967296 * v33.VOXEL_RESOLUTION ^ 3;
local function v57(v40, v41, v42)
    local v43 = {};
    if v40 and v40.file then
        local l_X_0 = v41.X;
        local l_Z_0 = v41.Z;
        local v46 = l_X_0 / l_Z_0;
        local l_width_0 = v40.width;
        local l_height_0 = v40.height;
        local v49 = l_width_0 / l_height_0;
        local v50 = (l_X_0 / v33.VOXEL_RESOLUTION) / l_width_0;
        local v51 = (l_Z_0 / v33.VOXEL_RESOLUTION) / l_height_0;
        if math.abs(v49 - v46) > 0.1 then
            local l_l_width_0_0 = l_width_0;
            local l_l_height_0_0 = l_height_0;
            for v54 = math.min(l_width_0, l_height_0), 1, -1 do
                local v55 = l_width_0 / v54;
                local v56 = l_height_0 / v54;
                if math.floor(v55) == v55 and math.floor(v56) == v56 then
                    l_l_width_0_0 = v55;
                    l_l_height_0_0 = v56;
                    break;
                end;
            end;
            v43.Warning = v42:getText("ImportWarning", "AspectRatio", {
                ("%i:%i"):format(l_l_width_0_0, l_l_height_0_0), 
                l_X_0, 
                l_Z_0
            });
        end;
        if not (v50 <= 2) or v51 > 2 then
            v43.Warning = v42:getText("ImportWarning", "ImageTooSmall", {
                l_width_0, 
                l_height_0, 
                l_X_0, 
                l_Z_0
            });
        end;
        return v43;
    else
        return v43;
    end;
end;
local v58 = v3.PureComponent:extend(script.Name);
v58.init = function(v59)
    v59.state = {
        mapSettingsValid = true, 
        hasError = false, 
        errorMainText = "", 
        errorSubText = "", 
        hasWarning = false, 
        warningMainText = "", 
        warningSubText = "", 
        warningLinkText = ""
    };
    v59.onImportButtonClicked = function()
        v59.props.TerrainImporter:startImport();
        v59.props.dispatchSetSizeChangedByUser(false);
    end;
    v59.setMapSettingsValid = function(v60)
        v59:setState({
            mapSettingsValid = v60
        });
    end;
    v59.onPauseRequested = function()
        v59.props.TerrainImporter:togglePause();
    end;
    v59.onCancelRequested = function()
        v59.props.TerrainImporter:cancel();
    end;
    v59.selectHeightmap = function(v61, v62)
        if v61 then
            local l_v61_TemporaryId_0 = v61:GetTemporaryId();
            local v64, v65, v66, v67, v68, v69 = l_HeightmapImporterService_0:IsValidHeightmap(l_v61_TemporaryId_0);
            if not v64 then
                v59.setErrorMessage("FailedToLoadHeightmap", v65);
            else
                spawn(function()
                    local v70 = nil;
                    local v71 = nil;
                    local l_status_0, l_result_0 = pcall(function()
                        local l_l_HeightmapImporterService_0_HeightmapPreviewAsync_0, v73 = l_HeightmapImporterService_0:GetHeightmapPreviewAsync(l_v61_TemporaryId_0);
                        v70 = l_l_HeightmapImporterService_0_HeightmapPreviewAsync_0;
                        v71 = v73;
                    end);
                    if not v59.props.heightmap.file or l_v61_TemporaryId_0 ~= v59.props.heightmap.file:GetTemporaryId() then
                        return ;
                    elseif l_status_0 then
                        if v71 then
                            warn("Only the red channel of imported heightmaps is used, the other channels were discarded.");
                        end;
                        v59.props.dispatchSelectHeightmap(v2.Dictionary.join(v59.props.heightmap, {
                            preview = v70, 
                            channelsWereDiscarded = v71
                        }));
                        return ;
                    else
                        warn(("Failed to generate heightmap preview: %s"):format((tostring(l_result_0))));
                        v59.props.dispatchSelectHeightmap(nil);
                        v59.setErrorMessage("FailedToGenerateHeightmapPreviewTitle", "FailedToGenerateHeightmapPreview");
                        return ;
                    end;
                end);
                v59.props.dispatchSelectHeightmap({
                    preview = nil, 
                    channelsWereDiscarded = false, 
                    file = v61, 
                    width = v66, 
                    height = v67, 
                    channels = v68, 
                    bytesPerChannel = v69
                });
                if not v59.props.sizeChangedByUser then
                    v59.props.dispatchChangeSize({
                        X = math.min(math.max(v66 * 4, v33.REGION_MIN_SIZE), v33.REGION_MAX_SIZE), 
                        Y = v59.props.size.Y, 
                        Z = math.min(math.max(v67 * 4, v33.REGION_MIN_SIZE), v33.REGION_MAX_SIZE)
                    });
                    return ;
                end;
            end;
            return ;
        else
            warn(("Failed to select heightmap: %s"):format((tostring(v62))));
            v59.setErrorMessage("FailedToLoadHeightmap", "FailedToSelectFile");
            return ;
        end;
    end;
    v59.clearHeightmap = function()
        v59.props.dispatchSelectHeightmap(nil);
    end;
    v59.selectColormap = function(v76, v77)
        if v76 then
            local l_v76_TemporaryId_0 = v76:GetTemporaryId();
            local v79, v80, v81, v82, v83 = l_HeightmapImporterService_0:IsValidColormap(l_v76_TemporaryId_0);
            if not v79 then
                v59.setErrorMessage("FailedToLoadColormap", v80);
                return ;
            else
                v59.props.dispatchSelectColormap({
                    preview = l_v76_TemporaryId_0, 
                    file = v76, 
                    width = v81, 
                    height = v82, 
                    channels = v83
                });
                return ;
            end;
        else
            warn(("Failed to select heightmap: %s"):format((tostring(v77))));
            v59.setErrorMessage("FailedToLoadColormap", "FailedToSelectFile");
            return ;
        end;
    end;
    v59.clearColormap = function()
        v59.props.dispatchSelectColormap(nil);
    end;
    v59.setErrorMessage = function(v84, v85)
        if not v84 then
            v59:setState({
                hasError = false, 
                errorMainText = "", 
                errorSubText = ""
            });
            return ;
        else
            local l_Localization_0 = v59.props.Localization;
            local v87 = l_Localization_0:getText("ImportError", v84);
            local v88 = l_Localization_0:getText("ImportError", v85);
            warn(("Import error: %s - %s"):format(v84, v85));
            v59:setState({
                hasError = true, 
                errorMainText = v87, 
                errorSubText = v88
            });
            return ;
        end;
    end;
    v59.clearErrorMessage = function()
        v59.setErrorMessage(nil);
    end;
    v59.clearWarningMessage = function()
        v59:setState({
            hasWarning = false, 
            warningMainText = "", 
            warningSubText = "", 
            warningLinkText = ""
        });
    end;
    v59.onUserChangedSize = function(v89)
        if not (tonumber(v89.X) == v59.props.size.X and tonumber(v89.Y) == v59.props.size.Y) or tonumber(v89.Z) ~= v59.props.size.Z then
            v59.props.dispatchChangeSize(v89);
            v59.props.dispatchSetSizeChangedByUser(true);
        end;
    end;
end;
v58.updateImportProps = function(v90)
    v90.props.TerrainImporter:updateSettings({
        size = Vector3.new(v90.props.size.X, v90.props.size.Y, v90.props.size.Z), 
        position = Vector3.new(v90.props.position.X, if not l_TerrainEditorOverhaul_0 then v90.props.position.Y else v90.props.position.Y - v90.props.size.Y / 2, v90.props.position.Z), 
        heightmap = v90.props.heightmap or {}, 
        colormap = v90.props.colormap or {}, 
        materialMode = v90.props.materialMode, 
        defaultMaterial = v90.props.defaultMaterial
    });
end;
v58.didMount = function(v91)
    v91:updateImportProps();
    v91._onImportErrorConnection = v91.props.TerrainImporter:subscribeToErrors(function(v92)
        v91.setErrorMessage("ImportFailed", v92);
    end);
    v91._isMounted = true;
    v91._onImportFinishConnection = v91.props.TerrainImporter:subscribeToImportFinish(function()
        local l_Localization_1 = v91.props.Localization;
        if not (not v91.props.TerrainImporter:getHasPixelWarning() or not v91._isMounted) then
            v91:setState({
                hasWarning = true, 
                warningMainText = l_Localization_1:getText("ImportWarning", "MainTextColormapRGBOutOfRange"), 
                warningSubText = l_Localization_1:getText("ImportWarning", "SubTextColormapRGBOutOfRange"), 
                warningLinkText = l_Localization_1:getText("Action", "LearnMore")
            });
            v91.props.dispatchSetColormapWarningId(not not v91.props.colormap.file and v91.props.colormap.file:GetTemporaryId() or nil);
            v91.props.TerrainImporter:clearHasPixelWarning();
        end;
    end);
end;
v58.didUpdate = function(v94)
    v94:updateImportProps();
end;
v58.willUnmount = function(v95)
    v95._isMounted = false;
    if v95._onImportErrorConnection then
        v95._onImportErrorConnection:Disconnect();
        v95._onImportErrorConnection = nil;
    end;
    if v95._onImportFinishConnection then
        v95._onImportFinishConnection:Disconnect();
        v95._onImportFinishConnection = nil;
    end;
end;
v58.render = function(v96)
    local l_props_0 = v96.props;
    local l_Localization_2 = l_props_0.Localization;
    local v99 = l_props_0.TerrainImporter:isPaused();
    local v100 = l_props_0.TerrainImporter:isImporting();
    local v101 = not not v100 and l_props_0.TerrainImporter:getImportProgress() or 0;
    local v102 = not not v100 and l_props_0.TerrainImporter:getImportOperation() or "";
    local v103 = not v100;
    if v103 then
        v103 = v96.state.mapSettingsValid;
        if v103 then
            v103 = l_props_0.heightmap.file;
            if v103 then
                v103 = true;
                if l_props_0.materialMode ~= l_ImportMaterialMode_0.DefaultMaterial then
                    v103 = l_props_0.colormap.file;
                end;
            end;
        end;
    end;
    local v104 = l_props_0.materialMode == l_ImportMaterialMode_0.Colormap;
    local v105 = l_props_0.materialMode == l_ImportMaterialMode_0.DefaultMaterial;
    local v106 = v57(l_props_0.heightmap, l_props_0.size, l_Localization_2);
    local v107 = v57(l_props_0.colormap, l_props_0.size, l_Localization_2);
    local v108 = l_props_0.colormap.file and l_props_0.colormap.file:GetTemporaryId() == l_props_0.colormapWarningId;
    if not (v107.Warning or not v108) then
        v107.Warning = l_Localization_2:getText("ImportWarning", "ColorMapOutOfRangeIconTooltip");
    end;
    if not (not v103 or not l_props_0.heightmap.channelsWereDiscarded) then
        v106.Info = l_Localization_2:getText("ImportInfo", "ChannelsWereDiscarded");
    end;
    local v109 = nil;
    v109 = l_Localization_2:getText("Generate", v102);
    local l_errorMainText_0 = v96.state.errorMainText;
    local l_errorSubText_0 = v96.state.errorSubText;
    local _ = "";
    local _ = "";
    local _ = "";
    return v3.createFragment({
        MapSettings = v3.createElement(v14, {
            LayoutOrder = 1, 
            Title = l_Localization_2:getText("MapSettings", "MapSettings"), 
            Padding = UDim.new(0, 12)
        }, {
            Heightmap = v3.createElement(v11, {
                Text = l_Localization_2:getText("Import", "Heightmap"), 
                Size = UDim2.new(1, 0, 0, 60), 
                LayoutOrder = 1, 
                SizeToContent = true, 
                ErrorMessage = v106.Error, 
                WarningMessage = v106.Warning, 
                InfoMessage = v106.Info
            }, {
                LocalImageSelector = v3.createElement(v12, {
                    CurrentFile = l_props_0.heightmap, 
                    SelectFile = v96.selectHeightmap, 
                    ClearSelection = v96.clearHeightmap, 
                    PreviewTitle = l_Localization_2:getText("Import", "HeightmapPreview")
                })
            }), 
            RegionSettings = if (not not l_TerrainEditorOverhaul_0 and l_props_0.transform) and l_props_0.size then v3.createElement(v14, {
                Padding = UDim.new(0, 12), 
                LayoutOrder = 1, 
                isSubsection = false, 
                Title = l_Localization_2:getText("SelectionSettings", "SelectionSettings")
            }, {
                v3.createElement(v17, {
                    HideWireframe = true, 
                    LayoutOrder = 1, 
                    MaxVolume = v39, 
                    SetMapSettingsValid = v96.setMapSettingsValid, 
                    SetRegion = function(v115, v116)
                        l_props_0.dispatchChangeSelection(v115, v116);
                    end, 
                    SetSnapToVoxels = l_props_0.dispatchSetSnapToVoxels, 
                    Size = l_props_0.size, 
                    SnapToVoxels = l_props_0.snapToVoxels, 
                    SourceSize = l_props_0.size, 
                    SourceTransform = l_props_0.transform, 
                    Transform = l_props_0.transform, 
                    ToolName = l_props_0.toolName
                })
            }) else nil, 
            MapSettingsWithPreview = if l_TerrainEditorOverhaul_0 then nil else v3.createElement(v13, {
                toolName = l_props_0.toolName, 
                InitialLayoutOrder = 2, 
                Position = l_props_0.position, 
                Size = l_props_0.size, 
                MaxVolume = v39, 
                PreviewOffset = Vector3.new(0, 0.5, 0), 
                OnPositionChanged = v96.props.dispatchChangePosition, 
                OnSizeChanged = v96.onUserChangedSize, 
                SetMapSettingsValid = v96.setMapSettingsValid
            })
        }), 
        MaterialSettings = v3.createElement(v14, {
            Title = l_Localization_2:getText("MaterialSettings", "MaterialSettings"), 
            LayoutOrder = 2
        }, {
            MaterialColorToggle = v3.createElement(v16, {
                LayoutOrder = 1, 
                Selected = l_props_0.materialMode, 
                Select = l_props_0.dispatchSetImportMaterialMode, 
                Options = {
                    {
                        Text = l_Localization_2:getText("ImportMaterialMode", "DefaultMaterial"), 
                        Data = l_ImportMaterialMode_0.DefaultMaterial
                    }, 
                    {
                        Text = l_Localization_2:getText("ImportMaterialMode", "Colormap"), 
                        Data = l_ImportMaterialMode_0.Colormap
                    }
                }
            }), 
            DefaultMaterialSelector = v105 and v3.createElement(v15, {
                LayoutOrder = 2, 
                AllowAir = false, 
                Label = l_Localization_2:getText("Import", "DefaultMaterial"), 
                material = l_props_0.defaultMaterial, 
                setMaterial = l_props_0.dispatchSetDefaultMaterial
            }), 
            Colormap = v104 and v3.createElement(v11, {
                LayoutOrder = 2, 
                Text = l_Localization_2:getText("Import", "Colormap"), 
                Size = UDim2.new(1, 0, 0, 60), 
                SizeToContent = true, 
                ErrorMessage = v107.Error, 
                WarningMessage = v107.Warning, 
                InfoMessage = v107.Info
            }, {
                LocalImageSelector = v3.createElement(v12, {
                    CurrentFile = l_props_0.colormap, 
                    SelectFile = v96.selectColormap, 
                    ClearSelection = v96.clearColormap, 
                    PreviewTitle = l_Localization_2:getText("Import", "ColormapPreview")
                }), 
                CalloutContainer = v3.createElement("Frame", {
                    Size = UDim2.new(0, 88, 0, 0), 
                    BackgroundTransparency = 1, 
                    LayoutOrder = 2
                }, {
                    TeachingCallout = v3.createElement(v20, {
                        DefinitionId = "TerrainToolsColormapCallout", 
                        LocationId = "TerrainImportColormapSelector"
                    })
                }) or nil
            })
        }), 
        ImportButtonFrame = v3.createElement(v10, {
            LayoutOrder = 4, 
            Buttons = {
                {
                    Key = "Import", 
                    Name = l_Localization_2:getText("Import", "ButtonImport"), 
                    Active = v103, 
                    OnClicked = v96.onImportButtonClicked
                }
            }, 
            Style = if not l_TerrainEditorOverhaul_0 then nil else "RoundPrimary"
        }), 
        ProgressDialog = v100 and v3.createElement(v19, {
            Title = l_Localization_2:getText("Generate", "GenerateProgressTitle"), 
            SubText = v109, 
            Progress = v101, 
            IsPaused = v99, 
            OnPauseButtonClicked = v96.onPauseRequested, 
            OnCancelButtonClicked = v96.onCancelRequested
        }), 
        ErrorDialog = v96.state.hasError and v3.createElement(v8, {
            Title = "Roblox Studio", 
            MainText = l_errorMainText_0, 
            SubText = l_errorSubText_0, 
            Image = "rbxasset://textures/ui/ErrorIcon.png", 
            OnClose = v96.clearErrorMessage
        }), 
        WarningDialog = (v96.state.hasWarning and not v96.state.hasError) and v3.createElement(v8, {
            Title = "Roblox Studio", 
            MainText = v96.state.warningMainText, 
            SubText = v96.state.warningSubText, 
            Image = "rbxasset://textures/ui/WarningIcon.png", 
            OnClose = v96.clearWarningMessage, 
            LinkInfo = {
                Text = v96.state.warningLinkText, 
                OnClick = function()
                    l_BrowserService_0:OpenBrowserWindow("https://developer.roblox.com/en-us/articles/importing-terrain-data");
                end
            }
        })
    });
end;
return v4.connect(function(v117, _)
    return {
        toolName = v34.ToolId.ImportLocal, 
        position = if not l_TerrainEditorOverhaul_0 then v117.ImportLocalTool.position else v117.Tools.SelectionTransform.Position, 
        size = if not l_TerrainEditorOverhaul_0 then v117.ImportLocalTool.size else v117.Tools.SelectionSize, 
        transform = if not l_TerrainEditorOverhaul_0 then nil else v117.Tools.SelectionTransform, 
        heightmap = v117.ImportLocalTool.heightmap or {}, 
        colormap = v117.ImportLocalTool.colormap or {}, 
        colormapWarningId = v117.ImportLocalTool.colormapWarningId or nil, 
        materialMode = v117.ImportLocalTool.materialMode, 
        defaultMaterial = v117.ImportLocalTool.defaultMaterial, 
        sizeChangedByUser = v117.ImportLocalTool.sizeChangedByUser, 
        snapToVoxels = if not l_TerrainEditorOverhaul_0 then nil else v117.Tools.SnapToVoxels
    };
end, function(v119)
    local function _(v120)
        v119(v22("ImportLocalTool", v120));
    end;
    return {
        dispatchChangePosition = function(v122)
            v119(v22("ImportLocalTool", (v23(v122))));
        end, 
        dispatchChangeSize = function(v123)
            v119(v22("ImportLocalTool", (v25(v123))));
        end, 
        dispatchSelectHeightmap = function(v124)
            v119(v22("ImportLocalTool", (v28(v124))));
        end, 
        dispatchSelectColormap = function(v125)
            v119(v22("ImportLocalTool", (v26(v125))));
        end, 
        dispatchSetColormapWarningId = function(v126)
            v119(v22("ImportLocalTool", (v27(v126))));
        end, 
        dispatchSetImportMaterialMode = function(v127)
            v119(v22("ImportLocalTool", (v30(v127))));
        end, 
        dispatchSetDefaultMaterial = function(v128)
            v119(v22("ImportLocalTool", (v29(v128))));
        end, 
        dispatchSetSizeChangedByUser = function(v129)
            v119(v22("ImportLocalTool", (v32(v129))));
        end, 
        dispatchSetSnapToVoxels = function(v130)
            v119(v31(v130));
        end, 
        dispatchChangeSelection = function(v131, v132)
            v119(v24(v131, v132));
        end
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    TerrainImporter = v7.TerrainImporter
})(v58)));
