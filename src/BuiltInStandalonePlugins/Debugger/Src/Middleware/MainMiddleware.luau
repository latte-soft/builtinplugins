local l_Parent_0 = script.Parent.Parent.Parent;
return {
    (require(l_Parent_0.Packages.Framework).Util.ThunkWithArgsMiddleware({
        analytics = require(l_Parent_0.Src.Resources.AnalyticsHolder)
    }))
};
