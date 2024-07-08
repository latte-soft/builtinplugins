local l_script_FirstAncestor_0 = script:FindFirstAncestor("AvatarCompatibilityPreviewer");
local v1 = require(l_script_FirstAncestor_0.Packages.React);
local v2 = require(l_script_FirstAncestor_0.Src.Util.TestInExperienceUtil);
return function()
    local l_FocusedDataModelSession_0 = l_script_FirstAncestor_0.Parent.MultipleDocumentInterfaceInstance.FocusedDataModelSession;
    assert(l_FocusedDataModelSession_0 ~= nil, "FocusedDataModelSession is nil");
    v1.useEffect(function()
        v2.clearTestingAvatars();
        local v4 = l_FocusedDataModelSession_0.CurrentDataModelTypeChanged:Connect(function()
            if l_FocusedDataModelSession_0.CurrentDataModelType == Enum.StudioDataModelType.Edit then
                v2.clearTestingAvatars();
            end;
        end);
        return function()
            v2.clearTestingAvatars();
            v4:Disconnect();
        end;
    end, {});
end;
