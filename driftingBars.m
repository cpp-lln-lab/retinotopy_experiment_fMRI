function driftingBars(stim, emul, debug)
    % DriftingBars(Subj_ID, Stim, Emul)
    %
    % Drifting bars for mapping population receptive fields
    %   Subj :  String with subject ID
    %   Stim :  Stimulus file name e.g. 'Checkerboard'
    %   Emul :  0 = Triggered by scanner, 1 = Trigger by keypress

    if nargin < 1
        stim = 'Ripples.mat';
    end
    if nargin < 2
        emul = 1;
    end
    if nargin < 3
        debug = 1;
    end

    initEnv();

    %% Experimental Parameters

    cfg.task.name = 'retinotopy drifting bar';

    % Stimulus type
    cfg.aperture.type = 'Bar';

    % Stimulus conditions in each block defined by number
    cfg.conditions = [90 45 0 135 270 225 180 315];

    %% Set defaults

    cfg.stim = stim;
    cfg.debug.do = debug;

    if ~emul
        cfg.testingDevice = 'mri';
    else
        cfg.testingDevice = 'pc';
    end

    %     expParameters.extraColumns.wedge_angle = struct( ...
    %         'length', 1, ...
    %         'bids', struct( ...
    %         'LongName', 'angular width of the wedge', ...
    %         'Units', 'degrees'));

    [cfg] = setParameters(cfg);

    %% Run the experiment
    barsMapping(cfg);