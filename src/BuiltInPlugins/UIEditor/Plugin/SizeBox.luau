local v0 = {};
local v1 = require(script.Parent.SelectionManager);
local v2 = require(script.Parent.ValueBox);
local v3 = nil;
local v4 = nil;
local v5 = Vector2.new(2, 6);
local function v9(v6)
    local l_AbsoluteSize_0 = v6.AbsoluteSize;
    local l_AbsolutePosition_0 = v6.AbsolutePosition;
    return UDim2.new(0, math.max(((l_AbsolutePosition_0.X + l_AbsoluteSize_0.X) - v4:getSize().X.Offset) - v5.X, l_AbsolutePosition_0.X + v5.X), 0, (l_AbsolutePosition_0.Y + l_AbsoluteSize_0.Y) + v5.Y);
end;
v0.update = function(_)
    if v3 then
        local l_AbsoluteSize_1 = v3.AbsoluteSize;
        v4:setText((("%d x %d"):format(l_AbsoluteSize_1.X, l_AbsoluteSize_1.Y)));
        v0:updatePosition();
        return ;
    else
        return ;
    end;
end;
v0.setVisible = function(_, v13)
    if v3 then
        v4:setVisible(v13);
        return ;
    else
        return ;
    end;
end;
v0.onSelectionChanged = function(_)
    local v15 = v1:getFilteredSelection();
    if #v15 == 1 then
        v3 = v15[1];
        v0:update();
        v0:setVisible(true);
        return ;
    else
        v0:setVisible(false);
        v3 = nil;
        return ;
    end;
end;
v0.updatePosition = function(_)
    if v3 then
        v4:setPosition((v9(v3)));
        return ;
    else
        return ;
    end;
end;
v0.On = function(_)
    v4 = v2.new();
end;
v0.Off = function(_)
    v3 = nil;
    v4:Destroy();
    v4 = nil;
end;
return v0;
