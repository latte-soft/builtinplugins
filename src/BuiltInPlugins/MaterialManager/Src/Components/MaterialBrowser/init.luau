local l_Parent_0 = script.Parent.Parent.Parent;
local _ = require(l_Parent_0.Src.Types);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_withAbsoluteSize_0 = v4.Wrappers.withAbsoluteSize;
local l_join_0 = v4.Dash.join;
local l_withContext_0 = v4.ContextServices.withContext;
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local l_Stylizer_0 = v4.Style.Stylizer;
local l_UI_0 = v4.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_SplitPane_0 = l_UI_0.SplitPane;
local l_IconButton_0 = l_UI_0.IconButton;
local v14 = require(l_Parent_0.Src.Actions.SetMaterialBrowserLayout);
local v15 = require(l_Parent_0.Src.Controllers.PluginController);
local l_Components_0 = l_Parent_0.Src.Components;
local v17 = require(l_Components_0.MaterialBrowser.MaterialEditor);
local v18 = require(l_Components_0.MaterialBrowser.MaterialGrid);
local v19 = require(l_Components_0.MaterialBrowser.SideBar);
local v20 = require(l_Components_0.MaterialBrowser.TopBar);
local v21 = require(l_Parent_0.Src.Resources.Constants.getViewTypes)();
local v22 = require(l_Parent_0.Src.Flags.getFFlagMaterialActionAsTool);
local v23 = v2.PureComponent:extend("MaterialBrowser");
v23.init = function(v24)
    v24.onHideButtonClicked = function()
        local l_props_0 = v24.props;
        local v26 = l_join_0(l_props_0.MaterialBrowserLayout, {
            BaseShowSideBar = false, 
            OverrideShowSideBar = false, 
            SideBarWidth = 200
        });
        l_props_0.dispatchSetMaterialBrowserLayout(v26);
        l_props_0.PluginController:setMaterialBrowserLayout(v26);
    end;
    v24.onShowButtonClicked = function()
        local l_props_1 = v24.props;
        local l_MaterialBrowser_0 = l_props_1.Stylizer.MaterialBrowser;
        local v29 = l_join_0(l_props_1.MaterialBrowserLayout, {
            BaseShowSideBar = true, 
            OverrideShowSideBar = l_props_1.AbsoluteSize.X < ((l_MaterialBrowser_0.MaterialTileWidth + l_MaterialBrowser_0.Padding * 2) + (not l_props_1.Material and 0 or l_MaterialBrowser_0.MaterialEditorWidth)) + l_MaterialBrowser_0.MinSideBarWidth
        });
        l_props_1.dispatchSetMaterialBrowserLayout(v29);
        l_props_1.PluginController:setMaterialBrowserLayout(v29);
    end;
    v24.setSideBarWidth = function(v30)
        local l_props_2 = v24.props;
        local v32 = l_join_0(l_props_2.MaterialBrowserLayout, {
            SideBarWidth = v30
        });
        l_props_2.dispatchSetMaterialBrowserLayout(v32);
        l_props_2.PluginController:setMaterialBrowserLayout(v32);
    end;
end;
v23.render = function(v33)
    local l_props_3 = v33.props;
    local l_MaterialBrowser_1 = l_props_3.Stylizer.MaterialBrowser;
    local v36 = l_LayoutOrderIterator_0.new();
    local l_Material_0 = l_props_3.Material;
    local l_MaterialBrowserLayout_0 = l_props_3.MaterialBrowserLayout;
    local l_BaseShowSideBar_0 = l_MaterialBrowserLayout_0.BaseShowSideBar;
    local v40 = true;
    local v41 = if not v22() then l_Material_0 and not l_props_3.DEPRECATED_ActiveAsTool else l_Material_0;
    local v42 = (if l_props_3.ViewType == v21.Grid then l_props_3.MaterialTileSize else l_MaterialBrowser_1.MaterialTileWidth + l_MaterialBrowser_1.Padding * 2) + (not v41 and 0 or l_MaterialBrowser_1.MaterialEditorWidth);
    local v43 = v42 + l_MaterialBrowser_1.MinSideBarWidth;
    local v44 = v43 <= l_props_3.AbsoluteSize.X;
    if not v41 then
        if l_props_3.AbsoluteSize.X < v42 then
            if not l_MaterialBrowserLayout_0.OverrideShowSideBar then
                l_BaseShowSideBar_0 = false;
            else
                v40 = false;
            end;
        end;
    elseif l_props_3.AbsoluteSize.X < v42 then
        l_BaseShowSideBar_0 = false;
        v40 = false;
    elseif l_props_3.AbsoluteSize.X < v43 then
        if not l_MaterialBrowserLayout_0.OverrideShowSideBar then
            l_BaseShowSideBar_0 = false;
        else
            v40 = false;
        end;
    end;
    local v45 = if not l_BaseShowSideBar_0 then nil else v2.createElement(l_Pane_0, {
        LayoutOrder = v36:getNextOrder(), 
        Size = if not v40 and v41 then l_MaterialBrowser_1.MaterialGridSize else UDim2.fromScale(1, 1)
    }, {
        SideBar = v2.createElement(v19, {
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 1
        }), 
        HideButton = v2.createElement(l_IconButton_0, {
            Size = l_MaterialBrowser_1.IconSize, 
            LeftIcon = l_MaterialBrowser_1.HideIcon, 
            IconColor = l_MaterialBrowser_1.IconColor, 
            BorderColor = l_MaterialBrowser_1.BackgroundColor, 
            OnClick = v33.onHideButtonClicked, 
            AnchorPoint = Vector2.new(1, 1), 
            Position = UDim2.new(1, -5, 1, -5), 
            ZIndex = 2
        })
    });
    local v46 = if not v40 then if l_BaseShowSideBar_0 then nil else v2.createElement(l_Pane_0, {
        BackgroundColor = l_MaterialBrowser_1.GridBackgroundColor, 
        LayoutOrder = v36:getNextOrder(), 
        Size = l_MaterialBrowser_1.MaterialGridSize
    }) else v2.createElement(v18, {
        LayoutOrder = v36:getNextOrder(), 
        Size = if v41 or not v44 and l_BaseShowSideBar_0 then l_MaterialBrowser_1.MaterialGridSize else UDim2.fromScale(1, 1), 
        OnShowButtonClicked = v33.onShowButtonClicked, 
        SideBarVisible = l_BaseShowSideBar_0
    });
    local v47 = if not v41 then nil else v2.createElement(v17, {
        LayoutOrder = v36:getNextOrder(), 
        Size = l_MaterialBrowser_1.MaterialEditorSize
    });
    local v48 = l_props_3.AbsoluteSize.X - v42;
    local v49 = if l_MaterialBrowserLayout_0.SideBarWidth < v48 then l_MaterialBrowserLayout_0.SideBarWidth else v48;
    return v2.createElement(l_Pane_0, l_join_0({
        Style = "Box", 
        Layout = Enum.FillDirection.Vertical, 
        VerticalAlignment = Enum.VerticalAlignment.Top, 
        Size = UDim2.fromScale(1, 1)
    }, l_props_3.WrapperProps), {
        TopBar = v2.createElement(v20, {
            Size = l_MaterialBrowser_1.TopBarSize
        }), 
        MainView = if not not v44 and l_BaseShowSideBar_0 then v2.createElement(l_SplitPane_0, {
            ClampSize = true, 
            Sizes = {
                UDim.new(0, v49), 
                UDim.new(1, -v49)
            }, 
            Layout = Enum.FillDirection.Horizontal, 
            MinSizes = {
                UDim.new(0, l_MaterialBrowser_1.MinSideBarWidth), 
                UDim.new(0, v42)
            }, 
            OnSizesChange = function(v50)
                v33.setSideBarWidth(v50[1].Offset);
            end, 
            Size = l_MaterialBrowser_1.MainViewSize
        }, {
            v45, 
            v2.createElement(l_Pane_0, {
                Size = UDim2.fromScale(1, 1), 
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = v36:getNextOrder()
            }, {
                MaterialGrid = v46, 
                MaterialEditor = v47
            })
        }) else v2.createElement(l_Pane_0, {
            Size = l_MaterialBrowser_1.MainViewSize
        }, {
            MainView = v2.createElement(l_Pane_0, {
                Size = UDim2.fromScale(1, 1), 
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = v36:getNextOrder()
            }, {
                SideBar = v45, 
                MaterialGrid = v46, 
                MaterialEditor = v47
            })
        })
    });
end;
return v3.connect(function(v51, _)
    return {
        DEPRECATED_ActiveAsTool = if not v22() then v51.MaterialBrowserReducer.DEPRECATED_ActiveAsTool else nil, 
        Material = v51.MaterialBrowserReducer.Material, 
        MaterialBrowserLayout = v51.MaterialBrowserReducer.MaterialBrowserLayout, 
        MaterialTileSize = v51.MaterialBrowserReducer.MaterialTileSize, 
        ViewType = v51.MaterialBrowserReducer.ViewType
    };
end, function(v53)
    return {
        dispatchSetMaterialBrowserLayout = function(v54)
            v53(v14(v54));
        end
    };
end)(l_withAbsoluteSize_0((l_withContext_0({
    PluginController = v15, 
    Stylizer = l_Stylizer_0
})(v23))));
