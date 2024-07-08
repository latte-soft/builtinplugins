local l_StudioPublishService_0 = game:GetService("StudioPublishService");
local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Src.Thunks.PostContactEmail);
local v3 = require(l_Parent_0.Src.Util.KeyProvider).getOptInLocationsKeyName();
local l_shouldShowDevPublishLocations_0 = require(l_Parent_0.Src.Util.PublishPlaceAsUtilities).shouldShowDevPublishLocations;
local v5 = require(l_Parent_0.Src.Network.Requests.ApiSetUniverseDataSharing);
local v6 = require(l_Parent_0.Src.Flags.getFFlagCAP1107);
local v7 = require(l_Parent_0.Src.Flags.getFIntCAP1107ThrottleHundredthsPercentage);
local l_sendAnalyticsToKibana_0 = require(l_Parent_0.Src.Util.PublishPlaceAsUtilities).sendAnalyticsToKibana;
local v9 = require(l_Parent_0.Packages.Cryo);
local v10 = {
    isActive = true
};
local v11 = {
    description = true, 
    genre = true, 
    name = true, 
    playableDevices = true, 
    isFriendsOnly = true
};
if l_shouldShowDevPublishLocations_0() then
    v11.OptInLocations = true;
end;
local function _(v12)
    return v10[v12] ~= nil;
end;
local function _(v14)
    return v11[v14] ~= nil;
end;
local function v20(v16, v17)
    warn(v17 .. " HTTP " .. v16.responseCode);
    for _, v19 in pairs(v16.responseBody.errors) do
        warn(v19.userFacingMessage);
    end;
end;
return {
    saveAll = function(v21, v22, v23, v24, v25, v26)
        local v27 = {};
        local v28 = {};
        for v29, v30 in pairs(v21) do
            if not (v11[v29] ~= nil) then
                if v10[v29] ~= nil then
                    v28[v29] = v30;
                end;
            else
                v27[v29] = v30;
            end;
        end;
        game:GetService("StudioPublishService"):SetTeamCreateOnPublishInfo(v21.teamCreateEnabled, v27.name);
        l_StudioPublishService_0:setUploadNames(v27.name, v27.name);
        l_StudioPublishService_0:publishAs(0, 0, v21.creatorId, v25, nil);
        local v31 = nil;
        local v32 = nil;
        local v33, v34 = l_StudioPublishService_0.GamePublishFinished:wait();
        v31 = v33;
        v32 = v34;
        if v31 then
            if v27.playableDevices then
                v33 = {};
                for v35, v36 in pairs(v27.playableDevices) do
                    if v36 then
                        table.insert(v33, v35);
                    end;
                end;
                v27.playableDevices = v33;
            end;
            if l_shouldShowDevPublishLocations_0() and v24 ~= nil then
                if v2(v23, v24, v32) == 200 then
                    assert(v27.OptInLocations);
                    v34 = {};
                    local v37 = {};
                    for v38, v39 in pairs(v27.OptInLocations) do
                        if not v39 then
                            table.insert(v37, v38);
                        else
                            table.insert(v34, v38);
                        end;
                    end;
                    v27.optInRegions = v34;
                    v27.optOutRegions = v37;
                else
                    warn(v22:getText(v3, "EmailSubmitFailure"));
                end;
                v27.OptInLocations = nil;
            end;
            v23.Develop.V2.Universes.configuration(v32, v27):makeRequest():andThen(function()
                l_StudioPublishService_0:SetUniverseDisplayName(v27.name);
                l_StudioPublishService_0:RefreshDocumentDisplayName();
                l_StudioPublishService_0:EmitPlacePublishedSignal();
            end, function(v40)
                v20(v40, v22:getText("Error", "SetConfiguration"));
            end);
            if not v28.isActive then
                v23.Develop.V1.Universes.deactivate(v32):makeRequest():catch(function(v41)
                    v20(v41, v22:getText("Error", "DeactivatingUniverse"));
                end);
            else
                v23.Develop.V1.Universes.activate(v32):makeRequest():catch(function(v42)
                    v20(v42, v22:getText("Error", "ActivatingUniverse"));
                end);
            end;
            if v6() then
                assert(v26);
                v33 = true;
                if v21.creatorId ~= 0 then
                    v33 = v9.List.find(v26, v21.creatorId) ~= nil;
                end;
                if not (not v33 or not v21.dataSharingEnabled) then
                    v5(v32);
                end;
                l_sendAnalyticsToKibana_0("PublishPlaceAsDataSharing", v7(), "saveAll", {
                    dataSharingEnabled = v21.dataSharingEnabled, 
                    dataSharingDefault = v21.dataSharingDefault, 
                    isOwner = v33
                });
            end;
            return ;
        else
            return ;
        end;
    end
};
