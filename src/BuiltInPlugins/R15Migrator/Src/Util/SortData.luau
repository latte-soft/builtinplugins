local v0 = {
    Alphabetical = 1, 
    Status = 2
};
v0.getOrderedSortData = function(v1)
    return {
        [v0.Alphabetical] = v1:getText("Summary", "Alphabetical"), 
        [v0.Status] = v1:getText("StatusTable", "Status")
    };
end;
return v0;
