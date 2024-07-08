local l_HttpService_0 = game:GetService("HttpService");
local l_Parent_0 = script.Parent.Parent.Parent;
local v2 = require(l_Parent_0.Packages.Framework);
local v3 = require(l_Parent_0.Packages.Cryo);
local l_t_0 = v2.Util.Typecheck.t;
local v5 = require(script.Parent.BacktraceInterfaces);
local v6 = require(script.Parent.processErrorStack);
local v7 = {
    IAttributes = v5.IAttributes, 
    IAnnotations = v5.IAnnotations
};
v7.__index = v7;
local l_status_0, _ = pcall(function()
    return game:GetService("ProcessService");
end);
v7.new = function()
    local v10 = {
        uuid = l_HttpService_0:GenerateGUID(false):lower(), 
        timestamp = os.time((os.date("*t"))), 
        lang = "lua", 
        langVersion = "Roblox" .. _VERSION, 
        agent = "backtrace-Lua", 
        agentVersion = "0.1.0", 
        threads = {}, 
        mainThread = "default"
    };
    setmetatable(v10, v7);
    return v10;
end;
v7.fromMessageAndStack = function(v11, v12)
    assert(l_t_0.string(v11), "Expected errorMessage to be a string");
    assert(l_t_0.string(v12), "Expected errorStack to be a string");
    local v13 = v7.new();
    v13:addAttributes({
        ["error.message"] = v11, 
        PlayerId = not l_status_0 and game:GetService("StudioService"):GetUserId() or nil
    });
    local v14, v15 = v6(v12);
    v13:addStackToMainThread(v14);
    v13.sourceCode = v15;
    return v13;
end;
v7.validate = function(v16)
    return v5.IBacktraceReport(v16);
end;
v7.addAttributes = function(v17, v18)
    assert(v17.IAttributes(v18), "Expected newAttributes to be a table");
    v17.attributes = v3.Dictionary.join(v17.attributes or {}, v18);
end;
v7.addAnnotations = function(v19, v20)
    assert(v19.IAnnotations(v20), "Expected newAnnotations to be a table");
    v19.annotations = v3.Dictionary.join(v19.annotations or {}, v20);
end;
v7.addStackToThread = function(v21, v22, v23)
    assert(l_t_0.table(v22), "Expected stack to be an array of tables");
    assert(l_t_0.string(v23), "Expected threadName to be a string");
    v21.threads = v3.Dictionary.join(v21.threads, {
        [v23] = {
            name = v23, 
            stack = v22
        }
    });
end;
v7.addStackToMainThread = function(v24, v25)
    assert(l_t_0.table(v25), "Expected stack to be an array of tables");
    v24:addStackToThread(v25, v24.mainThread);
end;
return v7;
