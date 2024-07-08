local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useState_0 = v2.useState;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local l_Pane_0 = v1.UI.Pane;
local l_TextInput_0 = v1.UI.TextInput;
local l_TextLabel_0 = v1.UI.TextLabel;
local _ = v1.Util.LayoutOrderIterator;
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local l_MaterialUnit_0 = require(l_script_FirstAncestor_0.Src.Types).MaterialUnit;
local function v17(v11)
    local v12, v13 = l_useState_0(false);
    local v14 = if v11.Unit == l_MaterialUnit_0.Percentage then v11.Value * 100 else v11.Value;
    if not v12 or not v11.Editable then
        return v2.createElement(l_Pane_0, {
            AnchorPoint = Vector2.new(0, 0.5), 
            OnClick = function()
                if v11.Editable then
                    v13(true);
                end;
            end, 
            Position = v11.Position, 
            Size = v11.Size
        }, {
            Label = v2.createElement(l_TextLabel_0, {
                Text = tostring((math.floor(v14)))
            })
        });
    else
        return v2.createElement(l_TextInput_0, {
            AnchorPoint = Vector2.new(0, 0.5), 
            OnFocusLost = function(v15)
                if v15 then
                    local v16 = tonumber(v15);
                    if v16 then
                        v11.OnChanged(if v11.Unit == l_MaterialUnit_0.Percentage then v16 / 100 else v16);
                        v13(false);
                    end;
                end;
            end, 
            Position = v11.Position, 
            Size = v11.Size, 
            Text = tostring((math.floor(v14)))
        });
    end;
end;
return function(v18)
    local v19 = l_Stylizer_0:use("ElevationRenderer");
    local l_Max_0 = v18.Max;
    local l_Min_0 = v18.Min;
    local l_MaxHeight_0 = v18.MaxHeight;
    local l_MinHeight_0 = v18.MinHeight;
    local v24 = l_Max_0 - l_Min_0;
    local v25 = v19.SliderSize.Y.Offset - 20;
    local l_Offset_0 = v19.TextBoxSize.Y.Offset;
    local v27 = nil;
    local v28 = nil;
    if not (not l_MinHeight_0 or not l_MaxHeight_0) then
        v27 = (1 - l_MaxHeight_0 / v24) * v25;
        v28 = (1 - l_MinHeight_0 / v24) * v25;
        local v29 = v27 - 0 < l_Offset_0;
        local v30 = v25 - v28 < l_Offset_0;
        if v29 then
            v27 = 0 + l_Offset_0;
            if v28 - v27 < l_Offset_0 then
                v28 = v27 + l_Offset_0;
            end;
        end;
        if v30 then
            v28 = v25 - l_Offset_0;
            if v28 - v27 < l_Offset_0 then
                v27 = v28 - l_Offset_0;
            end;
        end;
    end;
    return v2.createElement("Frame", {
        BackgroundTransparency = 1, 
        Size = UDim2.fromOffset(v19.TextBoxSize.X.Offset, v19.SliderSize.Y.Offset)
    }, {
        Min = v2.createElement(v17, {
            Editable = v18.Unit == l_MaterialUnit_0.Stud, 
            OnChanged = function(v31)
                v18.OnChanged({
                    Min = v31
                });
            end, 
            Position = UDim2.new(0, 0, 0, v25), 
            Size = v19.TextBoxSize, 
            Unit = v18.Unit, 
            Value = l_Min_0
        }), 
        MinHeight = if not not l_MaxHeight_0 and l_MinHeight_0 then v2.createElement(v17, {
            Editable = true, 
            OnChanged = function(v32)
                v18.OnChanged({
                    MinHeight = math.clamp(v32, l_Min_0, l_MaxHeight_0)
                });
            end, 
            Position = UDim2.new(0, 0, 0, v28), 
            Size = v19.TextBoxSize, 
            Unit = v18.Unit, 
            Value = l_MinHeight_0
        }) else nil, 
        MaxHeight = if not not l_MaxHeight_0 and l_MinHeight_0 then v2.createElement(v17, {
            Editable = true, 
            OnChanged = function(v33)
                v18.OnChanged({
                    MaxHeight = math.clamp(v33, l_MinHeight_0, l_Max_0)
                });
            end, 
            Position = UDim2.new(0, 0, 0, v27), 
            Size = v19.TextBoxSize, 
            Unit = v18.Unit, 
            Value = l_MaxHeight_0
        }) else nil, 
        Max = v2.createElement(v17, {
            Editable = v18.Unit == l_MaterialUnit_0.Stud, 
            OnChanged = function(v34)
                v18.OnChanged({
                    Max = v34
                });
            end, 
            Position = UDim2.new(0, 0, 0, 0), 
            Size = v19.TextBoxSize, 
            Unit = v18.Unit, 
            Value = l_Max_0
        })
    });
end;
