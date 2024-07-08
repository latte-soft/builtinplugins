local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_Parent_0.Src.ContextItems);
local _ = require(l_Parent_0.Src.Util.Constants);
local v7 = game:DefineFastFlag("FFlagTerrainEditorFixToolOverlap", false);
local l_TextService_0 = game:GetService("TextService");
local v9 = v2.PureComponent:extend(script.Name);
v9.init = function(v10)
    v10.state = {
        isHovered = false
    };
    v10.mouseEnter = function()
        v10:setState({
            isHovered = true
        });
    end;
    v10.mouseLeave = function()
        v10:setState({
            isHovered = false
        });
    end;
    v10.onClick = function()
        if v10.props.OnClick then
            v10.props.OnClick(v10.props.ToolId);
        end;
    end;
end;
v9.render = function(v11)
    local v12 = v11.props.Theme:get();
    local l_Localization_0 = v11.props.Localization;
    local l_ToolId_0 = v11.props.ToolId;
    local v15 = l_Localization_0:getText("ToolName", l_ToolId_0);
    local l_LayoutOrder_0 = v11.props.LayoutOrder;
    local _ = v11.props.IsUnitTest or false;
    local v18 = v11.props.Stylizer.ToolButton.ToolIcons[l_ToolId_0];
    local l_IsCurrentTool_0 = v11.props.IsCurrentTool;
    local l_isHovered_0 = v11.state.isHovered;
    local v21 = not l_IsCurrentTool_0 and 1 or 0.5;
    if l_isHovered_0 then
        v21 = 0.75;
    end;
    local l_textSize_0 = v12.textSize;
    if v7 and l_TextService_0:GetTextSize(v15, l_textSize_0, v12.font, Vector2.new(0, 0)).X > 75 then
        l_textSize_0 = v12.textSize - 2;
    end;
    return v2.createElement("ImageButton", {
        BorderSizePixel = 1, 
        BackgroundTransparency = v21, 
        LayoutOrder = l_LayoutOrder_0, 
        [v2.Event.MouseEnter] = v11.mouseEnter, 
        [v2.Event.MouseLeave] = v11.mouseLeave, 
        [v2.Event.Activated] = v11.onClick
    }, {
        Image = v2.createElement("ImageLabel", {
            BackgroundTransparency = 1, 
            Image = v18, 
            ScaleType = Enum.ScaleType.Fit, 
            Size = UDim2.new(0, 26, 0, 27), 
            AnchorPoint = Vector2.new(0.5, 0), 
            Position = UDim2.new(0.5, 0, 0, 0)
        }), 
        Text = v2.createElement("TextLabel", {
            BackgroundTransparency = 1, 
            Text = v15, 
            Font = v12.font, 
            TextSize = if not v7 then v12.textSize else l_textSize_0, 
            TextXAlignment = Enum.TextXAlignment.Center, 
            TextColor3 = v12.textColor, 
            Size = UDim2.new(1, 0, 0, 15), 
            Position = UDim2.new(0, 0, 1, -15)
        })
    });
end;
return (l_withContext_0({
    Theme = v5.DEPRECATED_Theme, 
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v9));
