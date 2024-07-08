local l_Parent_0 = script.Parent.Parent.Parent;
local l_PublishService_0 = game:GetService("PublishService");
local l_StudioService_0 = game:GetService("StudioService");
local l_Url_0 = require(l_Parent_0.Packages.Framework).Url;
local l_Promise_0 = require(l_Parent_0.Packages.Framework).Util.Promise;
local l_DATA_URL_0 = l_Url_0.new().DATA_URL;
local v6 = require(l_Parent_0.Src.Flags.getFFlagFixMaterialManagerUploadImage);
local function v11(v7, v8, v9, v10)
    return v7:post(l_Url_0.composeUrl(l_DATA_URL_0, "ide/publish/UploadNewImage", {
        name = v8 or "", 
        description = v9 or ""
    }), v10, {
        ["Content-Type"] = "multipart/form-data; boundary=EA0A21C3-8388-4038-9BD5-92C8B1B7BF8E"
    });
end;
local v12 = {};
v12.__index = v12;
v12.new = function(v13)
    local v14 = {
        _DEPRECATED_networking = v13, 
        _publishService = l_PublishService_0, 
        _promises = {}
    };
    if not v6() then
        assert(v14._DEPRECATED_networking, "ImageUploader requires a Networking instance");
    end;
    setmetatable(v14, v12);
    return v14;
end;
v12.mock = function(v15)
    assert(v6(), "ImageUploader.mock should only be called when FFlagFixMaterialManagerUploadImage is enabled");
    assert(v15, "ImageUploader.mock expects a mock PublishService");
    local v16 = v12.new();
    v16._publishService = v15;
    return v16;
end;
v12.destroy = function(v17)
    v17._DEPRECATED_networking = nil;
    v17._publishService = nil;
    v17._promises = {};
end;
v12.upload = function(v18, v19, v20, v21, v22)
    assert(type(v19) == "string", "ImageUploader:upload() expects tempId to be a string");
    assert(type(v20) == "string", "ImageUploader:upload() expects name to be a string");
    local v23 = true;
    if type(v21) ~= "string" then
        v23 = type(v21) == "nil";
    end;
    assert(v23, "ImageUploader:upload() expects description to be a string or nil");
    assert(type(v22) == "string", "ImageUploader:upload() expects contents to be a string");
    v21 = v21 or "";
    if not v18._promises[v19] then
        local v24 = nil;
        v24 = if not v6() then v11(v18._DEPRECATED_networking, v20, v21, v22):andThen(function(v25)
            return v25.responseBody;
        end) else l_Promise_0.new(function(v26, _, _)
            v26(v18._publishService:CreateAssetOrAssetVersionAndPollAssetWithTelemetryAsync(v22, Enum.AssetCreatorType.User, l_StudioService_0:GetUserId(), "Image", 0, v20, v21, "", "", 0));
        end):andThen(function(v29)
            return v29.AssetId;
        end);
        v18._promises[v19] = v24;
        return v24;
    else
        return v18._promises[v19];
    end;
end;
return v12;
