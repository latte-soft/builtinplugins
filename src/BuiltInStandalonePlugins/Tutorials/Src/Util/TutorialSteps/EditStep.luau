local l_some_0 = require(script.Parent.Parent.Parent.Parent.Packages.Dash).some;
local l_TutorialsDraggerSteps_0 = game:GetFastFlag("TutorialsDraggerSteps");
local l_insert_0 = table.insert;
local v3 = require(script.Parent.TutorialStep).extend("Edit");
v3.showComplete = true;
v3.bind = function(v4)
    local l_Workspace_0 = v4.tutorial.dataModel:GetService("Workspace");
    v4.connections = {};
    v4.watches = {};
    l_insert_0(v4.connections, (v4.tutorial:syncChildren(l_Workspace_0, v4.data.className, function(v6)
        local v7 = {};
        for v8, v9 in v4.data.changes, nil, nil do
            if l_TutorialsDraggerSteps_0 and v8 == "Attributes" then
                v7.Attributes = {};
                for v10 in v9, nil, nil do
                    v7.Attributes[v10] = v6:GetAttribute(v10);
                end;
            else
                v7[v8] = v6[v8];
            end;
        end;
        l_insert_0(v4.watches, {
            instance = v6, 
            initialValues = v7
        });
        l_insert_0(v4.connections, v6.Changed:Connect(function()
            v4:update();
        end));
    end)));
end;
v3.update = function(v11)
    if l_some_0(v11.watches, function(v12)
        return not l_some_0(v11.data.changes, function(v13, v14)
            if l_TutorialsDraggerSteps_0 and v14 == "Attributes" then
                return (l_some_0(v13, function(v15, v16)
                    if v15 == true then
                        return v12.instance:GetAttribute(v16) == v12.initialValues.Attributes[v16];
                    else
                        return v12.instance:GetAttribute(v16) ~= v13;
                    end;
                end));
            elseif v13 == true then
                return v12.instance[v14] == v12.initialValues[v14];
            else
                return v12.instance[v14] ~= v13;
            end;
        end);
    end) then
        v11:complete();
    end;
end;
v3.unbind = function(v17)
    for _, v19 in ipairs(v17.connections) do
        v19:Disconnect();
    end;
end;
return v3;
