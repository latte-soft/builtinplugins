local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Promise);
local v3 = require(l_script_FirstAncestor_0.Src.Components.BlockingDialog.BlockingDialog);
return function(v4, v5)
    return v2.new(function(v6)
        spawn(function()
            local v7 = nil;
            local function v8()
                if v7 then
                    v1.unmount(v7);
                    v6();
                end;
            end;
            v7 = v1.mount((v1.createElement(v3, {
                plugin = v4, 
                OnButtonClicked = v8, 
                OnClose = v8
            }, v5)));
        end);
    end):await();
end;
