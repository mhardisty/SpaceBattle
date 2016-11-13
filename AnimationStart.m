close all

figure('Position', [0, 0, 1000, 1000])

ship = [0,1,-1,0;-1,1,0,0];
% fill(Square(1,:),Square(2,:), [1 0 0])
title('Ship Animation')
axis([0 10 0 10])
hold on

h1 = fill(ship(1,:),ship(2,:), [1 0 0]);
angle=0;
for i = 1:100
    angle = pi/100;
    ship = [cos(angle) -sin(angle); sin(angle) cos(angle)] * ship;
    set(h1,'XData',ship(1,:) + i*0.1,'YData',ship(2,:) + i*0.1);

    pause(0.1);
    drawnow
end