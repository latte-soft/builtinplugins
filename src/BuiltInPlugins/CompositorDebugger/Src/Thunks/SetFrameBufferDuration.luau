local l_script_FirstAncestor_0 = script:FindFirstAncestor("CompositorDebugger");
local v1 = require(l_script_FirstAncestor_0.Packages.Dash);
local _ = v1.forEach;
local _ = v1.join;
local _ = v1.joinDeep;
local _ = v1.keys;
local _ = v1.None;
local v7 = require(l_script_FirstAncestor_0.Src.Actions.SetFrameBuffer);
local l_Util_0 = l_script_FirstAncestor_0.Src.Util;
local v9 = require(l_Util_0.CircularBuffer);
local v10 = require(l_Util_0.Constants);
return function(v11)
    return function(v12)
        local l_FrameBuffer_0 = v12:getState().DebugData.FrameBuffer;
        local v14 = v11 * v10.FRAMERATE;
        local v15 = nil;
        if not l_FrameBuffer_0 then
            v15 = v9.new(v14);
        elseif l_FrameBuffer_0:getSize() == v14 then
            return ;
        else
            v15 = l_FrameBuffer_0:resize(v14);
        end;
        v12:dispatch(v7(v15));
    end;
end;
