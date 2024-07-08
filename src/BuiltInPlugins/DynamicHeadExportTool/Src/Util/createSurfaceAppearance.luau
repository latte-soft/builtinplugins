local function _(v0)
    if not string.match(v0, "^%d+$") then
        return v0;
    else
        return string.format("rbxassetid://%s", v0);
    end;
end;
return function(v2)
    local l_PluginReducer_0 = v2:getState().PluginReducer;
    local l_colorMap_0 = l_PluginReducer_0.colorMap;
    local l_metalnessMap_0 = l_PluginReducer_0.metalnessMap;
    local l_normalMap_0 = l_PluginReducer_0.normalMap;
    local l_roughnessMap_0 = l_PluginReducer_0.roughnessMap;
    if ((l_colorMap_0 == "" and l_metalnessMap_0 == "") and l_normalMap_0 == "") and l_roughnessMap_0 == "" then
        return nil;
    else
        local l_SurfaceAppearance_0 = Instance.new("SurfaceAppearance");
        l_SurfaceAppearance_0.ColorMap = if not string.match(l_colorMap_0, "^%d+$") then l_colorMap_0 else string.format("rbxassetid://%s", l_colorMap_0);
        l_SurfaceAppearance_0.MetalnessMap = if not string.match(l_metalnessMap_0, "^%d+$") then l_metalnessMap_0 else string.format("rbxassetid://%s", l_metalnessMap_0);
        l_SurfaceAppearance_0.NormalMap = if not string.match(l_normalMap_0, "^%d+$") then l_normalMap_0 else string.format("rbxassetid://%s", l_normalMap_0);
        l_SurfaceAppearance_0.RoughnessMap = if not string.match(l_roughnessMap_0, "^%d+$") then l_roughnessMap_0 else string.format("rbxassetid://%s", l_roughnessMap_0);
        return l_SurfaceAppearance_0;
    end;
end;
