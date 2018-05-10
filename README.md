# lud  
Conditional Linear Regression 

Quadratic: Algo 1  
Undatedweight: Algo 2, a subroutine used in Algo 1  
Padded: Padded decomposition, used in listreg  

getData_algo1: generating data and test algo 1 and listreg   
getData_pad: testing Padded decomposition   

getData_raw: generate N*(x,y,z) raw data matrix  
preprocessing: turn raw data matrix to (d+1)*(d+1)*m loss matrix  
listreg: find a list of candidate regression fits  
setcover: find the final k-DNF corresponding to the regression fits

To see the algorithm, run Main  