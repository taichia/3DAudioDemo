F_A = 440;
F_B = 400;

rate = 44100;
time = 0.1;
t = 0:1/rate:time;
%Assume 100 is the max amplitude
%a = 100*sin(2*pi*F_A*t);
%out = [zeros(size(t)); a]';
amps = {};
for i=47:1:86
    aR = (47 - i)*(47-i);
    aL = (39 - i)*(39 - i);
    ampR = 100*(1 - aL/2209);
    ampL = 100*(1 - aR/2209);
    amps{i-46} =  [ampR, ampL];
end
for i=1:1:40
    left = amps{i}(1)*sin(2*pi*F_A*t);
    right = amps{i}(2)*sin(2*pi*F_A*t);
    out = [left; right]';
    sound(out, rate);
    pause(0.1)
end
%sound(out, rate)