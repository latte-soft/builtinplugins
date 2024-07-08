local v0 = require(script.Parent.isAssetIdLike);
local v1 = require(script.Parent.normalizeAssetId);
local v2 = require(script.Parent.findAssetIdsInSource);
local v3 = {
    game:GetService("Workspace"), 
    game:GetService("ReplicatedFirst"), 
    game:GetService("ReplicatedStorage"), 
    game:GetService("ServerStorage"), 
    game:GetService("ServerScriptService"), 
    game:GetService("Lighting"), 
    game:GetService("StarterGui"), 
    game:GetService("StarterPack"), 
    game:GetService("StarterPlayer"), 
    game:GetService("SoundService"), 
    game:GetService("Teams")
};
local _ = require(script.Parent.Parent.Types);
local v13 = {
    Sound = function(v5)
        local l_SoundId_0 = v5.SoundId;
        if not (l_SoundId_0 ~= "" and l_SoundId_0 ~= "0") or l_SoundId_0 == " " then
            return nil;
        else
            local v7 = v1(l_SoundId_0);
            if not v7 then
                return nil;
            else
                return {
                    v7
                };
            end;
        end;
    end, 
    LuaSourceContainer = function(v8)
        if v8.Parent.Name:lower() == "boombox" then
            return nil;
        else
            return v2(v8.Source);
        end;
    end, 
    StringValue = function(v9)
        local v10 = v1(v9.Value);
        if not v10 or not v0(v10) then
            return nil;
        else
            return {
                v10
            };
        end;
    end, 
    IntValue = function(v11)
        local v12 = tostring(v11.Value);
        if not v0(v12) then
            return nil;
        else
            return {
                v12
            };
        end;
    end
};
local v14 = {};
local function v19(v15)
    local v16 = v14[v15.ClassName];
    if not v16 then
        for v17, _ in pairs(v13) do
            if v15:IsA(v17) then
                v16 = v17;
            end;
        end;
        if not v16 then
            v16 = "Instance";
        end;
        v14[v15.ClassName] = v16;
    end;
    return v13[v16];
end;
return function()
    local v20 = {};
    local v21 = 0;
    for _, v23 in ipairs(v3) do
        for _, v25 in ipairs(v23:GetDescendants()) do
            local v26 = v19(v25);
            if v26 then
                local v27 = v26(v25);
                if v27 then
                    for _, v29 in ipairs(v27) do
                        local v30 = v20[v29];
                        if not v30 then
                            v20[v29] = {
                                v25
                            };
                            v21 = v21 + 1;
                        else
                            table.insert(v30, v25);
                        end;
                    end;
                end;
            end;
        end;
    end;
    return v20;
end;
