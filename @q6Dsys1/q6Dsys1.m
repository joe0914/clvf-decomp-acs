classdef q6Dsys1 < DynSys
  % Note: Since quad is a "handle class", we can pass on
  % handles/pointers to other plane objects
  % e.g. a.platoon.leader = b (passes b by reference, does not create a copy)
  % Also see constructor
  
  properties
    % control bounds
    uRange
    
    dims %dimensions that are active
    
    grav
  end
  
  methods
      function obj = q6Dsys1(x, uRange, dims)      
      if nargin < 2
        uRange = [-10/180*pi, 10/180*pi];
      end

      if nargin < 3
        dims = 1:3;
      end
      
      % Basic vehicle properties
      obj.pdim = 1; % Position dimensions
      obj.hdim = 3;   % Heading dimensions
      obj.nx = length(dims);
      obj.nu = 1;  
      
      obj.grav = 9.81;
      obj.uRange = uRange;
      obj.x = x;
      obj.xhist = obj.x;
      obj.dims = dims;
    end
    
  end % end methods
end % end classdef
