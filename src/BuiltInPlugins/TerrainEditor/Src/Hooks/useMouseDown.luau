local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = v1.useEffect;
local l_useState_0 = v1.useState;
local v4 = require(l_script_FirstAncestor_0.Src.Hooks.useEventConnection);
local v5 = require(l_script_FirstAncestor_0.Src.Controllers.ShortcutController);
return function()
    local v6 = v5:use();
    local v7 = v6:getMouse();
    local v8, v9 = l_useState_0(v6:IsMouseDown());
    v4(v7.Button1Down, function()
        v9(true);
    end, {});
    v4(v7.Button1Up, function()
        v9(false);
    end, {});
    return v8;
end;
