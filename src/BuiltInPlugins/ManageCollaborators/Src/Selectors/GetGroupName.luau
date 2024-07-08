return function(v0, v1)
    return (v0.GroupMetadata.NewGroupMetadata or v0.GroupMetadata.CurrentGroupMetadata)[v1].Name;
end;
