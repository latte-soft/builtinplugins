local l_script_FirstAncestor_0 = script:FindFirstAncestor("VisualizationModes");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local l_ContextServices_0 = v1.ContextServices;
return function(v4, v5)
    local v6 = l_ContextServices_0.Plugin:use():get();
    local v8 = v2.useCallback(function()
        if not (v6 ~= nil) or v4 == nil then
            return v5;
        else
            local l_v6_Setting_0 = v6:GetSetting(v4);
            if typeof(l_v6_Setting_0) == typeof(v5) then
                return l_v6_Setting_0;
            else
                return v5;
            end;
        end;
    end, {
        v6, 
        v4, 
        v5
    });
    local v9, v10 = v2.useState(v8);
    v2.useEffect(function()
        if not (v4 ~= nil) or v6 == nil then
            return ;
        else
            if v8() ~= v9 then
                v10(v9);
            end;
            return ;
        end;
    end, {
        v8
    });
    v2.useEffect(function()
        if not (v4 ~= nil) or v6 == nil then
            return ;
        else
            v6:SetSetting(v4, v9);
            return ;
        end;
    end, {
        v9, 
        v6, 
        v4
    });
    return v9, v10;
end;
