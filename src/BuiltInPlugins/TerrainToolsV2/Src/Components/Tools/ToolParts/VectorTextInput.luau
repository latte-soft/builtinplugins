local v0 = require(script.Parent.Parent.Parent.Parent.Parent.Packages.Roact);
local l_Parent_0 = script.Parent;
local v2 = require(l_Parent_0.LabeledElementPair);
local v3 = require(l_Parent_0.NumberTextInput);
local v4 = v0.PureComponent:extend("VectorTextInput");
v4.init = function(v5, _)
    v5.onAxisFocusLost = function(v7, v8, v9, v10)
        if v5.props.OnFocusLost then
            v5.props.OnFocusLost(v5.props.Key, v7, v8, v9, v10);
        end;
    end;
    v5.onAxisValueChanged = function(v11, v12, v13)
        if v5.props.OnValueChanged then
            v5.props.OnValueChanged(v5.props.Key, v11, v12, v13);
        end;
    end;
end;
v4.render = function(v14)
    local l_props_0 = v14.props;
    local v16 = l_props_0.LayoutOrder or 0;
    local l_Text_0 = l_props_0.Text;
    local v18 = l_props_0.MinValues or nil;
    local v19 = l_props_0.MaxValues or nil;
    local v20 = l_props_0.Precisions or nil;
    local l_Vector_0 = l_props_0.Vector;
    local v22 = l_props_0.Axes or {
        "X", 
        "Y", 
        "Z"
    };
    local v23 = {};
    for v24, v25 in ipairs(v22) do
        v23[v25] = v0.createElement(v3, {
            LayoutOrder = v24, 
            Key = v25, 
            Label = v25:upper(), 
            Value = l_Vector_0[v25], 
            Min = not not v18 and v18[v25] or nil, 
            Max = not not v19 and v19[v25] or nil, 
            Precision = not not v20 and v20[v25] or nil, 
            OnFocusLost = v14.onAxisFocusLost, 
            OnValueChanged = v14.onAxisValueChanged
        });
    end;
    return v0.createElement(v2, {
        LayoutOrder = v16, 
        Size = UDim2.new(1, 0, 0, 60), 
        Padding = UDim.new(0, 3), 
        Text = l_Text_0, 
        SizeToContent = true, 
        ErrorMessage = v14.props.ErrorMessage
    }, v23);
end;
return v4;
