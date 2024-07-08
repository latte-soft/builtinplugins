return require(script.Parent.Parent.Parent.Packages.Framework).Util.Action(script.Name, function(v0)
    assert(v0, "SetPurchaseStatus expects a PurchaseStatus.");
    return {
        status = v0
    };
end);
