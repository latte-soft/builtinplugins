local l_Parent_0 = script.Parent.Parent;
require(script.Parent.defineLuaFlags);
if not require(l_Parent_0.Src.Flags.getFFlagImprovePluginSpeedPivotEditor)() then
    require(script.Parent.main)(plugin);
    return ;
else
    return ;
end;
