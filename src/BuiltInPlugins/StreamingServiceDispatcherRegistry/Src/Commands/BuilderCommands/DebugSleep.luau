local _ = require(script:FindFirstAncestor("StreamingServiceDispatcherRegistry").Src.Types);
return function(v1)
    if v1 then
        local l_arguments_0 = v1.arguments;
        if (not v1 or not l_arguments_0) or not l_arguments_0.time then
            task.wait(1);
            return ;
        else
            task.wait(l_arguments_0.time);
            return ;
        end;
    else
        task.wait(1);
        return ;
    end;
end;
