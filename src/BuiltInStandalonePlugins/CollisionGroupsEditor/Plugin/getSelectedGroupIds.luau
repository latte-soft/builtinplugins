local _ = game:GetService("PhysicsService");
local v1 = require(script.Parent.getSelectedParts);
return function(v2)
    local v3 = v1();
    local v4 = {};
    for _, v6 in pairs(v3) do
        for _, v8 in pairs(v2) do
            if v6.CollisionGroup == v8.Name then
                v4[v8] = true;
                break;
            end;
        end;
    end;
    local v9 = {};
    for v10, _ in pairs(v4) do
        table.insert(v9, v10.Id);
    end;
    return v9;
end;
