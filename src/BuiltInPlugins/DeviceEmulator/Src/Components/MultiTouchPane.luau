local l_StudioDeviceEmulatorService_0 = game:GetService("StudioDeviceEmulatorService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SimpleExpandablePane_0 = l_UI_0.SimpleExpandablePane;
local l_Checkbox_0 = l_UI_0.Checkbox;
local v11 = v2.PureComponent:extend("MultiTouchPane");
v11.init = function(v12, _)
    v12.state = {
        multiTouchEmulationOn = l_StudioDeviceEmulatorService_0.IsMultiTouchEmulationOn
    };
    v12.toggleMultiTouchEmulationOn = function()
        local v14 = not v12.state.multiTouchEmulationOn;
        l_StudioDeviceEmulatorService_0.IsMultiTouchEmulationOn = v14;
        v12:setState({
            multiTouchEmulationOn = v14
        });
    end;
end;
v11.render = function(v15)
    local l_props_0 = v15.props;
    local l_state_0 = v15.state;
    local l_Localization_1 = l_props_0.Localization;
    return v2.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Vertical, 
        Padding = 10, 
        Spacing = 10
    }, {
        MultiTouchPane = v2.createElement(l_SimpleExpandablePane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Vertical, 
            AlwaysExpanded = true, 
            LayoutOrder = 3, 
            Style = "Box", 
            Text = l_Localization_1:getText("MultiTouchPane", "MultiTouchPaneLabel")
        }, {
            v2.createElement(l_Checkbox_0, {
                Checked = l_state_0.multiTouchEmulationOn, 
                Key = "multiTouchEmulationOn", 
                OnClick = v15.toggleMultiTouchEmulationOn, 
                Text = l_Localization_1:getText("MultiTouchPane", "MultiTouchPaneCheckboxLabel")
            })
        })
    });
end;
return (l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_ContextServices_0.Stylizer
})(v11));
