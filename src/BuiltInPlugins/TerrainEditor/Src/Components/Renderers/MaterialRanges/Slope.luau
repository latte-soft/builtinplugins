local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local l_useCallback_0 = v2.useCallback;
local l_Pane_0 = v1.UI.Pane;
local l_TextInput_0 = v1.UI.TextInput;
local l_TextLabel_0 = v1.UI.TextLabel;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
return function(v10)
    local v11 = l_Stylizer_0:use("SlopeRenderer");
    local v12 = l_LayoutOrderIterator_0.new();
    local l_Value_0 = v10.Value;
    local v20 = l_useCallback_0(function(v14, v15)
        local l_Min_0 = l_Value_0.Min;
        local l_Max_0 = l_Value_0.Max;
        if v14 then
            local v18 = tonumber(v14);
            if v18 then
                l_Min_0 = math.clamp(v18, 0, l_Max_0);
            end;
        end;
        if v15 then
            local v19 = tonumber(v15);
            if v19 then
                l_Max_0 = math.clamp(v19, l_Min_0, 90);
            end;
        end;
        v10.OnChanged({
            Min = l_Min_0, 
            Max = l_Max_0
        });
    end, {
        l_Value_0
    });
    return v2.createElement(l_Pane_0, {
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Horizontal, 
        Size = UDim2.new(1, 0, 0, v11.Height), 
        Spacing = v11.Spacing
    }, {
        MinSlope = v2.createElement(l_TextInput_0, {
            LayoutOrder = v12:getNextOrder(), 
            OnFocusLost = function(v21)
                v20(v21, nil);
            end, 
            Size = UDim2.new(0, v11.TextInputWidth, 1, 0), 
            Text = tostring(l_Value_0.Min)
        }), 
        Hyphen = v2.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.X, 
            LayoutOrder = v12:getNextOrder(), 
            Size = UDim2.fromScale(0, 1), 
            Text = "-"
        }), 
        MaxSlope = v2.createElement(l_TextInput_0, {
            LayoutOrder = v12:getNextOrder(), 
            Size = UDim2.new(0, v11.TextInputWidth, 1, 0), 
            OnFocusLost = function(v22)
                v20(nil, v22);
            end, 
            Text = tostring(l_Value_0.Max)
        }), 
        Degree = v2.createElement(l_TextLabel_0, {
            AutomaticSize = Enum.AutomaticSize.X, 
            LayoutOrder = v12:getNextOrder(), 
            Size = UDim2.fromScale(0, 1), 
            Text = "\194\176"
        })
    });
end;
