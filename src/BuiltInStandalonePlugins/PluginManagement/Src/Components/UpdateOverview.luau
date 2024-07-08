local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local _ = require(l_Parent_0.Packages.FitFrame);
local v5 = require(l_Parent_0.Src.Util.Constants);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = v3.Util.deepCopy;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Separator_0 = l_UI_0.Separator;
local v14 = require(l_Parent_0.Src.Thunks.UpdatePlugin);
local v15 = v1.PureComponent:extend("UpdateOverview");
v15.defaultProps = {
    LayoutOrder = 1, 
    data = nil
};
v15.init = function(v16)
    local l_props_0 = v16.props;
    local _ = l_props_0.plugin;
    local l_updateAvailable_0 = l_props_0.updateAvailable;
    local v20 = tostring(l_props_0.data.assetId);
    v16.state = {
        checked = l_props_0.data.autoUpdateEnabled, 
        lastModified = l_props_0.data.updated
    };
    v16.onClick = function()
        local l_PluginManagementService_0 = game:GetService("PluginManagementService");
        local v22 = tonumber(v20);
        local v23 = not v16.state.checked;
        l_PluginManagementService_0:SetAutoUpdate(v22, v23);
        v16:setState({
            checked = v23, 
            lastModified = l_props_0.data.updated
        });
        if not (not v23 or not l_updateAvailable_0) then
            l_props_0.Analytics:report("TryUpdatePlugin", l_props_0.data.assetId);
            l_props_0.UpdatePlugin(l_props_0.data, l_props_0.Analytics);
        end;
    end;
end;
v15.render = function(v24)
    local l_props_1 = v24.props;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local l_Localization_0 = l_props_1.Localization;
    local l_Stylizer_0 = l_props_1.Stylizer;
    return v1.createElement(l_Pane_0, {
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        LayoutOrder = l_LayoutOrder_0, 
        Layout = Enum.FillDirection.Horizontal, 
        Position = UDim2.fromOffset(0, 0), 
        Size = UDim2.new(1, 0, 0, v5.PLUGIN_UPDATE_HEIGHT), 
        Spacing = 10, 
        Style = "Box"
    }, {
        UpdatePane = v1.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = 1, 
            Spacing = 10, 
            Style = "Box"
        }, {
            UpdateCheckbox = v1.createElement(l_Checkbox_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Checked = v24.state.checked, 
                Disabled = false, 
                Font = l_Stylizer_0.Font, 
                LayoutOrder = 1, 
                OnClick = v24.onClick
            }), 
            UpdateText = v1.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                Font = l_Stylizer_0.Font, 
                LayoutOrder = 2, 
                Text = l_Localization_0:getText("PluginEntry", "AutoUpdateText"), 
                TextSize = 16, 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        }), 
        Separator = v1.createElement(l_Separator_0, {
            DominantAxis = Enum.DominantAxis.Height, 
            LayoutOrder = 2, 
            Style = l_Stylizer_0.Separator
        }), 
        LastUpdatedText = v1.createElement(l_TextLabel_0, {
            Font = l_Stylizer_0.Font, 
            LayoutOrder = 3, 
            Size = UDim2.fromScale(0.5, 1), 
            Text = l_Localization_0:getText("PluginEntry", "AutoUpdateEntry", {
                date = v24.state.lastModified
            }), 
            TextSize = 16, 
            TextXAlignment = Enum.TextXAlignment.Left
        })
    });
end;
return v2.connect(nil, function(v29)
    return {
        UpdatePlugin = function(v30, v31)
            v29(v14(v30, v31));
        end
    };
end)((l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer
})(v15)));
