
           set i index for bus of DN /1*31/  ;
         Alias(i,j) ;
         set  k index for harmonics/1*11/
sets
         slack(i) index for couped bus -upstream /1/
        nl index for nonlinear load  /sp1,sp2,sp2-prim,sp3 ,pwm-asd1 ,pwm-asd2,vfd /
*h index for harmonic orders/1/
h index for harmonic orders/1,5,7,11,13,17,19,23,25,29,31/
          LLoad(i)/2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31/

nl_bus(i,nl)   nonlinear load and corresponding bus /12.sp1,8.sp2,30.sp2-prim ,21.sp3,8.pwm-asd1,6.pwm-asd2,25.vfd/

line(i,j)  Dist_line/1.2,2.3,2.29,3.4,4.23,4.5,5.6,6.7,7.22,7.8,7.19,8.9,9.16,9.10,16.17,10.11,11.12,12.13,13.14,14.15,17.18,23.24,24.25,25.26,26.27,27.28
                             ,29.30,30.31,19.20,20.21/
         s index for season of year /B-P,T,Z/
         ti index for time of day /1/
**24/
r         /1-3,1-4,2-3,2-4/
sc/sc1*sc16/
sc_wind(sc)/sc1*sc4/


parameters


pg(i) generation of active power from power flow pu /1 0,2 0,3 0,4 0,5 0,6 0,7 0,8 0,9 0,10 0,11 0,12 0,13 0,14 0,15 0,16 0,17 0,18 0,19 0,20 0,21 0,22 0,23 0,24 0,
                                                 25 0,26 0,27 0,28 0,29 0,30 0,31 0/

qg(i) generation of reactive power from power flow pu /1 0,2 0.015,3 0,4 0,5 0,6 0,7 0,8 0,9 0,10 0,11 0,12 0,13 0,14 0.006,15 0,16 0.006,17 0,18 0,19 0,20 0.003,
                                                       21 0,22 0,23 0,24 0.009,25 0,26 0.009,27 0,28 0,29 0,30 0,31 0/

pdo(i) active power for nomrmal load pu /1 0,2 0.00522,3 0,4 0,5 0.00936,6 0,7 0,8 0,9 0,10 0.00189,11 0,12 0.00336,13 0.00657,14 0.00783,15 0.00729,16 0.00477,
                                      17 0.00549,18 0.00477,19 0.00432,20 0.00672,21 0.00495,22 0.00207,23 0.00522,24 0.01917,25 0,26 0.01116,27 0.00549,28 0.00792
                                      ,29 0.00882,30 0,31 0.00884/

qdo(i) active power for nomrmal load pu /1 0,2 0.00174,3 0,4 0,5 0.00312,6 0,7 0,8 0,9 0,10 0.00063,11 0,12 0.00112,13 0.00219
                                       ,14 0.00261,15 0.0143,16 0.00159,17 0.00183
                                      ,18 0.00159,19 0.00144,20 0.00224,21 0.00165,22 0.00069,23 0.00174,24 0.00639,25 0,26 0.00372,27 0.00183,28 0.00264,29 0.00294
                                      ,30 0,31 0.00294/

pnl(nl) active power for nomrmal load   /sp1 0.00447,sp2 0.00536,sp2-prim 0.00527,sp3 0.00315,pwm-asd1 0.00247,pwm-asd2 0.00575,vfd 0.00454/
qnl(nl) active power for nomrmal load /sp1 0.00276,sp2 0.00331,sp2-prim 0.00242,sp3 0.00156,pwm-asd1 0.00158,pwm-asd2 0.00326,vfd 0.00229/

cp  cost of active power duringg 24 hours $.pu(mva)  /125/
cq  cost of active power duringg 24 hours $.pu(mva)  /18.75/

D(r) /1-3 210,1-4 185,2-3 150,2-4 130/


         scalar bzde /0.9/
         scalar beta coefient for time travel to cost ($.h)/8.22/
         scalar cu cunsumption of PEV (KWHdivKM) /0.15/
         scalar yhat maximum number of charge point /4/
         scalar deltat between 2 time /1/
         scalar rng driving range km /100/
         scalar THDmax /0.05/
         scalar IHDmax /0.03/
         SCALAR ILMAX/1.05/
         scalar Sbase MVA /100/
         scalar vbase KV/23/

         scalar vrmsmin lowerest voltage /0.95/
         scalar vrmsmax   highest volrage /1.05/

M/100000/ ;
set ii /1*26/;
alias(ii,jj);

parameters
ratio
x_h
bb_h
b_h
g_h
y_h;
Table GenD(i,*) 'generating units characteristics'
        Pg      Qg      Pmax    Pmin    Qmax      Qmin
1       0        0      1       0       1         -1;                                                                                                                                                                                                                                 ;
                                                                                                                                                                                                                                       ;
table chr(nl,k) harmonic current factor
               1       2        3       4        5       6        7       8       9       10      11

sp1            1      0.2      0.143   0.091    0.077   0.059    0.053   0.043   0.04    0.034   0.032
sp2            1      0.19     0.13    0.072    0.056   0.033    0.024   0.012   0.008   0.002    0.002
sp2-prim       1      0.19     0.13    0.072    0.056   0.033    0.024   0.012   0.008   0.002    0.002
sp3            1      0.42     0.143   0.079    0.032   0.037    0.023   0.023   0.014     0       0
pwm-asd1       1      0.02     0.012   0.055    0.037   0.002      0     0.002   0.004     0       0

pwm-asd2       1     -0.58     0.27    0.217   -0.31    0.14    -0.087  -0.013  -0.003     0       0
vfd            1     -0.084   -0.019  -0.042   -0.041  -0.00125 -0.0004  0.0025  0.0019   0.004  0.005
;

table chim(nl,k) harmonic current factor

               1       2        3       4        5       6       7       8       9       10      11

sp1            0       0        0       0        0       0       0       0       0       0       0
sp2            0       0        0       0        0       0       0       0       0       0       0
sp2-prim       0       0        0       0        0       0       0       0       0       0       0
sp3            0       0        0       0        0       0       0       0       0       0       0
pwm-asd1       0       0        0       0        0       0       0       0       0       0       0

pwm-asd2       0      -0.58     0.72   -0.4     0.27     0.02   -0.04   -0.005   0.024   0       0
vfd            0       0.21     0.057  -0.017  -0.14    -0.17   -0.13   -0.007  -0.005  -0.0016  0.0065
;


Table   bbranch(i,j,*)  not in pu so invide zbase

                 r            x            b       rateA    rateB   rateC     tap      an        st        min         max


1.2            0.002116      0.036501      0        0        0        0        0        0        1        -360        360
2.3            0.2788        0.0148        0        0        0        0        0        0        1        -360        360
2.29           0.2788        0.0148        0        0        0        0        0        0        1        -360        360
3.4            0.4438        0.4391        0        0        0        0        0        0        1        -360        360
4.23           0.4438        0.4391        0        0        0        0        0        0        1        -360        360
4.5            0.8639        0.7512        0        0        0        0        0        0        1        -360        360
5.6            0.8639        0.7512        0        0        0        0        0        0        1        -360        360
6.7            1.3738        0.7739        0        0        0        0        0        0        1        -360        360
7.22           0.8639        0.7512        0        0        0        0        0        0        1        -360        360
7.8            1.3738        0.7739        0        0        0        0        0        0        1        -360        360
7.19           0.8639        0.7512        0        0        0        0        0        0        1        -360        360
8.9            1.3738        0.7739        0        0        0        0        0        0        1        -360        360
9.16           0.8639        0.7512        0        0        0        0        0        0        1        -360        360
9.10           1.3738        0.7739        0        0        0        0        0        0        1        -360        360
16.17          1.3738        0.7739        0        0        0        0        0        0        1        -360        360
10.11          1.3738        0.7739        0        0        0        0        0        0        1        -360        360
11.12          1.3738        0.7739        0        0        0        0        0        0        1        -360        360
12.13          1.3738        0.7739        0        0        0        0        0        0        1        -360        360
13.14          1.3738        0.7739        0        0        0        0        0        0        1        -360        360
14.15          1.3738        0.7739        0        0        0        0        0        0        1        -360        360
17.18          1.3738        0.7739        0        0        0        0        0        0        1        -360        360
23.24          0.4438        0.4391        0        0        0        0        0        0        1        -360        360
24.25          0.8639        0.7512        0        0        0        0        0        0        1        -360        360
25.26          0.8639        0.7512        0        0        0        0        0        0        1        -360        360
26.27          0.8639        0.7512        0        0        0        0        0        0        1        -360        360
27.28          1.3728        0.7739        0        0        0        0        0        0        1        -360        360
29.30          0.2788        0.0148        0        0        0        0        0        0        1        -360        360
30.31          1.3738        0.7739        0        0        0        0        0        0        1        -360        360
19.20          0.8639        0.7512        0        0        0        0        0        0        1        -360        360
20.21          1.3738        0.7739        0        0        0        0        0        0        1        -360        360;
parameter branch;
branch(i,j,'r')=bbranch(i,j,'r')/5.3;
branch(i,j,'x')=bbranch(i,j,'x')/5.3;
branch(i,j,'b')=bbranch(i,j,'b');
branch(i,j,'rateA')=bbranch(i,j,'rateA');
branch(i,j,'rateB')=bbranch(i,j,'rateB');
branch(i,j,'rateC')=bbranch(i,j,'rateC');
branch(i,j,'tap')=bbranch(i,j,'tap');
branch(i,j,'an')=bbranch(i,j,'an');
branch(i,j,'st')=bbranch(i,j,'st');
branch(i,j,'min')=bbranch(i,j,'min');
branch(i,j,'max')=bbranch(i,j,'max');

*****************************************************************
table scenario(sc,*)
        co         vwind1     probload          probwind        probsc
sc1     0.8843     9.874      0.0131            0.1175          0.00153925
sc2     0.9662     9.874      0.4869            0.1175          0.05721075
sc3     1.0338     9.874      0.4869            0.1175          0.05721075
sc4     1.1157     9.874      0.0131            0.1175          0.00153925
sc5     0.8843     22.8742    0.0131            0.2760          0.0036156
sc6     0.9662     22.8742    0.4869            0.2760          0.1343844
sc7     1.0338     22.8742    0.4869            0.2760          0.1343844
sc8     1.1157     22.8742    0.0131            0.2760          0.0036156
sc9     0.8843     37.2268    0.0131            0.2819          0.00369289
sc10    0.9662     37.2268    0.4869            0.2819          0.13725711
sc11    1.0338     37.2268    0.4869            0.2819          0.13725711
sc12    1.1157     37.2268    0.0131            0.2819          0.00369289
sc13    0.8843     60.4745    0.0131            0.3247          0.00425357
sc14    0.9662     60.4745    0.4869            0.3247          0.15809643
sc15    1.0338     60.4745    0.4869            0.3247          0.15809643
sc16    1.1157     60.4745    0.0131            0.3247          0.00425357

;
parameters cp_,cq_,pg_,qg_,pdo_,qdo_,pnl_,qnl_,Tr_,d_,dd,inr,inim,inlr_,inlim_;


loop((k,nl),
inr(k,nl,i)$ (nl_bus(i,nl))=chr(nl,k)*pnl(nl);
inim(k,nl,i)$ (nl_bus(i,nl))= chim(nl,k)*pnl(nl);
);
loop((k,i,nl),
inlr_(k,i)$ (nl_bus(i,nl)) =inr(k,nl,i);
inlim_(k,i)$ (nl_bus(i,nl)) =inim(k,nl,i);
);

parameters pg_s,qg_s,pdo_s,qdo_s,pnl_s,qnl_s,inlr_s,inlim_s;

pg_s(sc,i)=pg(i)*scenario(sc,'co')*0.9  ;
qg_s(sc,i)=qg(i)*scenario(sc,'co')*0.9  ;
pdo_s(sc,i)=pdo(i)*scenario(sc,'co')*0.9  ;
qdo_s(sc,i)=qdo(i)*scenario(sc,'co')*0.9  ;
pnl_s(sc,nl)=pnl(nl)*scenario(sc,'co')*0.9  ;
qnl_s(sc,nl)=qnl(nl)*scenario(sc,'co')*0.9  ;
inlr_s(sc,k,i) =inlr_(k,i)*scenario(sc,'co')*0.9;
inlim_s(sc,k,i) =inlim_(k,i)*scenario(sc,'co')*0.9;
******************************************************************************************************
parameter ha(k)/1  1,2  5,3   7,4 11,5 13,6 17,7 19,8 23,9 25,10 29,11 31/;

loop(k,
x_h(k,i,j)=ha(k)*branch(i,j,'x');
bb_h(k,i,j)=ha(k)*branch(i,j,'b');
)


****************&&&&&&&&&&&&&&&&&&&
set
dg/pv,wt/
;
parameters
cww/10000/
vc_i  cut_in/8/
vc_o cut_out /55/
v_r1 rated velovity/31/
v_r2 rated velovity/25/
p_wind1
p_wind2
h_c

wt_max1 maximum power w-t kw3000/0.03/
wt_max2 maximum power w-t kw2500/0.025/

pv_mx maximum power kw 120   /0.0012/

v_wind1(sc)/sc1 6.6296,sc2 15.4196,sc3 25.1036,sc4 49.674/
v_wind2(sc)/sc1 6.6132,sc2 15.3597,sc3 25.0027,sc4 44.8144/
*7.95,2 8.8,3 9.65,4 10.55,5 9.45,6 8.45,7 7.15,8 6.4,9 6.45,10 5.1,11 4.35,12 4.7,13 5.1
*,14 6.2,15 7.2,16 8,17 9.35,18 10,19 9,20 8.5,21 7.4
*,22 7,23 6.75,24 7.15/
TA/0.9/
*,2 0,3 0,4 0,5 0,6 0.5,7 0.6,8 0.8,9 0.9,10 0.95
*,11 0.98,12 1,13 1,14 1,15 1,16 0.98
*,17 0.95,18 0.8
*,19 0.4,20 0,21 0,22 0,23 0,24 0/
;
table h_c(dg,k) harmonic current factor
         1     2        3       4        5       6        7       8       9       10      11
pv       1     0.011    0.032   0.0026   0.034   0.0012   0.011   0.008   0.0004   0.008   0.006
wt       1     0.011    0.032   0.0026   0.034   0.0012   0.011   0.008   0.0004   0.008   0.006
;


p_wind1(sc) $(v_wind1(sc) <vc_i and sc_wind(sc))=0 ;

p_wind1(sc) $(vc_i<v_wind1(sc)  and v_wind1(sc) <v_r1 and sc_wind(sc))=wt_max1* (v_wind1(sc) -vc_i)/(v_r1-vc_i);
p_wind1(sc) $(v_r1<v_wind1(sc)  and v_wind1(sc) <vc_o and sc_wind(sc))=wt_max1;

p_wind1(sc) $(v_wind1(sc) >vc_o and sc_wind(sc))=0 ;
********************
p_wind2(sc) $(v_wind2(sc) <vc_i and sc_wind(sc))=0 ;

p_wind2(sc) $(vc_i<v_wind2(sc)  and v_wind2(sc) <v_r2 and sc_wind(sc))=wt_max2* (v_wind2(sc) -vc_i)/(v_r2-vc_i);
p_wind2(sc) $(v_r2<v_wind2(sc)  and v_wind2(sc) <vc_o and sc_wind(sc))=wt_max2;

p_wind2(sc) $(v_wind2(sc) >vc_o and sc_wind(sc))=0 ;
*&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&&
variables
F
positive variable fr  ,pwind1,sst,pv
positive variable landa
binary variable x ,bw1,bp
integer variable y
variables
*pwind
iwr
iwim
iwr1
iwim1

ipr
ipim
ipr1
ipim1
istr
istim
inlrl
inliml
ir
iim
inlr
inlim
ilr
ilim
ilmg
ilrms
pst
qst
sst
*pd(i)
*qd(i)
p
q
*THDv
vr
vim
istmg
istrms
vmg
vrms
Pgg
qgg
v
theta
tthdv;
equations
         obj_fun
         co1
         co2
         co3
         co4
         co5
         co6
         co7
         co8
*         co9
*         co10
*         co11
*         co12
         co13
        co14
        co15
*         co16
*         co17
         co18
         co19
         co20

       co21

*e1
e2
e3
*e4
*e5
*e6


         ;

     Parameter c_instal,c_operation,c_travel,c_p,c_q,ploss_t,snl,thdv,ipr_,iwr_;

 snl(nl )=sqrt(sqr(pnl(nl ))+sqr(qnl(nl ))) ;
ipr_(k )=h_c('wt',k)*pv_mx*TA;
iwr_(k,sc )=h_c('wt',k)*p_wind1(sc);


****************************************G+BJ**********************************************
b_h(k,i,j)$line(i,j) = -x_h(k,i,j)/(sqr(branch(i,j,'r'))+sqr(x_h(k,i,j)));
g_h(k,i,j)$line(i,j) = branch(i,j,'r')/(sqr(branch(i,j,'r'))+sqr(x_h(k,i,j)));
ratio(line)=1;
************************************Ybus-Formulation***************************************************

y_h(k,i,j,'real')$(not sameas(i,j))=sum(Line(i,j)$branch(i,j,'st'), -1/ratio(i,j) * (g_h(k,i,j)*cos(branch(i,j,'an')) - b_h(k,i,j)*sin(branch(i,j,'an'))))
+ sum(Line(j,i)$branch(j,i,'st'), -1/ratio(j,i)* (g_h(k,j,i)*cos(-branch(j,i,'an')) - b_h(k,j,i)*sin(-branch(j,i,'an'))));


y_h(k,i,j,'imag')$(not sameas(i,j))=sum(Line(i,j)$branch(i,j,'st'), -1/ratio(i,j) * (b_h(k,i,j)*cos(branch(i,j,'an')) + g_h(k,i,j)*sin(branch(i,j,'an'))))
+ sum(Line(j,i)$branch(j,i,'st'), -1/ratio(j,i)* (b_h(k,j,i)*cos(-branch(j,i,'an')) + g_h(k,j,i)*sin(-branch(j,i,'an'))));


y_h(k,i,i,'real')= sum(j$branch(i,j,'st'), g_h(k,i,j)/sqr(ratio(i,j))) + sum(j$branch(j,i,'st'), g_h(k,j,i));



y_h(k,i,i,'imag')= sum(j$branch(i,j,'st'), 1/sqr(ratio(i,j)) * (b_h(k,i,j)+bb_h(k,i,j)/2)) + sum(j$branch(j,i,'st'),(b_h(k,j,i)+bb_h(k,j,i)/2));

***************************************objective_function***********************************************
obj_fun   ..F=e=100*sum((sc,i),1.05-vrms(sc,i ));
*+0.5*sum((i,ti),tthdv(i,ti))+sum((k,i,sc),125*Pgg(sc,k,i)$slack(i)+18.75*qgg(sc,k,i)$slack(i))+sum((sc,i),pwind1(i,sc)*37.5) ;
*1000*sum(i,bp(i)+bw(i))+sum((k,i,ti),cp_(ti)*Pgg(k,i,ti)$slack(i)+cq_(ti)*qgg(k,i,ti)$slack(i))
*+sum((i,ti),0.5*cp_(ti)*(pwind(i,ti)$LLoad(i)+pv(i,ti)$LLoad(i)))+0.1*sum((i,ti),tthdv(i,ti));
*1000*sum(i,bp(i)+bw(i));
**************************************************************************************

co1(sc,k,i )                   ..ir(sc,k,i )=e=sum(j,y_h(k,i,j,'real')*vr(sc,k,j )-y_h(k,i,j,'imag')*vim(sc,k,j ));
co2(sc,k,i )                   ..iim(sc,k,i )=e=sum(j,y_h(k,i,j,'real')*vim(sc,k,j )+y_h(k,i,j,'imag')*vr(sc,k,j ));


co3(sc,k,i )$(ord(k)=1).. Pgg(sc,k,i )$slack(i)+pg_s(sc,i )+pwind1(sc,i )$LLoad(i)-(pdo_s(sc,i )  +sum(nl$nl_bus(i,nl),pnl_s(sc,nl )))=e= sum(j,(V(sc,k,i )*V(sc,k,j )*y_h(k,i,j,'real')*cos(theta(sc,i )-theta(sc,j ))+V(sc,k,i )*V(sc,k,j )*y_h(k,i,j,'imag')*sin(theta(sc,i )-theta(sc,j ))));
co4(sc,k,i )$(ord(k)=1).. Qgg(sc,k,i )$slack(i)+qg_s(sc,i ) -(qdo_s(sc,i ) +sum(nl$nl_bus(i,nl),qnl_s(sc,nl )))=e= sum(j,(V(sc,k,i )*V(sc,k,j )*y_h(k,i,j,'real')*sin(theta(sc,i )-theta(sc,j ))-V(sc,k,i )*V(sc,k,j )*y_h(k,i,j,'imag')*cos(theta(sc,i )-theta(sc,j ))));

co5(sc,k,i )$(ord(k)=1)                    ..vr(sc,k,i )=e=v(sc,k,i )*cos(theta(sc,i ));
co6(sc,k,i )$(ord(k)=1)                    ..vim(sc,k,i )=e=v(sc,k,i )*sin(theta(sc,i ));
*+pwind(sc,i )+pv(sc,i )
*co3 (sc,i )                        ..p(sc,i )=e=vr(sc,'1',i )*ir(sc,'1',i )+vim(sc,'1',i )*iim(sc,'1',i );
*co4(sc,i )                         ..q(sc,i )=e=-vr(sc,'1',i )*iim(sc,'1',i )+vim(sc,'1',i )*ir(sc,'1',i );
*co5(sc,i )$LLoad(i)                ..p(sc,i )=e=pg__(sc,i ) -(pdo__(sc,i ) +sum(nl$ nl_bus(i,nl),pnl__(sc,nl )));
*co6(sc,i )$LLoad(i)                ..q(sc,i )=e=qg__(sc,i ) -(qdo__(sc,i ) +sum(nl$ nl_bus(i,nl),qnl__(sc,nl )));

co7(sc,k,i )$(ord(k)<>1and LLoad(i))           ..ir(sc,k,i )=e=-inlr_s(sc,k,i );
*-iwr1(sc,k,i )*bw1(i)-ipr(sc,k,i )*bp(i);
co8(sc,k,i )$(ord(k)<>1and LLoad(i))           ..iim(sc,k,i )=e=-inlim_s(sc,k,i ) ;

*e1(sc,k,i  )$(ord(k)<>1and LLoad(i))           ..iwr1(sc,k,i  )=e=h_c('wt',k)*pwind1(sc,i  );

e2(sc,i )$LLoad(i)                                      ..pwind1(sc,i )=l=p_wind1(sc)*bw1(i);

e3..                                        sum(i,bw1(i))=e=1;

*e4(sc,k,i  )$(ord(k)<>1 and LLoad(i) )           ..ipr(sc,k,i  )=e=h_c('wt',k)*pv(sc,i  );

*e5(sc,i ) $LLoad(i)                                      ..pv(sc,i )=l=pv_mx*TA*bp(i);

*e6..                                        sum(i,bp(i))=e=0;


*co9(sc,i,nl )$(nl_bus(i,nl))       ..pnl__(sc,nl )=e=inlrl(sc,i,nl )*vr(sc,'1',i )+inliml(sc,i,nl )*vim(sc,'1',i );
*co10(sc,i,nl )$(nl_bus(i,nl))       ..qnl__(sc,nl )=e=inlrl(sc,i,nl )*vim(sc,'1',i )-inliml(sc,i,nl )*vr(sc,'1',i );
*co11(sc,k,i )$(ord(k)<>1)           ..inlr(sc,k,i )=e=sum(sc,nl,chr(sc,nl,k)*inlrl(sc,i,nl )$nl_bus(i,nl)-(chim(sc,nl,k)*inliml(sc,i,nl )$nl_bus(i,nl)));
*co12(sc,k,i )$(ord(k)<>1)           ..inlim(sc,k,i )=e=sum(sc,nl,chr(sc,nl,k)*inliml(sc,i,nl )$nl_bus(i,nl)+(chim(sc,nl,k)*inlrl(sc,i,nl )$nl_bus(i,nl)));
**********************************************security_constraints****************************************
co13(sc,k,i )                  ..(vmg(sc,k,i ))=e=sqrt(sqr(vr(sc,k,i ))+sqr(vim(sc,k,i ))) ;
co14(sc,i )                    ..(vrms(sc,i ))=e= sqrt(sum(k,sqr(vmg(sc,k,i ))));
co15(sc,i )                    ..tTHDv(sc,i )=e=(sqrt(sum(k$(ord(k)<> 1),sqr(vmg(sc,k,i )))))/(vmg(sc,'1',i )+0.00001);
*co16(sc,i )                    ..THDv(sc,i )=l=THDmax ;
*co17(sc,k,i )$(ord(k)<> 1)     ..(vmg(sc,k,i )$(ord(k)<> 1))/(vmg(sc,'1',i )+0.0000000001) =l=0.0;
*0.02
**************************************************************************************
co18(sc,k,i,j )$ line(i,j)   ..ilr(sc,k,i,j )=e=y_h(k,i,j,'real')*(Vr(sc,k,i )-Vr(sc,k,j ))-y_h(k,i,j,'imag')*(Vim(sc,k,i )-Vim(sc,k,j ));
co19(sc,k,i,j )$ line(i,j)   ..ilim(sc,k,i,j )=e=y_h(k,i,j,'real')*(Vim(sc,k,i )-Vim(sc,k,j ))+y_h(k,i,j,'imag')*(Vr(sc,k,i )-Vr(sc,k,j ));
co20(sc,k,i,j )$ line(i,j)   ..ilmg(sc,k,i,j )=e=sqrt(sqr(ilr(sc,k,i,j ))+sqr(ilim(sc,k,i,j )));
co21(sc,i,j )$ line(i,j)     ..sqrt(sum(k,sqr(ilmg(sc,k,i,j ))))=l=ilmax ;


vrms.lo(sc,i )=0.8;
vrms.up(sc,i )=1.05;

Pgg.lo(sc,k,i )$(slack(i) and ord(k)=1) = GenD(i,'Pmin');
Pgg.up(sc,k,i )$(slack(i) and ord(k)=1) = GenD(i,'Pmax');

Qgg.lo(sc,k,i )$(slack(i) and ord(k)=1)= GenD(i,'Qmin');
Qgg.up(sc,k,i )$(slack(i) and ord(k)=1) = GenD(i,'Qmax');

V.lo(sc,'1',i )=0.8;
V.up(sc,'1',i )=1.05;

*Vmg.up(sc,k,i )$(ord(k)=1)=0.95;
*Vmg.up(sc,k,i )$(ord(k)<>1)=0.1;
Vmg.lo(sc,k,i )=0;
Vmg.lo(sc,k,i )$(ord(k)<>1)=0.023;

theta.lo(sc,i )=-pi/4;
theta.up(sc,i )=pi/4;

        model dntnrecent /all/;
*obj_fun,co1,co2,co3,co4,co5,co6,co7,co8,co9,co10,co11,co12,co13,co14,co18,co19,co20,co21/;

option miNLP=dicopt;
option optcr=0.1;
option optca=0.1;
         option Reslim=1000000000;
           solve dntnrecent using  miNLP minimizing F;


THDv(sc,i )=(sqrt(sum(k$(ord(k)<> 1),sqr(vmg.l(sc,k,i )))))/(vmg.l(sc,'1',i ));

ploss_t(sc )=sum((k,i,j)$line(i,j),branch(i,j,'r')*( sqr(ilr.l(sc,k,i,j ))+sqr(ilim.l(sc,k,i,j))));

display y_h,branch,pgg.l,qgg.l,v.l,vrms.l,snl,ilr.l,ilim.l,thdv,inlr_,inlim_,iim.l,ir.l,pwind1.l,bw1.l;

  execute_unload "results_31bus-wind1.gdx" VRMS
    execute 'gdxxrw.exe results_31bus-wind1.gdx Var=VRMS rng=classic1!'
   execute_unload "results_31bus-wind1.gdx" Pgg
   execute 'gdxxrw.exe results_31bus-wind1.gdx Var=Pgg rng=classic2!'
   execute_unload "results_31bus-wind1.gdx" Qgg
   execute 'gdxxrw.exe results_31bus-wind1.gdx Var=Qgg rng=classic3!'
   execute_unload "results_31bus-wind1.gdx" THDv
   execute 'gdxxrw.exe results_31bus-wind1.gdx par=THDv rng=classic4!'
    execute_unload "results_31bus-wind1.gdx" ploss_t
   execute 'gdxxrw.exe results_31bus-wind1.gdx par=ploss_t rng=classic5!'

