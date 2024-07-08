local v0 = require(script.Parent.Parent.Parent.Parent.Src.Actions.AddChange);
local v1 = require(script.Parent.AddDevSubKeyError);
return function(v2)
    return function(v3, v4)
        local l_Key_0 = v2.Key;
        local l_devSubsController_0 = v4.devSubsController;
        v3:dispatch(v0("DevSubModeration", {
            [l_Key_0] = {
                isAcceptable = true, 
                filteredName = nil
            }
        }));
        local v7, v8 = l_devSubsController_0:getFilteredDevSub(v2);
        v3:dispatch(v0("DevSubModeration", {
            [l_Key_0] = {
                isAcceptable = v7, 
                filteredName = v8
            }
        }));
        if not v7 then
            v3:dispatch(v1(l_Key_0, "Name", {
                Moderated = "Name has been moderated"
            }));
        end;
    end;
end;
