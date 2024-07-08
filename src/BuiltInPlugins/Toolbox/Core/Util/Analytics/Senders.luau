local l_Parent_0 = script.Parent.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Util.Analytics.Logs);
local l_sendResultToKibana_0 = require(l_Parent_0.Packages.Framework).Util.sendResultToKibana;
local l_RbxAnalyticsService_0 = game:GetService("RbxAnalyticsService");
local l_NewPackageAnalyticsWithRefactor2_0 = game:GetFastFlag("NewPackageAnalyticsWithRefactor2");
local _ = game:GetFastInt("InfluxReportingPackageAnalyticsHundrethsPercent");
local function _(v6)
    return "ToolboxAnalytics_" .. v6;
end;
return {
    sendEventImmediately = function(v8, v9, v10, v11)
        v1.logAnalytics("sendEventImmediately", v8, v9, v10, v11);
        l_RbxAnalyticsService_0:SendEventImmediately(v8, v9, v10, v11);
    end, 
    sendEventDeferred = function(v12, v13, v14, v15)
        v1.logAnalytics("sendEventDeferred", v12, v13, v14, v15);
        l_RbxAnalyticsService_0:SendEventDeferred(v12, v13, v14, v15);
    end, 
    reportCounter = function(v16, v17)
        v17 = v17 or 1;
        v1.logCounterEvent("reportCounter", v16, v17);
        l_RbxAnalyticsService_0:ReportCounter(v16, v17);
    end, 
    sendResultToKibana = function(v18)
        assert(l_NewPackageAnalyticsWithRefactor2_0);
        l_sendResultToKibana_0(v18);
    end
};
