local l_Parent_0 = script.Parent.Parent.Parent;
local v1 = require(l_Parent_0.Packages.Rodux);
local v2 = require(l_Parent_0.Packages.Cryo);
return v1.createReducer({
    screensTable = {}, 
    currentScreen = require(l_Parent_0.Src.Util.Screens).MAIN, 
    previousScreens = {}, 
    nextScreens = {}
}, {
    SetScreen = function(v3, v4)
        return v2.Dictionary.join(v3, {
            currentScreen = v4.screen, 
            previousScreens = v2.Dictionary.join(v3.previousScreens, {
                [#v3.previousScreens + 1] = v3.currentScreen
            }), 
            nextScreens = {}
        });
    end, 
    SetToPreviousScreen = function(v5, _)
        assert(#v5.previousScreens > 0, "previousScreens should not be empty");
        return v2.Dictionary.join(v5, {
            currentScreen = v5.previousScreens[#v5.previousScreens], 
            previousScreens = {
                unpack(v5.previousScreens, 1, #v5.previousScreens - 1)
            }, 
            nextScreens = v2.Dictionary.join(v5.nextScreens, {
                [#v5.nextScreens + 1] = v5.currentScreen
            })
        });
    end, 
    SetToNextScreen = function(v7, _)
        assert(#v7.nextScreens > 0, "nextScreens should not be empty");
        return v2.Dictionary.join(v7, {
            currentScreen = v7.nextScreens[#v7.nextScreens], 
            previousScreens = v2.Dictionary.join(v7.previousScreens, {
                [#v7.previousScreens + 1] = v7.currentScreen
            }), 
            nextScreens = {
                unpack(v7.nextScreens, 1, #v7.nextScreens - 1)
            }
        });
    end
});
