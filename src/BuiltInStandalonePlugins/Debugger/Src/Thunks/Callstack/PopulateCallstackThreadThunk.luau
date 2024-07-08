local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Src.Models.Callstack.CallstackRow);
local l_Actions_0 = l_Parent_0.Src.Actions;
local v3 = require(l_Actions_0.Callstack.AddCallstack);
local v4 = require(l_Actions_0.Common.SetFilenameForGuid);
return function(v5, v6, v7, v8, v9)
    return function(v10, _)
        v6:Populate(v5, function()
            if v7 ~= v10:getState().Common.debuggerConnectionIdToDST[v7.debuggerConnectionId] then
                return ;
            else
                local l_v5_Children_0 = v5:GetChildren();
                local v13 = {};
                for v14, v15 in ipairs(l_v5_Children_0) do
                    local v16 = {};
                    if v14 == 1 then
                        v16 = {
                            Value = "", 
                            LeftIcon = v1.ICON_FRAME_TOP
                        };
                    end;
                    local v17 = {
                        arrowColumn = v16, 
                        frameColumn = v14, 
                        functionColumn = v15.FrameName, 
                        lineColumn = v15.Line < 0 and "" or v15.Line, 
                        sourceColumn = v15.Script
                    };
                    v10:dispatch(v4(v15.Script, ""));
                    v8:StartWatchingScriptLine(v15.Script, v10:getState().Common.currentDebuggerConnectionId, v15.Line);
                    table.insert(v13, v1.fromData(v17));
                end;
                if #v13 > 0 then
                    v10:dispatch(v3(v5.ThreadId, v13, v7));
                end;
                if v9 then
                    v9();
                end;
                return ;
            end;
        end);
    end;
end;
