

Data1 = readtable('Model 1.xlsx') ;
Data2 = readtable('Model 2.xlsx') ;



mdl_1 = fitlm(Data1, 'linear') ;
mdl_2 = fitlm(Data2, 'linear') ;

% New x values for smooth curve
xq1 = linspace(min(Data1.(1)), max(Data1.(1)), 100)';
[y_pred1, y_ci1] = predict(mdl_1, xq1, 'prediction', 'observation', 'Alpha', 0.05) ;

xq2 = linspace(min(Data2.(1)), max(Data2.(1)), 100)';
[y_pred2, y_ci2] = predict(mdl_2, xq2, 'prediction', 'observation', 'Alpha', 0.05) ;

set(groot, 'DefaultAxesFontSize', 12);

%% Model 1 Confidence Interval
figure; hold on;
scatter(Data1.(1), Data1.(2), 'bx', 'LineWidth', 2, 'DisplayName', 'Data');
plot(xq1, y_pred1, 'g', 'LineWidth', 2, 'DisplayName','Prediction') ;
plot(xq1, y_ci1, 'r--', 'LineWidth', 2, 'DisplayName', '95% Confidence Interval') ;
grid on; axis tight ; legend('Location','best') ;
xlabel('Emitted CO_{2} [MtCO_2]', 'Interpreter', 'tex', 'FontSize', 12, 'FontWeight', 'bold');
ylabel('Trapped Solar Radiation [W/m^2]', 'Interpreter', 'tex', 'FontSize', 12, 'FontWeight', 'bold') ;


%% Model 2 Confidence Interval
figure; hold on;
scatter(Data2.(1), Data2.(2), 'bx', 'LineWidth', 2, 'DisplayName', 'Data');
plot(xq2, y_pred2, 'g', 'LineWidth', 2, 'DisplayName','Prediction') ;
plot(xq2, y_ci2, 'r--', 'LineWidth', 2, 'DisplayName', '95% Confidence Interval') ;
grid on ; axis tight ; legend('Location', 'best') ;
xlabel('Trapped Solar Radiation [W/m^2]', 'FontSize', 12, 'FontWeight', 'bold') ;

ylabel('Average Temperature [°C]', 'Interpreter', 'tex', 'FontSize', 12, 'FontWeight', 'bold') ;
