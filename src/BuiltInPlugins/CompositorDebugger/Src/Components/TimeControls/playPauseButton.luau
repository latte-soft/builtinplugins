local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = v3.Style.Stylizer;
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local _ = require(l_Actions_0.SetActiveLayersFilter);
local _ = require(l_Actions_0.SetLayerFilter);
local _ = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = v3.UI.showContextMenu;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v13 = v1.PureComponent:extend("PlayPauseButton");
v13.init = function(_)
end;
v13.render = function(v15)
    local l_props_0 = v15.props;
    local l_Style_0 = l_props_0.Style;
    return v1.createElement("ImageButton", {
        LayoutOrder = l_props_0.LayoutOrder, 
        Size = l_Style_0.ButtonSize, 
        BackgroundTransparency = 1, 
        Image = if not l_props_0.IsPlaying then l_Style_0.Play else l_Style_0.Pause, 
        ImageColor3 = l_Style_0.Color, 
        [v1.Event.Activated] = l_props_0.OnButtonClicked
    });
end;
return (l_withContext_0({
    Analytics = l_ContextServices_0.Analytics, 
    Localization = l_ContextServices_0.Localization, 
    Plugin = l_ContextServices_0.Plugin
})(v13));
