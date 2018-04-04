F_A = 340;
F_B = 335;

rate = 44100;
time = 0.1;
t = 0:1/rate:time;
%Assume 100 is the max amplitude
%a = 15*sin(2*pi*F_A*t);
%out = [zeros(size(t)); a]';
%{
%Works fine
amps = {};
%for i=47:1:86
for i=1:1:86
    aR = (47 - i)*(47-i);
    aL = (39 - i)*(39 - i);
    %ampR = 15*(1 - aL/2209);
    %ampL = 15*(1 - aR/2209);
    ampR = 15/aL;
    ampL = 15/aR;
    amps{i} =  [ampL, ampR];
end
for i=1:1:86
    left = amps{i}(1)*sin(2*pi*F_A*t);
    right = amps{i}(2)*sin(2*pi*F_A*t);
    out = [left; right]';
    sound(out, rate);
    pause(0.1)
end
%}
%Pause 2 seconds for next noise sample

%pause(2)

xCenter = 43;
yCenter = 14.5;
xRadius = 25;
yRadius = 8;
theta = 0 : 0.1 : 2*pi;
x = xRadius * cos(theta) + xCenter;
y = yRadius * sin(theta) + yCenter;
for i=1:1:length(x)
    aR = (47 - x(i))*(47-x(i)) + (14.5-y(i))*(14.5-y(i));
    aL = (39 - x(i))*(39-x(i)) + (14.5-y(i))*(14.5-y(i));
    ampR = 15/aL;
    ampL = 15/aR;
    if y(i) < 14.5
        left = ampL*sin(2*pi*F_B*t);
        right = ampR*sin(2*pi*F_B*t);
        out = [left; right]';
        sound(out, rate);
        pause(0.1);
    else
        left = ampL*sin(2*pi*F_A*t);
        right = ampR*sin(2*pi*F_A*t);
        out = [left; right]';
        sound(out, rate);
        pause(0.1);
    end

end
