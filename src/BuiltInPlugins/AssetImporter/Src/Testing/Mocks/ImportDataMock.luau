local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v2 = require(l_script_FirstAncestor_0.Src.Testing.Mocks.EventMock);
local v3 = require(l_script_FirstAncestor_0.Src.Testing.Mocks.MakeMockStatus);
local v4 = {};
v4.__index = v4;
v4.new = function(v5, v6)
    local v7 = setmetatable({}, v4);
    v7.Id = v5;
    v7.ImportName = "ImportMock";
    v7.ShouldImport = true;
    v7.ClassName = "BaseImportData";
    v7.Parent = nil;
    v7.Changed = v2.new();
    for v8, v9 in pairs(v6) do
        v7[v8] = v9;
    end;
    v7._propertyChangedSignal = v2.new();
    v7._statuses = {};
    v7._childLookup = {};
    v7._previewInstance = nil;
    return v7;
end;
v4.GetPropertyChangedSignal = function(v10)
    return v10._propertyChangedSignal;
end;
v4.SetClassName = function(v11, v12)
    v11.ClassName = v12;
end;
v4.AddMockStatus = function(v13, v14, v15, v16)
    v13._statuses[v15] = v3(v14, v15, {
        DebugMessage = v16
    });
end;
v4.GetStatuses = function(v17)
    return v17._statuses;
end;
v4.IsA = function(v18, v19)
    if not (v19 ~= "BaseImportData" and v19 ~= v18.ClassName) or v19 == "Instance" then
        return true;
    else
        return false;
    end;
end;
v4._addChild = function(v20, v21)
    v20._childLookup[v21] = true;
end;
v4._removeChild = function(v22, v23)
    v22._childLookup[v23] = nil;
end;
v4.GetChildren = function(v24)
    local v25 = {};
    for v26, _ in pairs(v24._childLookup) do
        table.insert(v25, v26);
    end;
    return v25;
end;
v4.SetParent = function(v28, v29)
    if v28.Parent ~= nil then
        v28.Parent:_removeChild(v28);
    end;
    v28.Parent = v29;
    if v29 ~= nil then
        v29:_addChild(v28);
    end;
end;
v4.Destroy = function(v30)
    v30._propertyChangedSignal:Destroy();
    if v30.Parent ~= nil then
        v30.Parent:_removeChild(v30);
    end;
    for v31, _ in pairs(v30._childLookup) do
        v31:SetParent(nil);
    end;
    v30._childLookup = {};
    v30.Parent = nil;
    if v30._previewInstance then
        v30._previewInstance:Destroy();
        v30._previewInstance = nil;
    end;
end;
v4.AddPreviewInstance = function(v33, v34)
    v33._previewInstance = v34;
end;
v4.GetPreview = function(v35)
    return v35._previewInstance;
end;
v4.GetDescendants = function(v36)
    local v37 = {};
    for v38, _ in pairs(v36._childLookup) do
        table.insert(v37, v38);
        if v38:IsA("BaseImportData") then
            for _, v41 in ipairs((v38:GetDescendants())) do
                table.insert(v37, v41);
            end;
        end;
    end;
    return v37;
end;
return v4;
