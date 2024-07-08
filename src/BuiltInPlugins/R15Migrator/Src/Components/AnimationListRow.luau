local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Image_0 = l_UI_0.Image;
local l_Tooltip_0 = l_UI_0.Tooltip;
local l_Checkbox_0 = l_UI_0.Checkbox;
local l_StyleModifier_0 = v1.Util.StyleModifier;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local l_AnimationStatus_0 = require(l_script_FirstAncestor_0.Src.Util.AnimationConversion.constants).AnimationStatus;
local v14 = require(l_script_FirstAncestor_0.Src.Util.sanitizeString);
local v15 = v2.PureComponent:extend("AnimationListRow");
v15.init = function(v16)
    v16.state = {
        hovered = false
    };
    v16.hover = function(v17)
        v16:setState({
            hovered = v17
        });
    end;
end;
local function v22(v18, v19, v20, v21)
    if v18 then
        if v18 == l_AnimationStatus_0.Uploading then
            return v19.LoadingIcon, nil;
        elseif v18 == l_AnimationStatus_0.FailedSerialization then
            return v19.FailedIcon, v20:getText("AnimationStatus", v18);
        elseif v18 == l_AnimationStatus_0.FailedWithError then
            return v19.FailedIcon, string.format(v20:getText("AnimationStatus", v18, {
                error = v21
            }));
        elseif v18 == l_AnimationStatus_0.FailedToGetProductInfo then
            return v19.FailedIcon, v20:getText("AnimationStatus", v18);
        elseif v18 == l_AnimationStatus_0.Done then
            return v19.DoneIcon, v20:getText("AnimationStatus", v18);
        else
            return nil, nil;
        end;
    else
        return nil, nil;
    end;
end;
v15.render = function(v23)
    local l_props_0 = v23.props;
    local l_Row_0 = l_props_0.Row;
    local l_selected_0 = l_Row_0.selected;
    local l_previewSelected_0 = l_Row_0.previewSelected;
    local v28 = v14(l_Row_0.name);
    local l_status_0 = l_Row_0.status;
    local l_OnCheckboxClick_0 = l_Row_0.OnCheckboxClick;
    local l_OnRowClick_0 = l_Row_0.OnRowClick;
    local l_tag_0 = l_Row_0.tag;
    local l_errCode_0 = l_Row_0.errCode;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local l_hovered_0 = v23.state.hovered;
    local v37, v38 = v22(l_status_0, l_Stylizer_0, l_Localization_0, l_errCode_0);
    local v39 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_Pane_0, {
        Style = "Box", 
        Position = l_props_0.Position, 
        Size = l_props_0.Size + l_Stylizer_0.Offset, 
        Padding = l_Stylizer_0.Padding, 
        OnClick = l_OnRowClick_0, 
        StyleModifier = if not l_previewSelected_0 then if l_hovered_0 then l_StyleModifier_0.Hover else nil else l_StyleModifier_0.Selected, 
        BackgroundTransparency = (l_previewSelected_0 or l_hovered_0) and 0 or 1, 
        [v2.Event.MouseEnter] = function()
            v23.hover(true);
        end, 
        [v2.Event.MouseLeave] = function()
            v23.hover(false);
        end
    }, {
        Checkbox = v2.createElement(l_Checkbox_0, {
            LayoutOrder = v39:getNextOrder(), 
            Checked = l_selected_0, 
            OnClick = l_OnCheckboxClick_0
        }), 
        Content = v2.createElement(l_Pane_0, {
            LayoutOrder = v39:getNextOrder(), 
            Size = UDim2.fromScale(1, 1), 
            Spacing = l_Stylizer_0.Spacing, 
            Padding = l_Stylizer_0.ContentPadding
        }, {
            Label1 = v2.createElement(l_TextLabel_0, {
                Text = v28 .. l_tag_0.id, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                AnchorPoint = l_Stylizer_0.Anchor, 
                Position = l_Stylizer_0.Label1Position, 
                Size = l_Stylizer_0.LabelSize, 
                TextSize = l_Stylizer_0.TextSize
            }), 
            Arrow = v2.createElement(l_TextLabel_0, {
                Text = not l_tag_0.converted and "" or l_Stylizer_0.Arrow, 
                TextXAlignment = Enum.TextXAlignment.Center, 
                AnchorPoint = l_Stylizer_0.Anchor, 
                Position = l_Stylizer_0.ArrowPosition, 
                Size = l_Stylizer_0.IconSize, 
                TextSize = l_Stylizer_0.TextSize
            }), 
            Label2 = v2.createElement(l_TextLabel_0, {
                Text = not l_tag_0.converted and "" or v28 .. " R15" .. l_tag_0.converted, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                AnchorPoint = l_Stylizer_0.Anchor, 
                Position = l_Stylizer_0.Label2Position, 
                Size = l_Stylizer_0.LabelSize, 
                TextSize = l_Stylizer_0.TextSize
            }), 
            Icon = v2.createElement(l_Image_0, {
                Size = l_Stylizer_0.IconSize, 
                AnchorPoint = l_Stylizer_0.Anchor, 
                Position = l_Stylizer_0.IconPosition, 
                Image = v37
            }, {
                Tooltip = if not v38 then nil else v2.createElement(l_Tooltip_0, {
                    Text = v38
                })
            })
        }), 
        HoverArea = v2.createElement(l_HoverArea_0, {
            Cursor = "PointingHand"
        })
    });
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v15));
