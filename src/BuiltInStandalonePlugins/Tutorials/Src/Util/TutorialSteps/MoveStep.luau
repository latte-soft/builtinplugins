local v0 = require(script.Parent.TutorialStep).extend("Move");
v0.showComplete = true;
v0.bind = function(v1)
    local v2 = v1.tutorial.instances[v1.data.instanceId];
    if v2 then
        v1.connection = v2:GetPropertyChangedSignal("Position"):Connect(function()
            if (v2:GetPivot().Position - v1.data.position).Magnitude < v1.data.distance then
                v1:complete();
            end;
        end);
    end;
end;
v0.unbind = function(v3)
    if v3.connection then
        v3.connection:Disconnect();
    end;
end;
return v0;
