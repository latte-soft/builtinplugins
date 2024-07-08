local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Framework);
local v2 = require(l_Parent_0.Packages.Roact);
local v3 = require(l_Parent_0.Packages.RoactRodux);
local l_ContextServices_0 = v1.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local v6 = require(l_Parent_0.Src.ContextItems);
local l_Button_0 = v1.UI.Button;
local l_Dialog_0 = v1.UI.Dialog;
local v9 = require(l_Parent_0.Src.Actions.ChangeTool);
local l_ToolId_0 = require(l_Parent_0.Src.Util.TerrainEnums).ToolId;
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_TextService_0 = game:GetService("TextService");
local v13 = v2.PureComponent:extend(script.Name);
v13.init = function(v14)
    v14.state = {
        showingDialog = false
    };
    v14.onYesClicked = function()
        if not v14.state.clearing then
            v14:setState({
                clearingStarted = true, 
                showingDialog = false
            });
            v14.props.Terrain:get():Clear();
            l_ChangeHistoryService_0:SetWaypoint("Terrain Clear");
            v14.props.dispatchChangeTool(l_ToolId_0.None);
            return ;
        else
            return ;
        end;
    end;
    v14.onNoClicked = function()
        v14.props.dispatchChangeTool(l_ToolId_0.None);
    end;
    v14.onButtonClicked = function(v15)
        if v15 == "yes" then
            v14.onYesClicked();
            return ;
        else
            if v15 == "no" then
                v14.onNoClicked();
            end;
            return ;
        end;
    end;
end;
v13.didMount = function(v16)
    spawn(function()
        v16:setState({
            showingDialog = true
        });
    end);
end;
v13.render = function(v17)
    local v18 = v17.props.Theme:get();
    local l_Localization_0 = v17.props.Localization;
    if v17.state.showingDialog then
        local l_x_0 = l_TextService_0:GetTextSize(l_Localization_0:getText("ClearTool", "ConfirmationMessage"), v18.textSize, v18.font, Vector2.new()).x;
        local v21 = math.max(168, (48 + l_x_0) + 8);
        local v22 = {
            {
                Key = "no", 
                Text = l_Localization_0:getText("Confirmation", "No"), 
                Style = "Round"
            }, 
            {
                Key = "yes", 
                Text = l_Localization_0:getText("Confirmation", "Yes"), 
                Style = "RoundPrimary"
            }
        };
        local v23 = {
            UIListLayout = v2.createElement("UIListLayout", {
                Padding = UDim.new(0, 8), 
                FillDirection = Enum.FillDirection.Horizontal, 
                SortOrder = Enum.SortOrder.LayoutOrder, 
                HorizontalAlignment = Enum.HorizontalAlignment.Center, 
                VerticalAlignment = Enum.VerticalAlignment.Top
            })
        };
        local function v27(v24, v25, v26)
            return v2.createElement(l_Button_0, {
                LayoutOrder = v25, 
                OnClick = v26, 
                Size = UDim2.new(0, 72, 0, 24), 
                Style = v24.Style, 
                Text = v24.Text
            });
        end;
        for v28, v29 in ipairs(v22) do
            table.insert(v23, v27(v29, v28, function()
                v17.onButtonClicked(v29.Key);
            end));
        end;
        return v2.createElement(l_Dialog_0, {
            Title = l_Localization_0:getText("ClearTool", "ConfirmationTitle"), 
            Size = Vector2.new(v21, 80), 
            MinSize = Vector2.new(v21, 80), 
            Resizable = false, 
            Modal = true, 
            ZIndexBehavior = Enum.ZIndexBehavior.Sibling, 
            Enabled = true, 
            OnClose = v17.onNoClicked
        }, {
            Background = v2.createElement("Frame", {
                Position = UDim2.new(0, 0, 0, 0), 
                Size = UDim2.new(1, 0, 1, 0), 
                BackgroundColor3 = v18.backgroundColor
            }, {
                UIPadding = v2.createElement("UIPadding", {
                    PaddingBottom = UDim.new(0, 8), 
                    PaddingLeft = UDim.new(0, 8), 
                    PaddingRight = UDim.new(0, 8), 
                    PaddingTop = UDim.new(0, 8)
                }), 
                Content = v2.createElement("Frame", {
                    AnchorPoint = Vector2.new(0.5, 0), 
                    Position = UDim2.new(0.5, 0, 0, 0), 
                    Size = UDim2.new(1, 0, 1, -32), 
                    BackgroundTransparency = 1
                }, {
                    Icon = v2.createElement("ImageLabel", {
                        Size = UDim2.new(0, 32, 0, 32), 
                        BackgroundTransparency = 1, 
                        Image = "rbxasset://textures/DevConsole/Info.png"
                    }), 
                    Message = v2.createElement("TextLabel", {
                        Position = UDim2.new(0, 40, 0, 0), 
                        Size = UDim2.new(0, l_x_0, 1, 0), 
                        BackgroundTransparency = 1, 
                        Text = l_Localization_0:getText("ClearTool", "ConfirmationMessage"), 
                        Font = v18.font, 
                        TextSize = v18.textSize, 
                        TextColor3 = v18.textColor, 
                        TextYAlignment = Enum.TextYAlignment.Top
                    })
                }), 
                Buttons = v2.createElement("Frame", {
                    AnchorPoint = Vector2.new(0.5, 1), 
                    Position = UDim2.new(0.5, 0, 1, 0), 
                    Size = UDim2.new(1, 0, 0, 24), 
                    BackgroundTransparency = 1
                }, v23)
            })
        });
    else
        return nil;
    end;
end;
return v3.connect(nil, function(v30)
    return {
        dispatchChangeTool = function(v31)
            v30(v9(v31));
        end
    };
end)((l_withContext_0({
    Theme = v6.DEPRECATED_Theme, 
    Localization = l_ContextServices_0.Localization, 
    Terrain = v6.Terrain
})(v13)));
