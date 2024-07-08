local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.Framework);
local l_Http_0 = v4.Http;
local l_Promise_0 = v4.Util.Promise;
local v7 = require(l_Parent_0.Src.Actions.SetIsBusy);
local v8 = require(l_Parent_0.Src.Actions.SetMessage);
local v9 = require(l_Parent_0.Src.Components.UploadDialogContent);
local v10 = require(l_Parent_0.Src.Components.ErrorDialog);
local v11 = require(l_Parent_0.Src.Components.WarningDialog);
local v12 = require(l_Parent_0.Src.Thunks.DownloadCloudTable);
local v13 = require(l_Parent_0.Src.Util.RbxEntriesToWebEntries);
local v14 = require(l_Parent_0.Src.Util.PatchInfo);
local v15 = require(l_Parent_0.Src.Util.isEmpty);
local v16 = require(l_Parent_0.Src.Util.ValidateCloudTable);
local v17 = Vector2.new(300, 370);
local v18 = Vector2.new(500, 200);
local l_game_EngineFeature_0 = game:GetEngineFeature("EnableLocalizedLocalizationToolsErrorsApi");
local v20 = nil;
if l_game_EngineFeature_0 then
    v20 = require(l_Parent_0.Src.Util.MapEngineErrors);
end;
local v21 = game:DefineFastFlag("SwitchLocTablesAssetGenerationRequestToLocTablesAPI", false);
local function _(v22, v23)
    return function()
        v22:dispatch(v7(false));
        v22:dispatch(v8(v23:getText("MessageFrame", "UploadFailedMessage")));
    end;
end;
local function v30(v25)
    local v26 = {};
    v25:makeRequest():andThen(function(v27)
        if v27 and v27.responseCode == l_Http_0.StatusCodes.OK then
            for _, v29 in ipairs(v27.responseBody.data) do
                v26[v29.languageCode] = true;
            end;
            return ;
        else
            return ;
        end;
    end, function()
    end):await();
    return v26;
end;
local function v34(v31)
    local v32 = nil;
    v31:makeRequest():andThen(function(v33)
        if v33 and v33.responseCode == l_Http_0.StatusCodes.OK then
            v32 = v33.responseBody.languageCode or "";
        end;
    end, function()
    end):await();
    return v32;
end;
local function v44(v35, v36, v37)
    local v38 = {};
    for v39, _ in pairs(v37) do
        table.insert(v38, {
            languageCodeType = "Language", 
            languageCode = v39, 
            delete = false
        });
    end;
    local v41 = v35.GameInternationalization.V1.SupportedLanguages.Games.patch(v36, (l_HttpService_0:JSONEncode(v38)));
    local v42 = nil;
    v41:makeRequest():andThen(function(v43)
        if v43.responseCode == l_Http_0.StatusCodes.OK then
            v42 = true;
            return ;
        else
            v42 = false;
            return ;
        end;
    end, function()
        v42 = false;
    end):await();
    return v42;
end;
local v51 = {
    ["38"] = function(v45, v46)
        if v45.identifier == nil then
            return ;
        else
            if v46["38"] == nil then
                v46["38"] = {};
            end;
            table.insert(v46["38"], v45.identifier);
            return ;
        end;
    end, 
    ["43"] = function(v47, v48)
        if v47.translations == nil then
            return ;
        else
            if v48["43"] == nil then
                v48["43"] = {};
            end;
            for _, v50 in pairs(v47.translations) do
                table.insert(v48["43"], v50);
            end;
            return ;
        end;
    end
};
local function v71(v52, v53, v54, v55, v56)
    local v57 = v14.SplitByLimits(v55.makePatch(), game:GetFastInt("LocalizationTableUploadRowMax"), game:GetFastInt("LocalizationTableUploadTranslationMax"));
    if not v15(v57) then
        local v58 = {};
        for _, v60 in pairs(v57) do
            table.insert(v58, v52.LocalizationTables.V1.LocalizationTable.tables(v53, v54, (l_HttpService_0:JSONEncode(v60))):makeRequest());
        end;
        return l_Promise_0.all(v58):andThen(function(v61)
            local v62 = {};
            for _, v64 in pairs(v61) do
                if not (not ((v64.responseBody ~= nil and next(v64.responseBody) ~= nil) and v64.responseBody.failedEntriesAndTranslations ~= nil) or not next(v64.responseBody.failedEntriesAndTranslations)) then
                    for _, v66 in pairs(v64.responseBody.failedEntriesAndTranslations) do
                        if v66.error then
                            local v67 = v51[tostring(v66.error.errorCode)];
                            if v67 then
                                v67(v66, v62);
                            end;
                        end;
                    end;
                end;
            end;
            if next(v62) then
                local v68 = {
                    ["38"] = v56:getText("UploadDialogContent", "InvalidIdentifier"), 
                    ["43"] = v56:getText("UploadDialogContent", "InvalidTranslation")
                };
                warn(v56:getText("UploadDialogContent", "UploadCompleteWithInvalidEntries"));
                for v69, v70 in pairs(v62) do
                    print(v68[v69]);
                    print(v70);
                end;
            end;
            return true;
        end, function()
            return false;
        end):await();
    else
        return true;
    end;
end;
local function v75(v72, v73)
    local _ = nil;
    (if not v21 then v72.GameInternationalization.V1.LocalizationTable.Games.DEPRECATED_assetsGenerationRequest(v73) else v72.LocalizationTables.V1.Games.assetsGenerationRequest(v73)):makeRequest():andThen(function()
    end, function()
    end):await();
end;
local function _(v76)
    return function(v77, v78)
        return v3.createElement(v9, {
            PatchInfo = v76, 
            OkCallback = v77, 
            CancelCallback = v78
        });
    end;
end;
local function _(v80)
    return function(v81, v82)
        return v3.createElement(v10, {
            OkCallback = v81, 
            CancelCallback = v82, 
            Text = v80
        });
    end;
end;
local function _(v84)
    return function(v85, v86)
        return v3.createElement(v11, {
            OkCallback = v85, 
            CancelCallback = v86, 
            Text = v84
        });
    end;
end;
return function(v88, v89, v90, v91, v92)
    return function(v93)
        local l_v89_0 = v89;
        local l_l_v89_0_0 = l_v89_0 --[[ copy: 2 -> 18 ]];
        local function v96()
            v93:dispatch(v7(false));
            v93:dispatch(v8(l_l_v89_0_0:getText("MessageFrame", "UploadFailedMessage")));
        end;
        l_v89_0 = v93:getState();
        if not l_v89_0.CloudTable.IsBusy then
            v93:dispatch(v7(true));
            v93:dispatch(v8(v89:getText("MessageFrame", "OpenCSVFileMessage")));
            local v97 = nil;
            local l_status_0, l_result_0 = pcall(function()
                v97 = l_LocalizationService_0:PromptUploadCSVToGameTable();
            end);
            if not l_status_0 or v97 == nil then
                v96();
                if not l_game_EngineFeature_0 then
                    warn(l_result_0);
                else
                    warn(v20.getTranslationForEngineError(l_result_0, v89));
                end;
                return ;
            else
                if not (not v92 or not v16.isTableEmpty(v97:GetEntries())) then
                    v96();
                    local l_v91_0 = v91;
                    local v101 = v89:getText("UploadTable", "EmptyCSVDialogTitle");
                    local l_v18_0 = v18;
                    local v103 = v89:getText("UploadTable", "EmptyCSVWarning");
                    local l_v103_0 = v103 --[[ copy: 11 -> 19 ]];
                    if not l_v91_0(v101, l_v18_0, function(v105, v106)
                        return v3.createElement(v11, {
                            OkCallback = v105, 
                            CancelCallback = v106, 
                            Text = l_v103_0
                        });
                    end):await() then
                        return ;
                    end;
                end;
                local v107, v108 = v16.tableContainsInvalidEntries(v97:GetEntries(), v89);
                if not v107 then
                    v93:dispatch(v8(v89:getText("MessageFrame", "ComputingPatchMessage")));
                    local v109 = v34(v88.GameInternationalization.V1.SourceLanguage.Games.get(game.GameId));
                    if v109 == nil then
                        v96();
                        warn(v89:getText("UploadTable", "GetGameSourceLanguageFailed"));
                        return ;
                    else
                        local v110 = v30(v88.GameInternationalization.V1.SupportedLanguages.Games.get(game.GameId));
                        if v110 == nil then
                            v96();
                            warn(v89:getText("UploadTable", "GetSupportedLanguagesFailedMessage"));
                            return ;
                        else
                            local l_CloudTableId_0 = l_v89_0.PluginMetadata.CloudTableId;
                            local v112 = v12.Download(v88, v89, l_CloudTableId_0);
                            if v112 == nil then
                                v96();
                                warn(v89:getText("UploadTable", "GetCloudTableFailed"));
                                return ;
                            else
                                local l_AllLanguages_0 = l_v89_0.PluginMetadata.AllLanguages;
                                local l_LocalesToLanguages_0 = l_v89_0.PluginMetadata.LocalesToLanguages;
                                local v115 = v13(v112:GetEntries(), l_AllLanguages_0, l_LocalesToLanguages_0);
                                local v116 = v13(v97:GetEntries(), l_AllLanguages_0, l_LocalesToLanguages_0, v110);
                                local v117 = v14.DiffTables("MyLocalizationTable", v115.entries, v116.entries, v92, v109, l_LocalesToLanguages_0, v89);
                                v117.totalRows = v116.totalRows;
                                v117.totalTranslations = v116.totalTranslations;
                                v117.supportedLocales = v116.supportedLocales;
                                v117.unsupportedLocales = v116.unsupportedLocales;
                                v117.includeDeletes = v92;
                                v117.newLanguages = v116.newLanguages;
                                v117.newLanguagesSet = v116.newLanguagesSet;
                                v93:dispatch(v8(v89:getText("MessageFrame", "ConfirmUploadMessage")));
                                if v91(v89:getText("UploadDialogContent", "ConfirmUploadDialogTitle"), v17, function(v118, v119)
                                    return v3.createElement(v9, {
                                        PatchInfo = v117, 
                                        OkCallback = v118, 
                                        CancelCallback = v119
                                    });
                                end):await() then
                                    v93:dispatch(v8(v89:getText("MessageFrame", "UploadingPatchMessage")));
                                    if (not (v117.newLanguagesSet ~= nil) or v15(v117.newLanguagesSet)) or v44(v88, game.GameId, v117.newLanguagesSet) then
                                        if v71(v88, l_CloudTableId_0, game.GameId, v117, v89) then
                                            v93:dispatch(v7(false));
                                            v93:dispatch(v8(v89:getText("MessageFrame", "UploadCompletedMessage")));
                                            v90:reportUploadTable(v117, not v92 and "update" or "replace");
                                            v75(v88, game.GameId);
                                            return ;
                                        else
                                            v96();
                                            warn(v89:getText("UploadTable", "PatchCloudTableFailed"));
                                            return ;
                                        end;
                                    else
                                        v96();
                                        warn(v89:getText("UploadTable", "PatchSupportedLangugesFailed"));
                                        return ;
                                    end;
                                else
                                    v93:dispatch(v7(false));
                                    v93:dispatch(v8(v89:getText("MessageFrame", "UploadCanceledMessage")));
                                    return ;
                                end;
                            end;
                        end;
                    end;
                else
                    v96();
                    for _, v121 in ipairs(v108) do
                        warn(v121);
                    end;
                    local l_v91_1 = v91;
                    local v123 = v89:getText("UploadTable", "InvalidTableDialogTitle");
                    local l_v18_1 = v18;
                    local v125 = v89:getText("UploadTable", "InvalidEntryDialogError");
                    l_v91_1(v123, l_v18_1, function(v126, v127)
                        return v3.createElement(v10, {
                            OkCallback = v126, 
                            CancelCallback = v127, 
                            Text = v125
                        });
                    end):await();
                    return ;
                end;
            end;
        else
            warn(v89:getText("MessageFrame", "BusyMessage"));
            return ;
        end;
    end;
end;
