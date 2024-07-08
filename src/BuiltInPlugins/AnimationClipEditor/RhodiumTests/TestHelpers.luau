local l_Workspace_0 = game:GetService("Workspace");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("AnimationClipEditor");
local l_Analytics_0 = require(l_script_FirstAncestor_0.Packages.Framework).ContextServices.Analytics;
local l_Element_0 = require(l_script_FirstAncestor_0.Packages.Dev.Rhodium).Element;
local v4 = require(l_script_FirstAncestor_0.RhodiumTests.Test);
local v5 = require(l_script_FirstAncestor_0.Src.Util.RigInfo);
local v6 = require(l_script_FirstAncestor_0.Src.Thunks.LoadAnimationData);
local v7 = require(l_script_FirstAncestor_0.Src.Thunks.UpdateRootInstance);
local v8 = {
    plugin = nil
};
v8.init = function(v9)
    assert(l_Workspace_0:FindFirstChild("Dummy"), "Rhodium Testing requires a 'Dummy' rig in Workspace.");
    v8.plugin = v9;
    v8.delay();
end;
v8.loadAnimation = function(v10, v11)
    local v12 = l_Analytics_0.mock();
    v5.clearCache();
    v10:dispatch(v7(l_Workspace_0.Dummy, v12));
    v10:dispatch(v6(v11, v12));
end;
v8.delay = function(v13)
    wait(v13 or 0.1);
end;
v8.clickInstance = function(v14)
    l_Element_0.new(v14):click();
    v8.delay();
end;
v8.runTest = function(v15)
    local v16 = v4.new(v8.plugin);
    local v17, v18 = v16:run(v15);
    v16:destroy();
    if not v17 then
        error(v18);
    end;
end;
return v8;
