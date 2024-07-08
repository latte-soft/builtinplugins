local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Src.Actions.SetFaceControlsEditorEnabled);
local v2 = require(l_script_FirstAncestor_0.Src.Actions.SetFaceControlsEditorOpenedTimestamp);
return function(v3)
    return function(v4)
        local v5 = v4:getState();
        if v5.Status.RootInstance then
            local v6 = not v5.Status.FaceControlsEditorEnabled;
            v4:dispatch(v1(v6));
            if not v6 then
                v3:report("onFaceControlsEditorDisabled", os.time() - v5.Status.FaceControlsEditorOpenedTimestamp);
                v5.Status.FaceControlsEditorOpenedTimestamp = nil;
                return ;
            else
                v3:report("onFaceControlsEditorEnabled");
                v4:dispatch(v2(os.time()));
                return ;
            end;
        else
            return ;
        end;
    end;
end;
