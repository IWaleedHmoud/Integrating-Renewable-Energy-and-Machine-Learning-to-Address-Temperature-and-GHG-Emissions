% Data
sources = {'Solar PV', 'Wind', 'Hydropower', 'Others'};
percentages = [42, 25, 29, 4];
explode = [1 0 0 0];  % Slight explode for Solar PV slice

% Create 3D Pie Chart
figure;
h = pie3(percentages, explode);
colormap jet
title('Global Renewable Power Capacity Share by Energy Source in 2024', ...
    'FontSize', 15, 'FontName', 'Times New Roman');

% Labels: show only percentages
labelText = strcat(string(percentages), {'%'});

% Apply percentage labels and adjust "Solar PV" label position
textIndex = 1;
for i = 1:2:length(h)
    if isa(h(i+1), 'matlab.graphics.primitive.Text')
        h(i+1).String = labelText{textIndex};
        h(i+1).FontSize = 14;
        h(i+1).FontName = 'Times New Roman';

        % Adjust position for Solar PV label (first one)
        if textIndex == 1
            pos = h(i+1).Position;
            pos(1) = pos(1) - 0.2;  % Shift left slightly
            h(i+1).Position = pos;
        end

        textIndex = textIndex + 1;
    end
end

% Show legend with category names only
lgd = legend(sources, 'Location', 'eastoutside');
lgd.FontSize = 14;
lgd.FontName = 'Times New Roman';

% Optional: Tighten layout
ax = gca;
outerpos = ax.OuterPosition;
ti = ax.TightInset;
padding = 0.005;
left = outerpos(1) + ti(1) - padding;
bottom = outerpos(2) + ti(2) - padding;
ax_width = outerpos(3) - ti(1) - ti(3) + 2*padding;
ax_height = outerpos(4) - ti(2) - ti(4) + 2*padding;
ax.Position = [left bottom ax_width ax_height];


%%
% Data
sources = {'Oil', 'Natural Gas', 'Coal', 'Nuclear Energy', 'Renewables'};
percentages = [31.70, 23.20, 26.50, 4, 14.60];
explode = [1 0 0 0 0];  % Slightly explode the first slice (Oil)

% Create 3D Pie Chart
figure;
h = pie3(percentages, explode);
colormap jet
title('Global Electricity Generation Share by Source in 2023', ...
    'FontSize', 16, 'FontName', 'Times New Roman');

% Show only percentages on slices (with Times New Roman)
textIndex = 1;
for i = 1:2:length(h)
    if isa(h(i+1), 'matlab.graphics.primitive.Text')
        h(i+1).String = sprintf('%.1f%%', percentages(textIndex));
        h(i+1).FontSize = 14;
        h(i+1).FontName = 'Times New Roman';
        textIndex = textIndex + 1;
    end
end

% Add legend with category names
lgd = legend(sources, 'Location', 'eastoutside');
lgd.FontSize = 14;
lgd.FontName = 'Times New Roman';

% Adjust layout to reduce white space
ax = gca;
outerpos = ax.OuterPosition;
ti = ax.TightInset;
padding = 0.005;
left = outerpos(1) + ti(1) - padding;
bottom = outerpos(2) + ti(2) - padding;
ax_width = outerpos(3) - ti(1) - ti(3) + 2*padding;
ax_height = outerpos(4) - ti(2) - ti(4) + 2*padding;
ax.Position = [left bottom ax_width ax_height];
