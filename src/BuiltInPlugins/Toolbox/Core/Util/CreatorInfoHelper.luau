local v0 = game:getFastFlag("ToolboxRemoveApiProxy");
local _ = script.Parent.Parent.Parent;
local v10 = {
    getCreatorTypeValueFromName = function(v2)
        assert(type(v2) == "string");
        for _, v4 in ipairs(Enum.CreatorType:GetEnumItems()) do
            if v4.Name == v2 then
                return v4.Value;
            end;
        end;
        error(("'%s' is not a valid Enum.CreatorType"):format(v2));
    end, 
    isValidCreatorType = function(v5)
        for _, v7 in ipairs(Enum.CreatorType:GetEnumItems()) do
            if v7.Value == v5 then
                return true;
            end;
        end;
        return false;
    end, 
    backendToClient = function(v8)
        if v8 == 1 then
            return Enum.CreatorType.User.Value;
        elseif v8 == 2 then
            return Enum.CreatorType.Group.Value;
        else
            error("Unknown backendCreatorType received " .. tostring(v8));
            return ;
        end;
    end, 
    clientToBackend = function(v9)
        if v9 == Enum.CreatorType.User.Value then
            return 1;
        elseif v9 == Enum.CreatorType.Group.Value then
            return 2;
        else
            error("Unknown creatorType received " .. tostring(v9));
            return ;
        end;
    end
};
v10.getNameFromResult = function(v11, v12)
    assert(v10.isValidCreatorType(v12));
    local l_responseBody_0 = v11.responseBody;
    if v12 == Enum.CreatorType.Group.Value then
        return l_responseBody_0.Name;
    elseif v12 == Enum.CreatorType.User.Value then
        if not v0 then
            return l_responseBody_0.Username;
        else
            return l_responseBody_0.name;
        end;
    else
        error(("Unknown creatorType: '%s'"):format(v12));
        return ;
    end;
end;
v10.isCached = function(v14, v15, v16)
    assert(v10.isValidCreatorType(v16));
    local l_cachedCreatorInfo_0 = v14:getState().assets.cachedCreatorInfo;
    if l_cachedCreatorInfo_0 then
        if l_cachedCreatorInfo_0.Id then
            local v18 = false;
            if l_cachedCreatorInfo_0.Id == v15 then
                v18 = l_cachedCreatorInfo_0.Type == v16;
            end;
            return v18;
        else
            return false;
        end;
    else
        return false;
    end;
end;
return v10;
