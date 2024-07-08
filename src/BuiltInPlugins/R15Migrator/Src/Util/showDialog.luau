local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local v4 = require(l_script_FirstAncestor_0.Src.Resources.MakeTheme);
local v5 = require(l_script_FirstAncestor_0.Src.Util.DebugFlags);
return function(v6, v7, v8, v9)
    local v10 = nil;
    local function v12(v11)
        if v10 then
            v1.unmount(v10);
        end;
        if v11.OnClose then
            v11.OnClose();
        end;
    end;
    v10 = v1.mount((l_ContextServices_0.provide({
        v7, 
        v4((v5.RunTests())), 
        v6
    }, {
        v1.createElement(v8, v2.Dictionary.join(v9, {
            OnClose = function()
                local l_v9_0 = v9;
                if v10 then
                    v1.unmount(v10);
                end;
                if l_v9_0.OnClose then
                    l_v9_0.OnClose();
                end;
            end
        }))
    })));
    return v12;
end;
