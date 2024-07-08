local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local _ = require(l_script_FirstAncestor_0.Packages.Cryo);
local v2 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Util.RigUtils);
local v4 = require(l_script_FirstAncestor_0.Src.Util.RigInfo);
local v5 = require(l_script_FirstAncestor_0.Packages.Roact);
local v6 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v6.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v6.UI;
local l_Button_0 = l_UI_0.Button;
local l_Pane_0 = l_UI_0.Pane;
local v12 = require(l_script_FirstAncestor_0.Src.Components.IK.HierarchyLines);
local v13 = v5.PureComponent:extend("IKTreeRow");
v13.render = function(v14)
    local l_props_0 = v14.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_Item_0 = l_props_0.Item;
    local l_IKMode_0 = l_props_0.IKMode;
    local l_IsSelected_0 = l_props_0.IsSelected;
    local l_createElement_0 = v5.createElement;
    local v21 = "ImageButton";
    local v24 = {
        Position = l_props_0.Position, 
        Size = UDim2.new(1, -8, 0, v2.TRACK_HEIGHT), 
        ImageTransparency = 1, 
        AutoButtonColor = false, 
        BackgroundColor3 = if not l_IsSelected_0 then l_Stylizer_0.backgroundColor else l_Stylizer_0.ikTheme.selected, 
        BorderSizePixel = 0, 
        ZIndex = 1, 
        [v5.Event.InputBegan] = function(_, v23)
            v14.props.OnInputBegan(v23, l_Item_0);
        end
    };
    local v25 = {};
    local v26 = false;
    if l_IKMode_0 == v2.IK_MODE.FullBody then
        v26 = v14:renderPinButton();
    end;
    v25.Pin = v26;
    v25.Container = v5.createElement(l_Pane_0, {
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        Layout = Enum.FillDirection.Horizontal, 
        Spacing = 14, 
        VerticalAlignment = Enum.VerticalAlignment.Center
    }, {
        HierarchyLines = v14:renderHierarchyLines(), 
        TextLabel = v14:renderJointLabel()
    });
    return l_createElement_0(v21, v24, v25);
end;
v13.renderPinButton = function(v27)
    local l_props_1 = v27.props;
    local l_Stylizer_1 = l_props_1.Stylizer;
    local l_Item_1 = l_props_1.Item;
    local l_IsSelected_1 = l_props_1.IsSelected;
    local l_RootInstance_0 = l_props_1.RootInstance;
    local l_PinnedParts_0 = l_props_1.PinnedParts;
    local l_TogglePinnedPart_0 = l_props_1.TogglePinnedPart;
    local v35 = v4.getPartByName(l_RootInstance_0, l_Item_1);
    return v5.createElement(l_Button_0, {
        Position = UDim2.new(1, -10, 0.5, 0), 
        AnchorPoint = Vector2.new(1, 0.5), 
        ZIndex = 1, 
        IsRound = false, 
        Size = UDim2.fromOffset(11, 11), 
        BorderSizePixel = 0, 
        OnClick = function()
            if v35 then
                l_TogglePinnedPart_0(v35);
            end;
        end
    }, {
        Image = v5.createElement("ImageLabel", {
            BackgroundColor3 = not not l_IsSelected_1 and l_Stylizer_1.ikTheme.selected or l_Stylizer_1.backgroundColor, 
            BorderSizePixel = 0, 
            Size = UDim2.fromScale(1, 1), 
            Image = l_Stylizer_1.ikTheme.pinImage, 
            ImageColor3 = not not if not v35 then nil else l_PinnedParts_0[v35] and l_Stylizer_1.ikTheme.pinHover or l_Stylizer_1.ikTheme.iconColor
        })
    });
end;
v13.renderHierarchyLines = function(v36)
    local l_props_2 = v36.props;
    local l_Item_2 = l_props_2.Item;
    local l_IsLeafNode_0 = l_props_2.IsLeafNode;
    local l_Depth_0 = l_props_2.Depth;
    local l_GetVerticalLineHeight_0 = l_props_2.GetVerticalLineHeight;
    local l_Chain_0 = l_props_2.Chain;
    local v43 = l_Depth_0 - 1;
    return v5.createElement(v12, {
        Highlight = l_Chain_0[l_Item_2] ~= nil, 
        IsSelected = l_props_2.IsSelected, 
        InActiveChain = l_Chain_0[l_Item_2], 
        IsLeafNode = l_IsLeafNode_0, 
        IsChildNode = v43 > 0, 
        IsExpanded = l_props_2.IsExpanded, 
        Indent = v43, 
        Height = l_GetVerticalLineHeight_0(l_Item_2, false), 
        IKHeight = l_GetVerticalLineHeight_0(l_Item_2, true), 
        LayoutOrder = 1, 
        ToggleExpanded = l_props_2.OnToggleExpanded, 
        Element = l_Item_2
    });
end;
v13.renderJointLabel = function(v44)
    local l_props_3 = v44.props;
    local l_Stylizer_2 = l_props_3.Stylizer;
    return v5.createElement("TextLabel", {
        Text = l_props_3.Item, 
        TextSize = l_Stylizer_2.ikTheme.textSize, 
        Font = l_Stylizer_2.font, 
        TextColor3 = not not l_props_3.IsSelected and l_Stylizer_2.ikTheme.primaryTextColor or l_Stylizer_2.ikTheme.textColor, 
        TextXAlignment = Enum.TextXAlignment.Left, 
        TextYAlignment = Enum.TextYAlignment.Center, 
        Size = UDim2.new(0, 160, 1, 0), 
        TextTruncate = Enum.TextTruncate.AtEnd, 
        BackgroundTransparency = 1, 
        LayoutOrder = 3
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v13));
