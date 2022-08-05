% Elbit validation
close all; clear;clc;
fig = 1;

x_bars = [0:4];
name_x_bars = {'300R','300R + 355R','300R + 355S','300R + 4577S','300R + 8263S'};

mIOU_val = [42.0,47.5,43.9,50.1,52.5];
wIOU_val = [67.5,73.2,68.8,72.2,73.3];
mIOU_test = [43.6,54.0,46.2,52.8,52.2];
wIOU_test = [67.6,72.1,68.1,71.2,72.2];

figure(fig);
subplot(1,2,1)
plot(x_bars,mIOU_val,'--r*');
hold on
plot(x_bars,wIOU_val,'--b*');
legend({'mIOU','wIOU'},'location','best')
set(gca,'xtick',x_bars,'xticklabel',name_x_bars);
Set_fig_YS(gca,14,14,14);
set(gca,'XTickLabelRotation',-30);
ylabel('Semantic accuracy [%]');
title({'Validation (\Test 1) results on Elbit Thermal Night Images'},'FontSize',12);
subplot(1,2,2)
plot(x_bars,mIOU_test,'--r*');
hold on
plot(x_bars,wIOU_test,'--b*');
legend({'mIOU','wIOU'},'location','best')
set(gca,'xtick',x_bars,'xticklabel',name_x_bars);
Set_fig_YS(gca,14,14,14);
set(gca,'XTickLabelRotation',-30);
ylabel('Semantic accuracy [%]');
title({'Test 2 results on Elbit Thermal Night Images'},'FontSize',12);
fig = fig + 1;