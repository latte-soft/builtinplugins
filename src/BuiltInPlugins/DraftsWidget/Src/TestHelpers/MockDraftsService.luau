game:DefineFastInt("DebugStudioDraftsWidgetWaitTime", 0);
local v0 = require(script.Parent.Parent.Parent.Src.Util.Signal);
local v1 = {
    DEFAULT = 1, 
    EMPTY_TEST = 2, 
    SERVICE_DISABLED = 3
};
local function _(v2)
    assert(typeof(v2) == "Instance");
    assert(v2:IsA("LuaSourceContainer"));
end;
local _ = function(v4)
    assert(type(v4) == "table");
    for _, v6 in pairs(v4) do
        assert(typeof(v6) == "Instance");
        assert(v6:IsA("LuaSourceContainer"));
    end;
end;
local _ = function(v8)
    assert((typeof(v8 == "number")));
    for _, v10 in pairs(v1) do
        if v10 == v8 then
            return ;
        end;
    end;
    assert(false, "Test case " .. v8 .. " is not valid");
end;
local function _(v12)
    local l_Script_0 = Instance.new("Script");
    l_Script_0.Name = "Script" .. v12;
    return l_Script_0;
end;
local function v19(v15)
    assert(typeof(v15) == "number");
    local v16 = {};
    for v17 = 1, v15 do
        local l_Script_1 = Instance.new("Script");
        l_Script_1.Name = "Script" .. v17;
        v16[v17] = l_Script_1;
    end;
    return v16;
end;
local function v20()
    return game:GetFastInt("DebugStudioDraftsWidgetWaitTime");
end;
local v21 = {};
v21.__index = v21;
v21.TestCases = v1;
v21.new = function(v22)
    local v23 = {
        DraftAdded = v0.new(), 
        DraftRemoved = v0.new(), 
        DraftStatusChanged = v0.new(), 
        EditorsListChanged = v0.new(), 
        UpdateStatusChanged = v0.new(), 
        CommitStatusChanged = v0.new(), 
        __testCase = v22 or v1.DEFAULT, 
        __drafts = {}
    };
    local l___testCase_0 = v23.__testCase;
    assert((typeof(l___testCase_0 == "number")));
    for _, v26 in pairs(v1) do
        if v26 == l___testCase_0 then
            goto label0;
        end;
    end;
    assert(false, "Test case " .. l___testCase_0 .. " is not valid");
    ::label0::;
    if v23.__testCase ~= v1.EMPTY_TEST then
        v23.__drafts = v19(10);
    end;
    return (setmetatable(v23, v21));
end;
v21.GetDrafts = function(v27)
    wait(v20());
    if v27.__testCase == v1.SERVICE_DISABLED then
        error("DraftsService is not available");
    end;
    return v27.__drafts;
end;
v21.GetDraftStatus = function(_, v29)
    assert(typeof(v29) == "Instance");
    assert(v29:IsA("LuaSourceContainer"));
    return Enum.DraftStatusCode.OK;
end;
v21.GetEditors = function(_, v31)
    assert(typeof(v31) == "Instance");
    assert(v31:IsA("LuaSourceContainer"));
    return {};
end;
v21.ShowDiffsAgainstBase = function(_, v33)
    assert(type(v33) == "table");
    for _, v35 in pairs(v33) do
        assert(typeof(v35) == "Instance");
        assert(v35:IsA("LuaSourceContainer"));
    end;
end;
v21.ShowDiffsAgainstServer = function(_, v37)
    assert(type(v37) == "table");
    for _, v39 in pairs(v37) do
        assert(typeof(v39) == "Instance");
        assert(v39:IsA("LuaSourceContainer"));
    end;
end;
v21.DiscardEdits = function(v40, v41)
    assert(type(v41) == "table");
    for _, v43 in pairs(v41) do
        assert(typeof(v43) == "Instance");
        assert(v43:IsA("LuaSourceContainer"));
    end;
    for _, v45 in ipairs(v41) do
        v40.DraftRemoved:fire(v45);
    end;
end;
v21.UpdateToLatestVersion = function(v46, v47)
    assert(type(v47) == "table");
    for _, v49 in pairs(v47) do
        assert(typeof(v49) == "Instance");
        assert(v49:IsA("LuaSourceContainer"));
    end;
    wait(v20());
    for _, v51 in ipairs(v47) do
        v46.UpdateStatusChanged:fire(v51, Enum.DraftStatusCode.OK);
    end;
end;
v21.CommitEdits = function(v52, v53)
    assert(type(v53) == "table");
    for _, v55 in pairs(v53) do
        assert(typeof(v55) == "Instance");
        assert(v55:IsA("LuaSourceContainer"));
    end;
    wait(v20());
    for _, v57 in ipairs(v53) do
        v57.Parent = game.ServerScriptService;
        v52.CommitStatusChanged:fire(v57, Enum.DraftStatusCode.OK);
        delay(game:GetFastInt("DebugStudioDraftsWidgetWaitTime"), function()
            v52.DraftRemoved:fire(v57);
        end);
    end;
end;
return v21;
