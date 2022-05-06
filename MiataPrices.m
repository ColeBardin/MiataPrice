clc, clear, close all
hold on

prices = readtable('Prices.csv');
title("Price vs Year of Purcase")
ylabel("Price ($ USD)")
xlabel("Year of Purchase")

legends = [];

legends = plotNA(prices,legends);
%legends = plotNB(prices,legends);
%legends = plotNC(prices,legends);
%legends = plotND(prices,legends);

legend(legends)

axis tight

% Functions
function legends = plotNA(prices,legends)
    NA = prices.Var5=="NA";
    xA = prices.Var1;
    xA = xA(NA);
    yA = prices.Var2;
    yA = yA(NA);
    scatter(xA, yA, 50, 'filled','ro')
    legends = [legends, "NA"];
end

function legends = plotNB(prices, legends)
    NB = prices.Var5=="NB";
    xB = prices.Var1;
    xB = xB(NB);
    yB = prices.Var2;
    yB = yB(NB);
    scatter(xB, yB, 50, 'filled','bo')
    legends = [legends, "NB"];
end

function legends = plotNC(prices, legends)
    NC = prices.Var5=="NC";
    xC = prices.Var1;
    xC = xC(NC);
    yC = prices.Var2;
    yC = yC(NC);
    scatter(xC, yC, 50, 'filled','go')
    legends = [legends, "NA"];
end

function legends = plotND(prices, legends)
    ND = prices.Var5=="ND";
    xD = prices.Var1;
    xD = xD(ND);
    yD = prices.Var2;
    yD = yD(ND);
    scatter(xD, yD, 50, 'filled','ko')
    legends = [legends, "NA"];
end