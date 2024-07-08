local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.RoactRodux);
local v3 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_UI_0 = v3.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_ShowOnTop_0 = l_UI_0.ShowOnTop;
local _ = require(l_Parent_0.Src.Components.FolderTreeItem);
local v10 = require(l_Parent_0.Src.Util.Screens);
local v11 = require(l_Parent_0.Src.Actions.SetRecentViewToggled);
local v12 = require(l_Parent_0.Src.Actions.SetScreen);
local v13 = v1.PureComponent:extend("ExplorerOverlay");
local _ = v3.Dash.join;
local l_TreeView_0 = l_UI_0.TreeView;
v13.init = function(v16)
    v16.state = {
        Expansion = {
            [v16.props.FileExplorerData[1]] = true
        }, 
        Selection = {}
    };
    v16.OnExpansionChange = function(v17)
        v16:setState({
            Expansion = v17
        });
    end;
    v16.onSelectionChange = function(v18)
        v16:setState({
            Selection = v18
        });
        local l_props_0 = v16.props;
        local l_dispatchSetScreen_0 = l_props_0.dispatchSetScreen;
        local l_CloseOverlay_0 = l_props_0.CloseOverlay;
        local l_RecentViewToggled_0 = l_props_0.RecentViewToggled;
        local l_dispatchSetRecentViewToggled_0 = l_props_0.dispatchSetRecentViewToggled;
        local v24 = next(v18);
        if #v24.children == 0 then
            if l_RecentViewToggled_0 then
                l_dispatchSetRecentViewToggled_0(false);
            end;
            l_dispatchSetScreen_0(v10[v24.Screen]);
            l_CloseOverlay_0();
        end;
    end;
end;
v13.render = function(v25)
    local l_props_1 = v25.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_Overlay_0 = l_Stylizer_0.Overlay;
    local _ = l_props_1.dispatchSetScreen;
    local l_CloseOverlay_1 = l_props_1.CloseOverlay;
    local _ = l_props_1.RecentViewToggled;
    local _ = l_props_1.dispatchSetRecentViewToggled;
    return v1.createElement(l_ShowOnTop_0, {}, {
        Background = v1.createElement(l_Pane_0, {
            BackgroundColor = Color3.new(0, 0, 0), 
            OnClick = l_CloseOverlay_1, 
            Position = UDim2.new(1, 0, 0, 0), 
            Size = UDim2.new(l_Overlay_0.Background.WidthScale, 0, 1, 0), 
            Transparency = l_Overlay_0.Background.Transparency
        }), 
        Overlay = v1.createElement(l_Pane_0, {
            BackgroundColor = l_Stylizer_0.BackgroundColor, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = 2, 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            Size = UDim2.new(l_Overlay_0.Foreground.WidthScale, 0, 1, 0)
        }, {
            CloseButton = v1.createElement(l_Pane_0, {
                HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = 1, 
                Padding = {
                    Right = l_Overlay_0.Padding.Right
                }, 
                Size = UDim2.new(1, 0, 0, 24)
            }, {
                CloseIcon = v1.createElement("ImageButton", {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundTransparency = 1, 
                    Image = l_Overlay_0.CloseButton.Images.Close, 
                    Size = UDim2.fromOffset(l_Overlay_0.CloseButton.Size, l_Overlay_0.CloseButton.Size), 
                    [v1.Event.Activated] = l_CloseOverlay_1
                })
            }), 
            FolderTree = v1.createElement(l_TreeView_0, {
                RootItems = v25.props.FileExplorerData, 
                Size = UDim2.fromScale(1, 1), 
                Expansion = v25.state.Expansion, 
                LayoutOrder = 2, 
                OnExpansionChange = v25.OnExpansionChange, 
                OnSelectionChange = v25.onSelectionChange
            })
        })
    });
end;
return v2.connect(function(v33, _)
    return {
        RecentViewToggled = v33.AssetManagerReducer.recentViewToggled
    };
end, function(v35)
    return {
        dispatchSetRecentViewToggled = function(v36)
            v35(v11(v36));
        end, 
        dispatchSetScreen = function(v37)
            v35(v12(v37));
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v13)));
