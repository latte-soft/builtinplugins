local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Framework);
local v3 = require(l_Packages_0.Roact);
local v4 = require(l_script_FirstAncestor_0.Core.Components.Categorization.SectionHeader);
local _ = require(l_Packages_0.Dash);
local l_LayoutOrderIterator_0 = v2.Util.LayoutOrderIterator;
local l_Pane_0 = v2.UI.Pane;
local l_ContextServices_0 = v2.ContextServices;
local _ = v2.UI.HoverArea;
local l_withContext_0 = l_ContextServices_0.withContext;
local v11 = v3.PureComponent:extend("ExpandableTeaser");
v11.defaultProps = {
    AlwaysExpanded = false, 
    AutomaticSize = Enum.AutomaticSize.Y, 
    Layout = Enum.FillDirection.Vertical, 
    Size = UDim2.new(1, 0, 0, 0), 
    TeaserSize = Vector2.new(0, 0)
};
v11.init = function(v12)
    v12.contentRef = v3.createRef();
    v12.state = {
        contentSize = Vector2.new(0, 0), 
        isExpanded = false
    };
    v12.toggleContent = function()
        v12:setState(function(v13)
            local l_OnExpandChanged_0 = v12.props.OnExpandChanged;
            local v15 = not v13.isExpanded;
            if l_OnExpandChanged_0 then
                l_OnExpandChanged_0(v15);
            end;
            return {
                isExpanded = v15
            };
        end);
    end;
    v12.onContentSizeChange = function()
        v12:setState(function(_)
            local l_current_0 = v12.contentRef.current;
            if l_current_0 then
                return {
                    contentSize = l_current_0.AbsoluteSize
                };
            else
                return ;
            end;
        end);
    end;
end;
v11.render = function(v18)
    local l_props_0 = v18.props;
    local l_state_0 = v18.state;
    local l_AutomaticSize_0 = l_props_0.AutomaticSize;
    local l_Layout_0 = l_props_0.Layout;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Localization_0 = l_props_0.Localization;
    local l_Size_0 = l_props_0.Size;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_TeaserSize_0 = l_props_0.TeaserSize;
    local l_Title_0 = l_props_0.Title;
    local l_contentSize_0 = l_state_0.contentSize;
    local _ = l_Stylizer_0.searchPill;
    local v31 = l_Localization_0:getText("General", "ShowLess");
    local v32 = l_Localization_0:getText("General", "ShowMore");
    local v33 = l_LayoutOrderIterator_0.new();
    local v34 = nil;
    local v35 = nil;
    local v36 = nil;
    if not l_state_0.isExpanded then
        v35 = v32 .. " +";
        v36 = l_TeaserSize_0;
    else
        v34 = l_AutomaticSize_0;
        v35 = v31 .. " -";
        v36 = l_contentSize_0;
    end;
    local _ = nil;
    return v3.createElement(l_Pane_0, {
        AutomaticSize = l_AutomaticSize_0, 
        Layout = l_Layout_0, 
        LayoutOrder = l_LayoutOrder_0, 
        Size = l_Size_0, 
        Spacing = 5, 
        HorizontalAlignment = Enum.HorizontalAlignment.Left, 
        VerticalAlignment = Enum.VerticalAlignment.Top
    }, {
        SectionHeader = v3.createElement(v4, {
            OnClickSeeAll = v18.toggleContent, 
            LayoutOrder = v33:getNextOrder(), 
            SeeAllText = v35, 
            Title = l_Title_0
        }), 
        Content = v3.createElement(l_Pane_0, {
            AutomaticSize = v34, 
            ClipsDescendants = true, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            Layout = Enum.FillDirection.Vertical, 
            LayoutOrder = v33:getNextOrder(), 
            Size = if l_AutomaticSize_0 == Enum.AutomaticSize.Y then UDim2.new(1, 0, 0, v36.Y) else UDim2.new(0, v36.X, 1, 0), 
            VerticalAlignment = Enum.VerticalAlignment.Top, 
            [v3.Change.AbsoluteSize] = v18.onContentSizeChange, 
            [v3.Ref] = v18.contentRef
        }, v18.props[v3.Children])
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v11));
