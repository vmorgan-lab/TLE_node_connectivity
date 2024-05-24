# TLE_node_connectivity
Comparison of post-surgical node strength in seizure free and non-seizure-free TLE patients and plot figures (Akbarian et al,  Neurology 2024)

Based on the manuscripts:
Behnaz Akbarian, Lucas E. Sainburg, Andrew P. Janson, Graham W. Johnson, Derek J. Doss, Baxter P. Rogers, Dario J. Englot, and Victoria L. Morgan. “Functional connectivity after surgery related to seizure freedom in patients with temporal lobe epilepsy”. Neurology 2024.

Summary:
These scripts will allow you to compute the node strength, then find the relationship between FC node strength and seizure outcomes by using linear mixed model and finally plot figures

To run this set of scripts you will need the following inputs:    

	•	Functional connectivity matrices of your cohort as a matrix (n*n*m): n: number of regions and m: number of subjects
	•	Surgical outcome values of your cohort as a vector (m*1)
	•	Duration of disease prior to surgery values of your cohort as a vector (m*1)
	•	Post-surgical follow-up of your cohort as a vector (m*1)
	•	Grouping variable of your cohort as a vector (m*1): assign same number for data related to the same patient

Note:  add more variables (as a vector) or remove each of the variables (duration of disease and post surgical follow-up variables) based on your study.

 We provide:   
 
 	•	Post-surgical and pre-surgical Functional connectivity matrices of our cohort (FC_post.mat, FC_pre.mat)
	•	Surgical outcome values of our cohort (Outcome.mat)
	•	Duration of disease prior to surgery values of our cohort (Duration.mat)
	•	Post-surgical follow-up of our cohort (Time.mat)
	•	Grouping variable of our cohort (Group.mat)
	•	Regions of interest resulted from MultiAtlas + free surfer (rois.xlsx)

Note:  All provided material to redo our results are in Data folder. 

# Scripts:

	•	[node_strength]=Node_strength(FC) will calculate the node strength for each subject for each node.
                Inputs: functional connectivity matrix (n*n*m) 	
		Outputs: node strength matrix (n*m), n: number of regions and m: number of subjects

	•	[mixed,p,t,estimatet]=MM_analysis(response,random,X,G) will do linear mixed model. 
		Inputs: 
			response: node strength, factor loadings, change in node strength from pre to post or other desired feature (based on your study) as a n*m 			matrix
			random: random effects design matrix
			X: fixed effect design matrix, create a matrix including the covariates and your variable to interest
			G: grouping variables for subjects with multiple acquisitions (assign same number to them).
		Outputs:
		       mixed: linear mixed model 
                       p: p-value of the test, returned as a scalar value in the range [0,1]
        	       t: value of the test statistic
        	       estimate: model coefficient

	•	[fc_corrected]=FC_correction(FC,covariates) will correct your FC feature matrix for covariates by using linear regression model
		Inputs: 
		       FC: FC feature matrix (m*n): m: number of subjects and n: number of regions 
		       covariates: a matrix include your covariates (m*k): m: number of subjects and k: number of covariates 
		Outputs:
		       fc_corrected: FC feature matrix corrected for covariates 

	•	Figure_plot.m: will plots node strength per edge figures for regions of interest (Figure 1). This script will calculate the node strength by using 			Node_strength.m function, then will correct the post-surgical node strength for post-surgical follow-up and duration of disease prior to 
                        surgery and pre-surgical node strength for duration of disease prior to surgery by using FC_correction.m function and will plot figure for 			corrected node strength values. 

	•	Example.m: An example of how to organize your data and run codes. 

