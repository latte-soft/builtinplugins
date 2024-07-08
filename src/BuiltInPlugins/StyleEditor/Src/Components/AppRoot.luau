local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.RoactRodux);
local v2 = require(l_Parent_0.Packages.React);
local l_useEffect_0 = v2.useEffect;
local l_Pane_0 = require(l_Parent_0.Packages.Framework).UI.Pane;
local l_Thunks_0 = l_Parent_0.Src.Thunks;
local v6 = require(l_Thunks_0.Telemetry.TrackPluginFocused);
local v7 = require(l_Thunks_0.Telemetry.TrackPluginUnfocused);
local v8 = require(l_Parent_0.Src.Components.AssetListener);
local v9 = require(l_Parent_0.Src.Components.MainPage);
local v10 = require(l_Parent_0.Src.Components.OnboardingPage);
local v11 = require(l_Parent_0.Src.Components.StyleTreeListener);
local v12 = require(l_Parent_0.Src.Hooks.useFrameworkContext);
local v13 = require(l_Parent_0.Src.Hooks.useSignalConnectionList);
local v14 = require(l_Parent_0.Src.Hooks.useDispatch);
local _ = require(l_Parent_0.Src.Reducers.RootReducer);
local v16 = {
    Main = v9, 
    Onboarding = v10
};
return v1.connect(function(v17)
    return {
        RootRoute = v17.Window.RootRoute
    };
end)(function(v18)
    local v19 = v14();
    local v20 = v13();
    local v21 = v12().Focus:get();
    local v22 = v16[v18.RootRoute];
    if v22 == nil then
        warn((("route '%*' expected to map to valid component"):format(v18.RootRoute)));
    end;
    l_useEffect_0(function()
        v20.add(v21.WindowFocused:Connect(function()
            v19(v6());
        end));
        v20.add(v21.WindowFocusReleased:Connect(function()
            v19(v7());
        end));
    end, {});
    return v2.createElement(l_Pane_0, {
        [v2.Tag] = "PositionCenter X-Fill"
    }, {
        AppContent = v2.createElement(v22), 
        AssetListener = v2.createElement(v8), 
        StyleTreeListener = v2.createElement(v11)
    });
end);
