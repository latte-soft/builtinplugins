local _ = game:GetService("Workspace");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v2 = require(l_script_FirstAncestor_0.Packages.React);
local v3 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local v4 = require(l_script_FirstAncestor_0.Packages.Rodux);
local v5 = require(l_script_FirstAncestor_0.Packages.Framework);
local l_VirtualInput_0 = require(l_script_FirstAncestor_0.Packages.Dev.Rhodium).VirtualInput;
local _ = require(l_script_FirstAncestor_0.Src.Components.MainComponent);
local v8 = require(l_script_FirstAncestor_0.Src.Reducers.MainReducer);
local _ = require(l_script_FirstAncestor_0.Src.Types);
local v10 = require(l_script_FirstAncestor_0.Src.Util.mockContext);
local l_join_0 = v5.Dash.join;
local v12 = {};
local function _(v13, v14, v15)
    return v10({
        Component = v2.createElement(v13, v14)
    }, v15);
end;
local function _()
    local v17 = nil;
    pcall(function()
        local l_ViewSelectorScreenGui_0 = game:GetService("CoreGui").ViewSelectorScreenGui;
        if l_ViewSelectorScreenGui_0 then
            local l_Enabled_0 = l_ViewSelectorScreenGui_0.Enabled;
            local v20 = false;
            v17 = l_Enabled_0;
            l_ViewSelectorScreenGui_0.Enabled = v20;
        end;
    end);
    return v17;
end;
local function _(v22)
    if v22 == nil then
        return ;
    else
        pcall(function()
            game:GetService("CoreGui").ViewSelectorScreenGui.Enabled = v22;
        end);
        return ;
    end;
end;
local v24 = {};
v24.__index = v24;
local function v28()
    for _, v26 in game.CoreGui:GetChildren() do
        if v26:IsA("ScreenGui") and v26.Name == "CompositorDebuggerMock" then
            v26.Parent = nil;
            v26:Destroy();
        end;
    end;
    local l_ScreenGui_0 = Instance.new("ScreenGui");
    l_ScreenGui_0.Name = "CompositorDebuggerMock";
    l_ScreenGui_0.Parent = game.CoreGui;
    return l_ScreenGui_0;
end;
v24.new = function(v29, v30)
    local v31 = v28();
    local v32 = v4.Store.new(v8, nil, {
        v4.thunkMiddleware
    }, nil);
    local v33 = v3.createRoot(v31);
    local v34 = v10({
        Component = v2.createElement(v29, v30)
    }, v32);
    local l_Component_0 = v31:FindFirstChild("Component");
    l_VirtualInput_0.setCurrentWindow(v31);
    local v36 = {
        componentType = v29, 
        properties = v30, 
        container = v31, 
        component = l_Component_0, 
        root = v33, 
        element = v34, 
        store = v32
    };
    setmetatable(v36, v24);
    return v36;
end;
v24.render = function(v37)
    v3.act(function()
        v37.root:render(v37.element);
    end);
    v37.component = v37.container:FindFirstChild("Component");
end;
v24.update = function(v38, v39)
    v38.element = v10({
        Component = v2.createElement(v38.componentType, (l_join_0(v38.properties or {}, v39)))
    }, v38.store);
    v38:render();
end;
v24.unmount = function(v40)
    v3.act(function()
        v40.root:unmount();
    end);
    v40.container.Parent = nil;
    v40.container:Destroy();
end;
local function _(v41, v42, v43)
    return function()
        local v44 = nil;
        local v45;
        do
            local l_v44_0 = v44;
            pcall(function()
                local l_ViewSelectorScreenGui_1 = game:GetService("CoreGui").ViewSelectorScreenGui;
                if l_ViewSelectorScreenGui_1 then
                    local l_Enabled_1 = l_ViewSelectorScreenGui_1.Enabled;
                    local v49 = false;
                    l_v44_0 = l_Enabled_1;
                    l_ViewSelectorScreenGui_1.Enabled = v49;
                end;
            end);
            v45 = l_v44_0;
        end;
        v44 = v24.new(v41, v42);
        v44:render();
        v43(v44.component, v44);
        v44:unmount();
        if v45 == nil then
            return ;
        else
            pcall(function()
                game:GetService("CoreGui").ViewSelectorScreenGui.Enabled = v45;
            end);
            return ;
        end;
    end;
end;
v12.factory = function(v51, v52)
    return function(v53)
        local l_v51_0 = v51;
        local l_v52_0 = v52;
        return function()
            local v56 = nil;
            local v57;
            do
                local l_v56_0 = v56;
                pcall(function()
                    local l_ViewSelectorScreenGui_2 = game:GetService("CoreGui").ViewSelectorScreenGui;
                    if l_ViewSelectorScreenGui_2 then
                        local l_Enabled_2 = l_ViewSelectorScreenGui_2.Enabled;
                        local v61 = false;
                        l_v56_0 = l_Enabled_2;
                        l_ViewSelectorScreenGui_2.Enabled = v61;
                    end;
                end);
                v57 = l_v56_0;
            end;
            v56 = v24.new(l_v51_0, l_v52_0);
            v56:render();
            v53(v56.component, v56);
            v56:unmount();
            if v57 == nil then
                return ;
            else
                pcall(function()
                    game:GetService("CoreGui").ViewSelectorScreenGui.Enabled = v57;
                end);
                return ;
            end;
        end;
    end, function(v62)
        return function(v63)
            local l_v51_1 = v51;
            local v65 = l_join_0(v52, v62 or {});
            return function()
                local v66 = nil;
                local v67;
                do
                    local l_v66_0 = v66;
                    pcall(function()
                        local l_ViewSelectorScreenGui_3 = game:GetService("CoreGui").ViewSelectorScreenGui;
                        if l_ViewSelectorScreenGui_3 then
                            local l_Enabled_3 = l_ViewSelectorScreenGui_3.Enabled;
                            local v71 = false;
                            l_v66_0 = l_Enabled_3;
                            l_ViewSelectorScreenGui_3.Enabled = v71;
                        end;
                    end);
                    v67 = l_v66_0;
                end;
                v66 = v24.new(l_v51_1, v65);
                v66:render();
                v63(v66.component, v66);
                v66:unmount();
                if v67 == nil then
                    return ;
                else
                    pcall(function()
                        game:GetService("CoreGui").ViewSelectorScreenGui.Enabled = v67;
                    end);
                    return ;
                end;
            end;
        end;
    end;
end;
return v12;
