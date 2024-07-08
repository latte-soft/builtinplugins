local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local l_deepCopy_0 = require(l_script_FirstAncestor_0.Packages.Framework).Util.deepCopy;
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetDiagnostics);
local l_AssetType_0 = require(l_script_FirstAncestor_0.Src.Util.AnimationConversion.constants).AssetType;
local _ = require(l_script_FirstAncestor_0.Src.Util.ScriptAnalysis.Constants);
return function(v5, v6, v7)
    return function(v8)
        local v9 = v8:getState();
        local l_diagnostics_0 = v9.ScriptConversion.diagnostics;
        local l_animations_0 = v9.AnimationConversion.animations;
        local v12 = l_deepCopy_0(l_diagnostics_0);
        local v13 = l_animations_0[v5];
        local v14 = false;
        for v15, v16 in v13.refs, nil, nil do
            if v16:IsA(l_AssetType_0.AssetIdString) then
                local v17 = v7:findScriptGUID(v15.scriptInstance);
                if v12[v17] then
                    for _, v19 in v12[v17]._list, nil, nil do
                        if v19.instanceName == v16.url and v15.range == v19.range then
                            v19.suggestions = {
                                v6
                            };
                            v14 = true;
                        end;
                    end;
                end;
            end;
        end;
        if v14 then
            v8:dispatch(v2(v12));
        end;
    end;
end;
