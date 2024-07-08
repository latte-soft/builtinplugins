local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
local l_Actions_0 = l_Parent_0.Src.Actions;
return v1.createReducer({
    ScriptInfo = {}, 
    ScriptLineContents = {}
}, {
    [require(l_Actions_0.Common.SetFilenameForGuid).name] = function(v4, v5)
        if v5.fileName == "" and v4.ScriptInfo[v5.scriptRefGuid] ~= nil then
            return v4;
        else
            return v2.Dictionary.join(v4, {
                ScriptInfo = v2.Dictionary.join(v4.ScriptInfo, {
                    [v5.scriptRefGuid] = v5.fileName
                })
            });
        end;
    end, 
    [require(l_Actions_0.Common.SetScriptSourceLine).name] = function(v6, v7)
        return v2.Dictionary.join(v6, {
            ScriptLineContents = v2.Dictionary.join(v6.ScriptLineContents, {
                [v7.scriptRefGuid] = v2.Dictionary.join(v6.ScriptLineContents[v7.scriptRefGuid] or {}, {
                    [v7.lineNumber] = v7.source
                })
            })
        });
    end
});
