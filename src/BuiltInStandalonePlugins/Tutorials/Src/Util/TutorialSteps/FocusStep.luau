local v0 = require(script.Parent.TutorialStep).extend("Focus");
v0.showComplete = true;
v0.bind = function(v1)
    v1.connection = v1.tutorial.dataModel:GetService("Workspace").CurrentCamera.Changed:Connect(function(...)
        v1:complete();
    end);
end;
v0.unbind = function(v2)
    v2.connection:Disconnect();
end;
return v0;
