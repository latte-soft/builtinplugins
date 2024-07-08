local l_Packages_0 = script.Parent.Parent.Parent.Parent.Packages;
local v1 = require(l_Packages_0.Roact);
local v2 = require(l_Packages_0.Framework);
local l_LinkText_0 = v2.UI.LinkText;
local l_Pane_0 = v2.UI.Pane;
local v5 = require(l_Packages_0.Dash);
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_withAbsoluteSize_0 = v2.Wrappers.withAbsoluteSize;
local l_ContextServices_0 = require(l_Packages_0.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v10 = v1.PureComponent:extend("SectionHeader");
v10.defaultProps = {
    Title = "", 
    ShowSeeAllText = true
};
v10.init = function(v11)
    v11.hostRef = v1.createRef();
    v11.seeAllRef = v1.createRef();
    v11.frameRef = v1.createRef();
end;
v10.render = function(v12)
    local l_props_0 = v12.props;
    local l_AbsoluteSize_0 = l_props_0.AbsoluteSize;
    local l_IsResponsive_0 = l_props_0.IsResponsive;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_OnClickSeeAll_0 = l_props_0.OnClickSeeAll;
    local l_Position_0 = l_props_0.Position;
    local v19 = l_props_0.SeeAllText or l_props_0.Localization:getText("HomeView", "SeeAll") .. " >";
    local l_ShowSeeAllText_0 = l_props_0.ShowSeeAllText;
    local l_sectionHeader_0 = l_props_0.Stylizer.sectionHeader;
    local l_Title_0 = l_props_0.Title;
    local l_WrapperProps_0 = l_props_0.WrapperProps;
    local v24 = if not l_AbsoluteSize_0 then nil else l_IsResponsive_0 and l_AbsoluteSize_0.X < 300;
    local v25 = not v24 and 1 or 0;
    local v26 = if not not v12.seeAllRef.current and v12.hostRef.current then UDim2.new(0, v12.hostRef.current.AbsoluteSize.X - v12.seeAllRef.current.AbsoluteSize.X, v25, 0) else UDim2.new(0.6, 0, v25, 0);
    local v27 = l_LayoutOrderIterator_0.new();
    return v1.createElement(l_Pane_0, v5.join({
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1, 
        HorizontalAlignment = if not v24 then nil else Enum.HorizontalAlignment.Left, 
        Layout = if not v24 then nil else Enum.FillDirection.Vertical, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = UDim2.new(1, 0, 0, 0), 
        Spacing = not v24 and 0 or 5, 
        Position = l_Position_0, 
        [v1.Change.AbsoluteSize] = v12.onAbsoluteSizeChange, 
        [v1.Ref] = v12.frameRef
    }, l_WrapperProps_0), {
        Title = v1.createElement("TextLabel", {
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            Font = l_sectionHeader_0.font, 
            LayoutOrder = v27:getNextOrder(), 
            Position = UDim2.new(0, 0, 0, 0), 
            Size = v26, 
            Text = l_Title_0, 
            TextColor3 = l_sectionHeader_0.textColor, 
            TextSize = l_sectionHeader_0.textSize, 
            TextXAlignment = Enum.TextXAlignment.Left, 
            [v1.Ref] = v12.hostRef
        }), 
        SeeAll = l_ShowSeeAllText_0 and v1.createElement("Frame", {
            AnchorPoint = Vector2.new(1, 0), 
            AutomaticSize = Enum.AutomaticSize.XY, 
            BackgroundTransparency = 1, 
            LayoutOrder = v27:getNextOrder(), 
            Position = UDim2.new(1, 0, 0, 0)
        }, {
            SeeAllButton = v1.createElement(l_LinkText_0, {
                OnClick = l_OnClickSeeAll_0, 
                Style = "Unobtrusive", 
                Text = v19, 
                TextSize = l_props_0.SeeAllTextSize
            })
        })
    });
end;
return l_withAbsoluteSize_0((l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v10)));
