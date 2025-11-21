
if ~bdIsLibrary(bdroot)
    [dirpath, ~,~] = fileparts(mfilename('fullpath'));
    blocks = find_system(gcb,'LookUnderMasks', 'on', 'FollowLinks', 'on', 'finiteStateMachine','on');
    for i0=1:length(blocks)
        fsm_config = get_param(blocks{i0}, 'desc_file');
        slashs = strfind(fsm_config, '/');
        if ~isempty(slashs)
            fsm_config = fsm_config(slashs(end)+1:end);
        end
        set_param(blocks{i0}, 'desc_file', [dirpath '/' fsm_config]);
    end
end
