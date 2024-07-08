local v0 = require(script:FindFirstAncestor("R15Migrator").Src.Util.SaveInterface);
local v1 = {
    game:GetService("Chat"), 
    game:GetService("Lighting"), 
    game:GetService("ReplicatedFirst"), 
    game:GetService("ReplicatedStorage"), 
    game:GetService("ServerScriptService"), 
    game:GetService("ServerStorage"), 
    game:GetService("StarterGui"), 
    game:GetService("StarterPack"), 
    game:GetService("StarterPlayer"), 
    game:GetService("Workspace")
};
local function v7(v2, v3, v4)
    for _, v6 in v3, nil, nil do
        if not (v2 and not v2(v6)) then
            table.insert(v4, v6);
        end;
    end;
end;
return function(v8)
    local v9 = {};
    for _, v11 in v1, nil, nil do
        assert(v0.isRootSaveFolderChildOf(v11) or not v0.isRootSaveFolderDescendantOf(v11));
        if not v0.isRootSaveFolderChildOf(v11) then
            v7(v8, v11:GetDescendants(), v9);
        else
            for _, v13 in v11:GetChildren() do
                if not v0.isRootSaveFolder(v13) then
                    local l_v13_Descendants_0 = v13:GetDescendants();
                    table.insert(l_v13_Descendants_0, v13);
                    v7(v8, l_v13_Descendants_0, v9);
                end;
            end;
        end;
    end;
    return v9;
end;
