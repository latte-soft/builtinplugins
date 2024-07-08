local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_ToolId_0 = require(l_Parent_0.Src.Util.TerrainEnums).ToolId;
local v7 = require(l_Parent_0.Src.ContextItems);
local l_PluginActionsController_0 = v7.PluginActionsController;
local l_Terrain_0 = v7.Terrain;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local l_ToolParts_0 = l_Parent_0.Src.Components.Tools.ToolParts;
local v12 = require(l_ToolParts_0.ButtonGroup);
local v13 = require(l_ToolParts_0.MaterialSettings);
local v14 = require(l_ToolParts_0.Panel);
local v15 = require(l_ToolParts_0.RegionFragment);
local _ = require(l_ToolParts_0.VolumeDragger);
local v17 = require(l_Parent_0.Src.Components.FillDialog);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v19 = require(l_Actions_0.ApplyToolAction);
local v20 = require(l_Actions_0.ChangeSelection);
local v21 = require(l_Actions_0.SetMaterial);
local v22 = require(l_Actions_0.SetReplaceMaterial);
local v23 = require(l_Actions_0.SetSnapToVoxels);
local v24 = require(l_Actions_0.SetSourceMaterial);
local v25 = require(l_Actions_0.SetTargetMaterial);
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_TerrainEditorOverhaul_0 = game:GetFastFlag("TerrainEditorOverhaul");
local v28 = v2.PureComponent:extend(script.Name);
v28.init = function(v29)
    v29.onClick = function()
        local l_props_0 = v29.props;
        local l_Analytics_0 = l_props_0.Analytics;
        local l_ReplaceMaterial_0 = l_props_0.ReplaceMaterial;
        v29:setState({
            applying = true
        });
        if not l_ReplaceMaterial_0 then
            l_Analytics_0:report("regionAction", "Fill");
        else
            l_Analytics_0:report("regionAction", "Replace");
        end;
        l_ChangeHistoryService_0:SetWaypoint("TerrainFill");
    end;
    v29.onFinish = function()
        v29:setState({
            applying = false
        });
    end;
end;
if l_TerrainEditorOverhaul_0 then
    v28.didMount = function(v33)
        local l_props_1 = v33.props;
        v33.applyAction = l_props_1.PluginActionsController:Connect("Apply", v33.onClick);
        l_props_1.PluginActionsController:Enable("Apply");
    end;
    v28.willUnmount = function(v35)
        local l_props_2 = v35.props;
        if v35.applyAction then
            l_props_2.PluginActionsController:Disable("Apply");
            v35.applyAction:disconnect();
        end;
    end;
end;
v28.render = function(v37)
    local l_props_3 = v37.props;
    local l_Material_0 = l_props_3.Material;
    local l_ReplaceMaterial_1 = l_props_3.ReplaceMaterial;
    local l_SourceMaterial_0 = l_props_3.SourceMaterial;
    local l_TargetMaterial_0 = l_props_3.TargetMaterial;
    local l_SelectionSize_0 = l_props_3.SelectionSize;
    local l_SelectionTransform_0 = l_props_3.SelectionTransform;
    local l_SnapToVoxels_0 = l_props_3.SnapToVoxels;
    local l_Localization_0 = l_props_3.Localization;
    local v47 = l_LayoutOrderIterator_0.new();
    return v2.createFragment({
        RegionSettings = v2.createElement(v14, {
            Padding = UDim.new(0, 12), 
            LayoutOrder = v47:getNextOrder(), 
            isSubsection = false, 
            Title = l_Localization_0:getText("SelectionSettings", "SelectionSettings")
        }, {
            v2.createElement(v15, {
                LayoutOrder = 1, 
                SetRegion = function(v48, v49)
                    l_props_3.dispatchChangeSelection(v48, v49);
                end, 
                SetSnapToVoxels = l_props_3.dispatchSetSnapToVoxels, 
                Size = l_SelectionSize_0, 
                SnapToVoxels = l_SnapToVoxels_0, 
                SourceSize = l_SelectionSize_0, 
                SourceTransform = l_SelectionTransform_0, 
                Transform = l_SelectionTransform_0, 
                ToolName = l_props_3.toolName
            })
        }), 
        Source = v2.createElement(v13, {
            LayoutOrder = v47:getNextOrder(), 
            AllowAir = true, 
            currentTool = l_ToolId_0.Material, 
            material = l_Material_0, 
            replaceMaterial = l_ReplaceMaterial_1, 
            source = l_SourceMaterial_0, 
            target = l_TargetMaterial_0, 
            setMaterial = v37.props.dispatchSetMaterial, 
            setReplaceMaterial = v37.props.dispatchSetReplaceMaterial, 
            setSource = v37.props.dispatchSetSourceMaterial, 
            setTarget = v37.props.dispatchSetTargetMaterial
        }), 
        FillButtonFrame = v2.createElement(v12, {
            LayoutOrder = v47:getNextOrder(), 
            Buttons = {
                {
                    Key = "Action", 
                    Name = l_Localization_0:getText("MaterialSettings", "Apply"), 
                    Active = not v37.state.applying, 
                    OnClicked = v37.onClick
                }
            }, 
            Style = "RoundPrimary"
        }), 
        FillDialog = if not v37.state.applying then nil else v2.createElement(v17, {
            OnFinish = v37.onFinish, 
            Material = l_Material_0, 
            Replace = l_ReplaceMaterial_1, 
            Size = l_SelectionSize_0, 
            SourceMaterial = l_SourceMaterial_0, 
            TargetMaterial = l_TargetMaterial_0, 
            Transform = l_SelectionTransform_0, 
            Terrain = l_props_3.Terrain:get()
        })
    });
end;
return v3.connect(function(v50, _)
    return {
        Material = v50.MaterialTool.Material, 
        ReplaceMaterial = v50.MaterialTool.ReplaceMaterial, 
        SourceMaterial = v50.MaterialTool.SourceMaterial, 
        TargetMaterial = v50.MaterialTool.TargetMaterial, 
        SelectionTransform = v50.Tools.SelectionTransform, 
        SelectionSize = v50.Tools.SelectionSize, 
        SnapToVoxels = v50.Tools.SnapToVoxels
    };
end, function(v52)
    local function _(v53)
        v52(v19("MaterialTool", v53));
    end;
    return {
        dispatchChangeSelection = function(v55, v56)
            v52(v20(v55, v56));
        end, 
        dispatchSetMaterial = function(v57)
            v52(v19("MaterialTool", (v21(v57))));
        end, 
        dispatchSetReplaceMaterial = function(v58)
            v52(v19("MaterialTool", (v22(v58))));
        end, 
        dispatchSetSnapToVoxels = function(v59)
            v52(v23(v59));
        end, 
        dispatchSetSourceMaterial = function(v60)
            v52(v19("MaterialTool", (v24(v60))));
        end, 
        dispatchSetTargetMaterial = function(v61)
            v52(v19("MaterialTool", (v25(v61))));
        end
    };
end)((l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    PluginActionsController = l_PluginActionsController_0, 
    Terrain = l_Terrain_0
})(v28)));
