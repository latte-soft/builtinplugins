local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Core.Util.DebugFlags);
local v3 = require(l_script_FirstAncestor_0.Core.Util.Urls);
local v4 = require(l_script_FirstAncestor_0.Core.Actions.SetLiveSearch);
local v5 = require(l_script_FirstAncestor_0.Core.Actions.NetworkError);
local _ = require(l_script_FirstAncestor_0.Core.Types.CreatorTypes);
local _ = require(l_script_FirstAncestor_0.Core.Types.GroupTypes);
local v8 = require(l_script_FirstAncestor_0.Core.Types.ThumbnailTypes);
local function v16(v9, v10)
    local v11 = {};
    if v10 then
        for _, v13 in pairs(v10) do
            local v14 = string.find(v13.name:lower(), v9:lower());
            local v15 = tonumber(v13.id);
            if not (v15 or not v2.shouldDebugWarnings()) then
                warn("Toolbox: Group Id (" .. v13.id .. ") could not be converted to number. Using 0 instead.");
            end;
            if v14 then
                table.insert(v11, {
                    Name = v13.name, 
                    Id = v15 or 0, 
                    Thumbnail = v3.constructRBXThumbUrl(v8.Icon.GroupIcon, v13.id, 150), 
                    Type = Enum.CreatorType.Group
                });
            end;
        end;
    end;
    return v11;
end;
local function v29(v17, v18, v19, v20)
    return v18:getUsers(v19):andThen(function(v21)
        local l_responseBody_0 = v21.responseBody;
        local v23 = {};
        if l_responseBody_0 then
            local l_UserSearchResults_0 = l_responseBody_0.UserSearchResults;
            if l_UserSearchResults_0 and #l_UserSearchResults_0 > 0 then
                for _, v26 in l_UserSearchResults_0, nil, nil do
                    table.insert(v23, {
                        Name = v26.Name, 
                        Id = v26.UserId, 
                        Thumbnail = v3.constructUserThumbnailUrl(v26.UserId), 
                        Type = Enum.CreatorType.User
                    });
                end;
                local v27 = v16(v19, v20);
                if #v27 > 0 then
                    return (v1.List.join(v23, v27));
                end;
            end;
        end;
        return v23;
    end, function(v28)
        if v2.shouldDebugWarnings() then
            warn("Toolbox: Error in user endpoint");
        end;
        v17:dispatch(v5(v28));
        return {};
    end);
end;
return function(v30, v31, v32)
    return function(v33)
        if #v31 < 3 then
            v33:dispatch(v4(v31, {}));
            return ;
        else
            v29(v33, v30, v31, v32):andThen(function(v34)
                if not (not v34 or not next(v34)) then
                    v33:dispatch(v4(v31, v34));
                end;
            end);
            return ;
        end;
    end;
end;
