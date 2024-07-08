local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local l_Actions_0 = l_script_FirstAncestor_0.Src.Actions;
local v2 = require(l_Actions_0.SetDebugDataEvent);
local v3 = require(l_Actions_0.SetPropertyOverrideEvent);
local v4 = require(l_Actions_0.SetLayerAdornmentEvent);
local v5 = require(l_Actions_0.SetDebugPoseEvent);
local v6 = require(l_Actions_0.SetActor);
local v7 = require(l_Actions_0.SetFrameBuffer);
local v8 = require(l_script_FirstAncestor_0.Src.Util.Constants);
return function()
    return function(v9)
        local l_Actor_0 = v9:getState().Status.Actor;
        if l_Actor_0 then
            local l_DebugDataConnection_0 = v9:getState().Status.DebugDataConnection;
            if l_DebugDataConnection_0 then
                l_DebugDataConnection_0:Disconnect();
            end;
            local l_l_Actor_0_FirstChild_0 = l_Actor_0:FindFirstChild(v8.FOLDERS.CompositorDebugger);
            if l_l_Actor_0_FirstChild_0 then
                l_l_Actor_0_FirstChild_0:Destroy();
            end;
            v9:dispatch(v2(nil, nil));
            v9:dispatch(v3(nil));
            v9:dispatch(v4(nil));
            v9:dispatch(v5(nil));
            v9:dispatch(v6(nil));
            v9:dispatch(v7(nil));
            return ;
        else
            return ;
        end;
    end;
end;
