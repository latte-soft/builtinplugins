return function(v0, v1)
    local l_creatorType_0 = v0.GameOwnerMetadata.creatorType;
    local l_creatorFriends_0 = v0.GameOwnerMetadata.creatorFriends;
    if l_creatorType_0 == Enum.CreatorType.User then
        for _, v5 in ipairs(l_creatorFriends_0) do
            if v5 == v1 then
                return true;
            end;
        end;
    end;
    return false;
end;
