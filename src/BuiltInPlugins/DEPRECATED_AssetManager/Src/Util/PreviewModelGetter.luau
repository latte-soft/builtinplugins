local l_Promise_0 = require(script.Parent.Parent.Parent.Packages.Framework).Util.Promise;
local l_AssetManagerVideoPreviewFix_0 = game:GetFastFlag("AssetManagerVideoPreviewFix");
local function v5(v2)
    for _, v4 in pairs(v2:GetDescendants()) do
        if v4:IsA("Script") then
            v4.Disabled = true;
        end;
    end;
end;
local function v13(v6)
    local v7 = nil;
    local l_status_0, l_result_0 = pcall(function()
        v7 = game:GetObjectsAsync((("rbxassetid://%d"):format(v6)));
    end);
    if l_status_0 then
        local v10 = nil;
        if #v7 == 1 then
            v10 = v7[1];
        else
            v10 = Instance.new("Model");
            v10.Name = "Preview";
            for _, v12 in ipairs(v7) do
                v12.Parent = v10;
                if not v12.Parent then
                    v12:Destroy();
                end;
            end;
        end;
        v5(v10);
        return v10;
    else
        return l_result_0;
    end;
end;
return function(v14, v15)
    return (l_Promise_0.new(function(v16, v17)
        spawn(function()
            local v18 = nil;
            if v15 == Enum.AssetType.Audio.Value then
                local l_Sound_0 = Instance.new("Sound");
                l_Sound_0.SoundId = ("rbxassetid://%d"):format(v14);
                v18 = l_Sound_0;
            elseif v15 == Enum.AssetType.Image.Value then
                local l_Decal_0 = Instance.new("Decal");
                l_Decal_0.Texture = ("rbxassetid://%d"):format(v14);
                v18 = l_Decal_0;
            elseif l_AssetManagerVideoPreviewFix_0 and v15 == Enum.AssetType.Video.Value then
                local l_VideoFrame_0 = Instance.new("VideoFrame");
                l_VideoFrame_0.Video = ("rbxassetid://%d"):format(v14);
                v18 = l_VideoFrame_0;
            else
                v18 = v13(v14);
            end;
            if type(v18) == "string" then
                v17(v18);
                return ;
            else
                v16(v18);
                return ;
            end;
        end);
    end));
end;
