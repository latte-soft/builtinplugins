local function v0(v1)
    if v1 then
        local l_v1_FirstAncestorWhichIsA_0 = v1:FindFirstAncestorWhichIsA("Model");
        if not l_v1_FirstAncestorWhichIsA_0 then
            return nil;
        else
            local l_SourceAssetId_0 = l_v1_FirstAncestorWhichIsA_0.SourceAssetId;
            if l_SourceAssetId_0 and l_SourceAssetId_0 ~= -1 then
                return l_v1_FirstAncestorWhichIsA_0;
            else
                return v0(l_v1_FirstAncestorWhichIsA_0);
            end;
        end;
    else
        return nil;
    end;
end;
return v0;
