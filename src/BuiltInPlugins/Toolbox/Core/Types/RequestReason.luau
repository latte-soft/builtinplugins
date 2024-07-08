local v0 = {
    InitLoad = 1, 
    ChangeTabs = 2, 
    ChangeCategory = 3, 
    ChangeSort = 4, 
    ChangeGroup = 5, 
    StartSearch = 6, 
    NextPage = 7, 
    UpdatePage = 8
};
v0.IsUpdate = function(v1)
    local v2 = true;
    if v1 ~= v0.NextPage then
        v2 = v1 == v0.UpdatePage;
    end;
    return v2;
end;
return v0;
