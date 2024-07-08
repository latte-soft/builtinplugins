local l_Parent_0 = script.Parent.Parent.Parent;
local l_Packages_0 = l_Parent_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_Parent_0.Core.Util.Constants);
local v5 = require(l_Parent_0.Core.ContextServices.IXPContext);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_GetTextSize_0 = v3.Util.GetTextSize;
local v9 = require(l_Parent_0.Core.Components.Tab);
local v10 = require(l_Parent_0.Core.Util.SharedFlags.getFFlagToolboxContentManagementCombineTabs);
local v11 = require(l_Parent_0.Core.Util.SharedFlags.getIsIXPEnabledForListView);
local v12 = v2.PureComponent:extend("TabSet");
v12.init = function(v13)
    v13.state = {
        currentWidth = 0
    };
    v13.tabSetRef = v2.createRef();
    v13.onAbsoluteSizeChange = function()
        local l_x_0 = v13.tabSetRef.current.AbsoluteSize.x;
        if v13.state.currentWidth ~= l_x_0 then
            v13:setState({
                currentWidth = l_x_0
            });
        end;
    end;
    v13.onTabSelected = function(v15)
        if v13.props.onTabSelected then
            v13.props.onTabSelected(v15);
        end;
    end;
end;
v12.resetLayout = function(v16)
    v16.currentLayout = 0;
end;
v12.nextLayout = function(v17)
    v17.currentLayout = v17.currentLayout + 1;
    return v17.currentLayout;
end;
v12.createTab = function(v18, v19, v20, v21, v22, v23, v24, v25)
    return v2.createElement(v9, {
        Disabled = v25, 
        LayoutOrder = v18:nextLayout(), 
        Image = v22, 
        Text = v21, 
        Selected = v19 == v20, 
        TabWidth = v23, 
        DisplayText = if not not v10() and v11(v18.props.IXP) then nil else v24, 
        onClick = function()
            v18.onTabSelected(v19);
        end
    });
end;
local function _(v26, v27)
    return #v26 > 0 and v27 / #v26 or 0;
end;
local function _(v29)
    return ((l_GetTextSize_0(v29, nil, v4.FONT_BOLD, Vector2.new(0, 0)).X + v4.TAB_ICON_SIZE) + v4.TAB_INNER_PADDING) + v4.TAB_OUTER_PADDING * 2;
end;
local function v35(v31, v32)
    if #v31 > 0 then
        for _, v34 in ipairs(v31) do
            if v32 < ((l_GetTextSize_0(v34.Text, nil, v4.FONT_BOLD, Vector2.new(0, 0)).X + v4.TAB_ICON_SIZE) + v4.TAB_INNER_PADDING) + v4.TAB_OUTER_PADDING * 2 then
                return false;
            end;
        end;
    end;
    return true;
end;
v12.render = function(v36)
    local l_Stylizer_0 = v36.props.Stylizer;
    local v38 = v36.props.Size or UDim2.new();
    local v39 = v36.props.Position or UDim2.new();
    local v40 = v36.props.Tabs or {};
    local l_CurrentTab_0 = v36.props.CurrentTab;
    local l_Disabled_0 = v36.props.Disabled;
    local l_tabSet_0 = l_Stylizer_0.tabSet;
    local l_currentWidth_0 = v36.state.currentWidth;
    v36:resetLayout();
    local v45 = {
        Layout = v2.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }), 
        LeftPadding = v2.createElement("Frame", {
            LayoutOrder = v36:nextLayout(), 
            Size = UDim2.new(0, 1, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_tabSet_0.tabBackground
        })
    };
    local v46 = #v40 > 0 and l_currentWidth_0 / #v40 or 0;
    local v47 = if not not v10() and v11(v36.props.IXP) then nil else v35(v40, v46);
    for _, v49 in ipairs(v40) do
        v45[v49.Key] = v36:createTab(v49.Key, l_CurrentTab_0, v49.Text, v49.Image, v46, v47, l_Disabled_0);
    end;
    v45.RightPadding = v2.createElement("Frame", {
        LayoutOrder = v36:nextLayout(), 
        Size = UDim2.new(1, 0, 1, 0), 
        BorderSizePixel = 0, 
        BackgroundColor3 = l_tabSet_0.tabBackground
    }, {
        LowerBorder = v2.createElement("Frame", {
            Size = UDim2.new(1, 0, 0, 2), 
            AnchorPoint = Vector2.new(0, 1), 
            Position = UDim2.new(0, 0, 1, 0), 
            BorderSizePixel = 0, 
            BackgroundColor3 = l_tabSet_0.borderColor
        })
    });
    return v2.createElement("Frame", {
        Size = v38, 
        Position = v39, 
        BackgroundColor3 = l_tabSet_0.backgroundColor, 
        BorderSizePixel = 0, 
        [v2.Ref] = v36.tabSetRef, 
        [v2.Change.AbsoluteSize] = v36.onAbsoluteSizeChange
    }, v45);
end;
return (l_withContext_0({
    IXP = if not v10() then nil else v5, 
    Stylizer = l_ContextServices_0.Stylizer
})(v12));
