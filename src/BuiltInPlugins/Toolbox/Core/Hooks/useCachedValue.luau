local v0 = require(script:FindFirstAncestor("Toolbox").Packages.React);
local l_useCallback_0 = v0.useCallback;
local l_useEffect_0 = v0.useEffect;
local l_useRef_0 = v0.useRef;
local l_useState_0 = v0.useState;
return function(v5, v6)
    local v7, v8 = l_useState_0(v5);
    local v9 = l_useRef_0(true);
    local v10 = l_useCallback_0(function()
        task.delay(v6, function()
            v9.current = false;
        end);
    end, {});
    l_useEffect_0(function()
        if v5 ~= v7 and v9.current == false then
            v8(v5);
            v9.current = true;
            v10();
        end;
    end, {
        v5
    });
    l_useEffect_0(v10, {});
    return v7;
end;
