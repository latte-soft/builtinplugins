local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Packages.FitFrame);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v4.UI;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local l_ToggleButton_0 = l_UI_0.ToggleButton;
local l_TextWithInlineLink_0 = l_UI_0.TextWithInlineLink;
local l_FitTextLabel_0 = v3.FitTextLabel;
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local v13 = v1.PureComponent:extend("ToggleButtonWithTitle");
v13.init = function(v14)
    v14.state = {
        descriptionWidth = 0
    };
    v14.descriptionRef = v1.createRef();
    v14.onResize = function()
        local l_current_0 = v14.descriptionRef.current;
        if l_current_0 then
            v14:setState({
                descriptionWidth = l_current_0.AbsoluteSize.X
            });
            return ;
        else
            return ;
        end;
    end;
end;
v13.render = function(v16)
    local l_props_0 = v16.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_TeachingCallout_0 = l_props_0[v1.Children].TeachingCallout;
    local l_descriptionWidth_0 = v16.state.descriptionWidth;
    local l_Description_0 = l_props_0.Description;
    local l_Disabled_0 = l_props_0.Disabled;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Selected_0 = l_props_0.Selected;
    local l_Title_0 = l_props_0.Title;
    local l_OnClick_0 = l_props_0.OnClick;
    local l_LinkProps_0 = l_props_0.LinkProps;
    local v28 = l_LayoutOrderIterator_0.new();
    return v1.createElement(l_TitledFrame_0, {
        LayoutOrder = l_LayoutOrder_0, 
        Title = l_Title_0
    }, {
        ToggleButton = v1.createElement(l_ToggleButton_0, {
            Disabled = l_Disabled_0, 
            Selected = l_Selected_0, 
            LayoutOrder = v28:getNextOrder(), 
            OnClick = l_OnClick_0, 
            Size = UDim2.fromOffset(40, 24)
        }, {
            TeachingCallout = l_TeachingCallout_0
        }), 
        Description = l_props_0.Description and v1.createElement(l_FitTextLabel_0, {
            BackgroundTransparency = 1, 
            LayoutOrder = v28:getNextOrder(), 
            TextTransparency = not l_props_0.Disabled and 0 or 0.5, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            TextYAlignment = Enum.TextYAlignment.Top, 
            Text = l_Description_0, 
            TextWrapped = true, 
            width = UDim.new(0, l_descriptionWidth_0), 
            Font = Enum.Font.SourceSans, 
            TextSize = 16, 
            TextColor3 = l_Stylizer_0.dimmerTextColor
        }), 
        LinkText = l_props_0.LinkProps and v1.createElement(l_TextWithInlineLink_0, v2.Dictionary.join(l_LinkProps_0, {
            LinkPlaceholder = "[link]", 
            MaxWidth = math.max(l_descriptionWidth_0, l_Stylizer_0.textWithInlineLink.maxWidth), 
            LayoutOrder = v28:getNextOrder(), 
            TextProps = v2.Dictionary.join(l_Stylizer_0.fontStyle.Subtext, {
                BackgroundTransparency = 1, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        })), 
        DescriptionWidth = v1.createElement("Frame", {
            BackgroundTransparency = 1, 
            LayoutOrder = v28:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, 0), 
            [v1.Ref] = v16.descriptionRef, 
            [v1.Change.AbsoluteSize] = v16.onResize
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v13));
