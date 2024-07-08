local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Actions.ValidateAnimationResult);
local v2 = require(l_Parent_0.Core.Flags.getFFlagToolboxAnimationAPIMigration);
return function(v3)
    return function(v4)
        return v3.networkInterface:validateAnimation(v3.assetId):andThen(function(v5)
            if not v2() then
                v4:dispatch(v1(true));
                return ;
            else
                local v6;
                if not (not v5 or not v5.responseBody) then
                    v6 = true;
                    if not (v5.responseBody.assetType ~= "Animation") then
                        goto label0;
                    end;
                end;
                v6 = false;
                ::label0::;
                v4:dispatch(v1(v6));
                return ;
            end;
        end, function(_)
            v4:dispatch(v1(false));
        end);
    end;
end;
