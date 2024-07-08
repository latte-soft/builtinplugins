local v0 = require(script:FindFirstAncestor("R15Migrator").Src.Util.AnimationConversion.serializeInstances);
local l_StudioService_0 = game:GetService("StudioService");
local l_PublishService_0 = game:GetService("PublishService");
local function v14(v3, v4)
    local function _(v5)
        print("rbxassetid://" .. v5);
    end;
    local v7 = {};
    table.insert(v7, v3);
    local l_status_0, l_result_0 = pcall(function()
        return v0(v7);
    end);
    if l_status_0 then
        local l_User_0 = Enum.AssetCreatorType.User;
        local l_l_StudioService_0_UserId_0 = l_StudioService_0:GetUserId();
        local l_status_1, l_result_1 = pcall(function()
            return l_PublishService_0:CreateAssetOrAssetVersionAndPollAssetWithTelemetryAsync(l_result_0, l_User_0, l_l_StudioService_0_UserId_0, "Animation", 0, v4, "", "", "model/x-rbxm", 0);
        end);
        if l_status_1 then
            print("rbxassetid://" .. l_result_1.AssetId);
            return ;
        else
            warn((("Upload failed. %*"):format(l_result_1)));
            return ;
        end;
    else
        return ;
    end;
end;
return function(v15)
    return function(v16)
        local v17, _ = next(v16:getState().AnimationConversion.animations[v15].refs);
        for v19 = 1, 300 do
            v14(v17:Clone(), v17.Name .. v19);
        end;
    end;
end;
