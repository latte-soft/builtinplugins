local l_script_FirstAncestor_0 = script:FindFirstAncestor("Toolbox");
local l_Packages_0 = l_script_FirstAncestor_0.Packages;
local v2 = require(l_Packages_0.Roact);
local v3 = require(l_Packages_0.Framework);
local v4 = require(l_script_FirstAncestor_0.Core.Util.Constants);
local _ = require(l_script_FirstAncestor_0.Core.Components.AssetLogicWrapper);
local _ = require(l_script_FirstAncestor_0.Core.Types.AssetLogicTypes);
local l_ContextServices_0 = v3.ContextServices;
local l_withContext_0 = l_ContextServices_0.withContext;
local _ = require(l_script_FirstAncestor_0.Core.Models.AssetInfo);
local _ = v3.UI.LoadingIndicator;
local v11 = require(l_script_FirstAncestor_0.Core.Components.Audio.AudioTable);
local _ = require(l_script_FirstAncestor_0.Core.Components.StyledScrollingFrame);
local v13 = require(l_script_FirstAncestor_0.Core.Components.LoadScroller);
local v14 = v2.PureComponent:extend("AudioScroller");
v14.defaultProps = {
    Size = UDim2.new(1, 0, 1, 0), 
    PageSize = 20
};
v14.init = function(v15, _)
    v15.calculateCanvasHeight = function(_)
        local _ = v15.props;
        return ((v4.AUDIO_ROW.ROW_HEIGHT * #v15.props.Assets + (not v15.props.Loading and 0 or 60)) + (not v15.props.RenderTopContent and 0 or 30)) + v4.AUDIO_ROW.EXPANDED_ROW_HEIGHT;
    end;
end;
v14.render = function(v19)
    local l_props_1 = v19.props;
    local _ = v19.state;
    return v2.createElement(v13, {
        CalculateCanvasHeight = v19.calculateCanvasHeight, 
        FetchNextPage = l_props_1.FetchNextPage, 
        Items = l_props_1.Assets, 
        Loading = l_props_1.Loading, 
        PageSize = l_props_1.PageSize, 
        Position = l_props_1.Position, 
        RenderContent = function()
            return v11.Generator({
                AudioType = l_props_1.AudioType, 
                Assets = l_props_1.Assets, 
                TryInsert = l_props_1.TryInsert, 
                CanInsertAsset = l_props_1.CanInsertAsset, 
                LayoutOrder = 2, 
                LogImpression = l_props_1.LogImpression, 
                OnAssetPreviewButtonClicked = l_props_1.OnAssetPreviewButtonClicked, 
                ParentAbsoluteSize = l_props_1.ParentAbsoluteSize, 
                TryOpenAssetConfig = l_props_1.TryOpenAssetConfig, 
                SwimlaneName = l_props_1.SwimlaneName
            });
        end, 
        RenderTopContent = l_props_1.RenderTopContent, 
        Size = l_props_1.Size, 
        Total = l_props_1.Total
    });
end;
v14 = l_withContext_0({
    Localization = l_ContextServices_0.Localization, 
    Stylizer = l_ContextServices_0.Stylizer
})(v14);
TypedAudioScroller = function(v22, v23)
    return v2.createElement(v14, v22, v23);
end;
return {
    Component = v14, 
    Generator = TypedAudioScroller
};
