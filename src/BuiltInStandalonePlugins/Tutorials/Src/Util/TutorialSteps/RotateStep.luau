local v0 = require(script.Parent.TutorialStep).extend("Rotate");
v0.showComplete = true;
v0.bind = function(v1)
    local v2 = v1.tutorial.instances[v1.data.instanceId];
    if v2 then
        local l_LookVector_0 = v2.CFrame.LookVector;
        v1.connection = v2:GetPropertyChangedSignal("CFrame"):Connect(function()
            if l_LookVector_0 == v2.CFrame.LookVector then
                return ;
            else
                if not v1.data.distance then
                    v1:complete();
                else
                    local l_rotation_0 = v1.data.rotation;
                    if math.deg((math.acos((v2.CFrame.LookVector:Dot(CFrame.Angles(math.rad(l_rotation_0.X), math.rad(l_rotation_0.Y), (math.rad(l_rotation_0.Z))).LookVector))))) < v1.data.distance then
                        v1:complete();
                        return ;
                    end;
                end;
                return ;
            end;
        end);
    end;
end;
v0.unbind = function(v5)
    if v5.connection then
        v5.connection:Disconnect();
    end;
end;
return v0;
