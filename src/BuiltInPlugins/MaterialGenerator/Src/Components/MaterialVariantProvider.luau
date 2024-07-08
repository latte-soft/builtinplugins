local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Dash);
local v3 = require(l_Parent_0.Packages.MaterialFramework);
local v4 = require(l_Parent_0.Packages.React);
local l_StudioServices_0 = v3.Context.StudioServices;
local l_useEffect_0 = v4.useEffect;
local v7 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
MaterialVariantProvider = function(v8)
    assert(v7(), "Expected FFlagMaterialGeneratorNewUI to be true");
    local v9 = l_StudioServices_0.use():getServiceInstance("MaterialService");
    local l_FolderName_0 = v8.FolderName;
    local l_Materials_0 = v8.Materials;
    l_useEffect_0(function()
        local v13 = v2.map(l_Materials_0, function(v12)
            return v12.MaterialVariant;
        end);
        local v14 = nil;
        if not (not (#v13 > 0) or not l_FolderName_0) and l_FolderName_0 ~= "" then
            v14 = v9:FindFirstChild(l_FolderName_0, true);
            if not v14 then
                v14 = Instance.new("Folder");
                v14.Archivable = false;
                v14.Parent = v9;
                v14.Name = l_FolderName_0;
            end;
        end;
        for _, v16 in v13, nil, nil do
            v16.Parent = v14 or v9;
        end;
        return function()
            for _, v18 in v13, nil, nil do
                v18.Parent = nil;
            end;
            if v14 ~= nil then
                v14.Parent = nil;
                v14:Destroy();
            end;
        end;
    end, {
        l_FolderName_0, 
        l_Materials_0
    });
end;
return MaterialVariantProvider;
