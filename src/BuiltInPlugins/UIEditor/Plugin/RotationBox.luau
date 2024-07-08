local v0 = {};
local v1 = require(script.Parent.ValueBox);
local v2 = Vector2.new(4, 20);
local v3 = nil;
v0.update = function(_, v5, v6)
    local v7 = v5 + v2;
    v3:setPosition(UDim2.new(0, v7.X, 0, v7.Y));
    v3:setText((string.format("%d\194\176", v6)));
end;
v0.setVisible = function(_, v9)
    v3:setVisible(v9);
end;
v0.On = function(_)
    v3 = v1.new();
end;
v0.Off = function(_)
    v3:Destroy();
    v3 = nil;
end;
return v0;
