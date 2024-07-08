return function(v0, v1)
    local l_creatorId_0 = v0.GameOwnerMetadata.creatorId;
    local l_creatorType_0 = v0.GameOwnerMetadata.creatorType;
    local v4 = false;
    if l_creatorType_0 == Enum.CreatorType.User then
        v4 = l_creatorId_0 == v1;
    end;
    return v4;
end;
