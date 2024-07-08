local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Roact);
local v2 = require(l_Parent_0.Packages.Framework);
local l_ContextServices_0 = v2.ContextServices;
local l_TestHelpers_0 = v2.TestHelpers;
local l_MockToastNotificationService_0 = l_TestHelpers_0.Instances.MockToastNotificationService;
local l_provideMockContext_0 = l_TestHelpers_0.provideMockContext;
local v7 = require(l_Parent_0.Src.Utility.TestHelper);
local v8 = require(l_Parent_0.Src.Utility.ToastNotification);
local v9 = {};
local function v11(v10)
    v10 = v10 or v7.createTestStore();
    return {
        l_ContextServices_0.Store.new(v10), 
        v8.new(l_MockToastNotificationService_0.new())
    }, v10;
end;
v9.runComponentTest = function(v12, v13, v14)
    local v15 = v7.getTempScreenGui();
    local v16, v17 = v11(v14);
    local v18 = v1.mount(l_provideMockContext_0(v16, {
        test = v12
    }), v15);
    local l_status_0, l_result_0 = pcall(function()
        if v13 then
            v13(v15, v17);
        end;
    end);
    v1.unmount(v18);
    if not v14 then
        v17:destruct();
    end;
    for _, v22 in ipairs(v16) do
        v22:destroy();
    end;
    if not l_status_0 then
        error(l_result_0);
    end;
end;
return v9;
