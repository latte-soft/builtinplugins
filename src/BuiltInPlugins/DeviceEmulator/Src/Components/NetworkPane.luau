local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SimpleExpandablePane_0 = l_UI_0.SimpleExpandablePane;
local l_TextInput_0 = l_UI_0.TextInput;
local v10 = v1.PureComponent:extend("NetworkPane");
local l_Network_0 = settings().Network;
local l_l_Network_0_PropertyChangedSignal_0 = l_Network_0:GetPropertyChangedSignal("IncomingReplicationLag");
v10.init = function(v13, _)
    v13.state = {
        incomingReplicationLag = tostring(l_Network_0.IncomingReplicationLag)
    };
    v13.incomingReplicationLagChangedConnection = l_l_Network_0_PropertyChangedSignal_0:Connect(function()
        v13:setState({
            incomingReplicationLag = tostring(l_Network_0.IncomingReplicationLag)
        });
    end);
end;
v10.willUnmount = function(v15)
    v15.incomingReplicationLagChangedConnection:Disconnect();
end;
v10.render = function(v16)
    local l_props_0 = v16.props;
    local l_state_0 = v16.state;
    local l_Localization_1 = l_props_0.Localization;
    return v1.createElement(l_Pane_0, {
        AutomaticSize = Enum.AutomaticSize.Y, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Vertical, 
        Padding = 10, 
        Spacing = 10
    }, {
        networkPane = v1.createElement(l_SimpleExpandablePane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Vertical, 
            AlwaysExpanded = true, 
            LayoutOrder = 2, 
            Style = "Box", 
            Text = l_Localization_1:getText("NetworkSettings", "NetworkReplicationLagLabel")
        }, {
            v1.createElement(l_TextInput_0, {
                PlaceholderText = l_Localization_1:getText("NetworkSettings", "NetworkReplicationLagPlaceholder"), 
                ShouldFocus = true, 
                Width = 100, 
                MaxLength = 5, 
                OnValidateText = function(v20)
                    local v21 = true;
                    if v20 ~= "" then
                        v21 = tonumber(v20) ~= nil;
                    end;
                    local v22 = nil;
                    if not v21 then
                        v22 = l_Localization_1:getText("NetworkSettings", "NetworkReplicationLagNotNumberError");
                    end;
                    return v21, v22;
                end, 
                OnFormatText = function(v23)
                    if string.len(v23) > 5 then
                        return (string.sub(v23, 1, 5));
                    else
                        return v23;
                    end;
                end, 
                Text = l_state_0.incomingReplicationLag, 
                OnTextChanged = function(v24)
                    l_Network_0.IncomingReplicationLag = tonumber(v24 or 0);
                    v16:setState({
                        incomingReplicationLag = v24
                    });
                end
            })
        })
    });
end;
return (l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_ContextServices_0.Stylizer
})(v10));
