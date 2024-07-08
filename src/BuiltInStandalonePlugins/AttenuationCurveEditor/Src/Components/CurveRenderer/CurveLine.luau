local l_Parent_0 = script.Parent;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AttenuationCurveEditor");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_useMemo_0 = v2.useMemo;
local l_joinTags_0 = require(l_script_FirstAncestor_0.Packages.Framework).Styling.joinTags;
local v5 = require(l_Parent_0.PlotRectUtil);
return function(v6)
    local v14 = l_useMemo_0(function()
        local v7 = v5.clampLineToRect(v6.StartPoint, v6.EndPoint, v6.PlotRect);
        if v7 then
            local v8 = v5.plotToAbsolutePosition(v7[1], v6.PlotRect, v6.PlotAbsoluteSize);
            local v9 = v5.plotToAbsolutePosition(v7[2], v6.PlotRect, v6.PlotAbsoluteSize);
            local v10 = (v8 + v9) / 2;
            local v11 = v9 - v8;
            local v12 = math.atan2(v11.Y, v11.X);
            local v13 = 4;
            if v6.IsEndLine then
                v13 = 2;
            end;
            return {
                Position = UDim2.fromOffset(v10.X, v10.Y), 
                Rotation = math.deg(v12), 
                Size = UDim2.fromOffset(v11.Magnitude, v13)
            };
        else
            return nil;
        end;
    end, {
        v6.StartPoint, 
        v6.EndPoint, 
        v6.PlotRect, 
        v6.PlotAbsoluteSize, 
        v6.IsEndLine
    });
    return v14 and v2.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = v14.Position, 
        Rotation = v14.Rotation, 
        Size = v14.Size, 
        [v2.Tag] = l_joinTags_0("CurveLine", if not v6.StartPointSelected then nil else "SelectedStart", if not v6.EndPointSelected then nil else "SelectedEnd")
    });
end;
