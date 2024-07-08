local l_script_FirstAncestor_0 = script:FindFirstAncestor("FileSync");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Packages.ReactRoblox);
local v3 = require(l_script_FirstAncestor_0.Packages.Framework);
local v4 = require(l_script_FirstAncestor_0.Src.Resources.Theme);
local v5 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_ContextServices_0 = v3.ContextServices;
return function(v7, v8, v9, v10, v11)
    local v12 = nil;
    local function v14(v13)
        if v12 then
            v12:render(nil);
        end;
        if v13.OnClose then
            v13.OnClose();
        end;
    end;
    local v18 = l_ContextServices_0.provide({
        v8, 
        v4(), 
        v7
    }, {
        v1.createElement(v9, v5.Dictionary.join(v10, {
            OnClose = function()
                local l_v10_0 = v10;
                if v12 then
                    v12:render(nil);
                end;
                if l_v10_0.OnClose then
                    l_v10_0.OnClose();
                end;
            end, 
            OnButtonPressed = function(v16)
                v10.OnButtonPressed(v16);
                local l_v10_1 = v10;
                if v12 then
                    v12:render(nil);
                end;
                if l_v10_1.OnClose then
                    l_v10_1.OnClose();
                end;
            end
        }), v11)
    });
    v12 = v2.createRoot(Instance.new("Folder"));
    v12:render(v18);
    return v14;
end;
