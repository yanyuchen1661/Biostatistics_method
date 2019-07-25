
options symbolgen mlogic mprint;

%macro golo (lib1,yyc1,lib2,yyc2,gametime,seed,rule,summary);


/*** 	
lib1: the libarary name for whole golo game 
yyc1: whole golo game 
lib2: the libarary name for average round total summary table 
yyc2: the average round total summary table;
gametime: the number of golo games
seed: the seed for generating game
rule: the rules for the golo game 
         (1 = simple strategy, select one lowest score each time,
          2 = select all dice,
          3 = select all dice with the lowest score,
          4 = select all dice with par or lower, or one die with the lowest value relative to par,
          5 = select all dice with birdies, or one die with lowest value relative to par);

summary : user choose to see average round total summary table and only “yes” means the user would like to see the summarized table) 

***/


data &lib1..&yyc1; 
 seed=&seed; 
 array dice(9) dice1-dice9; 		/*** make an array ***/
 do gametime=1 to &gametime;     	/*** make the game times ***/
 do half= 1 to 2;    		      /*** two half ***/
	   halftotal=0;    	 	/*** make half round total to 0 ***/
	   j=9;             		/*** make 9 dice at first ***/


/*** play rule 1 in project 4***/
%if &rule=1 %then 
%do;    
   	do while (j>0); 
      	do i= 1 to j;   
          		dice(i)=rantbl(&seed,1/12,3/12,2/12,2/12,3/12,1/12)-2;  
      	end; 
		min=min(of dice(*));  /*** select lowest score ***/
		halftotal+min;        /*** add lowest score for each roll***/
		dice(j)=.;            
		j=j-1;	     
      end; 
%end; 
     
/*** play rule 2***/

%else %if &rule=2 %then 
%do;   
	       do i= 1 to j;   
             dice(i)=rantbl(&seed,1/12,3/12,2/12,2/12,3/12,1/12)-2;  
             end; 
         halftotal=sum(of dice(*));  
/*** select all the dice as total in half round***/
%end;  


/*** play rule 3***/

     %else %if &rule=3 %then 
%do;   
	  			do while (j>0);
                 do i= 1 to j;   
                   dice(i)=rantbl(&seed,1/12,3/12,2/12,2/12,3/12,1/12)-2;                
                 end; 
				 min=min(of dice(*));
                 count=0; 
				 do s=1 to j;         

/*** select all the dice with lowest score and sum to half round total***/
if dice(s) eq min then do;
				         halftotal+min;
				         count+1;
				   end;                
				 end;
/*** count the number of dice with lowest score, and remove the same number of dice, then play the next roll***/
if (j-count) gt 0 then do;  *
		do p=j-count+1 to j;
			dice(p)=.;
		end;
	end;
	else do;
		do p=1 to j;
			dice(p)=.;
		end;
	end;
	j=j-count;
end;
%end;  


/* play rule 4*/

%else %if &rule=4 %then %do; 
do while (j>0);
            do i= 1 to j;   
               dice(i)=rantbl(&seed,1/12,3/12,2/12,2/12,3/12,1/12)-2;     
            end; 
		min=min(of dice(*));
count=0;
/* select all the dice with par or lower when the lowest score <=0, and sum to half round total */

if min le 0 then do;				     
            	do s=1 to j;          
	     		if dice(s) le 0 then do;
				halftotal+dice(s);
              		count+1;
				end;
end;
		end;

/* select the lowest score relative to 0, when the lowest score >0, and sum to half round total */
				
else do;                   
halftotal+min;
count=1;
	end;


/* count the number of dice with lowest score, and remove the same number of dice, then play the next roll. */

if (j-count) gt 0 then do;  				   
do p=j-count+1 to j;
			dice(k)=.;
end;
end;
				 
else do;
do p=1 to j;
			dice(p)=.;
		end;
end;
j=j-count;				
end;

%end;  




/*** play rule 5***/

%else %if &rule=5 %then %do;  
do while (j>0);
                 	do i= 1 to j;   
                  	dice(i)=rantbl(seed,1/12,3/12,2/12,2/12,3/12,1/12)-2;     
                 	end; 
			min=min(of dice(*));
			count=0;
/*** when the lowest score =-1, select all the dice with birdies and sum to half round total***/
if min eq -1 then do;     
                 do s=1 to j;
if dice(s) eq -1 then do;
				 halftotal+(-1);
                         count+1;
				end;
			end;
		end;				
			
/*** when the lowest score >0, select the lowest score relative to 0 and sum to half round total***/
else do;                     
                    halftotal+min;
			        count=1;
		end;
/*** count the number of dice with lowest score, and at the same time, remove the same number of dice, then play the next roll. ***/
if (j-count) gt 0 then do;   
			do p=j-count+1 to j;
				dice(p)=.;
			end;
		end;
		else do;
			do p=1 to j;
				dice(p)=.;
			end;
		end;
j=j-count;			
	end;			
%end;  

output;  
/* end two half do procedure */
end;   
/* end gametime do procedure */
end;   
run; 

/*** calculate the total score of each round ***/
data &lib2..&yyc2;                   
set &lib1..&yyc1;
label total="The round total score of the GOLO game";
by game;       
if first.game then total=halftotal;
else if last.game then total+halftotal;
if last.game then output;
run;

/*** output the summary table when &summary=”yes” ***/

%if &summary=yes %then %do;  

/*** get the average round total***/

proc means data=&lib2..&yyc2;    
var total;
title "The golo game is stored at library &lib1";
title2 "The dataset of golo game is named as &yyc1";
title3 "The summary table is stored at library &lib2";
title4 "The summary table is named as &yyc2";
title5 "Golo game is played for &gametime times";
title6 "The seed is &seed";
title7 "Using strategy of rule &rule";
run;
%end;

%mend golo;

%golo(work,golo,work,total,1000,12345657,1,yes);
%golo(work,golo,work,total,1000,12345657,2,yes);
%golo(work,golo,work,total,1000,12345657,3,yes);
%golo(work,golo,work,total,1000,12345657,4,yes);
%golo(work,golo,work,total,1000,12345657,5,yes);


/*** Comments on the change rule compared with project 4 ***/

/*** 

The number 2 rule have highest average round total score compared with 
number 1 rule in project 4. That is because we select all dice to calculate the total score.

The number 3 rule have higher average round total score compared with 
number 1 rule in project 4. This can be true if the lowest value is larger than 0.
  
The number 4 rule have the similar result of average round total score compared with number 1 rule in project 4. To select all dice with par or lower, or one die with lowest score relative to par, is similar to the rule in project 4 (select one die with lowest score). Therefore, the results are almost the same
   
The number 5 rule have smallest average round total score. When we have birdies, we select all the birdies and sum up to the total score, and therefore we may have lower total round score compared with number 1 rule in project 4. 

***/
