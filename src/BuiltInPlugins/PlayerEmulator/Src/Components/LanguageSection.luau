local l_EnablePseudolocalizationInPlayerEmulator_0 = game:GetFastFlag("EnablePseudolocalizationInPlayerEmulator");
local l_LocalizationService_0 = game:GetService("LocalizationService");
local l_PlayerEmulatorService_0 = game:GetService("PlayerEmulatorService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v4 = require(l_Parent_0.Packages.Roact);
local v5 = require(l_Parent_0.Packages.RoactRodux);
local v6 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v9 = require(l_Parent_0.Src.ContextServices.NetworkingContext);
local v10 = require(l_Parent_0.Src.Util.Constants);
local l_getStudioLocaleId_0 = require(l_Parent_0.Src.Util.PlayerEmulatorUtilities).getStudioLocaleId;
local l_UI_0 = v6.UI;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_DEPRECATED_TextInput_0 = l_UI_0.DEPRECATED_TextInput;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_map_0 = v6.Dash.map;
local l_StyleModifier_0 = v6.Util.StyleModifier;
local v18 = require(l_Parent_0.Src.Networking.Requests.GetLanguages);
local function _()
    return l_PlayerEmulatorService_0.EmulatedGameLocale;
end;
local function _(v20)
    l_PlayerEmulatorService_0.EmulatedGameLocale = v20;
end;
local function _()
    if not l_EnablePseudolocalizationInPlayerEmulator_0 then
        return l_PlayerEmulatorService_0.PlayerEmulationEnabled_deprecated;
    else
        return l_PlayerEmulatorService_0.PlayerEmulationEnabled;
    end;
end;
l_LocalizationService_0.RobloxForcePlayModeRobloxLocaleId = l_getStudioLocaleId_0();
local v23 = v4.PureComponent:extend("LanguageSection");
v23.getCurrentLanguageName = function(v24)
    local v25 = string.gsub(v24.state.localeId, "-", "_");
    local l_languagesTable_0 = v24.props.languagesTable;
    if not (v25 ~= "") or not l_languagesTable_0[v25] then
        return ;
    else
        return l_languagesTable_0[v25].displayText;
    end;
end;
v23.getTestLangInstructionText = function(v27)
    local l_Localization_0 = v27.props.Localization;
    local v29 = string.gsub(v27.state.localeId, "-", "_");
    local l_languagesTable_1 = v27.props.languagesTable;
    if not (v29 ~= "") or not l_languagesTable_1[v29] then
        return "";
    else
        return string.format(l_Localization_0:getText("LanguageSection", "InstructionText"), l_languagesTable_1[v29].displayText, l_languagesTable_1[v29].languageCode);
    end;
end;
v23.initLocaleId = function(v31)
    local l_Setting_0 = v31.props.Plugin:get():GetSetting(v10.LOCALEID_SETTING_KEY);
    if l_Setting_0 then
        l_PlayerEmulatorService_0.EmulatedGameLocale = l_Setting_0;
    end;
end;
v23.onPlayerEmulationEnabledChanged = function(v33)
    local l_localeId_0 = v33.state.localeId;
    if not if not l_EnablePseudolocalizationInPlayerEmulator_0 then l_PlayerEmulatorService_0.PlayerEmulationEnabled_deprecated else l_PlayerEmulatorService_0.PlayerEmulationEnabled then
        l_PlayerEmulatorService_0.EmulatedGameLocale = l_getStudioLocaleId_0();
        return ;
    else
        l_PlayerEmulatorService_0.EmulatedGameLocale = l_localeId_0;
        return ;
    end;
end;
v23.onRobloxForcePlayModeRobloxLocaleIdChanged = function(v35)
    local l_EmulatedGameLocale_0 = l_PlayerEmulatorService_0.EmulatedGameLocale;
    v35:setState({
        localeId = l_EmulatedGameLocale_0
    });
    v35.props.Plugin:get():SetSetting(v10.LOCALEID_SETTING_KEY, l_EmulatedGameLocale_0);
end;
v23.init = function(v37)
    v37.state = {
        localeId = l_PlayerEmulatorService_0.EmulatedGameLocale
    };
    v37.textBoxRef = v4.createRef();
    v37.signalTokens = {};
    v37.onItemClicked = function(v38)
        if v38.localeId then
            l_PlayerEmulatorService_0.EmulatedGameLocale = v38.localeId;
            return ;
        else
            l_PlayerEmulatorService_0.EmulatedGameLocale = "";
            v37.textBoxRef.current:CaptureFocus();
            return ;
        end;
    end;
    v37.createLanguageListForSelectInput = function(v39)
        local v40 = {};
        if v39.displayText ~= nil then
            v40.Id = v39.displayText;
            v40.Label = v39.displayText;
            v40.localeId = v39.localeId;
            return v40;
        else
            if v39.displayTextStringKey ~= nil then
                v40.Id = v37.props.Localization:getText(v39.displayTextSectionKey, v39.displayTextStringKey);
                v40.Label = v37.props.Localization:getText(v39.displayTextSectionKey, v39.displayTextStringKey);
            end;
            return v40;
        end;
    end;
end;
v23.didMount = function(v41)
    v41.props.loadLanguages((v41.props.Networking:get()));
    table.insert(v41.signalTokens, (l_PlayerEmulatorService_0:GetPropertyChangedSignal("EmulatedGameLocale"):Connect(function()
        v41:onRobloxForcePlayModeRobloxLocaleIdChanged();
    end)));
    v41:initLocaleId();
end;
v23.willUnmount = function(v42)
    for _, v44 in pairs(v42.signalTokens) do
        v44:Disconnect();
    end;
    v42.signalTokens = nil;
end;
v23.render = function(v45)
    local l_state_0 = v45.state;
    local l_props_0 = v45.props;
    local l_mainSwitchEnabled_0 = l_props_0.mainSwitchEnabled;
    local l_localeId_1 = l_state_0.localeId;
    local l_languagesList_0 = l_props_0.languagesList;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_1 = l_props_0.Localization;
    return v4.createElement("Frame", {
        Size = l_Stylizer_0.LANGUAGE_SECTION_SIZE, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_props_0.LayoutOrder
    }, {
        Layout = v4.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Vertical
        }), 
        SelectorModule = v4.createElement("Frame", {
            Size = l_Stylizer_0.SELECTOR_SIZE, 
            BackgroundTransparency = 1, 
            LayoutOrder = 1
        }, {
            Layout = v4.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal, 
                Padding = l_Stylizer_0.HORIZONTAL_LISTLAYOUT_PADDING
            }), 
            Label = v4.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 1, 
                StyleModifier = if not l_mainSwitchEnabled_0 then l_StyleModifier_0.Disabled else nil, 
                Text = l_Localization_1:getText("LanguageSection", "LabelText")
            }), 
            LanguageDropdown = v4.createElement(l_SelectInput_0, {
                Items = l_map_0(l_languagesList_0, v45.createLanguageListForSelectInput), 
                LayoutOrder = 2, 
                OnItemActivated = v45.onItemClicked, 
                SelectedId = v45:getCurrentLanguageName() or l_Localization_1:getText("LanguageSection", "CustomLanguageDisplayText"), 
                Enabled = l_mainSwitchEnabled_0
            }), 
            LocaleIdTextBox = v4.createElement("Frame", {
                Size = l_Stylizer_0.LOCALEID_TEXTBOX_SIZE, 
                BorderColor3 = l_Stylizer_0.BorderColor, 
                BorderSizePixel = 0, 
                BackgroundColor3 = l_Stylizer_0.BackgroundColor, 
                LayoutOrder = 3
            }, {
                Padding = v4.createElement("UIPadding", {
                    PaddingLeft = l_Stylizer_0.TEXT_INDENT_PADDING
                }), 
                TextBox = v4.createElement(l_DEPRECATED_TextInput_0, {
                    OnFocusLost = function()
                        if v45.textBoxRef.current then
                            l_PlayerEmulatorService_0.EmulatedGameLocale = v45.textBoxRef.current.Text;
                        end;
                    end, 
                    Disabled = not l_mainSwitchEnabled_0, 
                    Text = l_localeId_1, 
                    [v4.Ref] = v45.textBoxRef
                })
            })
        }), 
        TextModule = v4.createElement("Frame", {
            AutomaticSize = if not l_EnablePseudolocalizationInPlayerEmulator_0 then nil else Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            BorderSizePixel = 0, 
            LayoutOrder = 2
        }, {
            Padding = v4.createElement("UIPadding", {
                PaddingLeft = l_Stylizer_0.TEXT_INDENT_PADDING, 
                PaddingBottom = if not l_EnablePseudolocalizationInPlayerEmulator_0 then nil else l_Stylizer_0.HORIZONTAL_LISTLAYOUT_PADDING
            }), 
            TextLabel = v4.createElement(l_TextLabel_0, {
                Size = l_Stylizer_0.LANGUAGE_INSTRUCTION_SIZE, 
                StyleModifier = if not l_mainSwitchEnabled_0 then l_StyleModifier_0.Disabled else nil, 
                TextSize = if not l_EnablePseudolocalizationInPlayerEmulator_0 then nil else l_Stylizer_0.LANGUAGE_INSTRUCTION_TEXT_SIZE, 
                Text = v45:getTestLangInstructionText(), 
                TextXAlignment = Enum.TextXAlignment.Left
            })
        })
    });
end;
return v5.connect(function(v53, _)
    return {
        mainSwitchEnabled = v53.MainSwitch.mainSwitchEnabled, 
        languagesTable = v53.Languages.languagesTable, 
        languagesList = v53.Languages.languagesList
    };
end, function(v55)
    return {
        loadLanguages = function(v56)
            v55(v18(v56));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization, 
    Networking = v9, 
    Plugin = l_ContextServices_0.Plugin
})(v23)));
