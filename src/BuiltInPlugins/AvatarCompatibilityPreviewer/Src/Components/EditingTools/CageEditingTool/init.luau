local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.AvatarToolsShared);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_LuaMeshEditingModule_0 = l_script_FirstAncestor_0.Packages.LuaMeshEditingModule;
local v4 = require(l_script_FirstAncestor_0.Packages.React);
local v5 = require(l_script_FirstAncestor_0.Packages.ViewportToolingFramework);
local v6 = require(l_script_FirstAncestor_0.Src.Components.EditingTools.CageEditingTool.LuaMeshEditingModuleWrapper);
local v7 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v10 = require(l_script_FirstAncestor_0.Src.Components.EditingTools.useBindFocusOnPositions);
local v11 = require(l_script_FirstAncestor_0.Src.Hooks.useRefWithInitial);
local v12 = require(l_script_FirstAncestor_0.Src.Hooks.useToggleState);
local v13 = require(l_LuaMeshEditingModule_0.Tools.BrushTool);
local l_ContextServices_0 = v2.ContextServices;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_LuaMeshEditingModuleContext_0 = v1.Contexts.LuaMeshEditingModuleContext;
local l_Stylizer_0 = l_ContextServices_0.Stylizer;
return function(v18)
    local v19 = l_Localization_0:use();
    local v20 = l_Stylizer_0:use("CageEditingTool");
    local v21 = v11(v13.new);
    local v22, v23 = v4.useState(50);
    local v24, v25 = v4.useState(0.3);
    local v26 = v12(true);
    local v27, v28 = v4.useState({});
    v10(v27);
    return l_ContextServices_0.provide({
        l_LuaMeshEditingModuleContext_0.new({
            BrushTool = v21.current
        })
    }, {
        CageEditingTool = v4.createElement(v6, {
            Mannequin = v18.mannequin, 
            Falloff = ((v22 / 100) * v24) / v7.FALLOFF_CURSOR_ADJUSTMENT, 
            Radius = v24, 
            OnChangeSelectedPositions = v28, 
            Symmetrical = v26.enabled
        }), 
        [v7.EDITING_TOOLS_GUI_NAMES.CageEditingToolToolbar] = v4.createElement(v5.Toolbar, {
            HorizontalItems = {
                {
                    Type = "Button", 
                    Icon = v20.SymmetryImage, 
                    Tooltip = v19:getText("CageEditingTool", "Symmetry"), 
                    TooltipDescription = v19:getText("CageEditingTool", "SymmetryDescription"), 
                    Value = v26.enabled, 
                    OnClick = v26.toggle, 
                    Selected = v26.enabled
                }, 
                {
                    Type = "Separator"
                }, 
                {
                    Type = "Slider", 
                    Value = v24, 
                    OnChange = v25, 
                    Icon = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Standard/radius@2x.png", 
                    Tooltip = v19:getText("CageEditingTool", "Radius"), 
                    Min = 0.1, 
                    Max = 0.5
                }, 
                {
                    Type = "Slider", 
                    Value = v22, 
                    OnChange = v23, 
                    Icon = "rbxasset://studio_svg_textures/Lua/AvatarCompatibilityPreviewer/Dark/Standard/radius@2x.png", 
                    Tooltip = v19:getText("CageEditingTool", "Falloff"), 
                    Min = 0, 
                    Max = 100, 
                    InputPrecision = 0, 
                    DisplayFormat = "%d%%"
                }, 
                {
                    Type = "Separator"
                }, 
                unpack(v18.additionalToolbarItems)
            }
        })
    });
end;
