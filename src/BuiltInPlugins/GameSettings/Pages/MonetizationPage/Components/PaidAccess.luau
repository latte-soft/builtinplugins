local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Src.Flags.getFFlagGameSettingsFixMoreLayoutIssues)();
local v3 = require(l_Parent_1.Packages.Cryo);
local v4 = require(l_Parent_1.Packages.Roact);
local v5 = require(l_Parent_1.Packages.Framework);
local l_Util_0 = v5.Util;
local v7 = if not v2 then l_Util_0.FitFrame.FitFrameOnAxis else nil;
local l_GetTextSize_0 = l_Util_0.GetTextSize;
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v5.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local l_ToggleButton_0 = l_UI_0.ToggleButton;
local v16 = require(l_Parent_0.Components.RobuxFeeBase);
local l_shouldDisablePrivateServersAndPaidAccess_0 = require(l_Parent_1.Src.Util.GameSettingsUtilities).shouldDisablePrivateServersAndPaidAccess;
local v18 = v4.PureComponent:extend("PaidAccess");
v18.render = function(v19)
    if not l_shouldDisablePrivateServersAndPaidAccess_0() then
        local l_props_0 = v19.props;
        local l_Localization_0 = l_props_0.Localization;
        local l_Stylizer_0 = l_props_0.Stylizer;
        local v23 = l_Localization_0:getText("Monetization", "TitlePaidAccess");
        local v24 = l_Localization_0:getText("Monetization", "PriceTitle");
        local v25 = not not l_props_0.Price and l_props_0.Price or 0;
        local l_TaxRate_0 = l_props_0.TaxRate;
        local l_MinimumFee_0 = l_props_0.MinimumFee;
        local l_LayoutOrder_0 = l_props_0.LayoutOrder;
        local l_Enabled_0 = l_props_0.Enabled;
        local l_Selected_0 = l_props_0.Selected;
        local l_OnPaidAccessToggle_0 = l_props_0.OnPaidAccessToggle;
        local l_OnPaidAccessPriceChanged_0 = l_props_0.OnPaidAccessPriceChanged;
        local v33 = nil;
        local l_PriceError_0 = l_props_0.PriceError;
        if not (not l_Enabled_0 or not l_PriceError_0) then
            v33 = l_PriceError_0;
        end;
        local v35 = l_Localization_0:getText("Monetization", "PaidAccessHint");
        local v36 = if not v2 then l_GetTextSize_0(v35, l_Stylizer_0.fontStyle.Subtext.TextSize, l_Stylizer_0.fontStyle.Subtext.Font, Vector2.new(l_Stylizer_0.robuxFeeBase.subText.width, math.huge)) else nil;
        return v4.createElement(if not v2 then v7 else l_Pane_0, if not v2 then {
            axis = v7.Axis.Vertical, 
            minimumSize = UDim2.new(1, 0, 0, 0), 
            BackgroundTransparency = 1, 
            LayoutOrder = l_LayoutOrder_0
        } else {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = l_LayoutOrder_0, 
            Spacing = l_Stylizer_0.titleSpacing
        }, {
            ToggleAndSubscriptionsAndTotal = v4.createElement(l_TitledFrame_0, {
                LayoutOrder = 1, 
                Title = v23
            }, {
                UIListLayout = v4.createElement("UIListLayout", {
                    SortOrder = Enum.SortOrder.LayoutOrder, 
                    FillDirection = Enum.FillDirection.Vertical
                }), 
                ToggleButton = v4.createElement(l_ToggleButton_0, {
                    Disabled = not l_Enabled_0, 
                    LayoutOrder = 1, 
                    OnClick = l_OnPaidAccessToggle_0, 
                    Selected = l_Selected_0
                }), 
                SubText = not l_Selected_0 and if v2 then v4.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    Style = "Label", 
                    Text = v35, 
                    LayoutOrder = 2, 
                    TextWrapped = true, 
                    TextXAlignment = Enum.TextXAlignment.Left
                }) else v4.createElement("TextLabel", v3.Dictionary.join(l_Stylizer_0.fontStyle.Subtext, {
                    Size = UDim2.new(0, math.ceil(v36.X), 0, v36.Y), 
                    BackgroundTransparency = 1, 
                    Text = v35, 
                    TextYAlignment = Enum.TextYAlignment.Center, 
                    TextXAlignment = Enum.TextXAlignment.Left, 
                    TextWrapped = true, 
                    LayoutOrder = 2
                }))
            }), 
            PriceConfigPaidOnly = l_Selected_0 and v4.createElement(l_TitledFrame_0, {
                FillDirection = if not v2 then nil else Enum.FillDirection.Horizontal, 
                LayoutOrder = 3, 
                Style = if not v2 then nil else "Subtitle", 
                Title = v24
            }, {
                RobuxFeeBase = v4.createElement(v16, {
                    Price = v25, 
                    TaxRate = l_TaxRate_0, 
                    MinimumFee = l_MinimumFee_0, 
                    SubText = v33, 
                    Enabled = l_Enabled_0, 
                    OnPriceChanged = l_OnPaidAccessPriceChanged_0
                })
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
})(v18));
