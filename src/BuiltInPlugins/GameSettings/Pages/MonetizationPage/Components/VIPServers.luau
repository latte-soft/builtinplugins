local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Cryo);
local v3 = require(l_Parent_1.Packages.Roact);
local v4 = require(l_Parent_1.Packages.Framework);
local v5 = require(l_Parent_1.Src.Flags.getFFlagGameSettingsFixMoreLayoutIssues)();
local l_Util_0 = v4.Util;
local v7 = if not v5 then l_Util_0.FitFrame.FitFrameOnAxis else nil;
local l_GetTextSize_0 = l_Util_0.GetTextSize;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v12 = require(l_Parent_1.Src.Components.RadioButtonSet);
local v13 = require(l_Parent_0.Components.RobuxFeeBase);
local l_UI_0 = v4.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local l_ToggleButton_0 = l_UI_0.ToggleButton;
local l_shouldDisablePrivateServersAndPaidAccess_0 = require(l_Parent_1.Src.Util.GameSettingsUtilities).shouldDisablePrivateServersAndPaidAccess;
local v20 = v3.PureComponent:extend("VIPServers");
v20.init = function(v21)
    v21.lastNonFreePrice = 10;
end;
v20.render = function(v22)
    if not l_shouldDisablePrivateServersAndPaidAccess_0() then
        local l_props_0 = v22.props;
        local l_Localization_0 = l_props_0.Localization;
        local l_Stylizer_0 = l_props_0.Stylizer;
        local v26 = l_LayoutOrderIterator_0.new();
        local v27 = l_Localization_0:getText("Monetization", "PrivateServersTitle");
        local v28 = l_Localization_0:getText("Monetization", "PriceTitle");
        local l_LayoutOrder_0 = l_props_0.LayoutOrder;
        local v30 = not not l_props_0.VIPServersData and l_props_0.VIPServersData or {};
        local l_Enabled_0 = l_props_0.Enabled;
        local l_TaxRate_0 = l_props_0.TaxRate;
        local l_MinimumFee_0 = l_props_0.MinimumFee;
        local l_isEnabled_0 = v30.isEnabled;
        local v35 = not not v30.price and v30.price or 0;
        local v36 = not not v30.activeServersCount and v30.activeServersCount or 0;
        local v37 = not not v30.activeSubscriptionsCount and v30.activeSubscriptionsCount or 0;
        local l_changed_0 = v30.changed;
        local l_willShutdown_0 = v30.willShutdown;
        local v40 = v35 == 0;
        if not v40 then
            v22.lastNonFreePrice = v35;
        end;
        local l_OnVipServersToggled_0 = l_props_0.OnVipServersToggled;
        local l_OnVipServersPriceChanged_0 = l_props_0.OnVipServersPriceChanged;
        local v43 = nil;
        local v44 = nil;
        v43 = if v37 < 0 then l_Localization_0:getText("Monetization", "OverPrivateServerSubscriptions", {
            numOfSubscriptions = v37 * -1
        }) else l_Localization_0:getText("Monetization", "PrivateServerSubscriptions", {
            numOfSubscriptions = v37
        });
        v44 = l_Localization_0:getText("Monetization", "PrivateServersActive", {
            totalVipServers = v36
        });
        local v45 = if not v5 then l_Enabled_0 and l_Stylizer_0.robuxFeeBase.transparency.enabled or l_Stylizer_0.robuxFeeBase.transparency.disabled else nil;
        local v46 = nil;
        local v47 = nil;
        local l_PriceError_0 = l_props_0.PriceError;
        local v49 = nil;
        if not l_Enabled_0 or not l_PriceError_0 then
            if l_changed_0 then
                v46 = l_Localization_0:getText("Monetization", "PrivateServersPriceChangeWarning");
                v49 = true;
            end;
        else
            v46 = l_PriceError_0;
        end;
        v47 = l_Localization_0:getText("Monetization", "PrivateServersHint");
        if l_willShutdown_0 then
            v47 = l_Localization_0:getText("Monetization", "PrivateServersShutdownWarning");
        end;
        local v50 = if not v5 then l_GetTextSize_0(v47, l_Stylizer_0.fontStyle.Subtext.TextSize, l_Stylizer_0.fontStyle.Subtext.Font, Vector2.new(l_Stylizer_0.robuxFeeBase.subText.width, math.huge)) else nil;
        return v3.createElement(if not v5 then v7 else l_Pane_0, if not v5 then {
            axis = v7.Axis.Vertical, 
            minimumSize = UDim2.new(1, 0, 0, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = l_LayoutOrder_0
        } else {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = l_LayoutOrder_0, 
            Spacing = if not v5 then nil else l_Stylizer_0.titleSpacing
        }, {
            ToggleAndSubscriptionsAndTotal = v3.createElement(l_TitledFrame_0, {
                LayoutOrder = 1, 
                Title = v27
            }, {
                UIListLayout = if not v5 then v3.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical
                }) else nil, 
                ToggleButton = v3.createElement(l_ToggleButton_0, {
                    Disabled = not l_Enabled_0, 
                    Selected = l_isEnabled_0, 
                    OnClick = l_OnVipServersToggled_0, 
                    LayoutOrder = 1
                }), 
                SubText = (not l_isEnabled_0 or not l_isEnabled_0 and l_changed_0) and if v5 then v3.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Style = "Label", 
                    Text = v47, 
                    LayoutOrder = 2, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }) else v3.createElement("TextLabel", v2.Dictionary.join((not l_isEnabled_0 and (l_changed_0 or l_willShutdown_0)) and l_Stylizer_0.fontStyle.SmallError or l_Stylizer_0.fontStyle.Subtext, {
                    Size = UDim2.new(0, math.ceil(v50.X), 0, v50.Y), 
                    BackgroundTransparency = 1, 
                    Text = v47, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    LayoutOrder = 2
                })), 
                Subscriptions = l_isEnabled_0 and if v5 then v3.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = 2, 
                    Style = "Label", 
                    Text = v43, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }) else v3.createElement("TextLabel", {
                    Font = l_Stylizer_0.fontStyle.Normal.Font, 
                    TextSize = l_Stylizer_0.fontStyle.Normal.TextSize, 
                    TextColor3 = not not l_isEnabled_0 and l_Stylizer_0.fontStyle.Normal.TextColor3 or l_Stylizer_0.fontStyle.Subtext.TextColor3, 
                    Text = v43, 
                    Size = UDim2.new(1, 0, 0, l_Stylizer_0.rowHeight), 
                    BackgroundTransparency = 1, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextTransparency = v45, 
                    LayoutOrder = 2
                }), 
                TotalVIPServers = l_isEnabled_0 and if v5 then v3.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = 3, 
                    Style = "Label", 
                    Text = v44, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }) else v3.createElement("TextLabel", {
                    Font = l_Stylizer_0.fontStyle.Normal.Font, 
                    TextSize = l_Stylizer_0.fontStyle.Normal.TextSize, 
                    TextColor3 = not not l_isEnabled_0 and l_Stylizer_0.fontStyle.Normal.TextColor3 or l_Stylizer_0.fontStyle.Subtext.TextColor3, 
                    Text = v44, 
                    Size = UDim2.new(1, 0, 0, l_Stylizer_0.rowHeight), 
                    BackgroundTransparency = 1, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextTransparency = v45, 
                    LayoutOrder = 3
                })
            }), 
            PriceConfig = l_isEnabled_0 and v3.createElement(v12, {
                Title = v28, 
                FillDirection = if not v5 then nil else Enum.FillDirection.Horizontal, 
                Buttons = {
                    {
                        Id = true, 
                        Title = l_Localization_0:getText("Monetization", "Free")
                    }, 
                    {
                        Id = false, 
                        Title = l_Localization_0:getText("Monetization", "Paid"), 
                        Children = {
                            RobuxFeeBase = v3.createElement(v13, {
                                Price = v35, 
                                TaxRate = l_TaxRate_0, 
                                MinimumFee = l_MinimumFee_0, 
                                SubText = v46, 
                                Enabled = not v40, 
                                OnPriceChanged = l_OnVipServersPriceChanged_0, 
                                HasPriceChanged = l_changed_0, 
                                LayoutOrder = v26:getNextOrder(), 
                                ShowPriceChangeWarning = v49
                            })
                        }
                    }
                }, 
                Enabled = l_isEnabled_0, 
                Selected = v40, 
                SelectionChanged = function(v51)
                    if not v51.Id then
                        l_OnVipServersPriceChanged_0(v22.lastNonFreePrice);
                        return ;
                    else
                        l_OnVipServersPriceChanged_0(0);
                        return ;
                    end;
                end, 
                LayoutOrder = 2
            })
        });
    else
        return nil;
    end;
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Mouse = l_ContextServices_0.Mouse
})(v20));
