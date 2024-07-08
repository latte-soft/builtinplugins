return function(v0)
    local l_Parent_0 = v0.Parent;
    while true do
        if not l_Parent_0 then
            return nil;
        elseif l_Parent_0.SourceAssetId > 0 then
            return l_Parent_0;
        else
            l_Parent_0 = l_Parent_0.Parent;
        end;
    end;
end;
