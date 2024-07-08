local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dash);
local v2 = require(l_Parent_0.Packages.MaterialFramework);
local v3 = require(l_Parent_0.Packages.React);
local l_StudioServices_0 = v2.Context.StudioServices;
local l_useEffect_0 = v3.useEffect;
local l_collect_0 = v1.collect;
local l_forEach_0 = v1.forEach;
local v8 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
MaterialVariantApplier = function(v9)
    assert(v8(), "Expected FFlagMaterialGeneratorNewUI to be true");
    local v10 = l_StudioServices_0.use():getService("Selection");
    local v11 = {};
    local _ = function(v12)
        v11 = l_collect_0(v10:Get(), function(_, v14)
            if not v14:IsA("BasePart") then
                return nil;
            else
                local v15 = {
                    OriginalMaterial = v14.Material, 
                    OriginalMaterialVariant = v14.MaterialVariant
                };
                v14.Material = v12.BaseMaterial;
                v14.MaterialVariant = v12.Name;
                return v14, v15;
            end;
        end);
    end;
    local function _()
        l_forEach_0(v11, function(v17, v18)
            v18.Material = v17.OriginalMaterial;
            v18.MaterialVariant = v17.OriginalMaterialVariant;
        end);
    end;
    l_useEffect_0(function()
        local v26 = v10.SelectionChanged:Connect(function()
            l_forEach_0(v11, function(v20, v21)
                v21.Material = v20.OriginalMaterial;
                v21.MaterialVariant = v20.OriginalMaterialVariant;
            end);
            local l_MaterialVariant_0 = v9.MaterialVariant;
            v11 = l_collect_0(v10:Get(), function(_, v24)
                if not v24:IsA("BasePart") then
                    return nil;
                else
                    local v25 = {
                        OriginalMaterial = v24.Material, 
                        OriginalMaterialVariant = v24.MaterialVariant
                    };
                    v24.Material = l_MaterialVariant_0.BaseMaterial;
                    v24.MaterialVariant = l_MaterialVariant_0.Name;
                    return v24, v25;
                end;
            end);
        end);
        local l_MaterialVariant_1 = v9.MaterialVariant;
        v11 = l_collect_0(v10:Get(), function(_, v29)
            if not v29:IsA("BasePart") then
                return nil;
            else
                local v30 = {
                    OriginalMaterial = v29.Material, 
                    OriginalMaterialVariant = v29.MaterialVariant
                };
                v29.Material = l_MaterialVariant_1.BaseMaterial;
                v29.MaterialVariant = l_MaterialVariant_1.Name;
                return v29, v30;
            end;
        end);
        return function()
            l_forEach_0(v11, function(v31, v32)
                v32.Material = v31.OriginalMaterial;
                v32.MaterialVariant = v31.OriginalMaterialVariant;
            end);
            if v26 then
                v26:Disconnect();
                v26 = nil;
            end;
        end;
    end, {
        v9.MaterialVariant
    });
end;
return MaterialVariantApplier;
