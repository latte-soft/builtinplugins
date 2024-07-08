local l_script_FirstAncestor_0 = script:FindFirstAncestor("Packages");
if not require(l_script_FirstAncestor_0.Parent.Src.Flags.getFFlagDebugAssetImporterPackageMigration)() then
    return require(l_script_FirstAncestor_0._Index.Roact.Roact);
else
    return require(l_script_FirstAncestor_0.RoactCompat);
end;
