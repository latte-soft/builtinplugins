local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Cryo);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_LinkText_0 = v4.UI.LinkText;
local l_Util_0 = v4.Util;
local l_GetTextSize_0 = l_Util_0.GetTextSize;
local l_LayoutOrderIterator_0 = l_Util_0.LayoutOrderIterator;
local l_StyleModifier_0 = l_Util_0.StyleModifier;
local v12 = require(l_Parent_0.Src.Actions.SetRecentViewToggled);
local v13 = require(l_Parent_0.Src.Actions.SetScreen);
local v14 = require(l_Parent_0.Src.Util.Screens);
local v15 = v2.PureComponent:extend("NavBar");
v15.getCurrentPath = function(v16, v17)
    local v18 = {};
    local l_v17_0 = v17;
    local v20 = v17.Path == v14.MAIN.Path;
    local v21 = not not v16.NavBar.current and v16.NavBar.current.AbsoluteSize.X or 0;
    while v17 ~= nil do
        if v21 < v16.state.contentWidth + 12 then
            v16.preTruncContentWidth = v16.state.contentWidth;
            if not (v17.Path == l_v17_0.Path and not v20 or v16.truncatedPathParts[v17.Path]) then
                v16.truncatedPathParts[v17.Path] = true;
            end;
        elseif v16.preTruncContentWidth + 12 <= v21 then
            v16.truncatedPathParts = {};
        end;
        table.insert(v18, 1, v17);
        v17 = v14[v17.Parent];
    end;
    return v18;
end;
v15.buildPathComponents = function(v22, v23, v24, v25, v26)
    local v27 = {};
    local l_CurrentScreen_0 = v23.CurrentScreen;
    local l_RecentViewToggled_0 = v23.RecentViewToggled;
    local l_dispatchSetRecentViewToggled_0 = v23.dispatchSetRecentViewToggled;
    local v31 = v22:getCurrentPath(l_CurrentScreen_0);
    local v32 = 1;
    local v33 = l_LayoutOrderIterator_0.new();
    local l_Path_0 = l_CurrentScreen_0.Path;
    for v35, v36 in ipairs(v31) do
        local v37 = v36.Path == l_Path_0;
        local v38 = not not (v36.Path == v14.MAIN.Path) and (v23.UniverseName ~= "" and v23.UniverseName or v25:getText("NavBar", "GamePlaceholderName")) or v25:getText("Folders", v36.Path);
        local v39 = not not v22.truncatedPathParts[v36.Path] and Enum.TextTruncate.AtEnd or nil;
        local v40 = nil;
        if v22.truncatedPathParts[v36.Path] then
            v40 = UDim2.new(v24.NavBar.TruncatedTextScale, 0, 1, 0);
        end;
        v27[v36.Path] = v2.createElement(l_LinkText_0, {
            Size = v40, 
            Text = v38, 
            Style = "NavBar", 
            StyleModifier = not not v37 and l_StyleModifier_0.Disabled or v2.None, 
            OnClick = function()
                if not v37 then
                    v26(true, v36);
                    if l_RecentViewToggled_0 then
                        l_dispatchSetRecentViewToggled_0(false);
                    end;
                end;
            end, 
            TextTruncate = v39, 
            LayoutOrder = v33:getNextOrder()
        });
        if v35 ~= #v31 then
            local v41 = l_GetTextSize_0(">", v24.FontSizeLarge, v24.Font);
            v27["PathSeparator-" .. v32] = v2.createElement("TextLabel", {
                Size = UDim2.fromOffset(v41.X, v41.Y), 
                BackgroundTransparency = 1, 
                Text = ">", 
                TextColor3 = v24.TextColor, 
                TextSize = v24.FontSizeLarge, 
                Font = v24.Font, 
                LayoutOrder = v33:getNextOrder(), 
                TextXAlignment = Enum.TextXAlignment.Center, 
                TextYAlignment = Enum.TextYAlignment.Bottom
            });
        end;
        if l_Path_0 == v14.MAIN.Path then
            local v42 = "[" .. v25:getText("NavBar", "ID", {
                gameId = game.GameId
            }) .. "]";
            local v43 = l_GetTextSize_0(v42, v24.FontSizeMedium, v24.Font);
            v27.UniverseId = v2.createElement("TextBox", {
                Size = UDim2.fromOffset(v43.X, v43.Y), 
                LayoutOrder = v33:getNextOrder(), 
                BackgroundTransparency = 1, 
                Text = v42, 
                TextColor3 = v24.SubTextColor, 
                TextSize = v24.FontSizeSmall, 
                Font = v24.Font, 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextEditable = false, 
                ClearTextOnFocus = false
            });
        end;
        v32 = v32 + 1;
    end;
    return v27;
end;
v15.init = function(v44)
    v44.state = {
        contentWidth = 0, 
        currentScreen = ""
    };
    v44.preTruncContentWidth = 0;
    v44.truncatedPathParts = {};
    v44.Layout = v2.createRef();
    v44.NavBar = v2.createRef();
end;
v15.didMount = function(v45)
    v45:setState({
        contentWidth = not not v45.Layout.current and v45.Layout.current.AbsoluteContentSize.X or 0
    });
end;
v15.didUpdate = function(v46)
    local l_CurrentScreen_1 = v46.props.CurrentScreen;
    if l_CurrentScreen_1 ~= v46.state.currentScreen then
        v46:setState({
            currentScreen = l_CurrentScreen_1, 
            contentWidth = not not v46.Layout.current and v46.Layout.current.AbsoluteContentSize.X or 0
        });
    end;
end;
v15.render = function(v48)
    local l_props_0 = v48.props;
    local l_Localization_0 = v48.props.Localization;
    local l_Stylizer_0 = l_props_0.Stylizer;
    return (v2.createElement("Frame", {
        Size = l_props_0.Size, 
        LayoutOrder = l_props_0.LayoutOrder, 
        BackgroundColor3 = l_Stylizer_0.NavBar.BackgroundColor, 
        BorderSizePixel = 0, 
        [v2.Change.AbsoluteSize] = function()
            v48:setState({
                contentWidth = not not v48.Layout.current and v48.Layout.current.AbsoluteContentSize.X or 0
            });
        end, 
        [v2.Ref] = v48.NavBar
    }, (v1.Dictionary.join({
        GameBarLayout = v2.createElement("UIListLayout", {
            Padding = UDim.new(0, l_Stylizer_0.NavBar.Padding), 
            FillDirection = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left, 
            VerticalAlignment = Enum.VerticalAlignment.Center, 
            SortOrder = Enum.SortOrder.LayoutOrder, 
            [v2.Ref] = v48.Layout
        }), 
        GameBarPadding = v2.createElement("UIPadding", {
            PaddingLeft = UDim.new(0, l_Stylizer_0.NavBar.Padding)
        })
    }, (v48:buildPathComponents(l_props_0, l_Stylizer_0, l_Localization_0, l_props_0.dispatchSetScreen))))));
end;
return v3.connect(function(v52, _)
    return {
        UniverseName = v52.AssetManagerReducer.universeName, 
        CurrentScreen = (v52.Screen or {}).currentScreen, 
        RecentViewToggled = v52.AssetManagerReducer.recentViewToggled
    };
end, function(v54)
    return {
        dispatchSetRecentViewToggled = function(v55)
            v54(v12(v55));
        end, 
        dispatchSetScreen = function(v56, v57)
            if v56 then
                v54(v13(v57));
            end;
        end
    };
end)((l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v15)));
