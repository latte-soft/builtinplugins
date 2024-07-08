local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_UI_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v6 = v1.PureComponent:extend("Timestamp");
v6.init = function(v7)
    v7.formatTime = function(v8)
        if v8 == -math.huge then
            return "-inf";
        elseif v8 == math.huge then
            return "inf";
        else
            return string.format("%02d.%02d", math.floor(v8), math.floor(v8 * 100 + 0.5) % 100);
        end;
    end;
    v7.createLoadingBar = function(v9)
        return v1.createElement(l_Pane_0, {
            BackgroundColor = v7.props.BarBackground, 
            BorderColor3 = v7.props.BarBorder, 
            BorderSizePixel = 1, 
            AnchorPoint = Vector2.new(0, 1), 
            Size = UDim2.new(1, -10, 0, 2), 
            Position = UDim2.new(0, 5, 1, -1), 
            ZIndex = 1
        }, {
            Progress = v1.createElement(l_Pane_0, {
                Size = UDim2.fromScale(math.clamp(v9, 0, 1), 1), 
                BackgroundColor = v7.props.BarColor
            })
        });
    end;
end;
v6.render = function(v10)
    local l_props_0 = v10.props;
    local v12 = nil;
    local v13 = l_props_0.Length or 0;
    local v14 = not l_props_0.TimePercentage and 0 or math.clamp(l_props_0.TimePercentage * v13, 0, v13);
    if v13 > 0 then
        v12 = {
            ProgressBar = v10.createLoadingBar(l_props_0.TimePercentage), 
            TextLabel = v1.createElement(l_TextLabel_0, {
                TextColor = l_props_0.TextColor, 
                Font = l_props_0.Font, 
                Text = string.format("%s / %s", v10.formatTime(v14), v10.formatTime(v13)), 
                TextXAlignment = Enum.TextXAlignment.Center, 
                ZIndex = 2
            })
        };
    end;
    return v1.createElement(l_Pane_0, {
        Size = l_props_0.Size, 
        LayoutOrder = l_props_0.LayoutOrder
    }, v12);
end;
return v6;
