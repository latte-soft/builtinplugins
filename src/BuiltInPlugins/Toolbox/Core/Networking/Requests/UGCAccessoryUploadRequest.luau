local l_PublishService_0 = game:GetService("PublishService");
local l_UGCValidationService_0 = game:GetService("UGCValidationService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Core.Actions.SetAssetId);
local v4 = require(l_Parent_0.Core.Actions.NetworkError);
local v5 = require(l_Parent_0.Core.Actions.SetCurrentScreen);
local v6 = require(l_Parent_0.Core.Actions.UploadResult);
local l_Util_0 = l_Parent_0.Core.Util;
local v8 = require(l_Util_0.DebugFlags);
local v9 = require(l_Util_0.getUserId);
local v10 = require(l_Util_0.AssetConfigConstants);
local v11 = require(l_Util_0.Analytics.Analytics);
local v12 = require(l_Parent_0.Core.Networking.Requests.ConfigureItemTagsRequest);
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
return function(v14, v15, _, v17, v18, v19, v20, v21, v22)
    return function(v23, _)
        local l_v19_0 = v19;
        v15 = not v15 and "" or string.sub(v15, 1, v10.NAME_CHARACTER_LIMIT);
        v17 = not v17 and "" or string.sub(v17, 1, v10.DESCRIPTION_CHARACTER_LIMIT);
        v23:dispatch(v5(v10.SCREENS.UPLOADING_ASSET));
        local v26 = l_v19_0[1];
        if v26 then
            local l_Handle_0 = v26:FindFirstChild("Handle");
            if not (not l_Handle_0 or not l_Handle_0:IsA("MeshPart")) then
                l_UGCValidationService_0:ResetCollisionFidelity(l_Handle_0);
            end;
        end;
        local v28 = nil;
        local v29 = nil;
        if v21 ~= nil then
            v28 = Enum.AssetCreatorType.Group;
            v29 = v21;
        else
            v28 = Enum.AssetCreatorType.User;
            v29 = v9();
        end;
        return l_Promise_0.new(function(v30, v31)
            task.spawn(function()
                local l_status_0, l_result_0 = pcall(function()
                    return l_PublishService_0:CreateAssetAndWaitForAssetId(l_v19_0, "", v28, v29, v18.Name, v15, v17, v22);
                end);
                if (l_status_0 and l_result_0 ~= nil) and l_result_0 ~= 0 then
                    v30(l_result_0);
                    return ;
                else
                    v31(l_result_0);
                    return ;
                end;
            end);
        end):andThen(function(v34)
            v23:dispatch(v3(v34));
            v23:dispatch(v12(v14, v34, {}, v20));
            v11.incrementUploadAssetSuccess(v18);
        end):catch(function(v35)
            if v8.shouldDebugWarnings() then
                warn("Lua toolbox: Could not upload catalog item");
            end;
            v23:dispatch(v4(v35));
            v23:dispatch(v6(false));
            v11.incrementUploadAssetFailure(v18);
        end);
    end;
end;
