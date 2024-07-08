local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Image_0 = l_UI_0.Image;
local v8 = require(script.Parent.PreviewModelComponent);
local v9 = v1.PureComponent:extend("DisplayAvatarsComponent");
v9.render = function(v10)
    local l_props_0 = v10.props;
    local l_Model1_0 = l_props_0.Model1;
    local l_Model2_0 = l_props_0.Model2;
    local l_Animation1_0 = l_props_0.Animation1;
    local l_Animation2_0 = l_props_0.Animation2;
    local l_Stylizer_1 = l_props_0.Stylizer;
    local l_Loaded_0 = l_props_0.Loaded;
    local l_PreviewWindowSize_0 = l_Stylizer_1.PreviewWindowSize;
    return v1.createElement(l_Pane_0, {}, {
        OriginalPreview = v1.createElement(v8, {
            Size = l_PreviewWindowSize_0, 
            Model = l_Model1_0, 
            AnimationId = l_Animation1_0, 
            Loaded = l_Loaded_0, 
            Label = "R6"
        }), 
        Arrow = v1.createElement(l_Image_0, {
            Size = l_Stylizer_1.Arrow.Size, 
            Position = l_Stylizer_1.Arrow.Position, 
            Image = l_Stylizer_1.Arrow.Image, 
            ImageRectSize = l_Stylizer_1.Arrow.ImageRectSize, 
            ImageRectOffset = l_Stylizer_1.Arrow.Offset, 
            ImageColor3 = l_Stylizer_1.Arrow.Color
        }), 
        SuggestedPreview = v1.createElement(v8, {
            Size = l_PreviewWindowSize_0, 
            Position = l_Stylizer_1.PreviewWindowPosition, 
            Model = l_Model2_0, 
            AnimationId = l_Animation2_0, 
            Loaded = l_Loaded_0, 
            Label = "R15"
        })
    });
end;
return (l_ContextServices_0.withContext({
    Stylizer = l_Stylizer_0
})(v9));
