local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_BrowserService_0 = game:GetService("BrowserService");
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = require(l_Parent_0.Src.ContextItems);
local l_ToolParts_0 = script.Parent.ToolParts;
local v9 = require(l_ToolParts_0.Panel);
local v10 = require(l_ToolParts_0.ButtonGroup);
local v11 = require(l_Parent_0.Src.Util.SmoothVoxelsController);
local l_TextWithInlineLink_0 = v2.UI.TextWithInlineLink;
local l_Pane_0 = v2.UI.Pane;
local l_ScrollingFrame_0 = v2.UI.ScrollingFrame;
local l_game_FastString_0 = game:GetFastString("SmoothVoxels_LearnMoreUrl");
local v16 = v3.PureComponent:extend(script.Name);
v16.render = function(v17)
    local l_props_0 = v17.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_SmoothVoxelsController_0 = l_props_0.SmoothVoxelsController;
    local v21 = l_props_0.Theme:get();
    local l_SmoothVoxelsUpgradePercent_0 = l_props_0.SmoothVoxelsUpgradePercent;
    local v23 = false;
    if l_SmoothVoxelsUpgradePercent_0 >= 0 then
        v23 = l_SmoothVoxelsUpgradePercent_0 < 1;
    end;
    return v3.createElement(l_ScrollingFrame_0, {
        LayoutOrder = l_props_0.LayoutOrder, 
        Size = UDim2.new(1, 0, 1, -(l_props_0.UpperContentYSize or 0))
    }, {
        Panel = v3.createElement(v9, {
            isSubsection = true, 
            Title = l_Localization_0:getText("UpgradeSmoothVoxels", "Title"), 
            Padding = UDim.new(0, 12)
        }, {
            ExplanationTextFrame = v3.createElement(l_Pane_0, {
                Size = UDim2.new(1, 0, 0, 0), 
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                AutomaticSize = Enum.AutomaticSize.Y, 
                Layout = Enum.FillDirection.Vertical, 
                Padding = 8, 
                Spacing = 12
            }, {
                ExplanationText = v3.createElement("TextLabel", {
                    LayoutOrder = 1, 
                    Text = l_Localization_0:getText("UpgradeSmoothVoxels", "Description") .. "\n\n" .. l_Localization_0:getText("UpgradeSmoothVoxels", "Explanation"), 
                    Font = v21.font, 
                    TextSize = v21.textSize, 
                    TextColor3 = v21.textColor, 
                    Size = UDim2.new(1, 0, 0, 0), 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    Position = UDim2.new(0, 0, 0, 0), 
                    BackgroundTransparency = 1
                }), 
                LearnMoreLink = v3.createElement(l_TextWithInlineLink_0, {
                    Size = UDim2.new(1, 0, 0, 0), 
                    AutomaticSize = Enum.AutomaticSize.Y, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                    LayoutOrder = 2, 
                    OnLinkClicked = function()
                        l_BrowserService_0:OpenBrowserWindow(l_game_FastString_0);
                    end, 
                    Text = l_Localization_0:getText("UpgradeSmoothVoxels", "LearnMore"), 
                    LinkText = l_Localization_0:getText("UpgradeSmoothVoxels", "LearnMoreLink"), 
                    LinkPlaceholder = "[link]", 
                    MaxWidth = 300, 
                    TextProps = {
                        BackgroundTransparency = 1, 
                        Font = v21.font, 
                        TextColor3 = v21.textColor, 
                        TextSize = 16, 
                        TextXAlignment = Enum.TextXAlignment.Left
                    }
                })
            }), 
            UpgradeButtons = v3.createElement(v10, {
                LayoutOrder = 3, 
                Buttons = {
                    {
                        Key = "UpgradeSmoothVoxels", 
                        Name = l_Localization_0:getText("UpgradeSmoothVoxels", "ActionButton"), 
                        Active = not v23, 
                        OnClicked = function()
                            l_SmoothVoxelsController_0:start("Panel");
                        end
                    }
                }
            })
        })
    });
end;
return v4.connect(function(v24)
    return {
        SmoothVoxelsUpgradePercent = v24.Tools.SmoothVoxelsUpgradePercent
    };
end, function()
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Theme = v7.DEPRECATED_Theme, 
    SmoothVoxelsController = v11, 
    Terrain = v7.Terrain, 
    analytics = l_ContextServices_0.Analytics, 
    Plugin = l_ContextServices_0.Plugin
})(v16)));
