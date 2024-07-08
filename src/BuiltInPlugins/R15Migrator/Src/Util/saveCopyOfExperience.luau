local l_StudioPublishService_0 = game:GetService("StudioPublishService");
local function v5(v1, v2)
    warn(v2 .. " HTTP " .. v1.responseCode);
    for _, v4 in pairs(v1.responseBody.errors) do
        warn(v4.userFacingMessage);
    end;
end;
return function(v6, v7, v8)
    local l_GameId_0 = game.GameId;
    l_StudioPublishService_0:SetTeamCreateOnPublishInfo(not not v8.teamCreateEnabled or false, v8.name);
    l_StudioPublishService_0:setUploadNames(v8.name, v8.name);
    l_StudioPublishService_0:publishAs(0, 0, 0, false, nil, false, false);
    local v10 = nil;
    local v11 = nil;
    local v12, v13 = l_StudioPublishService_0.GamePublishFinished:wait();
    v10 = v12;
    v11 = v13;
    while l_GameId_0 ~= game.GameId do
        wait();
    end;
    if v10 then
        v7.Develop.V2.Universes.configuration(v11, v8):makeRequest():andThen(function()
            l_StudioPublishService_0:SetUniverseDisplayName(v8.name);
            l_StudioPublishService_0:RefreshDocumentDisplayName();
            l_StudioPublishService_0:EmitPlacePublishedSignal();
        end, function(v14)
            v5(v14, v6:getText("Error", "SetConfiguration"));
        end);
        v7.Develop.V1.Universes.deactivate(v11):makeRequest():catch(function(v15)
            v5(v15, v6:getText("Error", "DeactivatingUniverse"));
        end);
        return v11;
    else
        return ;
    end;
end;
