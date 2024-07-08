local _ = script.Parent;
local v1 = require(script:FindFirstAncestor("AttenuationCurveEditor").Packages.React);
local l_useMemo_0 = v1.useMemo;
return function(v3)
    local v10 = l_useMemo_0(function()
        local v4 = Vector2.new(-1, -1);
        local v5 = Vector2.new(-1, -1);
        local v6 = UDim2.fromOffset(0, 0);
        if v3.Orientation == "Vertical" then
            local v7 = (v3.Position - v3.PlotRect.Min.X) / v3.PlotRect.Width;
            if not (v7 >= 0) or v7 > 1 then
                return nil;
            else
                v4 = v3.PlotAbsoluteSize * Vector2.new(v7, 0);
                v5 = v3.PlotAbsoluteSize * Vector2.new(v7, 1);
                v6 = UDim2.fromOffset(2, (v5 - v4).Magnitude);
            end;
        elseif v3.Orientation == "Horizontal" then
            local v8 = 1 - (v3.Position - v3.PlotRect.Min.Y) / v3.PlotRect.Height;
            if not (v8 >= 0) or v8 > 1 then
                return nil;
            else
                v4 = v3.PlotAbsoluteSize * Vector2.new(0, v8);
                v5 = v3.PlotAbsoluteSize * Vector2.new(1, v8);
                v6 = UDim2.fromOffset((v5 - v4).Magnitude, 2);
            end;
        end;
        local v9 = (v4 + v5) / 2;
        return {
            Position = UDim2.fromOffset(v9.X + v3.PlotFramePadding, v9.Y + v3.PlotFramePadding), 
            Size = v6
        };
    end, {
        v3
    });
    local v14 = l_useMemo_0(function()
        local v11 = UDim2.fromOffset(0, 0);
        local l_Center_0 = Enum.TextXAlignment.Center;
        local l_Center_1 = Enum.TextYAlignment.Center;
        if v3.Orientation == "Vertical" then
            v11 = UDim2.new(0.5, 0, 1, 5);
            l_Center_1 = Enum.TextYAlignment.Top;
        elseif v3.Orientation == "Horizontal" then
            v11 = UDim2.new(0, -5, 0.5, 0);
            l_Center_0 = Enum.TextXAlignment.Right;
        end;
        return {
            Position = v11, 
            XAlignment = l_Center_0, 
            YAlignment = l_Center_1
        };
    end, {
        v3.Orientation
    });
    local v15 = l_useMemo_0(function()
        if v3.InnerAlpha then
            return 1 - 0.4 * v3.InnerAlpha;
        else
            return 0.6;
        end;
    end, {
        v3.InnerAlpha
    });
    if v10 then
        local v16 = {};
        if not v3.InnerAlpha then
            v16.Label = v1.createElement("TextLabel", {
                Position = v14.Position, 
                Size = UDim2.fromOffset(0, 0), 
                Text = string.format("%.1f", v3.Position), 
                TextXAlignment = v14.XAlignment, 
                TextYAlignment = v14.YAlignment, 
                [v1.Tag] = "GridLabel"
            });
        end;
        return v1.createElement("Frame", {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = v10.Position, 
            Size = v10.Size, 
            BackgroundTransparency = v15, 
            [v1.Tag] = "GridLine"
        }, v16);
    else
        return nil;
    end;
end;
