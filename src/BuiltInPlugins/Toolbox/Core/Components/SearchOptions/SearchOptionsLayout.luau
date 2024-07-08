local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.RoactRodux);
local v4 = require(l_Packages_0.Framework);
local v5 = require(l_script_FirstAncestor_0.Core.Networking.Requests.SearchWithOptions);
local v6 = require(l_script_FirstAncestor_0.Core.Util.Constants);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v9 = require(l_script_FirstAncestor_0.Core.ContextServices.ModalContext);
local v10 = require(l_script_FirstAncestor_0.Core.ContextServices.Settings);
local v11 = require(l_script_FirstAncestor_0.Core.ContextServices.NetworkContext);
local v12 = require(l_Packages_0.Dash);
local l_GetTextSize_0 = v4.Util.GetTextSize;
local l_LayoutOrderIterator_0 = v4.Util.LayoutOrderIterator;
local l_withAbsoluteSize_0 = v4.Wrappers.withAbsoluteSize;
local l_Button_0 = v4.UI.Button;
local l_HoverArea_0 = v4.UI.HoverArea;
local l_LinkText_0 = v4.UI.LinkText;
local l_Pane_0 = v4.UI.Pane;
local l_ShowOnTop_0 = v4.UI.ShowOnTop;
local l_ScrollingFrame_0 = v4.UI.ScrollingFrame;
local v22 = Vector2.new(17, 6);
local v23 = Color3.fromRGB(0, 0, 0);
local v24 = v6.TAB_WIDGET_HEIGHT + v6.HEADER_HEIGHT;
local v25 = v2.PureComponent:extend("SearchOptionsLayout");
v25.init = function(v26, _)
    v26.state = {};
    v26.layoutRef = v2.createRef();
    v26.cancel = function()
        v26.props.OnClose();
    end;
    v26.mouseEnter = function()
        v26.props.Modal.onSearchOptionsMouse(true);
    end;
    v26.mouseLeave = function()
        v26.props.Modal.onSearchOptionsMouse(false);
    end;
    v26.onReset = function()
        v26.props.OnReset();
    end;
    v26.onSubmit = function()
        v26.search(v26.props.GetSearchOptions());
    end;
    v26.search = function(v28)
        local l_props_0 = v26.props;
        l_props_0.searchWithOptions(l_props_0.Network.networkInterface, l_props_0.Settings:get("Plugin"), v28);
        v26.cancel();
    end;
    v26.updateContentsSize = function(v30)
        v26:setState({
            contentSize = v30
        });
    end;
end;
v25.render = function(v31)
    local l_props_1 = v31.props;
    local l_state_0 = v31.state;
    local l_AbsoluteSize_0 = l_props_1.AbsoluteSize;
    local l_Localization_0 = l_props_1.Localization;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_contentSize_0 = l_state_0.contentSize;
    local l_searchOptions_0 = l_Stylizer_0.searchOptions;
    local v39 = l_Localization_0:getText("General", "SearchOptionsDone");
    local v40 = l_GetTextSize_0(v39, nil, nil, Vector2.new(0, 0));
    local v41 = true;
    local v42 = UDim2.new(1, 0, 1, 0);
    if l_contentSize_0 then
        local v43 = l_AbsoluteSize_0.Y - (v24 + 40);
        local v44 = l_contentSize_0.Y + 42;
        if v44 < v43 then
            v42 = UDim2.new(1, 0, 0, v44);
            v41 = false;
        end;
    end;
    local v45 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_ShowOnTop_0, {
        Priority = 2
    }, {
        ClickEventDetectFrame = v2.createElement("ImageButton", {
            AutoButtonColor = false, 
            BackgroundTransparency = 0.25, 
            BackgroundColor3 = v23, 
            Size = UDim2.fromScale(1, 1), 
            ZIndex = 10, 
            [v2.Event.Activated] = v31.cancel
        }, {
            MainPositioning = v2.createElement(l_Pane_0, v12.join({
                AnchorPoint = Vector2.new(1, 0), 
                Position = UDim2.new(1, -4, 0, v24 + 4), 
                Size = UDim2.new(0, v6.TOOLBOX_MIN_WIDTH, 1, -((v24 + 8) + 42))
            }, l_props_1.WrapperProps), {
                Contents = v2.createElement(l_Pane_0, {
                    BackgroundColor = l_searchOptions_0.background, 
                    OnClick = function()
                    end, 
                    Size = v42, 
                    Style = "BorderBox", 
                    [v2.Event.MouseEnter] = v31.mouseEnter, 
                    [v2.Event.MouseLeave] = v31.mouseLeave
                }, {
                    Container = v2.createElement(l_ScrollingFrame_0, {
                        AutoSizeCanvas = true, 
                        AutoSizeLayoutOptions = {
                            SortOrder = Enum.SortOrder.LayoutOrder
                        }, 
                        Layout = Enum.FillDirection.Vertical, 
                        OnCanvasResize = v31.updateContentsSize, 
                        Position = UDim2.new(0, 0, 0, 0), 
                        Size = UDim2.new(1, 0, 1, -42)
                    }, {
                        Padding = v2.createElement("UIPadding", {
                            PaddingLeft = UDim.new(0, 10), 
                            PaddingRight = UDim.new(0, 10), 
                            PaddingTop = UDim.new(0, 10), 
                            PaddingBottom = UDim.new(0, 20)
                        }), 
                        Content = v2.createElement(l_Pane_0, {
                            AutomaticSize = Enum.AutomaticSize.XY, 
                            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
                            Layout = Enum.FillDirection.Vertical, 
                            Spacing = 0, 
                            Size = UDim2.fromScale(1, 0)
                        }, v31.props[v2.Children]), 
                        ExtraPadding = v2.createElement("Frame", {
                            BackgroundTransparency = 1, 
                            Size = UDim2.new(1, 0, 0, 10), 
                            LayoutOrder = v45:getNextOrder()
                        })
                    }), 
                    BottomButtonsContainer = v2.createElement(l_Pane_0, {
                        Padding = {
                            Left = 10, 
                            Right = 10
                        }, 
                        Position = UDim2.new(0, 0, 1, -42), 
                        Spacing = 20, 
                        Size = UDim2.new(1, 0, 0, 42), 
                        ZIndex = 3
                    }, {
                        GradientOverlay = v41 and v2.createElement("Frame", {
                            LayoutOrder = v45:getNextOrder(), 
                            Size = UDim2.new(1, -8, 0, 20), 
                            Position = UDim2.new(0, 0, 0, -20), 
                            BackgroundColor3 = Color3.new(1, 1, 1), 
                            BorderColor3 = Color3.new(1, 1, 1)
                        }, {
                            Gradient = v2.createElement("UIGradient", {
                                Color = ColorSequence.new(l_searchOptions_0.background), 
                                Rotation = 90, 
                                Transparency = NumberSequence.new({
                                    NumberSequenceKeypoint.new(0, 1), 
                                    NumberSequenceKeypoint.new(1, 0.25)
                                })
                            })
                        }), 
                        Footer = v2.createElement(l_Pane_0, {
                            AutomaticSize = Enum.AutomaticSize.Y, 
                            AnchorPoint = Vector2.new(0, 1), 
                            HorizontalAlignment = Enum.HorizontalAlignment.Right, 
                            VerticalAlignment = Enum.VerticalAlignment.Center, 
                            Layout = Enum.FillDirection.Horizontal, 
                            OnClick = v31.footerButtonClicked, 
                            Padding = {
                                Bottom = 8
                            }, 
                            Position = UDim2.new(0, 0, 1, 0), 
                            Size = UDim2.new(1, 0, 0, 0), 
                            Spacing = 20
                        }, {
                            CancelButton = v2.createElement(l_LinkText_0, {
                                AutomaticSize = Enum.AutomaticSize.XY, 
                                LayoutOrder = v45:getNextOrder(), 
                                OnClick = v31.onReset, 
                                Text = l_Localization_0:getText("General", "SearchOptionsResetAll")
                            }), 
                            ApplyButton = v2.createElement(l_Button_0, {
                                LayoutOrder = v45:getNextOrder(), 
                                OnClick = v31.onSubmit, 
                                Style = "RoundPrimary", 
                                Size = UDim2.fromOffset(v40.X + v22.X * 2, v40.Y + v22.Y * 2), 
                                Text = v39
                            }, {
                                HoverArea = v2.createElement(l_HoverArea_0, {
                                    Cursor = "PointingHand"
                                })
                            })
                        })
                    })
                })
            })
        })
    });
end;
return l_withAbsoluteSize_0((v3.connect(nil, function(v46)
    return {
        searchWithOptions = function(v47, v48, v49)
            v46(v5(v47, v48, v49));
        end
    };
end)((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Modal = v9, 
    Network = v11, 
    Stylizer = l_ContextServices_0.Stylizer, 
    Settings = v10
})(v25)))));
