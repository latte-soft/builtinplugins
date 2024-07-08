local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local l_UI_0 = v1.UI;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Pane_0 = l_UI_0.Pane;
local l_SearchBar_0 = l_UI_0.SearchBar;
local l_Separator_0 = l_UI_0.Separator;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Stylizer_0 = v1.ContextServices.Stylizer;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
return function(v13)
    local v14 = l_Stylizer_0:use("ImportPage");
    local v15, v16 = v2.useBinding(Vector2.new());
    local v17 = l_LayoutOrderIterator_0.new();
    return v2.createElement(l_Pane_0, {}, {
        Header = v2.createElement(l_Pane_0, {
            Layout = Enum.FillDirection.Horizontal, 
            Style = "SubtleBox", 
            Size = UDim2.new(1, 0, 0, v14.HeaderHeight)
        }, {
            LeftSide = v2.createElement(l_Pane_0, {
                AutomaticSize = Enum.AutomaticSize.X, 
                Layout = Enum.FillDirection.Horizontal, 
                LayoutOrder = v17:getNextOrder(), 
                Size = UDim2.fromScale(0, 1), 
                [v3.Change.AbsoluteSize] = function(v18)
                    v16(v18.AbsoluteSize);
                end
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingRight = UDim.new(0, 4)
                }), 
                GoBackButton = v2.createElement(l_Pane_0, {
                    LayoutOrder = v17:getNextOrder(), 
                    Size = v14.BackButton.Size
                }, {
                    IconButton = v2.createElement(l_IconButton_0, {
                        BackgroundStyle = "None", 
                        IconColor = v14.ArrowColor, 
                        LeftIcon = v14.ArrowImage, 
                        IconScaleType = Enum.ScaleType.Stretch, 
                        IconSize = v14.BackButton.IconSize, 
                        Rotation = -90, 
                        Size = UDim2.fromScale(1, 1), 
                        OnClick = v13.GoBack
                    })
                }), 
                Separator = v2.createElement(l_Separator_0, {
                    DominantAxis = Enum.DominantAxis.Height, 
                    LayoutOrder = v17:getNextOrder(), 
                    Style = "SelectScreenSeparator"
                }), 
                TitleLabel = v2.createElement(l_TextLabel_0, {
                    AutomaticSize = Enum.AutomaticSize.XY, 
                    LayoutOrder = v17:getNextOrder(), 
                    Text = v13.Title
                }, {
                    Padding = v2.createElement("UIPadding", {
                        PaddingLeft = UDim.new(0, 4)
                    })
                })
            }), 
            SearchBar = v2.createElement(l_SearchBar_0, {
                LayoutOrder = v17:getNextOrder(), 
                Size = v15:map(function(v19)
                    return UDim2.new(UDim.new(1, -v19.X), v14.SearchBarHeight);
                end), 
                Text = v13.Search, 
                OnTextChanged = v13.SetSearch
            })
        }), 
        Contents = v2.createElement(l_Pane_0, {
            Position = UDim2.fromOffset(0, v14.HeaderHeight), 
            Size = UDim2.new(1, 0, 1, -v14.HeaderHeight)
        }, v13.children)
    });
end;
