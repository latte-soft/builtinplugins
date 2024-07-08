local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.AvatarToolsShared);
local v2 = require(l_script_FirstAncestor_0.Packages.Dash);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local l_AssetTypeAttachmentInfo_0 = v1.Util.AccessoryAndBodyToolShared.AssetTypeAttachmentInfo;
return function()
    local v5 = {};
    local v6 = {};
    local v7 = {};
    for _, v9 in l_AssetTypeAttachmentInfo_0, nil, nil do
        for _, v11 in v9, nil, nil do
            local l_status_0, l_result_0 = pcall(function()
                return Enum.AssetType[v11.AssetType];
            end);
            if not (not (l_status_0 and v3.ASSET_TYPE_TO_ACCESSORY_TYPE[l_result_0] ~= nil) or v7[v11.AssetType]) then
                v7[v11.AssetType] = true;
                table.insert(v5, {
                    Id = l_result_0.Name, 
                    Label = v11.AssetType
                });
                v6[l_result_0] = v2.collectArray(v11.Attachments, function(v14, v15)
                    return {
                        label = v14, 
                        attachmentName = v15.Name
                    };
                end);
            end;
        end;
    end;
    return v5, v6;
end;
