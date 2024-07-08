local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagTerrainEditorErrorHandling);
local l_useMemo_0 = v1.useMemo;
local l_useRef_0 = v1.useRef;
local l_useState_0 = v1.useState;
local l_useEffect_0 = v1.useEffect;
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v8, v9)
    local v10, v11 = l_useState_0({
        Gizmos = {}, 
        FromSelf = false
    });
    local v12 = l_useMemo_0(function()
        return v8:getTool();
    end, {
        v10
    });
    local v13, v14 = l_useState_0(false);
    local v15 = l_useRef_0(nil);
    if v15.current then
        v11(v15.current);
        v15.current = nil;
        if v13 then
            v14(false);
        end;
    end;
    l_useEffect_0(function()
        local v17 = v8.OnToolChanged:Connect(function(v16)
            v15.current = {
                Gizmos = v16:gizmos(), 
                FromSelf = false
            };
            v11(v15.current);
            v14(true);
        end);
        if v9 then
            local v18 = nil;
            if v2() then
                v18 = v12.OnInternalsChanged:Connect(function()
                    v11({
                        Gizmos = v12:gizmos(), 
                        FromSelf = false
                    });
                end);
            end;
            local v19 = v12.OnFormChanged:Connect(function()
                v15.current = {
                    Gizmos = v12:gizmos(), 
                    FromSelf = false
                };
                v11(v15.current);
                v14(true);
            end);
            local v20 = v12.OnShortcutChanged:Connect(function()
                v15.current = {
                    Gizmos = v12:gizmos(), 
                    FromSelf = false
                };
                v11(v15.current);
                v14(true);
            end);
            return function()
                v17:Disconnect();
                v19:Disconnect();
                if v2() then
                    v18:Disconnect();
                end;
                v20:Disconnect();
            end;
        else
            return function()
                v17:Disconnect();
            end;
        end;
    end, {
        v12, 
        v9
    });
    l_useEffect_0(function()
        v11(if not v9 then {
            Gizmos = {}, 
            FromSelf = false
        } else {
            Gizmos = v12:gizmos(), 
            FromSelf = false
        });
    end, {
        v9
    });
    return v10.Gizmos, function(_, v22)
        if not v15.current then
            v8:getTool():saveGizmos(v22);
            v11({
                Gizmos = v8:getTool():gizmos(), 
                FromSelf = true
            });
            return ;
        else
            return ;
        end;
    end, v12, v10.FromSelf;
end;
