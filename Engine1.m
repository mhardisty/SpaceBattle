close all

h = figure('Position', [0, 0, 1000, 1000]);
title('Ship Animation')
axis([0 10 0 10])
hold on
mike = Ship([1 0 0], [5 5], 0);

ship = get_placement(mike);


h1 = fill(ship(1,:),ship(2,:), [1 0 0]);
for i = 1:100
    thrust = control(mike);
    maneuver(mike, thrust);
    ship = get_placement(mike);
    disp(mike.velocity_)
    
    set(h1,'XData',ship(1,:),'YData',ship(2,:));
    
    
    pause(0.1);
    drawnow
end