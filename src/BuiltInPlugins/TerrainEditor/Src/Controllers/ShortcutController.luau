local l_script_FirstAncestor_0 = script:FindFirstAncestor("TerrainEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_ContextServices_0 = v1.ContextServices;
local l_ContextItem_0 = l_ContextServices_0.ContextItem;
local l_PluginActions_0 = l_ContextServices_0.PluginActions;
local l_Signal_0 = v1.Util.Signal;
local v6 = require(l_script_FirstAncestor_0.Src.Resources.Constants);
local v7 = require(l_script_FirstAncestor_0.Src.Util.getMaterials);
local v8 = require(l_script_FirstAncestor_0.Src.Types);
local l_BrushMode_0 = v8.BrushMode;
local l_BrushSettings_0 = v8.BrushSettings;
local l_MaterialSettings_0 = v8.MaterialSettings;
local l_PluginAction_0 = v8.PluginAction;
local v13 = l_ContextItem_0:extend("ShortcutController");
v13.new = function(v14, v15)
    assert(v14, "ShortcutController.new() requires a plugin");
    local function _(v16)
        return v15:getText("PluginActions", v16 .. "StatusTip");
    end;
    local function _(v18)
        return v15:getText("PluginActions", v18 .. "Text");
    end;
    local v20 = setmetatable({
        _mouse = v14:GetMouse(), 
        _pluginActions = l_PluginActions_0.new(v14, {
            EditPlane = {
                allowBinding = false, 
                defaultShortcut = "ctrl+shift+space", 
                id = l_PluginAction_0.EditPlane, 
                statusTip = v15:getText("PluginActions", l_PluginAction_0.EditPlane .. "StatusTip"), 
                text = v15:getText("PluginActions", l_PluginAction_0.EditPlane .. "Text")
            }, 
            CopySelected = {
                allowBinding = false, 
                defaultShortcut = "ctrl+c", 
                id = l_PluginAction_0.CopySelected, 
                statusTip = v15:getText("PluginActions", l_PluginAction_0.CopySelected .. "StatusTip"), 
                text = v15:getText("PluginActions", l_PluginAction_0.CopySelected .. "Text")
            }, 
            CutSelected = {
                allowBinding = false, 
                defaultShortcut = "ctrl+x", 
                id = l_PluginAction_0.CutSelected, 
                statusTip = v15:getText("PluginActions", l_PluginAction_0.CutSelected .. "StatusTip"), 
                text = v15:getText("PluginActions", l_PluginAction_0.CutSelected .. "Text")
            }, 
            DeleteSelected = {
                allowBinding = false, 
                defaultShortcut = "delete", 
                id = l_PluginAction_0.DeleteSelected, 
                statusTip = v15:getText("PluginActions", l_PluginAction_0.DeleteSelected .. "StatusTip"), 
                text = v15:getText("PluginActions", l_PluginAction_0.DeleteSelected .. "Text")
            }, 
            PasteSelected = {
                allowBinding = false, 
                defaultShortcut = "ctrl+v", 
                id = l_PluginAction_0.PasteSelected, 
                statusTip = v15:getText("PluginActions", l_PluginAction_0.PasteSelected .. "StatusTip"), 
                text = v15:getText("PluginActions", l_PluginAction_0.PasteSelected .. "Text")
            }, 
            DuplicateSelected = {
                allowBinding = false, 
                defaultShortcut = "ctrl+d", 
                id = l_PluginAction_0.DuplicateSelected, 
                statusTip = v15:getText("PluginActions", l_PluginAction_0.DuplicateSelected .. "StatusTip"), 
                text = v15:getText("PluginActions", l_PluginAction_0.DuplicateSelected .. "Text")
            }, 
            Apply = {
                allowBinding = false, 
                defaultShortcut = "return", 
                id = l_PluginAction_0.Apply, 
                statusTip = v15:getText("PluginActions", l_PluginAction_0.Apply .. "StatusTip"), 
                text = v15:getText("PluginActions", l_PluginAction_0.Apply .. "Text")
            }, 
            Cancel = {
                allowBinding = false, 
                defaultShortcut = "escape", 
                id = l_PluginAction_0.Quit, 
                statusTip = v15:getText("PluginActions", l_PluginAction_0.Quit .. "StatusTip"), 
                text = v15:getText("PluginActions", l_PluginAction_0.Quit .. "Text")
            }
        }), 
        _cachedValues = {}, 
        _originalValues = {}, 
        _userInputService = game:GetService("UserInputService"), 
        _workspace = game:GetService("Workspace"), 
        _reservedMouseMove = {}, 
        _reservedMouseDown = {}, 
        _brushMouse = {}, 
        _brushScrollWheel = {}, 
        MouseDownAction = l_Signal_0.new(), 
        MouseMoveAction = l_Signal_0.new()
    }, v13);
    v20._mouse.Button1Down:Connect(function()
        v20._mouseDown = true;
        if not v20:isMouseDownReserved() then
            v20.MouseDownAction:Fire();
        end;
    end);
    v20._mouse.Button1Up:Connect(function()
        v20._mouseDown = false;
    end);
    v20._mouse.Move:Connect(function()
        if not v20:isMouseMoveReserved() then
            v20.MouseMoveAction:Fire();
        end;
    end);
    return v20;
end;
v13.isMouseMoveReserved = function(v21)
    return #v21._reservedMouseMove ~= 0;
end;
v13.isMouseDownReserved = function(v22)
    return #v22._reservedMouseDown ~= 0;
end;
v13.isAltDown = function(v23)
    return v23._userInputService:IsKeyDown(Enum.KeyCode.LeftAlt) or v23._userInputService:IsKeyDown(Enum.KeyCode.RightAlt);
end;
v13.isShiftDown = function(v24)
    return v24._userInputService:IsKeyDown(Enum.KeyCode.LeftShift) or v24._userInputService:IsKeyDown(Enum.KeyCode.RightShift);
end;
v13.isControlDown = function(v25)
    return v25._userInputService:IsKeyDown(Enum.KeyCode.LeftControl) or v25._userInputService:IsKeyDown(Enum.KeyCode.RightControl);
end;
v13.isBDown = function(v26)
    return v26._userInputService:IsKeyDown(Enum.KeyCode.B);
end;
v13.onBrushChanged = function(v27, v28, v29, v30)
    local function _()
        return v30((math.clamp(math.floor((v27._originalValues[v28] + v27._cachedValues[v28]) * 100) / 100, 0, 1)));
    end;
    local function v33()
        local v32 = table.clone(v29);
        v32.Size = math.clamp(math.floor(v27._originalValues[v28].Size + v27._cachedValues[v28].Size), 1, 64);
        v32.Height = math.clamp(math.floor(v27._originalValues[v28].Height + v27._cachedValues[v28].Height), 1, 64);
        return v30(v32);
    end;
    local function v41(v34, v35)
        local function _()
            if v35 then
                v27._workspace.CurrentCamera:Zoom(-v34);
            end;
        end;
        if v27:isShiftDown() and v28 == l_BrushSettings_0.Strength then
            local l__cachedValues_0 = v27._cachedValues;
            local l_v28_0 = v28;
            l__cachedValues_0[l_v28_0] = l__cachedValues_0[l_v28_0] + v34 / 100;
            if v35 then
                v27._workspace.CurrentCamera:Zoom(-v34);
            end;
            l__cachedValues_0 = v30((math.clamp(math.floor((v27._originalValues[v28] + v27._cachedValues[v28]) * 100) / 100, 0, 1)));
            return ;
        elseif v27:isControlDown() and v28 == l_BrushSettings_0.BrushSize then
            local v39 = v27._cachedValues[v28];
            v39.Height = v39.Height + v34;
            if v29.Locked then
                v27._cachedValues[v28].Size = v27._cachedValues[v28].Height;
            end;
            v33();
            return ;
        else
            if not (v27:isShiftDown() or v27:isControlDown()) and v28 == l_BrushSettings_0.BrushSize then
                local v40 = v27._cachedValues[v28];
                v40.Size = v40.Size + v34;
                if v29.Locked then
                    v27._cachedValues[v28].Height = v27._cachedValues[v28].Size;
                end;
                if v35 then
                    v27._workspace.CurrentCamera:Zoom(-v34);
                end;
                v33();
            end;
            return ;
        end;
    end;
    local function v44(v42)
        if v27:isBDown() then
            local v43 = table.find(v27._reservedMouseMove, v28);
            if v43 then
                table.remove(v27._reservedMouseDown, v43);
            end;
            v27._brushScrollWheel[v28] = true;
            v41(v42, true);
            return ;
        else
            return ;
        end;
    end;
    local function v47()
        if v27:isBDown() and not v27._brushScrollWheel[v28] then
            local v45 = Vector2.new(v27._mouse.X, v27._mouse.Y);
            local v46 = v45 - v27._brushMouse[v28];
            v27._brushMouse[v28] = v45;
            v41(v46.X / 10, false);
            return ;
        else
            return ;
        end;
    end;
    return {
        v27._userInputService.InputChanged:Connect(function(v48)
            if v48.UserInputType == Enum.UserInputType.MouseMovement then
                v47();
                return ;
            else
                if v48.UserInputType == Enum.UserInputType.MouseWheel then
                    v44(v48.Position.Z);
                end;
                return ;
            end;
        end), 
        v27._userInputService.InputBegan:Connect(function(v49)
            if v49.KeyCode == Enum.KeyCode.B then
                if not v27._cachedValues[v28] then
                    if v28 == l_BrushSettings_0.BrushSize then
                        v27._originalValues[v28] = {
                            Height = v29.Height, 
                            Size = v29.Size
                        };
                        v27._cachedValues[v28] = {
                            Height = 0, 
                            Size = 0
                        };
                    else
                        v27._originalValues[v28] = v29;
                        v27._cachedValues[v28] = 0;
                    end;
                end;
                v27._brushScrollWheel[v28] = false;
                v27._brushMouse[v28] = Vector2.new(v27._mouse.X, v27._mouse.Y);
                v27._cameraPosition = v27._workspace.CurrentCamera.CFrame;
                if not v27._mouseDown then
                    if not table.find(v27._reservedMouseMove, v28) then
                        table.insert(v27._reservedMouseMove, v28);
                    end;
                else
                    v27._brushScrollWheel[v28] = true;
                    return ;
                end;
            end;
        end), 
        v27._userInputService.InputEnded:Connect(function(v50)
            if v50.KeyCode == Enum.KeyCode.B then
                local v51 = table.find(v27._reservedMouseMove, v28);
                if v51 then
                    table.remove(v27._reservedMouseMove, v51);
                end;
                v27._cachedValues[v28] = nil;
            end;
        end)
    };
end;
v13.onMaterialPicked = function(v52, v53, v54)
    local function _(v55)
        local v56 = true;
        if v55.KeyCode ~= Enum.KeyCode.LeftAlt then
            v56 = v55.KeyCode == Enum.KeyCode.RightAlt;
        end;
        return v56;
    end;
    return {
        v52._mouse.Button1Down:Connect(function()
            if v52:isAltDown() then
                local l_Position_0 = v52._mouse.Origin.Position;
                local l_Direction_0 = v52._mouse.UnitRay.Direction;
                local v60 = RaycastParams.new();
                v60.BruteForceAllSlow = true;
                local v61 = v52._workspace:Raycast(l_Position_0, l_Direction_0 * v6.RayLength, v60);
                if not (not v61 or not v61.Material) then
                    if table.find(v7(), v61.Material) then
                        if v52:isShiftDown() and v53 == l_MaterialSettings_0.TargetMaterial then
                            v54(v61.Material);
                            return ;
                        elseif v53 == l_MaterialSettings_0.SourceMaterial then
                            v54(v61.Material);
                        end;
                    else
                        return ;
                    end;
                end;
            end;
        end), 
        v52._userInputService.InputBegan:Connect(function(v62)
            local v63 = true;
            if v62.KeyCode ~= Enum.KeyCode.LeftAlt then
                v63 = v62.KeyCode == Enum.KeyCode.RightAlt;
            end;
            if v63 then
                table.insert(v52._reservedMouseDown, v53);
            end;
        end), 
        v52._userInputService.InputEnded:Connect(function(v64)
            local v65 = true;
            if v64.KeyCode ~= Enum.KeyCode.LeftAlt then
                v65 = v64.KeyCode == Enum.KeyCode.RightAlt;
            end;
            if v65 then
                v65 = table.find(v52._reservedMouseDown, v53);
                if v65 then
                    table.remove(v52._reservedMouseDown, v65);
                end;
            end;
        end)
    };
end;
v13.onBrushMode = function(v66, v67, v68)
    local function v70(v69)
        if not (v69.KeyCode ~= Enum.KeyCode.LeftControl) or v69.KeyCode == Enum.KeyCode.RightControl then
            if not v66:isControlDown() or v66._controlWasDown then
                if not (v66:isControlDown() or not v66._controlWasDown) then
                    v67(v68);
                    v66._controlWasDown = false;
                end;
            else
                v67(if v68 == l_BrushMode_0.Add then l_BrushMode_0.Subtract else l_BrushMode_0.Add);
                v66._controlWasDown = true;
                return ;
            end;
        end;
    end;
    return {
        v66._userInputService.InputBegan:Connect(v70), 
        v66._userInputService.InputEnded:Connect(v70)
    };
end;
v13.onTemporarySmooth = function(v71, v72)
    local function v74(v73)
        if not (v73.KeyCode ~= Enum.KeyCode.LeftShift) or v73.KeyCode == Enum.KeyCode.RightShift then
            v72(v71:isShiftDown());
        end;
    end;
    return {
        v71._userInputService.InputBegan:Connect(v74), 
        v71._userInputService.InputEnded:Connect(v74)
    };
end;
v13.onToggleEdit = function(v75, v76, v77)
    if not v75._toggleEditEnabled then
        v75:Enable(l_PluginAction_0.EditPlane);
        v75._toggleEditEnabled = true;
    end;
    v75._manualPlaneLock = v76;
    return {
        v75._pluginActions:get(l_PluginAction_0.EditPlane).Triggered:Connect(function()
            v75._manualPlaneLock = not v75._manualPlaneLock;
            v77(v75._manualPlaneLock);
        end), 
        {
            Disconnect = function()
                v75:Disable(l_PluginAction_0.EditPlane);
                v75._toggleEditEnabled = false;
            end
        }
    };
end;
v13.registerShortcut = function(v78, v79, v80, v81)
    if not v78:supportsShortcut(v79) then
        error((("Cannot register unsupported shortcut for property %*."):format(v79)));
    end;
    if not (v79 ~= l_BrushSettings_0.BrushSize) or v79 == l_BrushSettings_0.Strength then
        return v78:onBrushChanged(v79, v80, v81);
    elseif not (v79 ~= l_MaterialSettings_0.SourceMaterial) or v79 == l_MaterialSettings_0.TargetMaterial then
        return v78:onMaterialPicked(v79, v81);
    elseif v79 == l_BrushSettings_0.BrushMode then
        return v78:onBrushMode(v81, v80);
    elseif v79 == l_BrushSettings_0.TemporarySmooth then
        return v78:onTemporarySmooth(v81);
    elseif v79 == l_BrushSettings_0.ManualPlaneLock then
        return v78:onToggleEdit(v80, v81);
    else
        return ;
    end;
end;
v13.supportsShortcut = function(_, v83)
    return ({
        [l_BrushSettings_0.BrushSize] = true, 
        [l_BrushSettings_0.BrushMode] = true, 
        [l_BrushSettings_0.ManualPlaneLock] = true, 
        [l_BrushSettings_0.Strength] = true, 
        [l_BrushSettings_0.TemporarySmooth] = true, 
        [l_MaterialSettings_0.SourceMaterial] = true, 
        [l_MaterialSettings_0.TargetMaterial] = true
    })[v83];
end;
v13.getMouse = function(v84)
    return v84._mouse;
end;
v13.IsMouseDown = function(v85)
    return v85._mouseDown;
end;
v13.Enable = function(v86, v87)
    v86:SetEnabled(v87, true);
end;
v13.Disable = function(v88, v89)
    v88:SetEnabled(v89, false);
end;
v13.SetEnabled = function(v90, v91, v92)
    v90._pluginActions:get(v91).Enabled = v92;
end;
v13.Connect = function(v93, v94, v95)
    return v93._pluginActions:get(v94).Triggered:Connect(v95);
end;
return v13;
