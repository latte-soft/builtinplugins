local v0 = require(script.Parent.Parent.Parent.Parent.Core.Util.DebugFlags);
local v1 = {};
local function _(v2)
    print(("[Toolbox Analytics] %s"):format((tostring(v2))));
end;
v1.logAnalytics = function(v4, v5, v6, v7, v8)
    if v0.shouldLogAnalytics() then
        v4 = v4 or "";
        v5 = v5 or "";
        v6 = v6 or "";
        v7 = v7 or "";
        v8 = v8 or {};
        local v9 = {};
        for v10, v11 in pairs(v8) do
            v9[#v9 + 1] = (type(v10) == "string" and v10 or "[" .. tostring(v11) .. "]") .. "=" .. (type(v11) == "string" and "\"" .. v11 .. "\"" or tostring(v11));
        end;
        print(("[Toolbox Analytics] %s"):format((tostring((("%s(target=\"%s\", eventContext=\"%s\", eventName=\"%s\", additionalArgs={%s})"):format(tostring(v4), tostring(v5), tostring(v6), tostring(v7), (table.concat(v9, ", "))))))));
        return ;
    else
        return ;
    end;
end;
v1.logEvent = function(v12, v13, v14, v15, v16)
    if v0.shouldLogAnalytics() then
        print(("[Toolbox Analytics] %s"):format((tostring((("%s(category=\"%s\", action=\"%s\", label=\"%s\", value=%s)"):format(tostring(v12 or ""), tostring(v13 or ""), tostring(v14 or ""), tostring(v15 or ""), (tostring(v16 or 0))))))));
        return ;
    else
        return ;
    end;
end;
v1.logCounterEvent = function(v17, v18, v19)
    if v0.shouldLogAnalytics() then
        print(("[Toolbox Analytics] %s"):format((tostring((("%s(counter=\"%s\", amount=%s)"):format(tostring(v17 or ""), tostring(v18 or ""), (tostring(v19 or 1))))))));
        return ;
    else
        return ;
    end;
end;
return v1;
