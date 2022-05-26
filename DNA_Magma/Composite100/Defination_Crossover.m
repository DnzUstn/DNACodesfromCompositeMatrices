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
// ****** Single Point Crossover *********
function SinglePointCrossover(X1,X2,nVar)
	X12:=X1;;X21:=X2;
	c:=Random(1,(nVar-1));
	for i:=1 to nVar do
		if (i le c) then
			X12[i]:=X1[i];
			X21[i]:=X2[i];
		else
			X12[i]:=X2[i];
			X21[i]:=X1[i];
		end if;
	end for;
return <X12,X21>;
return X1;
end function;
// ****** Double Point Crossover **********
function DoublePointCrossover(X1,X2,nVar)
	X12:=X1;;X21:=X2;
	cc1:=Random(1,(nVar-1));
	cc2:=Random(1,(nVar-1));
	while (cc1 eq cc2) do
		cc2:=Random(1,nVar);
	end while;
	if (cc1 lt cc2) then
		c1:=cc1;
		c2:=cc2;
	else
		c1:=cc2;
		c2:=cc1;
	end if;	
	for i:=1 to nVar do
		if (i le c1) then
			X12[i]:=X1[i];
			X21[i]:=X2[i];
		elif (i gt c1) and (i le c2) then
			X12[i]:=X2[i];
			X21[i]:=X1[i]; 	
		else
			X12[i]:=X1[i];
			X21[i]:=X2[i];
		end if;
	end for;
return <X12,X21>;	
end function; 
// ************ Uniform Crossover ***************
function UniformCrossover(X1,X2,nVar)
	alpha:=RandomMatrix(GF(2),1,nVar);
	X12:=X1;;X21:=X2;
	for i:=1 to nVar do
		X12[i]:=alpha[1,i]*X1[i]+(1-alpha[1,i])*X2[i];
		X21[i]:=alpha[1,i]*X2[i]+(1-alpha[1,i])*X1[i];    
	end for;
return <X12,X21>;	
end function;	
// ************ Crossover ***************
function Crossover(X1,X2,nVar)
    pSinglePoint:=0.1;
    pDoublePoint:=0.2;
    pUniform:=1-pSinglePoint-pDoublePoint;
    METHOD:=RouletteWheelSelection([pSinglePoint,pDoublePoint,pUniform]);
	case METHOD:
		when 1:
			Vts:=SinglePointCrossover(X1,X2,nVar);
		when 2:
			Vts:=DoublePointCrossover(X1,X2,nVar);
		when 3:
			Vts:=UniformCrossover(X1,X2,nVar);
	end case;     
return Vts;
end function;
