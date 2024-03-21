%% Question 1 (b)
clear; clc; close all;

% Set the value we want to approximate the third derivative of e^x at
x0 = 0;

% Set the values of h
exponents = -1:-1:-9;
h = 10.^exponents;
numH = length(h);

% The five point approximation for the third derivative or e^x
approx = (exp(x0 + 2*h) - 2*exp(x0 + h) + 2*exp(x0 - h) - exp(x0 - 2*h))./(2*h.^3);

% Calculate the error
err = abs(approx - exp(x0));

% Display all of the approximations of e^x at x0
fprintf('Using the centered difference formula for ');
fprintf('approximating the third\nderivative of e^x at %.0f:\n\n', x0);
for i = 1:length(approx)
    fprintf('h = %.9f and e^%.f = %.8f\n', h(i), x0, approx(i));
end

% The truncation error approximation
fprintf('\nThe approximate order of the truncation error for each term is:\n');
disp((log(err(2:numH)) - log(err(1:numH - 1)))./(log(h(2:numH)) - log(h(1:numH - 1))));

% Find and display the value of h that yields the closest approximation
[minDistance, indexOfMin] = min(abs(approx - exp(0)));
fprintf('The value of h that yields the closest ');
fprintf('approximation is h = %g\n', h(indexOfMin));

% Optimal h
fprintf('The theoretical optimal h is %.5f', (18*eps/exp(0))^(1/5));

S = load('gong');
sound(S.y, S.Fs)
%% Question 3 (c)
clear; clc; close all;

% Set the value we want to approximate the second derivative of e^x at
x0 = 0;

% Set the values of h
exponents = -1:-1:-9;
h = 10.^exponents;
numH = length(h);

% Set the substitutions for h1 and h0
h0 = h./2;
h1 = h;

% The staggered mesh, centered approximation for the second derivative or e^x
g_1 = (exp(x0 + h1) - exp(x0))./h1;
g_2 = (exp(x0) - exp(x0 - h0))./h0;
approx = (g_1 - g_2)./((h0 + h1)/2);

% Calculate the error
err = abs(approx - exp(x0));

% Display all of the approximations of e^x at x0
fprintf('Using a staggered mesh, centered approximation for ');
fprintf('calculating the second\nderivative of e^x at %.0f:\n\n', x0);
for i = 1:length(approx)
    fprintf('h = %.9f and e^%.0f = %.8f\n', h(i), x0, approx(i));
end

% The truncation error approximation
fprintf('\nThe approximate truncation error for each term is:\n');
disp((log(err(2:numH)) - log(err(1:numH - 1)))./(log(h(2:numH)) - log(h(1:numH - 1))));

% Find and display the value of h that yields the closest approximation
[minDistance, indexOfMin] = min(abs(approx - exp(0)));
fprintf('The value of h that yields the closest ');
fprintf('approximation is h = %f\n', h(indexOfMin));

% Optimal h
fprintf('The theoretical optimal h is %.7f', (12*eps/exp(0))^(1/3));

S = load('laughter');
sound(S.y, S.Fs)