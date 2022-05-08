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

%axis([2005,2023, 0, 12000])
%axis tight

% Functions
function legends = plotNA(prices,legends)
    NA = prices.Var5=="NA";

    xA = prices.Var1;
    xA = xA(NA);
    
    yA = prices.Var2;
    yA = yA(NA);

    x_average = [];
    y_average = [];

    for year=1990:1:2023
        sum = 0;
        count = 0;
        len = size(xA);
        for index = 1:1:len(1)
            if xA(index) == year
                count = count + 1;
                sum = sum + yA(index);
            end
        end
        if count>0
            x_average = [x_average, year];
            y_average = [y_average, sum/count];
        end
    end
    bar(x_average,y_average, 'red')
    legends = [legends, "NA"];
end

function legends = plotNB(prices, legends)
    NB = prices.Var5=="NB";

    xB = prices.Var1;
    xB = xB(NB);
    
    yB = prices.Var2;
    yB = yB(NB);

    x_average = [];
    y_average = [];

    for year=1990:1:2023
        sum = 0;
        count = 0;
        len = size(xB);
        for index = 1:1:len(1)
            if xB(index) == year
                count = count + 1;
                sum = sum + yB(index);
            end
        end
        if count>0
            x_average = [x_average, year];
            y_average = [y_average, sum/count];
        end
    end
    bar(x_average,y_average, 'blue')
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