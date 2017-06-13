function model = objUpdatePerturbations(model)
  
% OBJUPDATEPERTURBATIONS
%
% Usage: model = objUpdatePerturbations(model)
%
% Called by (at least) objAddPerturbations.
  
% Copyright (C) 2017 Toni Saarela
% 2017-06-08 - ts - first version
  
  if model.flags.normal_dir(model.idx)
      case 'plane'

        % NOT FINIsHED. Make sure normals are computed
        % first. Update to using model.P
        model.X = model.X + pert.*model.normals(:,1);
        model.Y = model.Y + pert.*model.normals(:,2);
        model.Z = model.Z + pert.*model.normals(:,3);
    
  else
    switch model.shape
      case 'sphere'
        model.R = model.Rbase + sum(model.P(:,model.flags.use_perturbation),2);
      case 'plane'
        model.Z = model.Zbase + sum(model.P(:,model.flags.use_perturbation),2);
      case {'cylinder','revolution','extrusion'}
        model.R = model.Rbase + sum(model.P(:,model.flags.use_perturbation),2);
      case 'worm'
        model.R = model.Rbase + sum(model.P(:,model.flags.use_perturbation),2);
      case 'torus'
        model.r = model.rbase + sum(model.P(:,model.flags.use_perturbation),2);
      case 'disk'
        if strcmp(model.opts.coords,'polar')
          model.Y = model.Ybase + sum(model.P(:,model.flags.use_perturbation),2);
        elseif strcmp(model.opts.coords,'cartesian')
          model.Y = model.Ybase + sum(model.P(:,model.flags.use_perturbation),2);
        end
      otherwise
        error('Unknown shape.');
    end
  end  
  
end
