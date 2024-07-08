local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_0.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v4 = require(l_Parent_0.Packages.RoactStudioWidgets.ButtonBar);
local v5 = v1.PureComponent:extend(script.Name);
v5.render = function(v6)
    local l_props_0 = v6.props;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_ApplyPreset_0 = l_props_0.ApplyPreset;
    local v10 = l_props_0.Mouse:get();
    local l_Localization_0 = l_props_0.Localization;
    return v1.createElement(v4, {
        LayoutOrder = l_LayoutOrder_0, 
        Title = l_Localization_0:getText("General", "TitlePresets"), 
        ButtonClicked = function(v12)
            l_ApplyPreset_0(v12.Preset);
        end, 
        Buttons = {
            {
                Name = l_Localization_0:getText("General", "WorldPresetsClassic"), 
                Enabled = true, 
                ShowPressed = true, 
                Mouse = v10, 
                Value = {
                    ToolTip = l_Localization_0:getText("General", "WorldPresetsClassicToolTip"), 
                    Preset = {
                        Gravity = 196.2, 
                        JumpPower = 50, 
                        Walkspeed = 16, 
                        MaxSlopeAngle = 89
                    }
                }
            }, 
            {
                Name = l_Localization_0:getText("General", "WorldPresetsRealistic"), 
                Enabled = true, 
                ShowPressed = true, 
                Mouse = v10, 
                Value = {
                    ToolTip = l_Localization_0:getText("General", "WorldPresetsRealisticToolTip"), 
                    Preset = {
                        Gravity = 35, 
                        JumpPower = 13, 
                        Walkspeed = 16
                    }
                }
            }, 
            {
                Name = l_Localization_0:getText("General", "WorldPresetsAction"), 
                Enabled = true, 
                ShowPressed = true, 
                Mouse = v10, 
                Value = {
                    ToolTip = l_Localization_0:getText("General", "WorldPresetsActionToolTip"), 
                    Preset = {
                        Gravity = 75, 
                        JumpPower = 31, 
                        Walkspeed = 18
                    }
                }
            }
        }
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse
})(v5));
