classdef Ship < handle
    %SHIP Extend this class to design your ship
    %   Detailed explanation goes here
    
    properties
        color_
        shape_ % center of mass is [0 0]
        position_ % row vector
        angle_ % orientation in radians. 0 radians points at [1 0].
        velocity_
        rotation_
        thrust_limit_ = 1;
    end
    
    methods
        function obj = Ship(color, pos, orientation)
            obj.color_ = color;
            obj.shape_ = [0 -0.5 1 -0.5; 0 0.5 0 -0.5];
            obj.position_ = pos;
            obj.angle_ = orientation;
            obj.velocity_ = [0 0];
            obj.rotation_ = [0 0];
        end
        
        function placement = get_placement(obj)
            R = [cos(obj.angle_) -sin(obj.angle_); sin(obj.angle_) cos(obj.angle_)];
            rotated_shape = R * obj.shape_;
            disp('---')
            disp(rotated_shape)
            placement = rotated_shape + repmat(obj.position_',1,4);
        end
        
        function maneuver(obj, thrust)
            % thrust is a 2x3 matrix. 
            % left column is left forward thrust
            % middle column is reverse thrust
            % right column is right forward thrust
            obj.velocity_ = (obj.velocity_' + sum(thrust, 2))';
            obj.rotation_ = thrust(:, 3) - thrust(:, 2);
            obj.position_ = obj.position_ + obj.velocity_;
            obj.angle_ = obj.angle_ + obj.rotation_;           
        end

        function thrust = control(obj)
            thrust = [0.1 0 0.1; 0 0 0];
        end
        
    end
    
end

