local _ = require(script:FindFirstAncestor("R15Migrator").Src.Util.ScriptAnalysis.Range);
return function(v1, v2, v3)
    local l_Range_0 = v1.Range;
    local l_Range_1 = v2.Range;
    if v3 == Enum.SortDirection.Descending then
        if not l_Range_0 or not l_Range_1 then
            return v1.Script:GetFullName() < v2.Script:GetFullName();
        else
            return l_Range_0:__lt(l_Range_1);
        end;
    elseif not l_Range_0 or not l_Range_1 then
        return v2.Script:GetFullName() < v1.Script:GetFullName();
    else
        return not l_Range_0:__le(l_Range_1);
    end;
end;
