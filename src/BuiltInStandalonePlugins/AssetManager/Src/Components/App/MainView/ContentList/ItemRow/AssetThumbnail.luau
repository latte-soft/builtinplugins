local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetManager");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local l_UI_0 = require(l_script_FirstAncestor_0.Packages.Framework).UI;
local l_Pane_0 = l_UI_0.Pane;
local l_Image_0 = l_UI_0.Image;
local v5 = require(l_script_FirstAncestor_0.Src.Networking);
local _ = require(l_script_FirstAncestor_0.Src.Types);
return function(v7)
    local v8 = v5:use();
    local v9, v10 = v1.useState("");
    if v9 == "" then
        v8:getThumbnailForItemAsync(v7.AssetInfo, v10);
    end;
    return v1.createElement(l_Pane_0, {
        [v1.Tag] = "ThumbnailContainer X-Center X-Middle"
    }, {
        Thumbnail = v1.createElement(l_Image_0, {
            Image = v9, 
            [v1.Tag] = "Thumbnail"
        })
    });
end;
