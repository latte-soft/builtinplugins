local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v4 = require(l_script_FirstAncestor_0.Src.Util.AvatarScalingTypes);
local l_UI_0 = v1.UI;
local l_CaptureFocus_0 = l_UI_0.CaptureFocus;
local l_SelectInput_0 = l_UI_0.SelectInput;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Pane_0 = l_UI_0.Pane;
local l_LayoutOrderIterator_0 = v1.Util.LayoutOrderIterator;
local l_Localization_0 = v1.ContextServices.Localization;
local v12 = {
    "Classic", 
    "ProportionsNormal", 
    "ProportionsSlender"
};
return function(v13)
    local v14 = l_LayoutOrderIterator_0.new();
    local v15 = l_Localization_0:use();
    local v16, v17 = v2.useState("Mixed");
    v2.useEffect(function()
        local v18 = nil;
        for _, v20 in v4.allAvatarPartScaleTypeValueObjects(v13.worldModel) do
            if v18 == nil then
                v18 = v20.Value;
            elseif v18 ~= v20.Value then
                v18 = "Mixed";
                break;
            end;
        end;
        v17(v18 == nil and "Classic" or v18);
    end, {
        v13.worldModel
    });
    return v2.createElement(l_CaptureFocus_0, {
        OnFocusLost = v13.close
    }, v2.createElement(l_Pane_0, {
        AnchorPoint = Vector2.new(0, 1), 
        AutomaticSize = Enum.AutomaticSize.XY, 
        Layout = Enum.FillDirection.Vertical, 
        Padding = {
            Top = 4, 
            Bottom = 4, 
            Left = 8, 
            Right = 8
        }, 
        Position = UDim2.new(0, 0, 1, -32), 
        Style = "SubtleBox"
    }, {
        Proportions = v2.createElement(l_Pane_0, {
            AutomaticSize = Enum.AutomaticSize.X, 
            Layout = Enum.FillDirection.Horizontal, 
            LayoutOrder = v14:getNextOrder(), 
            Spacing = 8, 
            Size = UDim2.fromOffset(0, 32)
        }, {
            Label = v2.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.X, 
                LayoutOrder = v14:getNextOrder(), 
                Text = v15:getText("AvatarSettings", "Proportions"), 
                TextXAlignment = Enum.TextXAlignment.Left
            }), 
            Selection = v2.createElement(l_SelectInput_0, {
                LayoutOrder = v14:getNextOrder(), 
                OnItemActivated = v2.useCallback(function(_, v22)
                    local l_worldModel_0 = v13.worldModel;
                    local v24 = v12[v22];
                    v17(v24);
                    v4.setAvatarPartScaleTypeValueObjects(l_worldModel_0, v24);
                    local v25 = v4.types[v24];
                    assert(v25 ~= nil, "Picked scaling type that has no values");
                    local function _(v26, v27)
                        local l_FirstChild_0 = l_worldModel_0.Humanoid:FindFirstChild(v26);
                        if not (l_FirstChild_0 ~= nil) or not l_FirstChild_0:IsA("NumberValue") then
                            if l_FirstChild_0 == nil then
                                local l_NumberValue_0 = Instance.new("NumberValue");
                                l_NumberValue_0.Name = v26;
                                l_NumberValue_0.Value = v27;
                                l_NumberValue_0.Parent = l_worldModel_0.Humanoid;
                            end;
                            return ;
                        else
                            l_FirstChild_0.Value = v27;
                            return ;
                        end;
                    end;
                    local l_BodyTypeScale_0 = v25.BodyTypeScale;
                    local l_BodyTypeScale_1 = l_worldModel_0.Humanoid:FindFirstChild("BodyTypeScale");
                    if not (l_BodyTypeScale_1 ~= nil) or not l_BodyTypeScale_1:IsA("NumberValue") then
                        if l_BodyTypeScale_1 == nil then
                            local l_NumberValue_1 = Instance.new("NumberValue");
                            l_NumberValue_1.Name = "BodyTypeScale";
                            l_NumberValue_1.Value = l_BodyTypeScale_0;
                            l_NumberValue_1.Parent = l_worldModel_0.Humanoid;
                        end;
                    else
                        l_BodyTypeScale_1.Value = l_BodyTypeScale_0;
                    end;
                    l_BodyTypeScale_0 = v25.BodyProportionScale;
                    l_BodyTypeScale_1 = l_worldModel_0.Humanoid:FindFirstChild("BodyProportionScale");
                    if not (l_BodyTypeScale_1 ~= nil) or not l_BodyTypeScale_1:IsA("NumberValue") then
                        if l_BodyTypeScale_1 == nil then
                            local l_NumberValue_2 = Instance.new("NumberValue");
                            l_NumberValue_2.Name = "BodyProportionScale";
                            l_NumberValue_2.Value = l_BodyTypeScale_0;
                            l_NumberValue_2.Parent = l_worldModel_0.Humanoid;
                        end;
                        return ;
                    else
                        l_BodyTypeScale_1.Value = l_BodyTypeScale_0;
                        return ;
                    end;
                end, {
                    v13.worldModel
                }), 
                SelectedIndex = if v16 == nil then nil else table.find(v12, v16), 
                PlaceholderText = v15:getText("AvatarSettings", "Mixed"), 
                Items = v12
            })
        })
    }));
end;
