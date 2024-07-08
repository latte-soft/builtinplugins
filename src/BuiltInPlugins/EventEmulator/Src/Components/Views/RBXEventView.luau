local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Cryo);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v4.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Actions_0 = l_Parent_0.Src.Actions;
local v11 = require(l_Actions_0.SetRBXParameters);
local v12 = require(l_Actions_0.ClearRBXParameters);
local v13 = require(l_Actions_0.AddHistoryItem);
local v14 = require(l_Parent_0.Src.Util.Constants);
local l_INPUT_PANE_LAYOUT_0 = v14.INPUT_PANE_LAYOUT;
local l_RBXEVENT_ORDER_0 = v14.RBXEVENT_ORDER;
local l_RBXEvent_0 = v14.VIEW_ID.RBXEvent;
local l_Components_0 = l_Parent_0.Src.Components;
local v19 = require(l_Components_0.ButtonArray);
local v20 = require(l_Components_0.TextInput);
local v21 = require(l_Parent_0.Src.Operations.RBXEventRequest);
local l_HttpService_0 = game:GetService("HttpService");
local v23 = v1.PureComponent:extend("RBXEventView");
v23.init = function(v24)
    v24.state = {
        ValidJson = true
    };
    v24.IsCurrentJSONValid = function()
        local v25 = nil;
        if pcall(function()
            v25 = l_HttpService_0:JSONDecode(v24.props.Parameters.Detail);
        end) and v25 then
            return true;
        else
            return false;
        end;
    end;
    v24.onClearClicked = function()
        v24.props.ClearRBXParameters();
    end;
    v24.onSaveClicked = function()
        v24.props.AddHistoryItem(v24.props.CurrentEventName, v24.props.Parameters);
    end;
    v24.onSendClicked = function()
        v24:setState({
            ValidJson = v24.IsCurrentJSONValid()
        });
        v21(v24.props.Parameters);
    end;
    v24.focusLost = function(v26, v27)
        v24.props.SetRBXParameters(v3.Dictionary.join(v24.props.Parameters, {
            [v26] = v27
        }));
    end;
    v24.createChildren = function()
        local l_Parameters_0 = v24.props.Parameters;
        local v29 = {
            Warning = not v24.state.ValidJson and v1.createElement(l_TextLabel_0, {
                LayoutOrder = l_RBXEVENT_ORDER_0.Warning, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Style = "Warning"
            }), 
            Activators = v1.createElement(v19, {
                OnClearClicked = v24.onClearClicked, 
                OnSaveClicked = v24.onSaveClicked, 
                OnSendClicked = v24.onSendClicked
            })
        };
        for v30, v31 in pairs(l_Parameters_0) do
            v29[v30] = v1.createElement(v20, {
                LayoutOrder = l_RBXEVENT_ORDER_0[v30], 
                Label = v30, 
                Text = v31, 
                OnChange = function(...)
                    v24.focusLost(v30, ...);
                end
            });
        end;
        return v29;
    end;
end;
v23.render = function(v32)
    return v1.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Vertical, 
        LayoutOrder = l_INPUT_PANE_LAYOUT_0.View
    }, v32.createChildren());
end;
return v2.connect(function(v33, _)
    return {
        Parameters = v33.Status.Parameters, 
        CurrentEventName = v33.Status.CurrentEventName
    };
end, function(v35)
    return {
        SetRBXParameters = function(v36)
            v35(v11(v36));
        end, 
        ClearRBXParameters = function()
            v35(v12());
        end, 
        AddHistoryItem = function(v37, v38)
            v35(v13(l_RBXEvent_0, v37, v38));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v23)));
