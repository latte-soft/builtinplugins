local l_Parent_0 = script.Parent.Parent.Parent;
local l_Util_0 = require(l_Parent_0.Packages.Framework).Util;
local v2 = require(l_Parent_0.Src.Util.FileUtils);
local l_Promise_0 = l_Util_0.Promise;
local l_Symbol_0 = l_Util_0.Symbol;
local l_StudioPublishService_0 = game:GetService("StudioPublishService");
local l_GameSettingsExperienceGuidelines_0 = game:GetFastFlag("GameSettingsExperienceGuidelines");
local v7 = {};
v7.__index = v7;
v7.NameModerated = l_Symbol_0.named("NameModerated");
v7.DescriptionModerated = l_Symbol_0.named("DescriptionModerated");
v7.AltTextModerated = l_Symbol_0.named("AltTextModerated");
v7.new = function(v8)
    return (setmetatable({
        __networking = v8
    }, v7));
end;
v7.configurationV2GET = function(v9, v10)
    return v9.__networking:get("develop", "/v2/universes/" .. v10 .. "/configuration");
end;
v7.iconV1GET = function(v11, v12)
    return v11.__networking:get("develop", "/v1/universes/" .. v12 .. "/icon");
end;
v7.thumbnailsV2GET = function(v13, v14)
    return v13.__networking:get("games", "/v1/games/" .. v14 .. "/media");
end;
v7.configurationV2PATCH = function(v15, v16, v17)
    return v15.__networking:patch("develop", "/v2/universes/" .. v16 .. "/configuration", {
        Body = v17
    });
end;
v7.guidelinesPOST = function(v18, v19)
    assert(l_GameSettingsExperienceGuidelines_0);
    return v18.__networking:post("apis", "/experience-guidelines-service/v1beta1/multi-age-recommendation", {
        Body = {
            universeIds = {
                v19
            }
        }
    });
end;
v7.iconV1POST = function(v20, v21, v22)
    local l___networking_0 = v20.__networking;
    local v24 = v2.GetAssetPublishRequestInfo(v22);
    v24.Method = nil;
    return l___networking_0:post("publish", "/v1/games/" .. v21 .. "/icon", v24);
end;
v7.thumbnailV1POST = function(v25, v26, v27)
    local l___networking_1 = v25.__networking;
    local v29 = v2.GetAssetPublishRequestInfo(v27);
    v29.Method = nil;
    return l___networking_1:post("publish", "/v1/games/" .. v26 .. "/thumbnail/image", v29);
end;
v7.thumbnailV1DELETE = function(v30, v31, v32)
    return v30.__networking:delete("develop", "/v1/universes/" .. v31 .. "/thumbnails/" .. v32);
end;
v7.thumbnailOrderV1POST = function(v33, v34, v35)
    return v33.__networking:post("develop", "/v1/universes/" .. v34 .. "/thumbnails/order", {
        Body = {
            thumbnailIds = v35
        }
    });
end;
v7.thumbnailAltTextV1POST = function(v36, v37, v38)
    return v36.__networking:post("develop", "/v1/universes/" .. v37 .. "/thumbnails/alt-text", {
        Body = v38
    });
end;
v7.getName = function(v39, v40)
    return v39:configurationV2GET(v40):await().responseBody.name;
end;
v7.setName = function(v41, v42, v43)
    local v44 = nil;
    v41:configurationV2PATCH(v42, {
        name = v43
    }):catch(function(v45)
        if v45.responseCode == 400 then
            for _, v47 in ipairs(v45.responseBody.errors) do
                if v47.code == 7 then
                    v44 = v7.NameModerated;
                end;
            end;
        end;
    end):await();
    if not v44 then
        l_StudioPublishService_0:SetUniverseDisplayName(v43);
    else
        error(v44);
    end;
end;
v7.getDescription = function(v48, v49)
    return v48:configurationV2GET(v49):await().responseBody.description or "";
end;
v7.getGuidelines = function(v50, v51)
    assert(l_GameSettingsExperienceGuidelines_0);
    local v52 = v50:guidelinesPOST(v51):await().responseBody.ageRecommendationDetailsByUniverse[1];
    assert(v52);
    assert(v52.universeId == v51);
    if v52 then
        local l_ageRecommendation_0 = v52.ageRecommendationDetails.ageRecommendationSummary.ageRecommendation;
        if l_ageRecommendation_0 then
            return l_ageRecommendation_0.displayName;
        end;
    end;
    return nil;
end;
v7.setDescription = function(v54, v55, v56)
    v54:configurationV2PATCH(v55, {
        description = v56
    }):await();
end;
v7.getGenre = function(v57, v58)
    return v57:configurationV2GET(v58):await().responseBody.genre;
end;
v7.setGenre = function(v59, v60, v61)
    v59:configurationV2PATCH(v60, {
        genre = v61
    }):await();
end;
v7.getSupportedDevices = function(v62, v63)
    return v62:configurationV2GET(v63):await().responseBody.playableDevices;
end;
v7.setSupportedDevices = function(v64, v65, v66)
    v64:configurationV2PATCH(v65, {
        playableDevices = v66
    }):await();
end;
v7.getThumbnails = function(v67, v68)
    return v67:thumbnailsV2GET(v68):await().responseBody.data;
end;
v7.addThumbnails = function(v69, v70, v71)
    local v72 = {};
    local v73 = {};
    for _, v75 in ipairs(v71) do
        table.insert(v72, v69:thumbnailV1POST(v70, v75):andThen(function(v76)
            v73[v75] = v76.responseBody.targetId;
        end));
    end;
    l_Promise_0.all(v72):await();
    return v73;
end;
v7.removeThumbnails = function(v77, v78, v79)
    local v80 = {};
    for _, v82 in ipairs(v79) do
        table.insert(v80, v77:thumbnailV1DELETE(v78, v82));
    end;
    l_Promise_0.all(v80):await();
end;
v7.updateThumbnailAltText = function(v83, v84, v85)
    local v86 = nil;
    local v87 = nil;
    v83:thumbnailAltTextV1POST(v84, v85):andThen(function(v88)
        v86 = v88.responseBody;
    end):catch(function(v89)
        if v89.responseCode == 400 then
            for _, v91 in ipairs(v89.responseBody.errors) do
                if v91.code == 19 then
                    v87 = v7.AltTextModerated;
                end;
            end;
        end;
    end):await();
    if not v87 then
        if v86 ~= nil then
            return v86;
        end;
    else
        error(v87);
    end;
    return nil;
end;
v7.setThumbnailsOrder = function(v92, v93, v94)
    v92:thumbnailOrderV1POST(v93, v94):await();
end;
v7.getIcon = function(v95, v96)
    local v97 = v95:iconV1GET(v96):await();
    local l_imageId_0 = v97.responseBody.imageId;
    return not not l_imageId_0 and "rbxassetid://" .. l_imageId_0 or nil, v97.responseBody.isApproved;
end;
v7.setIcon = function(v99, v100, v101)
    v99:iconV1POST(v100, v101):await();
end;
v7.getOptInLocations = function(v102, v103)
    return v102:configurationV2GET(v103):await().responseBody.optInRegions;
end;
v7.setOptInLocations = function(v104, v105, v106, v107)
    v104:configurationV2PATCH(v105, {
        optInRegions = v106, 
        optOutRegions = v107
    });
end;
return v7;
