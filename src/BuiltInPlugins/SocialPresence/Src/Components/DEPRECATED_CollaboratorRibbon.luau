local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_IconButton_0 = l_UI_0.IconButton;
local l_HoverArea_0 = l_UI_0.HoverArea;
local l_ContextServices_0 = v2.ContextServices;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_CrossPluginCommunication_0 = v2.Util.CrossPluginCommunication;
local l_Stylizer_0 = v2.Style.Stylizer;
local v13 = require(l_Parent_0.Src.ContextServices.CollaboratorsServiceContext);
local v14 = require(l_Parent_0.Src.Components.Thumbnails.CollaboratorActivityThumbnail);
local l_TextService_0 = game:GetService("TextService");
local v16 = Vector2.new(1000, 1);
local function v23(v17, v18)
    local v19 = l_Localization_0.use();
    if v17 > 0 then
        local v20 = math.min(v17, 5);
        local v21 = 24 * v20 - (v20 - 1) * 6;
        local v22 = 24;
        if v18 then
            v21 = v21 + 24;
        end;
        return Vector2.new(v21 + 4, v22 + 4);
    else
        return Vector2.new(((24 + l_TextService_0:GetTextSize(v19:getText("Ribbon", "Collaborate"), 18, Enum.Font.SourceSansBold, v16).X) + 4) + 4, 28);
    end;
end;
return function(v24)
    local v25, v26 = v1.useState(false);
    local v27 = l_CrossPluginCommunication_0.new("ManageCollaborators");
    local v28 = l_Stylizer_0:use();
    local v29 = l_Localization_0.use();
    local v30 = l_Analytics_0:use();
    local v31 = v13:use():get();
    local v32, v33 = v1.useState({});
    v1.useEffect(function()
        v33((v31:GetCollaboratorsList()));
        local function v34()
            v33(v31:GetCollaboratorsList());
        end;
        local v35 = v31.CollaboratorInstanceCreatedSignal:Connect(v34);
        local v36 = v31.CollaboratorInstanceDestroyedSignal:Connect(v34);
        local v37 = v31.CollaboratorIdleUpdate:Connect(v34);
        return function()
            v35:Disconnect();
            v36:Disconnect();
            v37:Disconnect();
        end;
    end, {});
    local v38 = {
        Layout = v1.createElement("UIListLayout", {
            SortOrder = Enum.SortOrder.LayoutOrder, 
            FillDirection = Enum.FillDirection.Horizontal
        }), 
        HoverArea = v1.createElement(l_HoverArea_0, {
            AutomaticSize = Enum.AutomaticSize.XY, 
            Cursor = "PointingHand"
        })
    };
    for v39, v40 in v32, nil, nil do
        if v39 <= 4 then
            v38[v40.UserId] = v1.createElement(l_Pane_0, {
                Size = UDim2.fromOffset(18, 24), 
                OnClick = function()
                    v24.OnClick();
                end
            }, {
                Avatar = v1.createElement(v14, {
                    Id = v40.UserId, 
                    IsIdle = v40.IsIdle, 
                    Size = v28.ribbonItem.size, 
                    RingColor = if game:GetFastFlag("COLLAB5718AccessibleColors") then v40.CollaboratorColor3 else BrickColor.new(v40.CollaboratorColor).Color, 
                    BackgroundColor3 = not not v25 and v28.ribbonItem.buttonHover or v28.ribbonItem.background, 
                    BackgroundTransparency = 0
                }), 
                Corner = v1.createElement("UICorner", {
                    CornerRadius = UDim.new(0.5, 0)
                })
            });
        else
            break;
        end;
    end;
    if #v32 > 4 then
        table.insert(v38, v1.createElement(l_Pane_0, {
            Size = v28.ribbonItem.size, 
            BackgroundColor3 = v28.ribbonItem.overflowBackground, 
            BackgroundTransparency = 0, 
            LayoutOrder = 4, 
            ZIndex = 4, 
            OnClick = v24.OnClick
        }, {
            Corner = v1.createElement("UICorner", {
                CornerRadius = UDim.new(0.5, 0)
            }), 
            Text = v1.createElement(l_TextLabel_0, {
                Text = "+" .. #v32 - 4, 
                Position = UDim2.fromOffset(-1, -1), 
                TextSize = 13, 
                Font = Enum.Font.SourceSansSemibold, 
                ZIndex = 5
            })
        }));
    end;
    if v24.Widget then
        local l_StudioWidgetsService_0 = game:GetService("StudioWidgetsService");
        local l_RunService_0 = game:GetService("RunService");
        local l_l_StudioWidgetsService_0_WidgetFromPluginGui_0 = l_StudioWidgetsService_0:GetWidgetFromPluginGui(v24.Widget);
        if not l_RunService_0:IsEdit() then
            l_l_StudioWidgetsService_0_WidgetFromPluginGui_0:SetFixedSize(1, 24);
        else
            local v44 = v23(#v32, true);
            l_l_StudioWidgetsService_0_WidgetFromPluginGui_0:SetFixedSize(v44.X, v44.Y);
        end;
    end;
    return v1.createElement(l_Pane_0, {
        Spacing = 0, 
        BackgroundColor3 = v28.ribbonItem.background
    }, {
        v1.createElement(l_Pane_0, {
            Style = "Box", 
            Size = UDim2.new(0, v23(#v32, false).X, 1, 0), 
            BackgroundColor3 = not not v25 and v28.ribbonItem.buttonHover or v28.ribbonItem.background, 
            Padding = #v32 > 0 and 2 or 0, 
            OnClick = v24.OnClick, 
            [v1.Event.MouseEnter] = function()
                v26(true);
            end, 
            [v1.Event.MouseLeave] = function()
                v26(false);
            end
        }, v38); 
        AddCollaboratorButton = v1.createElement(l_Pane_0, {
            LayoutOrder = 100
        }, {
            v1.createElement(l_IconButton_0, {
                AutomaticSize = Enum.AutomaticSize.X, 
                Size = v28.ribbonItem.size, 
                Position = #v32 > 0 and UDim2.new(1, 0, 0, 0) or UDim2.new(1, -6, 0, 0), 
                AnchorPoint = Vector2.new(1, 0), 
                LeftIcon = v28.ribbonItem.addIcon, 
                OnClick = function()
                    v30:report("manageCollaboratorsPressed");
                    v27:Fire("ToggleManageCollaborators");
                end, 
                Spacing = 4, 
                Padding = 4, 
                HoverColor = v28.ribbonItem.buttonHover, 
                Text = #v32 == 0 and v29:getText("Ribbon", "Collaborate") or nil, 
                BackgroundStyle = "RoundBox", 
                BackgroundColor = v28.ribbonItem.background
            })
        })
    });
end;
