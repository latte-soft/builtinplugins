local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Components_0 = l_Parent_0.Src.Components;
local v7 = require(l_Components_0.ButtonArray);
local v8 = require(l_Components_0.TextInput);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v10 = require(l_Actions_0.SetMemStoragePair);
local v11 = require(l_Actions_0.AddHistoryItem);
local v12 = require(l_Parent_0.Src.Util.Constants);
local l_MEM_STORAGE_ORDER_0 = v12.MEM_STORAGE_ORDER;
local l_INPUT_PANE_LAYOUT_0 = v12.INPUT_PANE_LAYOUT;
local l_MemStorage_0 = v12.ROUTES.MemStorage;
local l_OPERATION_SUCCESSFUL_0 = v12.OPERATION_SUCCESSFUL;
local l_MemStorage_1 = v12.VIEW_ID.MemStorage;
local l_UI_0 = v3.UI;
local l_RadioButtonList_0 = l_UI_0.RadioButtonList;
local l_Pane_0 = l_UI_0.Pane;
local v21 = require(l_Parent_0.Src.Operations.MemStorageEventRequest);
local v22 = v1.PureComponent:extend("MemStorageEventView");
v22.init = function(v23)
    v23.state = {
        SelectedRoute = l_MemStorage_0.GetValue
    };
    v23.createRoutes = function()
        local v24 = {};
        for _, v26 in pairs(l_MemStorage_0) do
            table.insert(v24, {
                Key = v26, 
                Text = v26
            });
        end;
        return v24;
    end;
    v23.Router = function(v27)
        v23:setState({
            SelectedRoute = v27
        });
    end;
    v23.OnChange = function(v28, v29)
        v23.props.SetMemStoragePair({
            [v28] = v29
        });
    end;
    local v30 = {
        Key = "", 
        Value = ""
    };
    v23.onClearClicked = function()
        v23.props.SetMemStoragePair(v30);
    end;
    v23.onSaveClicked = function()
        v23.props.AddHistoryItem(v23.props.CurrentEventName, v23.props.KeyValuePair);
    end;
    v23.onSendClicked = function()
        local l_Key_0 = v23.props.KeyValuePair.Key;
        local l_Value_0 = v23.props.KeyValuePair.Value;
        local v33 = v23.state.SelectedRoute or "";
        if v33 == l_MemStorage_0.GetValue then
            v21.GetValue(l_Key_0);
        end;
        if not (not (v33 == l_MemStorage_0.SetValue) or not v21.SetValue(l_Key_0, l_Value_0)) then
            print(l_OPERATION_SUCCESSFUL_0);
        end;
        if not (not (v33 == l_MemStorage_0.NewEntry) or not v21.SetValue(l_Key_0, l_Value_0)) then
            print(l_OPERATION_SUCCESSFUL_0);
        end;
    end;
end;
v22.render = function(v34)
    local l_props_0 = v34.props;
    local l_KeyValuePair_0 = l_props_0.KeyValuePair;
    return v1.createElement(l_Pane_0, {
        Size = UDim2.new(1, 0, 1, 0), 
        LayoutOrder = l_INPUT_PANE_LAYOUT_0.View
    }, {
        Layout = v1.createElement("UIListLayout", l_props_0.Stylizer.Layout.Vertical), 
        Switch = v1.createElement(l_RadioButtonList_0, {
            Buttons = v34.createRoutes(), 
            OnClick = v34.Router, 
            SelectedKey = l_MemStorage_0.GetValue, 
            LayoutOrder = l_MEM_STORAGE_ORDER_0.Switch
        }), 
        Key = v1.createElement(v8, {
            LayoutOrder = l_MEM_STORAGE_ORDER_0.Key, 
            Label = "Key", 
            Text = l_KeyValuePair_0.Key, 
            OnChange = function(...)
                v34.OnChange("Key", ...);
            end
        }), 
        Value = v1.createElement(v8, {
            LayoutOrder = l_MEM_STORAGE_ORDER_0.Value, 
            Label = "Value", 
            Text = l_KeyValuePair_0.Value, 
            OnChange = function(...)
                v34.OnChange("Value", ...);
            end
        }), 
        Activators = v1.createElement(v7, {
            OnClearClicked = v34.onClearClicked, 
            OnSaveClicked = v34.onSaveClicked, 
            OnSendClicked = v34.onSendClicked
        })
    });
end;
return v2.connect(function(v37, _)
    return {
        KeyValuePair = v37.Status.MemStoragePair, 
        CurrentEventName = v37.Status.CurrentEventName
    };
end, function(v39)
    return {
        SetMemStoragePair = function(v40)
            v39(v10(v40));
        end, 
        AddHistoryItem = function(v41, v42)
            v39(v11(l_MemStorage_1, v41, v42));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v22)));
