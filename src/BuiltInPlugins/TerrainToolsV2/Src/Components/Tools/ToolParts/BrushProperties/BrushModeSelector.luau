local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local l_BrushMode_0 = require(l_Parent_0.Src.Util.TerrainEnums).BrushMode;
local l_Parent_1 = script.Parent.Parent;
local v7 = require(l_Parent_1.LabeledElementPair);
local v8 = require(l_Parent_1.SingleSelectButtonGroup);
local l_UserInputService_0 = game:GetService("UserInputService");
local v10 = v2.PureComponent:extend("BrushModeSelector");
v10.didMount = function(v11)
    v11.inputBegan = l_UserInputService_0.InputBegan:Connect(function(v12)
        if not (v12.KeyCode ~= Enum.KeyCode.LeftControl and v12.KeyCode ~= Enum.KeyCode.RightControl) or v12.KeyCode == Enum.KeyCode.B then
            v11:setState({});
        end;
    end);
    v11.inputEnded = l_UserInputService_0.InputEnded:Connect(function(v13)
        if not (v13.KeyCode ~= Enum.KeyCode.LeftControl and v13.KeyCode ~= Enum.KeyCode.RightControl) or v13.KeyCode == Enum.KeyCode.B then
            v11:setState({});
        end;
    end);
end;
v10.willUnmount = function(v14)
    if v14.inputBegan then
        v14.inputBegan:Disconnect();
    end;
    if v14.inputEnded then
        v14.inputEnded:Disconnect();
    end;
end;
v10.render = function(v15)
    local l_Localization_0 = v15.props.Localization;
    local l_LayoutOrder_0 = v15.props.LayoutOrder;
    local l_brushMode_0 = v15.props.brushMode;
    local l_setBrushMode_0 = v15.props.setBrushMode;
    local _ = v15.props.currentTool;
    if not (not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftControl) and not l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightControl) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.B)) then
        if l_brushMode_0 == l_BrushMode_0.Add then
            l_brushMode_0 = l_BrushMode_0.Subtract;
        elseif l_brushMode_0 == l_BrushMode_0.Subtract then
            l_brushMode_0 = l_BrushMode_0.Add;
        end;
    end;
    return v2.createElement(v7, {
        Size = UDim2.new(1, 0, 0, 22), 
        Text = l_Localization_0:getText("BrushSettings", "BrushMode"), 
        LayoutOrder = l_LayoutOrder_0, 
        Tooltip = l_Localization_0:getText("BrushSettings", "BrushModeTooltip")
    }, {
        v2.createElement(v8, {
            Size = UDim2.new(0, 141, 0, 22), 
            Selected = l_brushMode_0, 
            Select = l_setBrushMode_0, 
            Options = {
                {
                    Text = l_Localization_0:getText("BrushSettings", "Add"), 
                    Data = l_BrushMode_0.Add
                }, 
                {
                    Text = l_Localization_0:getText("BrushSettings", "Subtract"), 
                    Data = l_BrushMode_0.Subtract
                }
            }
        })
    });
end;
return (l_withContext_0({
    Localization = l_ContextServices_0.Localization
})(v10));
