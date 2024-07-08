local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Actions_0 = l_Parent_0.Core.Actions;
local v2 = require(l_Actions_0.NetworkError);
local v3 = require(l_Parent_0.Core.Util.DebugFlags);
local v4 = require(l_Actions_0.SetAutocompleteResults);
return function(v5, v6, v7, v8)
    return function(v9)
        if v7 == "" then
            v9:dispatch(v4({}));
            return ;
        else
            return v5:getAutocompleteResults(v6, v7, v8):andThen(function(v10)
                local l_responseBody_0 = v10.responseBody;
                if not (not l_responseBody_0 or not l_responseBody_0.Data) and v7 == l_responseBody_0.Args.Prefix then
                    local v12 = {};
                    for v13, _ in pairs(l_responseBody_0.Data) do
                        table.insert(v12, l_responseBody_0.Data[v13].Query);
                    end;
                    v9:dispatch(v4(v12));
                end;
            end, function(v15)
                if v3.shouldDebugWarnings() then
                    warn("Toolbox: Could not fetch autocomplete results");
                end;
                v9:dispatch(v2(v15));
            end);
        end;
    end;
end;
