local v0 = require(script:FindFirstAncestor("AnimationClipEditor").Src.Actions.SetShowTree);
return function()
    return function(v1)
        local v2 = v1:getState();
        if v2.Status.RootInstance then
            v1:dispatch(v0(not v2.Status.ShowTree));
            return ;
        else
            return ;
        end;
    end;
end;
