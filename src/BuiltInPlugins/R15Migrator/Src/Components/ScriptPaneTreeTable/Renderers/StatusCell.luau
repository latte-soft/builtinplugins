local l_script_FirstAncestor_0 = script:FindFirstAncestor("R15Migrator");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_map_0 = v3.Dash.map;
local l_UI_0 = v3.UI;
local l_IconButton_0 = l_UI_0.IconButton;
local l_Image_0 = l_UI_0.Image;
local l_Pane_0 = l_UI_0.Pane;
local l_showContextMenu_0 = l_UI_0.showContextMenu;
local v12 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local _ = l_script_FirstAncestor_0.Src.Actions;
local _ = l_script_FirstAncestor_0.Src.Components;
local _ = require(l_script_FirstAncestor_0.Src.Types);
local _ = l_script_FirstAncestor_0.Src.Util;
local v17 = v1.PureComponent:extend("StatusCell");
local v18 = {
    v12.ScriptMenuActions.GoToScript, 
    v12.ScriptMenuActions.ShowInExplorer, 
    v12.ScriptMenuActions.RevertScript, 
    v12.ScriptMenuActions.SelectAllSimilar
};
v17.init = function(v19)
    v19.showMenu = function()
        local l_props_0 = v19.props;
        local l_Localization_0 = l_props_0.Localization;
        l_showContextMenu_0(l_props_0.Plugin:get(), (l_map_0(v18, function(v22)
            return {
                Text = l_Localization_0:getText("ScriptPane", v22), 
                OnItemClicked = l_props_0.OnMenuAction(v22)
            };
        end)));
    end;
end;
v17.render = function(v23)
    local _ = v23.state;
    local l_props_1 = v23.props;
    local _ = l_props_1.Localization;
    local l_Value_0 = l_props_1.Value;
    return v1.createElement(l_Pane_0, {
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = UDim2.fromOffset(48, 24), 
        Position = UDim2.fromScale(0.5, 0.5)
    }, {
        MenuButton = v1.createElement(l_IconButton_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Position = UDim2.fromScale(0.25, 0.5), 
            Size = UDim2.fromOffset(16, 16), 
            LeftIcon = "rbxasset://textures/StudioSharedUI/MeatballMenu.png", 
            OnClick = v23.showMenu, 
            Disabled = l_props_1.Disabled
        }), 
        Completed = if not not l_Value_0 and l_Value_0.Checked then v1.createElement(l_Image_0, {
            AnchorPoint = Vector2.new(0.5, 0.5), 
            Size = UDim2.fromOffset(16, 16), 
            Position = UDim2.fromScale(0.75, 0.5), 
            Image = "rbxasset://textures/R15Migrator/Icon_Checkmark.png"
        }) else nil
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = v3.Style.Stylizer, 
    Plugin = l_ContextServices_0.Plugin
})(v17));
