%% Example

clc
clear all
close all

    %%%%%%%%%%%%%%%%%%%% Part 1 %%%%%%%%%%%%%%%%%%%

cd Data
%% load data
load("FC_post.mat")
load("FC_pre.mat")
load('Outcome.mat')
load('Duration.mat')
load('Time.mat')
load('Group.mat')
params=dataset('XLSFile','rois.xlsx');

cd ..
%% calculate node strength 
[node_strength_post]=Node_strength(FC_post);
[node_strength_pre]=Node_strength(FC_pre);

%% LMM model
% Define fixed-effects design matrix   
    X=[ones(48,1),Out,Time,Duration];

% Define response
    response=node_strength_post;

% define random-effects design matrix
    random=node_strength_pre;

% create your grouping vector based on your data
    % G = [1:32 15 16 19 20 23 25 28 30 31 32 20 23 30 31 32 23]';    %% Grouping
    [mixed,p,t,estimate]=LMM_analysis(response,random,X,G);
  
    sig_ROI=find(p(2,:)<0.05/113);  %% regions which are significant for outcome varianle
    ROI_name=params.ROIname;
    for i=1:length(sig_ROI)
        display(ROI_name{sig_ROI(i)})  %% show the name significant regions
    end
%%
    %%%%%%%%%%%%%%%%%%%% Part 2 %%%%%%%%%%%%%%%%%%%

   covariates=[Time Duration];
   [FC_Post] = FC_correction(node_strength_post,covariates); % covariates: postsurgical follow up and duration of disease
   covariates=[Duration];
   [FC_Pre] = FC_correction(node_strength_pre,covariates); % covariates: duration of disease

   FC_Pre_edge=FC_Pre'/size(FC_Pre,2); % determine the average FC per connection
   FC_Post_edge=FC_Post'/size(FC_Pre,2); % determine the average FC per connection

  %%
%%%%%%%%%%%%%%%%%%%%%%%%%%%% Part 3 %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

    c1=[0.3010 0.7450 0.9330];  %% change it to the desired color
    c2=[1 0 0]; %% change it to the desired color
    c3=[0 1 0]; %% change it to the desired color
    i=3;  %% Put the number of your desired region
    Group1=FC_Post_edge(find(Out==1),:);
    Group2=FC_Post_edge(find(Out==2),:);
    Group3=FC_Pre_edge(1:32,:);

    h1=Figure_plot(Group1,Group2,Group3,i,c1,c2,c3)


