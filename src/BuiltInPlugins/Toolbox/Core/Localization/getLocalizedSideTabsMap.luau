local v0 = require(script:FindFirstAncestor("Toolbox").Core.Util.AssetConfigConstants);
return function(v1)
    return {
        [v0.SIDE_TABS.Sales] = v1:getText("General", "SideTabSales"), 
        [v0.SIDE_TABS.Versions] = v1:getText("General", "SideTabVersions"), 
        [v0.SIDE_TABS.General] = v1:getText("General", "SideTabGeneral"), 
        [v0.SIDE_TABS.Permissions] = v1:getText("General", "SideTabPermissions")
    };
end;
