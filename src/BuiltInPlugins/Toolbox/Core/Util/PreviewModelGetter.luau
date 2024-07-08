local l_Parent_0 = script.Parent.Parent.Parent;
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
local v2 = require(l_Parent_0.Core.Util.Urls);
local l_VideoStudioPreviewPermissionFix_0 = game:GetFastFlag("VideoStudioPreviewPermissionFix");
local function v7(v4)
    for _, v6 in pairs(v4:GetDescendants()) do
        if v6:IsA("Script") then
            v6.Disabled = true;
        end;
    end;
end;
local function v15(v8)
    local v9 = nil;
    local l_status_0, l_result_0 = pcall(function()
        v9 = game:GetObjectsAsync((v2.constructAssetIdString(v8)));
    end);
    if l_status_0 then
        local v12 = nil;
        if #v9 == 1 then
            v12 = v9[1];
        else
            v12 = Instance.new("Model");
            v12.Name = "Preview";
            for _, v14 in ipairs(v9) do
                v14.Parent = v12;
                if not v14.Parent then
                    v14:Destroy();
                end;
            end;
        end;
        v7(v12);
        return l_status_0, v12;
    else
        return l_status_0, l_result_0;
    end;
end;
return function(v16, v17)
    return (l_Promise_0.new(function(v18, v19)
        spawn(function()
            local v20 = nil;
            local v21 = true;
            if v17 == Enum.AssetType.Audio.Value then
                local l_Sound_0 = Instance.new("Sound");
                l_Sound_0.SoundId = ("rbxassetid://%d"):format(v16);
                v20 = l_Sound_0;
            elseif v17 == Enum.AssetType.Video.Value then
                local l_VideoFrame_0 = Instance.new("VideoFrame");
                if l_VideoStudioPreviewPermissionFix_0 then
                    l_VideoFrame_0:SetStudioPreview(true);
                end;
                l_VideoFrame_0.Video = v2.constructAssetIdString(v16);
                v20 = l_VideoFrame_0;
            else
                local v24, v25 = v15(v16);
                v21 = v24;
                v20 = v25;
            end;
            if v21 then
                v18(v20);
                return ;
            else
                v19(v20);
                return ;
            end;
        end);
    end));
end;
