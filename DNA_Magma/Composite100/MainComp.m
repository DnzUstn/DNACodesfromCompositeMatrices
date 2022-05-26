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
// ****************************** Import Function m-Files ******************************************
   load "~/Desktop/DNA4_Magma/Composite100/Defination_CycCode.m";
   load "~/Desktop/DNA4_Magma/Composite100/Defination_SigmaGenerator.m";
   load "~/Desktop/DNA4_Magma/Composite100/RouletteWheelSelection.m";
   load "~/Desktop/DNA4_Magma/Composite100/Defination_Crossover.m";
   load "~/Desktop/DNA4_Magma/Composite100/Defination_Mutation.m";
   FD:="~/Desktop/DNA4_Magma/Composite100/ResultsComposite200_DNA.txt";	// Result File Path
// ********************************** Cost Function ************************************************
   function CostFunction(DM)
	Cost:=1.0/DM;
	return Cost;
   end function;
// ************************ Evoluationary Algorithm Main Program ***********************************
   Codelist:={};						// Define CodeList Array
   DDM:=2;
   Rk<w>:=GF(4);						// Definition Rk
   I:=IdentityMatrix(Rk,36);      				// Identity Matrix over Rk
   CM:=[];							// Definition Null CM Matrix
   CM1:=[];							// Definition Null CM1 Matrix
   CM2:=[];							// Definition Null CM2 Matrix
   M:=[];							// Definition Null M Matrix
   Mc:=[];							// Definition Null M Matrix
   Mm:=[];							// Definition Null Mm Matrix
   Pop:=[];							// Definition Null Pop Matrix
   Popc:=[];							// Definition Null Popc Matrix
   Popm:=[];							// Definition Null Popm Matrix
   GM:=[];							// Definition Null GM Matrix
   GMc:=[];							// Definition Null GMc Matrix
   GMm:=[];							// Definition Null GMm Matrix
   C:=[];							// Definition Null C Matrix
   Cc:=[];							// Definition Null Cc Matrix
   Cm:=[];							// Definition Null Cm Matrix
   DM:=[];							// Definition Null DM Matrix
   DMc:=[];							// Definition Null DMc Matrix
   DMm:=[];							// Definition Null DMm Matrix
   CodeF2:=[];							// Definition Null CodeF2 Matrix
   CWDTemp:=[];						        // Definition Null CWDTemp Array   
   SigmaGM2:=[];						// Definition Null SigmaGM2 Matrix
   Counter2:=1;						        // Definition Counter2 Value
   CodeTemp:=[];						// Definition Null CodeTemp Matrix
   WorstCostp:=[];						// Definition Null WorstCostp Matrix 
//************* Initialization ***************
   printf "Program is running...\n";
   Costp:=[];
   Costpc:=[];
   Costpm:=[];   
// ********************************* Optimization Parameters ***************************************
   nVar:=200;							// Number of Decision Variables
   nPop:=45;							// Population Size
   MaxIter:=100;						// Maximum iteration number 
   pc:=0.7;							// Crossover Percentage
   nc:=2*Round(pc*nPop/2);					// Number of Offsprings (Parnets)
   pm:=0.3;							// Mutation Percentage
   nm:=1*Round(pm*nPop);					// Number of Mutants
   mu:=0.5;							// Definition Mutation Rate
// *************************************************************************************************
// *********************************** Initialization **********************************************
// *************************************************************************************************
   printf " ------------*************************************************-------------\n";
   printf " ************************** Program is running ****************************\n";
   printf " ------------*************************************************-------------\n";
   Costp:=[];							// Population
   Costpc:=[];							// Crossover Population
   Costpm:=[];							// Mutation Population
// ********************* Initial Population of the Evoluationary Algorithm *************************   
   Counter:=1;
   while true do
	xx:=RandomMatrix(Rk,1,nVar);
	CM:=GeneratorSigma(Rk,xx[1]);
	    Pop[Counter]:=xx[1];
	    M[Counter]:=CM;        
	    C[Counter]:=LinearCode(M[Counter]);
	    DM[Counter]:=MinimumWeight(C[Counter]);	
	    Costp[Counter]:=(CostFunction(DM[Counter])+0.0);
	    printf "%o.Element -> %o.Code -> Mininum Weight => %o\n", Counter, Counter, DM[Counter];
	    Counter:=Counter+1;
//        end if;
        if Counter eq (nPop+1) then
        	break;
        end if;	
   end while;   
// ************************************** Sort Population ******************************************
   for i:=1 to (#Costp-1) do 
	Imin:=i;
	for j:=i+1 to #Costp do
		if (Costp[j] lt Costp[Imin]) then
			Imin:=j;
		end if;
	end for;
		CostpTemp:=Costp[Imin];
		PopTemp:=Pop[Imin];
		Costp[Imin]:=Costp[i];
		Pop[Imin]:=Pop[i];
		Costp[i]:=CostpTemp;
		Pop[i]:=PopTemp;
   end for;
// Store Best Solution
   BestSol:=Pop[1];
// Store Worst Costp
   WorstCostp:=Costp[nPop];   
// *************************************************************************************************   
   printf " ------------*************************************************-------------\n";
   printf " ******************** Optimization Process Has Begun  *********************\n";
   printf " ------------*************************************************-------------\n";
// ******************************* Main Evaluationaty Algorithm Loop *******************************     		
   for Iter:=1 to MaxIter do
// ************************************** Apply Crossover ******************************************
   Counter:=1;
   while true do
	// Select Parents Indices
      	   i1:=RouletteWheelSelection(Costp);
      	   i2:=RouletteWheelSelection(Costp);
	// Select Parents
      	   pop1:=Pop[i1];
      	   pop2:=Pop[i2];
      	// Crossover
      	   Y:=Crossover(pop1,pop2,nVar);      	
	   CM1:=GeneratorSigma(Rk,Y[1]);	 
	   CM2:=GeneratorSigma(Rk,Y[2]);	 
    		Popc[Counter]:=Y[1];
      		Popc[Counter+1]:=Y[2];
   		// For First Point 	
      		Mc[Counter]:=CM1;        
   		Cc[Counter]:=LinearCode(Mc[Counter]);
   		DMc[Counter]:=MinimumWeight(Cc[Counter]);           
   		Costpc[Counter]:=(CostFunction(DMc[Counter])+0.0);	   
   		// For Second Point 	
      		Mc[Counter+1]:=CM2;        
   		Cc[Counter+1]:=LinearCode(Mc[Counter+1]);
   		DMc[Counter+1]:=MinimumWeight(Cc[Counter+1]);           
   		Costpc[Counter+1]:=(CostFunction(DMc[Counter+1])+0.0);	   
   		Counter:=Counter+2;	
      	   if Counter eq (nc+1) then
      		break;
      	   end if;	
   end while;	
// ************************************** Apply Mutation *******************************************
   Counter:=1;
   while true do
      	// Select Parent
      	   i:=Random(1,nPop);
      	   p:=Pop[i];	
      	// Apply Mutation
      	   Z:=Mutate(p,mu,nVar);	
	   CM:=GeneratorSigma(Rk,Z);
      		Popm[Counter]:=Z;			 	
      		Mm[Counter]:=CM;        
   		Cm[Counter]:=LinearCode(Mm[Counter]);
   		DMm[Counter]:=MinimumWeight(Cm[Counter]);
   		Costpm[Counter]:=(CostFunction(DMm[Counter])+0.0);	        
   		Counter:=Counter+1;
      	   if Counter eq (nm+1) then
      		break;
      	   end if;	
   end while;   
// ********************* Join Pop, Popc and Popm population matrices *******************************
   PopTemp:=[];
   CostTemp:=[];
   Counter:=1;
	for i:=1 to nPop do
		PopTemp[Counter]:=Pop[i];
		CostTemp[Counter]:=Costp[i];
		Counter:=Counter+1;
	end for;
	for i:=1 to nc do
		PopTemp[Counter]:=Popc[i];
		CostTemp[Counter]:=Costpc[i];
		Counter:=Counter+1;
	end for;					   	
	for i:=1 to nm do
		PopTemp[Counter]:=Popm[i];
		CostTemp[Counter]:=Costpm[i];
		Counter:=Counter+1;
	end for;      
// *********************************** Sort Population *********************************************
   for i:=1 to (#CostTemp-1) do 
	Imin:=i;
	for j:=i+1 to #CostTemp do
		if (CostTemp[j] lt CostTemp[Imin]) then
			Imin:=j;
		end if;
	end for;
	CostpTemp:=CostTemp[Imin];
	PoppTemp:=PopTemp[Imin];
	CostTemp[Imin]:=CostTemp[i];
	Pop[Imin]:=PopTemp[i];
	CostTemp[i]:=CostpTemp;
	PopTemp[i]:=PoppTemp;
		
end for;   
// ********************** Save the found code to CodeF4 area and File *****************************
   for i:=1 to #CostTemp do		
	CM:=GeneratorSigma(Rk,PopTemp[i]);		
		C:=LinearCode(CM);
		DM:=MinimumWeight(C);
		if (DM ge DDM) then
			CWD:=WeightDistribution(C);
			CWE<a,b,b,a>:=CompleteWeightEnumerator(C);			
                      if ([Length(C),Dimension(C),DM] notin Codelist) then
				printf "%o. CodeF2 is generated and save file \n", Counter2;
				CodeF2[Counter2]:=C;
				T:=0;
				for i:=1 to #CWD do
					T:=T+CWD[i,2];
				end for;				
				AMG:=AutomorphismGroup(C);
				Write(FD,"*******************************************************");
				Write(FD,Counter2);
				Write(FD,"*******************Minimum Weight**********************");
				Write(FD,DM);
				Write(FD,"*********************Dimension*************************");
				Write(FD,Dimension(C));
				Write(FD,"**********************Length***************************");
				Write(FD,Length(C));
				CodeParameters:=[Length(C),Dimension(C),DM];
				Write(FD,CodeParameters);										
				Write(FD,"***************Generator Matrix************************");
				Write(FD,CM);
				Write(FD,"-------------- Automorphism Group ---------------------");
				Write(FD,AMG);				
				Write(FD,"--------------- Weight Distribution -------------------");
				Write(FD,CWD);
				Write(FD,"--------------  GC Weight Enumerator ------------------");
				Write(FD,CWE);				
				Write(FD,"------------------ Number Of Words --------------------");
				Write(FD,T);
				Codelist:=Codelist join {[Length(C),Dimension(C),DM]};				
				Counter2:=Counter2+1;
				break;
			end if;					
		end if;
   end for;		   
// Update Worst Cost
WorstCostp:=CostTemp[#CostTemp];
// Truncation
	for i:=1 to nPop do
		Pop[i]:=PopTemp[i];
		Costp[i]:=CostTemp[i];
	end for;			
// Store Best Solution
BestSol:=Pop[1];
// Store Best Cost Ever Found
BestCost:=Costp[1];
printf "%o. Iteration is done.\n", Iter;
end for;
Write(FD,"-------------------------------------------------------");
Write(FD," The end of Codes");