tic;
clear;close all;clc;
fid=fopen('Results.txt','r');
fid2=fopen('Similar.txt','w');
fid3=fopen('DNACode.txt','w');
fid4=fopen('DNACodeGCContent.txt','w');
fid5=fopen('DNACodeGCConflict.txt','w');
Str="";
while(~feof(fid))
    str_temp =fgetl(fid);
    str_temp2 = erase(str_temp,'(');
    str_temp3 = erase(str_temp2,')');
    tline = replace(strtrim(str_temp3),'   ',' ');
    tline = replace(strtrim(tline),'  ',' ');
    tline = replace(strtrim(tline),' ',',');
    Term = split(tline,',');
    Str="";
    for i=1:length(Term)
        if(Term{i,1}=='0')
            Str=append(Str,'A');
        elseif(Term{i,1}=='1')
            Str=append(Str,'T');
        elseif(Term{i,1}=='w')
            Str=append(Str,'C');
        elseif(Term{i,1}=='w^2')
            Str=append(Str,'G');
        end
    end 
    StrTemp=char(Str);
    StrFirsthalf=StrTemp(1:length(StrTemp)/2);
    StrSecondhalf=StrTemp((length(StrTemp)/2)+1:end);
    tf = strcmp(StrFirsthalf,StrSecondhalf);
            Counter=0;
            for j=1:(length(StrTemp))
                tf1 = strcmp('G',StrTemp(j));
                tf2 = strcmp('C',StrTemp(j));
                 if(tf1 || tf2 ==1)
                     Counter=Counter+1;
                 end
            end
            if (Counter==(length(StrTemp)/2))
                fprintf(fid4,'%s\n',Str);
            end        
    if(tf==1)     
        fprintf(fid2,'%s\n',Str);
    else
        ct=0;
        for j=1:(length(StrTemp)-5)
            PFV=StrTemp(j:j+2);
            RIV=RevComp(PFV);
            for k=j+3:(length(StrTemp)-2)
                PLV=StrTemp(k:k+2);
                tf2 = strcmp(RIV,PLV);
            end    
            if(tf2==1)
                ct=1;
            end
            fprintf('%s--->%s->%s->%s\n',StrTemp,PFV,RIV,PLV);
        end
        if(ct==0)
             fprintf(fid3,'%s\n',Str);
            Counter=0;
            for j=1:(length(StrTemp))
                tf1 = strcmp('G',StrTemp(j));
                tf2 = strcmp('C',StrTemp(j));
                 if(tf1 || tf2 ==1)
                     Counter=Counter+1;
                 end
            end
            if (Counter==(length(StrTemp)/2))
                fprintf(fid5,'%s\n',Str);
            end             
        else
            fprintf(fid2,'%s\n',Str);
        end    
    end    
end
fclose(fid);
fclose(fid2);
fclose(fid3);
fclose(fid4);
toc;