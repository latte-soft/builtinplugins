local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.Roact);
local v3 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v4 = require(l_script_FirstAncestor_0.Packages.Dash);
local l_UI_0 = v1.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_ExpandablePane_0 = l_UI_0.ExpandablePane;
local l_Image_0 = l_UI_0.Image;
local l_Util_0 = v1.Util;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local l_ContextServices_0 = v1.ContextServices;
local l_Components_0 = l_script_FirstAncestor_0.Src.Components;
local v15 = require(l_Components_0.AnimationList);
local v16 = require(l_Components_0.AnimationPreviewComponent);
local v17 = require(l_Components_0.AnimationConversionPaneFooter);
local l_AssetType_0 = require(l_script_FirstAncestor_0.Src.Util.AnimationConversion.constants).AssetType;
local v19 = require(l_script_FirstAncestor_0.Src.Util.AssetIdUtil);
local v20 = v2.PureComponent:extend("AnimationConversionPane");
v20.init = function(v21)
    v21.state = {
        expanded = {
            Preview = true, 
            List = true
        }, 
        paneSize = Vector2.new()
    };
    v21.onExpandedChanged = function(v22)
        return function()
            v21:setState(function(v23)
                local v24 = v4.copy(v23.expanded);
                v24[v22] = not v24[v22];
                return {
                    expanded = v24
                };
            end);
        end;
    end;
    v21.ref = v2.createRef();
end;
v20.initRef = function(v25)
    local v26 = v25.ref:getValue();
    if v26 then
        v25:setState({
            paneSize = v26.AbsoluteSize
        });
        v25.onPaneSizeChanged = v26:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
            v25:setState({
                paneSize = v26.AbsoluteSize
            });
        end);
        return ;
    else
        return ;
    end;
end;
v20.didMount = function(v27)
    v27:initRef();
end;
v20.willUnmount = function(v28)
    if v28.onPaneSizeChanged then
        v28.onPaneSizeChanged:Disconnect();
    end;
end;
v20.didUpdate = function(v29)
    if not (not v29.ref.current or v29.onPaneSizeChanged) then
        v29:initRef();
    end;
end;
v20.buildTags = function(v30)
    local l_animations_0 = v30.props.animations;
    local v32 = {};
    for v33, v34 in l_animations_0, nil, nil do
        local l_animationAssetInfo_0 = v34.animationAssetInfo;
        local v36 = {
            id = ""
        };
        if v34.converted then
            local v37 = tonumber(v34.converted);
            v36.converted = not v19.isValidAssetId(v37) and "" or string.format(" (%d)", v37);
        end;
        if l_animationAssetInfo_0:IsA(l_AssetType_0.RobloxAsset) then
            v36.id = string.format(" (%d)", l_animationAssetInfo_0.id);
        end;
        v32[v33] = v36;
    end;
    return v32;
end;
v20.renderHeader = function(v38, v39, v40)
    local l_Header_0 = v38.props.Stylizer.Header;
    local v42 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_Pane_0, v4.join(l_Header_0.Container, {
        OnClick = v38.onExpandedChanged(v40)
    }), {
        Arrow = v2.createElement(l_Image_0, {
            Style = l_Header_0.Arrow, 
            StyleModifier = if not v38.state.expanded[v40] then nil else l_StyleModifier_0.Selected, 
            LayoutOrder = v42:getNextOrder()
        }), 
        Text = v2.createElement(l_TextLabel_0, {
            Text = v39, 
            LayoutOrder = v42:getNextOrder(), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            AnchorPoint = Vector2.new(0, 0.5), 
            Position = UDim2.new(0, 24, 0.5, 0), 
            Style = l_Header_0.Text
        })
    });
end;
v20.renderAnimationList = function(v43)
    local l_props_0 = v43.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Localization_0 = l_props_0.Localization;
    local l_animations_1 = l_props_0.animations;
    local v48 = v43:buildTags();
    local l_state_0 = v43.state;
    local l_Preview_0 = l_state_0.expanded.Preview;
    local v51 = if not l_Preview_0 then l_Stylizer_0.CollapsedOffset else l_Stylizer_0.ExpandedOffset;
    local v52 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_Pane_0, {
        Layout = Enum.FillDirection.Vertical, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        Content = v2.createElement(l_Pane_0, {
            LayoutOrder = v52:getNextOrder(), 
            Size = UDim2.new(1, 0, 1, -l_Stylizer_0.FooterHeight), 
            Layout = Enum.FillDirection.Vertical, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            [v2.Ref] = v43.ref
        }, {
            PreviewContainer = v2.createElement(l_ExpandablePane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = v52:getNextOrder(), 
                Expanded = l_Preview_0, 
                HeaderOverride = v43:renderHeader(l_Localization_0:getText("AnimationConversion", "Preview"), "Preview"), 
                OnExpandedChanged = function()
                end
            }, {
                Preview = v2.createElement(v16)
            }), 
            ListContainer = v2.createElement(l_ExpandablePane_0, {
                AutomaticSize = Enum.AutomaticSize.Y, 
                LayoutOrder = v52:getNextOrder(), 
                Expanded = l_state_0.expanded.List, 
                ContentPadding = 0, 
                HeaderOverride = v43:renderHeader(l_Localization_0:getText("AnimationConversion", "Animations"), "List"), 
                OnExpandedChanged = function()
                end
            }, {
                List = v2.createElement(v15, {
                    Size = UDim2.new(1, 0, 0, (l_state_0.paneSize.Y - l_Stylizer_0.HeaderHeight) - v51), 
                    Items = l_animations_1, 
                    Tags = v48, 
                    LayoutOrder = v52:getNextOrder(), 
                    OnResetPlugin = l_props_0.OnResetPlugin
                })
            })
        }), 
        Footer = v2.createElement(v17, {
            LayoutOrder = v52:getNextOrder(), 
            Size = UDim2.new(1, 0, 0, l_Stylizer_0.FooterHeight)
        })
    });
end;
v20.renderNoAnimationsScreen = function(v53)
    return v2.createElement(l_Pane_0, {}, {
        Label = v2.createElement(l_TextLabel_0, {
            Text = v53.props.Localization:getText("AnimationConversion", "NoAnimations")
        })
    });
end;
v20.hasAnimations = function(v54)
    return next(v54.props.animations) ~= nil;
end;
v20.render = function(v55)
    if not v55:hasAnimations() then
        return v55:renderNoAnimationsScreen();
    else
        return v55:renderAnimationList();
    end;
end;
return v3.connect(function(v56, _)
    return {
        diagnostics = v56.ScriptConversion.diagnostics, 
        animations = v56.AnimationConversion.animations
    };
end)((l_ContextServices_0.withContext({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v20)));
