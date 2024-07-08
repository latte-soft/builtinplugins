local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local l_joinTags_0 = require(l_Parent_0.Packages.Framework).Styling.joinTags;
local _ = require(l_Parent_0.Src.Renderers.SequenceRenderers.Types);
return function(v4)
    local l_PlotAbsoluteSize_0 = v4.PlotAbsoluteSize;
    local v6 = l_PlotAbsoluteSize_0 * Vector2.new(v4.StartKeypoint.Time, 1 - v4.StartKeypoint.Value);
    local v7 = l_PlotAbsoluteSize_0 * Vector2.new(v4.EndKeypoint.Time, 1 - v4.EndKeypoint.Value);
    local v8 = (v6 + v7) / 2;
    local v9 = v7 - v6;
    return v1.createElement("Frame", {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Position = UDim2.fromOffset(v8.X, v8.Y), 
        Rotation = math.deg((math.atan2(v9.Y, v9.X))), 
        Size = UDim2.fromOffset(v9.Magnitude, 2), 
        LayoutOrder = v4.LayoutOrder, 
        [v1.Tag] = l_joinTags_0("NumberSequenceLine", if not v4.StartKeypointSelected then nil else "SelectedStart", if not v4.EndKeypointSelected then nil else "SelectedEnd")
    });
end;
