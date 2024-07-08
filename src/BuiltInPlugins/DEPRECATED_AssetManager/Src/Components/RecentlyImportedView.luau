local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Packages.InsertAsset);
local v3 = require(l_Parent_0.Packages.Roact);
local v4 = require(l_Parent_0.Packages.RoactRodux);
local v5 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v5.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_InsertAssetContext_0 = v2.Context.InsertAssetContext;
local l_ScrollingFrame_0 = v5.UI.ScrollingFrame;
local l_Util_0 = v5.Util;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local v13 = require(l_Parent_0.Src.Components.ListItem);
local v14 = require(l_Parent_0.Src.Actions.SetRecentViewToggled);
local v15 = require(l_Parent_0.Src.Thunks.OnAssetDrag);
local v16 = v3.PureComponent:extend("RecentlyImportedView");
v16.createListItems = function(v17, _, v19, v20, v21)
    local v22 = {};
    for _, v24 in pairs(v19) do
        v22[v24.id] = v3.createElement(v13, {
            AssetData = v24, 
            LayoutOrder = v24.key, 
            StyleModifier = not not v20[v24.key] and l_StyleModifier_0.Selected or nil, 
            Enabled = v21, 
            RecentListItem = true, 
            OnAssetDrag = v17.onAssetDrag
        });
    end;
    return v22;
end;
v16.init = function(v25)
    v25.onMouseActivated = function(_, _, _)
        local l_props_0 = v25.props;
        l_props_0.dispatchSetRecentViewToggled(not l_props_0.RecentViewToggled);
    end;
    v25.mouseEnter = function()
        v25.props.Mouse:__pushCursor("PointingHand");
    end;
    v25.mouseLeave = function()
        v25.props.Mouse:__popCursor();
    end;
    v25.onAssetDrag = function(v30)
        local l_props_1 = v25.props;
        l_props_1.dispatchOnAssetDrag(l_props_1.InsertAsset:get(), v30, l_props_1.Analytics);
    end;
end;
v16.render = function(v32)
    local l_props_2 = v32.props;
    local l_Stylizer_0 = l_props_2.Stylizer;
    local l_RecentView_0 = l_Stylizer_0.RecentView;
    local l_Localization_0 = l_props_2.Localization;
    local l_Size_0 = l_props_2.Size;
    local l_LayoutOrder_0 = l_props_2.LayoutOrder;
    local l_Enabled_0 = l_props_2.Enabled;
    local v40 = l_Localization_0:getText("RecentlyImportedView", "Title");
    local l_RecentViewToggled_0 = l_props_2.RecentViewToggled;
    local v42 = not not l_RecentViewToggled_0 and l_RecentView_0.Bar.Arrow.Expanded or l_RecentView_0.Bar.Arrow.Collapsed;
    local v43 = v32:createListItems(l_Stylizer_0, l_props_2.RecentAssets, l_props_2.SelectedAssets, l_Enabled_0);
    local v44 = l_LayoutOrderIterator_0.new();
    return v3.createElement("Frame", {
        Size = l_Size_0, 
        LayoutOrder = l_LayoutOrder_0, 
        ZIndex = 2, 
        BackgroundTransparency = 1
    }, {
        RecentlyImportedViewLayout = v3.createElement("UIListLayout", {
            Padding = UDim.new(0, 0), 
            FillDirection = Enum.FillDirection.Vertical, 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        RecentlyImportedViewBar = v3.createElement("ImageButton", {
            Size = UDim2.new(1, 0, 0, l_RecentView_0.Bar.Height), 
            LayoutOrder = v44:getNextOrder(), 
            ZIndex = 100, 
            BackgroundColor3 = l_RecentView_0.Bar.BackgroundColor, 
            BorderColor3 = l_Stylizer_0.BorderColor, 
            BorderSizePixel = 1, 
            [v3.Event.Activated] = v32.onMouseActivated, 
            [v3.Event.MouseEnter] = v32.mouseEnter, 
            [v3.Event.mouseLeave] = v32.mouseLeave
        }, {
            RecentlyImportedViewBarLayout = v3.createElement("UIListLayout", {
                Padding = UDim.new(0, l_RecentView_0.Bar.Padding), 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            GameBarPadding = v3.createElement("UIPadding", {
                PaddingLeft = UDim.new(0, l_RecentView_0.Bar.Padding)
            }), 
            RecentlyImportedViewBarText = v3.createElement("TextLabel", {
                Size = UDim2.new(1, -l_RecentView_0.Bar.Button.Size - l_RecentView_0.Bar.Padding, 1, 0), 
                LayoutOrder = 0, 
                BackgroundTransparency = 1, 
                Text = v40, 
                TextColor3 = l_Stylizer_0.TextColor, 
                TextSize = l_Stylizer_0.FontSizeSmall, 
                Font = l_Stylizer_0.Font, 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            CollapseImageFrame = v3.createElement("Frame", {
                Size = UDim2.new(0, l_RecentView_0.Bar.Button.Size, 0, l_RecentView_0.Bar.Button.Size), 
                LayoutOrder = 1, 
                BackgroundTransparency = 1
            }, {
                CollapseArrow = v3.createElement("ImageLabel", v1.Dictionary.join(v42, {
                    Size = UDim2.new(0, l_RecentView_0.Bar.Arrow.Size, 0, l_RecentView_0.Bar.Arrow.Size), 
                    AnchorPoint = Vector2.new(0, 0.5), 
                    Position = UDim2.new(0, 0, 0.5, 0), 
                    BackgroundTransparency = 1, 
                    ImageColor3 = l_RecentView_0.Bar.Arrow.Color
                }))
            })
        }), 
        RecentlyImportedViewScrollingFrame = v3.createElement(l_ScrollingFrame_0, {
            Size = UDim2.new(1, 0, not l_RecentViewToggled_0 and 0 or 1, not not l_RecentViewToggled_0 and -l_RecentView_0.Bar.Height or 0), 
            LayoutOrder = v44:getNextOrder(), 
            BackgroundTransparency = 1, 
            AutoSizeLayoutOptions = {
                SortOrder = Enum.SortOrder.LayoutOrder
            }
        }, v43)
    });
end;
return v4.connect(function(v45, _)
    local l_AssetManagerReducer_0 = v45.AssetManagerReducer;
    return {
        RecentAssets = l_AssetManagerReducer_0.recentAssets, 
        RecentViewToggled = l_AssetManagerReducer_0.recentViewToggled, 
        SelectedAssets = l_AssetManagerReducer_0.selectedAssets
    };
end, function(v48)
    return {
        dispatchOnAssetDrag = function(v49, v50, v51)
            v48(v15(v49, v50, v51));
        end, 
        dispatchSetRecentViewToggled = function(v52)
            v48(v14(v52));
        end
    };
end)((l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    InsertAsset = l_InsertAssetContext_0, 
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse, 
    Stylizer = l_ContextServices_0.Stylizer
})(v16)));
