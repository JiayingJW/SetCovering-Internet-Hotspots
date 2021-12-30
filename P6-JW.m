%Internet hotspot locations
load('problem6.mat')
[m,n]=size(Adjacency);
% Part a)
%find min number of locations as wifi hotspots
% so that the entire campus is covered with internet
%this script solves the problem with 150 locations
A=-Adjacency;
b =[-ones(m,1)];
beq = [];
Aeq=[];
lb = zeros(m,1);% these three lines
ub = ones(m,1);%of code make our
int = [1:m]';%decision variables binary
c=[ones(m,1)];
[x_a,z_a]=intlinprog(c,int,A,b,Aeq,beq,lb,ub);
x_a=round(x_a);
z_a=round(z_a);
locations_a=find(x_a==1);
N = numel(locations_a);
N
locations_a'
% To cover the entire campus with Internet, there are at least 25 
% hotspots need to be built. The labels of these 25 hotsopts are 2,6,17,
% 21,22,26,37,38,41,44,49,53,62,66,71,80,83,87,89,91,106,109,127,
%135, and 138.


% Part b)
%Internet hotspot locations
%find max Internet coverage using 15 hotspots as wifi hotspots
m=150;
A=[-Adjacency,eye(m)];%eye: identity matrix
b=zeros(m,1);
beq=[15];
Aeq=[ones(1,m),zeros(1,m)];
lb = zeros(2*m,1);
ub = ones(2*m,1);
int = [1:2*m]';
c=[zeros(m,1);ones(m,1)];
[u_b,z_b]=intlinprog(-c,int,A,b,Aeq,beq,lb,ub);
u_b=round(u_b) %remove unesessary decimals, if any
z_b=-round(z_b) %this is a maximization problem
%identify the influencers
names_b=find(u_b(1:m)==1);
names_b'
% With limited budget for that only 15 hotspots can be built in campus,
% the maximum coverage of Internet can reach 128 out of 150 hotspots.
% These selected 15 hotspots are labled with numbers of 2,32,44,53,62,80,
%87,89,106,109,113,128,135,138,145.
