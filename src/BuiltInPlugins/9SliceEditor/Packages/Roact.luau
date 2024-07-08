local l_9SliceEditorMigrateToRoact17_0 = game:GetFastFlag("9SliceEditorMigrateToRoact17");
local l_script_FirstAncestor_0 = script:FindFirstAncestor("Packages");
if not l_9SliceEditorMigrateToRoact17_0 then
    return require(l_script_FirstAncestor_0._Index.Roact.Roact);
else
    return require(l_script_FirstAncestor_0.RoactCompat);
end;
