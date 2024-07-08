local v0 = require(script.Parent.Parent.Parent.Core.Actions.SetGroupMetadata);
return function(v1)
    return function(v2)
        spawn(function()
            local l_GroupInfoAsync_0 = game:GetService("GroupService"):GetGroupInfoAsync(v1);
            if l_GroupInfoAsync_0 then
                v2:dispatch(v0(l_GroupInfoAsync_0));
            end;
        end);
    end;
end;
