local l_Packages_0 = script:FindFirstAncestor("Toolbox").Packages;
local v1 = require(l_Packages_0.Framework);
local v2 = require(l_Packages_0.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_HoverArea_0 = v1.UI.HoverArea;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = v2.PureComponent:extend("SearchPill");
v6.init = function(v7)
    v7.state = {
        isHovered = false
    };
    v7.onMouseEnter = function()
        v7:setState(function(v8)
            if v8.isHovered then
                return v8;
            else
                return {
                    isHovered = true
                };
            end;
        end);
    end;
    v7.onMouseLeave = function()
        v7:setState(function(v9)
            if not v9.isHovered then
                return v9;
            else
                return {
                    isHovered = false
                };
            end;
        end);
    end;
    v7.onClick = function()
        local l_props_0 = v7.props;
        if l_props_0.OnClick ~= nil then
            l_props_0.OnClick(l_props_0.Text);
        end;
    end;
end;
v6.render = function(v11)
    local l_props_1 = v11.props;
    local l_Stylizer_0 = l_props_1.Stylizer;
    local l_AutomaticSize_0 = l_props_1.AutomaticSize;
    local l_LayoutOrder_0 = l_props_1.LayoutOrder;
    local l_OnClick_0 = l_props_1.OnClick;
    local l_Size_0 = l_props_1.Size;
    local l_Text_0 = l_props_1.Text;
    local l_isHovered_0 = v11.state.isHovered;
    local l_searchPill_0 = l_Stylizer_0.searchPill;
    local v21 = nil;
    v21 = if not l_isHovered_0 then l_searchPill_0.backgroundColor else l_searchPill_0.backgroundColorHovered;
    local v22 = if not l_Size_0 then l_searchPill_0.padding.left + l_searchPill_0.padding.right else 0;
    return v2.createElement("TextButton", {
        AutomaticSize = l_AutomaticSize_0, 
        AutoButtonColor = false, 
        BackgroundColor3 = v21, 
        ClipsDescendants = true, 
        Font = l_searchPill_0.font, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = l_Size_0, 
        Text = l_Text_0, 
        TextColor3 = l_searchPill_0.textColor, 
        TextSize = l_searchPill_0.textSize, 
        [v2.Event.Activated] = v11.onClick, 
        [v2.Event.MouseEnter] = v11.onMouseEnter, 
        [v2.Event.MouseLeave] = v11.onMouseLeave
    }, {
        UICorner = v2.createElement("UICorner", {
            CornerRadius = UDim.new(0, 14)
        }), 
        UIPadding = v2.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, l_searchPill_0.padding.bottom), 
            PaddingLeft = UDim.new(0, v22), 
            PaddingRight = UDim.new(0, v22), 
            PaddingTop = UDim.new(0, l_searchPill_0.padding.top)
        }), 
        HoverArea = l_OnClick_0 and v2.createElement(l_HoverArea_0, {
            Cursor = "PointingHand", 
            Size = UDim2.new(1, 0, 1, 0)
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v6));
