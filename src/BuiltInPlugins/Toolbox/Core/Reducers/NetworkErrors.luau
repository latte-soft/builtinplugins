local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Cryo);
local v3 = require(l_Packages_0.Rodux);
local v4 = require(l_Parent_0.Core.Util.DebugFlags);
local v5 = require(l_Parent_0.Core.Actions.NetworkError);
local function _(v6)
    warn(("Toolbox network error on %s %s:  (code %s)  %s"):format(v6.requestType or "", v6.url or "", tostring(v6.responseCode or ""), v6.responseBody or ""));
end;
return v3.createReducer({}, {
    [v5.name] = function(v8, v9)
        if v4.shouldDebugWarnings() then
            local l_response_0 = v9.response;
            warn(("Toolbox network error on %s %s:  (code %s)  %s"):format(l_response_0.requestType or "", l_response_0.url or "", tostring(l_response_0.responseCode or ""), l_response_0.responseBody or ""));
        end;
        return v2.List.join(v8, {
            v9.response
        });
    end
});
