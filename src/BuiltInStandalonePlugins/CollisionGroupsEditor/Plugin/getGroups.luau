local l_PhysicsService_0 = game:GetService("PhysicsService");
local v1 = require(script.Parent.Constants);
local function v7(v2, v3)
    local v4 = {};
    for _, v6 in pairs(v3) do
        table.insert(v4, {
            Name = v6.name, 
            Collides = l_PhysicsService_0:CollisionGroupsAreCollidable(v2.name, v6.name)
        });
    end;
    return v4;
end;
local _ = function(v8)
    for _, v10 in pairs(v8) do
        if v10.Name == "Default" then
            return v10;
        end;
    end;
    error("Default group not found");
end;
local function v18(v12)
    for _, v14 in v12, nil, nil do
        if v14.Name == v1.CursorGroupName then
            return v14;
        end;
    end;
    local v15 = {
        Name = v1.CursorGroupName, 
        Id = v1.CursorGroupName, 
        Virtual = true, 
        Collisions = {
            {
                Name = v1.CursorGroupName, 
                Collides = true
            }
        }
    };
    for _, v17 in v12, nil, nil do
        table.insert(v15.Collisions, {
            Name = v17.Name, 
            Collides = true
        });
        table.insert(v17.Collisions, {
            Name = v1.CursorGroupName, 
            Collides = true
        });
    end;
    return v15;
end;
local function v31(v19)
    local v20;
    for _, v22 in pairs(v19) do
        if v22.Name == "Default" then
            v20 = v22;
            goto label0 --[[  true, false  ]];
        end;
    end;
    error("Default group not found");
    v20 = nil;
    ::label0::;
    local v23 = v18(v19);
    local v24 = {};
    for _, v26 in pairs(v19) do
        if v26 ~= v20 and v26 ~= v23 then
            table.insert(v24, v26);
        end;
    end;
    table.sort(v24, function(v27, v28)
        return v27.Name < v28.Name;
    end);
    local v29 = {
        v20, 
        v23
    };
    for v30 = 1, #v24 do
        table.insert(v29, v24[v30]);
    end;
    return v29;
end;
return function()
    local v32 = {};
    local l_l_PhysicsService_0_RegisteredCollisionGroups_0 = l_PhysicsService_0:GetRegisteredCollisionGroups();
    for _, v35 in pairs(l_l_PhysicsService_0_RegisteredCollisionGroups_0) do
        table.insert(v32, {
            Name = v35.name, 
            Id = v35.name, 
            Collisions = v7(v35, l_l_PhysicsService_0_RegisteredCollisionGroups_0)
        });
    end;
    return (v31(v32));
end;
