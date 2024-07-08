local l_StudioService_0 = game:GetService("StudioService");
local l_Parent_0 = script.Parent;
local l_Parent_1 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_1.Packages.Roact);
local v4 = require(l_Parent_1.Packages.RoactRodux);
local v5 = require(l_Parent_1.Packages.Cryo);
local v6 = require(l_Parent_1.Packages.Framework);
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v6.UI;
local l_LinkText_0 = l_UI_0.LinkText;
local l_Pane_0 = l_UI_0.Pane;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_Separator_0 = l_UI_0.Separator;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local l_ToggleButton_0 = l_UI_0.ToggleButton;
local l_LayoutOrderIterator_0 = v6.Util.LayoutOrderIterator;
local v18 = require(l_Parent_1.Src.Components.SettingsPages.SettingsPage);
local v19 = require(l_Parent_1.Src.Actions.AddChange);
local v20 = require(l_Parent_0.Thunks.ReloadAutoTranslationTargetLanguages);
local l_calculateTextSize_0 = require(l_Parent_1.Src.Util.GameSettingsUtilities).calculateTextSize;
local l_getAutoTranslationAllowed_0 = require(l_Parent_1.Src.Util.GameSettingsUtilities).getAutoTranslationAllowed;
local l_getAutoTranslatedLanguages_0 = require(l_Parent_1.Src.Util.GameSettingsUtilities).getAutoTranslatedLanguages;
local l_OpenLocalizationSettings_0 = require(l_Parent_1.Src.Util.BrowserUtils).OpenLocalizationSettings;
local v25 = v3.PureComponent:extend(script.Name);
local l_Name_0 = script.Name;
local function v32(v27, v28)
    local v29 = {};
    for v30, _ in pairs(v27) do
        table.insert(v29, {
            Id = v30, 
            Label = v28[v30]
        });
    end;
    return v29;
end;
local function v46(v33, v34)
    local l_gameId_0 = v33:getState().Metadata.gameId;
    local l_localizationPageController_0 = v34.localizationPageController;
    return {
        function(v37)
            v37.SupportedLanguages = l_localizationPageController_0:getSupportedLanguages();
        end, 
        function(v38)
            v38.LanguageCodeToNames = l_localizationPageController_0:getLanguageCodeToNames(l_StudioService_0.StudioLocaleId);
        end, 
        function(v39)
            local v40 = l_localizationPageController_0:getSourceLanguage(l_gameId_0);
            v39.SourceLanguage = v40;
            v39.AutoTranslationTargetLanguages = l_getAutoTranslatedLanguages_0()[v40] or l_localizationPageController_0:getAutoTranslationTargetLanguages(v40);
        end, 
        function(v41)
            local v42, v43 = l_localizationPageController_0:getAutoLocalizationSettings(l_gameId_0);
            v41.AutoTextCaptureEnabled = v42;
            v41.UseTranslatedContentEnabled = v43;
        end, 
        function(v44)
            v44.IsAutomaticTranslationAllowed = l_localizationPageController_0:getAutoTranslationFeatureStatus(l_gameId_0);
        end, 
        function(v45)
            v45.AutoTranslationSettings = l_localizationPageController_0:getAutoTranslationSetings(l_gameId_0);
        end
    };
end;
local function v62(v47, v48)
    local v49 = v47:getState();
    local l_gameId_1 = v49.Metadata.gameId;
    local l_localizationPageController_1 = v48.localizationPageController;
    return {
        function()
            local l_SourceLanguage_0 = v49.Settings.Changed.SourceLanguage;
            if l_SourceLanguage_0 ~= nil then
                l_localizationPageController_1:setSourceLanguage(l_gameId_1, l_SourceLanguage_0);
            end;
        end, 
        function()
            local l_AutoTextCaptureEnabled_0 = v49.Settings.Changed.AutoTextCaptureEnabled;
            local l_UseTranslatedContentEnabled_0 = v49.Settings.Changed.UseTranslatedContentEnabled;
            if not (l_AutoTextCaptureEnabled_0 == nil) or l_UseTranslatedContentEnabled_0 ~= nil then
                local _ = nil;
                local _ = nil;
                l_localizationPageController_1:setAutoLocalizationSettings(l_gameId_1, if l_AutoTextCaptureEnabled_0 ~= nil then l_AutoTextCaptureEnabled_0 else v49.Settings.Current.AutoTextCaptureEnabled, if l_UseTranslatedContentEnabled_0 ~= nil then l_UseTranslatedContentEnabled_0 else v49.Settings.Current.UseTranslatedContentEnabled);
            end;
        end, 
        function()
            local l_AutoTranslationSettings_0 = v49.Settings.Changed.AutoTranslationSettings;
            if l_AutoTranslationSettings_0 ~= nil then
                local v58 = {};
                local l_AutoTranslationSettings_1 = v49.Settings.Current.AutoTranslationSettings;
                for v60, v61 in pairs(l_AutoTranslationSettings_0) do
                    if l_AutoTranslationSettings_1[v60] ~= v61 then
                        v58[v60] = v61;
                    end;
                end;
                l_localizationPageController_1:setAutoTranslationSetings(l_gameId_1, v58);
            end;
        end
    };
end;
local function v70(v63, _)
    local l_AutoTranslationTargetLanguages_0 = v63.AutoTranslationTargetLanguages;
    if l_AutoTranslationTargetLanguages_0 == nil then
        return ;
    else
        if not (not v63.IsAutomaticTranslationAllowed and not l_getAutoTranslationAllowed_0()) then
            local v66 = {};
            local v67 = l_LayoutOrderIterator_0.new();
            for v68, v69 in pairs(l_AutoTranslationTargetLanguages_0) do
                if v69 then
                    v66[v68] = v3.createElement(l_TitledFrame_0, {
                        LayoutOrder = v67:getNextOrder(), 
                        Title = v63.LanguageCodeToNames[v68]
                    }, {
                        ToggleButton = v3.createElement(l_ToggleButton_0, {
                            OnClick = v63.AutoTranslationSettingChanged(v63.AutoTranslationSettings, v68), 
                            Selected = v63.AutoTranslationSettings[v68] or false
                        })
                    });
                end;
            end;
            if next(v66) ~= nil then
                return v66;
            end;
        end;
        return ;
    end;
end;
local function v84(v71, v72, v73)
    local v74 = l_LayoutOrderIterator_0.new();
    local v75 = v32(v71.SupportedLanguages, v71.LanguageCodeToNames);
    local v76 = v71.IsAutomaticTranslationAllowed or l_getAutoTranslationAllowed_0();
    local v77 = v70(v71, v73);
    local v78 = v77 ~= nil;
    local v79 = v76 and not v78;
    local v80 = not l_getAutoTranslationAllowed_0();
    local l_GameId_0 = v71.GameId;
    local v82 = l_calculateTextSize_0(v72:getText("General", "LocalizationSettingsLinkText"), 14, "SourceSans");
    return {
        SourceLanguage = v3.createElement(l_TitledFrame_0, {
            LayoutOrder = v74:getNextOrder(), 
            Title = v72:getText("General", "SourceLanguageTitle")
        }, {
            Layout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, v73.uiListLayout.padding)
            }), 
            Selector = v3.createElement(l_SelectInput_0, {
                LayoutOrder = 1, 
                Items = v75, 
                Enabled = next(v75) ~= nil, 
                SelectedId = v71.SourceLanguage, 
                OnItemActivated = function(v83)
                    v71.SourceLanguageChanged(v83.Id);
                end
            }), 
            Description = v3.createElement("TextLabel", v5.Dictionary.join(v73.fontStyle.Subtext, {
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, v73.fontStyle.Subtitle.TextSize), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                Text = v72:getText("General", "SourceLanguageDesc")
            }))
        }), 
        Separator1 = v3.createElement(l_Separator_0, {
            LayoutOrder = v74:getNextOrder()
        }), 
        AutoTextCapture = v3.createElement(l_TitledFrame_0, {
            LayoutOrder = v74:getNextOrder(), 
            Title = v72:getText("General", "AutoTextCaptureTitle")
        }, {
            Layout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, v73.uiListLayout.padding)
            }), 
            ToggleButton = v3.createElement(l_ToggleButton_0, {
                Disabled = v71.AutoTextCaptureEnabled == nil, 
                LayoutOrder = 1, 
                OnClick = v71.AutoTextCaptureEnabledChanged, 
                Selected = v71.AutoTextCaptureEnabled
            }), 
            Description = v3.createElement("TextLabel", v5.Dictionary.join(v73.fontStyle.Subtext, {
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, v73.fontStyle.Subtitle.TextSize), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                Text = v72:getText("General", "AutoTextCaptureDesc")
            }))
        }), 
        Separator2 = v3.createElement(l_Separator_0, {
            LayoutOrder = v74:getNextOrder()
        }), 
        UseTranslatedContent = v3.createElement(l_TitledFrame_0, {
            LayoutOrder = v74:getNextOrder(), 
            Title = v72:getText("General", "UseTranslatedContentTitle")
        }, {
            Layout = v3.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, v73.uiListLayout.padding)
            }), 
            ToggleButton = v3.createElement(l_ToggleButton_0, {
                Disabled = v71.UseTranslatedContentEnabled == nil, 
                LayoutOrder = 1, 
                OnClick = v71.UseTranslatedContentEnabledChanged, 
                Selected = v71.UseTranslatedContentEnabled
            }), 
            Description = v3.createElement("TextLabel", v5.Dictionary.join(v73.fontStyle.Subtext, {
                LayoutOrder = 2, 
                BackgroundTransparency = 1, 
                BorderSizePixel = 0, 
                Size = UDim2.new(1, 0, 0, v73.fontStyle.Subtitle.TextSize), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top, 
                Text = v72:getText("General", "UseTranslatedContentDesc")
            }))
        }), 
        Separator3 = v3.createElement(l_Separator_0, {
            LayoutOrder = v74:getNextOrder()
        }), 
        AutoTranslationTitle = v76 and v3.createElement(l_TitledFrame_0, {
            LayoutOrder = v74:getNextOrder(), 
            Title = v72:getText("General", "AutoTranslationTitle")
        }), 
        AutoTranslationOptions = v78 and v3.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v74:getNextOrder(), 
            AutomaticSize = Enum.AutomaticSize.Y, 
            Spacing = UDim.new(0, 10)
        }, v77), 
        AutoTranlsationUnavailable = v79 and v3.createElement("TextLabel", v5.Dictionary.join(v73.fontStyle.Subtext, {
            LayoutOrder = v74:getNextOrder(), 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            Size = UDim2.new(1, 0, 0, v73.fontStyle.Subtitle.TextSize), 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            Text = v72:getText("General", "AutoTranslationOnlyAvailableForEnMessage")
        })), 
        Separator4 = v76 and v3.createElement(l_Separator_0, {
            LayoutOrder = v74:getNextOrder()
        }), 
        HyperLink = v80 and v3.createElement("Frame", {
            LayoutOrder = v74:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, 20), 
            BackgroundTransparency = 1
        }, {
            LinkTextLabel = v3.createElement(l_TextLabel_0, {
                Position = UDim2.new(0, v82.X, 0, 0), 
                Size = UDim2.new(1, -v82.X, 1, 0), 
                Style = "Body", 
                Text = v72:getText("General", "LocalizationSettingsNonLinkText"), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Top
            }), 
            LinkText = v3.createElement(l_LinkText_0, {
                OnClick = l_OpenLocalizationSettings_0(l_GameId_0), 
                Size = UDim2.new(0, v82.X, 0, v82.Y), 
                Style = "Body", 
                Text = v72:getText("General", "LocalizationSettingsLinkText")
            })
        })
    };
end;
v25.render = function(v85)
    local l_props_0 = v85.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return v3.createElement(v18, {
        SettingsLoadJobs = v46, 
        SettingsSaveJobs = v62, 
        Title = l_Localization_0:getText("General", "Category" .. l_Name_0), 
        PageId = script.Name, 
        CreateChildren = function()
            return (v84(l_props_0, l_Localization_0, l_Stylizer_0));
        end
    });
end;
local function v91(v89, v90)
    return {
        SupportedLanguages = v89("SupportedLanguages"), 
        LanguageCodeToNames = v89("LanguageCodeToNames"), 
        IsAutomaticTranslationAllowed = v89("IsAutomaticTranslationAllowed"), 
        AutoTranslationTargetLanguages = v89("AutoTranslationTargetLanguages"), 
        SourceLanguage = v89("SourceLanguage"), 
        AutoTextCaptureEnabled = v89("AutoTextCaptureEnabled"), 
        UseTranslatedContentEnabled = v89("UseTranslatedContentEnabled"), 
        AutoTranslationSettings = v89("AutoTranslationSettings"), 
        GameId = v90.Metadata.gameId
    };
end;
local function v98(v92, v93)
    return {
        SourceLanguageChanged = function(v94)
            v93(v19("SourceLanguage", v94));
            v93(v20(v94));
        end, 
        AutoTextCaptureEnabledChanged = v92("AutoTextCaptureEnabled"), 
        UseTranslatedContentEnabledChanged = v92("UseTranslatedContentEnabled"), 
        AutoTranslationSettingChanged = function(v95, v96)
            return function(v97)
                v93(v19("AutoTranslationSettings", (v5.Dictionary.join(v95, {
                    [v96] = v97
                }))));
            end;
        end
    };
end;
v25 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse, 
    Stylizer = l_ContextServices_0.Stylizer
})(v25);
local v99 = require(l_Parent_1.Src.Networking.settingFromState);
v25 = v4.connect(function(v100, _)
    if v100 then
        return (v91(function(v102)
            return v99(v100.Settings, v102);
        end, v100));
    else
        return ;
    end;
end, function(v103)
    return (v98(function(v104)
        return function(v105)
            v103(v19(v104, v105));
        end;
    end, v103));
end)(v25);
v25.LocalizationId = l_Name_0;
return v25;
