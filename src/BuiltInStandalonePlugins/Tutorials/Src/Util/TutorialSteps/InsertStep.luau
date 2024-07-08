local v0 = require(script.Parent.TutorialStep);
local l_TutorialsDraggerSteps_0 = game:GetFastFlag("TutorialsDraggerSteps");
local v2 = v0.extend("Insert");
v2.showComplete = true;
v2.bind = function(v3)
    v3.connection = v3.tutorial.dataModel:GetService("Workspace").ChildAdded:Connect(function(v4)
        if v4:IsA(v3.data.className) then
            if not (not l_TutorialsDraggerSteps_0 or not v3.data.properties) then
                for v5, v6 in v3.data.properties, nil, nil do
                    if v4[v5] ~= v6 then
                        return ;
                    end;
                end;
            end;
            if v3.data.instanceId then
                v3.tutorial.instances[v3.data.instanceId] = v4;
            end;
            v3:complete();
        end;
    end);
end;
v2.unbind = function(v7)
    v7.connection:Disconnect();
end;
return v2;
