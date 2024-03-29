function dx = dynamics(obj, ~, x, u, d)
% Dynamics of the sys1 decomposed from the 2d system
%    \dot{x}_1 = x^2 + u_x
%    \dot{x}_2 = y + u_y
%   Control: u = v;


if iscell(x)
    dx = cell(length(obj.dims), 1);

    dx{1} = x{1}.^2 + u;
else 
    dx = zeros(obj.nx, 1);
    dx(1) = x(1).^2 + u;
end   

end
