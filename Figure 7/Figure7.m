clc; clear; close all

T = readtable('Results.xlsx') ;

%% Wind project names
X1 = categorical(T.ProjectName(1:9));
X1 = reordercats(X1, T.ProjectName(1:9));

%% Wind Projects --> 3x3
FS = 12 ; % Font Size

figure;
t1 = tiledlayout(3, 3) ;

for i = 1:size(X1, 1)
    nexttile
    X = categorical(T.ProjectName(i)) ;

    bar(X, [T.BaseCase(i) T.ProposedCase(i) T.Reduction(i)]) ;
    
    ax = gca ;
    ax.FontSize = FS ;
    ax.FontWeight = "bold" ;
    fontname("Times New Roman") ;
    
    grid on
end

ylabel(t1, 'Emitted CO_{2} [tCO_{2}]', 'FontSize', 12, 'FontWeight', 'bold');

%% Top PV CO2 emission reduction projects
figure ;
t = tiledlayout(3, 3) ;
TopPV = [13, 16, 17, 20, 21, 22, 23, 26, 27] ;
PVlge = [13, 22, 27] ; % projects with higher ylimit

for i = 1:size(TopPV, 2)
    nexttile
    X = categorical(T.ProjectName(TopPV(i))) ;

    bar(X, [T.BaseCase(TopPV(i)) T.ProposedCase(TopPV(i)) T.Reduction(TopPV(i))]) ;
    
    if ismember(PVlge, TopPV)
        ylim([0 T.BaseCase(TopPV(i)) + 5500]) ;
    else
        ylim([0 T.BaseCase(TopPV(i)) + 1500]) ;
    end
    

    ax = gca ;
    ax.FontSize = FS ;
    ax.FontWeight = "bold" ;
    fontname("Times New Roman") ;
    grid on

end


ylabel(t, 'Emitted CO_{2} [tCO_{2}]', 'FontSize', 12, 'FontWeight', 'bold');

