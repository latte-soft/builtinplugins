local l_Players_0 = game:GetService("Players");
local l_Selection_0 = game:GetService("Selection");
local l_Parent_0 = script.Parent.Parent.Parent;
local v3 = require(l_Parent_0.Packages.React);
local v4 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v4.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Stylizer_0 = v4.Style.Stylizer;
local l_UI_0 = v4.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_RadioButtonList_0 = l_UI_0.RadioButtonList;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_TitledFrame_0 = l_UI_0.TitledFrame;
local v15 = require(l_Parent_0.Src.Util.BodyShape);
local v16 = require(l_Parent_0.Src.Components.RigList);
local v17 = v3.PureComponent:extend("RigSelector");
local function _()
    local l_CurrentCamera_0 = workspace.CurrentCamera;
    local v19 = l_CurrentCamera_0.ViewportSize / 2;
    local v20 = l_CurrentCamera_0:ViewportPointToRay(v19.X, v19.Y, 0);
    local v21 = workspace:Raycast(v20.Origin, v20.Direction * 25);
    if v21 then
        return v21.Position;
    else
        return v20.Origin + v20.Direction * 25;
    end;
end;
local function v26(v23)
    for _, v25 in v23:GetDescendants() do
        if v25:IsA("BasePart") then
            v25.Locked = false;
        end;
    end;
end;
v17.insertRig = function(v27, v28)
    local l_Analytics_1 = v27.props.Analytics;
    local l_l_Players_0_HumanoidModelFromDescription_0 = l_Players_0:CreateHumanoidModelFromDescription(require(v28)(v27.state.bodyShape), v27.state.rigType);
    v26(l_l_Players_0_HumanoidModelFromDescription_0);
    l_l_Players_0_HumanoidModelFromDescription_0.Name = "Rig";
    local l_Humanoid_0 = l_l_Players_0_HumanoidModelFromDescription_0:FindFirstChildWhichIsA("Humanoid");
    local l_HumanoidRootPart_0 = l_l_Players_0_HumanoidModelFromDescription_0:FindFirstChild("HumanoidRootPart");
    assert(l_Humanoid_0, "Generated rig did not have Humanoid");
    assert(l_HumanoidRootPart_0, "Generated rig did not have HumanoidRootPart");
    assert(l_l_Players_0_HumanoidModelFromDescription_0.PrimaryPart, "Generated rig does not have PrimaryPart");
    local l_CurrentCamera_1 = workspace.CurrentCamera;
    local v34 = l_CurrentCamera_1.ViewportSize / 2;
    local v35 = l_CurrentCamera_1:ViewportPointToRay(v34.X, v34.Y, 0);
    local v36 = workspace:Raycast(v35.Origin, v35.Direction * 25);
    local v37 = if v36 then v36.Position else v35.Origin + v35.Direction * 25;
    l_CurrentCamera_1 = l_Humanoid_0.HipHeight;
    if v27.state.rigType == Enum.HumanoidRigType.R6 then
        l_l_Players_0_HumanoidModelFromDescription_0.PrimaryPart.PivotOffset = CFrame.new(0, (-l_l_Players_0_HumanoidModelFromDescription_0.PrimaryPart.Size.Y / 2 - l_HumanoidRootPart_0.Size.Y) - 2, 0);
    else
        l_l_Players_0_HumanoidModelFromDescription_0.PrimaryPart.PivotOffset = CFrame.new(0, -l_l_Players_0_HumanoidModelFromDescription_0.PrimaryPart.Size.Y / 2 - l_CurrentCamera_1, 0);
    end;
    l_l_Players_0_HumanoidModelFromDescription_0:PivotTo(CFrame.new(v37));
    l_l_Players_0_HumanoidModelFromDescription_0.Parent = workspace;
    l_Selection_0:Set({
        l_l_Players_0_HumanoidModelFromDescription_0
    });
    l_Analytics_1:report("rigInsert", v28.Name, v27.state.rigType, v27.state.bodyShape);
end;
v17.init = function(v38, _)
    v38:setState({
        rigType = Enum.HumanoidRigType.R15, 
        bodyShape = v15.Masculine
    });
end;
v17.render = function(v40)
    local l_props_0 = v40.props;
    local l_Localization_1 = l_props_0.Localization;
    local l_MenuCompleted_0 = l_props_0.MenuCompleted;
    local l_state_0 = v40.state;
    return v3.createElement("Frame", {
        Position = UDim2.new(0.5, 0, 0.5, 0), 
        AnchorPoint = Vector2.new(0.5, 0.5), 
        Size = UDim2.new(0, 200, 0, 0), 
        AutomaticSize = Enum.AutomaticSize.Y, 
        BackgroundTransparency = 1
    }, {
        Pane = v3.createElement(l_Pane_0, {
            Style = "BorderBox", 
            Layout = Enum.FillDirection.Vertical, 
            Padding = 10, 
            Spacing = 10
        }, {
            Text = v3.createElement(l_TextLabel_0, {
                AutomaticSize = Enum.AutomaticSize.XY, 
                LayoutOrder = 0, 
                Style = "Title", 
                Text = l_Localization_1:getText("Plugin", "Text")
            }), 
            RigType = v3.createElement(l_TitledFrame_0, {
                Title = l_Localization_1:getText("Menu", "RigType"), 
                FillDirection = Enum.FillDirection.Vertical, 
                LayoutOrder = 1
            }, {
                Types = v3.createElement(l_RadioButtonList_0, {
                    Buttons = {
                        {
                            Key = Enum.HumanoidRigType.R15, 
                            Text = Enum.HumanoidRigType.R15.Name
                        }, 
                        {
                            Key = Enum.HumanoidRigType.R6, 
                            Text = Enum.HumanoidRigType.R6.Name
                        }
                    }, 
                    CurrentSelectedKey = l_state_0.rigType, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    OnClick = function(v45)
                        v40:setState({
                            rigType = v45
                        });
                    end
                })
            }), 
            BodyShape = v3.createElement(l_TitledFrame_0, {
                Title = l_Localization_1:getText("Menu", "BodyShape"), 
                FillDirection = Enum.FillDirection.Vertical, 
                LayoutOrder = 2
            }, {
                Types = v3.createElement(l_RadioButtonList_0, {
                    Buttons = {
                        {
                            Key = v15.Masculine, 
                            Text = l_Localization_1:getText("BodyShape", "Masculine")
                        }, 
                        {
                            Key = v15.Feminine, 
                            Text = l_Localization_1:getText("BodyShape", "Feminine")
                        }
                    }, 
                    CurrentSelectedKey = l_state_0.bodyShape, 
                    FillDirection = Enum.FillDirection.Vertical, 
                    OnClick = function(v46)
                        v40:setState({
                            bodyShape = v46
                        });
                    end
                })
            }), 
            Rigs = v3.createElement(v16, {
                LayoutOrder = 3, 
                OnSelected = function(v47)
                    v40:insertRig(v47);
                    l_MenuCompleted_0();
                end
            })
        })
    });
end;
return (l_withContext_0({
    Analytics = l_Analytics_0, 
    Localization = l_Localization_0, 
    Stylizer = l_Stylizer_0
})(v17));
