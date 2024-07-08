local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_FlowScreenLayout_0 = require(l_Parent_0.Packages.AvatarToolsShared).Components.FlowScreenLayout;
local l_UI_0 = v2.UI;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_DEPRECATED_TextInput_0 = l_UI_0.DEPRECATED_TextInput;
local l_Pane_0 = l_UI_0.Pane;
local v10 = v1.PureComponent:extend("SelectFrame");
v2.Util.Typecheck.wrap(v10, script);
v10.init = function(v11)
    v11.renderContent = function(v12)
        local l_props_0 = v11.props;
        local l_PartName_0 = l_props_0.PartName;
        local l_Stylizer_0 = l_props_0.Stylizer;
        return v1.createElement(l_Pane_0, {
            Size = UDim2.new(1, 0, 0, l_Stylizer_0.TextBoxHeight), 
            LayoutOrder = v12, 
            Layout = Enum.FillDirection.Horizontal, 
            HorizontalAlignment = Enum.HorizontalAlignment.Left
        }, {
            TextBoxLabel = v1.createElement(l_TextLabel_0, {
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextYAlignment = Enum.TextYAlignment.Center, 
                Size = UDim2.new(0, l_Stylizer_0.LabelWidth, 1, 0), 
                Text = l_props_0.Localization:getText("Select", "Part"), 
                LayoutOrder = v12 + 1
            }), 
            SelectedPartBox = v1.createElement(l_DEPRECATED_TextInput_0, {
                Enabled = false, 
                ShouldFocus = false, 
                Text = l_PartName_0, 
                Size = UDim2.new(0.5, 0, 1, 0), 
                LayoutOrder = v12 + 2, 
                Style = "FilledRoundedBorder"
            })
        });
    end;
end;
v10.render = function(v16)
    local l_props_1 = v16.props;
    local l_ButtonEnabled_0 = l_props_1.ButtonEnabled;
    local l_OnConfirmSelection_0 = l_props_1.OnConfirmSelection;
    local l_Localization_0 = l_props_1.Localization;
    return v1.createElement(l_FlowScreenLayout_0, {
        Title = l_Localization_0:getText("Editor", "Select"), 
        PromptText = l_Localization_0:getText("Select", "Prompt"), 
        NextButtonText = l_Localization_0:getText("Flow", "Next"), 
        BackButtonText = "", 
        NextButtonEnabled = l_ButtonEnabled_0, 
        HasBackButton = false, 
        GoToNext = l_OnConfirmSelection_0, 
        RenderContent = v16.renderContent
    });
end;
return (l_withContext_0({
    Stylizer = l_ContextServices_0.Stylizer, 
    Localization = l_ContextServices_0.Localization
})(v10));
