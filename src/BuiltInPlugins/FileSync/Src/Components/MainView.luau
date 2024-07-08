local l_script_FirstAncestor_0 = script:FindFirstAncestor("FileSync");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_UI_0 = v3.UI;
local l_Separator_0 = l_UI_0.Separator;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local l_StyledDialog_0 = l_UI_0.StyledDialog;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v11 = require(l_script_FirstAncestor_0.Src.Actions.SetSyncPath);
local v12 = require(l_script_FirstAncestor_0.Src.Actions.SetLastOperation);
local v13 = require(l_script_FirstAncestor_0.Src.Actions.SetLastOperationTime);
local v14 = require(l_script_FirstAncestor_0.Src.Components.ImportExportFrame);
local v15 = require(l_script_FirstAncestor_0.Src.Components.SyncStatus);
local v16 = require(l_script_FirstAncestor_0.Src.Components.PlaceDetails);
local v17 = require(l_script_FirstAncestor_0.Src.Components.DirectoryInput);
local v18 = require(l_script_FirstAncestor_0.Src.Components.Settings);
local v19 = require(l_script_FirstAncestor_0.Src.Util.ShowDialog);
local l_TextService_0 = game:GetService("TextService");
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local v22 = v1.Component:extend("MainView");
local function v25(v23)
    local v24 = v23:getLocale();
    return DateTime.now():FormatLocalTime("LL", v24) .. v23:getText("DateTime", "At") .. DateTime.now():FormatLocalTime("LTS", v24);
end;
local function _(v26)
    local v27 = v26:find("%.[^.]*$");
    if not v27 then
        return v26;
    else
        return v26:sub(1, v27 - 1) .. v26:sub(v27 + 1);
    end;
end;
local function _()
    if not (game.GameId ~= 0) then
        local l_LocalFilePath_0 = game:GetService("StudioPublishService"):GetLocalFilePath();
        local v30 = l_LocalFilePath_0:find("%.[^.]*$");
        if not v30 then
            return l_LocalFilePath_0;
        else
            return l_LocalFilePath_0:sub(1, v30 - 1) .. l_LocalFilePath_0:sub(v30 + 1);
        end;
    else
        return (tostring(game.PlaceId));
    end;
end;
local function _()
    local v32 = false;
    if game.GameId == 0 then
        v32 = game:GetService("StudioPublishService"):GetLocalFilePath() == "";
    end;
    return v32;
end;
v22.init = function(v34)
    local v35 = false;
    if game.GameId == 0 then
        v35 = game:GetService("StudioPublishService"):GetLocalFilePath() == "";
    end;
    if not v35 then
        v35 = v34.props.Plugin:get();
        local v36 = v35:GetSetting("FileSyncLastOperation") or {};
        local v37 = v35:GetSetting("FileSyncPreviewKey") or {};
        local v38;
        if not (game.GameId ~= 0) then
            local l_LocalFilePath_1 = game:GetService("StudioPublishService"):GetLocalFilePath();
            local v40 = l_LocalFilePath_1:find("%.[^.]*$");
            v38 = if not v40 then l_LocalFilePath_1 else l_LocalFilePath_1:sub(1, v40 - 1) .. l_LocalFilePath_1:sub(v40 + 1);
        else
            v38 = tostring(game.PlaceId);
        end;
        local v41 = v37[v38];
        local v42;
        if not (game.GameId ~= 0) then
            local l_LocalFilePath_2 = game:GetService("StudioPublishService"):GetLocalFilePath();
            local v44 = l_LocalFilePath_2:find("%.[^.]*$");
            v42 = if not v44 then l_LocalFilePath_2 else l_LocalFilePath_2:sub(1, v44 - 1) .. l_LocalFilePath_2:sub(v44 + 1);
        else
            v42 = tostring(game.PlaceId);
        end;
        v38 = v36[v42] or {};
        v42 = v38.LastOpString;
        local l_LastOpTime_0 = v38.LastOpTime;
        v34.props.SetLastOperation(v42);
        v34.props.SetLastOperationTime(l_LastOpTime_0);
        v34.props.SetSyncPath(v41);
    end;
    v34.scrollingFrameRef = v1.createRef();
    v34:setState({
        autoImportOnPlayEnabled = false, 
        changesInStudio = false, 
        changesInDisk = true
    });
    v34.onToggleAutoImport = function()
        v34:setState(function(v46)
            return {
                autoImportOnPlayEnabled = not v46.autoImportOnPlayEnabled
            };
        end);
    end;
end;
v22.syncFiles = function(v47, v48)
    local v49 = v47.props.Plugin:get();
    local v50 = v49:GetSetting("FileSyncLastOperation") or {};
    local l_syncPath_0 = v47.props.syncPath;
    local l_Stylizer_0 = v47.props.Stylizer;
    local l_Localization_0 = v47.props.Localization;
    local v54 = nil;
    local v55 = nil;
    if l_syncPath_0 then
        local l_status_0, l_result_0 = pcall(function()
            if not v48 then
                return game:GetService("ProjectFolderService"):ImportScripts(l_syncPath_0);
            else
                return game:GetService("ProjectFolderService"):ExportScripts(l_syncPath_0);
            end;
        end);
        if l_status_0 then
            v54 = if not v48 then l_Localization_0:getText("Successes", "ImportSuccess") else l_Localization_0:getText("Successes", "ExportSuccess");
            local v58 = false;
            if game.GameId == 0 then
                v58 = game:GetService("StudioPublishService"):GetLocalFilePath() == "";
            end;
            if not v58 then
                v58 = {
                    LastOpString = v54, 
                    LastOpTime = v25(l_Localization_0)
                };
                local v59;
                if not (game.GameId ~= 0) then
                    local l_LocalFilePath_3 = game:GetService("StudioPublishService"):GetLocalFilePath();
                    local v61 = l_LocalFilePath_3:find("%.[^.]*$");
                    v59 = if not v61 then l_LocalFilePath_3 else l_LocalFilePath_3:sub(1, v61 - 1) .. l_LocalFilePath_3:sub(v61 + 1);
                else
                    v59 = tostring(game.PlaceId);
                end;
                v50[v59] = v58;
                v49:SetSetting("FileSyncLastOperation", v50);
            end;
            v47.props.SetLastOperation(v54);
            v47.props.SetLastOperationTime((v25(l_Localization_0)));
        else
            v55 = if not not l_result_0 and l_result_0 ~= "" then l_result_0 else if v48 then l_Localization_0:getText("Errors", "ExportFailure") else l_Localization_0:getText("Errors", "ImportFailure");
        end;
    else
        v55 = l_Localization_0:getText("Errors", "NoDirectory");
    end;
    if v55 then
        local v62 = {
            {
                Key = "OK", 
                Text = l_Localization_0:getText("Buttons", "Ok")
            }
        };
        local l_l_TextService_0_TextSize_0 = l_TextService_0:GetTextSize(v55, 18, Enum.Font.SourceSans, Vector2.new(335, math.huge));
        local v64 = l_l_TextService_0_TextSize_0.Y > 65;
        local v65 = v1.createElement(l_TextLabel_0, {
            BackgroundTransparency = 1, 
            TextWrapped = true, 
            Text = v55, 
            Style = "Basic", 
            TextSelectable = true, 
            TextFont = Enum.Font.SourceSans, 
            TextYAlignment = Enum.TextYAlignment.Center, 
            Size = if not v64 then nil else UDim2.new(1, 0, 0, l_l_TextService_0_TextSize_0.Y)
        });
        v19(v47.props.Plugin, v47.props.Localization, l_StyledDialog_0, {
            Style = "Alert", 
            OnButtonPressed = function()
            end, 
            OnClose = function()
            end, 
            Title = l_Localization_0:getText("Errors", "FileSyncError"), 
            Modal = true, 
            MinContentSize = l_Stylizer_0.ErrorDialogSize, 
            Buttons = v62
        }, {
            Contents = if not v64 then v65 else if not v64 then nil else v1.createElement(l_ScrollingFrame_0, {
                ref = v47.scrollingFrameRef, 
                ScrollingEnabled = true, 
                BackgroundTransparency = 1
            }, {
                v65
            })
        });
    end;
end;
v22.didMount = function(v66)
    local l_PluginActions_0 = v66.props.PluginActions;
    local v68 = l_PluginActions_0:get("Export");
    local v69 = l_PluginActions_0:get("Import");
    if v68 then
        v68.Enabled = true;
        v66.exportHandle = v68.Triggered:Connect(function()
            v66:syncFiles(true);
        end);
    end;
    if v69 then
        v69.Enabled = true;
        v66.importHandle = v69.Triggered:Connect(function()
            v66:syncFiles(false);
        end);
    end;
end;
v22.willUnmount = function(v70)
    local l_PluginActions_1 = v70.props.PluginActions;
    local v72 = l_PluginActions_1:get("Export");
    local v73 = l_PluginActions_1:get("Import");
    if v72 then
        v72.Enabled = false;
    end;
    if v73 then
        v73.Enabled = false;
    end;
    if v70.exportHandle then
        v70.exportHandle:Disconnect();
    end;
    if v70.importHandle then
        v70.importHandle:Disconnect();
    end;
end;
v22.render = function(v74)
    local v75 = v74.props.Plugin:get();
    local l_Stylizer_1 = v74.props.Stylizer;
    local v77 = v75:GetSetting("FileSyncPreviewKey") or {};
    local l_syncPath_1 = v74.props.syncPath;
    local l_lastOperation_0 = v74.props.lastOperation;
    local l_lastOperationTime_0 = v74.props.lastOperationTime;
    local l_Localization_1 = v74.props.Localization;
    local v82 = l_LayoutOrderIterator_0.new();
    local v83 = l_LayoutOrderIterator_0.new();
    local l_StudioPublishService_0 = game:GetService("StudioPublishService");
    local l_ShowFileSyncStatus_0 = game:GetFastFlag("ShowFileSyncStatus");
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 1, 0), 
        BackgroundColor3 = l_Stylizer_1.BackgroundColor, 
        BackgroundTransparency = 1
    }, {
        Layout = v1.createElement("UIListLayout", {
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            Padding = UDim.new(0, 8)
        }), 
        ButtonsUIPadding = v1.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, 8), 
            PaddingTop = UDim.new(0, 8)
        }), 
        LatestStatusFrame = if not l_lastOperation_0 then nil else v1.createElement(v15, {
            LayoutOrder = v82:getNextOrder(), 
            LastOpTime = l_lastOperationTime_0, 
            StatusText = if l_lastOperation_0 == l_Localization_1:getText("Successes", "ExportSuccess") then l_Localization_1:getText("Labels", "LastExport") else l_Localization_1:getText("Labels", "LastImport"), 
            ChangesInDisk = l_ShowFileSyncStatus_0 and v74.state.changesInDisk, 
            ChangesInStudio = l_ShowFileSyncStatus_0 and v74.state.changesInStudio
        }), 
        Separator1 = v1.createElement(l_Separator_0, {
            LayoutOrder = v82:getNextOrder()
        }), 
        ButtonsFrame = v1.createElement(v14, {
            Size = UDim2.new(1, 0, 0, 140), 
            OnImport = function()
                v74:syncFiles(false);
            end, 
            OnExport = function()
                v74:syncFiles(true);
            end, 
            LayoutOrder = v82:getNextOrder(), 
            ChangesInDisk = v74.state.changesInDisk, 
            ChangesInStudio = v74.state.changesInStudio
        }), 
        ConnectionsFrame = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            Size = UDim2.new(1, 0, 0, 170), 
            LayoutOrder = v82:getNextOrder()
        }, {
            ListLayout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical, 
                Padding = UDim.new(0, 4), 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            ConnectionsLeftPadding = v1.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, 8)
            }), 
            ConnectionsLabel = v1.createElement(l_TextLabel_0, {
                Text = l_Localization_1:getText("Labels", "Connections"), 
                Style = "Bold", 
                Size = UDim2.new(1, 0, 0, 20), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                BackgroundTransparency = 1, 
                LayoutOrder = v83:getNextOrder()
            }), 
            Separator2 = v1.createElement(l_Separator_0, {
                LayoutOrder = v83:getNextOrder()
            }), 
            Spacer0 = v1.createElement("Frame", {
                LayoutOrder = v83:getNextOrder(), 
                Size = UDim2.new(1, 0, 0, 8), 
                BackgroundTransparency = 1
            }), 
            LocalDirectoryFrame = v1.createElement(v17, {
                LayoutOrder = v83:getNextOrder(), 
                SyncPath = l_syncPath_1, 
                Size = UDim2.new(1, 0, 0, 50), 
                Callback = function()
                    local l_status_1, l_result_1 = pcall(function()
                        return game:GetService("ProjectFolderService"):SelectFolder();
                    end);
                    if l_status_1 then
                        local v88 = false;
                        if game.GameId == 0 then
                            v88 = game:GetService("StudioPublishService"):GetLocalFilePath() == "";
                        end;
                        if not v88 then
                            v88 = v77;
                            local v89;
                            if not (game.GameId ~= 0) then
                                local l_LocalFilePath_4 = game:GetService("StudioPublishService"):GetLocalFilePath();
                                local v91 = l_LocalFilePath_4:find("%.[^.]*$");
                                v89 = if not v91 then l_LocalFilePath_4 else l_LocalFilePath_4:sub(1, v91 - 1) .. l_LocalFilePath_4:sub(v91 + 1);
                            else
                                v89 = tostring(game.PlaceId);
                            end;
                            v88[v89] = l_result_1;
                            v75:SetSetting("FileSyncPreviewKey", v77);
                        end;
                        v74.props.SetSyncPath(l_result_1);
                    end;
                end
            }), 
            Spacer = v1.createElement("Frame", {
                LayoutOrder = v83:getNextOrder(), 
                Size = UDim2.new(1, 0, 0, 8), 
                BackgroundTransparency = 1
            }), 
            PlaceFrame = v1.createElement(v16, {
                LayoutOrder = v83:getNextOrder(), 
                Size = UDim2.new(1, 0, 0, 50), 
                PlaceName = l_StudioPublishService_0:GetPlaceDisplayName()
            })
        }), 
        SettingsFrame = v1.createElement(v18, {
            Size = UDim2.new(1, 0, 0, 50), 
            LayoutOrder = v82:getNextOrder(), 
            IsChecked = v74.state.autoImportOnPlayEnabled, 
            OnClick = v74.onToggleAutoImport
        })
    });
end;
return v2.connect(function(v92, _)
    return {
        redrawSignal = v92.redrawSignal, 
        syncPath = v92.syncPath, 
        lastOperation = v92.lastOperation, 
        lastOperationTime = v92.lastOperationTime
    };
end, function(v94)
    return {
        SetSyncPath = function(v95)
            v94(v11(v95));
        end, 
        SetLastOperation = function(v96)
            v94(v12(v96));
        end, 
        SetLastOperationTime = function(v97)
            v94(v13(v97));
        end
    };
end)((l_withContext_0({
    Plugin = l_ContextServices_0.Plugin, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    PluginActions = l_ContextServices_0.PluginActions
})(v22)));
