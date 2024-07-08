if not game:GetFastFlag("ImprovePluginSpeed_TagEditor") then
    require(script.Parent.main)(plugin);
    return ;
else
    return ;
end;
