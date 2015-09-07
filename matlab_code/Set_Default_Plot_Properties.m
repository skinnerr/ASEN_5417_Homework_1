function [] = Set_Default_Plot_Properties()

    set(groot, 'DefaultTextInterpreter', 'none', ...
               'DefaultLegendInterpreter', 'none', ...
               'DefaultLineLineWidth', 1.5, ...
               'DefaultAxesLineWidth', 1.5, ...
               'DefaultAxesBox', 'on', ...
               'DefaultAxesXGrid', 'on', ...
               'DefaultAxesYGrid', 'on', ...
               'DefaultAxesZGrid', 'on', ...
               'DefaultAxesGridColor', [0.5,0.5,0.5], ...
               'DefaultAxesFontName', 'Helvetica', ...
               'DefaultAxesFontSize', 12, ...
               'DefaultAxesTitleFontSizeMultiplier', 1.2, ...
               'DefaultAxesLabelFontSizeMultiplier', 1.2 ...
        );

end