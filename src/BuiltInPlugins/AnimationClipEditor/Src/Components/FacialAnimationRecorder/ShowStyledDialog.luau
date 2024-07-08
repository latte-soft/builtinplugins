local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.Framework);
local v3 = require(l_script_FirstAncestor_0.Src.Util.Theme);
local v4 = require(l_script_FirstAncestor_0.Packages.Cryo);
local l_ContextServices_0 = v2.ContextServices;
local _ = l_ContextServices_0.withContext;
return function(v7, v8, _, v10, v11, v12)
    local v13 = nil;
    local function v15(v14)
        if v13 then
            v1.unmount(v13);
        end;
        if not (not v14 or not v14.OnClose) then
            v14.OnClose();
        end;
    end;
    local function _(v16)
        if v13 then
            v1.unmount(v13);
        end;
        if v12.OnButtonPressed then
            v12.OnButtonPressed(v16);
        end;
    end;
    v13 = v1.mount((l_ContextServices_0.provide({
        Mouse = v10, 
        Localization = v8, 
        v3(), 
        Plugin = v7
    }, {
        v1.createElement(v11, v4.Dictionary.join(v12, {
            OnClose = function()
                if v13 then
                    v1.unmount(v13);
                end;
            end, 
            OnButtonPressed = function(v18)
                if v13 then
                    v1.unmount(v13);
                end;
                if v12.OnButtonPressed then
                    v12.OnButtonPressed(v18);
                end;
            end
        }))
    })));
    return v15;
end;
