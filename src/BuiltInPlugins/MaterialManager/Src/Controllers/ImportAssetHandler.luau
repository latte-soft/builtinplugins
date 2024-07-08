local v0 = require(script.Parent.Parent.Parent.Packages.Framework);
local l_ContextItem_0 = v0.ContextServices.ContextItem;
local l_Promise_0 = v0.Util.Promise;
local v3 = l_ContextItem_0:extend("ImportAssetHandler");
v3.__index = v3;
v3.new = function(v4, v5)
    local v6 = setmetatable({
        _imageUploader = v4, 
        _userId = v5 or game:GetService("StudioService"):GetUserId()
    }, v3);
    assert(v6._imageUploader, "ImportAssetHandler expects an ImageUploader");
    return v6;
end;
v3.mock = function(v7, v8)
    return v3.new(v7, v8);
end;
v3.handleAsset = function(v9, v10, v11)
    assert(v10, "ImportAssetHandler:handleAsset() requires an assetFile");
    if v11 then
        v11(true);
    end;
    local l_v10_TemporaryId_0 = v10:GetTemporaryId();
    local v13 = nil;
    local l_status_0, l_result_0 = pcall(function()
        v13 = v10:GetBinaryContents();
    end);
    if l_status_0 then
        return v9._imageUploader:upload(l_v10_TemporaryId_0, v10.Name, "", v13):andThen(function(v16)
            local v17 = tonumber(v16);
            if not v17 then
                local v18 = ("Asset id \"%s\" for temp id \"%s\" could not be cast to an integer"):format(v16, l_v10_TemporaryId_0);
                warn(v18);
                assert(v17, v18);
            end;
            return "rbxassetid://" .. v17;
        end);
    else
        return l_Promise_0.reject(l_result_0);
    end;
end;
return v3;
