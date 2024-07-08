local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local _ = require(l_Parent_0.Packages.Cryo);
local v3 = require(l_Parent_0.Packages.Framework);
local l_FitFrameOnAxis_0 = v3.Util.FitFrame.FitFrameOnAxis;
local l_TextInput_0 = v3.UI.TextInput;
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v8 = require(l_Parent_0.Src.Components.RadioButtonSet);
local v9 = require(l_Parent_0.Src.Components.RadioButton);
local v10 = v1.PureComponent:extend("ServerFill");
v10.render = function(v11)
    local l_props_0 = v11.props;
    local l_Localization_0 = l_props_0.Localization;
    local l_Stylizer_0 = l_props_0.Stylizer;
    local v15 = l_Localization_0:getText("Places", "ServerFill");
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_Enabled_0 = l_props_0.Enabled;
    local l_Selected_0 = l_props_0.Selected;
    local l_CustomSocialSlotsCount_0 = l_props_0.CustomSocialSlotsCount;
    local l_ErrorMessage_0 = l_props_0.ErrorMessage;
    local l_OnSocialSlotTypeChanged_0 = l_props_0.OnSocialSlotTypeChanged;
    local l_OnCustomSocialSlotsCountChanged_0 = l_props_0.OnCustomSocialSlotsCountChanged;
    local v23 = l_Selected_0 == "Custom";
    return v1.createElement(l_FitFrameOnAxis_0, {
        axis = l_FitFrameOnAxis_0.Axis.Vertical, 
        minimumSize = UDim2.new(1, 0, 0, 0), 
        BackgroundTransparency = 1, 
        LayoutOrder = l_LayoutOrder_0
    }, {
        ServerFillToggle = v1.createElement(v8, {
            Title = v15, 
            Buttons = {
                {
                    Id = "Automatic", 
                    Title = l_Localization_0:getText("Places", "OptimizedTitle"), 
                    Description = l_Localization_0:getText("Places", "OptimizedDescription")
                }, 
                {
                    Id = "Empty", 
                    Title = l_Localization_0:getText("Places", "MaximumTitle"), 
                    Description = l_Localization_0:getText("Places", "MaximumWarning")
                }, 
                {
                    Id = "Custom", 
                    Title = l_Localization_0:getText("Places", "CustomizeSlotsTitle"), 
                    Description = l_Localization_0:getText("Places", "CustomizeSlotsDescription")
                }
            }, 
            Enabled = l_Enabled_0, 
            Selected = l_Selected_0, 
            RenderItem = function(v24, v25)
                if v25.Id == "Custom" then
                    local l_createElement_0 = v1.createElement;
                    local l_l_FitFrameOnAxis_0_0 = l_FitFrameOnAxis_0;
                    local v28 = {
                        axis = l_FitFrameOnAxis_0.Axis.Vertical, 
                        minimumSize = UDim2.new(1, 0, 0, 0), 
                        contentPadding = UDim.new(0, l_Stylizer_0.radioButton.padding), 
                        BackgroundTransparency = 1, 
                        FillDirection = Enum.FillDirection.Horizontal, 
                        LayoutOrder = v24
                    };
                    local v29 = {};
                    local l_createElement_1 = v1.createElement;
                    local l_v9_0 = v9;
                    local v32 = {
                        LayoutOrder = 1, 
                        Title = v25.Title, 
                        Id = v25.Id, 
                        Description = v25.Description
                    };
                    local v33 = true;
                    if v25.Id ~= l_Selected_0 then
                        v33 = v24 == l_Selected_0;
                    end;
                    v32.Selected = v33;
                    v32.Index = v24;
                    v32.Enabled = l_props_0.Enabled;
                    v32.Children = v25.Children;
                    v32.OnClicked = function()
                        l_OnSocialSlotTypeChanged_0(v25);
                    end;
                    v29.RadioButton = l_createElement_1(l_v9_0, v32);
                    v29.InputField = v23 and v1.createElement(l_TextInput_0, {
                        ErrorText = l_ErrorMessage_0, 
                        LayoutOrder = 2, 
                        OnTextChanged = l_OnCustomSocialSlotsCountChanged_0, 
                        Width = l_Stylizer_0.placePage.textBox.length, 
                        Text = l_CustomSocialSlotsCount_0
                    });
                    return l_createElement_0(l_l_FitFrameOnAxis_0_0, v28, v29);
                else
                    local l_createElement_2 = v1.createElement;
                    local l_v9_1 = v9;
                    local v36 = {
                        Title = v25.Title, 
                        Id = v25.Id, 
                        Description = v25.Description
                    };
                    local v37 = true;
                    if v25.Id ~= l_Selected_0 then
                        v37 = v24 == l_Selected_0;
                    end;
                    v36.Selected = v37;
                    v36.Index = v24;
                    v36.Enabled = l_props_0.Enabled;
                    v36.LayoutOrder = v24;
                    v36.OnClicked = function()
                        l_OnSocialSlotTypeChanged_0(v25);
                    end;
                    return l_createElement_2(l_v9_1, v36);
                end;
            end
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v10));
