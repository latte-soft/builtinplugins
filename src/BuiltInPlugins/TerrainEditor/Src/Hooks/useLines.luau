local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useEffect_0 = v1.useEffect;
local l_useState_0 = v1.useState;
local v4 = require(l_script_FirstAncestor_0.Src.Hooks.useTerrain);
local v5 = require(l_script_FirstAncestor_0.Src.Types);
local l_Category_0 = v5.Category;
local l_Tool_0 = v5.Tool;
local l_TransformMode_0 = v5.TransformMode;
local l_TransformSettings_0 = v5.TransformSettings;
local l_CoreGui_0 = game:GetService("CoreGui");
return function(v11, v12, v13, v14)
    local v15, v16 = l_useState_0({});
    local v17 = v4();
    l_useEffect_0(function()
        if not v14 then
            v16({});
            return ;
        elseif v11 == l_Tool_0.Transform then
            local v18 = v12[l_Category_0.TransformSettings][l_TransformSettings_0.TransformMode];
            local v19 = nil;
            if v18 == l_TransformMode_0.Paste then
                v19 = v12[l_Category_0.TransformSettings][l_TransformSettings_0.TerrainRegionBuffer];
            elseif not (v18 ~= l_TransformMode_0.Duplicate) or v18 == l_TransformMode_0.Import then
                v19 = v12[l_Category_0.TransformSettings][l_TransformSettings_0.TerrainRegion];
            end;
            if v19 then
                v19.Parent = l_CoreGui_0;
                v16(v19:GetRegionWireframe());
                return function()
                    v19.Parent = nil;
                end;
            else
                v16({});
                return ;
            end;
        else
            v16(v17:GetTerrainWireframe(v13.Transform, v13.Size));
            return ;
        end;
    end, {
        v11, 
        v13, 
        v14
    });
    return v15;
end;
