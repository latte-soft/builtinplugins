local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.React);
local v2 = require(l_Parent_0.Src.Util.SimpleSerializedStateContext);
local _ = require(l_Parent_0.Src.Types);
local v4 = require(l_Parent_0.Src.Hooks.useSerializedState);
return function(v5)
    local v6, v7 = v4(v5.root, "stage", "CheckBody");
    local v8, v9 = v4(v5.root, "textured", true);
    return v1.createElement(v2.Provider, {
        value = {
            stage = v6, 
            setStage = v7, 
            isTextured = v8, 
            setIsTextured = v9
        }
    }, v5.children);
end;
