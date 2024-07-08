local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v3.Style.Stylizer;
local l_UI_0 = v3.UI;
local l_Button_0 = l_UI_0.Button;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_Pane_0 = l_UI_0.Pane;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_findIndex_0 = v3.Dash.findIndex;
local l_StyleModifier_0 = v3.Util.StyleModifier;
local v16 = require(l_script_FirstAncestor_0.Src.Controllers.PresetController);
local v17 = require(l_script_FirstAncestor_0.Src.Actions.SetCurrentPreset);
local v18 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagAssetImportEnableMultipleFiles);
local v19 = v1.PureComponent:extend("PresetSelector");
local function _(v20)
    if string.sub(v20, -1) == "*" then
        v20 = string.sub(v20, 1, -2);
    end;
    return v20;
end;
if v18() then
    v19.defaultProps = {
        Enabled = true
    };
end;
v19.init = function(v22)
    v22.renderDropdownItem = function(v23, v24, v25, v26)
        local l_TopBar_0 = v22.props.Stylizer.TopBar;
        local l_PresetController_0 = v22.props.PresetController;
        local v29 = nil;
        local l_v23_0 = v23;
        if string.sub(l_v23_0, -1) == "*" then
            l_v23_0 = string.sub(l_v23_0, 1, -2);
        end;
        local l_l_v23_0_0 = l_v23_0;
        v29 = if not l_PresetController_0:isStudioDefault(l_l_v23_0_0) then l_PresetController_0:isLastImport(l_l_v23_0_0) and 2 or 2 + v24 else 1;
        l_v23_0 = if not v26 then nil else l_StyleModifier_0.Hover;
        return v1.createElement(l_Button_0, {
            LayoutOrder = v29, 
            OnClick = v25, 
            Size = l_TopBar_0.MenuItemSize, 
            StyleModifier = l_v23_0
        }, {
            TextLabel = v1.createElement(l_TextLabel_0, {
                Text = l_l_v23_0_0, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                Size = UDim2.fromScale(1, 1), 
                TextTruncate = Enum.TextTruncate.AtEnd, 
                StyleModifier = l_v23_0
            }, {
                Padding = v1.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, l_TopBar_0.Padding.Left), 
                    PaddingRight = UDim.new(0, l_TopBar_0.Padding.Right)
                })
            })
        });
    end;
    v22.onItemActivated = function(v32, _)
        if not v18() then
            v22.props.SetCurrentPreset(v32);
            v22.props.PresetController:DEPRECATED_resolvePreset(v32);
            return ;
        else
            local l_props_0 = v22.props;
            l_props_0.PresetController:resolvePreset(v32, l_props_0.ActiveQueueItem);
            return ;
        end;
    end;
end;
v19.render = function(v35)
    local l_props_1 = v35.props;
    local l_TopBar_1 = l_props_1.Stylizer.TopBar;
    local v38 = if not v18() then l_props_1.CurrentPreset else l_props_1.ActiveQueueItem.currentPreset;
    local v39 = l_props_1.PresetController:getNameList(v38);
    local v40 = l_props_1.PresetController:isLastImport(v38);
    local v41 = nil;
    if v40 then
        v41 = l_props_1.Localization:getText("Templates", "LastImportTooltip");
    end;
    if l_props_1.SettingsChanged then
        v41 = l_props_1.Localization:getText("Templates", "ModifiedTemplateTooltip");
    end;
    local v44 = v1.createElement(l_SelectInput_0, {
        Items = v39, 
        LayoutOrder = l_props_1.LayoutOrder, 
        OnRenderItem = v35.renderDropdownItem, 
        OnItemActivated = v35.onItemActivated, 
        SelectedIndex = l_findIndex_0(v39, function(v42)
            local l_v42_0 = v42;
            if string.sub(l_v42_0, -1) == "*" then
                l_v42_0 = string.sub(l_v42_0, 1, -2);
            end;
            return l_v42_0 == v38;
        end), 
        Size = if not v18() then nil else if not l_props_1.Size then UDim2.fromScale(1, 1) else l_props_1.Size, 
        Width = if v18() then nil else l_TopBar_1.TemplateDropDown.X.Offset, 
        Enabled = if not v18() then nil else l_props_1.Enabled, 
        TextTruncate = Enum.TextTruncate.AtEnd
    });
    if v18() or not v41 then
        return v44;
    else
        return v1.createElement(l_Pane_0, {
            LayoutOrder = 3, 
            Size = l_TopBar_1.TemplateDropDown
        }, {
            v1.createElement(l_Tooltip_0, {
                Text = v41, 
                Child = v44
            })
        });
    end;
end;
return v2.connect(function(v45)
    return {
        CurrentPreset = if v18() then nil else v45.Preview.currentPreset, 
        SettingsChanged = if v18() then nil else v45.Preview.settingsChanged, 
        Checked = if v18() then nil else v45.Preview.importDataChecked or {}
    };
end, function(v46)
    return {
        SetCurrentPreset = if v18() then nil else function(v47)
            v46(v17(v47));
        end
    };
end)((l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0, 
    PresetController = v16
})(v19)));
