local l_plugin_0 = plugin;
local _ = settings;
local v2 = require(script.Parent.ActionMediator);
local _ = require(script.Parent.CoreGuiManager);
local v4 = require(script.Parent.DoubleClickDetector);
local _ = require(script.Parent.FFlag);
local _ = require(script.Parent.RotationBox);
local v7 = require(script.Parent.Rubberband);
local v8 = require(script.Parent.SizeBox);
local v9 = require(script.Parent.DistanceLinesManager);
local v10 = require(script.Parent.TextEditor);
local _ = require(script.Parent.Utility);
local v12 = require(script.Parent.GlobalValues);
local v13 = require(script.Parent.InstanceInfo);
local v14 = require(script.Parent.Select);
local v15 = require(script.Parent.Resize);
local _ = require(script.Parent.Rotate);
local v17 = require(script.Parent.Move);
local v18 = require(script.Parent.MouseIconManager);
local v19 = require(script.Parent.SelectionManager);
local v20 = require(script.Parent.SnappingPointManager);
local v21 = require(script.Parent.Analytics);
local l_ChangeHistoryService_0 = game:GetService("ChangeHistoryService");
local l_UserInputService_0 = game:GetService("UserInputService");
local l_Selection_0 = game:GetService("Selection");
local l_StarterGui_0 = game:GetService("StarterGui");
local l_RunService_0 = game:GetService("RunService");
game:DefineFastFlag("StopUIEditorFocusOnPluginActivation", false);
game:DefineFastFlag("UIEditorAvoidEditingPath2D", false);
local v27 = nil;
local v28 = nil;
local v29 = nil;
local v30 = nil;
local v31 = nil;
local v32 = nil;
local v33 = nil;
local v34 = nil;
local v35 = nil;
local v36 = nil;
local v37 = nil;
local v38 = false;
local v39 = {};
local l_CurrentCamera_0 = workspace.CurrentCamera;
local function v41()
    v17:setActionMediator(v2);
    v15:setActionMediator(v2);
    v7:setActionMediator(v2);
    v10:setActionMediator(v2);
    v2:setMove(v17);
    v2:setResize(v15);
    v2:setRubberband(v7);
    v2:setTextEditor(v10);
    v2:setDistanceLinesManager(v9);
    v2:setSizeBox(v8);
    v2:setSelectionManager(v19);
end;
local function v44(v42)
    local v43 = v14:getGuiObjectsAtPoint((Vector2.new(v42.Position.x, v42.Position.y)));
    if not (#v43 > 0) or not (v43[1]:IsA("TextLabel") or v43[1]:IsA("TextButton")) and not v43[1]:IsA("TextBox") then
        return false;
    else
        v10:startEditingInstance(v43[1]);
        v15:hide();
        return true;
    end;
end;
local function v47(_, v46)
    if v46 == "Parent" then
        v19:onParentChanged();
        return ;
    else
        v15:updatePosition();
        v15:updateSize();
        v9:update();
        v9:setVisible(true);
        v8:update();
        return ;
    end;
end;
local function v49(v48)
    v19:onDescendantAddedToStarterGui(v48);
end;
local function v51()
    v19:onSelectionChanged();
    v20:generateSnappingLines();
    local v50 = l_Selection_0:Get();
    if not (not v50[1] or not v50[1]:FindFirstAncestor("BillboardGui") and not v50[1]:FindFirstAncestor("SurfaceGui")) then
        v15:hide();
        v8:setVisible(false);
        v9:setVisible(false);
    end;
end;
local function v58(v52)
    if not v10:isCurrentlyEditing() then
        if v52.UserInputType == Enum.UserInputType.MouseButton1 then
            if not (not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) and not l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift)) then
                v39 = v19:getRawSelection();
            end;
            v37 = v19:disconnectSelectionInstancesChanged(v37);
            v38 = true;
            local v53 = Vector2.new(v52.Position.X, v52.Position.Y);
            if not v15:isOverAHandle() then
                local v54 = v14:selectTopLevelItemAtPoint(v53);
                v51();
                v17:startDrag(v53);
                if v54 then
                    v13:isVisible(v54, true);
                    return ;
                else
                    local v55 = l_CurrentCamera_0:ScreenPointToRay(v52.Position.X, v52.Position.Y);
                    local v56 = RaycastParams.new();
                    v56.BruteForceAllSlow = true;
                    local v57 = workspace:Raycast(v55.Origin, v55.Direction * 5000, v56);
                    if not v57 or v57.Instance.Locked then
                        Off();
                        return ;
                    else
                        l_Selection_0:Set({
                            v57.Instance
                        });
                        Off();
                        return ;
                    end;
                end;
            else
                v15:startDrag(v53);
                return ;
            end;
        else
            if v52.UserInputType == Enum.UserInputType.Keyboard then
                if not (v52.KeyCode == Enum.KeyCode.U) or not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) and not l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift) then
                    if not (not (v52.KeyCode == Enum.KeyCode.A) or not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftControl)) then
                        v19:setSelection(v14:getGuiObjects());
                    end;
                else
                    v12:toggleGridType();
                    return ;
                end;
            end;
            return ;
        end;
    else
        return ;
    end;
end;
local function v61(v59)
    if v59.UserInputType == Enum.UserInputType.MouseButton1 then
        v38 = false;
        local v60 = Vector2.new(v59.Position.X, v59.Position.Y);
        if v15:isDragInProgress() then
            v15:finishDrag();
        end;
        if v7:isDragInProgress() then
            if not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) and not l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift) then
                v14:selectAllObjectsInBounds(v7:getBounds());
            else
                v14:toggleSelectionOfAllObjectsInBounds(v39, v7:getBounds());
            end;
            if #v19:getRawSelection() > 0 then
                v21:reportEvent("DragSelect");
            end;
            v7:finishRubberbandDrag();
            v39 = {};
        end;
        if v17:isDragInProgress() then
            v17:finishDrag(v60);
        end;
        if ((not v4:isDoubleClick() or l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftAlt)) or l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightAlt)) or not v44(v59) then
            if not v37 then
                v37 = v19:connectSelectionInstancesChanged(v47);
            end;
            if not v15:isOverAHandle() then
                v18:setToDefaultIcon();
            else
                v15:updateMouseIcon();
            end;
            v15:updateHandleHighlight();
        else
            return ;
        end;
    end;
end;
local function v64(v62)
    if not v10:isCurrentlyEditing() then
        if v62.UserInputType == Enum.UserInputType.MouseMovement then
            local v63 = Vector2.new(v62.Position.x, v62.Position.y);
            if not v15:isDragInProgress() then
                if not v7:isDragInProgress() then
                    if not v17:isDragInProgress() then
                        if not v15:isOverAHandle() then
                            v18:setToDefaultIcon();
                        else
                            v15:updateMouseIcon();
                        end;
                        v15:updateHandleHighlight(false);
                    else
                        v17:updateDrag(v63);
                        return ;
                    end;
                else
                    v7:updateRubberband(v63);
                    if not l_UserInputService_0:IsKeyDown(Enum.KeyCode.LeftShift) and not l_UserInputService_0:IsKeyDown(Enum.KeyCode.RightShift) then
                        v14:selectAllObjectsInBounds(v7:getBounds());
                        return ;
                    else
                        v14:toggleSelectionOfAllObjectsInBounds(v39, v7:getBounds());
                        return ;
                    end;
                end;
            else
                v15:updateDrag(v63);
                return ;
            end;
        end;
        return ;
    else
        return ;
    end;
end;
local function v67(v65)
    if #v65 == 0 then
        return ;
    elseif v65[1]:IsA("GuiBase2d") then
        v38 = true;
        local v66 = Vector2.new(l_plugin_0:GetMouse().X, l_plugin_0:GetMouse().Y);
        l_Selection_0:Set(v65);
        v19:onSelectionChanged();
        v17:startDrag(v66);
        return ;
    else
        return ;
    end;
end;
local function v69(_)
    if l_StarterGui_0.ShowDevelopmentGui and not l_RunService_0:IsRunning() then
        return ;
    else
        return ;
    end;
end;
local function _(v70)
    if not ((v70 ~= "Translate Objects (better tt needed)" and v70 ~= "Resize") and v70 ~= "Text Changed") or v70 == "Rotate object" then
        return true;
    else
        return false;
    end;
end;
local function v73(v72)
    if ((v72 == "Translate Objects (better tt needed)" or v72 == "Resize") or v72 == "Text Changed") or v72 == "Rotate object" then
        v15:updatePosition();
    end;
end;
local function v75(v74)
    if ((v74 == "Translate Objects (better tt needed)" or v74 == "Resize") or v74 == "Text Changed") or v74 == "Rotate object" then
        v15:updatePosition();
    end;
end;
local v76 = false;
local v77 = false;
local v78 = nil;
local v79 = nil;
v78 = l_plugin_0 and l_plugin_0:CreateToolbar("RobloxUIEditor");
v79 = v78 and v78:CreateButton("RobloxUIEditor", "RobloxUIEditor", "");
Off = function()
    if v77 then
        v77 = false;
        v21:reportEvent("Disabled");
        v28:disconnect();
        v27:disconnect();
        v36 = l_UserInputService_0.InputBegan:connect(v69);
        v14:refreshPaintOrder();
        v29:disconnect();
        v30:disconnect();
        v31:disconnect();
        v32:disconnect();
        v33:disconnect();
        v37 = v19:disconnectSelectionInstancesChanged(v37);
        v19:disconnectFilteredSelectionChanged(v9);
        v19:disconnectFilteredSelectionChanged(v15);
        v19:disconnectFilteredSelectionChanged(v8);
        v19:disconnectFilteredSelectionChanged(v17);
        v8:Off();
        v9:Off();
        v18:Off();
        v15:Off();
        v79:SetActive(false);
        l_plugin_0:Deactivate();
        return ;
    else
        return ;
    end;
end;
On = function()
    if not v77 then
        v21:reportEvent("Enabled");
        if not game:GetFastFlag("StopUIEditorFocusOnPluginActivation") then
            l_plugin_0:Activate(true);
        else
            l_plugin_0:Activate(false);
        end;
        v79:SetActive(true);
        v20:setThreshold(5);
        v8:On();
        v9:On();
        v18:On(l_plugin_0:GetMouse());
        v15:On();
        v27 = l_StarterGui_0.DescendantAdded:connect(v49);
        v36:disconnect();
        v28 = l_UserInputService_0.InputBegan:connect(v58);
        v29 = l_UserInputService_0.InputChanged:connect(v64);
        v30 = l_UserInputService_0.InputEnded:connect(v61);
        v31 = l_Selection_0.SelectionChanged:connect(v51);
        v33 = l_plugin_0:GetMouse().DragEnter:connect(v67);
        v32 = l_plugin_0.Deactivation:connect(Off);
        v37 = v19:connectSelectionInstancesChanged(v47);
        v34 = l_ChangeHistoryService_0.OnUndo:connect(v73);
        v35 = l_ChangeHistoryService_0.OnRedo:connect(v75);
        v19:connectFilteredSelectionChanged(v9);
        v19:connectFilteredSelectionChanged(v15);
        v19:connectFilteredSelectionChanged(v8);
        v19:connectFilteredSelectionChanged(v17);
        v51();
        v41();
        v77 = true;
        return ;
    else
        return ;
    end;
end;
if v79 then
    l_StarterGui_0.ProcessUserInput = true;
    v79.Click:connect(function()
        if not v77 then
            On();
            return ;
        else
            Off();
            return ;
        end;
    end);
    local function v82(v80)
        local _ = v80.Name;
    end;
    local function v86()
        local v83 = l_Selection_0:Get();
        for v84 = 1, #v83 do
            local v85 = v83[v84];
            if not (not pcall(v82, v85) or not v19:passesGuiFilter(v85)) then
                On();
                return ;
            end;
        end;
        Off();
    end;
    l_Selection_0.SelectionChanged:connect(function()
        spawn(v86);
    end);
end;
v36 = l_UserInputService_0.InputBegan:connect(v69);
v14:refreshPaintOrder();
v76 = true;
