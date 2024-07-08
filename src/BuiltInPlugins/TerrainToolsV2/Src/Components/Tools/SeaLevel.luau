local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_Parent_0.Src.ContextItems);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v8 = require(l_Actions_0.ApplyToolAction);
local v9 = require(l_Actions_0.ChangePosition);
local v10 = require(l_Actions_0.ChangeSize);
local l_ToolParts_0 = script.Parent.ToolParts;
local v12 = require(l_ToolParts_0.ButtonGroup);
local v13 = require(l_ToolParts_0.MapSettingsWithPreview);
local v14 = require(l_Parent_0.Src.Components.ProgressDialog);
local v15 = require(l_Parent_0.Src.Util.TerrainEnums);
if not game:GetFastFlag("TerrainEditorOverhaul") then
    local v16 = v2.PureComponent:extend(script.Name);
    v16.init = function(v17)
        v17.tryGenerateSeaLevel = function()
            v17.props.SeaLevel:replaceMaterial(Vector3.new(v17.props.Position.X, v17.props.Position.Y, v17.props.Position.Z), Vector3.new(v17.props.Size.X, v17.props.Size.Y, v17.props.Size.Z), Enum.Material.Air, Enum.Material.Water, v17.props.toolName);
        end;
        v17.tryEvaporateSeaLevel = function()
            v17.props.SeaLevel:replaceMaterial(Vector3.new(v17.props.Position.X, v17.props.Position.Y, v17.props.Position.Z), Vector3.new(v17.props.Size.X, v17.props.Size.Y, v17.props.Size.Z), Enum.Material.Water, Enum.Material.Air, v17.props.toolName);
        end;
        v17.cancel = function()
            v17.props.SeaLevel:cancel();
        end;
    end;
    v16.render = function(v18)
        local l_Localization_0 = v18.props.Localization;
        local l_Position_0 = v18.props.Position;
        local l_Size_0 = v18.props.Size;
        local v22 = v18.props.SeaLevel:isReplacing();
        return v2.createFragment({
            MapSettingsWithPreview = v2.createElement(v13, {
                toolName = v18.props.toolName, 
                LayoutOrder = 1, 
                Position = l_Position_0, 
                Size = l_Size_0, 
                OnPositionChanged = v18.props.dispatchChangePosition, 
                OnSizeChanged = v18.props.dispatchChangeSize
            }), 
            SeaLevelButtons = v2.createElement(v12, {
                LayoutOrder = 2, 
                Buttons = {
                    {
                        Key = "Evaporate", 
                        Name = l_Localization_0:getText("SeaLevel", "Evaporate"), 
                        Active = not v22, 
                        OnClicked = v18.tryEvaporateSeaLevel
                    }, 
                    {
                        Key = "Create", 
                        Name = l_Localization_0:getText("SeaLevel", "Create"), 
                        Active = not v22, 
                        OnClicked = v18.tryGenerateSeaLevel
                    }
                }
            }), 
            ProgressDialog = v22 and v2.createElement(v14, {
                Title = l_Localization_0:getText("SeaLevel", "SeaLevelProgressTitle"), 
                SubText = l_Localization_0:getText("Replace", "Replacing"), 
                Progress = not not v22 and v18.props.SeaLevel:getProgress() or 0, 
                OnCancelButtonClicked = v18.cancel
            })
        });
    end;
    return v3.connect(function(v23, _)
        return {
            toolName = v15.ToolId.SeaLevel, 
            Position = v23.SeaLevelTool.position, 
            Size = v23.SeaLevelTool.size
        };
    end, function(v25)
        local function _(v26)
            v25(v8("SeaLevelTool", v26));
        end;
        return {
            dispatchChangePosition = function(v28)
                v25(v8("SeaLevelTool", (v9(v28))));
            end, 
            dispatchChangeSize = function(v29)
                v25(v8("SeaLevelTool", (v10(v29))));
            end
        };
    end)((l_withContext_0({
        Localization = l_ContextServices_0.Localization, 
        SeaLevel = v6.SeaLevel
    })(v16)));
else
    local l_PluginActionsController_0 = v6.PluginActionsController;
    local l_Terrain_0 = v6.Terrain;
    local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
    local v33 = require(l_ToolParts_0.Panel);
    local v34 = require(l_ToolParts_0.RegionFragment);
    local v35 = require(l_Parent_0.Src.Components.FillDialog);
    local v36 = require(l_Actions_0.ChangeSelection);
    local v37 = require(l_Actions_0.SetSnapToVoxels);
    local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
    local v39 = v2.PureComponent:extend(script.Name);
    v39.init = function(v40)
        v40.create = function()
            v40.onChangeSeaLevel(true);
        end;
        v40.evaporate = function()
            v40.onChangeSeaLevel(false);
        end;
        v40.onChangeSeaLevel = function(v41)
            local l_Analytics_0 = v40.props.Analytics;
            if not v41 then
                l_Analytics_0:report("regionAction", "Evaporate");
                v40:setState({
                    applying = true, 
                    sourceMaterial = Enum.Material.Water, 
                    targetMaterial = Enum.Material.Air
                });
            else
                l_Analytics_0:report("regionAction", "Water");
                v40:setState({
                    applying = true, 
                    sourceMaterial = Enum.Material.Air, 
                    targetMaterial = Enum.Material.Water
                });
            end;
            l_ChangeHistoryService_0:SetWaypoint("TerrainSeaLevel");
        end;
        v40.onFinish = function()
            v40:setState({
                applying = false
            });
        end;
    end;
    v39.render = function(v43)
        local l_props_0 = v43.props;
        local l_SelectionSize_0 = l_props_0.SelectionSize;
        local l_SelectionTransform_0 = l_props_0.SelectionTransform;
        local l_SnapToVoxels_0 = l_props_0.SnapToVoxels;
        local l_Localization_1 = l_props_0.Localization;
        local v49 = l_LayoutOrderIterator_0.new();
        return v2.createFragment({
            RegionSettings = v2.createElement(v33, {
                Padding = UDim.new(0, 12), 
                LayoutOrder = v49:getNextOrder(), 
                isSubsection = false, 
                Title = l_Localization_1:getText("SelectionSettings", "SelectionSettings")
            }, {
                v2.createElement(v34, {
                    LayoutOrder = 1, 
                    SetRegion = function(v50, v51)
                        l_props_0.dispatchChangeSelection(v50, v51);
                    end, 
                    SetSnapToVoxels = l_props_0.dispatchSetSnapToVoxels, 
                    Size = l_SelectionSize_0, 
                    SnapToVoxels = l_SnapToVoxels_0, 
                    SourceSize = l_SelectionSize_0, 
                    SourceTransform = l_SelectionTransform_0, 
                    Transform = l_SelectionTransform_0, 
                    ToolName = l_props_0.toolName
                })
            }), 
            EvaporateButtonFrame = v2.createElement(v12, {
                LayoutOrder = v49:getNextOrder(), 
                Buttons = {
                    {
                        Key = "Evporate", 
                        Name = l_Localization_1:getText("SeaLevel", "Evaporate"), 
                        Active = not v43.state.applying, 
                        OnClicked = v43.evaporate
                    }, 
                    {
                        Key = "Create", 
                        Name = l_Localization_1:getText("SeaLevel", "Create"), 
                        Active = not v43.state.applying, 
                        OnClicked = v43.create
                    }
                }, 
                Style = "RoundPrimary"
            }), 
            FillDialog = if not v43.state.applying then nil else v2.createElement(v35, {
                OnFinish = v43.onFinish, 
                Replace = true, 
                Size = l_SelectionSize_0, 
                SourceMaterial = v43.state.sourceMaterial, 
                TargetMaterial = v43.state.targetMaterial, 
                Transform = l_SelectionTransform_0, 
                Terrain = l_props_0.Terrain:get()
            })
        });
    end;
    return v3.connect(function(v52, _)
        return {
            SelectionTransform = v52.SeaLevelTool.SelectionTransform, 
            SelectionSize = v52.SeaLevelTool.SelectionSize, 
            SnapToVoxels = v52.SeaLevelTool.SnapToVoxels
        };
    end, function(v54)
        local function _(v55)
            v54(v8("SeaLevelTool", v55));
        end;
        return {
            dispatchChangeSelection = function(v57, v58)
                v54(v8("SeaLevelTool", (v36(v57, v58))));
            end, 
            dispatchSetSnapToVoxels = function(v59)
                v54(v8("SeaLevelTool", (v37(v59))));
            end
        };
    end)((l_withContext_0({
        Analytics = l_ContextServices_0.Analytics, 
        Localization = l_ContextServices_0.Localization, 
        PluginActionsController = l_PluginActionsController_0, 
        Terrain = l_Terrain_0
    })(v39)));
end;
