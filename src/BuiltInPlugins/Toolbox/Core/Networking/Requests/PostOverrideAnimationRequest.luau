local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_RobloxPluginGuiService_0 = game:GetService("RobloxPluginGuiService");
local v2 = require(l_Parent_0.Core.Util.DebugFlags);
local v3 = require(l_Parent_0.Core.Util.AssetConfigConstants);
local l_Actions_0 = l_Parent_0.Core.Actions;
local v5 = require(l_Actions_0.NetworkError);
local v6 = require(l_Actions_0.SetCurrentScreen);
local v7 = require(l_Actions_0.UploadResult);
local v8 = require(l_Actions_0.SetAssetId);
local v9 = require(l_Parent_0.Core.Util.SerializeInstances);
local v10 = require(l_Parent_0.Core.Flags.getFFlagToolboxAnimationAPIMigration);
local function _(v11, v12)
    local l_AnimationClipEditor_0 = l_RobloxPluginGuiService_0:FindFirstChild("AnimationClipEditor");
    local v14 = l_AnimationClipEditor_0 and l_AnimationClipEditor_0:FindFirstChild("animationUploadSuccess");
    if v14 then
        v14:Fire(v11, v12);
    end;
end;
return function(v16, v17, v18)
    return function(v19, v20)
        local function v30(v21)
            if not v10() then
                if (v21 and tostring(v21) ~= "0") and not v21:find("Error") then
                    v19:dispatch(v8(v17));
                    v19:dispatch(v6(v3.SCREENS.UPLOADING_ASSET));
                    v19:dispatch(v7(true));
                    local l_deleteLocal_0 = v19:getState().deleteLocal;
                    local l_v17_0 = v17;
                    local l_AnimationClipEditor_1 = l_RobloxPluginGuiService_0:FindFirstChild("AnimationClipEditor");
                    local v25 = l_AnimationClipEditor_1 and l_AnimationClipEditor_1:FindFirstChild("animationUploadSuccess");
                    if v25 then
                        v25:Fire(l_v17_0, l_deleteLocal_0);
                    end;
                else
                    v19:dispatch(v7(false));
                    v19:dispatch(v5(v17));
                    return ;
                end;
            else
                v19:dispatch(v8(v21.assetId));
                v19:dispatch(v6(v3.SCREENS.UPLOADING_ASSET));
                v19:dispatch(v7(true));
                local l_deleteLocal_1 = v19:getState().deleteLocal;
                local l_v17_1 = v17;
                local l_AnimationClipEditor_2 = l_RobloxPluginGuiService_0:FindFirstChild("AnimationClipEditor");
                local v29 = l_AnimationClipEditor_2 and l_AnimationClipEditor_2:FindFirstChild("animationUploadSuccess");
                if v29 then
                    v29:Fire(l_v17_1, l_deleteLocal_1);
                    return ;
                end;
            end;
        end;
        local function v32(v31)
            if v2.shouldDebugWarnings() then
                warn("Lua toolbox: SerializeInstances failed");
            end;
            v19:dispatch(v6(v3.SCREENS.UPLOAD_ASSET_RESULT));
            v19:dispatch(v5((tostring(v31))));
            v19:dispatch(v7(false));
        end;
        local function v34(v33)
            if v2.shouldDebugWarnings() then
                warn("Got false response from PostInsertAsset");
            end;
            v19:dispatch(v6(v3.SCREENS.UPLOAD_ASSET_RESULT));
            v19:dispatch(v5(v33));
            v19:dispatch(v7(false));
        end;
        return v9(v18, v20.StudioAssetService):andThen(function(v35)
            return v16:postOverrideAnimation(v17, v35):andThen(v30, v34);
        end, v32);
    end;
end;
