local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
return require(l_script_FirstAncestor_0.Packages.Framework).Style.makeTheme(l_script_FirstAncestor_0.Src.Components, {
    Dark = {
        Foo = "FOO"
    }, 
    Light = {
        Foo = "BAR"
    }
});
