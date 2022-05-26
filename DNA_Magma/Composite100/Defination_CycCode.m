// *************************************************************************************************
// ****************************************** Copyright(c) 2022 ************************************
// *************************************************************************************************
//  Project Code  : PRJ_DNA_Codes
//  Project Title : DNA Code
//  Publisher     : Prof.Dr. Steven Dougherty, Assoc.Prof.Dr. Serap Şahinkaya, Assoc.Prof.Dr. Deniz Ustun and Dr. Adrian Korban
//  Developer     : Prof.Dr. Steven Dougherty, Assoc.Prof.Dr. Serap Şahinkaya, Assoc.Prof.Dr. Deniz Ustun and Dr. Adrian Korban
//  Contact Info  : Prof.Dr. Steven Dougherty, Prof.Steven.Dougherty@gmail.com
//		    Assoc.Prof.Dr. Serap Şahinkaya, serap@tarsus.edu.tr
//                  Assoc.Prof.Dr. Deniz Ustun, denizustun@tarsus.edu.tr
//                             Dr. Adrian Korban, adrian3@windowslive.com 
// *************************************************************************************************
function cycgen(Rk,gg)
  n:=50;
  M:=RMatrixSpace(Rk,n,n)!0;
     for k:=1 to n do
       M[k]:=gg;
       temp:=gg;
       for t:=1 to (n-1) do
         temp[t+1]:=gg[t];
       end for;
       temp[1]:=gg[n];
       gg:=temp;
     end for; 
     return M;
  end function;


function revcycgen(Rk,gg)
  n:=50;
  M:=RMatrixSpace(Rk,n,n)!0;
     for k:=1 to n do
       M[k]:=gg;
       temp:=gg;
       for t:=2 to n do
         temp[t-1]:=gg[t];
       end for;
       temp[n]:=gg[1];
       gg:=temp;
     end for; 
     return M;
  end function;
