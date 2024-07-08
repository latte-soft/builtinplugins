local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_Parent_0.Src.Util.Constants);
local l_Parent_1 = script.Parent.Parent;
local v7 = require(l_Parent_1.LabeledSlider);
local v8 = require(l_Parent_1.PropertyLock);
local l_TerrainEditorOverhaul_0 = game:GetFastFlag("TerrainEditorOverhaul");
local v10 = v2.PureComponent:extend("BrushBaseSizeSlider");
v10.render = function(v11)
    local l_Localization_0 = v11.props.Localization;
    return v2.createElement(v7, {
        LayoutOrder = v11.props.LayoutOrder, 
        Text = l_Localization_0:getText("BrushSettings", "BaseSize"), 
        Min = v5.MIN_BRUSH_SIZE, 
        Max = v5.MAX_BRUSH_SIZE, 
        SnapIncrement = 1, 
        Value = v11.props.baseSize, 
        SetValue = v11.props.setBaseSize, 
        Tooltip = if not l_TerrainEditorOverhaul_0 then nil else l_Localization_0:getText("BrushSettings", "BaseSizeTooltip")
    }, {
        SizeHeightLock = v11.props.ShowLock and v2.createElement(v8, {
            Locked = v11.props.IsLocked, 
            Clicked = v11.props.ToggleLock
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v10));
