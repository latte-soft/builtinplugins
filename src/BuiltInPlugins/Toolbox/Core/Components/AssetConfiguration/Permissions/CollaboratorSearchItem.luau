local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Parent_0.Core.Util.Constants);
local v4 = require(l_Packages_0.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Button_0 = v4.UI.Button;
local v8 = v2.PureComponent:extend("CollaboratorSearchItem");
v8.render = function(v9)
    local l_props_0 = v9.props;
    local l_IsHovered_0 = l_props_0.IsHovered;
    local l_Icon_0 = l_props_0.Icon;
    local l_Name_0 = l_props_0.Name;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_OnActivated_0 = l_props_0.OnActivated;
    local l_Size_0 = l_props_0.Size;
    local l_TextPadding_0 = l_props_0.TextPadding;
    local l_Stylizer_0 = v9.props.Stylizer;
    local l_searchBar_0 = l_Stylizer_0.assetConfig.packagePermissions.searchBar;
    return v2.createElement(l_Button_0, {
        Size = l_Size_0, 
        LayoutOrder = l_LayoutOrder_0, 
        OnClick = l_OnActivated_0
    }, {
        Container = v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.X, 
            LayoutOrder = 0, 
            BackgroundTransparency = 1
        }, {
            UIListLayout = v2.createElement("UIListLayout", {
                SortOrder = Enum.SortOrder.LayoutOrder, 
                FillDirection = Enum.FillDirection.Horizontal
            }), 
            IconFrame = v2.createElement("Frame", {
                BackgroundTransparency = 1, 
                LayoutOrder = 1, 
                Size = UDim2.new(0, 50, 0, 50)
            }, {
                SmallIcon = v2.createElement("Frame", {
                    AnchorPoint = Vector2.new(0.5, 0.5), 
                    BackgroundColor3 = not not l_IsHovered_0 and l_searchBar_0.dropDown.hovered.backgroundColor or l_searchBar_0.dropDown.backgroundColor, 
                    BorderSizePixel = 0, 
                    Position = UDim2.new(0.5, 0, 0.5, 0), 
                    Size = UDim2.new(0, 32, 0, 32)
                }, {
                    Icon = l_Icon_0
                })
            }), 
            TextLabel = v2.createElement("TextLabel", {
                BackgroundTransparency = 1, 
                ClipsDescendants = true, 
                Font = v3.FONT, 
                LayoutOrder = 2, 
                Size = UDim2.new(1, -(not l_IsHovered_0 and 50 or 100), 0, 50), 
                Text = l_Name_0, 
                TextColor3 = l_Stylizer_0.assetConfig.textColor, 
                TextSize = v3.FONT_SIZE_TITLE, 
                TextWrapped = true, 
                TextXAlignment = Enum.TextXAlignment.Left
            }, {
                Padding = v2.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, l_TextPadding_0)
                })
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v8));
