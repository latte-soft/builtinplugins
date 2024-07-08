local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Core.Reducers.AssetsMock);
local v2 = require(l_Parent_0.Core.Reducers.NetworkErrorsMock);
local v3 = require(l_Parent_0.Core.Reducers.PageInfoMock);
local v4 = require(l_Parent_0.Core.Reducers.VotingReducerMock);
local v5 = require(l_Parent_0.Core.Reducers.PurchaseMock);
local v6 = require(l_Parent_0.Core.Reducers.PackagesMock);
return function(v7, v8)
    return {
        assets = v1(v7 and v7.assets, v8), 
        networkErrors = v2(v7 and v7.networkErrors, v8), 
        pageInfo = v3(v7 and v7.pageInfo, v8), 
        voting = v4(v7 and v7.voting, v8), 
        purchase = v5(v7 and v7.purchase, v8), 
        packages = v6(v7 and v7.packages, v8)
    };
end;
