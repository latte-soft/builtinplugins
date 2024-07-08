local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_StoreContext_0 = require(l_script_FirstAncestor_0.Packages.RoactRodux).StoreContext;
return function()
    local v3 = v1.useContext(l_StoreContext_0);
    assert(v3, "useDispatch and useSelector can only be called from a descendant of the Rodux Store Provider");
    return v3;
end;
