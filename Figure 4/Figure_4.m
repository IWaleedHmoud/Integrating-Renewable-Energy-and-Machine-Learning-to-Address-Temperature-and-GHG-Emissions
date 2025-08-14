data = readmatrix('Summary.xlsx');

air2020=data(:, 1);
rad2020=data(:,2);
win2020=data(:,3);

air2021=data(:,5);
rad2021=data(:,6);
win2021=data(:,7);

air2022=data(:,9);
rad2022=data(:,10);
win2022=data(:,11);

air2023=data(:,13);
rad2023=data(:,14);
win2023=data(:,15);

air2024=data(:,17);
rad2024=data(:,18);
win2024=data(:,19);


fontSize = 16; % Desired font size
months = {'January','February','March','April','May','June', ...
          'July','August','September','October','November','December'};
xticksVals = 1:12;

figure;

% Top subplot: air data
subplot(3,1,1);
plot(air2020, 'r-', 'DisplayName', '2020');
hold on;
plot(air2021, 'g-', 'DisplayName', '2021');
plot(air2022, 'b-', 'DisplayName', '2022');
plot(air2023, 'm-', 'DisplayName', '2023');
plot(air2024, 'k-', 'DisplayName', '2024');
hold off;
title('Average Air Temperature (2020–2024)', 'FontSize', fontSize);
ylabel('C^o', 'FontSize', fontSize);
legend('FontSize', 14, 'Orientation', 'horizontal');
grid on;
xticks(xticksVals);
xticklabels(months);
ylim([0 40]);
xlim([1 12]);

set(gca, 'FontSize', fontSize);  % Set axis font size

% Middle subplot: rad data
subplot(3,1,2);
plot(rad2020, 'r-', 'DisplayName', '2020');
hold on;
plot(rad2021, 'g-', 'DisplayName', '2021');
plot(rad2022, 'b-', 'DisplayName', '2022');
plot(rad2023, 'm-', 'DisplayName', '2023');
plot(rad2024, 'k-', 'DisplayName', '2024');
hold off;
title('Solar Radiation (2020–2024)', 'FontSize', fontSize);
ylabel('kW/m^2', 'FontSize', fontSize);
legend('FontSize', 14, 'Orientation', 'horizontal');
grid on;
xticks(xticksVals);
xticklabels(months);
xlim([1 12]);

set(gca, 'FontSize', fontSize);

% Bottom subplot: wind data
subplot(3,1,3);
plot(win2020, 'r-', 'DisplayName', '2020');
hold on;
plot(win2021, 'g-', 'DisplayName', '2021');
plot(win2022, 'b-', 'DisplayName', '2022');
plot(win2023, 'm-', 'DisplayName', '2023');
plot(win2024, 'k-', 'DisplayName', '2024');
hold off;
title('Wind Speed (2020–2024)', 'FontSize', fontSize);
xlabel('Month', 'FontSize', fontSize);
ylabel('m/s', 'FontSize', fontSize);
legend('FontSize', 14, 'Orientation', 'horizontal');
grid on;
xticks(xticksVals);
xticklabels(months);
xlim([1 12]);

set(gca, 'FontSize', fontSize);
