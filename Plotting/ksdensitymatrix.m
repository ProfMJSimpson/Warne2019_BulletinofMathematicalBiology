function [h,ax] = ksdensitymatrix(h,ax,X,lims,res,labels,linspec,colorspec)
%% [h, ax] ksdensitymatrix(h,ax,X,lims,res,labels,linspec,colorspec)
% Generates a plot matrix of an M dimensional multivariate probability density 
% from N samples.
%
% Inputs:
%    h - the current figure handle, set h = [] to create a new figure
%    ax - axes list handles 
%    X - array of multivariate samples, X(i,:) is the i-th sample and X(:,j) is
%        all the samples of the j-th dimension
%    lims - 2 by M list of plot limits for each dimension
%    labels - list of labels ofr each dimension
%    linspec - line properties for plotting
%    colorspec - colour properties form plotting
%
% Author: David J. Warne (david.warne@qut.edu.au)
%         School of Mathematical Sciences
%         Queensland University of Technology

[N,M] = size(X); % N number of samples, M data dimension

if isempty(h)
    h = figure;
    for i=1:M
        for j=1:M
            ax(i,j) = subplot(M,M,M*(i-1) + j);
        end
    end
end
if isempty(lims)
    lims = zeros(2,M);
    lims(1,:) = min(X);
    lims(2,:) = max(X);
end

for i=1:M
    for j=1:M
        axes(ax(i,j));
        box on
        hold on;
        if i==j
            pts = linspace(lims(1,i),lims(2,i),res);
            [p,xi] = ksdensity(X(:,i),pts);
            plot(xi,p,linspec,'color',colorspec,'LineWidth',1);
            xlim([lims(1,i),lims(2,i)]);
            ylabel(['$p(',labels{i},' | C_{obs})$'])
            xlabel(['$',labels{i},'$']);
        else
            xpts = linspace(lims(1,j),lims(2,j),res);
            ypts = linspace(lims(1,i),lims(2,i),res);
            [Xp,Yp] = ndgrid(xpts,ypts);
            [p,xy] = ksdensity(X(:,[j,i]),[Xp(:),Yp(:)],'PlotFcn','contour');
            P = reshape(p,[res,res]);
            xi = reshape(xy(:,1),[res,res]);
            yi = reshape(xy(:,2),[res,res]);
            [c,h] = contour(xi,yi,P,4,linspec,'color',colorspec,'LineWidth',1);
            %clabel(c,h)
            %shading interp
            view(2);
            xlim([lims(1,j),lims(2,j)]);
            ylim([lims(1,i),lims(2,i)]);
            ylabel(['$',labels{i},'$']);
            xlabel(['$',labels{j},'$']);
        end
        %if j==1
        %    ylabel(labels{i});
        %end
        %if i==M
        %    xlabel(labels{j});
        %end
        hold off;
    end
end
