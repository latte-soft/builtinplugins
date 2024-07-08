local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Http);
local v2 = require(l_Parent_0.Src.Networking.UrlConstructor);
local v3 = require(l_Parent_0.Src.Thunks.InitPolicySettingStatus);
game:DefineFastFlag("PlayerEmulatorPolicyServiceEndpointMigrationEnabled2", false);
local v4 = nil;
local v5 = nil;
if not game:GetFastFlag("PlayerEmulatorPolicyServiceEndpointMigrationEnabled2") then
    v4 = v2.BuildUrl("gameinternationalization", "v1/player-policies/all-values");
    v5 = v2.BuildUrl("gameinternationalization", "v1/player-policies-client");
else
    v4 = v2.BuildUrl("apis", "player-policy-service/v1/player-policy-all-values");
    v5 = v2.BuildUrl("apis", "player-policy-service/v1/player-policy-client");
end;
local function v12(v6, v7, v8, v9)
    v8.parseJson((v8:handleRetry((v8:get(v5))))):andThen(function(v10)
        if v10.responseCode == v1.StatusCodes.OK then
            v7:dispatch(v3(v6, v10.responseBody, v9));
            return ;
        else
            v7:dispatch(v3(v6, {}, v9));
            warn("Player Emulator can't get player policy info: HTTP error " .. tostring(v10.responseCode));
            return ;
        end;
    end, function(v11)
        v7:dispatch(v3(v6, {}, v9));
        warn("Player Emulator can't get player policy info: " .. v11);
    end);
end;
return function(v13, v14)
    return function(v15)
        v13.parseJson((v13:handleRetry((v13:get(v4))))):andThen(function(v16)
            if v16.responseCode == v1.StatusCodes.OK then
                v12(v16.responseBody, v15, v13, v14);
                return ;
            else
                warn("Player Emulator failed to load policy section data");
                return ;
            end;
        end, function(v17)
            warn("Player Emulator can't get policies info: " .. v17);
        end);
    end;
end;
