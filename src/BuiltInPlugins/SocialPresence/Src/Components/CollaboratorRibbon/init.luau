local l_script_FirstAncestor_0 = script:FindFirstAncestor("SocialPresence");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_Localization_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices.Localization;
local v3 = require(l_script_FirstAncestor_0.Src.ContextServices.CollaboratorsServiceContext);
local v4 = require(l_script_FirstAncestor_0.Src.Components.CollaboratorThumbnail);
local v5 = require(l_script_FirstAncestor_0.Src.Components.AddCollaboratorButton);
local l_TextService_0 = game:GetService("TextService");
local v7 = Vector2.new(1000, 1);
local function v14(v8, v9)
    local v10 = l_Localization_0.use();
    if v8 > 0 then
        local v11 = math.min(v8, 5);
        local v12 = 24 * v11 - (v11 - 1) * 6;
        local v13 = 24;
        if v9 then
            v12 = v12 + 24;
        end;
        return Vector2.new(v12 + 10, v13 + 4);
    else
        return Vector2.new(((24 + l_TextService_0:GetTextSize(v10:getText("Ribbon", "Collaborate"), 18, Enum.Font.SourceSansBold, v7).X) + 4) + 10, 34);
    end;
end;
return function(v15)
    local v16 = v3:use():get();
    local v17, v18 = v1.useState({});
    v1.useEffect(function()
        v18((v16:GetCollaboratorsList()));
        local function v19()
            v18(v16:GetCollaboratorsList());
        end;
        local v20 = v16.CollaboratorInstanceCreatedSignal:Connect(v19);
        local v21 = v16.CollaboratorInstanceDestroyedSignal:Connect(v19);
        local v22 = v16.CollaboratorIdleUpdate:Connect(v19);
        return function()
            v20:Disconnect();
            v21:Disconnect();
            v22:Disconnect();
        end;
    end, {});
    local v23 = {};
    for v24, v25 in v17, nil, nil do
        if v24 <= 4 then
            v23[v25.UserId] = v1.createElement("Frame", {
                Size = UDim2.fromOffset(18, 24), 
                BackgroundTransparency = 1
            }, {
                v1.createElement(v4, {
                    UserId = v25.UserId, 
                    IsIdle = v25.IsIdle, 
                    RingColor = if game:GetFastFlag("COLLAB5718AccessibleColors") then v25.CollaboratorColor3 else BrickColor.new(v25.CollaboratorColor).Color, 
                    [v1.Tag] = "RibbonElement"
                })
            });
        else
            break;
        end;
    end;
    if #v17 > 4 then
        table.insert(v23, v1.createElement("Frame", {
            LayoutOrder = 4, 
            ZIndex = 4, 
            [v1.Tag] = "Component-OverflowBubble RibbonElement"
        }, {
            Text = v1.createElement("TextLabel", {
                Text = "+" .. #v17 - 4, 
                ZIndex = 5, 
                [v1.Tag] = "X-AnchorCenter"
            })
        }));
    end;
    if v15.Widget then
        local l_StudioWidgetsService_0 = game:GetService("StudioWidgetsService");
        local l_RunService_0 = game:GetService("RunService");
        local l_l_StudioWidgetsService_0_WidgetFromPluginGui_0 = l_StudioWidgetsService_0:GetWidgetFromPluginGui(v15.Widget);
        if not l_RunService_0:IsEdit() then
            l_l_StudioWidgetsService_0_WidgetFromPluginGui_0:SetFixedSize(1, 24);
        else
            local v29 = v14(#v17, true);
            l_l_StudioWidgetsService_0_WidgetFromPluginGui_0:SetFixedSize(v29.X, v29.Y);
        end;
    end;
    local v30 = v14(#v17, false);
    local l_createElement_0 = v1.createElement;
    local v32 = "Frame";
    local v33 = {
        BackgroundTransparency = 1, 
        [v1.Tag] = "Component-CollaboratorRibbon X-Row X-Middle"
    };
    local v34 = {};
    local v35 = false;
    if #v17 > 0 then
        v35 = v1.createElement("TextButton", {
            Text = "", 
            Size = UDim2.new(0, v30.X, 1, 0), 
            [v1.Event.Activated] = v15.OnClick, 
            [v1.Tag] = "Button X-Row X-Middle X-PadS"
        }, v23);
    end;
    v34.CollaboratorContainer = v35;
    ??? = v1.createElement(v5, {
        IsTeamCreateOn = #v17 > 0
    });
    setlist { ['R009[1 to ???]'] = 'R010 to ???' };
    return l_createElement_0(v32, v33, v34);
end;
