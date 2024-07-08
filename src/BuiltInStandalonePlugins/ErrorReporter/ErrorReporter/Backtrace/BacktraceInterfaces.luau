local l_t_0 = require(script.Parent.Parent.Parent.Packages.Framework).Util.Typecheck.t;
local v1 = l_t_0.strictInterface({
    guessed_frame = l_t_0.optional(l_t_0.boolean), 
    funcName = l_t_0.optional(l_t_0.string), 
    address = l_t_0.optional(l_t_0.string), 
    line = l_t_0.optional(l_t_0.string), 
    column = l_t_0.optional(l_t_0.string), 
    sourceCode = l_t_0.optional(l_t_0.string), 
    library = l_t_0.optional(l_t_0.string), 
    debug_identifier = l_t_0.optional(l_t_0.string), 
    faulted = l_t_0.optional(l_t_0.boolean), 
    registers = l_t_0.optional(l_t_0.map(l_t_0.string, l_t_0.some(l_t_0.string, l_t_0.number)))
});
local v2 = l_t_0.strictInterface({
    name = l_t_0.optional(l_t_0.string), 
    fault = l_t_0.optional(l_t_0.boolean), 
    stack = l_t_0.optional(l_t_0.array(v1))
});
local v3 = l_t_0.strictInterface({
    name = l_t_0.string, 
    registers = l_t_0.map(l_t_0.string, l_t_0.string)
});
local v4 = l_t_0.strictInterface({
    text = l_t_0.optional(l_t_0.string), 
    startLine = l_t_0.optional(l_t_0.number), 
    startColumn = l_t_0.optional(l_t_0.number), 
    startPos = l_t_0.optional(l_t_0.number), 
    path = l_t_0.optional(l_t_0.string), 
    tabWidth = l_t_0.optional(l_t_0.number)
});
local v5 = l_t_0.strictInterface({
    read = l_t_0.boolean, 
    write = l_t_0.boolean, 
    exec = l_t_0.boolean
});
local v6 = l_t_0.strictInterface({
    start = l_t_0.string, 
    size = l_t_0.optional(l_t_0.number), 
    data = l_t_0.optional(l_t_0.string), 
    perms = l_t_0.optional(v5)
});
local v7 = l_t_0.strictInterface({
    start = l_t_0.string, 
    size = l_t_0.number, 
    code_file = l_t_0.optional(l_t_0.string), 
    version = l_t_0.optional(l_t_0.string), 
    debug_file = l_t_0.optional(l_t_0.string), 
    debug_identifier = l_t_0.optional(l_t_0.string), 
    debug_file_exists = l_t_0.optional(l_t_0.boolean)
});
local v8 = l_t_0.optional(l_t_0.map(l_t_0.string, l_t_0.some(l_t_0.string, l_t_0.number, l_t_0.boolean)));
local function v16(v9)
    local function v10(v11)
        if type(v11) == "table" then
            for v12, v13 in pairs(v11) do
                local v14, v15 = v10(v13);
                if not v14 then
                    return false, string.format("error when checking key: %s - %s", v12, v15);
                end;
            end;
            return true;
        else
            return l_t_0.some(l_t_0.string, l_t_0.number, l_t_0.boolean)(v11);
        end;
    end;
    return v10(v9);
end;
local v17 = l_t_0.optional(l_t_0.map(l_t_0.string, v16));
return {
    IBacktraceStack = v1, 
    IBacktraceThread = v2, 
    IArch = v3, 
    ISourceCode = v4, 
    IPerm = v5, 
    IMemory = v6, 
    IModule = v7, 
    IAttributes = v8, 
    IAnnotation = v16, 
    IAnnotations = v17, 
    IBacktraceReport = l_t_0.intersection(l_t_0.strictInterface({
        uuid = l_t_0.string, 
        timestamp = l_t_0.number, 
        lang = l_t_0.string, 
        langVersion = l_t_0.string, 
        agent = l_t_0.string, 
        agentVersion = l_t_0.string, 
        threads = l_t_0.map(l_t_0.string, v2), 
        mainThread = l_t_0.string, 
        attributes = v8, 
        annotations = v17, 
        symbolication = l_t_0.optional(l_t_0.literal("minidump")), 
        entryThread = l_t_0.optional(l_t_0.string), 
        arch = l_t_0.optional(v3), 
        fingerprint = l_t_0.optional(l_t_0.string), 
        classifiers = l_t_0.optional(l_t_0.array(l_t_0.string)), 
        sourceCode = l_t_0.optional(l_t_0.map(l_t_0.string, v4)), 
        memory = l_t_0.optional(l_t_0.array(v6)), 
        modules = l_t_0.optional(l_t_0.array(v7))
    }), function(v18)
        local v19 = false;
        for _, v21 in pairs(v18.threads) do
            local l_stack_0 = v21.stack;
            if l_stack_0 ~= nil then
                for _, v24 in ipairs(l_stack_0) do
                    if v24.registers ~= nil then
                        v19 = true;
                        break;
                    end;
                end;
            end;
            if v19 then
                break;
            end;
        end;
        if v19 and v18.arch == nil then
            return false, "arch must exist if you want to have registers in the stack";
        else
            return true;
        end;
    end), 
    IBacktraceReporter = l_t_0.strictInterface({
        networking = l_t_0.interface({
            request = l_t_0.callback, 
            post = l_t_0.callback
        }), 
        accessToken = l_t_0.string, 
        processErrorReportMethod = l_t_0.optional(l_t_0.callback), 
        queueOptions = l_t_0.optional(l_t_0.strictInterface({
            queueTimeLimit = l_t_0.optional(l_t_0.numberPositive), 
            queueErrorLimit = l_t_0.optional(l_t_0.numberPositive), 
            queueKeyLimit = l_t_0.optional(l_t_0.numberPositive)
        })), 
        generateLogMethod = l_t_0.optional(l_t_0.callback), 
        logIntervalInSeconds = l_t_0.optional(l_t_0.numberPositive)
    })
};
