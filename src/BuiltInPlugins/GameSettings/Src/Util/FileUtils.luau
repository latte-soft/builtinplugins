local v0 = tonumber(settings():GetFVariable("FileMaxSizeBytes"));
local l_StudioService_0 = game:GetService("StudioService");
local l_HttpService_0 = game:GetService("HttpService");
local v3 = "--EA0A21C3-8388-4038-9BD5-92C8B1B7BF8E\r\n" .. "Content-Type: image/%s\r\n" .. "Content-Disposition: form-data; filename=\"%s\"; name=\"request.files\"\r\n" .. "\r\n" .. "%s\r\n" .. "--EA0A21C3-8388-4038-9BD5-92C8B1B7BF8E--\r\n";
local l_Parent_0 = script.Parent.Parent.Parent;
local v5 = require(l_Parent_0.Src.Components.Dialog.SimpleDialog);
local v6 = require(l_Parent_0.Src.Components.Dialog.ListDialog);
local v7 = require(l_Parent_0.Src.Util.DEPRECATED_Constants);
local v8 = {};
local function v12(_, v10, v11)
    v11(v5, {
        Size = Vector2.new(343, 145), 
        Title = v10:getText("General", "SingleImageDialogHeader"), 
        Header = v10:getText("General", "SingleImageDialogBody"), 
        Buttons = {
            v10:getText("General", "ReplyOK")
        }
    }):await();
end;
local function v17(_, v14, v15, v16)
    v15(v6, {
        Size = Vector2.new(460, 200 + #v16 * 22), 
        Title = v14:getText("General", "MultiImageDialogHeader"), 
        Header = v14:getText("General", "MultiImageDialogBody", {
            maxThumbnailSize = v0 / 1000000
        }), 
        Entries = v16, 
        Buttons = {
            v14:getText("General", "ReplyOK")
        }, 
        Wrapped = false, 
        Truncate = Enum.TextTruncate.AtEnd
    }):await();
end;
local function _(v18, v19, v20)
    return {
        [v18] = {
            type = v19.Name, 
            name = v18, 
            description = v20
        }
    };
end;
local function _(v22, v23, v24, v25)
    return "--EA0A21C3-8388-4038-9BD5-92C8B1B7BF8E\r\n" .. "Content-Type: application/json\r\n" .. "Content-Disposition: form-data; name=\"config\"; filename=\"config.json\"\r\n" .. "\r\n" .. v22 .. "\r\n" .. "--EA0A21C3-8388-4038-9BD5-92C8B1B7BF8E\r\n" .. "Content-Disposition: form-data; name=\"" .. v23 .. "\"; filename=\"" .. v23 .. "." .. v24 .. "\"\r\n" .. "Content-Type: application/octet-stream\r\n" .. "\r\n" .. v25 .. "\r\n" .. "--EA0A21C3-8388-4038-9BD5-92C8B1B7BF8E--\r\n";
end;
v8.PromptForGameIcon = function(v27, v28)
    assert(v28);
    local v29 = l_StudioService_0:PromptImportFile(v7.IMAGE_TYPES);
    if not v29 then
        return ;
    elseif v0 < v29.Size then
        v12(v27, v28);
        return ;
    else
        return v29;
    end;
end;
v8.PromptForThumbnails = function(v30, v31, v32)
    assert(v31 and v32);
    local v33 = l_StudioService_0:PromptImportFiles(v7.IMAGE_TYPES);
    local v34 = {};
    local v35 = {};
    if v33 and #v33 > 0 then
        for _, v37 in ipairs(v33) do
            if v0 < v37.Size then
                table.insert(v34, v37.Name);
            else
                table.insert(v35, v37);
            end;
        end;
        if next(v34) ~= nil then
            v17(v30, v31, v32, v34);
        end;
        return v35;
    else
        return ;
    end;
end;
v8.GetAssetPublishRequestInfo = function(v38, v39)
    local l_v38_BinaryContents_0 = v38:GetBinaryContents();
    local v41 = string.lower(v38.Name);
    return {
        Url = v39, 
        Method = "POST", 
        Body = string.format(v3, string.sub(v41, string.find(v41, ".", 1, true) + 1), v41, l_v38_BinaryContents_0), 
        CachePolicy = Enum.HttpCachePolicy.None, 
        Headers = {
            ["Content-Type"] = "multipart/form-data; boundary=EA0A21C3-8388-4038-9BD5-92C8B1B7BF8E"
        }
    };
end;
v8.CreatePostV1AssetsUpload = function(v42, v43, _)
    local l_v42_BinaryContents_0 = v42:GetBinaryContents();
    local v46 = string.lower(v42.Name);
    local v47 = string.find(v46, ".", 1, true);
    local v48 = string.sub(v46, v47 + 1);
    local v49 = string.sub(v42.Name, 1, v47 - 1);
    local v50 = "--EA0A21C3-8388-4038-9BD5-92C8B1B7BF8E\r\n" .. "Content-Type: application/json\r\n" .. "Content-Disposition: form-data; name=\"config\"; filename=\"config.json\"\r\n" .. "\r\n" .. l_HttpService_0:JSONEncode({
        [v49] = {
            type = Enum.AssetType.Image.Name, 
            name = v49, 
            description = ""
        }
    }) .. "\r\n" .. "--EA0A21C3-8388-4038-9BD5-92C8B1B7BF8E\r\n" .. "Content-Disposition: form-data; name=\"" .. v49 .. "\"; filename=\"" .. v49 .. "." .. v48 .. "\"\r\n" .. "Content-Type: application/octet-stream\r\n" .. "\r\n" .. l_v42_BinaryContents_0 .. "\r\n" .. "--EA0A21C3-8388-4038-9BD5-92C8B1B7BF8E--\r\n";
    print(v50);
    return {
        Url = v43, 
        Method = "POST", 
        Body = v50, 
        Headers = {
            ["Content-Type"] = "multipart/form-data; boundary=EA0A21C3-8388-4038-9BD5-92C8B1B7BF8E"
        }
    };
end;
return v8;
