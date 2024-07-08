local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
local l_UI_0 = v1.UI;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_CheckboxTreeView_0 = l_UI_0.CheckboxTreeView;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_Separator_0 = l_UI_0.Separator;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_showContextMenu_0 = l_UI_0.showContextMenu;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local v17 = require(l_script_FirstAncestor_0.Src.Components.TreeViewToolbar);
local v18 = require(l_script_FirstAncestor_0.Src.Actions.SetSelectedImportItem);
local v19 = require(l_script_FirstAncestor_0.Src.Actions.SetTreeExpansion);
local v20 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateChecked);
local v21 = require(l_script_FirstAncestor_0.Src.Thunks.UpdatePreviewInstance);
local v22 = require(l_script_FirstAncestor_0.Src.Resources.StatusLevel);
local v23 = require(l_script_FirstAncestor_0.Src.Utility.Status.countStatusLevelsForTree);
local v24 = require(l_script_FirstAncestor_0.Src.Utility.trimFilename);
local v25 = require(l_script_FirstAncestor_0.Src.Controllers.PresetController);
local v26 = require(l_script_FirstAncestor_0.Src.Utility.DebugFlags);
local v27 = require(l_script_FirstAncestor_0.Src.Utility.createCalloutComponents);
local v28 = game:DefineFastFlag("UseImportNameForRoot", false);
local v29 = v2.PureComponent:extend("AssetImportTree");
local _ = function(v30)
    local v31 = {};
    local function v32(v33)
        for _, v35 in pairs(v33) do
            v31[v35] = true;
            local l_v35_Children_0 = v35:GetChildren();
            if #l_v35_Children_0 > 0 then
                v32(l_v35_Children_0);
            end;
        end;
    end;
    v32(v30);
    return v31;
end;
local function v48(v38, v39, v40, v41, v42)
    local v43 = nil;
    local v44 = nil;
    local v45 = nil;
    local v46 = nil;
    if v39 == v22.Error then
        v43 = "rbxasset://textures/StudioSharedUI/alert_error@2x.png";
        v44 = v42:getText("AssetImportTree", "Errors");
        v45 = v38.errors;
        v46 = v38.descErrors;
    elseif v39 == v22.Warning then
        v43 = "rbxasset://textures/StudioSharedUI/alert_warning@2x.png";
        v44 = v42:getText("AssetImportTree", "Warnings");
        v45 = v38.warnings;
        v46 = v38.descWarnings;
    end;
    local v47 = nil;
    if v45 > 0 then
        v47 = string.format(v42:getText("AssetImportTree", "Contains"), v45, v44);
    elseif not (v46 > 0) or v40 then
        return nil;
    else
        v47 = string.format(v42:getText("AssetImportTree", "Descendants"), v46, v44);
    end;
    return v2.createElement(l_Image_0, {
        LayoutOrder = v41:getNextOrder(), 
        Style = {
            Image = v43
        }, 
        Size = UDim2.new(0, 20, 0, 20)
    }, {
        Tooltip = v2.createElement(l_Tooltip_0, {
            Text = v47
        })
    });
end;
local function v63(v49, v50, v51, v52, v53)
    local function v54(v55)
        local v56 = v51[v55];
        if not v56 or v53[v55] == nil then
            return ;
        else
            local v57 = true;
            local v58 = false;
            for _, v60 in ipairs(v52(v56)) do
                local v61 = v53[v60];
                if v61 == nil then
                    v61 = v50[v60] or false;
                end;
                local l_v57_0 = v57;
                if l_v57_0 then
                    l_v57_0 = false;
                    if v61 ~= l_Checkbox_0.Indeterminate then
                        l_v57_0 = v61;
                    end;
                end;
                v57 = l_v57_0;
                l_v57_0 = v58;
                if not l_v57_0 then
                    l_v57_0 = true;
                    if v61 ~= l_Checkbox_0.Indeterminate then
                        l_v57_0 = v61;
                    end;
                end;
                v58 = l_v57_0;
            end;
            if not v57 then
                if not v58 then
                    if v50[v56] == false then
                        return ;
                    elseif not (not v56:IsA("GroupImportData") and not v56:IsA("RootImportData")) then
                        v53[v56] = false;
                    end;
                end;
            elseif v50[v56] == true then
                return ;
            elseif not (not v56:IsA("GroupImportData") and not v56:IsA("RootImportData")) then
                v53[v56] = true;
            end;
            v54(v56);
            return ;
        end;
    end;
    v54(v49);
end;
local function v64()
    return {
        {
            Name = "ApplyToAllCallout", 
            ShouldShow = function()
                return not v26.RunningUnderCLI();
            end
        }
    };
end;
v29.init = function(v65)
    v65.getChildren = function(v66)
        return v66:GetChildren();
    end;
    v65.getContents = function(v67)
        if not v28 and v67.ClassName == "RootImportData" then
            return v24(v65.props.FileName), nil;
        else
            return v67.ImportName, nil;
        end;
    end;
    v65.setChecked = function(v68)
        local l_props_0 = v65.props;
        l_props_0.SetChecked(v68);
        if l_props_0.SelectedImportItem then
            l_props_0.UpdatePreviewInstance((l_props_0.SelectedImportItem:GetPreview()));
        end;
    end;
    v65.SelectItem = function(v70)
        local v71 = next(v70);
        if v65.props.SelectedImportItem == v71 then
            return ;
        else
            v65.props.SetSelectedImportItem(v71);
            if not v71 then
                v65.props.UpdatePreviewInstance(nil);
                return ;
            else
                v65.props.UpdatePreviewInstance(v71:GetPreview());
                return ;
            end;
        end;
    end;
    v65.statusCounts = {};
    v65.afterItem = function(v72)
        local v73 = v65.statusCounts[v72.Item];
        if v73 then
            local v74 = l_LayoutOrderIterator_0.new();
            local v75 = v48(v73, v22.Error, v72.Expanded, v74, v65.props.Localization) or v48(v73, v22.Warning, v72.Expanded, v74, v65.props.Localization);
            return v2.createElement(l_Pane_0, {
                Size = UDim2.new(0, not v75 and 0 or 20, 0, 20), 
                LayoutOrder = v72.LayoutOrder, 
                Layout = Enum.FillDirection.Horizontal
            }, {
                StatusCount = v75
            });
        else
            return nil;
        end;
    end;
    v65.createContextMenu = function(v76)
        local v77 = v65.props.Plugin:get();
        local l_Localization_1 = v65.props.Localization;
        local l_PresetController_0 = v65.props.PresetController;
        l_showContextMenu_0(v77, {
            {
                Text = l_Localization_1:getText("AssetImportTree", "RightClickApplyToAll1", {
                    nodeName = v76.ImportName
                }), 
                OnItemClicked = function()
                    l_PresetController_0:applyImportDataToSession(v76);
                end
            }
        });
    end;
end;
v29.render = function(v80)
    local l_props_1 = v80.props;
    local v82 = l_props_1.Stylizer.Sizes.ToolbarHeight + 1;
    local l_Checked_0 = l_props_1.Checked;
    if not l_Checked_0 then
        local l_Instances_0 = l_props_1.Instances;
        local v85 = {};
        local function v86(v87)
            for _, v89 in pairs(v87) do
                v85[v89] = true;
                local l_v89_Children_0 = v89:GetChildren();
                if #l_v89_Children_0 > 0 then
                    v86(l_v89_Children_0);
                end;
            end;
        end;
        v86(l_Instances_0);
        l_Checked_0 = v85;
    end;
    local v91 = l_LayoutOrderIterator_0.new();
    v80.statusCounts = v23(l_props_1.ImportTree);
    return v2.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Vertical
    }, {
        Toolbar = v2.createElement(v17, {
            Expansion = l_props_1.Expansion, 
            LayoutOrder = v91:getNextOrder(), 
            OnExpansionChange = l_props_1.SetExpansion, 
            Size = UDim2.new(1, 0, 0, v82)
        }), 
        Callout = v2.createElement(l_Pane_0, {
            LayoutOrder = v91:getNextOrder(), 
            Size = UDim2.fromScale(1, 0)
        }, (v27(v64(), "AssetImportTree", l_props_1.AssetImportSession))), 
        Separator = v2.createElement(l_Separator_0, {
            DominantAxis = Enum.DominantAxis.Width, 
            LayoutOrder = v91:getNextOrder()
        }), 
        TreeView = v2.createElement(l_CheckboxTreeView_0, {
            RootItems = l_props_1.Instances or {}, 
            Selection = not not l_props_1.SelectedImportItem and {
                [l_props_1.SelectedImportItem] = true
            } or {}, 
            Expansion = l_props_1.Expansion, 
            Checked = l_Checked_0, 
            LayoutOrder = v91:getNextOrder(), 
            Size = UDim2.new(1, 0, 1, -v82), 
            OnSelectionChange = v80.SelectItem, 
            OnExpansionChange = l_props_1.SetExpansion, 
            OnCheck = v80.setChecked, 
            GetChildren = v80.getChildren, 
            GetContents = v80.getContents, 
            ExpandableRoot = false, 
            AfterItem = v80.afterItem, 
            ToggleAncestors = v63, 
            ToggleDescendants = l_CheckboxTreeView_0.DownPropagators.toggleAllChildren, 
            OnRightClick = function(v92)
                v80.createContextMenu(v92.Item);
            end
        })
    });
end;
return v3.connect(function(v93)
    return {
        AssetImportSession = v93.Preview.assetImportSession, 
        ImportTree = v93.Preview.importTree, 
        SelectedImportItem = v93.Preview.selectedImportItem, 
        Expansion = v93.Preview.importDataExpansion or {}, 
        Checked = v93.Preview.importDataChecked or {}
    };
end, function(v94)
    return {
        SetSelectedImportItem = function(v95)
            v94(v18(v95));
        end, 
        SetExpansion = function(v96)
            v94(v19(v96));
        end, 
        SetChecked = function(v97)
            v94(v20(v97));
        end, 
        UpdatePreviewInstance = function(v98)
            v94(v21(v98));
        end
    };
end)((l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0, 
    Plugin = l_ContextServices_0.Plugin, 
    PresetController = v25
})(v29)));
