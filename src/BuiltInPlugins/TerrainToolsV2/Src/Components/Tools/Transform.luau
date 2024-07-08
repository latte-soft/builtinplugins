local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_Parent_0.Src.ContextItems);
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local l_ToolParts_0 = l_Parent_0.Src.Components.Tools.ToolParts;
local v9 = require(l_ToolParts_0.ButtonGroup);
local v10 = require(l_ToolParts_0.LabeledToggle);
local v11 = require(l_ToolParts_0.Panel);
local v12 = require(l_ToolParts_0.RegionFragment);
local _ = require(l_Parent_0.Src.Components.TeachingCallout);
local v14 = require(l_Parent_0.Src.Components.TransformDialog);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v16 = require(l_Actions_0.ApplyToolAction);
local v17 = require(l_Actions_0.ChangeSource);
local v18 = require(l_Actions_0.ChangeTarget);
local v19 = require(l_Actions_0.ChangeTool);
local v20 = require(l_Actions_0.SetLiveEdit);
local v21 = require(l_Actions_0.SetMergeEmpty);
local l_Util_0 = l_Parent_0.Src.Util;
local v23 = require(l_Util_0.applyTransform);
local v24 = require(l_Util_0.ConvertTransformToRegion);
local v25 = require(l_Util_0.TerrainEnums);
local l_ToolId_0 = v25.ToolId;
local l_TransformMode_0 = v25.TransformMode;
local l_game_FastInt_0 = game:GetFastInt("SmoothTerrainMaxCppRegion");
local l_TerrainEditorOverhaul_0 = game:GetFastFlag("TerrainEditorOverhaul");
local v30 = v2.PureComponent:extend(script.Name);
v30.init = function(v31)
    v31.apply = function()
        local l_props_0 = v31.props;
        local l_Analytics_0 = l_props_0.Analytics;
        local v34 = l_props_0.LiveEdit and not v31.state.forcePreviewMode;
        local v35 = l_props_0.Terrain:get();
        local v36 = tick();
        local v37 = nil;
        local v38 = nil;
        local v39 = v24(l_props_0.TargetTransform, l_props_0.TargetSize, false);
        local v40 = v39.Max - v39.Min;
        if v34 and l_game_FastInt_0 < (v40.X * v40.Y) * v40.Z then
            v31:setState({
                forcePreviewMode = true
            });
            return ;
        else
            v31:setState({
                forcePreviewMode = false
            });
            if v34 then
                v35:PasteRegion(v31.state.terrainBackup, v24(v31.state.terrainTransform, v31.state.terrainSize, false).Min, true);
                v38 = v35:CopyRegion(v24(l_props_0.TargetTransform, l_props_0.TargetSize, false));
                if l_props_0.TransformMode == l_TransformMode_0.Move then
                    v37 = v31.state.terrainRegion:Clone();
                    if l_props_0.MergeEmpty then
                        v35:SetMaterialInTransform(l_props_0.TargetTransform, l_props_0.TargetSize, Enum.Material.Air);
                    end;
                    v35:SetMaterialInTransform(l_props_0.SourceTransform, l_props_0.SourceSize, Enum.Material.Air);
                elseif l_props_0.TransformMode == l_TransformMode_0.Paste then
                    v37 = l_props_0.TerrainRegionCopyBuffer:Clone();
                    if l_props_0.MergeEmpty then
                        v35:SetMaterialInTransform(l_props_0.TargetTransform, l_props_0.TargetSize, Enum.Material.Air);
                    end;
                elseif l_props_0.TransformMode == l_TransformMode_0.Duplicate then
                    v37 = l_props_0.TerrainRegion:Clone();
                    if l_props_0.MergeEmpty then
                        v35:SetMaterialInTransform(l_props_0.TargetTransform, l_props_0.TargetSize, Enum.Material.Air);
                    end;
                else
                    assert(("Unexpected value for TransformMode, received %s"):format(l_props_0.TransformMode));
                end;
                local l_v23_0 = v23;
                local l_v35_0 = v35;
                local l_v37_0 = v37;
                local l_TargetTransform_0 = l_props_0.TargetTransform;
                local l_TargetSize_0 = l_props_0.TargetSize;
                local v46 = false;
                if l_props_0.TargetTransform.Rotation == l_props_0.SourceTransform.Rotation then
                    v46 = l_props_0.TargetSize == l_props_0.SourceSize;
                end;
                l_v23_0(l_v35_0, l_v37_0, l_TargetTransform_0, l_TargetSize_0, v46);
                if tick() - v36 > 5 then
                    l_props_0.dispatchSetLiveEdit(false);
                end;
                v31:setState({
                    terrainBackup = v38, 
                    terrainTransform = l_props_0.TargetTransform, 
                    terrainSize = l_props_0.TargetSize
                });
                if v31.updateQueued then
                    v31.updateQueued = false;
                    v31.apply();
                end;
                v31.updating = false;
                return ;
            else
                v31:setState({
                    applying = true
                });
                l_Analytics_0:report("regionMode", "Preview");
                return ;
            end;
        end;
    end;
    v31.quit = function()
        v31.props.dispatchChangeTool(l_ToolId_0.Select);
    end;
    v31.connect = function()
        local l_props_1 = v31.props;
        v31.applyAction = l_props_1.PluginActionsController:Connect("Apply", v31.apply);
        l_props_1.PluginActionsController:Enable("Apply");
        v31.quitAction = l_props_1.PluginActionsController:Connect("Quit", v31.quit);
        l_props_1.PluginActionsController:Enable("Quit");
    end;
    v31.disconnect = function()
        local l_props_2 = v31.props;
        if v31.applyAction then
            l_props_2.PluginActionsController:Disable("Apply");
            v31.applyAction:Disconnect();
        end;
        if v31.quitAction then
            l_props_2.PluginActionsController:Disable("Quit");
            v31.quitAction:Disconnect();
        end;
    end;
    v31.live = function()
        v31.disconnect();
        if v31.updating then
            v31.updateQueued = true;
            return ;
        else
            v31.updating = true;
            v31.apply();
            return ;
        end;
    end;
    v31.preview = function()
        local l_props_3 = v31.props;
        local v50 = l_props_3.Terrain:get();
        v31.connect();
        v50:PasteRegion(v31.state.terrainBackup, v24(v31.state.terrainTransform, v31.state.terrainSize, false).Min, true);
        v50:PasteRegion(v31.state.terrainRegion, v24(l_props_3.SourceTransform, l_props_3.SourceSize, true).Min, true);
    end;
    v31.setLiveEdit = function(v51)
        local l_props_4 = v31.props;
        if not v31.state.applying then
            l_props_4.dispatchSetLiveEdit(v51);
            return ;
        else
            return ;
        end;
    end;
end;
v30.didMount = function(v53)
    local l_props_5 = v53.props;
    local l_Analytics_1 = l_props_5.Analytics;
    local v56 = l_props_5.LiveEdit and not v53.state.forcePreviewMode;
    local l_SourceTransform_0 = l_props_5.SourceTransform;
    local l_SourceSize_0 = l_props_5.SourceSize;
    local v59 = l_props_5.Terrain:get();
    local v60 = v24(l_SourceTransform_0, l_SourceSize_0, false);
    local v61 = v60.Max - v60.Min;
    local v62 = l_game_FastInt_0 < (v61.X * v61.Y) * v61.Z;
    if not v56 then
        v53.connect();
    end;
    if l_props_5.TransformMode == l_TransformMode_0.Move then
        l_Analytics_1:report("regionAction", "Move");
    end;
    v53:setState({
        forcePreviewMode = v62, 
        terrainRegion = v59:CopyRegion(v24(l_SourceTransform_0, l_SourceSize_0, true)), 
        terrainBackup = v59:CopyRegion(v24(l_SourceTransform_0, l_SourceSize_0, false)), 
        terrainTransform = l_SourceTransform_0, 
        terrainSize = l_SourceSize_0
    });
    l_props_5.dispatchChangeTarget(l_SourceTransform_0, l_SourceSize_0);
end;
v30.willUnmount = function(v63)
    local l_props_6 = v63.props;
    local l_Analytics_2 = l_props_6.Analytics;
    if l_props_6.LiveEdit and not v63.state.forcePreviewMode then
        l_Analytics_2:report("regionMode", "LiveEdit");
    end;
    v63.disconnect();
end;
v30.didUpdate = function(v66, v67)
    local l_props_7 = v66.props;
    local v69 = l_props_7.LiveEdit and not v66.state.forcePreviewMode;
    if v67.LiveEdit ~= v69 then
        if not v69 then
            v66.preview();
        else
            v66.live();
        end;
    end;
    if not (v67.TargetTransform == l_props_7.TargetTransform) or v67.TargetSize ~= l_props_7.TargetSize then
        if not v69 or v66.updating then
            if v66.updating then
                v66.needsToUpdate = true;
            end;
        else
            v66.apply();
        end;
        local v70 = v24(l_props_7.TargetTransform, l_props_7.TargetSize, false);
        local v71 = v70.Max - v70.Min;
        if l_game_FastInt_0 < (v71.X * v71.Y) * v71.Z then
            v66:setState({
                forcePreviewMode = true
            });
            return ;
        else
            v66:setState({
                forcePreviewMode = false
            });
        end;
    end;
end;
v30.render = function(v72)
    local l_props_8 = v72.props;
    local l_TerrainRegionCopySize_0 = l_props_8.TerrainRegionCopySize;
    local l_TerrainRegionCopyTransform_0 = l_props_8.TerrainRegionCopyTransform;
    local v76 = l_props_8.LiveEdit and not v72.state.forcePreviewMode;
    local l_MergeEmpty_0 = l_props_8.MergeEmpty;
    local l_SourceTransform_1 = l_props_8.SourceTransform;
    local l_SourceSize_1 = l_props_8.SourceSize;
    local l_TargetTransform_1 = l_props_8.TargetTransform;
    local l_TargetSize_1 = l_props_8.TargetSize;
    local l_Localization_0 = l_props_8.Localization;
    local v83 = nil;
    if l_TerrainEditorOverhaul_0 then
        if l_props_8.TransformMode == l_TransformMode_0.Move then
            v83 = v72.state.terrainRegion;
        elseif l_props_8.TransformMode == l_TransformMode_0.Paste then
            v83 = l_props_8.TerrainRegionCopyBuffer;
        elseif l_props_8.TransformMode == l_TransformMode_0.Duplicate then
            v83 = l_props_8.TerrainRegion;
        end;
    end;
    local v84 = l_LayoutOrderIterator_0.new();
    return v2.createFragment({
        SelectionSettings = v2.createElement(v11, {
            Padding = UDim.new(0, 12), 
            LayoutOrder = 1, 
            isSubsection = false, 
            Title = l_Localization_0:getText("TransformSettings", "TransformSettings")
        }, {
            TransformRegionFragment = v2.createElement(v12, {
                HideBox = not l_MergeEmpty_0, 
                LayoutOrder = v84:getNextOrder(), 
                Region = v83, 
                SetRegion = l_props_8.dispatchChangeTarget, 
                SourceSize = if l_props_8.TransformMode == l_TransformMode_0.Paste then l_TerrainRegionCopySize_0 else l_SourceSize_1, 
                SourceTransform = if l_props_8.TransformMode == l_TransformMode_0.Paste then l_TerrainRegionCopyTransform_0 else l_SourceTransform_1, 
                ShowRotation = true, 
                Size = l_TargetSize_1, 
                ShowTooltip = not v76, 
                Transform = l_TargetTransform_1, 
                ToolName = v25.ToolId.Transform, 
                Visual = v72.state.Visual
            }), 
            MergeEmpty = v2.createElement(v10, {
                LayoutOrder = v84:getNextOrder(), 
                Text = l_Localization_0:getText("RegionSettings", "MergeEmpty"), 
                Tooltip = l_Localization_0:getText("RegionSettings", "MergeEmptyTooltip"), 
                IsOn = l_MergeEmpty_0, 
                SetIsOn = l_props_8.dispatchSetMergeEmpty
            }), 
            LiveEdit = v2.createElement(v10, {
                LayoutOrder = v84:getNextOrder(), 
                InfoMessage = if not v72.state.forcePreviewMode then nil else l_Localization_0:getText("RegionSettings", "ForcePreviewMode"), 
                TeachingCallout = if not not l_TerrainEditorOverhaul_0 and v72.state.forcePreviewMode then {
                    DefinitionId = "TerrainToolsLiveEditCallout", 
                    LocationId = "TerrainToolsLiveEditToggle"
                } else nil, 
                Text = l_Localization_0:getText("RegionSettings", "LiveEdit"), 
                Tooltip = l_Localization_0:getText("RegionSettings", "LiveEditTooltip"), 
                IsOn = l_props_8.LiveEdit, 
                SetIsOn = v72.setLiveEdit
            }), 
            Action = if v76 then nil else v2.createElement(v9, {
                LayoutOrder = v84:getNextOrder(), 
                Buttons = {
                    {
                        Active = not v72.state.applying, 
                        Key = "Apply", 
                        Name = l_Localization_0:getText("RegionSettings", "Apply"), 
                        OnClicked = v72.apply
                    }
                }, 
                Style = "RoundPrimary"
            }), 
            TransformDialog = if not v72.state.applying then nil else v2.createElement(v14, {
                OnFinish = function()
                    v72:setState({
                        applying = false
                    });
                end, 
                MergeEmpty = l_MergeEmpty_0, 
                Size = l_props_8.TargetSize, 
                SourceSize = if l_props_8.TransformMode == l_TransformMode_0.Move then l_SourceSize_1 else nil, 
                SourceTransform = if l_props_8.TransformMode == l_TransformMode_0.Move then l_SourceTransform_1 else nil, 
                Transform = l_props_8.TargetTransform, 
                Terrain = l_props_8.Terrain:get(), 
                TerrainRegion = v83
            })
        })
    });
end;
return v3.connect(function(v85, _)
    return {
        LiveEdit = v85.RegionTool.LiveEdit, 
        MergeEmpty = v85.RegionTool.mergeEmpty, 
        SourceTransform = v85.Tools.SelectionTransform, 
        SourceSize = v85.Tools.SelectionSize, 
        TargetTransform = v85.RegionTool.TargetTransform, 
        TargetSize = v85.RegionTool.TargetSize, 
        TerrainRegion = v85.Tools.TerrainRegion, 
        TerrainRegionCopyBuffer = v85.Tools.TerrainRegionCopyBuffer, 
        TerrainRegionCopyTransform = v85.Tools.TerrainRegionCopyTransform, 
        TerrainRegionCopySize = v85.Tools.TerrainRegionCopySize, 
        TransformMode = v85.Tools.TransformMode
    };
end, function(v87)
    local function _(v88)
        v87(v16("RegionTool", v88));
    end;
    return {
        dispatchSetLiveEdit = function(v90)
            v87(v16("RegionTool", (v20(v90))));
        end, 
        dispatchSetMergeEmpty = function(v91)
            v87(v16("RegionTool", (v21(v91))));
        end, 
        dispatchChangeSource = function(v92, v93)
            v87(v16("RegionTool", (v17(v92, v93))));
        end, 
        dispatchChangeTarget = function(v94, v95)
            v87(v16("RegionTool", (v18(v94, v95))));
        end, 
        dispatchChangeTool = function(v96)
            v87(v19(v96));
        end
    };
end)((l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    PluginActionsController = v6.PluginActionsController, 
    Terrain = v6.Terrain
})(v30)));
