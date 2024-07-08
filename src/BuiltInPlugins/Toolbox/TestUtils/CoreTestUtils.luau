local l_Packages_0 = script.Parent.Parent.Packages;
local v1 = require(l_Packages_0.Roact);
local l_ThunkWithArgsMiddleware_0 = require(l_Packages_0.Framework).Util.ThunkWithArgsMiddleware;
return {
    createThunkMiddleware = function()
        return {
            l_ThunkWithArgsMiddleware_0({
                StudioAssetService = {
                    DEPRECATED_SerializeInstances = function(_, v4)
                        assert(typeof(v4) == "table", "Instances must be a table");
                        for _, v6 in ipairs(v4) do
                            assert(v6:IsA("Instance"));
                        end;
                        return "TEST";
                    end
                }
            })
        };
    end, 
    mustSetFlag = function(v7, v8)
        return v1.createElement("TextLabel", {
            Text = string.format("You must set %s to %s to view this story", v7, (tostring(v8))), 
            Size = UDim2.new(1, 0, 0, 100), 
            TextSize = 18, 
            TextWrapped = true, 
            BackgroundTransparency = 1
        });
    end
};
