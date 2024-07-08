local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.React);
local v3 = require(l_Parent_0.Packages.ReactRoblox);
local l_ContextServices_0 = v1.ContextServices;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Stylizer_0 = v1.Style.Stylizer;
local l_StyleModifier_0 = v1.Util.StyleModifier;
local l_prioritize_0 = v1.Util.prioritize;
local v10 = require(l_Parent_0.Src.Flags.getFFlagMaterialGeneratorNewUI);
local v11 = v2.PureComponent:extend("TextureItem");
v11.init = function(v12)
    assert(not v10(), "Expected FFlagMaterialGeneratorNewUI to be false");
    v12.mouseEnter = function()
        v12:setState({
            hover = true
        });
    end;
    v12.mouseLeave = function()
        v12:setState({
            hover = false
        });
    end;
end;
v11.render = function(v13)
    local l_props_0 = v13.props;
    local l_TextureItem_0 = l_props_0.Stylizer.TextureItem;
    local l_BackgroundColor_0 = l_TextureItem_0.BackgroundColor;
    local v17 = if not l_props_0.Selected then l_TextureItem_0.BorderColor else l_TextureItem_0.SelectedBorderColor;
    local l_BorderThickness_0 = l_TextureItem_0.BorderThickness;
    local l_CornerRadius_0 = l_TextureItem_0.CornerRadius;
    local v20 = l_prioritize_0(l_props_0.Size, l_TextureItem_0.Size);
    local _ = v13.state.hover;
    return v2.createElement("ImageButton", {
        AutoButtonColor = true, 
        BackgroundColor3 = l_BackgroundColor_0, 
        BorderSizePixel = 0, 
        Image = l_props_0.Image, 
        ImageColor3 = l_TextureItem_0.ImageColor3, 
        LayoutOrder = l_props_0.LayoutOrder, 
        Size = v20, 
        [v3.Event.Activated] = l_props_0.OnClick, 
        [v3.Event.MouseButton2Click] = l_props_0.OnRightClick, 
        [v3.Event.MouseEnter] = v13.mouseEnter, 
        [v3.Event.MouseLeave] = v13.mouseLeave
    }, {
        UICorner = v2.createElement("UICorner", {
            CornerRadius = l_CornerRadius_0
        }), 
        UIStroke = v2.createElement("UIStroke", {
            ApplyStrokeMode = Enum.ApplyStrokeMode.Border, 
            Color = v17, 
            Thickness = l_BorderThickness_0
        })
    });
end;
v11.getDerivedStateFromProps = function(_, v23)
    local v24 = nil;
    if v23.hover then
        v24 = l_StyleModifier_0.Hover;
    end;
    if v24 ~= v23.StyleModifier then
        return {
            StyleModifier = v24 or v2.None
        };
    else
        return nil;
    end;
end;
return l_withContext_0({
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v11);
