# lud  
Conditional Linear Regression 

To see the algorithm, run Main, which calls:  
getData_raw: generate N*(x,y,z) raw data matrix  
preprocessing: turn raw data matrix to (d+1)*(d+1)*m loss matrix  
listreg: find a list of candidate regression fits  
setcover: find the final k-DNF corresponding to the regression fits  

The listreg algorithm calls:  
Quadratic: the SDP find w_i for each term and an ellipse. 
    The autoshift version can take the center of ellipse as a variable.  
Undatedweight: the SDP updates c by evaluating the term's averaged w among a neighbor, 
    a subroutine used in Algo 1  
Padded: Padded decomposition, partitions the terms into cluster. 
    With high probability all the good terms should fall in one cluster.  

getData_algo1: generating data and test algo 1 and listreg   
getData_pad: testing Padded decomposition and setcover  

The main_line is for experiment1 (line with uniform).  
The main_new_sin is for experiment1 (sin function).


