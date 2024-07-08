local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Actions.SetOwnerUsername);
local _ = require(l_Parent_0.Core.Util.getUserId);
return function(v3)
    return function(v4)
        spawn(function()
            local l_NameFromUserIdAsync_0 = game:GetService("Players"):GetNameFromUserIdAsync(v3);
            if l_NameFromUserIdAsync_0 then
                v4:dispatch(v1(l_NameFromUserIdAsync_0));
            end;
        end);
    end;
end;
