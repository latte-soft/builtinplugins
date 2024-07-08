local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.DraggerSchemaCore.DraggerSchema);
local v3 = require(l_Parent_0.Src.Reducers.MainReducer);
local v4 = require(l_Parent_0.Src.Utility.MockDraggerContext_Pivot);
local function _()
    return workspace:FindFirstChild("TempInstancesFolder");
end;
local function _()
    return game.CoreGui:FindFirstChild("TempScreenGui");
end;
local v11 = {
    cleanTempInstances = function()
        local l_TempInstancesFolder_0 = workspace:FindFirstChild("TempInstancesFolder");
        if l_TempInstancesFolder_0 then
            l_TempInstancesFolder_0:Destroy();
        end;
        local l_TempScreenGui_0 = game.CoreGui:FindFirstChild("TempScreenGui");
        if l_TempScreenGui_0 then
            l_TempScreenGui_0:Destroy();
        end;
    end, 
    getTempInstancesFolder = function()
        local l_TempInstancesFolder_1 = workspace:FindFirstChild("TempInstancesFolder");
        if not l_TempInstancesFolder_1 then
            l_TempInstancesFolder_1 = Instance.new("Folder");
            l_TempInstancesFolder_1.Name = "TempInstancesFolder";
            l_TempInstancesFolder_1.Parent = workspace;
            return l_TempInstancesFolder_1;
        else
            return l_TempInstancesFolder_1;
        end;
    end, 
    getTempScreenGui = function()
        local l_TempScreenGui_1 = game.CoreGui:FindFirstChild("TempScreenGui");
        if not l_TempScreenGui_1 then
            l_TempScreenGui_1 = Instance.new("ScreenGui", game.CoreGui);
            l_TempScreenGui_1.Name = "TempScreenGui";
            l_TempScreenGui_1.ZIndexBehavior = Enum.ZIndexBehavior.Sibling;
            return l_TempScreenGui_1;
        else
            return l_TempScreenGui_1;
        end;
    end
};
v11.createInstance = function(v12)
    local v13 = v11.getTempInstancesFolder();
    local v14 = Instance.new(v12);
    v14.Parent = v13;
    return v14;
end;
v11.createTestDraggerContext = function(v15)
    return v4.new(v15 or v11.getTempScreenGui(), v2.Selection.new());
end;
v11.createTestStore = function()
    return v1.Store.new(v3, nil, {
        v1.thunkMiddleware
    });
end;
return v11;
