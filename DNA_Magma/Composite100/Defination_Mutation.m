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
function Mutate(X,mu,nVar)
	c:=[];
	nmu:=Round(mu*nVar);
	syc:=1;
	c[syc]:=Random(1,(nVar));
	while true do
		cc:=Random(1,(nVar));
		control:=false;
		for i:=1 to #c do
			if (cc eq c[i]) then
				control:=true; 
				break;
			end if;
		end for;
		if control eq false then
		    syc:=syc+1;
		    c[syc]:=cc;
		end if;		    
	if (syc eq (nmu+1)) then
		break;
	end if;
	end while;
	y:=X;
	for i:=1 to #c do
		for j:=1 to nVar do
			if (j eq c[i]) then
				y[j]:=1-X[j];
			end if;
		end for;
	end for;				
return y;
end function;	
