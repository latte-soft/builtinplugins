local l_script_FirstAncestor_0 = script:FindFirstAncestor("AssetImporter");
local v1 = require(l_script_FirstAncestor_0.Packages.Roact);
local v2 = require(l_script_FirstAncestor_0.Packages.RoactRodux);
local v3 = require(l_script_FirstAncestor_0.Src.Thunks.ShowImportPrompt);
local v4 = v1.PureComponent:extend("ImportPrompt");
v4.init = function(v5)
    v5.promptClosed = function(v6, v7)
        if v5.props.OnPromptClosed then
            v5.props.OnPromptClosed(v6, v7);
        end;
    end;
end;
v4.render = function(v8)
    v8.props.showImportPrompt(v8.promptClosed);
end;
return v2.connect(nil, function(v9)
    return {
        showImportPrompt = function(v10)
            v9(v3(v10));
        end
    };
end)(v4);
