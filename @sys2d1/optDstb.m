function dOpt = optDstb(obj, ~, ~, deriv, dMode)
% dOpt = optCtrl(obj, t, y, deriv, dMode)
%     Dynamics of the DubinsCar
%         \dot{x}_1 = v * cos(d)
%         \dot{x}_2 = u

%% Input processings
if nargin < 5
  dMode = 'max';
end

if ~iscell(deriv)
  deriv = num2cell(deriv);
end

dOpt = cell(obj.nd, 1);

%% Optimal control
if strcmp(dMode, 'max')
  for i = 1:2
    if any(obj.dims == i)
      dOpt{i} = (deriv{obj.dims==i}>=0)*obj.dRange{2}(i) + ...
        (deriv{obj.dims==i}<0)*(obj.dRange{1}(i));
    end
  end

elseif strcmp(dMode, 'min')
  for i = 1:2
    if any(obj.dims == i)
      dOpt{i} = (deriv{obj.dims==i}>=0)*(obj.dRange{1}(i)) + ...
        (deriv{obj.dims==i}<0)*obj.dRange{2}(i);
    end
  end
else
  error('Unknown dMode!')
end

end