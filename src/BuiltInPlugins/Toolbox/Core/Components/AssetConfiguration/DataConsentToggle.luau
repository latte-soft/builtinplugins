local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Dash);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Packages_0.React);
local l_Util_0 = l_script_FirstAncestor_0.Core.Util;
local _ = require(l_Util_0.Constants);
local _ = require(l_Util_0.AssetConfigConstants);
local v8 = require(l_script_FirstAncestor_0.Libs.Http.Url);
local l_ContextServices_0 = v3.ContextServices;
local l_BrowserService_0 = game:GetService("BrowserService");
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TextWithLinks_0 = l_UI_0.TextWithLinks;
local l_ToggleButton_0 = l_UI_0.ToggleButton;
local l_LayoutOrderIterator_0 = v3.Util.LayoutOrderIterator;
local _ = v3.Util.StyleModifier;
local v18 = require(l_script_FirstAncestor_0.Core.Components.AssetConfiguration.ConfigSectionWrapper);
local v19 = game:DefineFastString("DataSharing_PreferencesUrlSuffix", "settings/data-collection?tab=avatar-items");
local v20 = game:DefineFastString("DataSharing_TermsUrlSuffix", "docs/ai-data-sharing");
return function(v21)
    local v22 = l_ContextServices_0.Stylizer:use();
    local v23 = l_ContextServices_0.Localization:use();
    local v24 = l_LayoutOrderIterator_0.new();
    local v25 = {
        Font = v22.Font, 
        Style = "Body", 
        TextSize = 16, 
        TextXAlignment = Enum.TextXAlignment.Left
    };
    return v4.createElement(v18, {
        AutomaticSize = Enum.AutomaticSize.XY, 
        LayoutOrder = v21.LayoutOrder, 
        Title = v23:getText("AssetConfig", "ShareDataHeader")
    }, {
        DescriptionPane = v4.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.Y, 
            LayoutOrder = v24:getNextOrder(), 
            Layout = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Spacing = v22.toggle.verticalListPadding
        }, {
            ToggleButton = v4.createElement(l_ToggleButton_0, {
                LayoutOrder = v24:getNextOrder(), 
                OnClick = v21.onDataConsentToggleClick, 
                Selected = v21.dataSharingToggled, 
                Size = UDim2.new(0, v22.toggle.buttonWidth, 0, v22.toggle.buttonHeight)
            }), 
            DescriptionTextPane = v4.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                Layout = Enum.FillDirection.Vertical, 
                LayoutOrder = v24:getNextOrder(), 
                Spacing = v22.toggle.verticalTextSpacing
            }, {
                DescriptionText = v4.createElement(l_TextLabel_0, v2.join({
                    Text = v23:getText("AssetConfig", "ShareDataDescriptionText"), 
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    LayoutOrder = v24:getNextOrder(), 
                    MaxWidth = v22.MaxWidth, 
                    TextWrapped = true
                }, v25)), 
                LinkText = v4.createElement(l_TextWithLinks_0, {
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    LayoutOrder = v24:getNextOrder(), 
                    LinkMap = {
                        ["[link1]"] = {
                            LinkText = v23:getText("AssetConfig", "ShareDataDescriptionLinkPreferences"), 
                            LinkCallback = function()
                                l_BrowserService_0:OpenBrowserWindow(v8.CREATE_URL .. v19);
                            end
                        }, 
                        ["[link2]"] = {
                            LinkText = v23:getText("AssetConfig", "ShareDataDescriptionLinkLearnMore"), 
                            LinkCallback = function()
                                l_BrowserService_0:OpenBrowserWindow(v8.CREATE_URL .. v20);
                            end
                        }
                    }, 
                    Text = v23:getText("AssetConfig", "ShareDataDescriptionLinks"), 
                    TextProps = v25, 
                    TextWrapped = true
                })
            })
        })
    });
end;
