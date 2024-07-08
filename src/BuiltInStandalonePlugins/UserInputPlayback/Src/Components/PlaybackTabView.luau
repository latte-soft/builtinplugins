local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_Pane_0 = v3.UI.Pane;
local v6 = require(l_Parent_0.Src.Util.Enums);
local v7 = require(l_Parent_0.Src.Components.FileSelectorUIGroup);
local v8 = require(l_Parent_0.Src.Components.PlaybackInfoUIGroup);
local v9 = require(l_Parent_0.Src.Components.FilterSettingsUIGroup);
local v10 = v1.PureComponent:extend("PlaybackTabView");
v10.render = function(v11)
    local l_props_0 = v11.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v14 = true;
    if l_props_0.PluginState ~= v6.PluginState.Playing then
        v14 = l_props_0.PluginState == v6.PluginState.Disabled;
    end;
    return v1.createElement(l_Pane_0, {
        Size = UDim2.new(1, 0, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        Padding = l_Stylizer_0.PaddingPx, 
        Layout = Enum.FillDirection.Vertical, 
        Spacing = UDim.new(0, l_Stylizer_0.PaddingPx), 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        FileSelector = v1.createElement(v7, {
            LayoutOrder = 1, 
            RoduxStoreContext = "playbackTabFilter"
        }), 
        PlaybackInfoGroup = v1.createElement(v8, {
            LayoutOrder = 2
        }), 
        FilterSettings = v1.createElement(v9, {
            LayoutOrder = 3, 
            RoduxStoreContext = "playbackTabFilter", 
            Disabled = v14
        })
    });
end;
return v2.connect(function(v15, _)
    return {
        PluginState = v15.common.pluginState
    };
end, nil)((l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer
})(v10)));
