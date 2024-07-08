local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.LuauPolyfill);
local l_Localization_0 = v2.ContextServices.Localization;
local l_setTimeout_0 = v3.setTimeout;
local l_clearTimeout_0 = v3.clearTimeout;
local v7 = require(l_Parent_0.Src.Util.RelativeTime);
local l_calculateRelativeTime_0 = v7.calculateRelativeTime;
local l_getRefreshIntervalInMS_0 = v7.getRefreshIntervalInMS;
return function(v10)
    local v11, v12 = v1.useState("");
    local v13 = l_Localization_0:use();
    local v16 = v1.useCallback(function()
        local v14 = l_calculateRelativeTime_0(v10);
        local v15 = {};
        if not (not v14.paramName or not v14.paramValue) then
            v15[v14.paramName] = v14.paramValue;
        end;
        v12(v13:getText(v14.scope, v14.key, v15));
    end, {
        v10, 
        v12, 
        v13
    });
    v1.useEffect(function()
        v16();
    end, {
        v16
    });
    v1.useEffect(function()
        local v17 = l_setTimeout_0(function()
            v16();
        end, (l_getRefreshIntervalInMS_0(v10)));
        return function()
            l_clearTimeout_0(v17);
        end;
    end, {
        v10, 
        v16, 
        v11
    });
    return v11;
end;
