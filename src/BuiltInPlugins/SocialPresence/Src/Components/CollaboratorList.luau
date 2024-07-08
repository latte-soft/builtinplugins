local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_Localization_0 = l_ContextServices_0.Localization;
local l_Analytics_0 = l_ContextServices_0.Analytics;
local l_Stylizer_0 = v2.Style.Stylizer;
local l_UI_0 = v2.UI;
local l_Pane_0 = l_UI_0.Pane;
local l_TextLabel_0 = l_UI_0.TextLabel;
local l_Button_0 = l_UI_0.Button;
local l_Image_0 = l_UI_0.Image;
local l_ScrollingFrame_0 = l_UI_0.ScrollingFrame;
local v13 = require(l_Parent_0.Src.Components.CollaboratorItem);
local v14 = require(l_Parent_0.Src.Components.CollaboratorListFooter);
local v15 = require(l_Parent_0.Src.ContextServices.CollaboratorsServiceContext);
local l_UserId_0 = game:GetService("StudioService"):GetUserId();
return function()
    local v17 = l_Localization_0.use();
    local v18 = l_Stylizer_0:use();
    local v19 = l_Analytics_0:use();
    local l_StudioPublishService_0 = game:GetService("StudioPublishService");
    local v21 = v15:use():get();
    local v22, v23 = v1.useState({});
    local v24, v25 = v1.useState(true);
    local v26, v27 = v1.useState(false);
    local v28 = game.GameId > 0;
    v1.useEffect(function()
        v23((v21:GetCollaboratorsList()));
        local v29 = v21.CollaboratorInstanceCreatedSignal:Connect(function()
            v23(v21:GetCollaboratorsList());
        end);
        local v30 = v21.CollaboratorInstanceDestroyedSignal:Connect(function()
            v23(v21:GetCollaboratorsList());
        end);
        local v31 = v21.CollaboratorStatusUpdatedSignal:Connect(function()
            v23(v21:GetCollaboratorsList());
        end);
        local v32 = v21.CollaboratorIdleUpdate:Connect(function()
            v23(v21:GetCollaboratorsList());
        end);
        return function()
            v29:Disconnect();
            v30:Disconnect();
            v31:Disconnect();
            v32:Disconnect();
        end;
    end, {});
    if #v22 ~= 0 then
        local v33 = {
            Layout = v1.createElement("UIListLayout", {
                FillDirection = Enum.FillDirection.Vertical
            })
        };
        for v34, v35 in v22, nil, nil do
            local v36 = v35.UserId == l_UserId_0 and -1 or v34;
            local l_createElement_0 = v1.createElement;
            local l_v13_0 = v13;
            local v39 = {
                Id = v35.UserId, 
                Username = v35.Username, 
                Color = if game:GetFastFlag("COLLAB5718AccessibleColors") then v35.CollaboratorColor3 else BrickColor.new(v35.CollaboratorColor).Color, 
                IsIdle = v35.IsIdle, 
                Status = tostring(v35.Status), 
                CurDocGUID = v35.CurDocGUID
            };
            local v40 = false;
            if v35.UserId == l_UserId_0 then
                v40 = v26;
            end;
            v39.CanJumpBack = v40;
            v39.OnJump = function()
                v27(v35.UserId ~= l_UserId_0);
            end;
            v33[v36] = l_createElement_0(l_v13_0, v39);
        end;
        return v1.createElement(l_Pane_0, {
            Size = UDim2.fromScale(1, 1)
        }, {
            Body = v1.createElement(l_ScrollingFrame_0, {
                Padding = 8, 
                Size = UDim2.new(1, 0, 1, -(v18.footer.height + v18.highlightToggle.height))
            }, v33), 
            HighlightToggle = v1.createElement("TextButton", {
                Text = v17:getText("Settings", "ShowSelections"), 
                TextXAlignment = Enum.TextXAlignment.Left, 
                TextColor3 = v18.footer.iconColor, 
                TextSize = 16, 
                FontFace = Font.fromEnum(Enum.Font.SourceSans), 
                AutoButtonColor = false, 
                BackgroundColor3 = v18.highlightToggle.background, 
                BorderColor3 = v18.highlightToggle.border, 
                Size = UDim2.new(1, 0, 0, v18.highlightToggle.height), 
                AnchorPoint = Vector2.new(0, 1), 
                Position = UDim2.new(0, 0, 1, -v18.footer.height - 1), 
                ZIndex = 2, 
                [v1.Event.Activated] = function()
                    v21:ToggleSelectionHighlights(not v24);
                    v19:report("highlightsToggled", not v24);
                    v25(not v24);
                end
            }, {
                Padding = v1.createElement("UIPadding", {
                    PaddingLeft = UDim.new(0, 26)
                }), 
                Image = v1.createElement(l_Image_0, {
                    Image = not not v24 and v18.footer.checkedIcon or v18.footer.uncheckedIcon, 
                    Size = UDim2.fromOffset(16, 16), 
                    Position = UDim2.new(0, -6, 0.5, 0), 
                    AnchorPoint = Vector2.new(1, 0.5)
                })
            }), 
            Footer = v1.createElement(v14)
        });
    else
        return v1.createElement(l_Pane_0, {
            Size = UDim2.fromScale(1, 1), 
            Style = "Box"
        }, {
            TeamCreateText = v1.createElement(l_TextLabel_0, {
                Text = not not v28 and v17:getText("Settings", "EnableTeamCreateText") or v17:getText("Settings", "SaveToRobloxText"), 
                Size = UDim2.new(1, 0, 0, 48), 
                Position = UDim2.new(0.5, 0, 0.5, -8), 
                AnchorPoint = Vector2.new(0.5, 1), 
                TextWrapped = true, 
                Style = "Body", 
                TextSize = 16
            }), 
            Button = v1.createElement(l_Button_0, {
                Style = "RoundPrimary", 
                Text = not not v28 and v17:getText("Settings", "EnableTeamCreate") or v17:getText("Settings", "SaveToRoblox"), 
                OnClick = function()
                    if not v28 then
                        l_StudioPublishService_0:ShowSaveOrPublishPlaceToRoblox(false, false, Enum.StudioCloseMode.None);
                        return ;
                    else
                        v21:ToggleTeamCreate(true);
                        return ;
                    end;
                end, 
                Position = UDim2.fromScale(0.5, 0.5), 
                AnchorPoint = Vector2.new(0.5, 0), 
                Size = UDim2.fromOffset(142, 40)
            })
        });
    end;
end;
