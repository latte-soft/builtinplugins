local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Core.Util.Urls);
local v3 = require(l_Parent_0.Core.Actions.SetLiveSearch);
local _ = function(v4, v5, _)
    return v4:getUsers(v5):andThen(function(v7)
        local l_responseBody_0 = v7.responseBody;
        if l_responseBody_0 then
            local l_UserSearchResults_0 = l_responseBody_0.UserSearchResults;
            if l_UserSearchResults_0 and #l_UserSearchResults_0 > 0 then
                local v10 = {};
                for _, v12 in ipairs(l_UserSearchResults_0) do
                    v10 = v1.List.join(v10, {
                        {
                            Name = v12.Name, 
                            Id = v12.UserId, 
                            Thumbnail = v2.constructUserThumbnailUrl(v12.UserId)
                        }
                    });
                end;
                return v10;
            end;
        end;
        return {};
    end);
end;
return function(v14, v15)
    return function(v16)
        if #v15 < 3 then
            v16:dispatch(v3(v15, {}));
            return ;
        else
            v14:getUsers(v15):andThen(function(v17)
                local l_responseBody_1 = v17.responseBody;
                if l_responseBody_1 then
                    local l_UserSearchResults_1 = l_responseBody_1.UserSearchResults;
                    if l_UserSearchResults_1 and #l_UserSearchResults_1 > 0 then
                        local v20 = {};
                        for _, v22 in ipairs(l_UserSearchResults_1) do
                            v20 = v1.List.join(v20, {
                                {
                                    Name = v22.Name, 
                                    Id = v22.UserId, 
                                    Thumbnail = v2.constructUserThumbnailUrl(v22.UserId)
                                }
                            });
                        end;
                        return v20;
                    end;
                end;
                return {};
            end):andThen(function(v23)
                v16:dispatch(v3(v15, v23));
            end);
            return ;
        end;
    end;
end;
