local v0 = {};
v0.__index = v0;
local l_script_FirstAncestor_0 = script:FindFirstAncestor("StreamingServiceDispatcherRegistry");
local v2 = require(l_script_FirstAncestor_0.Src.Utils.CliAdapter);
local v3 = v2.GetService("ChangeHistoryService");
local v4 = v2.GetService("MemStorageService");
local v5 = v2.GetService("StreamingService");
local v6 = v2.GetService("ChatbotUIService");
local v7 = v2.GetService("TweenService");
local v8 = v2.GetService("HttpService");
local v9 = v2.GetService("Selection");
local v10 = v2.GetService("ConversationalAIAcceptanceService");
local v11 = require(l_script_FirstAncestor_0.Packages.Dash);
local v12 = require(l_script_FirstAncestor_0.SharedPluginConstants);
local v13 = require(l_script_FirstAncestor_0.Src.Utils.Utils);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v15 = require(l_script_FirstAncestor_0.Src.Commands.BuilderCommands.BuilderNameMap);
local v16 = require(l_script_FirstAncestor_0.Src.Localization.Localization);
local v17 = require(l_script_FirstAncestor_0.Src.Commands.DisplayError);
local v18 = require(l_script_FirstAncestor_0.Src.ContextCollectors.RecentInstancesContext);
local v19 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAIFirstVariationFix);
local v20 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAI_ConditionalDropdown);
local v21 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagConvAIStreamableCommands);
local v22 = require(l_script_FirstAncestor_0.Src.Flags.getFFlagFixAssistantLuaTests);
handleCachedPacketsForStream = function(v23, v24)
    local v25 = require(script.Parent.Parent.Cache.StreamCache);
    if v24 == v25.activeStreamId() then
        local v26 = v25.packetExists(v23, v24);
        while v26 do
            local v27 = v25.handleEarliestPacketForStream(v23, v24);
            v26 = v25.packetExists(v23, v24);
            if v27.isFinal == true then
                local v28 = v25.activeStreamEnded(v23, v24);
                if v28 then
                    handleCachedPacketsForStream(v23, v28);
                end;
            end;
        end;
    end;
end;
local function v37(v29)
    local v30, v31 = v13.getPositionAndSize(v29);
    if v30 then
        local l_CurrentCamera_0 = workspace.CurrentCamera;
        local v33 = l_CurrentCamera_0.ViewportSize * 0.5;
        local v34 = l_CurrentCamera_0:ViewportPointToRay(v33.X, v33.Y);
        local v35 = math.max((0.5 * (math.max(v31.X, v31.Y, v31.Z) * 1)) / math.tan(math.min(math.acos((v34.Direction.Unit:Dot(l_CurrentCamera_0:ViewportPointToRay(v33.X, 0).Direction.Unit))), (math.acos((v34.Direction.Unit:Dot(l_CurrentCamera_0:ViewportPointToRay(0, v33.Y).Direction.Unit))))) / 2), 20);
        local l_CFrame_0 = l_CurrentCamera_0.CFrame;
        v7:Create(l_CurrentCamera_0, TweenInfo.new(0.22, Enum.EasingStyle.Cubic, Enum.EasingDirection.Out), {
            CFrame = CFrame.new(v30 - l_CFrame_0.LookVector * v35) * l_CFrame_0.Rotation, 
            Focus = CFrame.new(v30)
        }):Play();
    end;
end;
v0.getActionInstance = function(v38, v39, v40)
    local _, _, v43 = string.find(v39, "studio://instance/(.+)");
    if (not v43 or not v15.activeDraftGuids) or not v15.activeDraftGuids[v43] then
        if not v43 then
            local _, _, v46 = string.find(v39, "studio://instanceid/(.+)");
            if v46 then
                local v47 = v15.get(v46);
                if not v47 then
                    local _, _, v50 = string.find(v46, "Instance_(.+)");
                    if v50 then
                        v43 = v15.g2g[v50] or v50;
                        v47 = v15.guid2instance[v43];
                    end;
                end;
                if v47 then
                    return {
                        v47
                    }, v43, {
                        v43
                    };
                end;
            end;
        end;
        return v38:getActionInstanceFromGuid(v43, v40);
    else
        return {};
    end;
end;
v0.getActionInstanceFromGuid = function(v51, v52, v53)
    if v52 then
        local v54 = v15.guidToInfo[v52];
        if v54 then
            local v55 = {
                v52
            };
            local v56 = {
                v54.instance
            };
            local l_chatBulletGroupId_0 = v54.chatBulletGroupId;
            if not (not l_chatBulletGroupId_0 or not v15.chatBulletMap[l_chatBulletGroupId_0]) and (v20() or #v15.chatBulletMap[l_chatBulletGroupId_0] > 0) then
                table.clear(v56);
                table.clear(v55);
                for _, v59 in v15.chatBulletMap[l_chatBulletGroupId_0], nil, nil do
                    local v60 = v15.guidToInfo[v59];
                    if not (not v60 or not if not v20() then v60.instance:IsDescendantOf(workspace) else v60.instance.Parent ~= nil) then
                        table.insert(v56, v60.instance);
                        table.insert(v55, v59);
                    end;
                end;
            end;
            if #v56 == 0 then
                return {};
            else
                if not v51.actionClickCursor or v52 ~= v51.lastGroupSelected then
                    v51.actionClickCursor = 0;
                elseif v53 then
                    v51.actionClickCursor = (v51.actionClickCursor + v53) % (#v56 + 1);
                end;
                if v51.actionClickCursor ~= 0 then
                    return {
                        v56[v51.actionClickCursor]
                    }, v52, {
                        v55[v51.actionClickCursor]
                    };
                else
                    return v56, v52, v55;
                end;
            end;
        else
            return {};
        end;
    else
        return {};
    end;
end;
v0.onShiftAssetToId = function(v61, v62, v63)
    if not v19() then
        local v64 = tostring(v63);
        local v65, v66, v67 = v61:getActionInstance(v62);
        if #v65 > 0 then
            local v68 = v15.altDataMap[v66];
            if #v67 == 1 then
                v68 = v15.altDataMap[v67[1]];
            end;
            if v68.altAssets and #v68.altAssets > 0 then
                local v69 = -1;
                local v70 = -1;
                for v71, v72 in v68.altAssets, nil, nil do
                    if v72 == v68.assetId then
                        v69 = v71;
                    elseif v72 == v64 then
                        v70 = v71;
                    end;
                end;
                if v69 == -1 then
                    table.insert(v68.altAssets, v68.assetId);
                    v69 = #v68.altAssets;
                end;
                if v69 ~= -1 and v70 ~= -1 then
                    v61:onShiftAssetVariant(v62, v70 - v69);
                end;
            end;
        end;
        return ;
    else
        v61:onShiftAssetVariant(v62, nil, v63);
        return ;
    end;
end;
v0.onShiftAssetVariant = function(v73, v74, v75, v76)
    local v77, v78, v79 = v73:getActionInstance(v74);
    if #v77 > 0 then
        if not v19() then
            v76 = nil;
        end;
        if not (v19() and (v76 or not v75)) then
            local v80 = v15.altDataMap[v78];
            if #v79 == 1 then
                v80 = v15.altDataMap[v79[1]];
            end;
            if v80.altAssets and #v80.altAssets > 0 then
                for v81, v82 in v80.altAssets, nil, nil do
                    if v82 == v80.assetId then
                        v76 = v80.altAssets[((v81 - 1) + v75) % #v80.altAssets + 1];
                        break;
                    end;
                end;
                if not v76 then
                    table.insert(v80.altAssets, v80.assetId);
                    v76 = v80.altAssets[1];
                end;
            end;
        end;
        if v76 then
            if not v13.isAssetCached(v76) then
                v13.loadAssetAsync(v76);
            end;
            local v83 = 0;
            local l_BindableEvent_0 = Instance.new("BindableEvent");
            local v85 = v3:TryBeginRecording("Assistant Variation Swap");
            do
                local l_v83_0 = v83;
                for v87, v88 in v77, nil, nil do
                    local v89 = v79[v87];
                    local v90 = v15.altDataMap[v89];
                    if v90 then
                        l_v83_0 = l_v83_0 + 1;
                        task.defer(function()
                            local l_request_0 = v90.request;
                            local l_arguments_0 = l_request_0.arguments;
                            if l_arguments_0 then
                                local l_properties_0 = l_arguments_0.properties;
                                if not l_properties_0 then
                                    l_properties_0 = {};
                                    l_arguments_0.properties = l_properties_0;
                                end;
                                local v94 = v13.getRequestCFrame(l_request_0.requestId):PointToObjectSpace(v13.getWorldBoundingBox(v88).Position);
                                l_properties_0.position = {
                                    x = v94.X, 
                                    z = v94.Z
                                };
                                l_arguments_0.altDataId = v89;
                            end;
                            v90.assetId = v76;
                            v73.deferedSelection = true;
                            if not v13.isAssetCached(v76) then
                                v13.loadAssetAsync(v76);
                            end;
                            v5:ExecuteCommandAsync(l_request_0.requestId, "InsertAsset", l_request_0);
                            local l_instance_0 = v15.guidToInfo[v89].instance;
                            local v96 = v9:Get();
                            local v97 = false;
                            for v98 = 1, #v96 do
                                if v96[v98] == v88 then
                                    v97 = true;
                                    v96[v98] = l_instance_0;
                                end;
                            end;
                            if v97 then
                                v9:Set(v96);
                            end;
                            v10:AlternativeAssetSelected(l_request_0.requestId, v88:GetAttribute("AssetId"), (l_instance_0:GetAttribute("AssetId")));
                            v88.Parent = nil;
                            v73.deferedSelection = false;
                            l_v83_0 = l_v83_0 - 1;
                            l_BindableEvent_0:Fire();
                        end);
                    end;
                end;
                if l_v83_0 > 0 then
                    task.spawn(function()
                        while l_v83_0 > 0 do
                            l_BindableEvent_0.Event:Wait();
                        end;
                        l_BindableEvent_0:Destroy();
                        if v85 then
                            v3:FinishRecording(v85, Enum.FinishRecordingOperation.Commit);
                        end;
                        local v99 = {};
                        for _, v101 in v79, nil, nil do
                            table.insert(v99, v15.guidToInfo[v101].instance);
                        end;
                        v37(v99);
                    end);
                end;
            end;
        else
            return ;
        end;
    end;
end;
local function _(v102)
    v4:Fire(v12.SHOW_TOOLBOX_OPEN_MODELS_AND_SEARCH_EVENT, v102);
end;
local function v112(v104)
    local v105 = {};
    local function v109(v106)
        if v106:IsA("BasePart") then
            table.insert(v105, v106);
        end;
        for _, v108 in v106:GetDescendants() do
            if v108:IsA("BasePart") then
                table.insert(v105, v108);
            end;
        end;
    end;
    for _, v111 in v104, nil, nil do
        v109(v111);
    end;
    return v105;
end;
local function v121(v113)
    local v114 = v0:getActionInstanceFromGuid(v113);
    local v115 = v114[1];
    if v115 and v115:IsA("MaterialVariant") then
        local v116 = v9:Get();
        local v117 = v112(v116);
        if v116[1] == v115 then
            v9:Set({});
            return ;
        elseif #v117 == 0 then
            v9:Set(v114);
            return ;
        else
            local v118 = v3:TryBeginRecording("AssistantSetMaterials");
            for _, v120 in v117, nil, nil do
                v120.Material = v115.BaseMaterial;
                v120.MaterialVariant = v115.Name;
            end;
            if v118 then
                v3:FinishRecording(v118, Enum.FinishRecordingOperation.Commit);
            end;
            return ;
        end;
    else
        return ;
    end;
end;
v0.onAction = function(v122, v123)
    local v124, v125 = v122:getActionInstance(v123, 1);
    if #v124 > 0 then
        v122.lastSelectedInstances = v124;
        v122.lastGroupSelected = v125;
        v9:Set(v124);
        if not v122._selectionListener then
            v122._selectionListener = v9.SelectionChanged:Connect(function()
                if not v122.deferedSelection then
                    v122.deferedSelection = true;
                    task.defer(function()
                        v122.deferedSelection = false;
                        local v126 = v9:Get();
                        if not (#v126 == 0 and #v122.lastSelectedInstances == 1) or v122.lastSelectedInstances[1]:IsDescendantOf(workspace) then
                            if not v11.shallowEqual(v126, v122.lastSelectedInstances) then
                                v122._selectionListener:Disconnect();
                                v122._selectionListener = nil;
                                table.clear(v122.lastSelectedInstances);
                                v122.lastSelectedInstances = nil;
                                v122.actionClickCursor = nil;
                            end;
                            return ;
                        else
                            v122.actionClickCursor = (v122.actionClickCursor - 1) % (#v124 + 1);
                            return ;
                        end;
                    end);
                    return ;
                else
                    return ;
                end;
            end);
        end;
        v37(v124);
        return ;
    elseif not string.match(v123, "^studio://apply_material_variant/.+") then
        if string.match(v123, "^https://") then
            v6:DisplayContent("ExternalURL", {
                url = v123
            });
        end;
        if v123 == "LegalDisclaimerAccepted" then
            v6:DisplayContent("LegalDisclaimerAccepted", {});
            return ;
        else
            if v123 == "LegalDisclaimerRejected" then
                v6:DisplayContent("LegalDisclaimerRejected", {});
            end;
            return ;
        end;
    else
        local v127 = string.match(v123, "^studio://apply_material_variant/(.+)");
        if v127 then
            v121(v127);
            return ;
        else
            return ;
        end;
    end;
end;
v0.getPluginInfo = function(v128, v129, v130)
    if v129 == "attribution" then
        local v131, v132, v133 = v128:getActionInstance(v130);
        if #v131 > 0 then
            local v134 = v15.altDataMap[v132];
            if #v133 == 1 then
                v134 = v15.altDataMap[v133[1]];
            end;
            local v135 = v13.getAssetAttributionInfo(v134 and v134.assetId);
            if v135 then
                local l_Name_0 = v135.Name;
                local l_Name_1 = v135.Creator.Name;
                if not (not l_Name_0 or not l_Name_1) then
                    return v16:getText("Message", "AuthoredBy", {
                        asset = l_Name_0, 
                        creator = l_Name_1
                    });
                end;
            end;
        end;
    elseif v129 == "assetId" then
        local v138, v139, v140 = v128:getActionInstance(v130);
        if #v138 > 0 then
            local v141 = v15.altDataMap[v139];
            if #v140 == 1 then
                v141 = v15.altDataMap[v140[1]];
            end;
            if not (not v141 or not v141.assetId) then
                return v141.assetId;
            end;
        end;
    end;
    return nil;
end;
local function v175(v142, v143, v144, v145)
    local v146 = nil;
    if not v22() then
        v146 = v5;
    end;
    v143 = v143 or v5;
    v145 = v145 or v8;
    v144 = v144 or v6;
    if v22() then
        v146 = v143;
    end;
    local v147 = require(script.Parent.Parent.Cache.StreamCache);
    v142._streamConn = v146.Stream:Connect(function(v148, v149, v150)
        local v151 = v145:JSONDecode(v150);
        local l_streamId_0 = v151.streamId;
        if v21() then
            v151.command = v149;
            l_streamId_0 = l_streamId_0 or v151.arguments and v151.arguments.syncStreamId;
        end;
        v147.storeStreamPacket(v148, l_streamId_0, v151);
        handleCachedPacketsForStream(v148, l_streamId_0);
    end);
    v142._requestStartedConn = v146.RequestStarted:Connect(function(v153)
        v147.newRequest(v153);
    end);
    v142._requestEndedConn = v146.RequestEnded:Connect(function(v154)
        v147.requestEnded(v154);
    end);
    v142._conversationClearedConn = v146.ConversationCleared:Connect(function()
        v18.clear();
    end);
    v142._commandsFinished = v146.SequentialCommandsFinished:Connect(function(v155)
        v144:DisplayContent("EndRequest", {
            requestId = v155
        });
    end);
    v142._findVariations = v144.FindVariationsSignal:Connect(function(v156)
        local v157 = v142:getActionInstance(v156);
        if #v157 > 0 then
            v4:Fire(v12.SHOW_TOOLBOX_OPEN_MODELS_AND_SEARCH_EVENT, v157[1].Name);
            return ;
        else
            print("Find Variations called:", v156);
            return ;
        end;
    end);
    v142._setMaterialSettings = v144.SetMaterialSettingsSignal:Connect(function(v158, v159, v160)
        local v161 = v142:getActionInstanceFromGuid(v158);
        if #v161 > 0 then
            local v162 = v161[1];
            v162.StudsPerTile = v159;
            v162.MaterialPattern = if not v160 then Enum.MaterialPattern.Regular else Enum.MaterialPattern.Organic;
        end;
    end);
    v142._onActionConnection = v144.ActionActivatedSignal:Connect(function(v163)
        v142:onAction(v163);
    end);
    v142._onShiftAssetVariation = v144.ShiftVariationSignal:Connect(function(...)
        v142:onShiftAssetVariant(...);
    end);
    v142._onShiftAssetToId = v144.ShiftToAssetIdSignal:Connect(function(...)
        v142:onShiftAssetToId(...);
    end);
    v142._requestStartedConnection = v146.RequestStarted:Connect(function(v164, v165)
        table.clear(v15.assetCacheMap);
        v15.SetRequestMetadata(v164, "Query", v165);
    end);
    v142._requestErrorConnection = v146.RequestError:Connect(function(v166, v167, v168)
        v17({
            requestId = v166, 
            arguments = {
                errorId = "StreamingServiceError", 
                errorType = v167, 
                errorMessage = v168
            }
        });
        v15.SetRequestMetadata(v166, "ErrorMessage", v168);
    end);
    v142._requestEndedConnection = v146.RequestEnded:Connect(function(v169)
        local v170 = v15.GetRequestMetadata(v169, "Time_Start");
        local v171 = os.clock();
        v15.SetRequestMetadata(v169, "Time_End", v171);
        v15.SetRequestMetadata(v169, "Time_Run", v171 - v170);
    end);
    v142._sequentialCommandsFinishedConnection = v146.SequentialCommandsFinished:Connect(function(v172)
        for _, v174 in v15.assetCacheMap, nil, nil do
            if not (not v174 or not v174.Parent) then
                v174:Destroy();
            end;
        end;
        table.clear(v15.assetCacheMap);
        v13.endConstraintVisualization(v172);
        v13.disableDraftMode(v172);
    end);
    v143:SetPluginInfoCallback(function(...)
        return v142:getPluginInfo(...);
    end);
end;
v0.destroy = function(v176)
    if v176._streamConn then
        v176._streamConn:Disconnect();
        v176._streamConn = nil;
    end;
    if v176._requestStartedConn then
        v176._requestStartedConn:Disconnect();
        v176._requestStartedConn = nil;
    end;
    if v176._requestEndedConn then
        v176._requestEndedConn:Disconnect();
        v176._requestEndedConn = nil;
    end;
    if v176._conversationClearedConn then
        v176._conversationClearedConn:Disconnect();
        v176._conversationClearedConn = nil;
    end;
    if v176._commandsFinished then
        v176._commandsFinished:Disconnect();
        v176._commandsFinished = nil;
    end;
    if v176._findVariations then
        v176._findVariations:Disconnect();
        v176._findVariations = nil;
    end;
    if v176._setMaterialSettings then
        v176._setMaterialSettings:Disconnect();
        v176._setMaterialSettings = nil;
    end;
    if v176._onActionConnection then
        v176._onActionConnection:Disconnect();
        v176._onActionConnection = nil;
    end;
    if v176._onShiftAssetVariation then
        v176._onShiftAssetVariation:Disconnect();
        v176._onShiftAssetVariation = nil;
    end;
    if v176._onShiftAssetToId then
        v176._onShiftAssetToId:Disconnect();
        v176._onShiftAssetToId = nil;
    end;
    if v176._selectionListener then
        v176._selectionListener:Disconnect();
        v176._selectionListener = nil;
    end;
    if v176._requestStartedConnection then
        v176._requestStartedConnection:Disconnect();
        v176._requestStartedConnection = nil;
    end;
    if v176._requestErrorConnection then
        v176._requestErrorConnection:Disconnect();
        v176._requestErrorConnection = nil;
    end;
    if v176._requestEndedConnection then
        v176._requestEndedConnection:Disconnect();
        v176._requestEndedConnection = nil;
    end;
    if v176._sequentialCommandsFinishedConnection then
        v176._sequentialCommandsFinishedConnection:Disconnect();
        v176._sequentialCommandsFinishedConnection = nil;
    end;
    v5:SetPluginInfoCallback();
end;
v0.new = function(v177, v178, v179)
    local v180 = {};
    if not v22() then
        v175(v180, v177, nil, v179);
    else
        v175(v180, v177, v178, v179);
    end;
    setmetatable(v180, v0);
    return v180;
end;
return v0;
