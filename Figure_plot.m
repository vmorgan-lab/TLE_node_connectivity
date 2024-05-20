
function h1=Figure_plot(Group1,Group2,Group3,I,c1,c2,c3)

    % This function will plot boxplot and each data point as a circle inside it for three
    % different groups

    %% Input:
    % Group 1, Group2 and Group 3 are your three different groups
    % i: the desired region of interest
    % c1, c2 and c3 are your desired color for each group 

    y=[Group1(:,I);Group2(:,I);Group3(:,I)];  
    g=[ones(size(Group1,1),1);2*ones(size(Group2,1),1);3*ones(size(Group3,1),1)];
    
    subplot(1,2,1);
    h1 = boxplot(y,g,'Notch','on','Colors','k','Symbol','w');hold on
    set(h1,'LineWidth',2)

   % Group1
   yy=Group1(:,I);
   scatter(0.8*ones(5,1),yy(1:5),200,c1,'filled','MarkerEdgeColor',[0 0 0],'LineWidth',1);
   hold on
   scatter(1.2*ones(5,1),yy(6:10),200,c1,'filled','MarkerEdgeColor',[0 0 0],'LineWidth',1);
   hold on
   scatter(0.9*ones(size(yy,1)-10,1),yy(11:end),200,c1,'filled','MarkerEdgeColor',[0 0 0],'LineWidth',1);
   hold on 

   % Group2
   yyy=Group2(:,I);
   scatter(2*ones(5,1),yyy(1:5),200,c2,'filled','MarkerEdgeColor',[0 0 0],'LineWidth',1);
   hold on
   scatter(1.9*ones(5,1),yyy(6:10),200,c2,'filled','MarkerEdgeColor',[0 0 0],'LineWidth',1);
   hold on
   scatter(2.1*ones(size(yyy,1)-10,1),yyy(11:end),200,c2,'filled','MarkerEdgeColor',[0 0 0],'LineWidth',1);
   hold on 

   % Group3
  
   yyyy=Group3(:,I);
   scatter(2.8*ones(5,1),yyyy(1:5),200,c3,'filled','MarkerEdgeColor',[0 0 0],'LineWidth',1);
   hold on
   scatter(2.9*ones(5,1),yyyy(6:10),200,c3,'filled','MarkerEdgeColor',[0 0 0],'LineWidth',1);
   hold on
   scatter(3*ones(size(yyyy,1)-10,1),yyyy(11:end),200,c3,'filled','MarkerEdgeColor',[0 0 0],'LineWidth',1);
   hold on 

    box on
    yline(0,'-','LineWidth',1.5,'FontSize',14,'fontweight', 'bold');
    ylabel({'Node Strength per Edge'});
    tickLocations = [1,2,3]; % change to whatever you want
    tickLabels    = {'Group1','Group2', ' Group3'}; % change to whatever you want
    set(gca,'xTick',tickLocations,'xTickLabel',tickLabels,'FontSize',24,'fontweight', 'bold')
    hold on
    ylim([-2.8 +2.8])
    title('Put the name of ROI')

end