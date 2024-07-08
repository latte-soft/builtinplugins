local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Roact);
local l_ContextServices_0 = require(l_Parent_1.Packages.Framework).ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v5 = require(l_Parent_0.Util.ConstantTemplate);
local v6 = require(l_Parent_0.Util.StateInterfaceTemplates);
local v7 = require(l_Parent_0.Util.StateModelTemplate);
local v8 = require(l_Parent_0.Components.RadioButtonSetPanel);
local v9 = v2.Component:extend("ComponentAvatarTypePanel");
v9.render = function(v10)
    local v11 = {
        [v5.R6] = v7.setRigTypeR6, 
        [v5.R15] = v7.setRigTypeR15, 
        [v5.PlayerChoice] = v7.setRigTypePlayerChoice
    };
    local l_props_0 = v10.props;
    local l_Localization_0 = l_props_0.Localization;
    return v2.createElement(v8, {
        Title = l_Localization_0:getText("General", "TitleAvatarType"), 
        Buttons = {
            {
                Id = v5.R6, 
                Title = l_Localization_0:getText("General", "AvatarTypeR6")
            }, 
            {
                Id = v5.R15, 
                Title = l_Localization_0:getText("General", "AvatarTypeR15")
            }, 
            {
                Id = v5.PlayerChoice, 
                Title = l_Localization_0:getText("General", "AvatarTypePlayerChoice")
            }
        }, 
        Enabled = v10.props.IsEnabled, 
        LayoutOrder = v10.props.LayoutOrder, 
        Selected = v6.getStateModelTemplate(v10.props).RigTypeValue, 
        SubDescription = not not v10.props.IsGameShutdownRequired and l_Localization_0:getText("General", "AvatarTypeWarning") or nil, 
        Mouse = l_props_0.Mouse:get(), 
        SelectionChanged = function(v14)
            local v15 = v6.getStateModelTemplateCopy(v10.props);
            v11[v14.Id](v15);
            v10.props.clobberTemplate(v10.props.template, v15);
        end
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse
})(v9));
