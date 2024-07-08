local _ = function(v0)
    for _, v2 in (v0:GetStatuses()), nil, nil do
        if not (not (v2.Level == "Error") or not v0.ShouldImport) then
            return true;
        end;
    end;
    return false;
end;
return function(v4)
    local v5;
    for _, v7 in (v4:GetStatuses()), nil, nil do
        if not (not (v7.Level == "Error") or not v4.ShouldImport) then
            v5 = true;
            goto label0 --[[  true, false  ]];
        end;
    end;
    v5 = false;
    ::label0::;
    if not v5 then
        for _, v9 in pairs(v4:GetDescendants()) do
            local v10;
            for _, v12 in (v9:GetStatuses()), nil, nil do
                if not (not (v12.Level == "Error") or not v9.ShouldImport) then
                    v10 = true;
                    goto label1 --[[  true, false  ]];
                end;
            end;
            v10 = false;
            ::label1::;
            if v10 then
                return true;
            end;
        end;
        return false;
    else
        return true;
    end;
end;
