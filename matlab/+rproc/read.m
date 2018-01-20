function res = read(varargin)
opts.scoresroot = fullfile(hb_path, 'scores_new');
opts = vl_argparse(opts, varargin);
scoresroot = opts.scoresroot;
dirs = utls.listdirs(scoresroot);

res.verification = cell(1, numel(dirs));
res.matching = cell(1, numel(dirs));
res.retrieval = cell(1, numel(dirs));

status = utls.textprogressbar(numel(dirs), 'updatestep', 1, ...
  'startmsg', 'Loading results');
for resi = 1:numel(dirs)
  res.verification{resi} = readtable(fullfile(scoresroot, dirs{resi}, 'verification.csv'), 'Delimiter', ',');
  res.matching{resi} = readtable(fullfile(scoresroot, dirs{resi}, 'matching.csv'), 'Delimiter', ',');
  res.retrieval{resi} = readtable(fullfile(scoresroot, dirs{resi}, 'retrieval.csv'), 'Delimiter', ',');
  status(resi);
end
res.verification = vertcat(res.verification{:});
res.matching = vertcat(res.matching{:});
res.retrieval = vertcat(res.retrieval{:});
end
