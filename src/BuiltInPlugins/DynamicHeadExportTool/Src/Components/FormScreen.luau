local l_script_FirstAncestor_0 = script:FindFirstAncestor("DynamicHeadExportTool");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_Button_0 = v2.UI.Button;
local l_Form_0 = v2.UI.Form;
local l_StyleKey_0 = v2.Style.StyleKey;
local v7 = require(l_script_FirstAncestor_0.Src.Constants);
local v8 = v1.PureComponent:extend("FormScreen");
v8.render = function(v9)
    local l_props_0 = v9.props;
    return v1.createElement("Frame", {
        BackgroundColor3 = l_props_0.Stylizer[l_StyleKey_0.MainBackground], 
        Size = UDim2.new(1, 0, 1, 0)
    }, {
        UIPadding = v1.createElement("UIPadding", {
            PaddingBottom = UDim.new(0, v7.Padding), 
            PaddingLeft = UDim.new(0, v7.Padding), 
            PaddingRight = UDim.new(0, v7.Padding), 
            PaddingTop = UDim.new(0, v7.Padding)
        }), 
        Form = v1.createElement(l_Form_0, {
            Expansion = l_props_0.Expansion, 
            ExpandByDefault = true, 
            Items = l_props_0.Items, 
            LabelWidth = UDim.new(0, 150), 
            LabelHeight = 32, 
            OnExpansionChange = l_props_0.onExpansionChange, 
            OnChange = l_props_0.onChange, 
            Size = UDim2.new(1, 0, 1, -(30 + v7.Padding))
        }), 
        Button = v1.createElement(l_Button_0, {
            Text = l_props_0.Localization:getText("Plugin", "NextButton"), 
            Style = "RoundPrimary", 
            TextSize = 24, 
            Size = UDim2.new(1, 0, 0, 30), 
            Position = UDim2.new(0, 0, 1, -30), 
            OnClick = l_props_0.onSubmit
        })
    });
end;
return (l_ContextServices_0.withContext({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v8));
