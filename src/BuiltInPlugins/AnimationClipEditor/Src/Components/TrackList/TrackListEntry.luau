local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local l_ContextServices_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v4 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local v5 = v1.PureComponent:extend("TrackListEntry");
v5.render = function(v6)
    local l_props_0 = v6.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local v10 = l_props_0.Indent or 0;
    local l_Height_0 = l_props_0.Height;
    local l_Primary_0 = l_props_0.Primary;
    local l_ShowBackground_0 = l_props_0.ShowBackground;
    local l_Selected_0 = l_props_0.Selected;
    local l_trackTheme_0 = l_Stylizer_0.trackTheme;
    local v16 = nil;
    if not l_Primary_0 then
        if not l_ShowBackground_0 then
            if l_Selected_0 then
                v16 = l_trackTheme_0.selectedBackgroundColor;
            end;
        else
            v16 = l_trackTheme_0.titleBackgroundColor;
        end;
    else
        v16 = l_trackTheme_0.primaryBackgroundColor;
    end;
    local v17 = l_props_0[v1.Children] or {};
    v17.Padding = v1.createElement("UIPadding", {
        PaddingLeft = UDim.new(0, v4.INDENT_PADDING * v10)
    });
    return v1.createElement("Frame", {
        Size = UDim2.new(1, 0, 0, l_Height_0), 
        BorderSizePixel = 0, 
        BackgroundColor3 = v16, 
        BackgroundTransparency = not v16 and 1 or 0, 
        LayoutOrder = l_LayoutOrder_0
    }, v17);
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v5));
