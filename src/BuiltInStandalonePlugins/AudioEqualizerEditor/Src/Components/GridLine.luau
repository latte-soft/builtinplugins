local _ = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AudioEqualizerEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useMemo_0 = v2.useMemo;
local v4 = require(l_script_FirstAncestor_0.Src.Util.PlotUtil);
return function(v5)
    local v11 = l_useMemo_0(function()
        local v6 = Vector2.new(-1, -1);
        local v7 = Vector2.new(-1, -1);
        if v5.Orientation == "Vertical" then
            v6 = Vector2.new(v5.Position, v4.Y_MIN);
            v7 = Vector2.new(v5.Position, v4.Y_MAX);
        elseif v5.Orientation == "Horizontal" then
            v6 = Vector2.new(v4.X_MIN, v5.Position);
            v7 = Vector2.new(v4.X_MAX, v5.Position);
        end;
        v6 = v4.plotToAbs(v6, v5.PlotAbsoluteSize);
        v7 = v4.plotToAbs(v7, v5.PlotAbsoluteSize);
        local v8 = (v6 + v7) / 2;
        local v9 = UDim2.fromOffset(v8.X + v5.PlotFramePadding, v8.Y + v5.PlotFramePadding);
        local v10 = UDim2.fromOffset(0, 0);
        if v5.Orientation == "Vertical" then
            v10 = UDim2.fromOffset(2, (v7 - v6).Magnitude);
        elseif v5.Orientation == "Horizontal" then
            v10 = UDim2.fromOffset((v7 - v6).Magnitude, 2);
        end;
        return {
            Position = v9, 
            Size = v10
        };
    end, {
        v5
    });
    local v15 = l_useMemo_0(function()
        local v12 = UDim2.fromOffset(0, 0);
        local l_Center_0 = Enum.TextXAlignment.Center;
        local l_Center_1 = Enum.TextYAlignment.Center;
        if v5.Orientation == "Vertical" then
            v12 = UDim2.new(0.5, 0, 1, 5);
            l_Center_1 = Enum.TextYAlignment.Top;
        elseif v5.Orientation == "Horizontal" then
            v12 = UDim2.new(0, -5, 0.5, 0);
            l_Center_0 = Enum.TextXAlignment.Right;
        end;
        return {
            Position = v12, 
            XAlignment = l_Center_0, 
            YAlignment = l_Center_1
        };
    end, {
        v5.Orientation
    });
    return v2.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = v11.Position, 
        Size = v11.Size, 
        BackgroundTransparency = l_useMemo_0(function()
            if not v5.IsMinor then
                return 0.5;
            else
                return 0.75;
            end;
        end, {
            v5.IsMinor
        }), 
        [v2.Tag] = "GridLine"
    }, {
        Label = not v5.IsMinor and v2.createElement("TextLabel", {
            Position = v15.Position, 
            Size = UDim2.fromOffset(0, 0), 
            Text = tostring(v5.Position), 
            TextXAlignment = v15.XAlignment, 
            TextYAlignment = v15.YAlignment, 
            [v2.Tag] = "GridLabel"
        })
    });
end;
