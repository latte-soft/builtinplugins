local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.DebugFlags);
local l_Actions_0 = l_Parent_0.Core.Actions;
local v3 = require(l_Actions_0.NetworkError);
local v4 = require(l_Actions_0.SetPublishingRequirements);
local _ = require(l_Parent_0.Core.Types.AssetSubTypes);
local _ = require(l_Parent_0.Core.Types.PublishingRequirementsType);
return function(v7, v8, v9, v10)
    return function(v11)
        local _ = v9;
        if v9 == Enum.AssetType.Image then
            v9 = Enum.AssetType.Decal;
        elseif v9 == Enum.AssetType.Mesh then
            v9 = Enum.AssetType.MeshPart;
        end;
        return v7:getPublishingRequirements(v8, v9, v10):andThen(function(v13)
            local l_responseBody_0 = v13.responseBody;
            if not l_responseBody_0 then
                if v1.shouldDebugWarnings() then
                    warn("Fetching publishing requirement response body is empty");
                end;
                v11:dispatch(v3(v13));
                return ;
            else
                v11:dispatch(v4(l_responseBody_0));
                return l_responseBody_0;
            end;
        end, function(v15)
            if v1.shouldDebugWarnings() then
                warn("Fetching publishing requirement was unsuccessful:", (tostring(v15)));
            end;
            v11:dispatch(v3(v15));
        end);
    end;
end;
