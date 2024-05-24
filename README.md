# TLE_node_connectivity
Comparison of post-surgical node strength in seizure free and non-seizure-free TLE patients and plot figures (Akbarian et al,  Neurology 2024)

Behnaz Akbarian, Lucas E. Sainburg, Andrew P. Janson, Graham W. Johnson, Derek J. Doss, Baxter P. Rogers, Dario J. Englot, and Victoria L. Morgan. Functional connectivity after surgery related to seizure freedom in patients with temporal lobe epilepsy. Neurology 2024.


Summary:
These scripts will allow you to compute…



To run this set of scripts you will need the following inputs:
•	Functional connectivity matrices of your cohort as a cell (n*n*m): n: number of regions and m: number of subjects
•	Other variables???



1.	You need functional connectivity matrices of your cohort as a cell (n*n*m): n: number of regions and m: number of subjects
We provide 3 node examples from our manuscript: F_CCO.mat, F_ICO.mat, F_IPIns.mat
2.	The Node_strength(FC) will calculate the node strength for each subject in each node, the output is a matrix with each row is related to the node strength for each subject
LMM_analysis(response,random,X,G) will do linear mixed model, as response you can put the node strength, factor loadings or change in node strength from pre to post, G is grouping variables for subjects with multiple acquisitions (assign same number to them)
[lambda,F,nBasis]=factor_analysis(FC_node), input your data as a matrix which is functional connectivity of one node of interest to other nodes for m subjects (m*n)
[fc_corr] = FC_correction(FC,T,D), input your functional connectivity and covariates that you want to correct your data
F_CCO.mat, F_ICO.mat, and F_IPIns.mat are the results of factor analysis in our paper. Assign them as input to the Plot_FC_patterns to plot figures 3, 4 and 5. 
	


Descriptions of scripts:      (order these as above)                                  ………………………………………………….
[node_strenth]=Node_strength(FC)

This function will calculate the FC node strength and seizure outcomes. 
Inputs
    % FC: functional_connectivity matrix (cell)
Output
    % Node Strength matrix 

………………………………………………….
[fc_corr] = FC_correction(FC,T,D)

This function will correct FC for covariate 1 (postsurgical follow-up time) and covariate 2 (duration of disease prior to surgery) by using linear regression

Inputs:
	% FC = matrix of functional connectivity values.
	%T = postsurgical follow-up time
	%D = duration of disease prior to surgery
Output:
 	% fc_corr: FC corrected for postsurgical follow-up time and duration of disease prior to surgery
………………………………………………….

[lambda,F,nBasis]=factor_analysis(FC_node)

This function will calculate FC Patterns from 1 node of interest to all other connected nodes
    
Input:
	% FC: functional connectivity of node of interest (m*n)
	% m: number of subjects
	% n: number of regions connected to the node of interest
     
Output:
	% Lambda:  factor loadings matrix (lambda)
	% F: factor scores 
	% nBasis: number of factors (nBasis)

………………………………………………….

[LME]=LMM_analysis(response,random,X,G)

This function will do linear mixed model for node strength, and pattern loading

 Inputs
    % response: postsurgical feature matrix (node strength or factor loading), response
    % random: presurgical feature matrix, random-effects design matrix
    % X: fixed-effects design matrix X [ones, seizure outcome,duration of disease prior to surgery, postsurgical follow-up time]
    % G: grouping

Output:
    % linear mixed model 

………………………………………………….

HornParallelAnalysis(data, K)
Function HornParallelAnalysis.m simulates a distribution of eigenvalues by resampling a set of random variables of the real data size, and compares the eigenvalues of the real data and the distribution of eigenvalues from simulation; then the number of retained basis factors is decided by keeping those who are bigger than 95% of simulated distribution of eigenvalues. This is to implement the parallel analysis approach proposed by Horn (1965) and developed by Ledesma et al. (2007).

………………………………………………
Plot_FC_patterns:
This code will plot figures 3, 4 and 5.

For plotting you need to load the lambda (output of factor_analysis) and define which patterns you want to plot (each column is related to one pattern).

Here F_CCO, F_ICO and F_IPIns are results of factor analysis for our nodes of interest. 

                                           ………………………………………………
