local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_useState_0 = v1.useState;
local l_useEffect_0 = v1.useEffect;
local v4 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorErrorHandling);
return function(v5)
    local v6 = v5:getTool();
    local v7, v8 = l_useState_0(v6:form());
    l_useEffect_0(function()
        local v10 = v5.OnToolChanged:Connect(function(v9)
            v8(v9:form());
        end);
        local v11 = v6.OnGizmoChanged:Connect(function()
            v8(v6:form());
        end);
        local v12 = nil;
        if v4() then
            v12 = v6.OnInternalsChanged:Connect(function()
                v8(v6:form());
            end);
        end;
        local v13 = v6.OnShortcutChanged:Connect(function()
            v8(v6:form());
        end);
        return function()
            v10:Disconnect();
            v11:Disconnect();
            if v4() then
                v12:Disconnect();
            end;
            v13:Disconnect();
        end;
    end, {
        v6
    });
    return v7, function(v14)
        v5:getTool():saveForm(v14);
        v8(v6:form());
    end;
end;
