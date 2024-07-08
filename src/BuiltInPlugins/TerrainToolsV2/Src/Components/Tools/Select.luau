local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_Parent_0.Src.ContextItems);
local l_ToolParts_0 = l_Parent_0.Src.Components.Tools.ToolParts;
local v8 = require(l_ToolParts_0.Panel);
local v9 = require(l_ToolParts_0.RegionFragment);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v11 = require(l_Actions_0.ChangeSelection);
local v12 = require(l_Actions_0.ChangeTool);
local v13 = require(l_Actions_0.SetSnapToVoxels);
local v14 = require(l_Actions_0.SetTransformMode);
local v15 = require(l_Actions_0.SetTerrainRegion);
local v16 = require(l_Actions_0.SetTerrainRegionCopyBuffer);
local v17 = require(l_Parent_0.Src.Util.TerrainEnums);
local l_ToolId_0 = v17.ToolId;
local l_TransformMode_0 = v17.TransformMode;
local v20 = require(l_Parent_0.Src.Util.ConvertTransformToRegion);
local l_TerrainEditorOverhaul_0 = game:GetFastFlag("TerrainEditorOverhaul");
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_Selection_0 = game:GetService("Selection");
local v24 = v2.PureComponent:extend(script.Name);
v24.init = function(v25)
    v25.setRegion = function(v26, v27)
        v25.props.dispatchChangeSelection(v26, v27);
    end;
    if l_TerrainEditorOverhaul_0 then
        v25.copy = function()
            local l_props_0 = v25.props;
            local l_Analytics_0 = l_props_0.Analytics;
            local v30 = l_props_0.Terrain:get();
            local l_SelectionTransform_0 = l_props_0.SelectionTransform;
            local l_SelectionSize_0 = l_props_0.SelectionSize;
            l_Analytics_0:report("regionAction", "Copy");
            l_props_0.dispatchSetTerrainRegionCopyBuffer(v30:CopyRegion(v20(l_SelectionTransform_0, l_SelectionSize_0, true)), l_SelectionTransform_0, l_SelectionSize_0);
        end;
        v25.delete = function()
            local l_props_1 = v25.props;
            local l_Analytics_1 = l_props_1.Analytics;
            local v35 = l_props_1.Terrain:get();
            local l_SelectionTransform_1 = l_props_1.SelectionTransform;
            local l_SelectionSize_1 = l_props_1.SelectionSize;
            l_Analytics_1:report("regionAction", "Delete");
            v35:SetMaterialInTransform(l_SelectionTransform_1, l_SelectionSize_1, Enum.Material.Air);
            l_ChangeHistoryService_0:SetWaypoint("TerrainDelete");
        end;
        v25.cut = function()
            local l_props_2 = v25.props;
            local l_Analytics_2 = l_props_2.Analytics;
            local v40 = l_props_2.Terrain:get();
            local l_SelectionTransform_2 = l_props_2.SelectionTransform;
            local l_SelectionSize_2 = l_props_2.SelectionSize;
            l_Analytics_2:report("regionAction", "Cut");
            local v43 = v40:CopyRegion(v20(l_SelectionTransform_2, l_SelectionSize_2, true));
            v40:SetMaterialInTransform(l_SelectionTransform_2, l_SelectionSize_2, Enum.Material.Air);
            l_props_2.dispatchSetTerrainRegionCopyBuffer(v43, l_SelectionTransform_2, l_SelectionSize_2);
            l_ChangeHistoryService_0:SetWaypoint("TerrainCut");
        end;
        v25.paste = function()
            local l_props_3 = v25.props;
            local l_Analytics_3 = l_props_3.Analytics;
            local l_TerrainRegionCopyBuffer_0 = l_props_3.TerrainRegionCopyBuffer;
            l_Analytics_3:report("regionAction", "Paste");
            if l_TerrainRegionCopyBuffer_0 then
                l_props_3.dispatchSetTransformMode(l_TransformMode_0.Paste);
            end;
        end;
        v25.duplicate = function()
            local l_props_4 = v25.props;
            local l_Analytics_4 = l_props_4.Analytics;
            local v49 = l_props_4.Terrain:get();
            local l_SelectionTransform_3 = l_props_4.SelectionTransform;
            local l_SelectionSize_3 = l_props_4.SelectionSize;
            l_Analytics_4:report("regionAction", "Duplicate");
            l_props_4.dispatchSetTerrainRegion((v49:CopyRegion(v20(l_SelectionTransform_3, l_SelectionSize_3, true))));
            l_props_4.dispatchSetTransformMode(l_TransformMode_0.Duplicate);
        end;
        v25.selection = {};
    end;
end;
if l_TerrainEditorOverhaul_0 then
    v24.enable = function(v52)
        local l_props_5 = v52.props;
        l_props_5.PluginActionsController:Enable("CopySelected");
        l_props_5.PluginActionsController:Enable("CutSelected");
        l_props_5.PluginActionsController:Enable("DeleteSelected");
        l_props_5.PluginActionsController:Enable("PasteSelected");
        l_props_5.PluginActionsController:Enable("DuplicateSelected");
    end;
    v24.disable = function(v54)
        local l_props_6 = v54.props;
        l_props_6.PluginActionsController:Disable("CopySelected");
        l_props_6.PluginActionsController:Disable("CutSelected");
        l_props_6.PluginActionsController:Disable("DeleteSelected");
        l_props_6.PluginActionsController:Disable("PasteSelected");
        l_props_6.PluginActionsController:Disable("DuplicateSelected");
    end;
    v24.didMount = function(v56)
        local l_props_7 = v56.props;
        v56.copyAction = l_props_7.PluginActionsController:Connect("CopySelected", v56.copy);
        v56.cutAction = l_props_7.PluginActionsController:Connect("CutSelected", v56.cut);
        v56.deleteAction = l_props_7.PluginActionsController:Connect("DeleteSelected", v56.delete);
        v56.pasteAction = l_props_7.PluginActionsController:Connect("PasteSelected", v56.paste);
        v56.duplicateAction = l_props_7.PluginActionsController:Connect("DuplicateSelected", v56.duplicate);
        v56.selection = l_Selection_0:Get() or {};
        l_Selection_0:Set({});
        v56.onSelectionChanged = l_Selection_0.SelectionChanged:Connect(function()
            task.defer(function()
                l_Selection_0:Set({});
            end);
        end);
        v56:enable();
    end;
    v24.willUnmount = function(v58)
        if v58.onSelectionChanged then
            v58.onSelectionChanged:Disconnect();
            v58.onSelectionChanged = nil;
        end;
        l_Selection_0:Set(v58.selection);
        v58:disable();
        if v58.copyAction then
            v58.copyAction:Disconnect();
        end;
        if v58.cutAction then
            v58.cutAction:Disconnect();
        end;
        if v58.deleteAction then
            v58.deleteAction:Disconnect();
        end;
        if v58.pasteAction then
            v58.pasteAction:Disconnect();
        end;
        if v58.duplicateAction then
            v58.duplicateAction:Disconnect();
        end;
    end;
end;
v24.render = function(v59)
    local l_props_8 = v59.props;
    local l_Localization_0 = l_props_8.Localization;
    local l_SelectionTransform_4 = l_props_8.SelectionTransform;
    local l_SelectionSize_4 = l_props_8.SelectionSize;
    return v2.createFragment({
        SelectionSettings = v2.createElement(v8, {
            Padding = UDim.new(0, 12), 
            LayoutOrder = 1, 
            isSubsection = false, 
            Title = l_Localization_0:getText("SelectionSettings", "SelectionSettings")
        }, {
            Dragger = v2.createElement(v9, {
                LayoutOrder = 1, 
                SetRegion = v59.setRegion, 
                SetSnapToVoxels = l_props_8.dispatchSetSnapToVoxels, 
                Size = l_SelectionSize_4, 
                SnapToVoxels = l_props_8.SnapToVoxels, 
                SourceSize = l_SelectionSize_4, 
                SourceTransform = l_SelectionTransform_4, 
                Transform = l_SelectionTransform_4, 
                ToolName = l_ToolId_0.Select
            })
        })
    });
end;
return v3.connect(function(v64, _)
    return {
        SelectionTransform = v64.Tools.SelectionTransform, 
        SelectionSize = v64.Tools.SelectionSize, 
        SnapToVoxels = v64.Tools.SnapToVoxels, 
        TerrainRegionCopyBuffer = v64.Tools.TerrainRegionCopyBuffer
    };
end, function(v66)
    return {
        dispatchChangeSelection = function(v67, v68)
            v66(v11(v67, v68));
        end, 
        dispatchChangeTool = function(v69)
            v66(v12(v69));
        end, 
        dispatchSetSnapToVoxels = function(v70)
            v66(v13(v70));
        end, 
        dispatchSetTransformMode = function(v71)
            v66(v14(v71));
        end, 
        dispatchSetTerrainRegion = function(v72)
            v66(v15(v72));
        end, 
        dispatchSetTerrainRegionCopyBuffer = function(v73, v74, v75)
            v66(v16(v73, v74, v75));
        end
    };
end)((l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    PluginActionsController = v6.PluginActionsController, 
    Terrain = v6.Terrain
})(v24)));
