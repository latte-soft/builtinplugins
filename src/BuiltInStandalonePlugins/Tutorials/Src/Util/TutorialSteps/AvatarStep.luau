local l_Parent_0 = script.Parent.Parent.Parent.Parent.Parent;
local v1 = require(script.Parent.TutorialStep).extend("Avatar");
v1.showComplete = true;
v1.bind = function(v2)
    v2.connection = l_Parent_0:OnInvoke("ChangeHumanoidState", function(v3)
        if v3 == v2.data.state then
            v2:complete();
        end;
    end);
end;
v1.unbind = function(v4)
    v4.connection:Disconnect();
end;
return v1;
