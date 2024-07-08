require(script.Parent.defineLuaFlags);
local l_Parent_0 = script.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Dev.TestLoader);
v1.launch("Toolbox", l_Parent_0.Core);
if not v1.isCli() then
    local l_AICOChatBot_0 = game:GetFastFlag("AICOChatBot");
    local v3 = require(l_Parent_0.PluginLoader.PluginLoaderBuilder);
    local v4 = require(l_Parent_0.Core.Util.Constants);
    local v5 = require(l_Parent_0.Core.Util.Images);
    local v6 = require(l_Parent_0.SharedPluginConstants);
    local l_StudioService_0 = game:GetService("StudioService");
    local l_StudioAssetService_0 = game:GetService("StudioAssetService");
    local l_MemStorageService_0 = game:GetService("MemStorageService");
    local v12 = {
        ["StudioAssetService.OnSaveToRoblox"] = (game:GetFastFlag("UnifyModelPackagePublish3") or game:GetFastFlag("ShowSaveToRobloxOnStudioAssetService")) and function()
            return l_StudioAssetService_0.OnSaveToRoblox;
        end or nil, 
        ["StudioService.OnSaveToRoblox"] = function()
            return l_StudioService_0.OnSaveToRoblox;
        end, 
        ["StudioService.OnImportFromRoblox"] = function()
            return l_StudioService_0.OnImportFromRoblox;
        end, 
        ["StudioService.OnOpenManagePackagePlugin"] = function()
            return l_StudioService_0.OnOpenManagePackagePlugin;
        end, 
        ["StudioService.OnPublishAsPlugin"] = function()
            return l_StudioService_0.OnPublishAsPlugin;
        end, 
        ["MemStorageService." .. "OpenAssetConfiguration"] = function()
            local l_BindableEvent_0 = Instance.new("BindableEvent");
            l_MemStorageService_0:Bind("OpenAssetConfiguration", function(...)
                l_BindableEvent_0:Fire(...);
            end);
            return l_BindableEvent_0.Event;
        end, 
        ["MemStorageService." .. v6.SHOW_TOOLBOX_PLUGINS_EVENT] = function()
            local l_BindableEvent_1 = Instance.new("BindableEvent");
            l_MemStorageService_0:Bind(v6.SHOW_TOOLBOX_PLUGINS_EVENT, function(...)
                l_BindableEvent_1:Fire(...);
            end);
            return l_BindableEvent_1.Event;
        end
    };
    if l_AICOChatBot_0 then
        v12["MemStorageService." .. v6.SHOW_TOOLBOX_OPEN_MODELS_AND_SEARCH_EVENT] = function()
            local l_BindableEvent_2 = Instance.new("BindableEvent");
            l_MemStorageService_0:Bind(v6.SHOW_TOOLBOX_OPEN_MODELS_AND_SEARCH_EVENT, function(...)
                l_BindableEvent_2:Fire(...);
            end);
            return l_BindableEvent_2.Event;
        end;
    end;
    v12["MemStorageService." .. v4.OPEN_MARKETPLACE_VIEW_FOR_ASSET_TYPE] = function(_)
        local l_BindableEvent_3 = Instance.new("BindableEvent");
        l_MemStorageService_0:Bind(v4.OPEN_MARKETPLACE_VIEW_FOR_ASSET_TYPE, function(...)
            l_BindableEvent_3:Fire(...);
        end);
        return l_BindableEvent_3.Event;
    end;
    local v20 = v3.build({
        plugin = plugin, 
        pluginName = "Toolbox", 
        translationResourceTable = l_Parent_0.LocalizationSource.LocalizedStrings, 
        fallbackResourceTable = l_Parent_0.LocalizationSource.SourceStrings, 
        overrideLocaleId = nil, 
        localizationNamespace = nil, 
        getToolbarName = function()
            return "luaToolboxToolbar";
        end, 
        buttonInfo = {
            getName = function()
                return "luaToolboxButton";
            end, 
            getDescription = function()
                return "Insert items from the toolbox";
            end, 
            icon = v5.TOOLBOX_ICON, 
            text = nil, 
            clickableWhenViewportHidden = true
        }, 
        dockWidgetInfo = {
            id = "Toolbox", 
            dockWidgetPluginGuiInfo = DockWidgetPluginGuiInfo.new(Enum.InitialDockState.Left, true, false, 0, 0, v4.TOOLBOX_MIN_WIDTH, v4.TOOLBOX_MIN_HEIGHT), 
            getDockTitle = function(v16, v17, v18)
                return v16(v17, v18, "General", "ToolboxToolbarName");
            end, 
            name = "Toolbox", 
            zIndexBehavior = Enum.ZIndexBehavior.Sibling
        }, 
        extraTriggers = v12, 
        shouldImmediatelyOpen = function()
            local l_l_StudioService_0_StartupAssetId_0 = l_StudioService_0:GetStartupAssetId();
            if l_l_StudioService_0_StartupAssetId_0 and #l_l_StudioService_0_StartupAssetId_0 > 0 then
                return true;
            else
                return false;
            end;
        end
    });
    if v20.pluginLoader:waitForUserInteraction() then
        require(script.Parent.main)(plugin, v20);
        return ;
    else
        return ;
    end;
else
    return ;
end;
