local l_Parent_0 = script.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local l_Utility_0 = l_Parent_0.Src.Utility;
local v3 = require(l_Utility_0.Constants);
local v4 = require(l_Utility_0.SphereWireframe);
local v5 = require(l_Utility_0.ConeWireframe);
local v6 = require(l_Utility_0.TrapezoidalPrismWireframe);
local v7 = require(l_Utility_0.isProtectedInstance);
local v8 = {
    PointLight = "PointLight", 
    SpotLight = "SpotLight", 
    SurfaceLight = "SurfaceLight"
};
local v9 = {
    [v8.PointLight] = v4.new, 
    [v8.SpotLight] = v5.new, 
    [v8.SurfaceLight] = v6.new
};
local l_Selection_0 = game:GetService("Selection");
local l_CoreGui_0 = game:GetService("CoreGui");
local function _(v12, v13, v14)
    assert(v9[v12], string.format("Light type %s needs to be associated with a corresponding wireframe", v12));
    local v15 = v9[v12]();
    v15:setGuidesFolder(v14);
    v15:adorn(v13);
    return v15;
end;
local v17 = {};
v17.__index = v17;
v17.new = function()
    local v18 = {
        _folder = l_CoreGui_0:FindFirstChild("LightGuides"), 
        _wireframePools = {
            [v8.PointLight] = {}, 
            [v8.SpotLight] = {}, 
            [v8.SurfaceLight] = {}
        }, 
        _wireframes = {}, 
        _storedLightGuides = 0, 
        _listener = nil
    };
    if not v18._folder then
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Name = "LightGuides";
        l_Folder_0.Parent = l_CoreGui_0;
        v18._folder = l_Folder_0;
    end;
    setmetatable(v18, v17);
    v18._listener = l_Selection_0.SelectionChanged:Connect(function()
        v18:renderSelection();
    end);
    return v18;
end;
v17.renderSelection = function(v20)
    local v21 = {};
    local v22 = {};
    for _, v24 in ipairs(l_Selection_0:Get()) do
        if not (v7(v24) or not v24:IsA("Light")) then
            if not v20._wireframes[v24] then
                v22[v24] = v24.ClassName;
            else
                v21[v24] = v20._wireframes[v24];
                v20._wireframes[v24] = nil;
            end;
        end;
    end;
    for v25, v26 in pairs(v20._wireframes) do
        local l_ClassName_0 = v25.ClassName;
        assert(v20._wireframePools[l_ClassName_0], string.format("Light type %s needs to be associated with a corresponding wireframe", l_ClassName_0));
        table.insert(v20._wireframePools[l_ClassName_0], v26:pool());
        v20._storedLightGuides = v20._storedLightGuides + 1;
        v20._wireframes[v25] = nil;
    end;
    for v28, v29 in pairs(v22) do
        local v30 = #v20._wireframePools[v29];
        if v30 >= 1 then
            v21[v28] = v20._wireframePools[v29][v30]:adorn(v28);
            v20._wireframePools[v29][v30] = nil;
            v20._storedLightGuides = v20._storedLightGuides - 1;
        else
            if v3.MAX_POOL_SIZE <= #v20._wireframes + v20._storedLightGuides then
                for _, v32 in pairs(v20._wireframePools) do
                    if #v32 > 0 then
                        v32[#v32]:destroy();
                        v32[#v32] = nil;
                        break;
                    end;
                end;
            end;
            local l__folder_0 = v20._folder;
            assert(v9[v29], string.format("Light type %s needs to be associated with a corresponding wireframe", v29));
            local v34 = v9[v29]();
            v34:setGuidesFolder(l__folder_0);
            v34:adorn(v28);
            v21[v28] = v34;
        end;
        v21[v28]:render();
    end;
    v20._wireframes = v21;
end;
v17.emptyPools = function(v35)
    for _, v37 in pairs(v35._wireframePools) do
        for _, v39 in pairs(v37) do
            v39:destroy();
        end;
    end;
end;
v17.emptyWireframes = function(v40)
    for _, v42 in pairs(v40._wireframes) do
        v42:destroy();
    end;
end;
v17.destroy = function(v43)
    v43:emptyWireframes();
    v43:emptyPools();
    v43._wireframes = nil;
    v43._wireframePools = nil;
    v43._folder:Destroy();
    v43._listener:Disconnect();
end;
return v17;
