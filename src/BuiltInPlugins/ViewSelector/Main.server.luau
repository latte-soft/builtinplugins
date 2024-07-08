local l_RunService_0 = game:GetService("RunService");
local l_GuiService_0 = game:GetService("GuiService");
local l_CoreGui_0 = game:GetService("CoreGui");
local l_ContentProvider_0 = game:GetService("ContentProvider");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_InsertService_0 = game:GetService("InsertService");
local l_StudioService_0 = game:GetService("StudioService");
local l_TweenService_0 = game:GetService("TweenService");
local l_Button_0 = plugin:CreateToolbar("ViewSelector"):CreateButton("ViewSelector", "Show View Selector", "");
l_Button_0.ClickableWhenViewportHidden = false;
local v9 = nil;
local v10 = nil;
local v11 = nil;
local v12 = nil;
local v13 = nil;
local v14 = nil;
local v15 = nil;
local v16 = nil;
local v17 = nil;
local v18 = nil;
local v19 = nil;
local v20 = nil;
local v21 = nil;
local v22 = nil;
local v23 = nil;
local v24 = nil;
local v25 = nil;
local v26 = nil;
local v27 = nil;
local v28 = nil;
local v29 = nil;
local v30 = nil;
local v31 = nil;
local v32 = nil;
local v33 = {};
local v34 = {
    Normal = {}, 
    Hover = {}
};
local function v47()
    v15 = l_CoreGui_0:FindFirstChild("ViewSelectorScreenGui");
    if v15 then
        v15:Destroy();
        l_RunService_0:UnbindFromRenderStep("ViewSelectorAfterCamera");
    end;
    v15 = l_InsertService_0:LoadLocalAsset("rbxasset://models/ViewSelector/ViewSelector.rbxm");
    v15.Parent = l_CoreGui_0;
    v15.Enabled = false;
    v16 = v15:WaitForChild("Panel");
    v17 = v16:WaitForChild("Viewport");
    v18 = v17.AbsoluteSize.x;
    v28 = v17:WaitForChild("EventReceiver");
    v19 = v17:WaitForChild("Model");
    v20 = v16:WaitForChild("X");
    v21 = v16:WaitForChild("Y");
    v22 = v16:WaitForChild("Z");
    v26 = v16:WaitForChild("ArrowButtons");
    v26.Visible = false;
    v27 = false;
    v14 = Instance.new("Camera");
    v14.Parent = v17;
    v14.CFrame = CFrame.new(Vector3.new(0, 0, 0), (Vector3.new(0, 0, -1)));
    v14.FieldOfView = 70;
    v17.CurrentCamera = v14;
    local l_LocalizedStrings_0 = script.Parent.LocalizedStrings;
    local l_l_LocalizedStrings_0_Translator_0 = l_LocalizedStrings_0:GetTranslator(l_StudioService_0.StudioLocaleId);
    local l_l_LocalizedStrings_0_Translator_1 = l_LocalizedStrings_0:GetTranslator("en-us");
    local l_v19_Children_0 = v19:GetChildren();
    for v39 = 1, #l_v19_Children_0 do
        local v40 = l_v19_Children_0[v39];
        if not (v40.ClassName ~= "Part") or v40.ClassName == "MeshPart" then
            v40.CFrame = v19.CFrame:ToObjectSpace(v40.CFrame);
        elseif v40.ClassName == "Decal" then
            local l_Name_0 = v40.Name;
            local v42 = v40.Name .. "_hover";
            if not pcall(function()
                v34.Normal[v40.Name] = l_l_LocalizedStrings_0_Translator_0:FormatByKey(l_Name_0);
                v34.Hover[v40.Name] = l_l_LocalizedStrings_0_Translator_0:FormatByKey(v42);
            end) then
                v34.Normal[v40.Name] = l_l_LocalizedStrings_0_Translator_1:FormatByKey(l_Name_0);
                v34.Hover[v40.Name] = l_l_LocalizedStrings_0_Translator_1:FormatByKey(v42);
            end;
            v40.Texture = v34.Normal[v40.Name];
        end;
    end;
    v19.CFrame = CFrame.new();
    local v43 = {
        "n", 
        "0", 
        "p"
    };
    for v44 = -1, 1 do
        for v45 = -1, 1 do
            for v46 = -1, 1 do
                v33[v43[v44 + 2] .. v43[v45 + 2] .. v43[v46 + 2]] = CFrame.new(Vector3.new(), Vector3.new(-v44, -v45, -v46).Unit);
            end;
        end;
    end;
    v33["0p0"] = CFrame.fromEulerAnglesYXZ(-1.5707963267948966, 3.141592653589793, 0);
    v33["0n0"] = CFrame.fromEulerAnglesXYZ(-1.5707963267948966, 3.141592653589793, 0);
    v23 = Vector3.new(0.576, -0.48, -0.48);
    v24 = Vector3.new(-0.48, 0.576, -0.48);
    v25 = Vector3.new(-0.48, -0.48, 0.576);
    v9 = plugin:GetSetting("ViewSelector_Active");
    if v9 == nil then
        v9 = true;
    end;
    l_Button_0:SetActive(v9);
end;
local function _()
    local l_CameraType_0 = game.Workspace.CurrentCamera.CameraType;
    if not (l_CameraType_0 ~= Enum.CameraType.Attach) or l_CameraType_0 == Enum.CameraType.Scriptable then
        return true;
    else
        return false;
    end;
end;
local function v61(v50, v51)
    local v52 = -100;
    local v53 = 100;
    local v54 = -v50;
    local function v60(v55, v56)
        if math.abs(v56) > 0.001 then
            local v57 = (v55 + 0.48) / v56;
            local v58 = (v55 - 0.48) / v56;
            if v58 < v57 then
                local l_v58_0 = v58;
                v58 = v57;
                v57 = l_v58_0;
            end;
            if v52 < v57 then
                v52 = v57;
            end;
            if v58 < v53 then
                v53 = v58;
            end;
            if v53 < v52 then
                return 0;
            elseif v53 < 0 then
                return 0;
            end;
        elseif not (-v55 - 0.48 <= 0) or -v55 + 0.48 < 0 then
            return 0;
        end;
    end;
    if v60(v54.X, v51.X) == 0 then
        return ;
    elseif v60(v54.Y, v51.Y) == 0 then
        return ;
    elseif v60(v54.Z, v51.Z) == 0 then
        return ;
    elseif v52 > 0 then
        return v50 + v51 * v52;
    else
        return v50 + v51 * v53;
    end;
end;
local function _(v62)
    if v62 then
        if v62.ClassName == "Decal" then
            v62.Texture = v34.Hover[v62.Name];
            return ;
        else
            v62.Transparency = 0.3;
            return ;
        end;
    else
        return ;
    end;
end;
local function _(v64)
    if v64 then
        if v64.ClassName == "Decal" then
            v64.Texture = v34.Normal[v64.Name];
            return ;
        else
            v64.Transparency = 1;
            return ;
        end;
    else
        return ;
    end;
end;
local function v72(v66)
    local v67 = math.abs(v66.x);
    local v68 = math.abs(v66.y);
    local v69 = math.abs(v66.z);
    local function _(v70)
        if v70 >= 0 then
            return "p";
        else
            return "n";
        end;
    end;
    if (v67 + v68) + v69 > 1.056 then
        return (v66.x >= 0 and "p" or "n") .. (v66.y >= 0 and "p" or "n") .. (v66.z >= 0 and "p" or "n");
    elseif v68 < v67 and v69 < v67 then
        return (v66.x >= 0 and "p" or "n") .. "00";
    elseif v67 < v68 and v69 < v68 then
        return "0" .. (v66.y >= 0 and "p" or "n") .. "0";
    else
        return "00" .. (v66.z >= 0 and "p" or "n");
    end;
end;
local function _(v73, v74)
    local l_l_GuiService_0_GuiInset_0 = l_GuiService_0:GetGuiInset();
    return (v73 - v17.AbsolutePosition.X) - l_l_GuiService_0_GuiInset_0.x, (v74 - v17.AbsolutePosition.Y) - l_l_GuiService_0_GuiInset_0.y;
end;
local function v85(v77, v78)
    local l_CameraType_1 = game.Workspace.CurrentCamera.CameraType;
    if not (l_CameraType_1 == Enum.CameraType.Attach or l_CameraType_1 == Enum.CameraType.Scriptable) then
        local l_l_GuiService_0_GuiInset_1 = l_GuiService_0:GetGuiInset();
        l_l_GuiService_0_GuiInset_1 = v14:ViewportPointToRay(((v77 - v17.AbsolutePosition.X) - l_l_GuiService_0_GuiInset_1.x) / v18, ((v78 - v17.AbsolutePosition.Y) - l_l_GuiService_0_GuiInset_1.y) / v18, 0);
        local v81 = v61(l_l_GuiService_0_GuiInset_1.Origin, l_l_GuiService_0_GuiInset_1.Direction);
        if not v81 then
            local l_v13_0 = v13;
            if l_v13_0 then
                if l_v13_0.ClassName == "Decal" then
                    l_v13_0.Texture = v34.Normal[l_v13_0.Name];
                else
                    l_v13_0.Transparency = 1;
                end;
            end;
            v13 = nil;
        else
            local v83 = v19[v72(v81)];
            if v13 ~= v83 then
                local l_v13_1 = v13;
                if l_v13_1 then
                    if l_v13_1.ClassName == "Decal" then
                        l_v13_1.Texture = v34.Normal[l_v13_1.Name];
                    else
                        l_v13_1.Transparency = 1;
                    end;
                end;
                if v83 then
                    if v83.ClassName == "Decal" then
                        v83.Texture = v34.Hover[v83.Name];
                    else
                        v83.Transparency = 0.3;
                    end;
                end;
                v13 = v83;
                return ;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
local function v89()
    if v27 then
        local l_LookVector_0 = v10.LookVector;
        local function _(v87)
            return math.abs(math.abs((l_LookVector_0:Dot(v87))) - 1) < 0.001;
        end;
        v26.Visible = (math.abs(math.abs((l_LookVector_0:Dot((Vector3.new(1, 0, 0))))) - 1) < 0.001 or math.abs(math.abs((l_LookVector_0:Dot((Vector3.new(0, 1, 0))))) - 1) < 0.001) or math.abs(math.abs((l_LookVector_0:Dot((Vector3.new(0, 0, 1))))) - 1) < 0.001;
        return ;
    else
        return ;
    end;
end;
local function v90()
    v27 = true;
    v89();
end;
local function v92()
    local l_v13_2 = v13;
    if l_v13_2 then
        if l_v13_2.ClassName == "Decal" then
            l_v13_2.Texture = v34.Normal[l_v13_2.Name];
        else
            l_v13_2.Transparency = 1;
        end;
    end;
    v13 = nil;
    v26.Visible = false;
    v27 = false;
end;
local function v96(v93)
    if v11 then
        if v93.UserInputType == Enum.UserInputType.MouseMovement then
            local l_x_0 = v93.Position.x;
            local l_y_0 = v93.Position.y;
            if math.abs(v11.x - l_x_0) + math.abs(v11.y - l_y_0) > 5 then
                v16.Position = UDim2.new(v12.X.Scale, (v12.X.Offset + l_x_0) - v11.x, v12.Y.Scale, (v12.Y.Offset + l_y_0) - v11.y);
            end;
        end;
        return ;
    else
        return ;
    end;
end;
local function v110()
    local function _(v97, v98)
        local v99 = game.Workspace.CurrentCamera.ViewportSize[v97];
        local v100 = 0.5;
        local v101 = 0.5;
        if v18 < v99 then
            v100 = plugin:GetSetting("ViewSelector_Position" .. v97) or v98;
            v101 = (v100 * (v99 - v18) + v100 * v18) / v99;
        end;
        return v100, v101;
    end;
    local l_X_0 = game.Workspace.CurrentCamera.ViewportSize.X;
    local v104 = 0.5;
    local v105 = 0.5;
    if v18 < l_X_0 then
        v104 = plugin:GetSetting("ViewSelector_Position" .. "X") or 1;
        v105 = (v104 * (l_X_0 - v18) + v104 * v18) / l_X_0;
    end;
    local l_v104_0 = v104;
    local l_v105_0 = v105;
    v105 = game.Workspace.CurrentCamera.ViewportSize.Y;
    local v108 = 0.5;
    local v109 = 0.5;
    if v18 < v105 then
        v108 = plugin:GetSetting("ViewSelector_Position" .. "Y") or 0;
        v109 = (v108 * (v105 - v18) + v108 * v18) / v105;
    end;
    l_X_0 = v108;
    v104 = v109;
    v16.AnchorPoint = Vector2.new(l_v104_0, l_X_0);
    v16.Position = UDim2.new(l_v105_0, 0, v104, 0);
end;
local function v126()
    local function _(v111)
        local v112 = game.Workspace.CurrentCamera.ViewportSize[v111];
        local v113 = 0.5;
        local v114 = 0.5;
        if v18 < v112 then
            local v115 = math.clamp(v16.AbsolutePosition[v111], 0, v112 - v18);
            v113 = v115 / (v112 - v18);
            v114 = (v115 + v113 * v18) / v112;
        end;
        plugin:SetSetting("ViewSelector_Position" .. v111, v113);
        return v113, v114;
    end;
    local l_X_1 = game.Workspace.CurrentCamera.ViewportSize.X;
    local v118 = 0.5;
    local v119 = 0.5;
    if v18 < l_X_1 then
        local v120 = math.clamp(v16.AbsolutePosition.X, 0, l_X_1 - v18);
        v118 = v120 / (l_X_1 - v18);
        v119 = (v120 + v118 * v18) / l_X_1;
    end;
    plugin:SetSetting("ViewSelector_Position" .. "X", v118);
    local l_v118_0 = v118;
    local l_v119_0 = v119;
    v119 = game.Workspace.CurrentCamera.ViewportSize.Y;
    local v123 = 0.5;
    local v124 = 0.5;
    if v18 < v119 then
        local v125 = math.clamp(v16.AbsolutePosition.Y, 0, v119 - v18);
        v123 = v125 / (v119 - v18);
        v124 = (v125 + v123 * v18) / v119;
    end;
    plugin:SetSetting("ViewSelector_Position" .. "Y", v123);
    l_X_1 = v123;
    v118 = v124;
    v16.AnchorPoint = Vector2.new(l_v118_0, l_X_1);
    v16.Position = UDim2.new(l_v119_0, 0, v118, 0);
end;
local function v128(v127)
    if not (not (v127.UserInputType == Enum.UserInputType.MouseButton1) or not v11) then
        v11 = nil;
        v126();
    end;
end;
local function v131(v129, v130)
    v11 = Vector2.new(v129, v130);
    v12 = v16.Position;
end;
local function _(v132)
    local l_CurrentCamera_0 = game.Workspace.CurrentCamera;
    local l_Position_0 = l_CurrentCamera_0.Focus.Position;
    local v135 = l_Position_0 - v132.LookVector * (l_Position_0 - l_CurrentCamera_0.CFrame.Position).Magnitude;
    v32 = l_Position_0;
    v31 = v132 + v135;
    v30 = l_CurrentCamera_0.CFrame;
    v29 = 0;
end;
local function v144(v137, v138)
    if v11 then
        local v139 = math.abs(v11.x - v137) + math.abs(v11.y - v138);
        v11 = nil;
        if v139 <= 5 then
            if v13 then
                local v140 = v33[v13.Name];
                local l_CurrentCamera_1 = game.Workspace.CurrentCamera;
                local l_Position_1 = l_CurrentCamera_1.Focus.Position;
                local v143 = l_Position_1 - v140.LookVector * (l_Position_1 - l_CurrentCamera_1.CFrame.Position).Magnitude;
                v32 = l_Position_1;
                v31 = v140 + v143;
                v30 = l_CurrentCamera_1.CFrame;
                v29 = 0;
                return ;
            end;
        else
            v126();
        end;
        return ;
    else
        return ;
    end;
end;
local function _()
    local function v150(v145, v146)
        local v147 = v19.CFrame * v146;
        if v146:Dot(v10.LookVector) < 0 then
            v145.ZIndex = v17.ZIndex + 1;
        else
            v145.ZIndex = v17.ZIndex - 1;
        end;
        local v148, v149 = v14:WorldToViewportPoint(v147);
        if not v149 then
            v145.Visible = false;
            return ;
        else
            v145.Visible = true;
            v145.Position = UDim2.new(0, v148.x * v18, 0, v148.y * v18);
            return ;
        end;
    end;
    v150(v20, v23);
    v150(v21, v24);
    v150(v22, v25);
end;
local function v161(v152)
    local l_CurrentCamera_2 = game.Workspace.CurrentCamera;
    if v29 then
        v29 = v29 + v152;
        if v29 > 0.2 then
            l_CurrentCamera_2.CFrame = v31;
            l_CurrentCamera_2.Focus = CFrame.new(v32);
            v29 = nil;
        else
            l_CurrentCamera_2.CFrame = v30:Lerp(v31, v29 / 0.2);
        end;
    end;
    local l_CFrame_0 = l_CurrentCamera_2.CFrame;
    v14.CFrame = CFrame.fromMatrix(-l_CFrame_0.LookVector * 1.9, l_CFrame_0.RightVector, l_CFrame_0.UpVector, -l_CFrame_0.LookVector);
    if v14.CFrame ~= v10 then
        v10 = v14.CFrame;
        v17.LightDirection = (v10 - v10.Position):ToWorldSpace(CFrame.new(-1, -1, -1)).Position;
        local function v160(v155, v156)
            local v157 = v19.CFrame * v156;
            if v156:Dot(v10.LookVector) < 0 then
                v155.ZIndex = v17.ZIndex + 1;
            else
                v155.ZIndex = v17.ZIndex - 1;
            end;
            local v158, v159 = v14:WorldToViewportPoint(v157);
            if not v159 then
                v155.Visible = false;
                return ;
            else
                v155.Visible = true;
                v155.Position = UDim2.new(0, v158.x * v18, 0, v158.y * v18);
                return ;
            end;
        end;
        v160(v20, v23);
        v160(v21, v24);
        v160(v22, v25);
        v89();
    end;
end;
local function v163(v162)
    if v15.Enabled == v162 then
        return ;
    else
        plugin:SetSetting("ViewSelector_Active", v162);
        if not v162 then
            l_RunService_0:UnbindFromRenderStep("ViewSelectorAfterCamera");
        else
            pcall(function()
                l_ContentProvider_0:PreloadAsync({
                    v15
                });
            end);
            v161(0);
            l_RunService_0:BindToRenderStep("ViewSelectorAfterCamera", Enum.RenderPriority.Camera.Value + 1, v161);
            v110();
        end;
        l_Button_0:SetActive(v162);
        v15.Enabled = v162;
        return ;
    end;
end;
local function v164()
    v9 = not v9;
    v163(v9);
end;
local function v173(v165, v166)
    v165.MouseButton1Click:connect(function()
        local v167 = CFrame.fromAxisAngle(-v10.RightVector * v166.y + v10.UpVector * v166.x, 1.5707963267948966) * v10.LookVector;
        local v168 = v61(-v167 * 2, v167);
        if v168 then
            local v169 = v33[v72(v168)];
            local l_CurrentCamera_3 = game.Workspace.CurrentCamera;
            local l_Position_2 = l_CurrentCamera_3.Focus.Position;
            local v172 = l_Position_2 - v169.LookVector * (l_Position_2 - l_CurrentCamera_3.CFrame.Position).Magnitude;
            v32 = l_Position_2;
            v31 = v169 + v172;
            v30 = l_CurrentCamera_3.CFrame;
            v29 = 0;
        end;
    end);
    v165.MouseButton1Up:connect(v144);
    v165.MouseEnter:Connect(function()
        v165.ImageColor3 = Color3.fromRGB(79, 178, 229);
        v165.ImageTransparency = 0;
    end);
    v165.MouseLeave:Connect(function()
        v165.ImageColor3 = Color3.fromRGB(247, 249, 255);
        v165.ImageTransparency = 0.6;
    end);
end;
if l_RunService_0:IsEdit() or l_RunService_0:IsServer() then
    v47();
    v163(v9);
    l_Button_0.Click:connect(v164);
    v28.MouseMoved:connect(v85);
    v28.MouseEnter:connect(v90);
    v28.MouseLeave:connect(v92);
    v28.MouseButton1Down:connect(v131);
    v28.MouseButton1Up:connect(v144);
    l_UserInputService_0.InputChanged:connect(v96);
    l_UserInputService_0.InputEnded:connect(v128);
    v173(v26.RightArrow, Vector2.new(1, 0));
    v173(v26.LeftArrow, Vector2.new(-1, 0));
    v173(v26.UpArrow, Vector2.new(0, 1));
    v173(v26.DownArrow, Vector2.new(0, -1));
    if not game:GetEngineFeature("NewCameraControls") then
        v16:WaitForChild("CamSpeed"):Destroy();
    else
        local v174 = TweenInfo.new(0.2, Enum.EasingStyle.Linear);
        local l_CamSpeed_0 = v16:WaitForChild("CamSpeed");
        local l_Slider_0 = l_CamSpeed_0:WaitForChild("Slider");
        local l_X_2 = l_CamSpeed_0.AbsoluteSize.X;
        local v178 = l_TweenService_0:Create(l_CamSpeed_0, v174, {
            TextTransparency = 1, 
            BackgroundTransparency = 1
        });
        local v179 = l_TweenService_0:Create(l_Slider_0, v174, {
            BackgroundTransparency = 1
        });
        local v180 = nil;
        local v181 = {
            mouseOverViewSelector = false, 
            mouseOverSlider = false, 
            isDraggingSlider = false
        };
        do
            local l_v180_0 = v180;
            local function v183()
                v178:Cancel();
                v179:Cancel();
                if l_v180_0 then
                    task.cancel(l_v180_0);
                end;
                l_CamSpeed_0.TextTransparency = 0.1;
                l_Slider_0.BackgroundTransparency = 0.1;
                if not v181.isDraggingSlider then
                    l_CamSpeed_0.BackgroundTransparency = 0.6;
                else
                    l_CamSpeed_0.BackgroundTransparency = 0.4;
                end;
                if not v181.mouseOverSlider and not v181.isDraggingSlider then
                    l_CamSpeed_0.UIStroke.Transparency = 1;
                else
                    l_CamSpeed_0.UIStroke.Transparency = 0.1;
                end;
                if not ((v181.mouseOverViewSelector or v181.mouseOverSlider) or v181.isDraggingSlider) then
                    l_v180_0 = task.delay(3.5, function()
                        v178:Play();
                        v179:Play();
                    end);
                end;
            end;
            local function v185()
                local v184 = settings().Studio["Camera Speed"];
                l_CamSpeed_0.Text = string.format("%.1f", v184);
                l_Slider_0.Size = UDim2.new(0, math.max(10, (math.min((v184 / 20) * l_X_2, l_X_2))), 1, 0);
            end;
            settings().Studio:GetPropertyChangedSignal("Camera Speed"):Connect(function()
                v185();
                v183();
            end);
            v28.MouseEnter:Connect(function()
                v181.mouseOverViewSelector = true;
                v183();
            end);
            v28.MouseLeave:Connect(function()
                v181.mouseOverViewSelector = false;
                v183();
            end);
            l_CamSpeed_0.MouseEnter:Connect(function()
                v181.mouseOverSlider = true;
                v183();
            end);
            l_CamSpeed_0.MouseLeave:Connect(function()
                v181.mouseOverSlider = false;
                v183();
            end);
            l_CamSpeed_0.MouseButton1Down:Connect(function()
                v181.isDraggingSlider = true;
                v183();
                while true do
                    settings().Studio["Camera Speed"] = math.min(20, (math.max(0.1, ((l_UserInputService_0:GetMouseLocation().X - l_CamSpeed_0.AbsolutePosition.X) / l_X_2) * 20)));
                    l_RunService_0.RenderStepped:Wait();
                    if not l_UserInputService_0:IsMouseButtonPressed(Enum.UserInputType.MouseButton1) then
                        break;
                    end;
                end;
                v181.isDraggingSlider = false;
                v183();
            end);
            v185();
            l_CamSpeed_0.BackgroundTransparency = 1;
            l_CamSpeed_0.TextTransparency = 1;
            l_CamSpeed_0.UIStroke.Transparency = 1;
            l_Slider_0.BackgroundTransparency = 1;
        end;
    end;
    return ;
else
    l_Button_0.Enabled = false;
    return ;
end;
