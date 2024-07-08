local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Packages.Rodux);
local v3 = require(l_Parent_0.Src.Models.PermissionInfo);
local v4 = require(l_Parent_0.Src.Util.Constants);
local function v9(v5, v6)
    local v7 = {};
    if #v5 > 1 then
        for v8 = #v5, 1, -1 do
            if not v6 or v6 and v8 ~= #v5 then
                v7[#v7 + 1] = v5[v8];
            end;
        end;
        return v7;
    else
        return v5;
    end;
end;
return v2.createReducer({}, {
    SetAllPluginPermissions = function(v10, v11)
        local v12 = {};
        for v13, v14 in pairs(v11.permissions) do
            local v15 = tonumber(v13);
            local v16 = {};
            local v17 = {};
            local v18 = 0;
            local v19 = 0;
            local v20 = nil;
            for v21, v22 in ipairs(v14) do
                if v22.Type == v4.PERMISSION_TYPES.HttpService then
                    local v23 = v3.fromUserData(v22, v21);
                    if not v23.allowed then
                        v19 = v19 + 1;
                    else
                        v18 = v18 + 1;
                    end;
                    table.insert(v16, v23);
                elseif v22.Type == v4.PERMISSION_TYPES.ScriptInjection then
                    local v24 = v3.fromUserData(v22, v21);
                    if v20 == nil then
                        v20 = v24.allowed;
                        table.insert(v17, v24);
                    else
                        assert(false, "Only one script injection permission is allowed. " .. "Uninstall and reinstall plugin " .. tostring(v15) .. " to reset permissions.");
                    end;
                end;
            end;
            table.sort(v16, function(v25, v26)
                if v25.data.domain and v26.data.domain then
                    return table.concat(v9(string.split(v25.data.domain, "."), true), ".") < table.concat(v9(string.split(v26.data.domain, "."), true), ".");
                else
                    return false;
                end;
            end);
            v12[v15] = {
                allowedHttpCount = v18, 
                deniedHttpCount = v19, 
                allowedScriptInjection = v20, 
                httpPermissions = v16, 
                scriptInjectionPermissions = v17
            };
        end;
        return v1.Dictionary.join(v10, v12);
    end
});
