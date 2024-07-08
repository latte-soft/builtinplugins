local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ShowOnTop_0 = v2.UI.ShowOnTop;
local l_DropShadow_0 = v2.UI.DropShadow;
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v7 = v1.PureComponent:extend("BaseToast");
v7.render = function(v8)
    local l_props_0 = v8.props;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local l_toastTheme_0 = l_Stylizer_0.toastTheme;
    local l_AnchorPoint_0 = l_props_0.AnchorPoint;
    local l_Size_0 = l_props_0.Size;
    local v14 = l_props_0.Transparency or 0;
    local v15 = nil;
    v15 = l_AnchorPoint_0.X == 0 and 28 or (l_AnchorPoint_0.X == 1 and -28 or 0);
    local _ = nil;
    return v1.createElement(l_ShowOnTop_0, {
        Priority = -1
    }, {
        Container = v1.createElement("Frame", {
            AnchorPoint = l_AnchorPoint_0, 
            Size = l_Size_0, 
            Position = UDim2.new(l_AnchorPoint_0.X, v15, l_AnchorPoint_0.Y, l_AnchorPoint_0.Y == 0 and 28 or (l_AnchorPoint_0.Y == 1 and -28 or 0)), 
            BackgroundTransparency = 1
        }, {
            Background = v1.createElement("Frame", {
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = l_Stylizer_0.backgroundColor, 
                BackgroundTransparency = v14, 
                BorderSizePixel = 0, 
                ZIndex = 2
            }, {
                Shadow = v1.createElement(l_DropShadow_0, {
                    Transparency = l_toastTheme_0.shadowTransparency + (1 - l_toastTheme_0.shadowTransparency) * v14, 
                    Color = l_toastTheme_0.shadowColor, 
                    Radius = l_toastTheme_0.shadowSize, 
                    Offset = Vector2.new()
                }, l_props_0[v1.Children])
            })
        })
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer
})(v7));
