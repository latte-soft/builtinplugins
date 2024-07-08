local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_Parent_0 = script.Parent.Parent.Parent;
local l_Http_0 = require(l_Parent_0.Packages.Framework).Http;
local v3 = require(l_Parent_0.Src.Actions.SetIsBusy);
local v4 = require(l_Parent_0.Src.Actions.SetMessage);
local v5 = require(l_Parent_0.Src.Util.isEmpty);
local function _(v6, v7)
    return function()
        v6:dispatch(v3(false));
        v6:dispatch(v4(v7:getText("MessageFrame", "DownloadFailedMessage")));
    end;
end;
local function v16(v9, v10)
    if type(v9) ~= "table" then
        return false;
    else
        for _, v12 in ipairs(v9) do
            if v12.identifier == nil then
                return false;
            else
                local v13 = {
                    Values = {}, 
                    Key = v12.identifier.key or "", 
                    Source = v12.identifier.source or "", 
                    Context = v12.identifier.context or "", 
                    Example = not not v12.metadata and v12.metadata.example or ""
                };
                if not v5(v12.translations) then
                    for _, v15 in ipairs(v12.translations) do
                        if type(v15.locale) ~= "string" then
                            return false;
                        else
                            v13.Values[v15.locale] = v15.translationText or "";
                        end;
                    end;
                end;
                table.insert(v10, v13);
            end;
        end;
        return true;
    end;
end;
local function v26(v17, v18, v19)
    local v20 = {};
    local v21 = "";
    while v21 do
        v17.LocalizationTables.V1.LocalizationTable.Tables.entries(v19, v21, game.GameId):makeRequest():andThen(function(v22)
            if v22 and v22.responseCode == l_Http_0.StatusCodes.OK then
                if v16(v22.responseBody.data, v20) then
                    v21 = v22.responseBody.nextPageCursor;
                    return ;
                else
                    warn(v18:getText("DownloadTable", "GetCloudTableFailed"));
                    return ;
                end;
            else
                warn(v18:getText("DownloadTable", "GetCloudTableFailed"));
                return ;
            end;
        end, function()
            warn(v18:getText("DownloadTable", "GetCloudTableFailed"));
        end):await();
    end;
    local l_LocalizationTable_0 = Instance.new("LocalizationTable");
    local l_status_0, l_result_0 = pcall(function()
        l_LocalizationTable_0:SetEntries(v20);
    end);
    if l_status_0 then
        return l_LocalizationTable_0;
    else
        warn(v18:getText("DownloadTable", "SetEntriesFailedWithErrorMessage") .. " " .. l_result_0);
        return ;
    end;
end;
return {
    Download = v26, 
    DownloadAndSave = function(v27, v28, v29, v30)
        return function(v31)
            local l_v28_0 = v28;
            local l_l_v28_0_0 = l_v28_0 --[[ copy: 2 -> 7 ]];
            local function v34()
                v31:dispatch(v3(false));
                v31:dispatch(v4(l_l_v28_0_0:getText("MessageFrame", "DownloadFailedMessage")));
            end;
            l_v28_0 = v31:getState();
            if not l_v28_0.CloudTable.IsBusy then
                v31:dispatch(v3(true));
                v31:dispatch(v4(v28:getText("MessageFrame", "DownloadingTableMessage")));
                local v35 = v26(v27, v28, v30);
                if v35 == nil then
                    v34();
                    return ;
                else
                    v31:dispatch(v4(v28:getText("MessageFrame", "SelectCSVFileMessage")));
                    local l_status_1, l_result_1 = pcall(function()
                        l_LocalizationService_0:PromptDownloadGameTableToCSV(v35);
                    end);
                    if l_status_1 then
                        v31:dispatch(v3(false));
                        v31:dispatch(v4(v28:getText("MessageFrame", "TableWrittenToFileMessage")));
                        v29:reportDownloadTable(v35, "download", l_v28_0.PluginMetadata.AllLanguages, l_v28_0.PluginMetadata.LocalesToLanguages);
                        return ;
                    else
                        v34();
                        warn(l_result_1);
                        return ;
                    end;
                end;
            else
                warn(v28:getText("MessageFrame", "BusyMessage"));
                return ;
            end;
        end;
    end
};
