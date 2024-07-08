local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local _ = require(l_Parent_0.Packages.AvatarToolsShared);
local l_Mouse_0 = v2.ContextServices.Mouse;
local v5 = require(l_Parent_0.Src.Resources.PluginTheme);
local v6 = require(l_Parent_0.Src.Util.DebugFlags);
local _ = require(l_Parent_0.Src.Util.TestHelper);
local v8 = require(l_Parent_0.Packages.Cryo);
local l_ContextServices_0 = v2.ContextServices;
return function(v10, v11, v12, v13)
    local v14 = nil;
    local function v16(v15)
        if v14 then
            v1.unmount(v14);
        end;
        if v15.OnClose then
            v15.OnClose();
        end;
    end;
    local v17 = v6.RunTests() or v6.RunRhodiumTests();
    local _ = nil;
    local v20 = l_ContextServices_0.provide({
        v11, 
        if not v17 then v5.makePluginTheme() else v5.mock(), 
        v10, 
        l_Mouse_0.new(v10:get():getMouse())
    }, {
        v1.createElement(v12, v8.Dictionary.join(v13, {
            OnClose = function()
                local l_v13_0 = v13;
                if v14 then
                    v1.unmount(v14);
                end;
                if l_v13_0.OnClose then
                    l_v13_0.OnClose();
                end;
            end
        }))
    });
    if v17 then
    end;
    v14 = v1.mount(v20, nil);
    return v16;
end;
