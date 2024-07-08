local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Parent_0.Core.Util.Layouter);
local _ = require(l_Parent_0.Core.Util.Constants);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_LoadingIndicator_0 = v3.UI.LoadingIndicator;
local l_Categorization_0 = l_Parent_0.Core.Components.Categorization;
local v10 = require(l_Categorization_0.SectionHeader);
local v11 = require(l_Categorization_0.HorizontalList);
local v12 = v2.PureComponent:extend("Swimlane");
v12.defaultProps = {
    AutomaticSize = Enum.AutomaticSize.Y, 
    Size = UDim2.new(1, 0, 0, 0), 
    ShowTotal = false
};
v12.init = function(v13)
    v13.ref = v2.createRef();
    v13.state = {
        DisplayCount = 0
    };
    v13.onAbsoluteSizeChange = function(v14)
        v13:setState({
            DisplayCount = v4.getAssetsPerRow(v14.AbsoluteSize.X)
        });
    end;
end;
v12.didMount = function(v15)
    if v15.ref.current then
        v15.onAbsoluteSizeChange(v15.ref.current);
    end;
end;
v12.render = function(v16)
    local l_props_0 = v16.props;
    local l_Data_0 = l_props_0.Data;
    local l_AutomaticSize_0 = l_props_0.AutomaticSize;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_ShowTotal_0 = l_props_0.ShowTotal;
    local l_SeeAllTextSize_0 = l_props_0.SeeAllTextSize;
    local l_Size_0 = l_props_0.Size;
    local l_Title_0 = l_props_0.Title;
    local l_Total_0 = l_props_0.Total;
    local l_OnClickSeeAll_0 = l_props_0.OnClickSeeAll;
    local l_OnRenderItem_0 = l_props_0.OnRenderItem;
    local l_Localization_0 = l_props_0.Localization;
    local l_ZIndex_0 = l_props_0.ZIndex;
    local l_IsLoading_0 = l_props_0.IsLoading;
    local l_IsHeaderResponsive_0 = l_props_0.IsHeaderResponsive;
    local l_DisplayCount_0 = v16.state.DisplayCount;
    local v33 = not l_Total_0 and true or l_DisplayCount_0 < l_Total_0;
    local _ = nil;
    return v2.createElement("Frame", {
        AutomaticSize = l_AutomaticSize_0, 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = l_Size_0, 
        ZIndex = l_ZIndex_0, 
        [v2.Change.AbsoluteSize] = v16.onAbsoluteSizeChange, 
        [v2.Ref] = v16.ref
    }, {
        Layout = v2.createElement("UIListLayout", {
            Padding = UDim.new(0, 10), 
            SortOrder = Enum.SortOrder.LayoutOrder
        }), 
        Header = v2.createElement(v10, {
            IsResponsive = l_IsHeaderResponsive_0, 
            LayoutOrder = 1, 
            OnClickSeeAll = l_OnClickSeeAll_0, 
            SeeAllText = if not not l_Total_0 and l_ShowTotal_0 then l_Localization_0:getText("HomeView", "Results", {
                total = tostring(l_Total_0)
            }) else nil, 
            ShowSeeAllText = v33, 
            SeeAllTextSize = l_SeeAllTextSize_0, 
            Title = l_Title_0, 
            Total = l_Total_0
        }), 
        SectionContents = if not l_IsLoading_0 then v2.createElement("Frame", {
            AutomaticSize = Enum.AutomaticSize.Y, 
            BackgroundTransparency = 1, 
            Position = UDim2.new(0, 0, 0, 0), 
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, 0)
        }, v2.createElement(v11, {
            Data = l_Data_0, 
            DisplayCount = l_DisplayCount_0, 
            OnRenderItem = l_OnRenderItem_0
        })) else v2.createElement("Frame", {
            BackgroundColor3 = Color3.new(0, 0, 0), 
            BackgroundTransparency = 0.8, 
            LayoutOrder = 2, 
            Size = UDim2.new(1, 0, 0, 100)
        }, {
            UICorner = v2.createElement("UICorner", {
                CornerRadius = UDim.new(0, 5)
            }), 
            Loading = v2.createElement(l_LoadingIndicator_0, {
                Size = UDim2.new(0, 90, 0, 30), 
                AnchorPoint = Vector2.new(0.5, 0.5), 
                Position = UDim2.new(0.5, 0, 0.5, 0)
            })
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v12));
