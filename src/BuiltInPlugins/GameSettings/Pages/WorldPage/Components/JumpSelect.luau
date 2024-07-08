local l_Parent_0 = script.Parent.Parent;
local l_Parent_1 = script.Parent.Parent.Parent.Parent;
local v2 = require(l_Parent_1.Packages.Roact);
local v3 = require(l_Parent_1.Packages.Framework);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_TextInput_0 = v3.UI.TextInput;
local v7 = require(l_Parent_0.ContextServices.WorldRootPhysics);
local v8 = require(l_Parent_0.Util.formatNumberForDisplay);
local v9 = require(l_Parent_0.Util.formatNumberForEngine);
local l_RoactStudioWidgets_0 = l_Parent_1.Packages.RoactStudioWidgets;
local v11 = require(l_RoactStudioWidgets_0.RadioButtonSet);
local v12 = require(l_RoactStudioWidgets_0.Text);
local l_StudioGameSettingsWorldPageFormatNumbersForGerman_0 = game:GetFastFlag("StudioGameSettingsWorldPageFormatNumbersForGerman");
local v14 = v2.PureComponent:extend("JumpSelect");
v14.render = function(v15)
    local l_props_0 = v15.props;
    local l_LayoutOrder_0 = l_props_0.LayoutOrder;
    local l_UseJumpPower_0 = l_props_0.UseJumpPower;
    local l_JumpPower_0 = l_props_0.JumpPower;
    local l_JumpHeight_0 = l_props_0.JumpHeight;
    local l_SetUseJumpPower_0 = l_props_0.SetUseJumpPower;
    local l_SetJumpPower_0 = l_props_0.SetJumpPower;
    local l_SetJumpHeight_0 = l_props_0.SetJumpHeight;
    local l_Localization_0 = l_props_0.Localization;
    local v25 = l_props_0.Mouse:get();
    local v26 = l_props_0.WorldRootPhysics:get();
    local v27 = UDim.new(0, 10);
    return v2.createElement("Frame", {
        LayoutOrder = l_LayoutOrder_0, 
        Size = UDim2.new(1, 0, 0, 50), 
        BackgroundTransparency = 1
    }, {
        JumpSelect = v2.createElement(v11, {
            Title = l_Localization_0:getText("General", "TitleJump"), 
            Buttons = {
                {
                    Id = false, 
                    Title = l_Localization_0:getText("General", "JumpHeight")
                }, 
                {
                    Id = true, 
                    Title = l_Localization_0:getText("General", "JumpPower")
                }
            }, 
            Enabled = true, 
            Selected = l_UseJumpPower_0, 
            Mouse = v25, 
            SelectionChanged = function(v28)
                l_SetUseJumpPower_0(v28.Id);
            end
        }), 
        JumpInput = v2.createElement("Frame", {
            Position = UDim2.new(0, 340, 0, 0), 
            BackgroundTransparency = 1
        }, {
            Layout = v2.createElement("UIListLayout", {
                Padding = v27, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            JumpHeightInputBox = v2.createElement(l_TextInput_0, {
                Disabled = l_UseJumpPower_0, 
                LayoutOrder = 1, 
                OnFocusLost = function()
                    l_SetJumpHeight_0((math.clamp(l_JumpHeight_0, 0, math.huge)));
                end, 
                OnTextChanged = function(v29)
                    if l_StudioGameSettingsWorldPageFormatNumbersForGerman_0 then
                        v29 = v9(v29);
                    end;
                    l_SetJumpHeight_0(tonumber(v29) or 0);
                end, 
                Size = UDim2.fromOffset(150, 20), 
                Text = v8(l_JumpHeight_0)
            }), 
            JumpPowerInputBox = v2.createElement(l_TextInput_0, {
                Disabled = not l_UseJumpPower_0, 
                LayoutOrder = 2, 
                OnFocusLost = function()
                    l_SetJumpPower_0((math.clamp(l_JumpPower_0, 0, 1000)));
                end, 
                OnTextChanged = function(v30)
                    if l_StudioGameSettingsWorldPageFormatNumbersForGerman_0 then
                        v30 = v9(v30);
                    end;
                    l_SetJumpPower_0(tonumber(v30) or 0);
                end, 
                Size = UDim2.new(0, 150, 0, 20), 
                Text = v8(l_JumpPower_0)
            })
        }), 
        MetricLabels = v2.createElement("Frame", {
            Position = UDim2.new(0, 510, 0, 0), 
            BackgroundTransparency = 1
        }, {
            Layout = v2.createElement("UIListLayout", {
                Padding = v27, 
                SortOrder = Enum.SortOrder.LayoutOrder
            }), 
            JumpHeightMetricLabel = v2.createElement(v12, {
                Enabled = not l_UseJumpPower_0, 
                Size = UDim2.new(1, 0, 0, 20), 
                Text = l_Localization_0:getText("General", "UnitsMeters1", {
                    v8(v26.convertStudsToMeters(l_JumpHeight_0))
                })
            })
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Mouse = l_ContextServices_0.Mouse, 
    WorldRootPhysics = v7
})(v14));
