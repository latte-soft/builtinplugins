local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_Parent_0.Src.ContextItems);
local v6 = v2.PureComponent:extend(script.Name);
v6.init = function(v7)
    v7.onClick = function()
        v7.props.OnClick(v7.props.TabId);
    end;
end;
v6.render = function(v8)
    local v9 = v8.props.Theme:get();
    local v10 = v8.props.Localization:getText("Tab", v8.props.TabId);
    local l_LayoutOrder_0 = v8.props.LayoutOrder;
    local l_Size_0 = v8.props.Size;
    local l_IsCurrent_0 = v8.props.IsCurrent;
    local v14 = nil;
    local v15 = nil;
    if not l_IsCurrent_0 then
        v14 = v9.tabTheme.otherTabSize;
        v15 = v9.tabTheme.otherTabOffset;
    else
        v14 = v9.tabTheme.currentTabSize;
        v15 = v9.tabTheme.currentTabOffset;
    end;
    return v2.createElement("Frame", {
        Size = l_Size_0, 
        BackgroundColor3 = v9.borderColor, 
        LayoutOrder = l_LayoutOrder_0, 
        BorderSizePixel = 0
    }, {
        TabButton = v2.createElement("TextButton", {
            Text = v10, 
            Font = v9.font, 
            TextSize = v9.textSize, 
            TextColor3 = v9.textColor, 
            Size = v14, 
            Position = v15, 
            BackgroundColor3 = v9.backgroundColor, 
            BorderSizePixel = 0, 
            [v2.Event.Activated] = v8.onClick
        })
    });
end;
return (l_withContext_0({
    Theme = v5.DEPRECATED_Theme, 
    Localization = l_ContextServices_0.Localization
})(v6));
