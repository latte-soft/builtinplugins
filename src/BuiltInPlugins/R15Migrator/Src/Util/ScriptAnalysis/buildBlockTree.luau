local l_ScriptEditorService_0 = game:GetService("ScriptEditorService");
local l_ScriptAnalysis_0 = script:FindFirstAncestor("R15Migrator").Src.Util.ScriptAnalysis;
local v2 = require(l_ScriptAnalysis_0.StringUtil);
local v3 = require(l_ScriptAnalysis_0.StatementParser);
local v4 = require(l_ScriptAnalysis_0.CodeBlock);
local v5 = require(l_ScriptAnalysis_0.BlockTree);
return function(v6)
    local v7 = v5.new();
    local l_v7_Root_0 = v7:GetRoot();
    local v9 = nil;
    local function v17(v10, v11)
        local l_v3_RightSide_0, v13 = v3:GetRightSide(v10, 1);
        if not (not l_v3_RightSide_0 or not v13) and v2.CharAt(v10, l_v3_RightSide_0) == "{" then
            return ;
        else
            local v14 = string.find(v10, "=", nil, true);
            if not v14 then
                v14 = string.len(v10);
            else
                v14 = v14 - 1;
            end;
            v10 = string.sub(v10, 1, v14);
            for _, v16 in (v10:split()), nil, nil do
                l_v7_Root_0:AddVariable(v2.RemoveWhitespace(v16), "", v11, (string.find(v10, v16, nil, true)));
            end;
            return ;
        end;
    end;
    local function v24(v18, v19, v20)
        local v21, v22 = string.find(v19, v18, l_v7_Root_0.StartIndex, true);
        table.insert(l_v7_Root_0.Lines, {
            LineNo = v20, 
            Text = string.sub(v19, l_v7_Root_0.StartIndex, v21 - 1), 
            Offset = l_v7_Root_0.StartIndex - 1
        });
        local v23 = v4.new(v22 + 1, v22 + 1);
        l_v7_Root_0:AddChild(v23);
        l_v7_Root_0 = v23;
        return true;
    end;
    local function _(v25, v26, v27)
        local v28, v29 = string.find(v25, "function");
        if (not v28 or not v29) or not v2.MatchBeforeAndAfter(v25, v28, v29, "[%s=,]", "[%s\r\n(]", true, true) then
            return false;
        else
            return (v24(v25, v26, v27));
        end;
    end;
    local function _(v31, v32, v33)
        if not (v31 ~= "repeat" and v31 ~= "do") or v31 == "then" then
            return (v24(v31, v32, v33));
        else
            return false;
        end;
    end;
    local function v40(v35, v36, v37)
        local v38, v39 = string.find(v36, v35, l_v7_Root_0.StartIndex, true);
        l_v7_Root_0.EndIndex = v38 - 1;
        table.insert(l_v7_Root_0.Lines, {
            LineNo = v37, 
            Text = string.sub(v36, l_v7_Root_0.StartIndex, l_v7_Root_0.EndIndex), 
            Offset = l_v7_Root_0.StartIndex - 1
        });
        if l_v7_Root_0.Parent then
            l_v7_Root_0 = l_v7_Root_0.Parent;
            l_v7_Root_0.StartIndex = v39;
            l_v7_Root_0.EndIndex = v39;
        end;
        return true;
    end;
    local function _(v41, v42, v43)
        local v44, v45 = string.find(v41, "end");
        if (not v44 or not v45) or not v2.MatchBeforeAndAfter(v41, v44, v45, "[%s]", "[)%s]", true, true) then
            return false;
        else
            return (v40(v41, v42, v43));
        end;
    end;
    local function v55(v47, v48, v49)
        local v50, v51 = string.find(v47, "else");
        if (not v50 or not v51) or not v2.MatchBeforeAndAfter(v47, v50, v51, "[%s]", "[)%s]", true, true) then
            return false;
        else
            local v52, v53 = string.find(v48, v47, l_v7_Root_0.StartIndex, true);
            l_v7_Root_0.EndIndex = v52 - 1;
            table.insert(l_v7_Root_0.Lines, {
                LineNo = v49, 
                Text = string.sub(v48, l_v7_Root_0.StartIndex, l_v7_Root_0.EndIndex), 
                Offset = l_v7_Root_0.StartIndex - 1
            });
            if l_v7_Root_0.Parent then
                l_v7_Root_0 = l_v7_Root_0.Parent;
                l_v7_Root_0.StartIndex = v52;
                l_v7_Root_0.EndIndex = v53;
            end;
            table.insert(l_v7_Root_0.Lines, {
                LineNo = v49, 
                Text = string.sub(v48, l_v7_Root_0.StartIndex, v52 - 1), 
                Offset = l_v7_Root_0.StartIndex - 1
            });
            local v54 = v4.new(v53 + 1, v53 + 1);
            l_v7_Root_0:AddChild(v54);
            l_v7_Root_0 = v54;
            return true;
        end;
    end;
    local function _(v56, v57, v58)
        local v59, v60 = string.find(v56, "elseif");
        if (not v59 or not v60) or not v2.MatchBeforeAndAfter(v56, v59, v60, "[%s]", "[)%s]", true, true) then
            return false;
        else
            return (v40(v56, v57, v58));
        end;
    end;
    local function _(v62, v63, v64)
        local v65, v66 = string.find(v62, "until");
        if (not v65 or not v66) or not v2.MatchBeforeAndAfter(v62, v65, v66, "", "[(]", true, false) then
            return false;
        else
            return (v40(v62, v63, v64));
        end;
    end;
    local function v74(v68, v69, v70)
        if v68 ~= "local" then
            return false;
        else
            local v71, v72 = string.find(v69, v68, v9, true);
            if not (not v71 or not v72) then
                if string.sub(v69, v72 + 1, v72 + 10) == " function " then
                    v9 = v72 + 1;
                    return false;
                else
                    local v73 = string.sub(v69, v72 + 1, (string.len(v69)));
                    if string.len(v73) > 0 then
                        v17(v73, v70);
                    end;
                    v9 = v72 + 1;
                end;
            end;
            return true;
        end;
    end;
    local function v81(v75, v76)
        v9 = 1;
        l_v7_Root_0.StartIndex = 1;
        l_v7_Root_0.EndIndex = 1;
        for v77 in v75:gmatch("%S+") do
            local v78, v79 = string.find(v77, "function");
            if not (not not v78 and if v79 and v2.MatchBeforeAndAfter(v77, v78, v79, "[%s=,]", "[%s\r\n(]", true, true) then v24(v77, v75, v76) else false) and not if not (v77 ~= "repeat" and v77 ~= "do") or v77 == "then" then v24(v77, v75, v76) else false then
                v78, v79 = string.find(v77, "end");
                if not (not not v78 and if v79 and v2.MatchBeforeAndAfter(v77, v78, v79, "[%s]", "[)%s]", true, true) then v40(v77, v75, v76) else false) then
                    v78, v79 = string.find(v77, "until");
                    if not (not not v78 and if v79 and v2.MatchBeforeAndAfter(v77, v78, v79, "", "[(]", true, false) then v40(v77, v75, v76) else false) and not v55(v77, v75, v76) then
                        v78, v79 = string.find(v77, "elseif");
                        if not (not (not not v78 and if v79 and v2.MatchBeforeAndAfter(v77, v78, v79, "[%s]", "[)%s]", true, true) then v40(v77, v75, v76) else false) and v74(v77, v75, v76)) then
                        end;
                    end;
                end;
            end;
        end;
        local v80 = string.sub(v75, l_v7_Root_0.EndIndex, (string.len(v75)));
        v74("local", v80, v76);
        table.insert(l_v7_Root_0.Lines, {
            LineNo = v76, 
            Text = v80, 
            Offset = l_v7_Root_0.EndIndex - 1
        });
    end;
    v2.ForEachLine(l_ScriptEditorService_0:StripComments((l_ScriptEditorService_0:GetEditorSource(v6))), function(v82, v83)
        v81(v82, v83);
    end);
    return v7;
end;
