local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxEnableSearchOptionsRefactor);
local l_Packages_0 = l_Parent_0.Packages;
local v3 = require(l_Packages_0.Roact);
local v4 = require(l_Packages_0.Framework);
local v5 = require(l_Parent_0.Core.Util.Constants);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_GetTextSize_0 = v4.Util.GetTextSize;
local v9 = require(l_Parent_0.Core.Components.RoundButton);
local v10 = v3.PureComponent:extend("SearchOptionsFooter");
if not v1() then
    v10.init = function(v11)
        v11.onButtonClicked = function(v12, v13)
            if v11.props.onButtonClicked then
                v11.props.onButtonClicked(v12, v13);
            end;
        end;
    end;
    v10.render = function(v14)
        local l_Stylizer_0 = v14.props.Stylizer;
        local v16 = v14.props.Localization:getText("General", "SearchOptionsApply");
        local v17 = v14.props.Localization:getText("General", "SearchOptionsCancel");
        local v18 = l_GetTextSize_0(v16, nil, nil, Vector2.new(0, 0)).X + 20;
        local v19 = l_GetTextSize_0(v17, nil, nil, Vector2.new(0, 0)).X + 20;
        local l_cancelButton_0 = l_Stylizer_0.searchOptions.cancelButton;
        local l_applyButton_0 = l_Stylizer_0.searchOptions.applyButton;
        return v3.createElement("Frame", {
            AnchorPoint = v14.props.AnchorPoint, 
            Position = v14.props.Position, 
            LayoutOrder = v14.props.LayoutOrder, 
            Size = UDim2.new(1, 0, 0, v5.FOOTER_BUTTON_HEIGHT), 
            BackgroundTransparency = 1
        }, {
            UIListLayout = v3.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Horizontal, 
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                Padding = UDim.new(0, 10)
            }), 
            CancelButton = v3.createElement(v9, {
                LayoutOrder = 1, 
                Size = UDim2.new(0, math.max(55, v19), 1, 0), 
                BackgroundColor3 = l_cancelButton_0.backgroundColor, 
                BorderColor3 = l_cancelButton_0.borderColor, 
                [v3.Event.Activated] = function()
                    v14.onButtonClicked("Cancel");
                end
            }, {
                TextLabel = v3.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    Font = v5.FONT, 
                    TextSize = v5.FONT_SIZE_MEDIUM, 
                    Text = v17, 
                    TextColor3 = l_cancelButton_0.textColor
                })
            }), 
            ApplyButton = v3.createElement(v9, {
                LayoutOrder = 2, 
                Size = UDim2.new(0, math.max(55, v18), 1, 0), 
                BackgroundColor3 = l_applyButton_0.backgroundColor, 
                BorderColor3 = l_applyButton_0.borderColor, 
                [v3.Event.Activated] = function()
                    v14.onButtonClicked("Apply");
                end
            }, {
                TextLabel = v3.createElement("TextLabel", {
                    Size = UDim2.new(1, 0, 1, 0), 
                    BackgroundTransparency = 1, 
                    Font = v5.FONT, 
                    TextSize = v5.FONT_SIZE_MEDIUM, 
                    Text = v16, 
                    TextColor3 = l_applyButton_0.textColor
                })
            })
        });
    end;
    return (l_withContext_0({
        Localization = l_ContextServices_0.Localization, 
        Stylizer = l_ContextServices_0.Stylizer
    })(v10));
else
    return nil;
end;
