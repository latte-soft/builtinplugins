require(script.Parent.defineLuaFlags);
if game:GetFastFlag("EnableSimulationStep") then
    plugin.Name = script:FindFirstAncestor("SimulationStep").Name;
    local l_RunService_0 = game:GetService("RunService");
    local v1 = nil;
    local v2 = nil;
    local v3 = nil;
    local v4 = nil;
    local v5 = nil;
    local v6 = nil;
    local v8 = {
        pauseButtons = function(v7)
            if not l_RunService_0:IsEdit() then
                if not v7 then
                    v1.Enabled = false;
                    v2.Enabled = false;
                    v3.Enabled = true;
                    v4.Enabled = true;
                    if game:GetFastFlag("EnableSimulationStepForward") then
                        v5.Enabled = false;
                        v6.Enabled = false;
                    end;
                else
                    v1.Enabled = true;
                    v2.Enabled = true;
                    v3.Enabled = false;
                    v4.Enabled = false;
                    if game:GetFastFlag("EnableSimulationStepForward") then
                        v5.Enabled = true;
                        v6.Enabled = true;
                        return ;
                    end;
                end;
            else
                v1.Enabled = false;
                v2.Enabled = false;
                v3.Enabled = false;
                v4.Enabled = false;
                if game:GetFastFlag("EnableSimulationStepForward") then
                    v5.Enabled = false;
                    v6.Enabled = false;
                    return ;
                end;
            end;
        end
    };
    v8.checkRunState = game:GetService("RunService"):GetPropertyChangedSignal("RunState"):Connect(function()
        v8.pauseButtons(not game:GetService("RunService"):IsRunning());
    end);
    v8.onPause = function()
        game:GetService("RunService"):Pause();
        v8.pauseButtons(true);
    end;
    v8.onResume = function()
        game:GetService("RunService"):Run();
        v8.pauseButtons(false);
    end;
    v8.onStepForward = function()
        if game:GetFastFlag("EnableSimulationStepForward") then
            workspace:StepPhysics(0.016666666666666666);
        end;
    end;
    v8.invokeAction = function(v9)
        if not game:GetService("RunService"):IsEdit() then
            if v9 == "Pause" then
                v8.onPause();
                return ;
            elseif v9 == "Resume" then
                v8.onResume();
                return ;
            else
                if v9 == "StepForward" then
                    v8.onStepForward();
                end;
                return ;
            end;
        else
            return ;
        end;
    end;
    plugin:OnInvoke("syncRunState", v8.invokeAction);
    v8.pauseAll = function()
        plugin:Invoke("syncRunState", "Pause");
    end;
    v8.resumeAll = function()
        plugin:Invoke("syncRunState", "Resume");
    end;
    v8.stepForwardAll = function()
        plugin:Invoke("syncRunState", "StepForward");
    end;
    local v10 = not l_RunService_0:IsRunning();
    local l_plugin_Toolbar_0 = plugin:CreateToolbar("simulationStep");
    v1 = l_plugin_Toolbar_0:CreateButton("ResumeAll", "", "rbxlocaltheme://Resume");
    v1.ClickableWhenViewportHidden = true;
    v1.Click:Connect(v8.resumeAll);
    v2 = l_plugin_Toolbar_0:CreateButton("Resume", "", "rbxlocaltheme://Resume");
    v2.ClickableWhenViewportHidden = true;
    v2.Click:Connect(v8.onResume);
    v3 = l_plugin_Toolbar_0:CreateButton("PauseAll", "", "rbxlocaltheme://Pause");
    v3.ClickableWhenViewportHidden = true;
    v3.Click:Connect(v8.pauseAll);
    v4 = l_plugin_Toolbar_0:CreateButton("Pause", "", "rbxlocaltheme://Pause");
    v4.ClickableWhenViewportHidden = true;
    v4.Click:Connect(v8.onPause);
    if game:GetFastFlag("EnableSimulationStepForward") then
        v5 = l_plugin_Toolbar_0:CreateButton("StepForwardAll", "", "rbxlocaltheme://Fwd");
        v5.ClickableWhenViewportHidden = true;
        v5.Click:Connect(v8.stepForwardAll);
        v6 = l_plugin_Toolbar_0:CreateButton("StepForward", "", "rbxlocaltheme://Fwd");
        v6.ClickableWhenViewportHidden = true;
        v6.Click:Connect(v8.onStepForward);
    end;
    v8.pauseButtons(v10);
    return ;
else
    return ;
end;
