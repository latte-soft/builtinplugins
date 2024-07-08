local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v1 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagCAPRecentInstancesContextV2);
local v2 = require(l_script_FirstAncestor_0.Src.Utils.Utils);
local v3 = {};
local v4 = {};
local v5 = {
    Workspace = true, 
    ReplicatedStorage = true, 
    ReplicatedFirst = true, 
    ServerScriptService = true, 
    ServerStorage = true, 
    StarterGui = true, 
    StarterPack = true, 
    StarterPlayer = true, 
    StarterPlayerScripts = true, 
    StarterCharacterScripts = true
};
local v6 = {
    Created = "Created", 
    Selected = "Selected", 
    ScriptAttached = "ScriptAttached"
};
v3.getInstanceTypes = function()
    return v6;
end;
v3.registerInstance = function(v7)
    table.insert(v4, 1, {
        instanceId = v7, 
        className = v7.ClassName, 
        instanceName = v7.Name, 
        assetId = if v7.SourceAssetId > 0 then v7.SourceAssetId else nil, 
        attributes = v2.getInstanceAttributes(v7)
    });
end;
v3.registerInstanceV2 = function(v8, v9, v10)
    if not v5[v8.ClassName] then
        if v8:IsA("Script") and v10 == v6.Created then
            v3.registerInstanceV2(v8.Parent, v9, v6.ScriptAttached);
        end;
        v4[v8] = {
            instanceId = v8, 
            className = v8.ClassName, 
            instanceName = v8.Name, 
            assetId = if v8.SourceAssetId > 0 then v8.SourceAssetId else nil, 
            attributes = v2.getInstanceAttributes(v8), 
            instanceType = v10, 
            requestId = v9
        };
        return ;
    else
        return ;
    end;
end;
v3.fetchContext = function()
    return v4;
end;
v3.fetchContextV2 = function()
    assert(v1(), "RecentInstancesContextV2 is not enabled");
    local v11 = {};
    for _, v13 in pairs(v4) do
        table.insert(v11, v13);
    end;
    return v11;
end;
v3.syncContext = function()
    for v14, _ in pairs(v4) do
        if v14.Parent == nil then
            v4[v14] = nil;
        end;
    end;
end;
v3.clear = function()
    v4 = {};
end;
return v3;
