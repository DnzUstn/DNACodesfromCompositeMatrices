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
function RouletteWheelSelection(Cost)
    s:=0;
    p:=[];
    cp:=[];
    for i:=1 to #Cost do
        s:=s+Cost[i];
    end for;
    k:=0;
    for i:=1 to #Cost do
       p[i]:=Cost[i]/s;		// probality of the ith value
       k:=k+p[i];			// to calculate the cummulative probability
       cp[i]:=k;			// cumulative probability stored. 
    end for;  				// Cummulative probality of the last value should be 1
    i:=0.0;
    syc:=1;
    Rnd:=[];
    ind:=[];
    while i le 1.0 do
    	Rnd[syc]:=i;
    	syc:=syc+1;
    	i:=i+0.01;
    end while;
    r:=Random(Rnd);
    for t:=1 to #cp do
    	if (r le cp[t]) then
    		ind:=t;
    		break;
    	end if;
    end for; 
return ind;
end function;
