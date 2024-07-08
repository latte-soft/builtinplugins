local l_RunService_0 = game:GetService("RunService");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v3 = require(l_Actions_0.SetDebugDataEvent);
local v4 = require(l_Actions_0.SetActor);
local v5 = require(l_Actions_0.SetDebugPoseEvent);
local v6 = require(l_Actions_0.SetLayerAdornmentEvent);
local v7 = require(l_Actions_0.SetPropertyOverrideEvent);
local v8 = require(l_Actions_0.SetSendPayloadAnalytics);
local l_Thunks_0 = l_script_FirstAncestor_0.Src.Thunks;
local v10 = require(l_Thunks_0.DetachCompositor);
local v11 = require(l_Thunks_0.ParseDebugData);
local v12 = require(l_script_FirstAncestor_0.Src.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local function _(v14, v15)
    local l_v14_FirstChild_0 = v14:FindFirstChild(v15);
    if not l_v14_FirstChild_0 or not l_v14_FirstChild_0:IsA("Folder") then
        local l_Folder_0 = Instance.new("Folder");
        l_Folder_0.Archivable = false;
        l_Folder_0.Name = v15;
        return l_Folder_0;
    else
        return l_v14_FirstChild_0;
    end;
end;
local function v23(v19, v20)
    local l_v19_FirstChild_0 = v19:FindFirstChild(v20);
    if not l_v19_FirstChild_0 or l_v19_FirstChild_0:IsA("BindableEvent") then
        if not l_v19_FirstChild_0 then
            local l_BindableEvent_0 = Instance.new("BindableEvent");
            l_BindableEvent_0.Archivable = false;
            l_BindableEvent_0.Name = v20;
            l_BindableEvent_0.Parent = v19;
            l_v19_FirstChild_0 = l_BindableEvent_0;
        end;
        assert(l_v19_FirstChild_0 and l_v19_FirstChild_0:IsA("BindableEvent"));
        return l_v19_FirstChild_0;
    else
        return nil;
    end;
end;
return function(v24, v25)
    return function(v26)
        if v26:getState().Status.Actor == v24 then
            return ;
        else
            v26:dispatch(v10());
            local l_v24_0 = v24;
            local l_CompositorDebugger_0 = v12.FOLDERS.CompositorDebugger;
            local l_l_v24_0_FirstChild_0 = l_v24_0:FindFirstChild(l_CompositorDebugger_0);
            local v30;
            if not l_l_v24_0_FirstChild_0 or not l_l_v24_0_FirstChild_0:IsA("Folder") then
                local l_Folder_1 = Instance.new("Folder");
                l_Folder_1.Archivable = false;
                l_Folder_1.Name = l_CompositorDebugger_0;
                v30 = l_Folder_1;
            else
                v30 = l_l_v24_0_FirstChild_0;
            end;
            l_CompositorDebugger_0 = v12.FOLDERS.AdornmentHandles;
            l_l_v24_0_FirstChild_0 = v30:FindFirstChild(l_CompositorDebugger_0);
            if not l_l_v24_0_FirstChild_0 or not l_l_v24_0_FirstChild_0:IsA("Folder") then
                local l_Folder_2 = Instance.new("Folder");
                l_Folder_2.Archivable = false;
                l_Folder_2.Name = l_CompositorDebugger_0;
                l_v24_0 = l_Folder_2;
            else
                l_v24_0 = l_l_v24_0_FirstChild_0;
            end;
            l_l_v24_0_FirstChild_0 = if not l_RunService_0:IsServer() then v12.FOLDERS.Client else v12.FOLDERS.Server;
            local l_v30_FirstChild_0 = v30:FindFirstChild(l_l_v24_0_FirstChild_0);
            if not l_v30_FirstChild_0 or not l_v30_FirstChild_0:IsA("Folder") then
                local l_Folder_3 = Instance.new("Folder");
                l_Folder_3.Archivable = false;
                l_Folder_3.Name = l_l_v24_0_FirstChild_0;
                l_CompositorDebugger_0 = l_Folder_3;
            else
                l_CompositorDebugger_0 = l_v30_FirstChild_0;
            end;
            l_l_v24_0_FirstChild_0 = v23(l_CompositorDebugger_0, v12.EVENTS.DebugData);
            l_v30_FirstChild_0 = v23(l_CompositorDebugger_0, v12.EVENTS.PropertyOverrides);
            local v35 = v23(l_CompositorDebugger_0, v12.EVENTS.LayerAdornments);
            local v36 = v23(l_CompositorDebugger_0, v12.EVENTS.DebugPose);
            if not ((not l_l_v24_0_FirstChild_0 or not l_v30_FirstChild_0) or not v35) and v36 then
                assert(((l_l_v24_0_FirstChild_0 and l_v30_FirstChild_0) and v35) and v36);
                v26:dispatch(v8(true));
                v26:dispatch(v3(l_l_v24_0_FirstChild_0, (l_l_v24_0_FirstChild_0.Event:Connect(function(v37)
                    v26:dispatch(v11(v37, v25));
                end))));
                v26:dispatch(v7(l_v30_FirstChild_0));
                v26:dispatch(v6(v35));
                v26:dispatch(v5(v36));
                v26:dispatch(v4(v24));
                l_CompositorDebugger_0.Parent = v30;
                v30.Parent = v24;
                l_v24_0.Parent = v30;
                return ;
            else
                return ;
            end;
        end;
    end;
end;
