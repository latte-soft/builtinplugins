if not game:getFastFlag("ImprovePluginSpeed_ManageCollaborators") then
    require(script.Parent.main)(plugin);
    return ;
else
    return ;
end;
