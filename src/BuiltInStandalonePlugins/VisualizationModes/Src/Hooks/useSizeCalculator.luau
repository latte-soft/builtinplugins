local v0 = require(script:FindFirstAncestor("VisualizationModes").Packages.React);
return function(v1)
    local v2, v3 = v0.useState(nil);
    local v4, v5 = v0.useState(function()
        if not v2 then
            return Vector2.zero;
        else
            return v2.AbsoluteSize;
        end;
    end);
    local v7 = v0.useCallback(function(v6)
        v3(v6);
    end, {});
    v0.useEffect(function()
        local l_v2_0 = v2;
        if l_v2_0 == nil then
            v5(Vector2.zero);
            return nil;
        else
            local v9 = l_v2_0:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
                v5(l_v2_0.AbsoluteSize);
            end);
            v5(l_v2_0.AbsoluteSize);
            return function()
                v9:Disconnect();
            end;
        end;
    end, {
        v2
    });
    if v2 then
        v4 = v2.AbsoluteSize;
    end;
    local v10 = Vector2.new(v1.Width, v1.HeaderHeight) + v1.Padding;
    local v11 = math.clamp(v4.Y, 0, ((v1.MaxHeight - v1.HeaderHeight) - v1.InnerPadding) - v1.Padding.Y);
    local v12 = UDim2.new(1, 0, 0, v11);
    if v11 > 0 then
        v10 = v10 + Vector2.new(0, v11 + v1.InnerPadding);
    end;
    local l_freeze_0 = table.freeze;
    local v14 = {};
    local v15 = false;
    if v2 ~= nil then
        v15 = v4.Y > 0;
    end;
    v14.loaded = v15;
    v14.contentFrameRef = v7;
    v14.size = v10;
    v14.scrollingFrameSize = v12;
    return l_freeze_0(v14);
end;
