local v0 = require(script.Parent.TutorialStep).extend("Scale");
v0.showComplete = true;
v0.bind = function(v1)
    local v2 = v1.tutorial.instances[v1.data.instanceId];
    if v2 then
        v1.connection = v2:GetPropertyChangedSignal("Size"):Connect(function()
            local l_Size_0 = v2.Size;
            local l_minSize_0 = v1.data.minSize;
            if (l_minSize_0.X <= l_Size_0.X and l_minSize_0.Y <= l_Size_0.Y) and l_minSize_0.Z <= l_Size_0.Z then
                v1:complete();
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
