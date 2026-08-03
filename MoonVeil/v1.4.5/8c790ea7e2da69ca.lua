-- This script was generated using the MoonVeil Obfuscator v1.4.5 [https://moonveil.cc]

local br_,Gv,qv,E,lv,_g=pairs,getmetatable,type,bit32.bxor
local hj,QF,vx,al,Cw,A,yf,mg,Lr,Vm,nC,pA,sf,qF,Ea,ss,rs,Rw,JD,fv,io,Bi,lt,du,RD;
pA={};
du,Rw={},function(wu,xs,oF)
    du[xs]=E(wu,17523)-E(oF,14836)
    return du[xs]
end;
qF=du[-15566]or Rw(47603,-15566,16829)
while qF~=5.2304094683592632*10477 do
    if qF>10937- -25938 then
        if qF<=30688- -23381 then
            if qF>1119019120/23536 then
                if qF>-4.6229975080099681*-11236 then
                    if qF<=610985460/11364 then
                        if qF>969346224/18032 then
                            qF,Bi=du[-28650]or Rw(39361,-28650,58744),(select)
                        else
                            qF,pA[1]=du[12885]or Rw(80314,12885,53429),pA[1][pA[2]]
                        end
                    else
                        qF,pA[3]=du[3168]or Rw(68840,3168,47158),pA[3][pA[1]]
                    end
                elseif qF<=-2.0491468691321741*-24498 then
                    if qF<=19576- -30511 then
                        if qF<=-1452114450/-30150 then
                            qF,pA[3]=-144.36682242990653*-428,nC[pA[3]]
                        else
                            qF,pA[4]=du[23248]or Rw(67730,23248,54940),'\195\158\213\196\147'
                        end
                    else
                        qF,pA[5]=du[-23953]or Rw(65356,-23953,22383),'\225;\249\250.\229'
                    end
                elseif qF<=57078-6173 then
                    pA[1],qF='\246\223]\236\197H',du[-9015]or Rw(2934,-9015,199)
                else
                    qF,pA[6]=du[-8430]or Rw(14439,-8430,30084),pA[6][pA[7]]
                end
            elseif qF>=939680032/23392 then
                if qF>=70341760/1678 then
                    if qF<50195+-4256 then
                        qF,io=-22754- -25469,fv(pA[3][1],1,pA[3][2])
                    elseif qF>62519+-16580 then
                        pA[2],qF='\128\134\145',30005+31270
                    else
                        pA[4],qF='\132\55',5.1161811752820343*11878
                    end
                elseif qF<=-744448972/-18532 then
                    pA[4],qF=(function(Gp,Bt)
                        local Lv,BD,to,do_;
                        BD={};
                        to,Lv={},function(mk,md,kw)
                            to[mk]=E(kw,10928)-E(md,6436)
                            return to[mk]
                        end;
                        do_=to[22155]or Lv(22155,40579,88813)
                        repeat
                            if do_>57237 then
                                if do_<=57435 then
                                    if(BD[1]>=0 and BD[2]>BD[3])or((BD[1]<0 or BD[1]~=BD[1])and BD[2]<BD[3])then
                                        do_=to[6927]or Lv(6927,41018,111107)
                                    else
                                        do_=17664
                                    end
                                else
                                    BD[4]='';
                                    do_,BD[2],BD[1],BD[3]=to[5318]or Lv(5318,44620,85790),134,1,(#Gp-1)+134
                                end
                            elseif do_<44614 then
                                if do_>17664 then
                                    BD[2]=BD[2]+BD[1];
                                    BD[5]=BD[2]
                                    if BD[2]~=BD[2]then
                                        do_=to[-8719]or Lv(-8719,62411,122932)
                                    else
                                        do_=to[4129]or Lv(4129,2668,55571)
                                    end
                                else
                                    do_,BD[4]=to[-31202]or Lv(-31202,23879,38918),BD[4]..al(sf(Lr(Gp,(BD[5]-134)+1),Lr(Bt,(BD[5]-134)%#Bt+1)))
                                end
                            elseif do_>44614 then
                                return BD[4]
                            else
                                BD[5]=BD[2]
                                if BD[3]~=BD[3]then
                                    do_=to[-21169]or Lv(-21169,19846,73351)
                                else
                                    do_=57435
                                end
                            end
                        until do_==47000
                    end)(pA[4],pA[5]),-1.3132651641624931*-28752
                else
                    pA[2],qF=nC[pA[2]],du[14289]or Rw(34421,14289,34008)
                end
            elseif qF>=34858+3166 then
                if qF<=-106283760/-2794 then
                    if qF>-63956368/-1682 then
                        qF,lt=-1.4176059187330212*-17301,(function(gz)
                            gz=hj(gz,'[^ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=]','')
                            return(gz:gsub('.',function(qo)
                                if(qo=='=')then
                                    return''
                                end
                                local No,Ed='',(('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'):find(qo)-1)
                                for _p=6,1,-1 do
                                    No=No..(Ed%2^_p-Ed%2^(_p-1)>0 and'1'or'0')
                                end
                                return No
                            end):gsub('%d%d%d?%d?%d?%d?%d?%d?',function(nq)
                                if(#nq~=8)then
                                    return''
                                end
                                local ab=0
                                for uB=1,8 do
                                    ab=ab+(nq:sub(uB,uB)=='1'and 2^(8-uB)or 0)
                                end
                                return Vm(ab)
                            end))
                        end)
                    else
                        pA[2],qF='3W\183)M\162',du[21775]or Rw(99677,21775,59218)
                    end
                else
                    qF,pA[4]=du[-24991]or Rw(129370,-24991,58914),'\167\201\209\162\220\205'
                end
            elseif qF>-34506630/-934 then
                pA[8],qF=pA[8][pA[4]],du[4875]or Rw(93820,4875,24476)
            else
                qF,pA[5]=du[13465]or Rw(50800,13465,16454),(function(Ma,Zd)
                    local PF,Lb,JE,Vo;
                    PF={};
                    JE,Vo=function(Co,Cn,ed)
                        Vo[Cn]=E(ed,5697)-E(Co,59835)
                        return Vo[Cn]
                    end,{};
                    Lb=Vo[-16878]or JE(37090,-16878,46691)
                    while Lb~=40371 do
                        if Lb<34766 then
                            if Lb<=18857 then
                                if Lb>9929 then
                                    PF[1]=PF[1]+PF[2];
                                    PF[3]=PF[1]
                                    if PF[1]~=PF[1]then
                                        Lb=Vo[-17517]or JE(11128,-17517,89296)
                                    else
                                        Lb=34349
                                    end
                                else
                                    PF[4]='';
                                    PF[2],Lb,PF[1],PF[5]=1,50598,237,(#Ma-1)+237
                                end
                            else
                                if(PF[2]>=0 and PF[1]>PF[5])or((PF[2]<0 or PF[2]~=PF[2])and PF[1]<PF[5])then
                                    Lb=Vo[-9682]or JE(5914,-9682,102446)
                                else
                                    Lb=45320
                                end
                            end
                        elseif Lb>45320 then
                            PF[3]=PF[1]
                            if PF[5]~=PF[5]then
                                Lb=34766
                            else
                                Lb=Vo[23442]or JE(9290,23442,82527)
                            end
                        elseif Lb<=34766 then
                            return PF[4]
                        else
                            PF[4],Lb=PF[4]..al(sf(Lr(Ma,(PF[3]-237)+1),Lr(Zd,(PF[3]-237)%#Zd+1))),Vo[-10631]or JE(36252,-10631,48017)
                        end
                    end
                end)(pA[5],pA[6])
            end
        elseif qF<46913- -11079 then
            if qF<-1735408511/-30629 then
                if qF<=72796-16317 then
                    if qF>=65581-9111 then
                        if qF>218821250/3875 then
                            qF,pA[6]=du[28471]or Rw(50531,28471,21786),'\169\226\165\231'
                        else
                            qF,pA[2]=26551- -27206,(function(Hh,tt)
                                local so,tn,gn,Nh;
                                so={};
                                gn,tn=function(zC,lb,xm)
                                    tn[lb]=E(xm,6126)-E(zC,24416)
                                    return tn[lb]
                                end,{};
                                Nh=tn[28550]or gn(56182,28550,45126)
                                repeat
                                    if Nh>40958 then
                                        if Nh>51276 then
                                            if(so[1]>=0 and so[2]>so[3])or((so[1]<0 or so[1]~=so[1])and so[2]<so[3])then
                                                Nh=tn[16349]or gn(45048,16349,80033)
                                            else
                                                Nh=51276
                                            end
                                        else
                                            Nh,so[4]=tn[-14373]or gn(18629,-14373,41037),so[4]..al(sf(Lr(Hh,(so[5]-147)+1),Lr(tt,(so[5]-147)%#tt+1)))
                                        end
                                    elseif Nh<=32034 then
                                        if Nh<=16055 then
                                            if Nh<=9106 then
                                                so[4]='';
                                                so[3],so[1],so[2],Nh=(#Hh-1)+147,1,147,32034
                                            else
                                                return so[4]
                                            end
                                        else
                                            so[5]=so[2]
                                            if so[3]~=so[3]then
                                                Nh=16055
                                            else
                                                Nh=tn[25218]or gn(5471,25218,74343)
                                            end
                                        end
                                    else
                                        so[2]=so[2]+so[1];
                                        so[5]=so[2]
                                        if so[2]~=so[2]then
                                            Nh=tn[27013]or gn(33185,27013,68246)
                                        else
                                            Nh=tn[-31882]or gn(65066,-31882,105338)
                                        end
                                    end
                                until Nh==18098
                            end)(pA[2],pA[8])
                        end
                    else
                        qF,vx=du[16311]or Rw(89082,16311,28814),fv(pA[3][1],1,pA[3][2])
                        continue
                    end
                else
                    pA[6],qF=(function(_D,yA)
                        local Wl,Eq,LB,Va;
                        Wl={};
                        LB,Va={},function(Zc,Wx,my)
                            LB[Wx]=E(my,36567)-E(Zc,34390)
                            return LB[Wx]
                        end;
                        Eq=LB[-24853]or Va(22200,-24853,103550)
                        while Eq~=21994 do
                            if Eq<=26664 then
                                if Eq<=18875 then
                                    if Eq>1792 then
                                        Wl[1]='';
                                        Eq,Wl[2],Wl[3],Wl[4]=LB[10477]or Va(38203,10477,105593),26,1,(#_D-1)+26
                                    elseif Eq>871 then
                                        if(Wl[3]>=0 and Wl[2]>Wl[4])or((Wl[3]<0 or Wl[3]~=Wl[3])and Wl[2]<Wl[4])then
                                            Eq=LB[-2593]or Va(1858,-2593,2732)
                                        else
                                            Eq=LB[-19318]or Va(54197,-19318,115698)
                                        end
                                    else
                                        return Wl[1]
                                    end
                                else
                                    Wl[2]=Wl[2]+Wl[3];
                                    Wl[5]=Wl[2]
                                    if Wl[2]~=Wl[2]then
                                        Eq=871
                                    else
                                        Eq=1792
                                    end
                                end
                            elseif Eq<=63298 then
                                Wl[1],Eq=Wl[1]..al(sf(Lr(_D,(Wl[5]-26)+1),Lr(yA,(Wl[5]-26)%#yA+1))),LB[-200]or Va(63727,-200,26678)
                            else
                                Wl[5]=Wl[2]
                                if Wl[4]~=Wl[4]then
                                    Eq=871
                                else
                                    Eq=LB[-17781]or Va(33163,-17781,32778)
                                end
                            end
                        end
                    end)(pA[6],pA[7]),91656+-28179
                end
            elseif qF<=-322873450/-5675 then
                if qF>=1499345460/26370 then
                    if qF<=-732785904/-12888 then
                        qF,pA[3]=du[-10318]or Rw(89400,-10318,19583),rs((function()
                            local Dw,yu,Av,Ii,Xa,_s,tm,Sv,Tz,Ab,pa,Fb=nC[(function(lp,ND)
                                local _F,CF,Xm,Np;
                                Np={};
                                _F,Xm=function(Tu,I,mw)
                                    Xm[Tu]=E(mw,53011)-E(I,27870)
                                    return Xm[Tu]
                                end,{};
                                CF=Xm[-23748]or _F(-23748,11107,3390)
                                while CF~=64656 do
                                    if CF>40241 then
                                        if CF<=44221 then
                                            Np[1]=Np[1]+Np[2];
                                            Np[3]=Np[1]
                                            if Np[1]~=Np[1]then
                                                CF=Xm[31199]or _F(31199,35893,114668)
                                            else
                                                CF=40241
                                            end
                                        else
                                            Np[3]=Np[1]
                                            if Np[4]~=Np[4]then
                                                CF=Xm[30758]or _F(30758,31569,26800)
                                            else
                                                CF=40241
                                            end
                                        end
                                    elseif CF>=36884 then
                                        if CF<=36884 then
                                            return Np[5]
                                        else
                                            if(Np[2]>=0 and Np[1]>Np[4])or((Np[2]<0 or Np[2]~=Np[2])and Np[1]<Np[4])then
                                                CF=36884
                                            else
                                                CF=Xm[-30468]or _F(-30468,17023,44151)
                                            end
                                        end
                                    elseif CF<=13507 then
                                        CF,Np[5]=Xm[2395]or _F(2395,53336,108112),Np[5]..al(sf(Lr(lp,(Np[3]-42)+1),Lr(ND,(Np[3]-42)%#ND+1)))
                                    else
                                        Np[5]='';
                                        CF,Np[4],Np[1],Np[2]=59043,(#lp-1)+42,42,1
                                    end
                                end
                            end)('\235\243\253\169\187','\137\154')][(function(Xe,wn)
                                local jA,rt,Is,db;
                                jA={};
                                rt,db={},function(NB,cq,ph)
                                    rt[cq]=E(ph,47795)-E(NB,31609)
                                    return rt[cq]
                                end;
                                Is=rt[29292]or db(20961,29292,62430)
                                while Is~=7969 do
                                    if Is>28596 then
                                        if Is<=39863 then
                                            if(jA[1]>=0 and jA[2]>jA[3])or((jA[1]<0 or jA[1]~=jA[1])and jA[2]<jA[3])then
                                                Is=28596
                                            else
                                                Is=rt[427]or db(52093,427,71282)
                                            end
                                        else
                                            Is,jA[4]=rt[-1176]or db(56229,-1176,18431),jA[4]..al(sf(Lr(Xe,(jA[5]-238)+1),Lr(wn,(jA[5]-238)%#wn+1)))
                                        end
                                    elseif Is>=23664 then
                                        if Is<=23664 then
                                            jA[2]=jA[2]+jA[1];
                                            jA[5]=jA[2]
                                            if jA[2]~=jA[2]then
                                                Is=28596
                                            else
                                                Is=39863
                                            end
                                        else
                                            return jA[4]
                                        end
                                    elseif Is>3860 then
                                        jA[4]='';
                                        jA[2],jA[1],jA[3],Is=238,1,(#Xe-1)+238,3860
                                    else
                                        jA[5]=jA[2]
                                        if jA[3]~=jA[3]then
                                            Is=28596
                                        else
                                            Is=rt[22934]or db(29613,22934,7736)
                                        end
                                    end
                                end
                            end)('<\209\49\219','^\169')],nC[(function(Ak,eC)
                                local mu,bt,Uo,Ga;
                                Uo={};
                                Ga,bt=function(Ry,Pk,yg)
                                    bt[yg]=E(Pk,58749)-E(Ry,53677)
                                    return bt[yg]
                                end,{};
                                mu=bt[-15641]or Ga(20721,99103,-15641)
                                while mu~=50145 do
                                    if mu>36324 then
                                        if mu<=38149 then
                                            Uo[1]=Uo[1]+Uo[2];
                                            Uo[3]=Uo[1]
                                            if Uo[1]~=Uo[1]then
                                                mu=28959
                                            else
                                                mu=36324
                                            end
                                        else
                                            Uo[4]='';
                                            mu,Uo[5],Uo[2],Uo[1]=bt[-27289]or Ga(10144,120688,-27289),(#Ak-1)+97,1,97
                                        end
                                    elseif mu<=35977 then
                                        if mu<28959 then
                                            Uo[3]=Uo[1]
                                            if Uo[5]~=Uo[5]then
                                                mu=28959
                                            else
                                                mu=36324
                                            end
                                        elseif mu<=28959 then
                                            return Uo[4]
                                        else
                                            mu,Uo[4]=bt[13544]or Ga(44751,127258,13544),Uo[4]..al(sf(Lr(Ak,(Uo[3]-97)+1),Lr(eC,(Uo[3]-97)%#eC+1)))
                                        end
                                    else
                                        if(Uo[2]>=0 and Uo[1]>Uo[5])or((Uo[2]<0 or Uo[2]~=Uo[2])and Uo[1]<Uo[5])then
                                            mu=bt[31937]or Ga(57865,16830,31937)
                                        else
                                            mu=bt[15191]or Ga(30461,120484,15191)
                                        end
                                    end
                                end
                            end)('\17q\a+A','s\24')][(function(cs,hu)
                                local Qg,kD,Gl,TB;
                                kD={};
                                Qg,TB=function(sC,Pc,Ft)
                                    TB[Pc]=E(Ft,34970)-E(sC,19488)
                                    return TB[Pc]
                                end,{};
                                Gl=TB[23860]or Qg(21911,23860,16321)
                                while Gl~=41842 do
                                    if Gl>37782 then
                                        if Gl>40356 then
                                            kD[1],Gl=kD[1]..al(sf(Lr(cs,(kD[2]-230)+1),Lr(hu,(kD[2]-230)%#hu+1))),TB[-12957]or Qg(42495,-12957,111173)
                                        else
                                            kD[1]='';
                                            kD[3],kD[4],kD[5],Gl=1,(#cs-1)+230,230,TB[3684]or Qg(10771,3684,29011)
                                        end
                                    elseif Gl>=29849 then
                                        if Gl>29849 then
                                            kD[2]=kD[5]
                                            if kD[4]~=kD[4]then
                                                Gl=19352
                                            else
                                                Gl=29849
                                            end
                                        else
                                            if(kD[3]>=0 and kD[5]>kD[4])or((kD[3]<0 or kD[3]~=kD[3])and kD[5]<kD[4])then
                                                Gl=TB[24772]or Qg(812,24772,4670)
                                            else
                                                Gl=45376
                                            end
                                        end
                                    elseif Gl<=19352 then
                                        return kD[1]
                                    else
                                        kD[5]=kD[5]+kD[3];
                                        kD[2]=kD[5]
                                        if kD[5]~=kD[5]then
                                            Gl=19352
                                        else
                                            Gl=TB[-25753]or Qg(44893,-25753,118924)
                                        end
                                    end
                                end
                            end)('{\187w\190','\25\218')],nC[(function(zu,Gr)
                                local cb,Nj,Fv,lu;
                                lu={};
                                Fv,cb={},function(Nk,Ue,Vu)
                                    Fv[Vu]=E(Nk,11282)-E(Ue,16140)
                                    return Fv[Vu]
                                end;
                                Nj=Fv[15889]or cb(77109,1171,15889)
                                repeat
                                    if Nj>=50568 then
                                        if Nj>52927 then
                                            if(lu[1]>=0 and lu[2]>lu[3])or((lu[1]<0 or lu[1]~=lu[1])and lu[2]<lu[3])then
                                                Nj=37630
                                            else
                                                Nj=Fv[-23429]or cb(23315,29180,-23429)
                                            end
                                        elseif Nj<=50568 then
                                            lu[4]='';
                                            Nj,lu[3],lu[1],lu[2]=Fv[-16310]or cb(73134,24049,-16310),(#zu-1)+141,1,141
                                        else
                                            lu[5]=lu[2]
                                            if lu[3]~=lu[3]then
                                                Nj=37630
                                            else
                                                Nj=Fv[2241]or cb(66645,28372,2241)
                                            end
                                        end
                                    elseif Nj<34043 then
                                        lu[4],Nj=lu[4]..al(sf(Lr(zu,(lu[5]-141)+1),Lr(Gr,(lu[5]-141)%#Gr+1))),Fv[-24782]or cb(55609,20284,-24782)
                                    elseif Nj<=34043 then
                                        lu[2]=lu[2]+lu[1];
                                        lu[5]=lu[2]
                                        if lu[2]~=lu[2]then
                                            Nj=37630
                                        else
                                            Nj=54895
                                        end
                                    else
                                        return lu[4]
                                    end
                                until Nj==33029
                            end)('\134\225\144\187\214','\228\136')][(function(Ua,iC)
                                local Kx,uE,va,vn;
                                va={};
                                uE,vn={},function(Lx,LF,ef)
                                    uE[ef]=E(Lx,61670)-E(LF,23909)
                                    return uE[ef]
                                end;
                                Kx=uE[-8612]or vn(80774,45896,-8612)
                                repeat
                                    if Kx<=40560 then
                                        if Kx<=24228 then
                                            if Kx>20163 then
                                                return va[1]
                                            elseif Kx>17869 then
                                                va[2]=va[3]
                                                if va[4]~=va[4]then
                                                    Kx=uE[-12116]or vn(31719,28984,-12116)
                                                else
                                                    Kx=40560
                                                end
                                            else
                                                va[3]=va[3]+va[5];
                                                va[2]=va[3]
                                                if va[3]~=va[3]then
                                                    Kx=uE[22950]or vn(27185,24918,22950)
                                                else
                                                    Kx=uE[9957]or vn(97797,44310,9957)
                                                end
                                            end
                                        else
                                            if(va[5]>=0 and va[3]>va[4])or((va[5]<0 or va[5]~=va[5])and va[3]<va[4])then
                                                Kx=24228
                                            else
                                                Kx=43559
                                            end
                                        end
                                    elseif Kx<=43559 then
                                        Kx,va[1]=uE[-32638]or vn(29077,26307,-32638),va[1]..al(sf(Lr(Ua,(va[2]-164)+1),Lr(iC,(va[2]-164)%#iC+1)))
                                    else
                                        va[1]='';
                                        va[5],va[4],va[3],Kx=1,(#Ua-1)+164,164,uE[-5208]or vn(10967,54795,-5208)
                                    end
                                until Kx==30297
                            end)('\218\215\202','\184')],nC[(function(TC,Lw)
                                local AF,ve,nB,px;
                                nB={};
                                AF,px=function(ca,yl,EE)
                                    px[EE]=E(ca,17896)-E(yl,2181)
                                    return px[EE]
                                end,{};
                                ve=px[10302]or AF(65329,17563,10302)
                                while ve~=50917 do
                                    if ve<=38424 then
                                        if ve>=28347 then
                                            if ve>28347 then
                                                ve,nB[1]=px[-29416]or AF(62796,1943,-29416),nB[1]..al(sf(Lr(TC,(nB[2]-10)+1),Lr(Lw,(nB[2]-10)%#Lw+1)))
                                            else
                                                nB[1]='';
                                                nB[3],nB[4],ve,nB[5]=10,1,px[16123]or AF(21590,449,16123),(#TC-1)+10
                                            end
                                        elseif ve>2170 then
                                            return nB[1]
                                        else
                                            nB[2]=nB[3]
                                            if nB[5]~=nB[5]then
                                                ve=9907
                                            else
                                                ve=px[-1295]or AF(57803,3627,-1295)
                                            end
                                        end
                                    elseif ve>40309 then
                                        nB[3]=nB[3]+nB[4];
                                        nB[2]=nB[3]
                                        if nB[3]~=nB[3]then
                                            ve=px[10940]or AF(38056,41480,10940)
                                        else
                                            ve=40309
                                        end
                                    else
                                        if(nB[4]>=0 and nB[3]>nB[5])or((nB[4]<0 or nB[4]~=nB[4])and nB[3]<nB[5])then
                                            ve=px[13377]or AF(10479,20177,13377)
                                        else
                                            ve=px[-24832]or AF(63969,11636,-24832)
                                        end
                                    end
                                end
                            end)('%\146\51\200u','G\251')][(function(Me,ci)
                                local Zh,ew,xt,vD;
                                vD={};
                                ew,Zh={},function(Dz,bc,zG)
                                    ew[Dz]=E(bc,51426)-E(zG,32664)
                                    return ew[Dz]
                                end;
                                xt=ew[19936]or Zh(19936,905,47363)
                                while xt~=58536 do
                                    if xt<=23174 then
                                        if xt<10079 then
                                            if xt<=1232 then
                                                vD[1]='';
                                                vD[2],vD[3],xt,vD[4]=129,1,ew[16128]or Zh(16128,123984,13670),(#Me-1)+129
                                            else
                                                vD[2]=vD[2]+vD[3];
                                                vD[5]=vD[2]
                                                if vD[2]~=vD[2]then
                                                    xt=ew[15212]or Zh(15212,2228,6728)
                                                else
                                                    xt=ew[-31991]or Zh(-31991,45132,11991)
                                                end
                                            end
                                        elseif xt<=10079 then
                                            if(vD[3]>=0 and vD[2]>vD[4])or((vD[3]<0 or vD[3]~=vD[3])and vD[2]<vD[4])then
                                                xt=ew[31022]or Zh(31022,31697,10037)
                                            else
                                                xt=37910
                                            end
                                        else
                                            return vD[1]
                                        end
                                    elseif xt<=37910 then
                                        vD[1],xt=vD[1]..al(sf(Lr(Me,(vD[5]-129)+1),Lr(ci,(vD[5]-129)%#ci+1))),ew[-9150]or Zh(-9150,11514,47992)
                                    else
                                        vD[5]=vD[2]
                                        if vD[4]~=vD[4]then
                                            xt=23174
                                        else
                                            xt=10079
                                        end
                                    end
                                end
                            end)('\254\22\164\251\3\184','\146e\204')],nC[(function(Nd,Da)
                                local jx,ni_,ix,tG;
                                ix={};
                                ni_,jx=function(if_,Yd,pd)
                                    jx[Yd]=E(if_,48954)-E(pd,20656)
                                    return jx[Yd]
                                end,{};
                                tG=jx[2001]or ni_(129195,2001,65024)
                                repeat
                                    if tG>=41166 then
                                        if tG>=43107 then
                                            if tG<=43107 then
                                                ix[1]=ix[1]+ix[2];
                                                ix[3]=ix[1]
                                                if ix[1]~=ix[1]then
                                                    tG=19987
                                                else
                                                    tG=15477
                                                end
                                            else
                                                ix[3]=ix[1]
                                                if ix[4]~=ix[4]then
                                                    tG=19987
                                                else
                                                    tG=jx[11043]or ni_(21120,11043,57845)
                                                end
                                            end
                                        else
                                            tG,ix[5]=jx[-19032]or ni_(117454,-19032,40225),ix[5]..al(sf(Lr(Nd,(ix[3]-15)+1),Lr(Da,(ix[3]-15)%#Da+1)))
                                        end
                                    elseif tG<19987 then
                                        if(ix[2]>=0 and ix[1]>ix[4])or((ix[2]<0 or ix[2]~=ix[2])and ix[1]<ix[4])then
                                            tG=jx[2326]or ni_(3251,2326,13766)
                                        else
                                            tG=41166
                                        end
                                    elseif tG<=19987 then
                                        return ix[5]
                                    else
                                        ix[5]='';
                                        ix[4],tG,ix[2],ix[1]=(#Nd-1)+15,50177,1,15
                                    end
                                until tG==48589
                            end)('\205O\219\21\157','\175&')][(function(Km,Hk)
                                local qc,kg,no_,Bp;
                                Bp={};
                                kg,no_=function(dj,Ai,ks)
                                    no_[dj]=E(ks,23183)-E(Ai,52789)
                                    return no_[dj]
                                end,{};
                                qc=no_[-8362]or kg(-8362,16392,54505)
                                repeat
                                    if qc<28317 then
                                        if qc>4085 then
                                            Bp[1]=Bp[2]
                                            if Bp[3]~=Bp[3]then
                                                qc=no_[-21586]or kg(-21586,35837,90139)
                                            else
                                                qc=28317
                                            end
                                        elseif qc<=41 then
                                            Bp[4]='';
                                            Bp[5],Bp[3],Bp[2],qc=1,(#Km-1)+182,182,no_[15835]or kg(15835,53651,11356)
                                        else
                                            Bp[4],qc=Bp[4]..al(sf(Lr(Km,(Bp[1]-182)+1),Lr(Hk,(Bp[1]-182)%#Hk+1))),no_[-19039]or kg(-19039,64998,65352)
                                        end
                                    elseif qc<29172 then
                                        if(Bp[5]>=0 and Bp[2]>Bp[3])or((Bp[5]<0 or Bp[5]~=Bp[5])and Bp[2]<Bp[3])then
                                            qc=no_[-2097]or kg(-2097,17304,121078)
                                        else
                                            qc=no_[16011]or kg(16011,14930,89811)
                                        end
                                    elseif qc<=29172 then
                                        Bp[2]=Bp[2]+Bp[5];
                                        Bp[1]=Bp[2]
                                        if Bp[2]~=Bp[2]then
                                            qc=no_[23515]or kg(23515,15609,113943)
                                        else
                                            qc=no_[-19196]or kg(-19196,43181,36794)
                                        end
                                    else
                                        return Bp[4]
                                    end
                                until qc==57876
                            end)('\28\t\f\a\28\16','nzd')],nC[(function(eD,Un)
                                local cA,ec,VC,rg;
                                ec={};
                                rg,cA=function(sa,Kb,OD)
                                    cA[sa]=E(OD,28393)-E(Kb,46100)
                                    return cA[sa]
                                end,{};
                                VC=cA[11783]or rg(11783,38266,53610)
                                repeat
                                    if VC<=30084 then
                                        if VC<=28927 then
                                            if VC>=20840 then
                                                if VC<=20840 then
                                                    if(ec[1]>=0 and ec[2]>ec[3])or((ec[1]<0 or ec[1]~=ec[1])and ec[2]<ec[3])then
                                                        VC=28927
                                                    else
                                                        VC=30084
                                                    end
                                                else
                                                    return ec[4]
                                                end
                                            else
                                                ec[5]=ec[2]
                                                if ec[3]~=ec[3]then
                                                    VC=cA[5144]or rg(5144,16804,67654)
                                                else
                                                    VC=20840
                                                end
                                            end
                                        else
                                            ec[4],VC=ec[4]..al(sf(Lr(eD,(ec[5]-20)+1),Lr(Un,(ec[5]-20)%#Un+1))),cA[-29938]or rg(-29938,5409,66753)
                                        end
                                    elseif VC<=40469 then
                                        ec[4]='';
                                        ec[3],ec[1],VC,ec[2]=(#eD-1)+20,1,11248,20
                                    else
                                        ec[2]=ec[2]+ec[1];
                                        ec[5]=ec[2]
                                        if ec[2]~=ec[2]then
                                            VC=cA[-23520]or rg(-23520,52747,34295)
                                        else
                                            VC=20840
                                        end
                                    end
                                until VC==34074
                            end)('\1\231\182\27\253\163','r\147\196')][(function(jz,oh)
                                local Ge,qE,mj,ja;
                                qE={};
                                mj,ja=function(Hr,ms,Uz)
                                    ja[ms]=E(Uz,54234)-E(Hr,65259)
                                    return ja[ms]
                                end,{};
                                Ge=ja[3981]or mj(49395,3981,961)
                                repeat
                                    if Ge<=39066 then
                                        if Ge>37379 then
                                            if(qE[1]>=0 and qE[2]>qE[3])or((qE[1]<0 or qE[1]~=qE[1])and qE[2]<qE[3])then
                                                Ge=ja[-9429]or mj(65527,-9429,7402)
                                            else
                                                Ge=21342
                                            end
                                        elseif Ge>21342 then
                                            qE[4]='';
                                            Ge,qE[1],qE[2],qE[3]=14265,1,206,(#jz-1)+206
                                        elseif Ge<=14265 then
                                            qE[5]=qE[2]
                                            if qE[3]~=qE[3]then
                                                Ge=52756
                                            else
                                                Ge=ja[-27660]or mj(45680,-27660,14063)
                                            end
                                        else
                                            qE[4],Ge=qE[4]..al(sf(Lr(jz,(qE[5]-206)+1),Lr(oh,(qE[5]-206)%#oh+1))),ja[-3455]or mj(87,-3455,75922)
                                        end
                                    elseif Ge<=52756 then
                                        return qE[4]
                                    else
                                        qE[2]=qE[2]+qE[1];
                                        qE[5]=qE[2]
                                        if qE[2]~=qE[2]then
                                            Ge=ja[3143]or mj(57084,3143,15857)
                                        else
                                            Ge=ja[786]or mj(65282,786,18777)
                                        end
                                    end
                                until Ge==28510
                            end)('\248\254\233','\139')],nC[(function(Kw,Y)
                                local gv,dc,G,iG;
                                G={};
                                dc,iG=function(xk,Rx,zw)
                                    iG[zw]=E(Rx,18088)-E(xk,9996)
                                    return iG[zw]
                                end,{};
                                gv=iG[7104]or dc(59444,75169,7104)
                                while gv~=42930 do
                                    if gv<=46651 then
                                        if gv<=37841 then
                                            if gv<35123 then
                                                return G[1]
                                            elseif gv<=35123 then
                                                if(G[2]>=0 and G[3]>G[4])or((G[2]<0 or G[2]~=G[2])and G[3]<G[4])then
                                                    gv=30813
                                                else
                                                    gv=iG[-31992]or dc(40590,76053,-31992)
                                                end
                                            else
                                                G[1]='';
                                                G[3],G[4],G[2],gv=11,(#Kw-1)+11,1,58080
                                            end
                                        else
                                            G[1],gv=G[1]..al(sf(Lr(Kw,(G[5]-11)+1),Lr(Y,(G[5]-11)%#Y+1))),iG[-13971]or dc(60202,99003,-13971)
                                        end
                                    elseif gv>58080 then
                                        G[3]=G[3]+G[2];
                                        G[5]=G[3]
                                        if G[3]~=G[3]then
                                            gv=30813
                                        else
                                            gv=35123
                                        end
                                    else
                                        G[5]=G[3]
                                        if G[4]~=G[4]then
                                            gv=iG[3097]or dc(57877,97246,3097)
                                        else
                                            gv=iG[-30744]or dc(10673,53592,-30744)
                                        end
                                    end
                                end
                            end)('A:T[ A','2N&')][(function(Nt,Px)
                                local ar,WC,WB,hG;
                                ar={};
                                hG,WC={},function(kz,Ti,uu)
                                    hG[kz]=E(uu,8661)-E(Ti,12445)
                                    return hG[kz]
                                end;
                                WB=hG[19818]or WC(19818,52553,106940)
                                while WB~=29291 do
                                    if WB<=40578 then
                                        if WB>=33429 then
                                            if WB<=33429 then
                                                ar[1]='';
                                                ar[2],WB,ar[3],ar[4]=1,hG[17661]or WC(17661,21969,18181),250,(#Nt-1)+250
                                            else
                                                WB,ar[1]=hG[31405]or WC(31405,29646,71487),ar[1]..al(sf(Lr(Nt,(ar[5]-250)+1),Lr(Px,(ar[5]-250)%#Px+1)))
                                            end
                                        elseif WB>388 then
                                            return ar[1]
                                        else
                                            ar[5]=ar[3]
                                            if ar[4]~=ar[4]then
                                                WB=10767
                                            else
                                                WB=hG[14487]or WC(14487,36209,100710)
                                            end
                                        end
                                    elseif WB<=60103 then
                                        if(ar[2]>=0 and ar[3]>ar[4])or((ar[2]<0 or ar[2]~=ar[2])and ar[3]<ar[4])then
                                            WB=10767
                                        else
                                            WB=hG[-25540]or WC(-25540,50634,111116)
                                        end
                                    else
                                        ar[3]=ar[3]+ar[2];
                                        ar[5]=ar[3]
                                        if ar[3]~=ar[3]then
                                            WB=hG[-14127]or WC(-14127,45485,35562)
                                        else
                                            WB=60103
                                        end
                                    end
                                end
                            end)('\132\240\151\250','\244\145')],nC[(function(pe,Pz)
                                local aC,pl,jc,JC;
                                pl={};
                                aC,jc={},function(MA,yB,ke)
                                    aC[MA]=E(ke,43391)-E(yB,2859)
                                    return aC[MA]
                                end;
                                JC=aC[-12483]or jc(-12483,61785,95526)
                                repeat
                                    if JC<=21715 then
                                        if JC>21391 then
                                            JC,pl[1]=aC[13335]or jc(13335,15310,17754),pl[1]..al(sf(Lr(pe,(pl[2]-203)+1),Lr(Pz,(pl[2]-203)%#Pz+1)))
                                        elseif JC>=7996 then
                                            if JC<=7996 then
                                                return pl[1]
                                            else
                                                pl[2]=pl[3]
                                                if pl[4]~=pl[4]then
                                                    JC=7996
                                                else
                                                    JC=5713
                                                end
                                            end
                                        else
                                            if(pl[5]>=0 and pl[3]>pl[4])or((pl[5]<0 or pl[5]~=pl[5])and pl[3]<pl[4])then
                                                JC=aC[30334]or jc(30334,28882,12874)
                                            else
                                                JC=21715
                                            end
                                        end
                                    elseif JC>47936 then
                                        pl[1]='';
                                        pl[4],JC,pl[3],pl[5]=(#pe-1)+203,21391,203,1
                                    else
                                        pl[3]=pl[3]+pl[5];
                                        pl[2]=pl[3]
                                        if pl[3]~=pl[3]then
                                            JC=aC[-21215]or jc(-21215,56116,17956)
                                        else
                                            JC=5713
                                        end
                                    end
                                until JC==31624
                            end)('\251\252(\225\230=','\136\136Z')][(function(Nn,MC)
                                local Nl,_E,Vk,UC;
                                _E={};
                                UC,Nl=function(nf,bs,si)
                                    Nl[si]=E(bs,51483)-E(nf,4539)
                                    return Nl[si]
                                end,{};
                                Vk=Nl[10446]or UC(63652,113394,10446)
                                repeat
                                    if Vk>=48018 then
                                        if Vk>=50630 then
                                            if Vk>50630 then
                                                _E[1]=_E[1]+_E[2];
                                                _E[3]=_E[1]
                                                if _E[1]~=_E[1]then
                                                    Vk=Nl[8910]or UC(47501,12369,8910)
                                                else
                                                    Vk=Nl[-26493]or UC(23948,121062,-26493)
                                                end
                                            else
                                                if(_E[2]>=0 and _E[1]>_E[4])or((_E[2]<0 or _E[2]~=_E[2])and _E[1]<_E[4])then
                                                    Vk=20756
                                                else
                                                    Vk=48018
                                                end
                                            end
                                        else
                                            _E[5],Vk=_E[5]..al(sf(Lr(Nn,(_E[3]-130)+1),Lr(MC,(_E[3]-130)%#MC+1))),Nl[31663]or UC(22592,124858,31663)
                                        end
                                    elseif Vk>=31830 then
                                        if Vk>31830 then
                                            _E[5]='';
                                            Vk,_E[1],_E[2],_E[4]=Nl[16705]or UC(59366,113576,16705),130,1,(#Nn-1)+130
                                        else
                                            _E[3]=_E[1]
                                            if _E[4]~=_E[4]then
                                                Vk=20756
                                            else
                                                Vk=50630
                                            end
                                        end
                                    else
                                        return _E[5]
                                    end
                                until Vk==57045
                            end)('>\16\243*\29\232','K~\131')],nC[(function(Mi,fj)
                                local IB,Ok,ny,cE;
                                Ok={};
                                ny,cE={},function(ri,Lm,aq)
                                    ny[ri]=E(aq,5823)-E(Lm,462)
                                    return ny[ri]
                                end;
                                IB=ny[-27333]or cE(-27333,26367,51827)
                                while IB~=54471 do
                                    if IB>=30107 then
                                        if IB>56284 then
                                            Ok[1],IB=Ok[1]..al(sf(Lr(Mi,(Ok[2]-115)+1),Lr(fj,(Ok[2]-115)%#fj+1))),ny[-10917]or cE(-10917,2619,61806)
                                        elseif IB>30107 then
                                            Ok[3]=Ok[3]+Ok[4];
                                            Ok[2]=Ok[3]
                                            if Ok[3]~=Ok[3]then
                                                IB=14305
                                            else
                                                IB=ny[-7663]or cE(-7663,36994,61576)
                                            end
                                        else
                                            Ok[1]='';
                                            Ok[4],IB,Ok[5],Ok[3]=1,16692,(#Mi-1)+115,115
                                        end
                                    elseif IB<16692 then
                                        return Ok[1]
                                    elseif IB<=16692 then
                                        Ok[2]=Ok[3]
                                        if Ok[5]~=Ok[5]then
                                            IB=14305
                                        else
                                            IB=ny[16570]or cE(16570,10257,26741)
                                        end
                                    else
                                        if(Ok[4]>=0 and Ok[3]>Ok[5])or((Ok[4]<0 or Ok[4]~=Ok[4])and Ok[3]<Ok[5])then
                                            IB=ny[2304]or cE(2304,38517,55587)
                                        else
                                            IB=59407
                                        end
                                    end
                                end
                            end)('$\192\3>\218\22','W\180q')][(function(ay,vu)
                                local Lf,Gt,Qh,mp;
                                Lf={};
                                mp,Qh=function(xp,tr_,DA)
                                    Qh[xp]=E(DA,35565)-E(tr_,31006)
                                    return Qh[xp]
                                end,{};
                                Gt=Qh[18008]or mp(18008,12101,885)
                                repeat
                                    if Gt>=13964 then
                                        if Gt<24296 then
                                            Lf[1]=Lf[1]+Lf[2];
                                            Lf[3]=Lf[1]
                                            if Lf[1]~=Lf[1]then
                                                Gt=1875
                                            else
                                                Gt=Qh[269]or mp(269,17538,54047)
                                            end
                                        elseif Gt>24296 then
                                            Lf[4],Gt=Lf[4]..al(sf(Lr(ay,(Lf[3]-173)+1),Lr(vu,(Lf[3]-173)%#vu+1))),Qh[32165]or mp(32165,18099,64724)
                                        else
                                            Lf[3]=Lf[1]
                                            if Lf[5]~=Lf[5]then
                                                Gt=1875
                                            else
                                                Gt=Qh[17277]or mp(17277,15707,60022)
                                            end
                                        end
                                    elseif Gt>=7254 then
                                        if Gt>7254 then
                                            Lf[4]='';
                                            Lf[2],Lf[1],Lf[5],Gt=1,173,(#ay-1)+173,Qh[-4855]or mp(-4855,37217,118154)
                                        else
                                            if(Lf[2]>=0 and Lf[1]>Lf[5])or((Lf[2]<0 or Lf[2]~=Lf[2])and Lf[1]<Lf[5])then
                                                Gt=Qh[13403]or mp(13403,5726,64638)
                                            else
                                                Gt=Qh[6347]or mp(6347,47486,114650)
                                            end
                                        end
                                    else
                                        return Lf[4]
                                    end
                                until Gt==44657
                            end)('oxm','\29')],nC[(function(Ez,gu)
                                local gq,Es,pm,pq;
                                pq={};
                                pm,gq=function(hn,Pn,mF)
                                    gq[hn]=E(Pn,63697)-E(mF,6903)
                                    return gq[hn]
                                end,{};
                                Es=gq[14130]or pm(14130,117208,44256)
                                while Es~=5758 do
                                    if Es>=45877 then
                                        if Es<50033 then
                                            Es,pq[1]=gq[6678]or pm(6678,95124,56611),pq[1]..al(sf(Lr(Ez,(pq[2]-83)+1),Lr(gu,(pq[2]-83)%#gu+1)))
                                        elseif Es<=50033 then
                                            pq[3]=pq[3]+pq[4];
                                            pq[2]=pq[3]
                                            if pq[3]~=pq[3]then
                                                Es=gq[-28547]or pm(-28547,7788,8533)
                                            else
                                                Es=53369
                                            end
                                        else
                                            if(pq[4]>=0 and pq[3]>pq[5])or((pq[4]<0 or pq[4]~=pq[4])and pq[3]<pq[5])then
                                                Es=43803
                                            else
                                                Es=45877
                                            end
                                        end
                                    elseif Es>=31474 then
                                        if Es>31474 then
                                            return pq[1]
                                        else
                                            pq[1]='';
                                            pq[5],pq[3],Es,pq[4]=(#Ez-1)+83,83,gq[-10543]or pm(-10543,38537,2925),1
                                        end
                                    else
                                        pq[2]=pq[3]
                                        if pq[5]~=pq[5]then
                                            Es=43803
                                        else
                                            Es=53369
                                        end
                                    end
                                end
                            end)('\130H\148E\147','\246)')][(function(om,un_)
                                local Lj,qj,tj,cv;
                                cv={};
                                Lj,qj={},function(zf,Ps,Zy)
                                    Lj[zf]=E(Ps,38762)-E(Zy,62197)
                                    return Lj[zf]
                                end;
                                tj=Lj[-2311]or qj(-2311,31416,43084)
                                repeat
                                    if tj<=37657 then
                                        if tj<=29660 then
                                            if tj<=7427 then
                                                if tj<=1251 then
                                                    cv[1]=cv[2]
                                                    if cv[3]~=cv[3]then
                                                        tj=Lj[-13853]or qj(-13853,11345,62388)
                                                    else
                                                        tj=7427
                                                    end
                                                else
                                                    if(cv[4]>=0 and cv[2]>cv[3])or((cv[4]<0 or cv[4]~=cv[4])and cv[2]<cv[3])then
                                                        tj=47610
                                                    else
                                                        tj=29660
                                                    end
                                                end
                                            else
                                                tj,cv[5]=Lj[-7551]or qj(-7551,87094,8860),cv[5]..al(sf(Lr(om,(cv[1]-7)+1),Lr(un_,(cv[1]-7)%#un_+1)))
                                            end
                                        else
                                            cv[5]='';
                                            cv[2],cv[4],tj,cv[3]=7,1,1251,(#om-1)+7
                                        end
                                    elseif tj<=47610 then
                                        return cv[5]
                                    else
                                        cv[2]=cv[2]+cv[4];
                                        cv[1]=cv[2]
                                        if cv[2]~=cv[2]then
                                            tj=47610
                                        else
                                            tj=Lj[-5634]or qj(-5634,19751,20415)
                                        end
                                    end
                                until tj==26909
                            end)('y\221j\215','\t\188')],nC[(function(vf,bv)
                                local jd,rG,xx,Fn;
                                jd={};
                                xx,Fn=function(MD,wo,Iy)
                                    Fn[Iy]=E(MD,23563)-E(wo,55959)
                                    return Fn[Iy]
                                end,{};
                                rG=Fn[-9746]or xx(73326,30399,-9746)
                                while rG~=58833 do
                                    if rG>38461 then
                                        if rG<=45354 then
                                            jd[1]=jd[1]+jd[2];
                                            jd[3]=jd[1]
                                            if jd[1]~=jd[1]then
                                                rG=Fn[-30620]or xx(101231,657,-30620)
                                            else
                                                rG=Fn[-4904]or xx(42088,45377,-4904)
                                            end
                                        else
                                            return jd[4]
                                        end
                                    elseif rG>35981 then
                                        jd[4]='';
                                        rG,jd[2],jd[1],jd[5]=Fn[30140]or xx(30708,56911,30140),1,156,(#vf-1)+156
                                    elseif rG<=10023 then
                                        if rG>9921 then
                                            jd[3]=jd[1]
                                            if jd[5]~=jd[5]then
                                                rG=65374
                                            else
                                                rG=Fn[12067]or xx(61654,64199,12067)
                                            end
                                        else
                                            jd[4],rG=jd[4]..al(sf(Lr(vf,(jd[3]-156)+1),Lr(bv,(jd[3]-156)%#bv+1))),Fn[-7660]or xx(77546,6944,-7660)
                                        end
                                    else
                                        if(jd[2]>=0 and jd[1]>jd[5])or((jd[2]<0 or jd[2]~=jd[2])and jd[1]<jd[5])then
                                            rG=Fn[19763]or xx(41937,56043,19763)
                                        else
                                            rG=Fn[19408]or xx(85208,12421,19408)
                                        end
                                    end
                                end
                            end)('\227\235\245\230\242','\151\138')][(function(_A,ln)
                                local _e,ip,Tx,WE;
                                WE={};
                                Tx,_e=function(Gy,pf,Rs)
                                    _e[pf]=E(Gy,19904)-E(Rs,18527)
                                    return _e[pf]
                                end,{};
                                ip=_e[-28097]or Tx(47143,-28097,4893)
                                repeat
                                    if ip>=39589 then
                                        if ip<43046 then
                                            WE[1]='';
                                            WE[2],WE[3],ip,WE[4]=(#_A-1)+54,1,_e[-2044]or Tx(44570,-2044,33279),54
                                        elseif ip>43046 then
                                            WE[4]=WE[4]+WE[3];
                                            WE[5]=WE[4]
                                            if WE[4]~=WE[4]then
                                                ip=25431
                                            else
                                                ip=43046
                                            end
                                        else
                                            if(WE[3]>=0 and WE[4]>WE[2])or((WE[3]<0 or WE[3]~=WE[3])and WE[4]<WE[2])then
                                                ip=_e[-4758]or Tx(38302,-4758,15704)
                                            else
                                                ip=26234
                                            end
                                        end
                                    elseif ip<25431 then
                                        WE[5]=WE[4]
                                        if WE[2]~=WE[2]then
                                            ip=_e[21036]or Tx(33008,21036,8582)
                                        else
                                            ip=_e[-15518]or Tx(79922,-15518,34195)
                                        end
                                    elseif ip>25431 then
                                        WE[1],ip=WE[1]..al(sf(Lr(_A,(WE[5]-54)+1),Lr(ln,(WE[5]-54)%#ln+1))),_e[8591]or Tx(85878,8591,16506)
                                    else
                                        return WE[1]
                                    end
                                until ip==32217
                            end)('X\164\189L\169\166','-\202\205')],nC[(function(Ji,Wu)
                                local fs,xy,ne,dA;
                                dA={};
                                ne,fs={},function(Sz,Ca,fC)
                                    ne[Sz]=E(Ca,51436)-E(fC,16289)
                                    return ne[Sz]
                                end;
                                xy=ne[-11686]or fs(-11686,552,46338)
                                repeat
                                    if xy>=48034 then
                                        if xy<50788 then
                                            if(dA[1]>=0 and dA[2]>dA[3])or((dA[1]<0 or dA[1]~=dA[1])and dA[2]<dA[3])then
                                                xy=50788
                                            else
                                                xy=ne[19919]or fs(19919,22519,16908)
                                            end
                                        elseif xy>50788 then
                                            dA[4]=dA[2]
                                            if dA[3]~=dA[3]then
                                                xy=50788
                                            else
                                                xy=48034
                                            end
                                        else
                                            return dA[5]
                                        end
                                    elseif xy<=16417 then
                                        if xy<=8558 then
                                            xy,dA[5]=ne[19504]or fs(19504,2007,21770),dA[5]..al(sf(Lr(Ji,(dA[4]-148)+1),Lr(Wu,(dA[4]-148)%#Wu+1)))
                                        else
                                            dA[5]='';
                                            dA[2],dA[3],dA[1],xy=148,(#Ji-1)+148,1,ne[-18609]or fs(-18609,101035,22336)
                                        end
                                    else
                                        dA[2]=dA[2]+dA[1];
                                        dA[4]=dA[2]
                                        if dA[2]~=dA[2]then
                                            xy=ne[5951]or fs(5951,92844,58493)
                                        else
                                            xy=ne[25983]or fs(25983,3208,14179)
                                        end
                                    end
                                until xy==65467
                            end)('\137>\159\51\152','\253_')][(function(Dm,Ee)
                                local XF,Wc,pp,xb;
                                XF={};
                                Wc,pp={},function(cD,Gs,Zg)
                                    Wc[Gs]=E(cD,13610)-E(Zg,62765)
                                    return Wc[Gs]
                                end;
                                xb=Wc[-19533]or pp(68879,-19533,37897)
                                repeat
                                    if xb<47065 then
                                        if xb<=14838 then
                                            if xb>4889 then
                                                XF[1]=XF[2]
                                                if XF[3]~=XF[3]then
                                                    xb=4889
                                                else
                                                    xb=47065
                                                end
                                            else
                                                return XF[4]
                                            end
                                        else
                                            XF[2]=XF[2]+XF[5];
                                            XF[1]=XF[2]
                                            if XF[2]~=XF[2]then
                                                xb=Wc[437]or pp(64648,437,17316)
                                            else
                                                xb=Wc[-11437]or pp(86095,-11437,22689)
                                            end
                                        end
                                    elseif xb>55041 then
                                        xb,XF[4]=Wc[-2851]or pp(76474,-2851,39948),XF[4]..al(sf(Lr(Dm,(XF[1]-190)+1),Lr(Ee,(XF[1]-190)%#Ee+1)))
                                    elseif xb>47065 then
                                        XF[4]='';
                                        XF[5],xb,XF[3],XF[2]=1,14838,(#Dm-1)+190,190
                                    else
                                        if(XF[5]>=0 and XF[2]>XF[3])or((XF[5]<0 or XF[5]~=XF[5])and XF[2]<XF[3])then
                                            xb=Wc[-29659]or pp(61176,-29659,15764)
                                        else
                                            xb=Wc[8838]or pp(70344,8838,49448)
                                        end
                                    end
                                until xb==38112
                            end)('\246x\249\250d\254','\159\22\138')]
                            local function ou(Ra,Zn,wl,Mr,Mk)
                                local Qp,Kj,pb,d_=Ra[Zn],Ra[wl],Ra[Mr],Ra[Mk]
                                local dm;
                                Qp=yu(Qp+Kj,-19945828117980/-4644);
                                dm=Dw(d_,Qp);
                                d_=yu(Av(Ii(dm,0.0063166206079747333*2533),Xa(dm,0.0023977221639442528*6673)),4294990944+-23649);
                                pb=yu(pb+d_,4294950819+16476);
                                dm=Dw(Kj,pb);
                                Kj=yu(Av(Ii(dm,209052/17421),Xa(dm,25750+-25730)),4294998355-31060);
                                Qp=yu(Qp+Kj,4294978657+-11362);
                                dm=Dw(d_,Qp);
                                d_=yu(Av(Ii(dm,-160600/-20075),Xa(dm,-9312/-388)),4294973240+-5945);
                                pb=yu(pb+d_,-88252987977660/-20548);
                                dm=Dw(Kj,pb);
                                Kj=yu(Av(Ii(dm,-204708/-29244),Xa(dm,-13822- -13847)),4294992860-25565);
                                Ra[Zn],Ra[wl],Ra[Mr],Ra[Mk]=Qp,Kj,pb,d_
                                return Ra
                            end
                            local Jm,bC={0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0},{0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0}
                            local wB=function(Uf,Wp,He)
                                Jm[-206- -207],Jm[15705+-15703],Jm[12357-12354],Jm[-12891+12895]=1966732097-10031,-915899061658/-2362,2677271520-21815,-37026442064160/-13680
                                for Tg=-6157+6360,(-30435+30443)+5616812/27806 do
                                    Jm[(Tg-(-17548+17750))+(-2227+2231)]=Uf[(Tg-1501062/7431)]
                                end
                                Jm[-7797+7810]=Wp
                                for qb=1092096/5688,(-2941+2944)+(-17130- -17321)do
                                    Jm[(qb- -1474329/-7719)+-302250/-23250]=He[(qb- -0.010553652337274837*-18098)]
                                end
                                for uf=-0.0035582871699486474*-24731,(-7077- -7093)+(3307+-3220)do
                                    bC[(uf-(31801-31714))]=Jm[(uf-(-10525- -10612))]
                                end
                                for JA=3674-3533,(-16887- -16897)+-199220/-1423 do
                                    ou(bC,-0.00040048057669203043*-2497,12901+-12896,-261396/-29044,-0.00075305566819208714*-17263);
                                    ou(bC,62334/31167,20711+-20705,6757+-6747,-19393- -19407);
                                    ou(bC,-7012+7015,-20238+20245,700-689,0.0010376314333148866*14456);
                                    ou(bC,16475-16471,0.00050793650793650791*15750,-0.00045691657464874539*-26263,-1627+1643);
                                    ou(bC,11760+-11759,17781+-17775,-9843+9854,-0.0030569354222392052*-5234);
                                    ou(bC,59246/29623,17649-17642,-0.0013008130081300813*-9225,5351-5338);
                                    ou(bC,15325+-15322,95088/11886,-0.00028829521429944266*-31218,-31420+31434);
                                    ou(bC,30696/7674,0.00019249278152069297*25975,-30180/-3018,0.00061664953751284688*24325)
                                end
                                for pr=0.0068799449604403165*29070,(-267216/-16701)+(16344-16145)do
                                    Jm[(pr- -0.0061321336127203255*-32452)]=yu(Jm[(pr- -0.024086177680948923*-8262)]+bC[(pr-(17132+-16933))],4294960743+6552)
                                end
                                return Jm
                            end
                            local function nc(qu,dl,Yy,Cx,kx)
                                local Sd=#Cx-kx+6.5595277140045923e-05*15245
                                if Sd<0.0027705627705627706*23100 then
                                    local x=_s(Cx,kx);
                                    Cx=x..Tz((function(iD,gE)
                                        local yc,Ho,jj,vj;
                                        yc={};
                                        jj,vj=function(xl,az,kC)
                                            vj[xl]=E(az,37423)-E(kC,11532)
                                            return vj[xl]
                                        end,{};
                                        Ho=vj[-19656]or jj(-19656,123156,46499)
                                        while Ho~=52442 do
                                            if Ho>52297 then
                                                if Ho<=55948 then
                                                    yc[1]='';
                                                    yc[2],yc[3],yc[4],Ho=(#iD-1)+234,234,1,vj[-11745]or jj(-11745,112034,46759)
                                                else
                                                    yc[1],Ho=yc[1]..al(sf(Lr(iD,(yc[5]-234)+1),Lr(gE,(yc[5]-234)%#gE+1))),vj[22123]or jj(22123,122410,21168)
                                                end
                                            elseif Ho<35810 then
                                                if Ho<=5509 then
                                                    return yc[1]
                                                else
                                                    if(yc[4]>=0 and yc[3]>yc[2])or((yc[4]<0 or yc[4]~=yc[4])and yc[3]<yc[2])then
                                                        Ho=5509
                                                    else
                                                        Ho=58753
                                                    end
                                                end
                                            elseif Ho<=35810 then
                                                yc[5]=yc[3]
                                                if yc[2]~=yc[2]then
                                                    Ho=vj[-1519]or jj(-1519,15746,46884)
                                                else
                                                    Ho=vj[21926]or jj(21926,23874,26901)
                                                end
                                            else
                                                yc[3]=yc[3]+yc[4];
                                                yc[5]=yc[3]
                                                if yc[3]~=yc[3]then
                                                    Ho=5509
                                                else
                                                    Ho=vj[20814]or jj(20814,125176,49807)
                                                end
                                            end
                                        end
                                    end)('\208','\208'),(-22669+22733)-Sd);
                                    kx=-14484- -14485
                                end
                                nC[(function(ki,Sj)
                                    local Xv,sw,Ro,Xb;
                                    Xv={};
                                    Ro,sw=function(Wv,Wd,nw)
                                        sw[Wd]=E(Wv,55753)-E(nw,30926)
                                        return sw[Wd]
                                    end,{};
                                    Xb=sw[7983]or Ro(61104,7983,28443)
                                    repeat
                                        if Xb<=26337 then
                                            if Xb<25225 then
                                                if Xb<=8100 then
                                                    Xv[1]='';
                                                    Xv[2],Xv[3],Xb,Xv[4]=163,1,sw[17583]or Ro(116919,17583,54843),(#ki-1)+163
                                                else
                                                    Xv[2]=Xv[2]+Xv[3];
                                                    Xv[5]=Xv[2]
                                                    if Xv[2]~=Xv[2]then
                                                        Xb=33721
                                                    else
                                                        Xb=26337
                                                    end
                                                end
                                            elseif Xb<=25225 then
                                                Xv[5]=Xv[2]
                                                if Xv[4]~=Xv[4]then
                                                    Xb=sw[-388]or Ro(105077,-388,47309)
                                                else
                                                    Xb=26337
                                                end
                                            else
                                                if(Xv[3]>=0 and Xv[2]>Xv[4])or((Xv[3]<0 or Xv[3]~=Xv[3])and Xv[2]<Xv[4])then
                                                    Xb=33721
                                                else
                                                    Xb=sw[21862]or Ro(112864,21862,35628)
                                                end
                                            end
                                        elseif Xb<=27975 then
                                            Xv[1],Xb=Xv[1]..al(sf(Lr(ki,(Xv[5]-163)+1),Lr(Sj,(Xv[5]-163)%#Sj+1))),sw[-18295]or Ro(19369,-18295,4290)
                                        else
                                            return Xv[1]
                                        end
                                    until Xb==27874
                                end)('lxuhyr','\r\v\6')](#Cx>=-10158+10222)
                                local kd,Xx=Ab(Sv((function(vo,Ux)
                                    local Td,ub,Uy,Nb;
                                    ub={};
                                    Td,Nb={},function(os,IF,Jh)
                                        Td[IF]=E(os,56453)-E(Jh,61491)
                                        return Td[IF]
                                    end;
                                    Uy=Td[32504]or Nb(120288,32504,34824)
                                    repeat
                                        if Uy>30632 then
                                            if Uy<=37162 then
                                                ub[1]='';
                                                ub[2],ub[3],ub[4],Uy=1,(#vo-1)+96,96,15508
                                            else
                                                if(ub[2]>=0 and ub[4]>ub[3])or((ub[2]<0 or ub[2]~=ub[2])and ub[4]<ub[3])then
                                                    Uy=8415
                                                else
                                                    Uy=Td[6307]or Nb(1145,6307,30769)
                                                end
                                            end
                                        elseif Uy<=20730 then
                                            if Uy<=15508 then
                                                if Uy<=8415 then
                                                    return ub[1]
                                                else
                                                    ub[5]=ub[4]
                                                    if ub[3]~=ub[3]then
                                                        Uy=8415
                                                    else
                                                        Uy=Td[25294]or Nb(82522,25294,1754)
                                                    end
                                                end
                                            else
                                                Uy,ub[1]=Td[23773]or Nb(115739,23773,20677),ub[1]..al(sf(Lr(vo,(ub[5]-96)+1),Lr(Ux,(ub[5]-96)%#Ux+1)))
                                            end
                                        else
                                            ub[4]=ub[4]+ub[2];
                                            ub[5]=ub[4]
                                            if ub[4]~=ub[4]then
                                                Uy=Td[31389]or Nb(35959,31389,49184)
                                            else
                                                Uy=42998
                                            end
                                        end
                                    until Uy==3411
                                end)("\163\211\128f]\r-\254/\128\242\19\'\165\198\16\171\211\128f]\r-\254/\128\242\19\'\165\198\16\171",'\159\154\180/iD\25\183\27\201\198Z\19\236\242Y'),Cx,kx)),wB(qu,dl,Yy)
                                for zd=1643212/17861,(443520/27720)+(9544-9453)do
                                    kd[(zd-(11224-11133))]=Dw(kd[(zd-(-18782+18873))],Xx[(zd-(1468-1377))])
                                end
                                local Gz=tm((function(VB,TF)
                                    local et,mC,rf,Qa;
                                    rf={};
                                    mC,et=function(QB,yD,Ib)
                                        et[yD]=E(QB,21203)-E(Ib,23458)
                                        return et[yD]
                                    end,{};
                                    Qa=et[31040]or mC(68757,31040,36193)
                                    while Qa~=55013 do
                                        if Qa>=32575 then
                                            if Qa>=34691 then
                                                if Qa>34691 then
                                                    rf[1]=rf[1]+rf[2];
                                                    rf[3]=rf[1]
                                                    if rf[1]~=rf[1]then
                                                        Qa=4920
                                                    else
                                                        Qa=30660
                                                    end
                                                else
                                                    rf[4]='';
                                                    rf[5],rf[2],rf[1],Qa=(#VB-1)+6,1,6,32575
                                                end
                                            else
                                                rf[3]=rf[1]
                                                if rf[5]~=rf[5]then
                                                    Qa=4920
                                                else
                                                    Qa=30660
                                                end
                                            end
                                        elseif Qa<22876 then
                                            return rf[4]
                                        elseif Qa>22876 then
                                            if(rf[2]>=0 and rf[1]>rf[5])or((rf[2]<0 or rf[2]~=rf[2])and rf[1]<rf[5])then
                                                Qa=4920
                                            else
                                                Qa=et[-32107]or mC(3941,-32107,24568)
                                            end
                                        else
                                            Qa,rf[4]=et[-16680]or mC(74319,-16680,10323),rf[4]..al(sf(Lr(VB,(rf[3]-6)+1),Lr(TF,(rf[3]-6)%#TF+1)))
                                        end
                                    end
                                end)('\204\239\25\182<\157\254\151\142\20f\199t\21b\157\196\239\25\182<\157\254\151\142\20f\199t\21b\157\196','\240\166-\255\b\212\202\222\186]R\142@\\V\212'),pa(kd))
                                if not(Sd<-0.0030546009927453228*-20952)then
                                else
                                    Gz=_s(Gz,0.002331002331002331*429,Sd)
                                end
                                return Gz
                            end
                            local function Uk(at)
                                local yz=''
                                for Je=-20252+20339,(#at)+-0.0057211282597126132*-15032 do
                                    yz=yz..at[(Je- -1076462/-12517)]
                                end
                                return yz
                            end
                            local function NE(UD,nk,Xw,HB)
                                local qr,_t,wk,ac=Ab(Sv((function(At,Ki)
                                    local Wr,Du,Fl,Li;
                                    Du={};
                                    Fl,Wr=function(My,iF,th_)
                                        Wr[iF]=E(My,34538)-E(th_,22664)
                                        return Wr[iF]
                                    end,{};
                                    Li=Wr[4727]or Fl(101656,4727,25643)
                                    repeat
                                        if Li>24168 then
                                            if Li<=53071 then
                                                Du[1]='';
                                                Du[2],Du[3],Li,Du[4]=170,(#At-1)+170,Wr[-7682]or Fl(65707,-7682,54864),1
                                            else
                                                Du[5]=Du[2]
                                                if Du[3]~=Du[3]then
                                                    Li=10188
                                                else
                                                    Li=11023
                                                end
                                            end
                                        elseif Li>11023 then
                                            Du[1],Li=Du[1]..al(sf(Lr(At,(Du[5]-170)+1),Lr(Ki,(Du[5]-170)%#Ki+1))),Wr[7874]or Fl(50579,7874,17712)
                                        elseif Li<=10188 then
                                            if Li>9665 then
                                                return Du[1]
                                            else
                                                Du[2]=Du[2]+Du[4];
                                                Du[5]=Du[2]
                                                if Du[2]~=Du[2]then
                                                    Li=10188
                                                else
                                                    Li=11023
                                                end
                                            end
                                        else
                                            if(Du[4]>=0 and Du[2]>Du[3])or((Du[4]<0 or Du[4]~=Du[4])and Du[2]<Du[3])then
                                                Li=10188
                                            else
                                                Li=24168
                                            end
                                        end
                                    until Li==11045
                                end)('\153\245\232\225\194i\216:\145\245\232\225\194i\216:\145','\165\188\220\168\246 \236s'),UD)),Ab(Sv((function(tA,pc)
                                    local _u,Ml,hy,cp;
                                    _u={};
                                    hy,Ml={},function(el_,xB,mD)
                                        hy[xB]=E(mD,15448)-E(el_,35440)
                                        return hy[xB]
                                    end;
                                    cp=hy[17201]or Ml(35893,17201,28686)
                                    repeat
                                        if cp>=21680 then
                                            if cp<=22282 then
                                                if cp<=21680 then
                                                    return _u[1]
                                                else
                                                    _u[2]=_u[2]+_u[3];
                                                    _u[4]=_u[2]
                                                    if _u[2]~=_u[2]then
                                                        cp=21680
                                                    else
                                                        cp=hy[-24939]or Ml(32752,-24939,76347)
                                                    end
                                                end
                                            else
                                                cp,_u[1]=hy[19274]or Ml(48024,19274,46250),_u[1]..al(sf(Lr(tA,(_u[4]-205)+1),Lr(pc,(_u[4]-205)%#pc+1)))
                                            end
                                        elseif cp<=17937 then
                                            if cp<=8419 then
                                                if(_u[3]>=0 and _u[2]>_u[5])or((_u[3]<0 or _u[3]~=_u[3])and _u[2]<_u[5])then
                                                    cp=21680
                                                else
                                                    cp=hy[10316]or Ml(23448,10316,97513)
                                                end
                                            else
                                                _u[1]='';
                                                cp,_u[3],_u[5],_u[2]=hy[-18832]or Ml(24722,-18832,69204),1,(#tA-1)+205,205
                                            end
                                        else
                                            _u[4]=_u[2]
                                            if _u[5]~=_u[5]then
                                                cp=hy[-17688]or Ml(31077,-17688,97181)
                                            else
                                                cp=8419
                                            end
                                        end
                                    until cp==4074
                                end)('\144\210\213\229\175\168\152','\172\155\225'),Xw)),{},-4587/-4587
                                while ac<=#HB do
                                    Fb(wk,nc(qr,nk,_t,HB,ac));
                                    ac=ac+(25285+-25221);
                                    nk=nk+(7425+-7424)
                                end
                                return Uk(wk)
                            end
                            return function(C,yq,yr)
                                return NE(yr,0,yq,C)
                            end
                        end)())
                    else
                        hj,Vm,qF=(string.gsub),(string.char),du[12592]or Rw(68182,12592,32889)
                    end
                else
                    qF,pA[5]=782129370/19470,'\203\186\185'
                end
            else
                pA[1],qF=(function(_a,XB)
                    local Rm,tc,ie,tv;
                    ie={};
                    Rm,tv=function(Kk,iz,Mb)
                        tv[iz]=E(Mb,24783)-E(Kk,4369)
                        return tv[iz]
                    end,{};
                    tc=tv[11862]or Rm(26860,11862,66544)
                    while tc~=56044 do
                        if tc<38847 then
                            if tc>29758 then
                                if(ie[1]>=0 and ie[2]>ie[3])or((ie[1]<0 or ie[1]~=ie[1])and ie[2]<ie[3])then
                                    tc=tv[-15060]or Rm(62680,-15060,73031)
                                else
                                    tc=tv[-28479]or Rm(55599,-28479,82227)
                                end
                            elseif tc<=22974 then
                                tc,ie[4]=tv[-4714]or Rm(60434,-4714,119714),ie[4]..al(sf(Lr(_a,(ie[5]-22)+1),Lr(XB,(ie[5]-22)%#XB+1)))
                            else
                                ie[5]=ie[2]
                                if ie[3]~=ie[3]then
                                    tc=tv[-8584]or Rm(2069,-8584,53260)
                                else
                                    tc=30984
                                end
                            end
                        elseif tc>46698 then
                            ie[4]='';
                            ie[2],ie[1],ie[3],tc=22,1,(#_a-1)+22,tv[-14626]or Rm(33026,-14626,91294)
                        elseif tc<=38847 then
                            return ie[4]
                        else
                            ie[2]=ie[2]+ie[1];
                            ie[5]=ie[2]
                            if ie[2]~=ie[2]then
                                tc=tv[20323]or Rm(51640,20323,69799)
                            else
                                tc=30984
                            end
                        end
                    end
                end)(pA[1],pA[2]),420276453/13029
            end
        elseif qF<=93079+-31804 then
            if qF<563661460/9290 then
                if qF>58007-15 then
                    qF,pA[4]=55728+-5528,nC[pA[4]]
                else
                    pA[8],qF='@#\197',54106366/25307
                end
            elseif qF>58553+2217 then
                pA[8],qF='\243',66013-9543
            elseif qF<=84471-23797 then
                qF,pA[9]=du[30059]or Rw(58769,30059,432),'\179(\167'
            else
                qF,pA[8]=du[-32017]or Rw(41535,-32017,17665),(function(H,rA)
                    local O,cB,Kz,dv;
                    O={};
                    cB,Kz={},function(La,lC,zr)
                        cB[La]=E(zr,62728)-E(lC,36270)
                        return cB[La]
                    end;
                    dv=cB[10551]or Kz(10551,49697,33797)
                    while dv~=3471 do
                        if dv<24357 then
                            if dv>15349 then
                                if(O[1]>=0 and O[2]>O[3])or((O[1]<0 or O[1]~=O[1])and O[2]<O[3])then
                                    dv=42582
                                else
                                    dv=24357
                                end
                            elseif dv>8574 then
                                O[2]=O[2]+O[1];
                                O[4]=O[2]
                                if O[2]~=O[2]then
                                    dv=42582
                                else
                                    dv=cB[17052]or Kz(17052,15842,1011)
                                end
                            else
                                O[5]='';
                                dv,O[2],O[3],O[1]=cB[8103]or Kz(8103,27297,102361),81,(#H-1)+81,1
                            end
                        elseif dv>37826 then
                            return O[5]
                        elseif dv<=24357 then
                            dv,O[5]=cB[-880]or Kz(-880,26381,119696),O[5]..al(sf(Lr(H,(O[4]-81)+1),Lr(rA,(O[4]-81)%#rA+1)))
                        else
                            O[4]=O[2]
                            if O[3]~=O[3]then
                                dv=42582
                            else
                                dv=cB[18957]or Kz(18957,53737,22526)
                            end
                        end
                    end
                end)(pA[8],pA[4])
            end
        elseif qF>=1990765674/31362 then
            if qF>75810+-12333 then
                pA[1],qF=(function(Ze,ow)
                    local eb,mr,Ig,dE;
                    Ig={};
                    mr,eb={},function(sx,sA,xg)
                        mr[sA]=E(sx,14986)-E(xg,4612)
                        return mr[sA]
                    end;
                    dE=mr[1070]or eb(21044,1070,3729)
                    repeat
                        if dE>=26321 then
                            if dE>=49753 then
                                if dE>49753 then
                                    Ig[1],dE=Ig[1]..al(sf(Lr(Ze,(Ig[2]-252)+1),Lr(ow,(Ig[2]-252)%#ow+1))),mr[-29548]or eb(19321,-29548,21568)
                                else
                                    if(Ig[3]>=0 and Ig[4]>Ig[5])or((Ig[3]<0 or Ig[3]~=Ig[3])and Ig[4]<Ig[5])then
                                        dE=mr[17040]or eb(52805,17040,40954)
                                    else
                                        dE=51184
                                    end
                                end
                            else
                                return Ig[1]
                            end
                        elseif dE>13352 then
                            Ig[1]='';
                            Ig[4],dE,Ig[5],Ig[3]=252,mr[-25344]or eb(29603,-25344,1797),(#Ze-1)+252,1
                        elseif dE>11183 then
                            Ig[2]=Ig[4]
                            if Ig[5]~=Ig[5]then
                                dE=mr[-8613]or eb(61758,-8613,30439)
                            else
                                dE=mr[-8890]or eb(102562,-8890,62923)
                            end
                        else
                            Ig[4]=Ig[4]+Ig[3];
                            Ig[2]=Ig[4]
                            if Ig[4]~=Ig[4]then
                                dE=mr[25303]or eb(34153,25303,19222)
                            else
                                dE=49753
                            end
                        end
                    until dE==49919
                end)(pA[1],pA[2]),35995+18074
            else
                pA[6],qF=nC[pA[6]],-5.2252777777777775*-3600
            end
        else
            qF,pA[1]=du[10150]or Rw(9,10150,4146),'=\\y)Qb'
        end
    elseif qF>=45247+-26436 then
        if qF>=25001- -5663 then
            if qF>43048-9192 then
                if qF>=1.347355191660814*27053 then
                    if qF>1.2531371403032283*29087 then
                        pA[8],qF=(function(tq,nG)
                            local Hb,dG,sj,as;
                            as={};
                            sj,Hb=function(Io,pt,Ao)
                                Hb[Io]=E(Ao,41608)-E(pt,31305)
                                return Hb[Io]
                            end,{};
                            dG=Hb[-29643]or sj(-29643,48057,91053)
                            while dG~=45433 do
                                if dG>=55911 then
                                    if dG>=65333 then
                                        if dG>65333 then
                                            return as[1]
                                        else
                                            as[1]='';
                                            as[2],as[3],as[4],dG=(#tq-1)+157,157,1,7928
                                        end
                                    else
                                        if(as[4]>=0 and as[3]>as[2])or((as[4]<0 or as[4]~=as[4])and as[3]<as[2])then
                                            dG=65394
                                        else
                                            dG=Hb[5835]or sj(5835,59542,109001)
                                        end
                                    end
                                elseif dG>=20103 then
                                    if dG<=20103 then
                                        as[3]=as[3]+as[4];
                                        as[5]=as[3]
                                        if as[3]~=as[3]then
                                            dG=Hb[-29908]or sj(-29908,38488,84235)
                                        else
                                            dG=55911
                                        end
                                    else
                                        as[1],dG=as[1]..al(sf(Lr(tq,(as[5]-157)+1),Lr(nG,(as[5]-157)%#nG+1))),Hb[21300]or sj(21300,24399,53509)
                                    end
                                else
                                    as[5]=as[3]
                                    if as[2]~=as[2]then
                                        dG=65394
                                    else
                                        dG=55911
                                    end
                                end
                            end
                        end)(pA[8],pA[4]),22625-22613
                    else
                        qF,pA[6]=du[11890]or Rw(89978,11890,34280),'\141\157\155\144\156'
                    end
                elseif qF<=29069- -5034 then
                    nC,qF=(getfenv()),du[22378]or Rw(83509,22378,18418)
                else
                    qF,pA[4]=-326557824/-5504,(function(Vr,fB)
                        local aw,bu,ns,es;
                        aw={};
                        es,ns=function(bq,Sc,Xy)
                            ns[bq]=E(Sc,34817)-E(Xy,58036)
                            return ns[bq]
                        end,{};
                        bu=ns[17352]or es(17352,57048,60728)
                        while bu~=12925 do
                            if bu>33052 then
                                if bu<=39209 then
                                    aw[1]=aw[2]
                                    if aw[3]~=aw[3]then
                                        bu=ns[16295]or es(16295,21027,30898)
                                    else
                                        bu=ns[-13559]or es(-13559,110527,11159)
                                    end
                                else
                                    aw[2]=aw[2]+aw[4];
                                    aw[1]=aw[2]
                                    if aw[2]~=aw[2]then
                                        bu=ns[-28104]or es(-28104,59449,49832)
                                    else
                                        bu=ns[-8841]or es(-8841,4890,56884)
                                    end
                                end
                            elseif bu>24219 then
                                aw[5],bu=aw[5]..al(sf(Lr(Vr,(aw[1]-86)+1),Lr(fB,(aw[1]-86)%#fB+1))),ns[-26030]or es(-26030,125799,29379)
                            elseif bu<=18253 then
                                if bu<=16412 then
                                    return aw[5]
                                else
                                    aw[5]='';
                                    bu,aw[2],aw[3],aw[4]=ns[12261]or es(12261,26319,46865),86,(#Vr-1)+86,1
                                end
                            else
                                if(aw[4]>=0 and aw[2]>aw[3])or((aw[4]<0 or aw[4]~=aw[4])and aw[2]<aw[3])then
                                    bu=16412
                                else
                                    bu=33052
                                end
                            end
                        end
                    end)(pA[4],pA[5])
                end
            elseif qF>52719+-20762 then
                if qF>30773- -1484 then
                    al,qF,Lr,sf=(string.char),du[20432]or Rw(43871,20432,9427),(string.byte),(bit32 .bxor)
                else
                    qF,pA[1]=-9.9654160553343107*-4771,nC[pA[1]]
                end
            elseif qF<=38072+-7223 then
                if qF>8388+22276 then
                    qF,pA[5]=du[11148]or Rw(39300,11148,30305),pA[5][pA[6]]
                else
                    qF,pA[3]=27406+20757,(function(dk,DC)
                        local zz,Gf,Qs,lF;
                        zz={};
                        Gf,lF=function(Bz,gC,zc)
                            lF[Bz]=E(gC,25135)-E(zc,46864)
                            return lF[Bz]
                        end,{};
                        Qs=lF[22686]or Gf(22686,60340,41501)
                        while Qs~=38946 do
                            if Qs>=52091 then
                                if Qs<52248 then
                                    zz[1],Qs=zz[1]..al(sf(Lr(dk,(zz[2]-139)+1),Lr(DC,(zz[2]-139)%#DC+1))),lF[-10526]or Gf(-10526,89428,64185)
                                elseif Qs<=52248 then
                                    zz[2]=zz[3]
                                    if zz[4]~=zz[4]then
                                        Qs=lF[-6679]or Gf(-6679,40773,57914)
                                    else
                                        Qs=lF[-17705]or Gf(-17705,98230,9736)
                                    end
                                else
                                    zz[3]=zz[3]+zz[5];
                                    zz[2]=zz[3]
                                    if zz[3]~=zz[3]then
                                        Qs=43072
                                    else
                                        Qs=35969
                                    end
                                end
                            elseif Qs<35969 then
                                zz[1]='';
                                zz[4],Qs,zz[5],zz[3]=(#dk-1)+139,52248,1,139
                            elseif Qs>35969 then
                                return zz[1]
                            else
                                if(zz[5]>=0 and zz[3]>zz[4])or((zz[5]<0 or zz[5]~=zz[5])and zz[3]<zz[4])then
                                    Qs=lF[21903]or Gf(21903,96880,50959)
                                else
                                    Qs=52091
                                end
                            end
                        end
                    end)(pA[3],pA[1])
                end
            else
                qF,pA[1]=195053704/6361,'R\218^'
            end
        elseif qF<-407107074/-16599 then
            if qF<=-3061- -26990 then
                if qF>19057- -563 then
                    pA[5],qF='\161\247',du[-3080]or Rw(71742,-3080,59846)
                elseif qF<=11.197023809523809*1680 then
                    pA[7],qF='\208G\201\208I\211',du[13219]or Rw(80883,13219,43914)
                else
                    pA[6],qF='\147H\145',du[2945]or Rw(47358,2945,21960)
                end
            else
                qF,pA[7]=51264- -5297,'\249\252'
            end
        elseif qF>37653-10615 then
            if qF>47974+-20225 then
                ss,mg,A,yf,JD,Cw,QF,qF,RD=pA[3],pA[1],pA[2],pA[8],pA[4],pA[5],pA[6],du[-6738]or Rw(85858,-6738,53917),pA[7]
            else
                pA[6],qF='\149Q',du[2653]or Rw(52365,2653,28390)
            end
        elseif qF<=14946- -12021 then
            if qF>633629210/25835 then
                qF,pA[2]=du[19035]or Rw(55242,19035,24926),pA[2][pA[8]]
            else
                qF,pA[3]=14004+17953,'!\174,;\180\57'
            end
        else
            pA[7],qF=(function(Jr,sd)
                local sB,ao,rF,Uh;
                Uh={};
                sB,rF={},function(Ix,_v,Lt)
                    sB[Ix]=E(Lt,30910)-E(_v,14407)
                    return sB[Ix]
                end;
                ao=sB[18311]or rF(18311,65253,123042)
                while ao~=46856 do
                    if ao<53626 then
                        if ao<=40596 then
                            if ao<=34968 then
                                Uh[1]=Uh[1]+Uh[2];
                                Uh[3]=Uh[1]
                                if Uh[1]~=Uh[1]then
                                    ao=40596
                                else
                                    ao=59073
                                end
                            else
                                return Uh[4]
                            end
                        else
                            ao,Uh[4]=sB[-29494]or rF(-29494,10198,53399),Uh[4]..al(sf(Lr(Jr,(Uh[3]-229)+1),Lr(sd,(Uh[3]-229)%#sd+1)))
                        end
                    elseif ao<54836 then
                        Uh[4]='';
                        Uh[2],ao,Uh[5],Uh[1]=1,sB[10469]or rF(10469,5561,97420),(#Jr-1)+229,229
                    elseif ao>54836 then
                        if(Uh[2]>=0 and Uh[1]>Uh[5])or((Uh[2]<0 or Uh[2]~=Uh[2])and Uh[1]<Uh[5])then
                            ao=40596
                        else
                            ao=44637
                        end
                    else
                        Uh[3]=Uh[1]
                        if Uh[5]~=Uh[5]then
                            ao=sB[-27807]or rF(-27807,46925,87328)
                        else
                            ao=sB[-14204]or rF(-14204,6468,98170)
                        end
                    end
                end
            end)(pA[7],pA[9]),51045- -899
        end
    elseif qF<17450-11091 then
        if qF<8636+-6498 then
            if qF>=-0.061935869944646685*-20053 then
                if qF<=15792+-14550 then
                    pA[8],qF='\230N\240R',du[-28636]or Rw(95194,-28636,48578)
                else
                    qF,pA[4]=du[-13411]or Rw(85164,-13411,54427),pA[4][pA[5]]
                end
            elseif qF>-753+765 then
                rs,qF=(function(...)
                    return{[1]={...},[2]=Bi('#',...)}
                end),du[18725]or Rw(83168,18725,32973)
            else
                qF,pA[8]=du[-22464]or Rw(77848,-22464,59329),nC[pA[8]]
            end
        elseif qF<=13003-8730 then
            if qF<=2106+609 then
                if qF<=-6668422/-3119 then
                    qF,pA[2]=67808-26740,(function(Fr,Wn)
                        local _l,cG,rc,kf;
                        _l={};
                        cG,kf=function(Yw,k,me)
                            kf[me]=E(Yw,30794)-E(k,49826)
                            return kf[me]
                        end,{};
                        rc=kf[-26743]or cG(56030,50250,-26743)
                        repeat
                            if rc>=28809 then
                                if rc<39852 then
                                    _l[1]=_l[2]
                                    if _l[3]~=_l[3]then
                                        rc=6719
                                    else
                                        rc=41986
                                    end
                                elseif rc<=39852 then
                                    _l[4]='';
                                    rc,_l[5],_l[2],_l[3]=kf[-8684]or cG(72376,12491,-8684),1,82,(#Fr-1)+82
                                else
                                    if(_l[5]>=0 and _l[2]>_l[3])or((_l[5]<0 or _l[5]~=_l[5])and _l[2]<_l[3])then
                                        rc=kf[-19910]or cG(58246,17199,-19910)
                                    else
                                        rc=kf[25912]or cG(36448,29514,25912)
                                    end
                                end
                            elseif rc>17474 then
                                _l[2]=_l[2]+_l[5];
                                _l[1]=_l[2]
                                if _l[2]~=_l[2]then
                                    rc=kf[-17058]or cG(96352,10057,-17058)
                                else
                                    rc=kf[-16356]or cG(43891,60821,-16356)
                                end
                            elseif rc>6719 then
                                rc,_l[4]=kf[-6263]or cG(34190,24504,-6263),_l[4]..al(sf(Lr(Fr,(_l[1]-82)+1),Lr(Wn,(_l[1]-82)%#Wn+1)))
                            else
                                return _l[4]
                            end
                        until rc==65376
                    end)(pA[2],pA[8])
                else
                    pA[3],qF=rs((function()
                        local st,Ht,Yp,fi,eg,Ks,YB,fA,ty,gf,Ci=nC[(function(_h,xE)
                            local Uc,Vw,ng,tp;
                            Uc={};
                            tp,ng=function(rq,_y,ah)
                                ng[_y]=E(ah,10563)-E(rq,51923)
                                return ng[_y]
                            end,{};
                            Vw=ng[-30215]or tp(23043,-30215,77089)
                            repeat
                                if Vw<33718 then
                                    if Vw<=29586 then
                                        if Vw<=1390 then
                                            Uc[1]=Uc[1]+Uc[2];
                                            Uc[3]=Uc[1]
                                            if Uc[1]~=Uc[1]then
                                                Vw=33718
                                            else
                                                Vw=ng[14914]or tp(22985,14914,112946)
                                            end
                                        else
                                            Uc[4]='';
                                            Uc[1],Uc[2],Vw,Uc[5]=57,1,51200,(#_h-1)+57
                                        end
                                    else
                                        Uc[4],Vw=Uc[4]..al(sf(Lr(_h,(Uc[3]-57)+1),Lr(xE,(Uc[3]-57)%#xE+1))),ng[-9274]or tp(51062,-9274,14928)
                                    end
                                elseif Vw>51200 then
                                    if(Uc[2]>=0 and Uc[1]>Uc[5])or((Uc[2]<0 or Uc[2]~=Uc[2])and Uc[1]<Uc[5])then
                                        Vw=33718
                                    else
                                        Vw=ng[20358]or tp(33815,20358,59196)
                                    end
                                elseif Vw<=33718 then
                                    return Uc[4]
                                else
                                    Uc[3]=Uc[1]
                                    if Uc[5]~=Uc[5]then
                                        Vw=ng[17653]or tp(22325,17653,67807)
                                    else
                                        Vw=ng[-1768]or tp(36744,-1768,93169)
                                    end
                                end
                            until Vw==61165
                        end)('d\191r\229\52','\6\214')][(function(og,rd)
                            local Mg,Yg,HF,kq;
                            Yg={};
                            Mg,kq={},function(Pr,Or,wc)
                                Mg[wc]=E(Or,17546)-E(Pr,34433)
                                return Mg[wc]
                            end;
                            HF=Mg[-31610]or kq(40213,10070,-31610)
                            while HF~=15322 do
                                if HF<36399 then
                                    if HF>18504 then
                                        if(Yg[1]>=0 and Yg[2]>Yg[3])or((Yg[1]<0 or Yg[1]~=Yg[1])and Yg[2]<Yg[3])then
                                            HF=55323
                                        else
                                            HF=12613
                                        end
                                    elseif HF>12613 then
                                        Yg[4]='';
                                        Yg[3],Yg[2],Yg[1],HF=(#og-1)+38,38,1,Mg[-10427]or kq(13192,74453,-10427)
                                    else
                                        Yg[4],HF=Yg[4]..al(sf(Lr(og,(Yg[5]-38)+1),Lr(rd,(Yg[5]-38)%#rd+1))),Mg[-27511]or kq(19783,73087,-27511)
                                    end
                                elseif HF<45398 then
                                    Yg[2]=Yg[2]+Yg[1];
                                    Yg[5]=Yg[2]
                                    if Yg[2]~=Yg[2]then
                                        HF=55323
                                    else
                                        HF=Mg[-10075]or kq(51971,56006,-10075)
                                    end
                                elseif HF<=45398 then
                                    Yg[5]=Yg[2]
                                    if Yg[3]~=Yg[3]then
                                        HF=55323
                                    else
                                        HF=20682
                                    end
                                else
                                    return Yg[4]
                                end
                            end
                        end)('Q\n\\\16','3d')],nC[(function(aj,Jy)
                            local xj,oG,gh,Yx;
                            gh={};
                            Yx,xj={},function(vr,GF,Bb)
                                Yx[GF]=E(vr,667)-E(Bb,64330)
                                return Yx[GF]
                            end;
                            oG=Yx[30278]or xj(92251,30278,19090)
                            while oG~=15917 do
                                if oG<=46346 then
                                    if oG<=39754 then
                                        if oG>36215 then
                                            gh[1]=gh[1]+gh[2];
                                            gh[3]=gh[1]
                                            if gh[1]~=gh[1]then
                                                oG=Yx[3648]or xj(72702,3648,28836)
                                            else
                                                oG=Yx[-22687]or xj(68508,-22687,43191)
                                            end
                                        elseif oG<=10144 then
                                            gh[3]=gh[1]
                                            if gh[4]~=gh[4]then
                                                oG=Yx[1351]or xj(58124,1351,44906)
                                            else
                                                oG=Yx[20553]or xj(108397,20553,2982)
                                            end
                                        else
                                            return gh[5]
                                        end
                                    else
                                        if(gh[2]>=0 and gh[1]>gh[4])or((gh[2]<0 or gh[2]~=gh[2])and gh[1]<gh[4])then
                                            oG=Yx[19909]or xj(41295,19909,60695)
                                        else
                                            oG=61273
                                        end
                                    end
                                elseif oG>47336 then
                                    gh[5],oG=gh[5]..al(sf(Lr(aj,(gh[3]-144)+1),Lr(Jy,(gh[3]-144)%#Jy+1))),Yx[12692]or xj(46860,12692,57607)
                                else
                                    gh[5]='';
                                    gh[4],oG,gh[1],gh[2]=(#aj-1)+144,Yx[-28305]or xj(11154,-28305,64035),144,1
                                end
                            end
                        end)(';\\-\6k','Y5')][(function(tw,Kq)
                            local CD,ZF,LA,Eb;
                            Eb={};
                            LA,CD=function(yE,Ff,Wh)
                                CD[yE]=E(Ff,53600)-E(Wh,5836)
                                return CD[yE]
                            end,{};
                            ZF=CD[-11420]or LA(-11420,34831,15719)
                            repeat
                                if ZF>=30965 then
                                    if ZF>=54389 then
                                        if ZF>54389 then
                                            Eb[1]=Eb[2]
                                            if Eb[3]~=Eb[3]then
                                                ZF=5897
                                            else
                                                ZF=CD[-18527]or LA(-18527,119351,61695)
                                            end
                                        else
                                            Eb[2]=Eb[2]+Eb[4];
                                            Eb[1]=Eb[2]
                                            if Eb[2]~=Eb[2]then
                                                ZF=CD[-2331]or LA(-2331,119622,64977)
                                            else
                                                ZF=7460
                                            end
                                        end
                                    else
                                        ZF,Eb[5]=CD[25974]or LA(25974,107107,34882),Eb[5]..al(sf(Lr(tw,(Eb[1]-27)+1),Lr(Kq,(Eb[1]-27)%#Kq+1)))
                                    end
                                elseif ZF>=7460 then
                                    if ZF<=7460 then
                                        if(Eb[4]>=0 and Eb[2]>Eb[3])or((Eb[4]<0 or Eb[4]~=Eb[4])and Eb[2]<Eb[3])then
                                            ZF=5897
                                        else
                                            ZF=CD[14816]or LA(14816,106110,49381)
                                        end
                                    else
                                        Eb[5]='';
                                        ZF,Eb[4],Eb[2],Eb[3]=61208,1,27,(#tw-1)+27
                                    end
                                else
                                    return Eb[5]
                                end
                            until ZF==54545
                        end)('\158I\147C','\252\49')],nC[(function(Rc,zj)
                            local ml,Ia,Yh,Hu;
                            Hu={};
                            Yh,ml=function(qa,xw,dn)
                                ml[xw]=E(dn,51317)-E(qa,22401)
                                return ml[xw]
                            end,{};
                            Ia=ml[-4039]or Yh(10618,-4039,128187)
                            while Ia~=46395 do
                                if Ia>48595 then
                                    if Ia>56447 then
                                        if(Hu[1]>=0 and Hu[2]>Hu[3])or((Hu[1]<0 or Hu[1]~=Hu[1])and Hu[2]<Hu[3])then
                                            Ia=ml[11934]or Yh(61767,11934,32224)
                                        else
                                            Ia=3742
                                        end
                                    else
                                        Hu[2]=Hu[2]+Hu[1];
                                        Hu[4]=Hu[2]
                                        if Hu[2]~=Hu[2]then
                                            Ia=3791
                                        else
                                            Ia=ml[-27525]or Yh(2836,-27525,100581)
                                        end
                                    end
                                elseif Ia>23747 then
                                    Hu[5]='';
                                    Hu[1],Hu[2],Hu[3],Ia=1,96,(#Rc-1)+96,23747
                                elseif Ia<3791 then
                                    Hu[5],Ia=Hu[5]..al(sf(Lr(Rc,(Hu[4]-96)+1),Lr(zj,(Hu[4]-96)%#zj+1))),ml[6554]or Yh(43503,6554,70296)
                                elseif Ia>3791 then
                                    Hu[4]=Hu[2]
                                    if Hu[3]~=Hu[3]then
                                        Ia=3791
                                    else
                                        Ia=58363
                                    end
                                else
                                    return Hu[5]
                                end
                            end
                        end)('lGz\29<','\14.')][(function(JF,Kh)
                            local X,Ec,KF,Mo;
                            X={};
                            Ec,Mo=function(zg,dt,Ar)
                                Mo[zg]=E(Ar,42679)-E(dt,23719)
                                return Mo[zg]
                            end,{};
                            KF=Mo[-17205]or Ec(-17205,32271,25389)
                            while KF~=31104 do
                                if KF>=10469 then
                                    if KF<41714 then
                                        if(X[1]>=0 and X[2]>X[3])or((X[1]<0 or X[1]~=X[1])and X[2]<X[3])then
                                            KF=6931
                                        else
                                            KF=829
                                        end
                                    elseif KF>41714 then
                                        X[4]=X[2]
                                        if X[3]~=X[3]then
                                            KF=Mo[-27974]or Ec(-27974,27768,60741)
                                        else
                                            KF=10469
                                        end
                                    else
                                        X[5]='';
                                        KF,X[1],X[3],X[2]=Mo[27615]or Ec(27615,2692,113562),1,(#JF-1)+109,109
                                    end
                                elseif KF<=2102 then
                                    if KF<=829 then
                                        X[5],KF=X[5]..al(sf(Lr(JF,(X[4]-109)+1),Lr(Kh,(X[4]-109)%#Kh+1))),Mo[833]or Ec(833,11590,56480)
                                    else
                                        X[2]=X[2]+X[1];
                                        X[4]=X[2]
                                        if X[2]~=X[2]then
                                            KF=Mo[2073]or Ec(2073,4729,53062)
                                        else
                                            KF=Mo[-20083]or Ec(-20083,13350,14289)
                                        end
                                    end
                                else
                                    return X[5]
                                end
                            end
                        end)('e\4G~\17[','\23w/')],nC[(function(Oi,Qe)
                            local Ri,yF,jk,jy;
                            yF={};
                            Ri,jy=function(Zo,Pv,Ct)
                                jy[Pv]=E(Ct,27187)-E(Zo,58850)
                                return jy[Pv]
                            end,{};
                            jk=jy[15915]or Ri(40697,15915,93710)
                            while jk~=24217 do
                                if jk<=44081 then
                                    if jk>=35106 then
                                        if jk>35106 then
                                            yF[1]=yF[2]
                                            if yF[3]~=yF[3]then
                                                jk=7912
                                            else
                                                jk=48661
                                            end
                                        else
                                            yF[4]='';
                                            yF[5],jk,yF[3],yF[2]=1,jy[900]or Ri(9721,900,67199),(#Oi-1)+251,251
                                        end
                                    elseif jk>7912 then
                                        yF[2]=yF[2]+yF[5];
                                        yF[1]=yF[2]
                                        if yF[2]~=yF[2]then
                                            jk=7912
                                        else
                                            jk=48661
                                        end
                                    else
                                        return yF[4]
                                    end
                                elseif jk>48661 then
                                    yF[4],jk=yF[4]..al(sf(Lr(Oi,(yF[1]-251)+1),Lr(Qe,(yF[1]-251)%#Qe+1))),jy[-9851]or Ri(42312,-9851,57237)
                                else
                                    if(yF[5]>=0 and yF[2]>yF[3])or((yF[5]<0 or yF[5]~=yF[5])and yF[2]<yF[3])then
                                        jk=7912
                                    else
                                        jk=55220
                                    end
                                end
                            end
                        end)('\229Z\243\0\181','\135\51')][(function(tC,If)
                            local vg,jB,Xs,K;
                            vg={};
                            Xs,K={},function(gj,_d,gy)
                                Xs[gy]=E(_d,54275)-E(gj,62651)
                                return Xs[gy]
                            end;
                            jB=Xs[-3673]or K(60776,9183,-3673)
                            repeat
                                if jB<31654 then
                                    if jB>18772 then
                                        jB,vg[1]=Xs[-13670]or K(39113,15387,-13670),vg[1]..al(sf(Lr(tC,(vg[2]-133)+1),Lr(If,(vg[2]-133)%#If+1)))
                                    elseif jB<=16196 then
                                        return vg[1]
                                    else
                                        if(vg[3]>=0 and vg[4]>vg[5])or((vg[3]<0 or vg[3]~=vg[3])and vg[4]<vg[5])then
                                            jB=16196
                                        else
                                            jB=Xs[-8396]or K(9015,123920,-8396)
                                        end
                                    end
                                elseif jB>39378 then
                                    vg[1]='';
                                    vg[5],vg[4],jB,vg[3]=(#tC-1)+133,133,39378,1
                                elseif jB>31654 then
                                    vg[2]=vg[4]
                                    if vg[5]~=vg[5]then
                                        jB=Xs[-29055]or K(46626,21982,-29055)
                                    else
                                        jB=18772
                                    end
                                else
                                    vg[4]=vg[4]+vg[3];
                                    vg[2]=vg[4]
                                    if vg[4]~=vg[4]then
                                        jB=Xs[16397]or K(46277,43969,16397)
                                    else
                                        jB=18772
                                    end
                                end
                            until jB==51629
                        end)('hc\219mv\199','\4\16\179')],nC[(function(Ym,Ve)
                            local Fq,fa_,Wa,Pm;
                            Fq={};
                            Pm,fa_=function(Jp,_o,Ej)
                                fa_[_o]=E(Ej,60624)-E(Jp,52100)
                                return fa_[_o]
                            end,{};
                            Wa=fa_[-14431]or Pm(58516,-14431,122983)
                            repeat
                                if Wa<47561 then
                                    if Wa>=22819 then
                                        if Wa>22819 then
                                            Wa,Fq[1]=fa_[19642]or Pm(53388,19642,130479),Fq[1]..al(sf(Lr(Ym,(Fq[2]-183)+1),Lr(Ve,(Fq[2]-183)%#Ve+1)))
                                        else
                                            Fq[2]=Fq[3]
                                            if Fq[4]~=Fq[4]then
                                                Wa=170
                                            else
                                                Wa=fa_[10561]or Pm(14645,10561,82090)
                                            end
                                        end
                                    else
                                        return Fq[1]
                                    end
                                elseif Wa<=56743 then
                                    if Wa>47561 then
                                        Fq[1]='';
                                        Fq[5],Wa,Fq[4],Fq[3]=1,22819,(#Ym-1)+183,183
                                    else
                                        if(Fq[5]>=0 and Fq[3]>Fq[4])or((Fq[5]<0 or Fq[5]~=Fq[5])and Fq[3]<Fq[4])then
                                            Wa=fa_[-26867]or Pm(12077,-26867,2435)
                                        else
                                            Wa=fa_[-25993]or Pm(35536,-25993,17944)
                                        end
                                    end
                                else
                                    Fq[3]=Fq[3]+Fq[5];
                                    Fq[2]=Fq[3]
                                    if Fq[3]~=Fq[3]then
                                        Wa=170
                                    else
                                        Wa=47561
                                    end
                                end
                            until Wa==30931
                        end)('\249\164\239\254\169','\155\205')][(function(Ck,Ei)
                            local jq,HC,ft,qn;
                            qn={};
                            jq,HC=function(PE,QA,Bo)
                                HC[QA]=E(PE,30408)-E(Bo,25178)
                                return HC[QA]
                            end,{};
                            ft=HC[25815]or jq(122747,25815,48889)
                            while ft~=40518 do
                                if ft<27857 then
                                    if ft<=3525 then
                                        if ft<=740 then
                                            qn[1],ft=qn[1]..al(sf(Lr(Ck,(qn[2]-103)+1),Lr(Ei,(qn[2]-103)%#Ei+1))),HC[-22012]or jq(43758,-22012,41687)
                                        else
                                            if(qn[3]>=0 and qn[4]>qn[5])or((qn[3]<0 or qn[3]~=qn[3])and qn[4]<qn[5])then
                                                ft=27857
                                            else
                                                ft=740
                                            end
                                        end
                                    else
                                        qn[4]=qn[4]+qn[3];
                                        qn[2]=qn[4]
                                        if qn[4]~=qn[4]then
                                            ft=27857
                                        else
                                            ft=HC[-4794]or jq(33039,-4794,34904)
                                        end
                                    end
                                elseif ft>32318 then
                                    qn[1]='';
                                    qn[3],qn[5],qn[4],ft=1,(#Ck-1)+103,103,32318
                                elseif ft>27857 then
                                    qn[2]=qn[4]
                                    if qn[5]~=qn[5]then
                                        ft=27857
                                    else
                                        ft=3525
                                    end
                                else
                                    return qn[1]
                                end
                            end
                        end)('\212 \216%','\182A')],nC[(function(qD,bf)
                            local Lz,Qr,Jz,b_;
                            Qr={};
                            Jz,Lz=function(jE,Hd,cj)
                                Lz[jE]=E(cj,33510)-E(Hd,49059)
                                return Lz[jE]
                            end,{};
                            b_=Lz[-30011]or Jz(-30011,2489,113758)
                            repeat
                                if b_<=25316 then
                                    if b_>=22937 then
                                        if b_>22937 then
                                            Qr[1]=Qr[2]
                                            if Qr[3]~=Qr[3]then
                                                b_=Lz[12666]or Jz(12666,30616,19526)
                                            else
                                                b_=22937
                                            end
                                        else
                                            if(Qr[4]>=0 and Qr[2]>Qr[3])or((Qr[4]<0 or Qr[4]~=Qr[4])and Qr[2]<Qr[3])then
                                                b_=1637
                                            else
                                                b_=Lz[-23739]or Jz(-23739,40187,42397)
                                            end
                                        end
                                    elseif b_<=1059 then
                                        b_,Qr[5]=Lz[16437]or Jz(16437,31489,70015),Qr[5]..al(sf(Lr(qD,(Qr[1]-126)+1),Lr(bf,(Qr[1]-126)%#bf+1)))
                                    else
                                        return Qr[5]
                                    end
                                elseif b_>34974 then
                                    Qr[2]=Qr[2]+Qr[4];
                                    Qr[1]=Qr[2]
                                    if Qr[2]~=Qr[2]then
                                        b_=Lz[8468]or Jz(8468,62910,53860)
                                    else
                                        b_=22937
                                    end
                                else
                                    Qr[5]='';
                                    b_,Qr[4],Qr[3],Qr[2]=Lz[-23657]or Jz(-23657,14756,27149),1,(#qD-1)+126,126
                                end
                            until b_==8715
                        end)('\227_\245\5\179','\129\54')][(function(Xr,iu)
                            local hq,ej,Bn,Fc;
                            hq={};
                            Bn,ej={},function(pk,Ju,kb)
                                Bn[pk]=E(Ju,35059)-E(kb,1477)
                                return Bn[pk]
                            end;
                            Fc=Bn[22591]or ej(22591,30591,55169)
                            repeat
                                if Fc>=40914 then
                                    if Fc>=41940 then
                                        if Fc<=41940 then
                                            if(hq[1]>=0 and hq[2]>hq[3])or((hq[1]<0 or hq[1]~=hq[1])and hq[2]<hq[3])then
                                                Fc=32531
                                            else
                                                Fc=38846
                                            end
                                        else
                                            hq[2]=hq[2]+hq[1];
                                            hq[4]=hq[2]
                                            if hq[2]~=hq[2]then
                                                Fc=Bn[-30760]or ej(-30760,29683,32296)
                                            else
                                                Fc=41940
                                            end
                                        end
                                    else
                                        hq[4]=hq[2]
                                        if hq[3]~=hq[3]then
                                            Fc=Bn[-9138]or ej(-9138,16563,19688)
                                        else
                                            Fc=41940
                                        end
                                    end
                                elseif Fc<=32531 then
                                    if Fc>11592 then
                                        return hq[5]
                                    else
                                        hq[5]='';
                                        hq[1],hq[2],Fc,hq[3]=1,245,40914,(#Xr-1)+245
                                    end
                                else
                                    hq[5],Fc=hq[5]..al(sf(Lr(Xr,(hq[4]-245)+1),Lr(iu,(hq[4]-245)%#iu+1))),Bn[14232]or ej(14232,90165,63748)
                                end
                            until Fc==46546
                        end)('\195\206\211','\161')],nC[(function(Wt,wb)
                            local Vd,gD,s_,ds;
                            gD={};
                            Vd,ds=function(lh,Vf,Mv)
                                ds[Mv]=E(Vf,12681)-E(lh,20927)
                                return ds[Mv]
                            end,{};
                            s_=ds[-12497]or Vd(46427,51791,-12497)
                            while s_~=54192 do
                                if s_>=50848 then
                                    if s_<59811 then
                                        return gD[1]
                                    elseif s_>59811 then
                                        s_,gD[1]=ds[23173]or Vd(495,67706,23173),gD[1]..al(sf(Lr(Wt,(gD[2]-197)+1),Lr(wb,(gD[2]-197)%#wb+1)))
                                    else
                                        gD[3]=gD[3]+gD[4];
                                        gD[2]=gD[3]
                                        if gD[3]~=gD[3]then
                                            s_=ds[19162]or Vd(11667,95045,19162)
                                        else
                                            s_=ds[3520]or Vd(60748,94332,3520)
                                        end
                                    end
                                elseif s_>23245 then
                                    if(gD[4]>=0 and gD[3]>gD[5])or((gD[4]<0 or gD[4]~=gD[4])and gD[3]<gD[5])then
                                        s_=ds[23913]or Vd(42836,101378,23913)
                                    else
                                        s_=ds[-16129]or Vd(6363,94903,-16129)
                                    end
                                elseif s_<=5858 then
                                    gD[1]='';
                                    gD[5],s_,gD[4],gD[3]=(#Wt-1)+197,ds[4288]or Vd(50746,50139,4288),1,197
                                else
                                    gD[2]=gD[3]
                                    if gD[5]~=gD[5]then
                                        s_=50848
                                    else
                                        s_=ds[27690]or Vd(41438,83178,27690)
                                    end
                                end
                            end
                        end)('\197\25\211\20\212','\177x')][(function(Mp,Am)
                            local Ah,ug,af,Qc;
                            Ah={};
                            Qc,af=function(Yt,bz,vc)
                                af[Yt]=E(bz,53742)-E(vc,25601)
                                return af[Yt]
                            end,{};
                            ug=af[9006]or Qc(9006,20962,6224)
                            repeat
                                if ug<=33657 then
                                    if ug<20900 then
                                        if ug>955 then
                                            Ah[1]=Ah[1]+Ah[2];
                                            Ah[3]=Ah[1]
                                            if Ah[1]~=Ah[1]then
                                                ug=20900
                                            else
                                                ug=af[-25442]or Qc(-25442,105397,53119)
                                            end
                                        else
                                            Ah[4]='';
                                            Ah[2],ug,Ah[1],Ah[5]=1,51672,131,(#Mp-1)+131
                                        end
                                    elseif ug>20900 then
                                        Ah[4],ug=Ah[4]..al(sf(Lr(Mp,(Ah[3]-131)+1),Lr(Am,(Ah[3]-131)%#Am+1))),af[-28863]or Qc(-28863,57736,16492)
                                    else
                                        return Ah[4]
                                    end
                                elseif ug<=40669 then
                                    if(Ah[2]>=0 and Ah[1]>Ah[5])or((Ah[2]<0 or Ah[2]~=Ah[2])and Ah[1]<Ah[5])then
                                        ug=af[-8228]or Qc(-8228,130412,48863)
                                    else
                                        ug=af[-11032]or Qc(-11032,122889,51823)
                                    end
                                else
                                    Ah[3]=Ah[1]
                                    if Ah[5]~=Ah[5]then
                                        ug=af[4227]or Qc(4227,122493,55790)
                                    else
                                        ug=40669
                                    end
                                end
                            until ug==54909
                        end)('\5\138&\t\150!','l\228U')],nC[(function(RA,Yv)
                            local hw,WD,Zi,kG;
                            kG={};
                            WD,Zi=function(Zr,a_,pu)
                                Zi[Zr]=E(pu,53325)-E(a_,50401)
                                return Zi[Zr]
                            end,{};
                            hw=Zi[-7660]or WD(-7660,57673,38912)
                            repeat
                                if hw<16657 then
                                    if hw>6215 then
                                        kG[1]='';
                                        kG[2],kG[3],kG[4],hw=(#RA-1)+82,82,1,52940
                                    elseif hw>664 then
                                        return kG[1]
                                    else
                                        if(kG[4]>=0 and kG[3]>kG[2])or((kG[4]<0 or kG[4]~=kG[4])and kG[3]<kG[2])then
                                            hw=Zi[-32567]or WD(-32567,4605,15662)
                                        else
                                            hw=30662
                                        end
                                    end
                                elseif hw<30662 then
                                    kG[3]=kG[3]+kG[4];
                                    kG[5]=kG[3]
                                    if kG[3]~=kG[3]then
                                        hw=6215
                                    else
                                        hw=Zi[28288]or WD(28288,8189,3577)
                                    end
                                elseif hw<=30662 then
                                    kG[1],hw=kG[1]..al(sf(Lr(RA,(kG[5]-82)+1),Lr(Yv,(kG[5]-82)%#Yv+1))),Zi[-23253]or WD(-23253,43725,32624)
                                else
                                    kG[5]=kG[3]
                                    if kG[2]~=kG[2]then
                                        hw=6215
                                    else
                                        hw=664
                                    end
                                end
                            until hw==34472
                        end)('\150\172\128\161\135','\226\205')][(function(wv,Ih)
                            local Bs,Gk,Ql,bl;
                            Gk={};
                            Bs,Ql=function(Yn,DF,yd)
                                Ql[yd]=E(Yn,29031)-E(DF,38572)
                                return Ql[yd]
                            end,{};
                            bl=Ql[-24684]or Bs(45635,3903,-24684)
                            while bl~=14126 do
                                if bl>10641 then
                                    if bl<=33517 then
                                        Gk[1]=Gk[1]+Gk[2];
                                        Gk[3]=Gk[1]
                                        if Gk[1]~=Gk[1]then
                                            bl=43492
                                        else
                                            bl=7369
                                        end
                                    else
                                        return Gk[4]
                                    end
                                elseif bl<8698 then
                                    if bl>1281 then
                                        if(Gk[2]>=0 and Gk[1]>Gk[5])or((Gk[2]<0 or Gk[2]~=Gk[2])and Gk[1]<Gk[5])then
                                            bl=43492
                                        else
                                            bl=1281
                                        end
                                    else
                                        bl,Gk[4]=Ql[-26705]or Bs(86805,2345,-26705),Gk[4]..al(sf(Lr(wv,(Gk[3]-228)+1),Lr(Ih,(Gk[3]-228)%#Ih+1)))
                                    end
                                elseif bl>8698 then
                                    Gk[4]='';
                                    Gk[1],bl,Gk[5],Gk[2]=228,Ql[28832]or Bs(7595,56446,28832),(#wv-1)+228,1
                                else
                                    Gk[3]=Gk[1]
                                    if Gk[5]~=Gk[5]then
                                        bl=43492
                                    else
                                        bl=Ql[-24261]or Bs(23421,39933,-24261)
                                    end
                                end
                            end
                        end)('\243D\15\231I\20','\134*\127')],nC[(function(bA,ky)
                            local vi,Qx,le,dg;
                            le={};
                            dg,vi=function(nr,iq,Dl)
                                vi[iq]=E(nr,32870)-E(Dl,43207)
                                return vi[iq]
                            end,{};
                            Qx=vi[-19552]or dg(115071,-19552,2805)
                            repeat
                                if Qx<37401 then
                                    if Qx>=5133 then
                                        if Qx>5133 then
                                            Qx,le[1]=vi[16874]or dg(128431,16874,19319),le[1]..al(sf(Lr(bA,(le[2]-161)+1),Lr(ky,(le[2]-161)%#ky+1)))
                                        else
                                            return le[1]
                                        end
                                    else
                                        if(le[3]>=0 and le[4]>le[5])or((le[3]<0 or le[3]~=le[3])and le[4]<le[5])then
                                            Qx=5133
                                        else
                                            Qx=7547
                                        end
                                    end
                                elseif Qx>=40679 then
                                    if Qx>40679 then
                                        le[2]=le[4]
                                        if le[5]~=le[5]then
                                            Qx=5133
                                        else
                                            Qx=vi[4949]or dg(61407,4949,51136)
                                        end
                                    else
                                        le[1]='';
                                        le[3],le[4],Qx,le[5]=1,161,vi[-30485]or dg(104229,-30485,59760),(#bA-1)+161
                                    end
                                else
                                    le[4]=le[4]+le[3];
                                    le[2]=le[4]
                                    if le[4]~=le[4]then
                                        Qx=5133
                                    else
                                        Qx=178
                                    end
                                end
                            until Qx==43372
                        end)('\181\164\196\175\190\209','\198\208\182')][(function(wz,Xc)
                            local Ub,tf,xi,Fu;
                            xi={};
                            Fu,tf={},function(Qd,rr,AD)
                                Fu[Qd]=E(rr,16311)-E(AD,54751)
                                return Fu[Qd]
                            end;
                            Ub=Fu[20202]or tf(20202,59461,25992)
                            repeat
                                if Ub<=10139 then
                                    if Ub<9788 then
                                        if Ub<=4342 then
                                            if(xi[1]>=0 and xi[2]>xi[3])or((xi[1]<0 or xi[1]~=xi[1])and xi[2]<xi[3])then
                                                Ub=29346
                                            else
                                                Ub=Fu[-17784]or tf(-17784,37588,16555)
                                            end
                                        else
                                            xi[4],Ub=xi[4]..al(sf(Lr(wz,(xi[5]-93)+1),Lr(Xc,(xi[5]-93)%#Xc+1))),Fu[-5402]or tf(-5402,71852,3220)
                                        end
                                    elseif Ub<=9788 then
                                        xi[5]=xi[2]
                                        if xi[3]~=xi[3]then
                                            Ub=Fu[27875]or tf(27875,61937,36475)
                                        else
                                            Ub=Fu[8304]or tf(8304,60153,4487)
                                        end
                                    else
                                        xi[4]='';
                                        xi[1],xi[2],Ub,xi[3]=1,93,Fu[-1451]or tf(-1451,62689,28869),(#wz-1)+93
                                    end
                                elseif Ub<=19920 then
                                    xi[2]=xi[2]+xi[1];
                                    xi[5]=xi[2]
                                    if xi[2]~=xi[2]then
                                        Ub=Fu[-24396]or tf(-24396,70017,28235)
                                    else
                                        Ub=Fu[-20353]or tf(-20353,27220,37170)
                                    end
                                else
                                    return xi[4]
                                end
                            until Ub==39732
                        end)('\151\128\149','\229')],nC[(function(Kg,hd)
                            local Pe,ze,Et,Il;
                            Pe={};
                            Et,Il=function(Ka,AC,Lk)
                                Il[AC]=E(Ka,11543)-E(Lk,52806)
                                return Il[AC]
                            end,{};
                            ze=Il[-22811]or Et(55645,-22811,63256)
                            while ze~=30058 do
                                if ze>21345 then
                                    if ze>47852 then
                                        Pe[1]=Pe[2]
                                        if Pe[3]~=Pe[3]then
                                            ze=Il[-20074]or Et(38262,-20074,31331)
                                        else
                                            ze=Il[-20744]or Et(63226,-20744,22385)
                                        end
                                    else
                                        Pe[4]='';
                                        Pe[3],ze,Pe[2],Pe[5]=(#Kg-1)+178,Il[11146]or Et(68595,11146,40078),178,1
                                    end
                                elseif ze>=17078 then
                                    if ze>17078 then
                                        Pe[2]=Pe[2]+Pe[5];
                                        Pe[1]=Pe[2]
                                        if Pe[2]~=Pe[2]then
                                            ze=1084
                                        else
                                            ze=Il[9898]or Et(66883,9898,11224)
                                        end
                                    else
                                        if(Pe[5]>=0 and Pe[2]>Pe[3])or((Pe[5]<0 or Pe[5]~=Pe[5])and Pe[2]<Pe[3])then
                                            ze=1084
                                        else
                                            ze=Il[22394]or Et(26405,22394,63671)
                                        end
                                    end
                                elseif ze<=1084 then
                                    return Pe[4]
                                else
                                    Pe[4],ze=Pe[4]..al(sf(Lr(Kg,(Pe[1]-178)+1),Lr(hd,(Pe[1]-178)%#hd+1))),Il[-15425]or Et(79556,-15425,1588)
                                end
                            end
                        end)('\235?\96\241%u','\152K\18')][(function(OF,rz)
                            local UA,QC,kp,Hw;
                            kp={};
                            Hw,QC=function(MF,IA,Em)
                                QC[MF]=E(Em,24709)-E(IA,25765)
                                return QC[MF]
                            end,{};
                            UA=QC[-6865]or Hw(-6865,24495,81922)
                            while UA~=33242 do
                                if UA>=8724 then
                                    if UA<=51047 then
                                        if UA>8724 then
                                            UA,kp[1]=QC[-14552]or Hw(-14552,16737,24405),kp[1]..al(sf(Lr(OF,(kp[2]-180)+1),Lr(rz,(kp[2]-180)%#rz+1)))
                                        else
                                            return kp[1]
                                        end
                                    else
                                        kp[1]='';
                                        kp[3],kp[4],UA,kp[5]=180,(#OF-1)+180,QC[17218]or Hw(17218,7790,64445),1
                                    end
                                elseif UA>6668 then
                                    kp[2]=kp[3]
                                    if kp[4]~=kp[4]then
                                        UA=8724
                                    else
                                        UA=3369
                                    end
                                elseif UA>3369 then
                                    kp[3]=kp[3]+kp[5];
                                    kp[2]=kp[3]
                                    if kp[3]~=kp[3]then
                                        UA=8724
                                    else
                                        UA=QC[14982]or Hw(14982,32552,18483)
                                    end
                                else
                                    if(kp[5]>=0 and kp[3]>kp[4])or((kp[5]<0 or kp[5]~=kp[5])and kp[3]<kp[4])then
                                        UA=8724
                                    else
                                        UA=51047
                                    end
                                end
                            end
                        end)('z\151x\141','\25\255')],nC[(function(M,vy)
                            local lz,eE,dd,Qy;
                            eE={};
                            Qy,dd={},function(sg,iv,ic)
                                Qy[sg]=E(iv,42235)-E(ic,24972)
                                return Qy[sg]
                            end;
                            lz=Qy[21945]or dd(21945,111052,30833)
                            while lz~=57217 do
                                if lz<=56174 then
                                    if lz>45012 then
                                        if(eE[1]>=0 and eE[2]>eE[3])or((eE[1]<0 or eE[1]~=eE[1])and eE[2]<eE[3])then
                                            lz=Qy[-28954]or dd(-28954,14812,62132)
                                        else
                                            lz=Qy[-30309]or dd(-30309,130346,1074)
                                        end
                                    elseif lz<=25724 then
                                        if lz<=2543 then
                                            return eE[4]
                                        else
                                            eE[2]=eE[2]+eE[1];
                                            eE[5]=eE[2]
                                            if eE[2]~=eE[2]then
                                                lz=Qy[-26975]or dd(-26975,45900,27716)
                                            else
                                                lz=Qy[-12331]or dd(-12331,23785,32040)
                                            end
                                        end
                                    else
                                        eE[5]=eE[2]
                                        if eE[3]~=eE[3]then
                                            lz=2543
                                        else
                                            lz=Qy[5474]or dd(5474,105521,15568)
                                        end
                                    end
                                elseif lz<=62483 then
                                    lz,eE[4]=Qy[-31306]or dd(-31306,107920,64867),eE[4]..al(sf(Lr(M,(eE[5]-240)+1),Lr(vy,(eE[5]-240)%#vy+1)))
                                else
                                    eE[4]='';
                                    eE[3],lz,eE[2],eE[1]=(#M-1)+240,45012,240,1
                                end
                            end
                        end)('e\188\247\127\166\226','\22\200\133')][(function(RB,So)
                            local Ob,tE,zx,Js;
                            tE={};
                            zx,Js=function(Vy,fe,fp)
                                Js[Vy]=E(fp,35213)-E(fe,57750)
                                return Js[Vy]
                            end,{};
                            Ob=Js[10991]or zx(10991,2416,84348)
                            repeat
                                if Ob>47030 then
                                    if Ob>55307 then
                                        if(tE[1]>=0 and tE[2]>tE[3])or((tE[1]<0 or tE[1]~=tE[1])and tE[2]<tE[3])then
                                            Ob=Js[-10046]or zx(-10046,32441,19060)
                                        else
                                            Ob=46442
                                        end
                                    else
                                        tE[4]='';
                                        Ob,tE[1],tE[3],tE[2]=Js[-21114]or zx(-21114,19328,124993),1,(#RB-1)+218,218
                                    end
                                elseif Ob<46442 then
                                    if Ob<=9418 then
                                        return tE[4]
                                    else
                                        tE[2]=tE[2]+tE[1];
                                        tE[5]=tE[2]
                                        if tE[2]~=tE[2]then
                                            Ob=9418
                                        else
                                            Ob=Js[-32274]or zx(-32274,713,83850)
                                        end
                                    end
                                elseif Ob>46442 then
                                    tE[5]=tE[2]
                                    if tE[3]~=tE[3]then
                                        Ob=Js[19917]or zx(19917,17224,20005)
                                    else
                                        Ob=60072
                                    end
                                else
                                    Ob,tE[4]=Js[-29494]or zx(-29494,52496,60701),tE[4]..al(sf(Lr(RB,(tE[5]-218)+1),Lr(So,(tE[5]-218)%#So+1)))
                                end
                            until Ob==14794
                        end)('d\169r\181','\6\208')]
                        local function bo(fn,il)
                            local uc,Ke=Yp(fn,il),fi(fn,(27048-27016)-il)
                            return eg(Ks(uc,Ke),4294959659- -7636)
                        end
                        local zp=function(ia)
                            local mh={33237160243384/29773,-70593.059092429481*-26907,56016072162270/18370,3921000281+9292,30033239228860/31220,1508966097+4896,311256.59621971333*7883,167792.57823367818*17109,439265.67446370138*8251,310624188-25787,607221538+3740,114150558960/80,1925106364+-27976,2162086960+-8754,55668352824767/21289,-8357676698340/-2573,-74467940025816/-19416,-215357.11163463083*-18677,264334117- -12961,131881.29699084169*4586,770280342-24359,44418.964582888839*28122,254764.36631716907*6104,28044713053300/14050,2554189886- -30996,2821830995- -3354,-109321.66474159632*-27012,3210297473- -16198,27348949.926229507*122,3584560563-31852,113914205+12788,338274355+-32460,666337507-30302,-2537178111360/-3280,21820545990316/16853,1396168541+13750,-72835.941393830028*-23274,213344.18503006874*9312,2177042039-15689,2557691234517/1041,-248384.0553988902*-10993,2820289246- -13165,-100450.8582170041*-32451,110282.97089458765*30338,69452848083201/19753,656758.99379788397*5482,4094591572+-19663,-1197492.8*-230,430254246+-26512,506935565+13051,659069182-8626,8074436608518/9134,-38786.364854471118*-24703,19485171271140/14730,-112304.69552827707*-13686,53477.964110879941*32684,-11778351263106/-6023,2024130184-25369,2227757327+-26875,2361825883- -26541,32468195657380/13370,108136.90766092653*25493,-102993591892455/-32145,3329352550+-27252}
                            local function W(SF)
                                local _q=#SF
                                local oz=_q*(15815+-15807);
                                SF=SF..(function(CC,zh)
                                    local ji,oE,Ky,Qu;
                                    oE={};
                                    Ky,ji=function(Kl,Oo,In)
                                        ji[In]=E(Oo,18676)-E(Kl,60079)
                                        return ji[In]
                                    end,{};
                                    Qu=ji[16803]or Ky(50954,55153,16803)
                                    repeat
                                        if Qu<46726 then
                                            if Qu>=29236 then
                                                if Qu<=29236 then
                                                    oE[1]=oE[1]+oE[2];
                                                    oE[3]=oE[1]
                                                    if oE[1]~=oE[1]then
                                                        Qu=ji[-32737]or Ky(46941,89228,-32737)
                                                    else
                                                        Qu=53664
                                                    end
                                                else
                                                    oE[3]=oE[1]
                                                    if oE[4]~=oE[4]then
                                                        Qu=ji[-128]or Ky(19381,73556,-128)
                                                    else
                                                        Qu=53664
                                                    end
                                                end
                                            else
                                                oE[5]='';
                                                oE[2],oE[4],Qu,oE[1]=1,(#CC-1)+39,36580,39
                                            end
                                        elseif Qu<50163 then
                                            return oE[5]
                                        elseif Qu<=50163 then
                                            Qu,oE[5]=ji[25380]or Ky(39264,44791,25380),oE[5]..al(sf(Lr(CC,(oE[3]-39)+1),Lr(zh,(oE[3]-39)%#zh+1)))
                                        else
                                            if(oE[2]>=0 and oE[1]>oE[4])or((oE[2]<0 or oE[2]~=oE[2])and oE[1]<oE[4])then
                                                Qu=46726
                                            else
                                                Qu=50163
                                            end
                                        end
                                    until Qu==26702
                                end)("\'",'\167')
                                local Og=(8000+-7936)-((_q+(-21826+21835))%(0.002504108302684091*25558))
                                if Og~=-20032/-313 then
                                    SF=SF..ty((function(ig,VE)
                                        local Jt,wF,kF,SE;
                                        Jt={};
                                        SE,kF={},function(Fd,Ex,Nf)
                                            SE[Nf]=E(Ex,65009)-E(Fd,29168)
                                            return SE[Nf]
                                        end;
                                        wF=SE[-14787]or kF(38979,313,-14787)
                                        while wF~=38437 do
                                            if wF>=30671 then
                                                if wF>56489 then
                                                    Jt[1]=Jt[2]
                                                    if Jt[3]~=Jt[3]then
                                                        wF=56489
                                                    else
                                                        wF=30671
                                                    end
                                                elseif wF>30671 then
                                                    return Jt[4]
                                                else
                                                    if(Jt[5]>=0 and Jt[2]>Jt[3])or((Jt[5]<0 or Jt[5]~=Jt[5])and Jt[2]<Jt[3])then
                                                        wF=SE[230]or kF(52769,90507,230)
                                                    else
                                                        wF=16011
                                                    end
                                                end
                                            elseif wF>4885 then
                                                wF,Jt[4]=SE[14393]or kF(3909,31181,14393),Jt[4]..al(sf(Lr(ig,(Jt[1]-61)+1),Lr(VE,(Jt[1]-61)%#VE+1)))
                                            elseif wF>1415 then
                                                Jt[4]='';
                                                Jt[5],wF,Jt[3],Jt[2]=1,63415,(#ig-1)+61,61
                                            else
                                                Jt[2]=Jt[2]+Jt[5];
                                                Jt[1]=Jt[2]
                                                if Jt[2]~=Jt[2]then
                                                    wF=56489
                                                else
                                                    wF=30671
                                                end
                                            end
                                        end
                                    end)('Z','Z'),Og)
                                end
                                SF=SF..gf(eg(Yp(oz,14813-14757),-5518455/-21641),eg(Yp(oz,79248/1651),-4275330/-16766),eg(Yp(oz,-9149+9189),1103130/4326),eg(Yp(oz,0.11307420494699646*283),-4725660/-18532),eg(Yp(oz,-0.00088397790055248619*-27150),10730-10475),eg(Yp(oz,5768-5752),-21494+21749),eg(Yp(oz,-10248/-1281),0.085887504210171772*2969),eg(oz,-3668+3923))
                                return SF
                            end
                            local function rk(nD)
                                local ro={}
                                for xG=2160477/13761,(#nD)+-3840252/-24617,-316608/-4947 do
                                    YB(ro,nD[(function(Ip,wh_)
                                        local zt,bw,R,vz;
                                        R={};
                                        vz,bw=function(Sx,Rh,gc)
                                            bw[Sx]=E(gc,51224)-E(Rh,15323)
                                            return bw[Sx]
                                        end,{};
                                        zt=bw[-12805]or vz(-12805,6788,40741)
                                        while zt~=45732 do
                                            if zt>=28331 then
                                                if zt>=29477 then
                                                    if zt<=29477 then
                                                        R[1]=R[2]
                                                        if R[3]~=R[3]then
                                                            zt=bw[-19590]or vz(-19590,19820,643)
                                                        else
                                                            zt=22968
                                                        end
                                                    else
                                                        R[2]=R[2]+R[4];
                                                        R[1]=R[2]
                                                        if R[2]~=R[2]then
                                                            zt=bw[-23102]or vz(-23102,62832,125591)
                                                        else
                                                            zt=22968
                                                        end
                                                    end
                                                else
                                                    zt,R[5]=bw[18315]or vz(18315,25314,13929),R[5]..al(sf(Lr(Ip,(R[1]-165)+1),Lr(wh_,(R[1]-165)%#wh_+1)))
                                                end
                                            elseif zt>=21476 then
                                                if zt>21476 then
                                                    if(R[4]>=0 and R[2]>R[3])or((R[4]<0 or R[4]~=R[4])and R[2]<R[3])then
                                                        zt=bw[-28396]or vz(-28396,43901,11410)
                                                    else
                                                        zt=28331
                                                    end
                                                else
                                                    return R[5]
                                                end
                                            else
                                                R[5]='';
                                                R[4],R[2],R[3],zt=1,165,(#Ip-1)+165,29477
                                            end
                                        end
                                    end)('\30\24\15','m')](nD,(xG-(5196-5040)),(xG-0.0098828001267025657*15785)+667422/10594))
                                end
                                return ro
                            end
                            local function lq(Al,ax)
                                local Im={}
                                for IC=4725326/18826,(-30026+30090)+(-26667+26917)do
                                    if(IC-(25346-25096))<=-16818- -16834 then
                                        Im[(IC-0.0081875941573328094*30534)]=Ks(fi(Ci(Al,((IC-(-10657+10907))- -25872/-25872)*(-22738- -22742)+0.00021358393848782572*4682),691+-667),fi(Ci(Al,((IC-(14322+-14072))-(-29003+29004))*(2997+-2993)+(-15484- -15486)),35168/2198),fi(Ci(Al,((IC-(-2276- -2526))-2199/2199)*(17703+-17699)+-0.00018416206261510129*-16290),215208/26901),Ci(Al,((IC-1807250/7229)- -21883/-21883)*(-4748- -4752)+(-1450- -1454)))
                                    else
                                        local lE,Cl=Ht(bo(Im[(IC-(-26189- -26439))-10515/701],28416+-28409),bo(Im[(IC-(535+-285))-(28074-28059)],-27836- -27854),Yp(Im[(IC-(-1759+2009))-(10647+-10632)],-0.00026814444047193421*-11188)),Ht(bo(Im[(IC-45750/183)-4980/2490],218331/12843),bo(Im[(IC-(5651-5401))-(-1914+1916)],0.00067690334532758561*28069),Yp(Im[(IC-(2710+-2460))-(-22491- -22493)],-323570/-32357));
                                        Im[(IC-7165500/28662)]=eg(Im[(IC-(-27565+27815))-(-19424- -19440)]+lE+Im[(IC-(4652+-4402))- -126581/-18083]+Cl,4294958220- -9075)
                                    end
                                end
                                local hg,AB,kE,fg,Oa,Hz,pj,jr=fA(ax)
                                for Yr=-29954- -30083,(4497+-4433)+443648/3466 do
                                    local Pq,QE=Ht(bo(Oa,-26069- -26075),bo(Oa,17754+-17743),bo(Oa,19386+-19361)),Ht(eg(Oa,Hz),eg(st(Oa),pj))
                                    local Rf,iy,Xh=eg(jr+Pq+QE+mh[(Yr-(11384+-11256))]+Im[(Yr-(-12305- -12433))],4294965801- -1494),Ht(bo(hg,43774/21887),bo(hg,0.00091639644720146627*14186),bo(hg,0.0029298175522706085*7509)),Ht(eg(hg,AB),eg(hg,kE),eg(AB,kE))
                                    local Rb=eg(iy+Xh,4294977575+-10280);
                                    jr=pj;
                                    pj=Hz;
                                    Hz=Oa;
                                    Oa=eg(fg+Rf,4294965149- -2146);
                                    fg=kE;
                                    kE=AB;
                                    AB=hg;
                                    hg=eg(Rf+Rb,4294990637+-23342)
                                end
                                return eg(ax[-3857/-3857]+hg,4294992433+-25138),eg(ax[-7296/-3648]+AB,-3083786517810/-718),eg(ax[-0.00013118194936376755*-22869]+kE,-419021.19951219513*-10250),eg(ax[21464+-21460]+fg,4294981335+-14040),eg(ax[-21274+21279]+Oa,4294955927- -11368),eg(ax[-8115+8121]+Hz,48043504161870/11186),eg(ax[-16464+16471]+pj,4294965070- -2225),eg(ax[-231192/-28899]+jr,-355602.52483854943*-12078)
                            end
                            ia=W(ia)
                            local ii,Au,Ru=rk(ia),{414113.99045623839*4296,3144144172+-9895,1013927055-22813,2773505244+-24482,1359906574-13455,2600800039- -22885,528728133+6502,1541434585- -24640},''
                            for Bf,au in nC[(function(hz,bn)
                                local Ko,_r,Dc,sb;
                                sb={};
                                Ko,Dc=function(Ta,Yc,Tb)
                                    Dc[Ta]=E(Tb,47740)-E(Yc,52651)
                                    return Dc[Ta]
                                end,{};
                                _r=Dc[11009]or Ko(11009,10444,121601)
                                while _r~=63473 do
                                    if _r<=28057 then
                                        if _r<26430 then
                                            if _r>6331 then
                                                sb[1]=sb[2]
                                                if sb[3]~=sb[3]then
                                                    _r=26430
                                                else
                                                    _r=Dc[20222]or Ko(20222,21204,107911)
                                                end
                                            else
                                                sb[4],_r=sb[4]..al(sf(Lr(hz,(sb[1]-126)+1),Lr(bn,(sb[1]-126)%#bn+1))),Dc[-3741]or Ko(-3741,62158,5762)
                                            end
                                        elseif _r>26430 then
                                            sb[2]=sb[2]+sb[5];
                                            sb[1]=sb[2]
                                            if sb[2]~=sb[2]then
                                                _r=26430
                                            else
                                                _r=32892
                                            end
                                        else
                                            return sb[4]
                                        end
                                    elseif _r<=31766 then
                                        sb[4]='';
                                        _r,sb[2],sb[5],sb[3]=Dc[-26805]or Ko(-26805,22977,21970),126,1,(#hz-1)+126
                                    else
                                        if(sb[5]>=0 and sb[2]>sb[3])or((sb[5]<0 or sb[5]~=sb[5])and sb[2]<sb[3])then
                                            _r=26430
                                        else
                                            _r=Dc[19183]or Ko(19183,2921,25857)
                                        end
                                    end
                                end
                            end)('\227\175)\227\173;','\138\223H')](ii)do
                                Au={lq(au,Au)}
                            end
                            for Tp,p in nC[(function(Af,gB)
                                local UF,GD,ZC,Bq;
                                Bq={};
                                ZC,GD={},function(im,Re,P)
                                    ZC[P]=E(im,2324)-E(Re,20149)
                                    return ZC[P]
                                end;
                                UF=ZC[-18012]or GD(20418,18071,-18012)
                                while UF~=51504 do
                                    if UF<16052 then
                                        if UF>=8358 then
                                            if UF<=8358 then
                                                Bq[1],UF=Bq[1]..al(sf(Lr(Af,(Bq[2]-194)+1),Lr(gB,(Bq[2]-194)%#gB+1))),ZC[12885]or GD(125287,45625,12885)
                                            else
                                                Bq[2]=Bq[3]
                                                if Bq[4]~=Bq[4]then
                                                    UF=ZC[-28219]or GD(29919,28909,-28219)
                                                else
                                                    UF=ZC[11718]or GD(23928,31,11718)
                                                end
                                            end
                                        else
                                            if(Bq[5]>=0 and Bq[3]>Bq[4])or((Bq[5]<0 or Bq[5]~=Bq[5])and Bq[3]<Bq[4])then
                                                UF=16243
                                            else
                                                UF=8358
                                            end
                                        end
                                    elseif UF<=16243 then
                                        if UF>16052 then
                                            return Bq[1]
                                        else
                                            Bq[1]='';
                                            Bq[3],Bq[4],UF,Bq[5]=194,(#Af-1)+194,ZC[-23462]or GD(21935,25821,-23462),1
                                        end
                                    else
                                        Bq[3]=Bq[3]+Bq[5];
                                        Bq[2]=Bq[3]
                                        if Bq[3]~=Bq[3]then
                                            UF=16243
                                        else
                                            UF=1474
                                        end
                                    end
                                end
                            end)('\149\222k\149\220y','\252\174\n')](Au)do
                                Ru=Ru..gf(eg(Yp(p,-30787+30811),-0.011601455868971792*-21980));
                                Ru=Ru..gf(eg(Yp(p,-30695- -30711),-4973775/-19505));
                                Ru=Ru..gf(eg(Yp(p,0.00036919101019890167*21669),0.010046093842335421*25383));
                                Ru=Ru..gf(eg(p,23747+-23492))
                            end
                            return Ru
                        end
                        return zp
                    end)()),du[-31905]or Rw(69658,-31905,16664)
                end
            else
                qF,pA[4]=du[-17100]or Rw(62642,-17100,6466),'\144K'
            end
        elseif qF>97018896/18824 then
            pA[2],qF='\133\171/',27244+30134
        else
            qF,pA[7]=du[32044]or Rw(40527,32044,63633),'\203\131'
        end
    elseif qF>=1163+9266 then
        if qF>-4664- -17444 then
            if qF<=24267-9148 then
                pA[8],qF='\242\"\228x\162',du[-13124]or Rw(20581,-13124,14993)
            else
                fv,qF=((function()
                    local function sh(Jf,ev,Tm)
                        if ev>Tm then
                            return
                        end
                        return Jf[ev],sh(Jf,ev+1,Tm)
                    end
                    return sh
                end)()),du[-16318]or Rw(47675,-16318,6654)
            end
        elseif qF>15412-3216 then
            qF,pA[5]=du[-19015]or Rw(14401,-19015,27265),(function(Ya,di)
                local Dt,Az,Ag,he;
                Az={};
                Ag,Dt=function(uA,lk,pE)
                    Dt[lk]=E(uA,53968)-E(pE,58106)
                    return Dt[lk]
                end,{};
                he=Dt[-25299]or Ag(107596,-25299,18997)
                while he~=9655 do
                    if he<43064 then
                        if he<=31483 then
                            if he>10222 then
                                Az[1]=Az[2]
                                if Az[3]~=Az[3]then
                                    he=60835
                                else
                                    he=43064
                                end
                            else
                                Az[4],he=Az[4]..al(sf(Lr(Ya,(Az[1]-20)+1),Lr(di,(Az[1]-20)%#di+1))),Dt[-32623]or Ag(125730,-32623,21851)
                            end
                        else
                            Az[2]=Az[2]+Az[5];
                            Az[1]=Az[2]
                            if Az[2]~=Az[2]then
                                he=Dt[-18059]or Ag(107917,-18059,27456)
                            else
                                he=Dt[28933]or Ag(14094,28933,57180)
                            end
                        end
                    elseif he>52685 then
                        return Az[4]
                    elseif he<=43064 then
                        if(Az[5]>=0 and Az[2]>Az[3])or((Az[5]<0 or Az[5]~=Az[5])and Az[2]<Az[3])then
                            he=Dt[-17385]or Ag(98895,-17385,32774)
                        else
                            he=10222
                        end
                    else
                        Az[4]='';
                        Az[2],he,Az[5],Az[3]=20,31483,1,(#Ya-1)+20
                    end
                end
            end)(pA[5],pA[6])
        elseif qF<=-3.0646488392594771*-3403 then
            qF,pA[5]=1.9359361074929733*29174,nC[pA[5]]
        else
            qF,pA[7]=du[13828]or Rw(73837,13828,54600),{}
        end
    elseif qF>=-19549+26573 then
        if qF>-112046848/-15952 then
            qF,Ea=2.0911364472232439*27190,(function(eq)
                local ap=RD[eq]
                if not(ap)then
                else
                    return ap
                end
                local Qo,nm,zo,uv,te=yf(-2751+2752,-213048/-19368),yf(3302/3302,-0.0010599957600169599*-4717),29134+-29133,{},''
                while zo<=#eq do
                    local dz=A(eq,zo);
                    zo=zo+-7.0229650958634742e-05*-14239
                    for Wq=18152+-17946,(9883-9875)+-6599975/-32195 do
                        local Xk=nil
                        if not(Cw(dz,-5.2537564358516342e-05*-19034)~=0)then
                            if not(zo+-5.4306505919409147e-05*-18414<=#eq)then
                            else
                                local ye=ss((function(_k,gk)
                                    local tD,Tj,kn,vs;
                                    tD={};
                                    vs,Tj=function(uw,Qw,Ev)
                                        Tj[Qw]=E(uw,14647)-E(Ev,35756)
                                        return Tj[Qw]
                                    end,{};
                                    kn=Tj[-3054]or vs(34456,-3054,1822)
                                    while kn~=12015 do
                                        if kn<=19575 then
                                            if kn<13053 then
                                                if kn>3635 then
                                                    return tD[1]
                                                else
                                                    tD[1],kn=tD[1]..al(sf(Lr(_k,(tD[2]-35)+1),Lr(gk,(tD[2]-35)%#gk+1))),Tj[-25374]or vs(86487,-25374,29833)
                                                end
                                            elseif kn<=13053 then
                                                tD[1]='';
                                                tD[3],kn,tD[4],tD[5]=35,19575,1,(#_k-1)+35
                                            else
                                                tD[2]=tD[3]
                                                if tD[5]~=tD[5]then
                                                    kn=Tj[-3676]or vs(35732,-3676,3095)
                                                else
                                                    kn=47404
                                                end
                                            end
                                        elseif kn<=27067 then
                                            tD[3]=tD[3]+tD[4];
                                            tD[2]=tD[3]
                                            if tD[3]~=tD[3]then
                                                kn=10984
                                            else
                                                kn=47404
                                            end
                                        else
                                            if(tD[4]>=0 and tD[3]>tD[5])or((tD[4]<0 or tD[4]~=tD[4])and tD[3]<tD[5])then
                                                kn=10984
                                            else
                                                kn=3635
                                            end
                                        end
                                    end
                                end)('L;@','r'),eq,zo);
                                zo=zo+(892+-890)
                                local An,co=#te-JD(ye,70480/14096),Cw(ye,(nm-3.3345560038680849e-05*29989))+89652/29884;
                                Xk=mg(te,An,An+co-(1761-1760))
                            end
                        else
                            if not(zo<=#eq)then
                            else
                                Xk=mg(eq,zo,zo);
                                zo=zo+-26307/-26307
                            end
                        end
                        dz=JD(dz,3358/3358)
                        if Xk then
                            uv[#uv+(21558+-21557)]=Xk;
                            te=mg(te..Xk,-Qo)
                        end
                    end
                end
                local Ow=QF(uv);
                RD[eq]=Ow
                return Ow
            end)
        else
            qF,pA[5]=du[-9408]or Rw(67381,-9408,61205),'\247\56\225b\167'
        end
    elseif qF<=31822+-25463 then
        qF,pA[6]=947527035/30715,(function(sE,Ms)
            local vl,Ac,Mm,hf;
            Ac={};
            vl,hf={},function(kt,Gh,Mz)
                vl[Mz]=E(kt,52996)-E(Gh,57600)
                return vl[Mz]
            end;
            Mm=vl[-3825]or hf(106513,16706,-3825)
            while Mm~=36307 do
                if Mm>=50894 then
                    if Mm<52947 then
                        Ac[1]=Ac[1]+Ac[2];
                        Ac[3]=Ac[1]
                        if Ac[1]~=Ac[1]then
                            Mm=vl[9727]or hf(104417,23039,9727)
                        else
                            Mm=15093
                        end
                    elseif Mm>52947 then
                        Ac[4],Mm=Ac[4]..al(sf(Lr(sE,(Ac[3]-127)+1),Lr(Ms,(Ac[3]-127)%#Ms+1))),vl[-23863]or hf(97764,3346,-23863)
                    else
                        Ac[4]='';
                        Ac[5],Mm,Ac[2],Ac[1]=(#sE-1)+127,vl[-31261]or hf(7817,42887,-31261),1,127
                    end
                elseif Mm>=35590 then
                    if Mm<=35590 then
                        Ac[3]=Ac[1]
                        if Ac[5]~=Ac[5]then
                            Mm=40934
                        else
                            Mm=vl[-18985]or hf(122437,14156,-18985)
                        end
                    else
                        return Ac[4]
                    end
                else
                    if(Ac[2]>=0 and Ac[1]>Ac[5])or((Ac[2]<0 or Ac[2]~=Ac[2])and Ac[1]<Ac[5])then
                        Mm=vl[-32466]or hf(125587,25777,-32466)
                    else
                        Mm=vl[-22014]or hf(68728,12983,-22014)
                    end
                end
            end
        end)(pA[6],pA[7])
    else
        qF,pA[2]=du[-8390]or Rw(66237,-8390,29511),'H2\t'
    end
end
local aF,BB,tk,jf,Cq,aE,St,in_,o_,mq,Sp,Sw,qi,Uw,rv,mE,Kt,Ul,eB,Hm,yx,jG,GC,_m,ly,Vi,_j,eA,nb,Cs=nC[(function(Pj,Rg)
    local hA,Tn,iw,Zz;
    Zz={};
    hA,Tn=function(Vn,vp,Rq)
        Tn[Vn]=E(vp,54882)-E(Rq,40724)
        return Tn[Vn]
    end,{};
    iw=Tn[16808]or hA(16808,98356,65160)
    while iw~=40720 do
        if iw>31869 then
            if iw>54705 then
                Zz[1]='';
                Zz[2],Zz[3],Zz[4],iw=(#Pj-1)+213,213,1,Tn[-11965]or hA(-11965,123529,21399)
            else
                return Zz[1]
            end
        elseif iw>=26728 then
            if iw>26728 then
                iw,Zz[1]=Tn[19298]or hA(19298,42974,33910),Zz[1]..al(sf(Lr(Pj,(Zz[5]-213)+1),Lr(Rg,(Zz[5]-213)%#Rg+1)))
            else
                Zz[5]=Zz[3]
                if Zz[2]~=Zz[2]then
                    iw=54705
                else
                    iw=2921
                end
            end
        elseif iw<=2921 then
            if(Zz[4]>=0 and Zz[3]>Zz[2])or((Zz[4]<0 or Zz[4]~=Zz[4])and Zz[3]<Zz[2])then
                iw=54705
            else
                iw=31869
            end
        else
            Zz[3]=Zz[3]+Zz[4];
            Zz[5]=Zz[3]
            if Zz[3]~=Zz[3]then
                iw=Tn[-29883]or hA(-29883,85571,23908)
            else
                iw=Tn[-27523]or hA(-27523,37659,42244)
            end
        end
    end
end)('_T[H','+-')],nC[(function(uy,CE)
    local sF,Sy,Tr,rb;
    Sy={};
    Tr,sF={},function(Fy,Wb,Sn)
        Tr[Wb]=E(Sn,3510)-E(Fy,23508)
        return Tr[Wb]
    end;
    rb=Tr[-14923]or sF(34696,-14923,80335)
    while rb~=8483 do
        if rb<49800 then
            if rb<22557 then
                return Sy[1]
            elseif rb>22557 then
                if(Sy[2]>=0 and Sy[3]>Sy[4])or((Sy[2]<0 or Sy[2]~=Sy[2])and Sy[3]<Sy[4])then
                    rb=Tr[24578]or sF(3239,24578,42139)
                else
                    rb=Tr[7309]or sF(16171,7309,85579)
                end
            else
                Sy[1]='';
                Sy[2],rb,Sy[3],Sy[4]=1,Tr[-1811]or sF(11305,-1811,92582),155,(#uy-1)+155
            end
        elseif rb<57086 then
            Sy[3]=Sy[3]+Sy[2];
            Sy[5]=Sy[3]
            if Sy[3]~=Sy[3]then
                rb=Tr[3112]or sF(21147,3112,22207)
            else
                rb=40892
            end
        elseif rb<=57086 then
            Sy[1],rb=Sy[1]..al(sf(Lr(uy,(Sy[5]-155)+1),Lr(CE,(Sy[5]-155)%#CE+1))),Tr[9679]or sF(13974,9679,74364)
        else
            Sy[5]=Sy[3]
            if Sy[4]~=Sy[4]then
                rb=20922
            else
                rb=40892
            end
        end
    end
end)('&\130\55\141:','V\225')],nC[(function(ta,ud)
    local Fi,Rd,Ys,Ap;
    Fi={};
    Ys,Rd=function(xc,ll,qd)
        Rd[ll]=E(xc,55041)-E(qd,6020)
        return Rd[ll]
    end,{};
    Ap=Rd[-29887]or Ys(105749,-29887,55495)
    repeat
        if Ap<=31441 then
            if Ap<30263 then
                if Ap>1148 then
                    if(Fi[1]>=0 and Fi[2]>Fi[3])or((Fi[1]<0 or Fi[1]~=Fi[1])and Fi[2]<Fi[3])then
                        Ap=1148
                    else
                        Ap=60593
                    end
                else
                    return Fi[4]
                end
            elseif Ap<=30263 then
                Fi[5]=Fi[2]
                if Fi[3]~=Fi[3]then
                    Ap=Rd[-26982]or Ys(61019,-26982,9050)
                else
                    Ap=13304
                end
            else
                Fi[4]='';
                Ap,Fi[3],Fi[1],Fi[2]=Rd[-30173]or Ys(127789,-30173,47729),(#ta-1)+150,1,150
            end
        elseif Ap<=57655 then
            Fi[2]=Fi[2]+Fi[1];
            Fi[5]=Fi[2]
            if Fi[2]~=Fi[2]then
                Ap=1148
            else
                Ap=Rd[-19161]or Ys(40516,-19161,713)
            end
        else
            Ap,Fi[4]=Rd[-17286]or Ys(97522,-17286,56632),Fi[4]..al(sf(Lr(ta,(Fi[5]-150)+1),Lr(ud,(Fi[5]-150)%#ud+1)))
        end
    until Ap==42737
end)('\137\239\158\242\158','\236\157')],nC[(function(Nr,gm)
    local ps,L,Lp,Gj;
    ps={};
    L,Gj=function(lx,dw,Pg)
        Gj[lx]=E(Pg,23411)-E(dw,52948)
        return Gj[lx]
    end,{};
    Lp=Gj[30640]or L(30640,34372,51021)
    while Lp~=52197 do
        if Lp>=50072 then
            if Lp>58223 then
                if(ps[1]>=0 and ps[2]>ps[3])or((ps[1]<0 or ps[1]~=ps[1])and ps[2]<ps[3])then
                    Lp=23837
                else
                    Lp=58223
                end
            elseif Lp>50072 then
                ps[4],Lp=ps[4]..al(sf(Lr(Nr,(ps[5]-115)+1),Lr(gm,(ps[5]-115)%#gm+1))),Gj[-88]or L(-88,65055,14970)
            else
                ps[5]=ps[2]
                if ps[3]~=ps[3]then
                    Lp=23837
                else
                    Lp=Gj[-20166]or L(-20166,40569,71027)
                end
            end
        elseif Lp>=21422 then
            if Lp<=21422 then
                ps[4]='';
                ps[3],Lp,ps[1],ps[2]=(#Nr-1)+115,50072,1,115
            else
                return ps[4]
            end
        else
            ps[2]=ps[2]+ps[1];
            ps[5]=ps[2]
            if ps[2]~=ps[2]then
                Lp=23837
            else
                Lp=64851
            end
        end
    end
end)('\24??\247\1\50\52\240','lPQ\130')],nC[(function(po,eh)
    local sm,en_,HA,TA;
    en_={};
    sm,HA={},function(Gm,Ay,PD)
        sm[Gm]=E(Ay,8711)-E(PD,15501)
        return sm[Gm]
    end;
    TA=sm[-15662]or HA(-15662,63522,5046)
    while TA~=46949 do
        if TA<36704 then
            if TA>=24084 then
                if TA<=24084 then
                    en_[1]=en_[2]
                    if en_[3]~=en_[3]then
                        TA=sm[22039]or HA(22039,37010,20557)
                    else
                        TA=27236
                    end
                else
                    if(en_[4]>=0 and en_[2]>en_[3])or((en_[4]<0 or en_[4]~=en_[4])and en_[2]<en_[3])then
                        TA=sm[20295]or HA(20295,51681,39580)
                    else
                        TA=63767
                    end
                end
            else
                return en_[5]
            end
        elseif TA>=43754 then
            if TA>43754 then
                TA,en_[5]=sm[-22982]or HA(-22982,84381,57527),en_[5]..al(sf(Lr(po,(en_[1]-245)+1),Lr(eh,(en_[1]-245)%#eh+1)))
            else
                en_[5]='';
                en_[3],en_[4],en_[2],TA=(#po-1)+245,1,245,24084
            end
        else
            en_[2]=en_[2]+en_[4];
            en_[1]=en_[2]
            if en_[2]~=en_[2]then
                TA=sm[-30945]or HA(-30945,64244,44947)
            else
                TA=27236
            end
        end
    end
end)('\a\213\179\3\212\180','f\166\192')],nC[(function(qk,nh)
    local gi,bp,Be,rl;
    gi={};
    Be,bp={},function(GB,qe,Zt)
        Be[Zt]=E(qe,22855)-E(GB,52102)
        return Be[Zt]
    end;
    rl=Be[-27585]or bp(26895,36986,-27585)
    while rl~=28180 do
        if rl<15952 then
            if rl<=3557 then
                if rl<=2817 then
                    return gi[1]
                else
                    if(gi[2]>=0 and gi[3]>gi[4])or((gi[2]<0 or gi[2]~=gi[2])and gi[3]<gi[4])then
                        rl=2817
                    else
                        rl=Be[-17496]or bp(50717,44142,-17496)
                    end
                end
            else
                gi[1]='';
                rl,gi[2],gi[4],gi[3]=Be[24183]or bp(37086,49391,24183),1,(#qk-1)+245,245
            end
        elseif rl<=45593 then
            if rl<=15952 then
                gi[5]=gi[3]
                if gi[4]~=gi[4]then
                    rl=Be[-31642]or bp(28713,40951,-31642)
                else
                    rl=3557
                end
            else
                gi[3]=gi[3]+gi[2];
                gi[5]=gi[3]
                if gi[3]~=gi[3]then
                    rl=Be[-12929]or bp(18450,55250,-12929)
                else
                    rl=Be[-417]or bp(39823,1193,-417)
                end
            end
        else
            gi[1],rl=gi[1]..al(sf(Lr(qk,(gi[5]-245)+1),Lr(nh,(gi[5]-245)%#nh+1))),Be[29619]or bp(17721,72095,29619)
        end
    end
end)('\200\139\145\222\141\137','\187\238\253')],nC[(function(qz,Vb)
    local cy,sG,bB,Vx;
    cy={};
    bB,Vx=function(Qz,pg,zA)
        Vx[zA]=E(Qz,24869)-E(pg,54137)
        return Vx[zA]
    end,{};
    sG=Vx[30514]or bB(44609,64430,30514)
    while sG~=60276 do
        if sG>34599 then
            if sG<=42637 then
                cy[1]='';
                cy[2],cy[3],cy[4],sG=(#qz-1)+86,86,1,Vx[14905]or bB(92578,21017,14905)
            else
                cy[3]=cy[3]+cy[4];
                cy[5]=cy[3]
                if cy[3]~=cy[3]then
                    sG=Vx[-11968]or bB(16716,56350,-11968)
                else
                    sG=28389
                end
            end
        elseif sG>28389 then
            cy[5]=cy[3]
            if cy[2]~=cy[2]then
                sG=4354
            else
                sG=28389
            end
        elseif sG<5849 then
            return cy[1]
        elseif sG<=5849 then
            sG,cy[1]=Vx[-25009]or bB(79494,49097,-25009),cy[1]..al(sf(Lr(qz,(cy[5]-86)+1),Lr(Vb,(cy[5]-86)%#Vb+1)))
        else
            if(cy[4]>=0 and cy[3]>cy[2])or((cy[4]<0 or cy[4]~=cy[4])and cy[3]<cy[2])then
                sG=4354
            else
                sG=5849
            end
        end
    end
end)('\180\190\24GF\240\166\175\rHO\225','\199\219l*#\132')],nC[(function(mG,Pp)
    local Fa,yC,Oe,fb;
    Oe={};
    yC,Fa=function(Pa,Eo,Ce)
        Fa[Eo]=E(Ce,39625)-E(Pa,19512)
        return Fa[Eo]
    end,{};
    fb=Fa[-24676]or yC(51229,-24676,130204)
    while fb~=65274 do
        if fb>57904 then
            if fb>59335 then
                Oe[1],fb=Oe[1]..al(sf(Lr(mG,(Oe[2]-214)+1),Lr(Pp,(Oe[2]-214)%#Pp+1))),Fa[879]or yC(57028,879,130503)
            else
                if(Oe[3]>=0 and Oe[4]>Oe[5])or((Oe[3]<0 or Oe[3]~=Oe[3])and Oe[4]<Oe[5])then
                    fb=Fa[-2489]or yC(36641,-2489,73634)
                else
                    fb=63273
                end
            end
        elseif fb<54290 then
            if fb<=34698 then
                Oe[2]=Oe[4]
                if Oe[5]~=Oe[5]then
                    fb=49746
                else
                    fb=59335
                end
            else
                return Oe[1]
            end
        elseif fb>54290 then
            Oe[1]='';
            fb,Oe[5],Oe[4],Oe[3]=Fa[-6094]or yC(9774,-6094,27497),(#mG-1)+214,214,1
        else
            Oe[4]=Oe[4]+Oe[3];
            Oe[2]=Oe[4]
            if Oe[4]~=Oe[4]then
                fb=49746
            else
                fb=59335
            end
        end
    end
end)('\27\132\a\1\158\18','h\240u')][(function(LE,Xl)
    local yj,oq,_c,Ph;
    yj={};
    Ph,oq={},function(YD,pB,wf)
        Ph[wf]=E(pB,63293)-E(YD,14820)
        return Ph[wf]
    end;
    _c=Ph[20110]or oq(8405,38337,20110)
    while _c~=53567 do
        if _c>38148 then
            if _c>40808 then
                yj[1]=yj[1]+yj[2];
                yj[3]=yj[1]
                if yj[1]~=yj[1]then
                    _c=Ph[-13418]or oq(41037,118316,-13418)
                else
                    _c=27757
                end
            else
                return yj[4]
            end
        elseif _c>=27757 then
            if _c>27757 then
                yj[4],_c=yj[4]..al(sf(Lr(LE,(yj[3]-119)+1),Lr(Xl,(yj[3]-119)%#Xl+1))),Ph[-10104]or oq(14238,12949,-10104)
            else
                if(yj[2]>=0 and yj[1]>yj[5])or((yj[2]<0 or yj[2]~=yj[2])and yj[1]<yj[5])then
                    _c=Ph[21598]or oq(3659,8234,21598)
                else
                    _c=38148
                end
            end
        elseif _c>3062 then
            yj[4]='';
            _c,yj[2],yj[5],yj[1]=3062,1,(#LE-1)+119,119
        else
            yj[3]=yj[1]
            if yj[5]~=yj[5]then
                _c=40808
            else
                _c=Ph[-1245]or oq(48523,2017,-1245)
            end
        end
    end
end)('\186F%\177H#','\220)W')],nC[(function(Hn,Ba)
    local By,Od,xv,Jw;
    xv={};
    By,Jw=function(_x,vw,Jj)
        Jw[Jj]=E(vw,41963)-E(_x,64661)
        return Jw[Jj]
    end,{};
    Od=Jw[26273]or By(8639,130972,26273)
    repeat
        if Od>32589 then
            if Od>43467 then
                return xv[1]
            else
                if(xv[2]>=0 and xv[3]>xv[4])or((xv[2]<0 or xv[2]~=xv[2])and xv[3]<xv[4])then
                    Od=Jw[11548]or By(65239,3308,11548)
                else
                    Od=Jw[-2371]or By(36813,14134,-2371)
                end
            end
        elseif Od>=8581 then
            if Od>8581 then
                xv[1]='';
                xv[4],xv[2],xv[3],Od=(#Hn-1)+75,1,75,Jw[24015]or By(30417,11713,24015)
            else
                Od,xv[1]=Jw[-15325]or By(9925,20458,-15325),xv[1]..al(sf(Lr(Hn,(xv[5]-75)+1),Lr(Ba,(xv[5]-75)%#Ba+1)))
            end
        elseif Od<=998 then
            xv[5]=xv[3]
            if xv[4]~=xv[4]then
                Od=Jw[30991]or By(37966,112203,30991)
            else
                Od=43467
            end
        else
            xv[3]=xv[3]+xv[2];
            xv[5]=xv[3]
            if xv[3]~=xv[3]then
                Od=Jw[375]or By(12991,121092,375)
            else
                Od=43467
            end
        end
    until Od==26276
end)('2\129\231(\155\242','A\245\149')][(function(jo,Kf)
    local Hg,hk,lg,Jd;
    Jd={};
    hk,lg=function(Tq,oe,Xj)
        lg[oe]=E(Xj,6349)-E(Tq,16374)
        return lg[oe]
    end,{};
    Hg=lg[11720]or hk(18585,11720,40401)
    repeat
        if Hg<=21702 then
            if Hg>7444 then
                Hg,Jd[1]=lg[-23611]or hk(44281,-23611,60628),Jd[1]..al(sf(Lr(jo,(Jd[2]-250)+1),Lr(Kf,(Jd[2]-250)%#Kf+1)))
            elseif Hg>3501 then
                Jd[2]=Jd[3]
                if Jd[4]~=Jd[4]then
                    Hg=lg[-24972]or hk(33914,-24972,102143)
                else
                    Hg=765
                end
            elseif Hg<=765 then
                if(Jd[5]>=0 and Jd[3]>Jd[4])or((Jd[5]<0 or Jd[5]~=Jd[5])and Jd[3]<Jd[4])then
                    Hg=55974
                else
                    Hg=21702
                end
            else
                Jd[1]='';
                Jd[4],Jd[5],Jd[3],Hg=(#jo-1)+250,1,250,lg[-20927]or hk(62169,-20927,62094)
            end
        elseif Hg<=24842 then
            Jd[3]=Jd[3]+Jd[5];
            Jd[2]=Jd[3]
            if Jd[3]~=Jd[3]then
                Hg=lg[-18433]or hk(17085,-18433,85820)
            else
                Hg=lg[-30546]or hk(21366,-30546,30640)
            end
        else
            return Jd[1]
        end
    until Hg==50067
end)('r\200\229f\197\254','\a\166\149')],nC[(function(Ol,Gc)
    local e_,Xi,Aa,zB;
    e_={};
    Xi,Aa={},function(iB,Ww,mc)
        Xi[mc]=E(Ww,37842)-E(iB,27246)
        return Xi[mc]
    end;
    zB=Xi[12986]or Aa(6769,21688,12986)
    repeat
        if zB>=39585 then
            if zB<54260 then
                return e_[1]
            elseif zB<=54260 then
                e_[2]=e_[3]
                if e_[4]~=e_[4]then
                    zB=39585
                else
                    zB=10382
                end
            else
                e_[3]=e_[3]+e_[5];
                e_[2]=e_[3]
                if e_[3]~=e_[3]then
                    zB=Xi[19106]or Aa(13047,24808,19106)
                else
                    zB=10382
                end
            end
        elseif zB>20254 then
            e_[1]='';
            e_[4],e_[5],zB,e_[3]=(#Ol-1)+235,1,54260,235
        elseif zB<=10382 then
            if(e_[5]>=0 and e_[3]>e_[4])or((e_[5]<0 or e_[5]~=e_[5])and e_[3]<e_[4])then
                zB=39585
            else
                zB=Xi[-26842]or Aa(63222,30820,-26842)
            end
        else
            zB,e_[1]=Xi[-12028]or Aa(55662,72290,-12028),e_[1]..al(sf(Lr(Ol,(e_[2]-235)+1),Lr(Gc,(e_[2]-235)%#Gc+1)))
        end
    until zB==46842
end)('\250\137|\224\147i','\137\253\14')][(function(Br,np)
    local Dq,Zx,Sm,Xz;
    Zx={};
    Xz,Sm={},function(Wy,ts,tb)
        Xz[tb]=E(Wy,12252)-E(ts,64538)
        return Xz[tb]
    end;
    Dq=Xz[4191]or Sm(21594,44039,4191)
    while Dq~=19298 do
        if Dq>24080 then
            if Dq>38894 then
                Zx[1]=Zx[1]+Zx[2];
                Zx[3]=Zx[1]
                if Zx[1]~=Zx[1]then
                    Dq=38894
                else
                    Dq=24080
                end
            else
                return Zx[4]
            end
        elseif Dq>11254 then
            if(Zx[2]>=0 and Zx[1]>Zx[5])or((Zx[2]<0 or Zx[2]~=Zx[2])and Zx[1]<Zx[5])then
                Dq=Xz[-23046]or Sm(46578,65114,-23046)
            else
                Dq=11254
            end
        elseif Dq<=11113 then
            if Dq<=10711 then
                Zx[3]=Zx[1]
                if Zx[5]~=Zx[5]then
                    Dq=38894
                else
                    Dq=24080
                end
            else
                Zx[4]='';
                Zx[5],Zx[1],Dq,Zx[2]=(#Br-1)+206,206,10711,1
            end
        else
            Zx[4],Dq=Zx[4]..al(sf(Lr(Br,(Zx[3]-206)+1),Lr(np,(Zx[3]-206)%#np+1))),Xz[-24058]or Sm(77805,47395,-24058)
        end
    end
end)('\209\215\192','\162')],nC[(function(yw,z)
    local Dk,gA,Ur,sk;
    Ur={};
    Dk,gA=function(xe,SB,dy)
        gA[SB]=E(xe,52239)-E(dy,7051)
        return gA[SB]
    end,{};
    sk=gA[1469]or Dk(949,1469,40771)
    repeat
        if sk<19801 then
            if sk>7659 then
                Ur[1]='';
                Ur[2],Ur[3],sk,Ur[4]=1,(#yw-1)+213,gA[-24425]or Dk(29662,-24425,47725),213
            elseif sk>7299 then
                Ur[5]=Ur[4]
                if Ur[3]~=Ur[3]then
                    sk=gA[-8180]or Dk(43121,-8180,3246)
                else
                    sk=7299
                end
            else
                if(Ur[2]>=0 and Ur[4]>Ur[3])or((Ur[2]<0 or Ur[2]~=Ur[2])and Ur[4]<Ur[3])then
                    sk=19801
                else
                    sk=gA[-23250]or Dk(104091,-23250,57011)
                end
            end
        elseif sk<25781 then
            return Ur[1]
        elseif sk>25781 then
            Ur[1],sk=Ur[1]..al(sf(Lr(yw,(Ur[5]-213)+1),Lr(z,(Ur[5]-213)%#z+1))),gA[9867]or Dk(24413,9867,13590)
        else
            Ur[4]=Ur[4]+Ur[2];
            Ur[5]=Ur[4]
            if Ur[4]~=Ur[4]then
                sk=gA[-23675]or Dk(21890,-23675,22463)
            else
                sk=7299
            end
        end
    until sk==19882
end)('%\155d?\129q','V\239\22')][(function(Nm,rx)
    local j,Ik,bD,ij;
    ij={};
    j,Ik={},function(N,Tt,BA)
        j[BA]=E(N,46566)-E(Tt,50246)
        return j[BA]
    end;
    bD=j[17243]or Ik(964,27775,17243)
    repeat
        if bD<=41178 then
            if bD>17436 then
                return ij[1]
            elseif bD>14508 then
                ij[2]=ij[3]
                if ij[4]~=ij[4]then
                    bD=j[-7951]or Ik(101201,22939,-7951)
                else
                    bD=14508
                end
            elseif bD<=3561 then
                ij[1]='';
                ij[5],ij[4],bD,ij[3]=1,(#Nm-1)+39,17436,39
            else
                if(ij[5]>=0 and ij[3]>ij[4])or((ij[5]<0 or ij[5]~=ij[5])and ij[3]<ij[4])then
                    bD=41178
                else
                    bD=48503
                end
            end
        elseif bD>48503 then
            ij[3]=ij[3]+ij[5];
            ij[2]=ij[3]
            if ij[3]~=ij[3]then
                bD=j[21818]or Ik(19328,39370,21818)
            else
                bD=14508
            end
        else
            ij[1],bD=ij[1]..al(sf(Lr(Nm,(ij[2]-39)+1),Lr(rx,(ij[2]-39)%#rx+1))),j[8058]or Ik(96918,12089,8058)
        end
    until bD==35773
end)('\239\229\249\249','\141\156')],nC[(function(Ls,er)
    local pG,Mn,Eu,aA;
    aA={};
    Mn,Eu=function(za,Gi,oy)
        Eu[oy]=E(za,26920)-E(Gi,33425)
        return Eu[oy]
    end,{};
    pG=Eu[-31351]or Mn(48129,14504,-31351)
    while pG~=23280 do
        if pG>52950 then
            if pG>56524 then
                return aA[1]
            else
                aA[2]=aA[3]
                if aA[4]~=aA[4]then
                    pG=Eu[32205]or Mn(83184,48580,32205)
                else
                    pG=Eu[699]or Mn(68063,8823,699)
                end
            end
        elseif pG>=49169 then
            if pG<=49169 then
                if(aA[5]>=0 and aA[3]>aA[4])or((aA[5]<0 or aA[5]~=aA[5])and aA[3]<aA[4])then
                    pG=Eu[15687]or Mn(40176,34244,15687)
                else
                    pG=Eu[19811]or Mn(47640,49216,19811)
                end
            else
                aA[3]=aA[3]+aA[5];
                aA[2]=aA[3]
                if aA[3]~=aA[3]then
                    pG=Eu[-10726]or Mn(115961,15839,-10726)
                else
                    pG=49169
                end
            end
        elseif pG<=6896 then
            aA[1]='';
            aA[4],aA[3],aA[5],pG=(#Ls-1)+150,150,1,56524
        else
            pG,aA[1]=Eu[18108]or Mn(32865,39138,18108),aA[1]..al(sf(Lr(Ls,(aA[2]-150)+1),Lr(er,(aA[2]-150)%#er+1)))
        end
    end
end)('\214\194\141\204\216\152','\165\182\255')][(function(Se,aa)
    local Sf,Eh,EC,fm;
    Sf={};
    fm,Eh=function(XA,Uv,xr)
        Eh[Uv]=E(XA,46629)-E(xr,31975)
        return Eh[Uv]
    end,{};
    EC=Eh[-26437]or fm(70748,-26437,37019)
    repeat
        if EC<29751 then
            if EC>=15121 then
                if EC>15121 then
                    return Sf[1]
                else
                    if(Sf[2]>=0 and Sf[3]>Sf[4])or((Sf[2]<0 or Sf[2]~=Sf[2])and Sf[3]<Sf[4])then
                        EC=Eh[6521]or fm(17504,6521,55794)
                    else
                        EC=29751
                    end
                end
            else
                Sf[5]=Sf[3]
                if Sf[4]~=Sf[4]then
                    EC=Eh[29604]or fm(27893,29604,61767)
                else
                    EC=15121
                end
            end
        elseif EC<=46589 then
            if EC<=29751 then
                Sf[1],EC=Sf[1]..al(sf(Lr(Se,(Sf[5]-155)+1),Lr(aa,(Sf[5]-155)%#aa+1))),Eh[30330]or fm(121471,30330,62507)
            else
                Sf[1]='';
                EC,Sf[2],Sf[3],Sf[4]=12615,1,155,(#Se-1)+155
            end
        else
            Sf[3]=Sf[3]+Sf[2];
            Sf[5]=Sf[3]
            if Sf[3]~=Sf[3]then
                EC=Eh[-17231]or fm(11570,-17231,12544)
            else
                EC=15121
            end
        end
    until EC==56665
end)('\141\165\143\191','\238\205')],nC[(function(go,bG)
    local Hl,ut,vm,qG;
    Hl={};
    qG,ut={},function(wm,rj,um)
        qG[um]=E(rj,43926)-E(wm,12585)
        return qG[um]
    end;
    vm=qG[-3400]or ut(19514,129832,-3400)
    while vm~=14130 do
        if vm<=50747 then
            if vm>35541 then
                if(Hl[1]>=0 and Hl[2]>Hl[3])or((Hl[1]<0 or Hl[1]~=Hl[1])and Hl[2]<Hl[3])then
                    vm=35541
                else
                    vm=33601
                end
            elseif vm>=33601 then
                if vm>33601 then
                    return Hl[4]
                else
                    vm,Hl[4]=qG[25552]or ut(23560,18392,25552),Hl[4]..al(sf(Lr(go,(Hl[5]-213)+1),Lr(bG,(Hl[5]-213)%#bG+1)))
                end
            else
                Hl[2]=Hl[2]+Hl[1];
                Hl[5]=Hl[2]
                if Hl[2]~=Hl[2]then
                    vm=qG[-21802]or ut(17842,21734,-21802)
                else
                    vm=50747
                end
            end
        elseif vm>54187 then
            Hl[5]=Hl[2]
            if Hl[3]~=Hl[3]then
                vm=qG[6241]or ut(3382,28002,6241)
            else
                vm=qG[-25905]or ut(34182,119164,-25905)
            end
        else
            Hl[4]='';
            vm,Hl[3],Hl[1],Hl[2]=qG[-32758]or ut(44614,78990,-32758),(#go-1)+213,1,213
        end
    end
end)('Y\231O\234H','-\134')][(function(wG,Do)
    local xD,Md,Fg,Ij;
    Ij={};
    Md,Fg={},function(_w,Fh,oA)
        Md[oA]=E(_w,41692)-E(Fh,31319)
        return Md[oA]
    end;
    xD=Md[-8403]or Fg(29842,30588,-8403)
    repeat
        if xD>51491 then
            if xD<=54287 then
                Ij[1]=Ij[2]
                if Ij[3]~=Ij[3]then
                    xD=Md[-16006]or Fg(124688,12718,-16006)
                else
                    xD=4619
                end
            else
                return Ij[4]
            end
        elseif xD<=27872 then
            if xD>=25545 then
                if xD<=25545 then
                    Ij[2]=Ij[2]+Ij[5];
                    Ij[1]=Ij[2]
                    if Ij[2]~=Ij[2]then
                        xD=Md[21884]or Fg(108094,29016,21884)
                    else
                        xD=Md[-16759]or Fg(55576,5102,-16759)
                    end
                else
                    xD,Ij[4]=Md[17510]or Fg(23952,57812,17510),Ij[4]..al(sf(Lr(wG,(Ij[1]-10)+1),Lr(Do,(Ij[1]-10)%#Do+1)))
                end
            else
                if(Ij[5]>=0 and Ij[2]>Ij[3])or((Ij[5]<0 or Ij[5]~=Ij[5])and Ij[2]<Ij[3])then
                    xD=63955
                else
                    xD=Md[10999]or Fg(104527,47076,10999)
                end
            end
        else
            Ij[4]='';
            Ij[5],xD,Ij[2],Ij[3]=1,54287,10,(#wG-1)+10
        end
    until xD==19855
end)('j\bq\2','\ag')],nC[(function(nu,On)
    local Le,ku,jn,am;
    jn={};
    ku,am={},function(xn,jm,gg)
        ku[gg]=E(xn,13628)-E(jm,46234)
        return ku[gg]
    end;
    Le=ku[23044]or am(77579,8561,23044)
    repeat
        if Le<=49451 then
            if Le>=33868 then
                if Le<=33868 then
                    jn[1]='';
                    jn[2],jn[3],Le,jn[4]=1,(#nu-1)+151,ku[-31553]or am(93766,11989,-31553),151
                else
                    jn[5]=jn[4]
                    if jn[3]~=jn[3]then
                        Le=ku[-20716]or am(65776,1311,-20716)
                    else
                        Le=ku[-19803]or am(114567,6382,-19803)
                    end
                end
            elseif Le<=971 then
                jn[1],Le=jn[1]..al(sf(Lr(nu,(jn[5]-151)+1),Lr(On,(jn[5]-151)%#On+1))),ku[14809]or am(85060,1480,14809)
            else
                return jn[1]
            end
        elseif Le>51238 then
            if(jn[2]>=0 and jn[4]>jn[3])or((jn[2]<0 or jn[2]~=jn[2])and jn[4]<jn[3])then
                Le=ku[25862]or am(79936,15791,25862)
            else
                Le=971
            end
        else
            jn[4]=jn[4]+jn[2];
            jn[5]=jn[4]
            if jn[4]~=jn[4]then
                Le=ku[-27742]or am(52756,49787,-27742)
            else
                Le=ku[-999]or am(99546,26373,-999)
            end
        end
    until Le==9954
end)('\140O\154B\157','\248.')][(function(Ln,it)
    local Nc,LC,RE,yb;
    Nc={};
    LC,RE=function(Of,Pw,Cb)
        RE[Cb]=E(Pw,24719)-E(Of,19211)
        return RE[Cb]
    end,{};
    yb=RE[17318]or LC(23157,34307,17318)
    repeat
        if yb<=30404 then
            if yb>=23646 then
                if yb>23646 then
                    yb,Nc[1]=RE[-21978]or LC(52472,45866,-21978),Nc[1]..al(sf(Lr(Ln,(Nc[2]-32)+1),Lr(it,(Nc[2]-32)%#it+1)))
                else
                    return Nc[1]
                end
            elseif yb>9381 then
                Nc[3]=Nc[3]+Nc[4];
                Nc[2]=Nc[3]
                if Nc[3]~=Nc[3]then
                    yb=RE[26444]or LC(41231,75501,26444)
                else
                    yb=9381
                end
            else
                if(Nc[4]>=0 and Nc[3]>Nc[5])or((Nc[4]<0 or Nc[4]~=Nc[4])and Nc[3]<Nc[5])then
                    yb=RE[10738]or LC(16540,1914,10738)
                else
                    yb=30404
                end
            end
        elseif yb>51838 then
            Nc[1]='';
            Nc[4],Nc[3],yb,Nc[5]=1,32,RE[9273]or LC(25402,37408,9273),(#Ln-1)+32
        else
            Nc[2]=Nc[3]
            if Nc[5]~=Nc[5]then
                yb=23646
            else
                yb=RE[-1573]or LC(43654,91837,-1573)
            end
        end
    until yb==47287
end)('\a\181\20\191','w\212')],nC[(function(Vj,Rn)
    local Fx,Rp,zl,Cd;
    zl={};
    Fx,Rp=function(tu,Qf,Ep)
        Rp[Ep]=E(tu,13808)-E(Qf,1366)
        return Rp[Ep]
    end,{};
    Cd=Rp[27902]or Fx(109624,54666,27902)
    repeat
        if Cd<=51436 then
            if Cd<24483 then
                if Cd>21524 then
                    Cd,zl[1]=Rp[-10599]or Fx(39715,24553,-10599),zl[1]..al(sf(Lr(Vj,(zl[2]-159)+1),Lr(Rn,(zl[2]-159)%#Rn+1)))
                else
                    zl[3]=zl[3]+zl[4];
                    zl[2]=zl[3]
                    if zl[3]~=zl[3]then
                        Cd=51665
                    else
                        Cd=24483
                    end
                end
            elseif Cd>24483 then
                zl[1]='';
                zl[4],zl[3],Cd,zl[5]=1,159,60002,(#Vj-1)+159
            else
                if(zl[4]>=0 and zl[3]>zl[5])or((zl[4]<0 or zl[4]~=zl[4])and zl[3]<zl[5])then
                    Cd=Rp[23679]or Fx(84497,45894,23679)
                else
                    Cd=Rp[1190]or Fx(53318,36422,1190)
                end
            end
        elseif Cd>51665 then
            zl[2]=zl[3]
            if zl[5]~=zl[5]then
                Cd=Rp[-30083]or Fx(97728,31497,-30083)
            else
                Cd=24483
            end
        else
            return zl[1]
        end
    until Cd==9818
end)(':\165,\168+','N\196')][(function(Ui,jD)
    local hF,cg,Cm,Oz;
    cg={};
    hF,Cm={},function(Qb,hb,se_)
        hF[hb]=E(Qb,31800)-E(se_,32223)
        return hF[hb]
    end;
    Oz=hF[16303]or Cm(90432,16303,2820)
    repeat
        if Oz<=54113 then
            if Oz<42653 then
                if Oz>20879 then
                    if(cg[1]>=0 and cg[2]>cg[3])or((cg[1]<0 or cg[1]~=cg[1])and cg[2]<cg[3])then
                        Oz=20879
                    else
                        Oz=60348
                    end
                else
                    return cg[4]
                end
            elseif Oz>42653 then
                cg[5]=cg[2]
                if cg[3]~=cg[3]then
                    Oz=20879
                else
                    Oz=38877
                end
            else
                cg[4]='';
                cg[1],cg[3],Oz,cg[2]=1,(#Ui-1)+39,54113,39
            end
        elseif Oz>60348 then
            cg[2]=cg[2]+cg[1];
            cg[5]=cg[2]
            if cg[2]~=cg[2]then
                Oz=hF[-2825]or Cm(41468,-2825,61930)
            else
                Oz=38877
            end
        else
            Oz,cg[4]=hF[-26119]or Cm(114422,-26119,45232),cg[4]..al(sf(Lr(Ui,(cg[5]-39)+1),Lr(jD,(cg[5]-39)%#jD+1)))
        end
    until Oz==17276
end)('\15\212\27\r\210\27','l\166~')],nC[(function(zy,kA)
    local vA,Bw,Cy,fD;
    fD={};
    vA,Bw=function(zF,vB,fr)
        Bw[zF]=E(vB,4532)-E(fr,51130)
        return Bw[zF]
    end,{};
    Cy=Bw[17108]or vA(17108,17636,35137)
    while Cy~=24790 do
        if Cy<40398 then
            if Cy>7080 then
                fD[1]=fD[2]
                if fD[3]~=fD[3]then
                    Cy=Bw[8565]or vA(8565,95392,252)
                else
                    Cy=7080
                end
            elseif Cy>1621 then
                if(fD[4]>=0 and fD[2]>fD[3])or((fD[4]<0 or fD[4]~=fD[4])and fD[2]<fD[3])then
                    Cy=Bw[-10102]or vA(-10102,75230,20774)
                else
                    Cy=62222
                end
            else
                fD[5]='';
                fD[3],fD[4],Cy,fD[2]=(#zy-1)+28,1,Bw[-17300]or vA(-17300,25092,33102),28
            end
        elseif Cy>=46793 then
            if Cy>46793 then
                Cy,fD[5]=Bw[26861]or vA(26861,76300,17237),fD[5]..al(sf(Lr(zy,(fD[1]-28)+1),Lr(kA,(fD[1]-28)%#kA+1)))
            else
                fD[2]=fD[2]+fD[4];
                fD[1]=fD[2]
                if fD[2]~=fD[2]then
                    Cy=40398
                else
                    Cy=Bw[9754]or vA(9754,11491,58901)
                end
            end
        else
            return fD[5]
        end
    end
end)('\1\164\23\169\16','u\197')][(function(mv,_b)
    local Gx,ck,Tc,tz;
    tz={};
    Gx,Tc={},function(bb,Pd,mn)
        Gx[Pd]=E(bb,8660)-E(mn,34634)
        return Gx[Pd]
    end;
    ck=Gx[-24699]or Tc(96626,-24699,3547)
    while ck~=51150 do
        if ck>20729 then
            if ck<=25412 then
                tz[1]=tz[1]+tz[2];
                tz[3]=tz[1]
                if tz[1]~=tz[1]then
                    ck=14749
                else
                    ck=11252
                end
            else
                tz[4]='';
                tz[1],tz[5],ck,tz[2]=197,(#mv-1)+197,Gx[6956]or Tc(20207,6956,39176),1
            end
        elseif ck<20146 then
            if ck>11252 then
                return tz[4]
            else
                if(tz[2]>=0 and tz[1]>tz[5])or((tz[2]<0 or tz[2]~=tz[2])and tz[1]<tz[5])then
                    ck=Gx[-19246]or Tc(65672,-19246,24821)
                else
                    ck=20146
                end
            end
        elseif ck<=20146 then
            ck,tz[4]=Gx[-10871]or Tc(47844,-10871,45222),tz[4]..al(sf(Lr(mv,(tz[3]-197)+1),Lr(_b,(tz[3]-197)%#_b+1)))
        else
            tz[3]=tz[1]
            if tz[5]~=tz[5]then
                ck=Gx[-7201]or Tc(55899,-7201,18104)
            else
                ck=11252
            end
        end
    end
end)('\205\251\26\193\231\29','\164\149i')],nC[(function(ih,NA)
    local lj,Ek,ey,wa;
    wa={};
    Ek,ey=function(Qq,Gu,MB)
        ey[Qq]=E(Gu,31730)-E(MB,55958)
        return ey[Qq]
    end,{};
    lj=ey[9623]or Ek(9623,130110,27218)
    repeat
        if lj<=55048 then
            if lj>=36957 then
                if lj>36957 then
                    wa[1]='';
                    lj,wa[2],wa[3],wa[4]=59794,100,(#ih-1)+100,1
                else
                    if(wa[4]>=0 and wa[2]>wa[3])or((wa[4]<0 or wa[4]~=wa[4])and wa[2]<wa[3])then
                        lj=22159
                    else
                        lj=59660
                    end
                end
            elseif lj<=15985 then
                wa[2]=wa[2]+wa[4];
                wa[5]=wa[2]
                if wa[2]~=wa[2]then
                    lj=22159
                else
                    lj=ey[28669]or Ek(28669,80017,27024)
                end
            else
                return wa[1]
            end
        elseif lj>59660 then
            wa[5]=wa[2]
            if wa[3]~=wa[3]then
                lj=22159
            else
                lj=ey[19950]or Ek(19950,73184,3875)
            end
        else
            wa[1],lj=wa[1]..al(sf(Lr(ih,(wa[5]-100)+1),Lr(NA,(wa[5]-100)%#NA+1))),ey[6598]or Ek(6598,55334,49141)
        end
    until lj==57364
end)('\166N\176C\183','\210/')][(function(Fj,DE)
    local BC,id,FF,FE;
    FF={};
    BC,id={},function(qf,uF,zD)
        BC[qf]=E(uF,55783)-E(zD,65293)
        return BC[qf]
    end;
    FE=BC[-10129]or id(-10129,99149,18513)
    while FE~=6152 do
        if FE<=46373 then
            if FE<45670 then
                if FE<=705 then
                    if(FF[1]>=0 and FF[2]>FF[3])or((FF[1]<0 or FF[1]~=FF[1])and FF[2]<FF[3])then
                        FE=45670
                    else
                        FE=59557
                    end
                else
                    FF[4]='';
                    FF[2],FF[3],FE,FF[1]=19,(#Fj-1)+19,46373,1
                end
            elseif FE>45670 then
                FF[5]=FF[2]
                if FF[3]~=FF[3]then
                    FE=45670
                else
                    FE=705
                end
            else
                return FF[4]
            end
        elseif FE<=49998 then
            FF[2]=FF[2]+FF[1];
            FF[5]=FF[2]
            if FF[2]~=FF[2]then
                FE=45670
            else
                FE=BC[-32005]or id(-32005,65508,56399)
            end
        else
            FE,FF[4]=BC[-18021]or id(-18021,96981,8425),FF[4]..al(sf(Lr(Fj,(FF[5]-19)+1),Lr(DE,(FF[5]-19)%#DE+1)))
        end
    end
end)(';\\\195;R\217','X3\173')],nC[(function(XE,cC)
    local Gb,ys,Aj,Fm;
    Gb={};
    Fm,Aj={},function(Mq,jF,nE)
        Fm[nE]=E(jF,49134)-E(Mq,52713)
        return Fm[nE]
    end;
    ys=Fm[-21525]or Aj(21745,5445,-21525)
    while ys~=11902 do
        if ys>=34300 then
            if ys>=53774 then
                if ys>53774 then
                    if(Gb[1]>=0 and Gb[2]>Gb[3])or((Gb[1]<0 or Gb[1]~=Gb[1])and Gb[2]<Gb[3])then
                        ys=Fm[-23007]or Aj(11371,68734,-23007)
                    else
                        ys=5703
                    end
                else
                    return Gb[4]
                end
            else
                Gb[5]=Gb[2]
                if Gb[3]~=Gb[3]then
                    ys=Fm[14753]or Aj(32626,80711,14753)
                else
                    ys=Fm[-316]or Aj(44762,128126,-316)
                end
            end
        elseif ys>5703 then
            Gb[2]=Gb[2]+Gb[1];
            Gb[5]=Gb[2]
            if Gb[2]~=Gb[2]then
                ys=Fm[31281]or Aj(46264,128177,31281)
            else
                ys=Fm[32247]or Aj(18443,119249,32247)
            end
        elseif ys<=4499 then
            Gb[4]='';
            Gb[2],Gb[1],ys,Gb[3]=200,1,Fm[-30277]or Aj(22196,106167,-30277),(#XE-1)+200
        else
            ys,Gb[4]=Fm[-22817]or Aj(14962,116594,-22817),Gb[4]..al(sf(Lr(XE,(Gb[5]-200)+1),Lr(cC,(Gb[5]-200)%#cC+1)))
        end
    end
end)('j\205\242\248|\214\233\249l','\t\162\128\151')][(function(py,oB)
    local Ut,JB,El,Jv;
    Ut={};
    JB,Jv={},function(xz,Xu,Dp)
        JB[Dp]=E(xz,31251)-E(Xu,18349)
        return JB[Dp]
    end;
    El=JB[-17443]or Jv(85879,50664,-17443)
    repeat
        if El<21226 then
            if El>=8068 then
                if El<=8068 then
                    Ut[1]=Ut[1]+Ut[2];
                    Ut[3]=Ut[1]
                    if Ut[1]~=Ut[1]then
                        El=JB[8775]or Jv(62202,29266,8775)
                    else
                        El=3492
                    end
                else
                    El,Ut[4]=JB[-16735]or Jv(93020,46694,-16735),Ut[4]..al(sf(Lr(py,(Ut[3]-61)+1),Lr(oB,(Ut[3]-61)%#oB+1)))
                end
            else
                if(Ut[2]>=0 and Ut[1]>Ut[5])or((Ut[2]<0 or Ut[2]~=Ut[2])and Ut[1]<Ut[5])then
                    El=JB[12201]or Jv(78482,45626,12201)
                else
                    El=9674
                end
            end
        elseif El>=43599 then
            if El<=43599 then
                Ut[3]=Ut[1]
                if Ut[5]~=Ut[5]then
                    El=JB[-29048]or Jv(46369,15333,-29048)
                else
                    El=3492
                end
            else
                Ut[4]='';
                Ut[1],Ut[5],Ut[2],El=61,(#py-1)+61,1,43599
            end
        else
            return Ut[4]
        end
    until El==12110
end)('\226\2 \224\4 ','\129pE')],nC[(function(nl,ra)
    local mi,VF,mb,Id;
    Id={};
    mi,mb=function(Wo,Yz,uD)
        mb[Yz]=E(uD,4997)-E(Wo,40550)
        return mb[Yz]
    end,{};
    VF=mb[22628]or mi(58003,22628,76023)
    while VF~=11018 do
        if VF<=33671 then
            if VF<=8437 then
                if VF<4477 then
                    return Id[1]
                elseif VF>4477 then
                    Id[2]=Id[3]
                    if Id[4]~=Id[4]then
                        VF=mb[25379]or mi(45550,25379,10383)
                    else
                        VF=mb[21452]or mi(5393,21452,36721)
                    end
                else
                    if(Id[5]>=0 and Id[3]>Id[4])or((Id[5]<0 or Id[5]~=Id[5])and Id[3]<Id[4])then
                        VF=2946
                    else
                        VF=mb[-27912]or mi(56935,-27912,53261)
                    end
                end
            else
                VF,Id[1]=mb[-21721]or mi(41071,-21721,71610),Id[1]..al(sf(Lr(nl,(Id[2]-110)+1),Lr(ra,(Id[2]-110)%#ra+1)))
            end
        elseif VF<=48765 then
            Id[1]='';
            Id[3],Id[5],VF,Id[4]=110,1,mb[-11938]or mi(15651,-11938,55231),(#nl-1)+110
        else
            Id[3]=Id[3]+Id[5];
            Id[2]=Id[3]
            if Id[3]~=Id[3]then
                VF=mb[4227]or mi(960,4227,47789)
            else
                VF=mb[-11151]or mi(17731,-11151,65319)
            end
        end
    end
end)('\b)\182T\30\50\173U\14','kF\196;')][(function(iE,Jo)
    local ex,Sg,Rr,ZD;
    ex={};
    Rr,ZD=function(qs,Gq,Vh)
        ZD[Gq]=E(Vh,44885)-E(qs,65428)
        return ZD[Gq]
    end,{};
    Sg=ZD[15584]or Rr(19705,15584,130378)
    repeat
        if Sg<21465 then
            if Sg<=12528 then
                if Sg<=7259 then
                    ex[1],Sg=ex[1]..al(sf(Lr(iE,(ex[2]-79)+1),Lr(Jo,(ex[2]-79)%#Jo+1))),ZD[8978]or Rr(20612,8978,17972)
                else
                    return ex[1]
                end
            else
                ex[3]=ex[3]+ex[4];
                ex[2]=ex[3]
                if ex[3]~=ex[3]then
                    Sg=ZD[-12504]or Rr(57662,-12504,57551)
                else
                    Sg=58795
                end
            end
        elseif Sg>40626 then
            if(ex[4]>=0 and ex[3]>ex[5])or((ex[4]<0 or ex[4]~=ex[4])and ex[3]<ex[5])then
                Sg=12528
            else
                Sg=7259
            end
        elseif Sg<=21465 then
            ex[2]=ex[3]
            if ex[5]~=ex[5]then
                Sg=12528
            else
                Sg=58795
            end
        else
            ex[1]='';
            Sg,ex[3],ex[4],ex[5]=ZD[18320]or Rr(14953,18320,112259),79,1,(#iE-1)+79
        end
    until Sg==18410
end)('\252\180\224\177\225','\133\221')],nC[(function(yk,pi)
    local Kn,Ew,BE,rB;
    Kn={};
    rB,BE=function(PA,Nz,ZB)
        BE[Nz]=E(PA,11949)-E(ZB,1162)
        return BE[Nz]
    end,{};
    Ew=BE[2888]or rB(110317,2888,34603)
    while Ew~=7216 do
        if Ew>46842 then
            if Ew>62733 then
                Kn[1]='';
                Kn[2],Ew,Kn[3],Kn[4]=1,46842,(#yk-1)+142,142
            else
                Kn[4]=Kn[4]+Kn[2];
                Kn[5]=Kn[4]
                if Kn[4]~=Kn[4]then
                    Ew=BE[-15560]or rB(49989,-15560,53134)
                else
                    Ew=BE[4009]or rB(26627,4009,13798)
                end
            end
        elseif Ew>25760 then
            Kn[5]=Kn[4]
            if Kn[3]~=Kn[3]then
                Ew=BE[-11497]or rB(73948,-11497,61191)
            else
                Ew=BE[30407]or rB(51796,30407,52029)
            end
        elseif Ew>8932 then
            Kn[1],Ew=Kn[1]..al(sf(Lr(yk,(Kn[5]-142)+1),Lr(pi,(Kn[5]-142)%#pi+1))),BE[-25370]or rB(90470,-25370,24116)
        elseif Ew<=5442 then
            if(Kn[2]>=0 and Kn[4]>Kn[3])or((Kn[2]<0 or Kn[2]~=Kn[2])and Kn[4]<Kn[3])then
                Ew=BE[31882]or rB(49805,31882,52662)
            else
                Ew=25760
            end
        else
            return Kn[1]
        end
    end
end)('\181\15>Q\163\20%P\179','\214\96L>')][(function(oc,xq)
    local cc,lf,jv,q;
    lf={};
    cc,jv={},function(qA,Eg,Gw)
        cc[qA]=E(Eg,46500)-E(Gw,38000)
        return cc[qA]
    end;
    q=cc[32194]or jv(32194,106905,46848)
    while q~=28655 do
        if q>43661 then
            if q>61645 then
                lf[1]=lf[1]+lf[2];
                lf[3]=lf[1]
                if lf[1]~=lf[1]then
                    q=35480
                else
                    q=12300
                end
            else
                lf[4]='';
                lf[1],lf[5],lf[2],q=133,(#oc-1)+133,1,cc[-16980]or jv(-16980,78027,20114)
            end
        elseif q<35480 then
            if q>12300 then
                lf[4],q=lf[4]..al(sf(Lr(oc,(lf[3]-133)+1),Lr(xq,(lf[3]-133)%#xq+1))),cc[24140]or jv(24140,110294,46779)
            else
                if(lf[2]>=0 and lf[1]>lf[5])or((lf[2]<0 or lf[2]~=lf[2])and lf[1]<lf[5])then
                    q=35480
                else
                    q=27156
                end
            end
        elseif q>35480 then
            lf[3]=lf[1]
            if lf[5]~=lf[5]then
                q=cc[-30748]or jv(-30748,5202,33582)
            else
                q=cc[2423]or jv(2423,35855,40431)
            end
        else
            return lf[4]
        end
    end
end)('A\231qF\239g','3\130\2')],nC[(function(ju,Hc)
    local sp,GA,mt,Dx;
    sp={};
    mt,GA=function(wr,Mf,up)
        GA[wr]=E(Mf,30410)-E(up,57522)
        return GA[wr]
    end,{};
    Dx=GA[32522]or mt(32522,39319,48148)
    while Dx~=28297 do
        if Dx<35703 then
            if Dx>=21112 then
                if Dx>21112 then
                    sp[1]=sp[1]+sp[2];
                    sp[3]=sp[1]
                    if sp[1]~=sp[1]then
                        Dx=GA[11199]or mt(11199,82357,19642)
                    else
                        Dx=GA[27131]or mt(27131,121064,22625)
                    end
                else
                    sp[3]=sp[1]
                    if sp[4]~=sp[4]then
                        Dx=35703
                    else
                        Dx=62799
                    end
                end
            else
                sp[5],Dx=sp[5]..al(sf(Lr(ju,(sp[3]-81)+1),Lr(Hc,(sp[3]-81)%#Hc+1))),GA[30598]or mt(30598,83464,15058)
            end
        elseif Dx>=37559 then
            if Dx<=37559 then
                sp[5]='';
                sp[2],sp[4],sp[1],Dx=1,(#ju-1)+81,81,21112
            else
                if(sp[2]>=0 and sp[1]>sp[4])or((sp[2]<0 or sp[2]~=sp[2])and sp[1]<sp[4])then
                    Dx=35703
                else
                    Dx=18402
                end
            end
        else
            return sp[5]
        end
    end
end)('\220\193vw\202\218mv\218','\191\174\4\24')][(function(oC,hE)
    local Ll,Wj,wg,Ye;
    Ye={};
    wg,Ll={},function(Za,f_,fl)
        wg[fl]=E(f_,21245)-E(Za,2148)
        return wg[fl]
    end;
    Wj=wg[13327]or Ll(45457,35447,13327)
    while Wj~=14496 do
        if Wj>=33715 then
            if Wj<52913 then
                Ye[1]=Ye[2]
                if Ye[3]~=Ye[3]then
                    Wj=wg[-3876]or Ll(26410,93954,-3876)
                else
                    Wj=5284
                end
            elseif Wj<=52913 then
                return Ye[4]
            else
                Ye[2]=Ye[2]+Ye[5];
                Ye[1]=Ye[2]
                if Ye[2]~=Ye[2]then
                    Wj=wg[-21274]or Ll(49598,117366,-21274)
                else
                    Wj=5284
                end
            end
        elseif Wj<7829 then
            if(Ye[5]>=0 and Ye[2]>Ye[3])or((Ye[5]<0 or Ye[5]~=Ye[5])and Ye[2]<Ye[3])then
                Wj=wg[6946]or Ll(15157,86271,6946)
            else
                Wj=21348
            end
        elseif Wj<=7829 then
            Ye[4]='';
            Ye[5],Wj,Ye[3],Ye[2]=1,wg[-4597]or Ll(56552,68290,-4597),(#oC-1)+123,123
        else
            Wj,Ye[4]=wg[20013]or Ll(50026,126973,20013),Ye[4]..al(sf(Lr(oC,(Ye[1]-123)+1),Lr(hE,(Ye[1]-123)%#hE+1)))
        end
    end
end)('\149\184\153\167\147','\246\212')],nC[(function(bi,Bl)
    local Te,Tf,Cv,kc;
    Tf={};
    kc,Cv=function(Ax,Jl,Vq)
        Cv[Jl]=E(Ax,38760)-E(Vq,2051)
        return Cv[Jl]
    end,{};
    Te=Cv[-275]or kc(98754,-275,40986)
    repeat
        if Te>=15791 then
            if Te<28305 then
                return Tf[1]
            elseif Te>28305 then
                Tf[2]=Tf[2]+Tf[3];
                Tf[4]=Tf[2]
                if Tf[2]~=Tf[2]then
                    Te=15791
                else
                    Te=14640
                end
            else
                Tf[1]='';
                Te,Tf[2],Tf[5],Tf[3]=Cv[23250]or kc(46955,23250,2361),17,(#bi-1)+17,1
            end
        elseif Te<=7881 then
            if Te<=6852 then
                Tf[1],Te=Tf[1]..al(sf(Lr(bi,(Tf[4]-17)+1),Lr(Bl,(Tf[4]-17)%#Bl+1))),Cv[8992]or kc(124855,8992,41279)
            else
                Tf[4]=Tf[2]
                if Tf[5]~=Tf[5]then
                    Te=15791
                else
                    Te=Cv[18212]or kc(10853,18212,35806)
                end
            end
        else
            if(Tf[3]>=0 and Tf[2]>Tf[5])or((Tf[3]<0 or Tf[3]~=Tf[3])and Tf[2]<Tf[5])then
                Te=Cv[-22444]or kc(5391,-22444,19643)
            else
                Te=6852
            end
        end
    until Te==21181
end)('d \236e \246u','\3E\152')],nC[(function(bx,sc)
    local w_,ht,rC,qm;
    ht={};
    w_,qm={},function(ql,da,Kp)
        w_[Kp]=E(da,54946)-E(ql,63506)
        return w_[Kp]
    end;
    rC=w_[11057]or qm(61796,24995,11057)
    repeat
        if rC<=48647 then
            if rC>=45041 then
                if rC<=45041 then
                    rC,ht[1]=w_[6190]or qm(27417,120179,6190),ht[1]..al(sf(Lr(bx,(ht[2]-8)+1),Lr(sc,(ht[2]-8)%#sc+1)))
                else
                    return ht[1]
                end
            elseif rC<=28870 then
                ht[3]=ht[3]+ht[4];
                ht[2]=ht[3]
                if ht[3]~=ht[3]then
                    rC=w_[-4409]or qm(32926,122929,-4409)
                else
                    rC=w_[-7955]or qm(1201,74995,-7955)
                end
            else
                ht[1]='';
                rC,ht[4],ht[3],ht[5]=62215,1,8,(#bx-1)+8
            end
        elseif rC>62215 then
            if(ht[4]>=0 and ht[3]>ht[5])or((ht[4]<0 or ht[4]~=ht[4])and ht[3]<ht[5])then
                rC=w_[5926]or qm(44066,115861,5926)
            else
                rC=w_[28898]or qm(58766,6959,28898)
            end
        else
            ht[2]=ht[3]
            if ht[5]~=ht[5]then
                rC=w_[-3286]or qm(23090,112261,-3286)
            else
                rC=62894
            end
        end
    until rC==22444
end)('\148\29\130G\196','\246t')][(function(vk,ry)
    local Ef,ur,SC,Op;
    SC={};
    ur,Op=function(Kc,tF,UE)
        Op[tF]=E(UE,7776)-E(Kc,2505)
        return Op[tF]
    end,{};
    Ef=Op[29156]or ur(46062,29156,78663)
    repeat
        if Ef>54749 then
            if Ef>56832 then
                Ef,SC[1]=Op[-16882]or ur(52712,-16882,76506),SC[1]..al(sf(Lr(vk,(SC[2]-192)+1),Lr(ry,(SC[2]-192)%#ry+1)))
            else
                if(SC[3]>=0 and SC[4]>SC[5])or((SC[3]<0 or SC[3]~=SC[3])and SC[4]<SC[5])then
                    Ef=Op[14961]or ur(50954,14961,99494)
                else
                    Ef=Op[-1092]or ur(7907,-1092,72884)
                end
            end
        elseif Ef>=52227 then
            if Ef<=52227 then
                return SC[1]
            else
                SC[2]=SC[4]
                if SC[5]~=SC[5]then
                    Ef=52227
                else
                    Ef=56832
                end
            end
        elseif Ef<=28825 then
            SC[4]=SC[4]+SC[3];
            SC[2]=SC[4]
            if SC[4]~=SC[4]then
                Ef=Op[26314]or ur(4646,26314,63890)
            else
                Ef=56832
            end
        else
            SC[1]='';
            SC[5],SC[3],SC[4],Ef=(#vk-1)+192,1,192,54749
        end
    until Ef==34514
end)('\17\28\1','s')],nC[(function(Pl,ot)
    local lw,v,FB,Dv;
    Dv={};
    FB,lw={},function(FA,rm,re_)
        FB[FA]=E(rm,7079)-E(re_,10841)
        return FB[FA]
    end;
    v=FB[-24387]or lw(-24387,81501,6093)
    while v~=23565 do
        if v>27407 then
            if v<=42204 then
                Dv[1]=Dv[1]+Dv[2];
                Dv[3]=Dv[1]
                if Dv[1]~=Dv[1]then
                    v=27407
                else
                    v=FB[10204]or lw(10204,48916,24048)
                end
            else
                Dv[4]='';
                Dv[1],Dv[2],v,Dv[5]=241,1,FB[-6886]or lw(-6886,79999,65367),(#Pl-1)+241
            end
        elseif v<20170 then
            if v<=380 then
                Dv[4],v=Dv[4]..al(sf(Lr(Pl,(Dv[3]-241)+1),Lr(ot,(Dv[3]-241)%#ot+1))),FB[28601]or lw(28601,76106,42056)
            else
                if(Dv[2]>=0 and Dv[1]>Dv[5])or((Dv[2]<0 or Dv[2]~=Dv[2])and Dv[1]<Dv[5])then
                    v=27407
                else
                    v=FB[-16565]or lw(-16565,41783,40269)
                end
            end
        elseif v<=20170 then
            Dv[3]=Dv[1]
            if Dv[5]~=Dv[5]then
                v=FB[19513]or lw(19513,25438,10163)
            else
                v=FB[26503]or lw(26503,25627,30955)
            end
        else
            return Dv[4]
        end
    end
end)('\246p\224*\166','\148\25')][(function(g,HD)
    local Pi,Zs,OE,wt;
    OE={};
    Zs,Pi=function(NF,Cg,Vl)
        Pi[Cg]=E(NF,49617)-E(Vl,6111)
        return Pi[Cg]
    end,{};
    wt=Pi[3367]or Zs(318,3367,25801)
    repeat
        if wt>33060 then
            if wt<=40845 then
                return OE[1]
            else
                OE[2]=OE[2]+OE[3];
                OE[4]=OE[2]
                if OE[2]~=OE[2]then
                    wt=Pi[-17864]or Zs(127913,-17864,34100)
                else
                    wt=17291
                end
            end
        elseif wt<19929 then
            if wt<=17152 then
                OE[4]=OE[2]
                if OE[5]~=OE[5]then
                    wt=40845
                else
                    wt=17291
                end
            else
                if(OE[3]>=0 and OE[2]>OE[5])or((OE[3]<0 or OE[3]~=OE[3])and OE[2]<OE[5])then
                    wt=40845
                else
                    wt=33060
                end
            end
        elseif wt<=19929 then
            OE[1]='';
            OE[3],wt,OE[2],OE[5]=1,Pi[-22746]or Zs(18693,-22746,21003),215,(#g-1)+215
        else
            wt,OE[1]=Pi[29639]or Zs(12681,29639,2957),OE[1]..al(sf(Lr(g,(OE[4]-215)+1),Lr(HD,(OE[4]-215)%#HD+1)))
        end
    until wt==9958
end)('T\248Y\242','6\128')],nC[(function(jg,sq)
    local cx,fw,Yl,Xq;
    Yl={};
    fw,cx={},function(Bv,cm,Ae)
        fw[Bv]=E(cm,40950)-E(Ae,17083)
        return fw[Bv]
    end;
    Xq=fw[2913]or cx(2913,48906,22161)
    repeat
        if Xq<=12086 then
            if Xq<10151 then
                if Xq>3282 then
                    return Yl[1]
                else
                    Yl[1]='';
                    Yl[2],Xq,Yl[3],Yl[4]=(#jg-1)+90,10151,1,90
                end
            elseif Xq<=10151 then
                Yl[5]=Yl[4]
                if Yl[2]~=Yl[2]then
                    Xq=4898
                else
                    Xq=fw[-7009]or cx(-7009,12933,23921)
                end
            else
                Xq,Yl[1]=fw[11517]or cx(11517,4786,3486),Yl[1]..al(sf(Lr(jg,(Yl[5]-90)+1),Lr(sq,(Yl[5]-90)%#sq+1)))
            end
        elseif Xq<=15903 then
            Yl[4]=Yl[4]+Yl[3];
            Yl[5]=Yl[4]
            if Yl[4]~=Yl[4]then
                Xq=4898
            else
                Xq=36265
            end
        else
            if(Yl[3]>=0 and Yl[4]>Yl[2])or((Yl[3]<0 or Yl[3]~=Yl[3])and Yl[4]<Yl[2])then
                Xq=4898
            else
                Xq=12086
            end
        end
    until Xq==52668
end)('f)ps6','\4@')][(function(Yq,gs)
    local Py,bg,Cp,Mt;
    bg={};
    Cp,Mt=function(HE,bd,bk)
        Mt[bd]=E(HE,34917)-E(bk,13836)
        return Mt[bd]
    end,{};
    Py=Mt[-23061]or Cp(43539,-23061,10123)
    repeat
        if Py>=21282 then
            if Py<32684 then
                if(bg[1]>=0 and bg[2]>bg[3])or((bg[1]<0 or bg[1]~=bg[1])and bg[2]<bg[3])then
                    Py=Mt[-8751]or Cp(22774,-8751,37646)
                else
                    Py=Mt[-18521]or Cp(115374,-18521,65435)
                end
            elseif Py>32684 then
                Py,bg[4]=Mt[26991]or Cp(60400,26991,3999),bg[4]..al(sf(Lr(Yq,(bg[5]-103)+1),Lr(gs,(bg[5]-103)%#gs+1)))
            else
                bg[5]=bg[2]
                if bg[3]~=bg[3]then
                    Py=11153
                else
                    Py=21282
                end
            end
        elseif Py>=10754 then
            if Py<=10754 then
                bg[2]=bg[2]+bg[1];
                bg[5]=bg[2]
                if bg[2]~=bg[2]then
                    Py=11153
                else
                    Py=21282
                end
            else
                return bg[4]
            end
        else
            bg[4]='';
            bg[1],bg[3],bg[2],Py=1,(#Yq-1)+103,103,Mt[2695]or Cp(8049,2695,8548)
        end
    until Py==9965
end)('K.G+',')O')],nC[(function(Iw,ek)
    local ui,vE,Pb,cr;
    vE={};
    ui,cr={},function(ok,KC,Hv)
        ui[ok]=E(KC,60977)-E(Hv,40694)
        return ui[ok]
    end;
    Pb=ui[30262]or cr(30262,17256,38342)
    while Pb~=60917 do
        if Pb<=41513 then
            if Pb<29537 then
                if Pb<=3367 then
                    vE[1]=vE[1]+vE[2];
                    vE[3]=vE[1]
                    if vE[1]~=vE[1]then
                        Pb=ui[-14395]or cr(-14395,76505,22664)
                    else
                        Pb=ui[-22397]or cr(-22397,100701,6626)
                    end
                else
                    Pb,vE[4]=ui[14406]or cr(14406,64199,39225),vE[4]..al(sf(Lr(Iw,(vE[3]-94)+1),Lr(ek,(vE[3]-94)%#ek+1)))
                end
            elseif Pb>29537 then
                vE[4]='';
                vE[5],vE[2],vE[1],Pb=(#Iw-1)+94,1,94,ui[-21539]or cr(-21539,116035,9959)
            else
                vE[3]=vE[1]
                if vE[5]~=vE[5]then
                    Pb=65130
                else
                    Pb=57432
                end
            end
        elseif Pb<=57432 then
            if(vE[2]>=0 and vE[1]>vE[5])or((vE[2]<0 or vE[2]~=vE[2])and vE[1]<vE[5])then
                Pb=65130
            else
                Pb=5702
            end
        else
            return vE[4]
        end
    end
end)('g\158q\196\55','\5\247')][(function(YC,yn)
    local gd,u_,Zu,Xn;
    Xn={};
    Zu,u_=function(mo,Lo,KD)
        u_[Lo]=E(KD,53571)-E(mo,48607)
        return u_[Lo]
    end,{};
    gd=u_[10072]or Zu(1172,10072,11904)
    while gd~=27680 do
        if gd>44898 then
            if gd<=46291 then
                if(Xn[1]>=0 and Xn[2]>Xn[3])or((Xn[1]<0 or Xn[1]~=Xn[1])and Xn[2]<Xn[3])then
                    gd=57030
                else
                    gd=u_[8269]or Zu(15185,8269,124083)
                end
            else
                return Xn[4]
            end
        elseif gd>41692 then
            Xn[4],gd=Xn[4]..al(sf(Lr(YC,(Xn[5]-68)+1),Lr(yn,(Xn[5]-68)%#yn+1))),u_[25707]or Zu(16855,25707,85927)
        elseif gd<=21613 then
            if gd<=18040 then
                Xn[4]='';
                Xn[3],Xn[1],gd,Xn[2]=(#YC-1)+68,1,u_[4007]or Zu(47400,4007,34855),68
            else
                Xn[5]=Xn[2]
                if Xn[3]~=Xn[3]then
                    gd=u_[8108]or Zu(37869,8108,122299)
                else
                    gd=46291
                end
            end
        else
            Xn[2]=Xn[2]+Xn[1];
            Xn[5]=Xn[2]
            if Xn[2]~=Xn[2]then
                gd=57030
            else
                gd=u_[-21304]or Zu(22901,-21304,84030)
            end
        end
    end
end)('\232\192\239\199\254','\138\180')],nC[(function(mz,yG)
    local Ir,bF,ko,tg;
    bF={};
    tg,ko={},function(uj,Fs,ch)
        tg[ch]=E(uj,51731)-E(Fs,37547)
        return tg[ch]
    end;
    Ir=tg[-12028]or ko(9239,52141,-12028)
    repeat
        if Ir>=36942 then
            if Ir>38142 then
                bF[1]=bF[1]+bF[2];
                bF[3]=bF[1]
                if bF[1]~=bF[1]then
                    Ir=tg[-4577]or ko(129914,14839,-4577)
                else
                    Ir=tg[-12857]or ko(7511,170,-12857)
                end
            elseif Ir<=36942 then
                Ir,bF[4]=tg[-22676]or ko(84716,19047,-22676),bF[4]..al(sf(Lr(mz,(bF[3]-224)+1),Lr(yG,(bF[3]-224)%#yG+1)))
            else
                bF[4]='';
                bF[2],bF[5],bF[1],Ir=1,(#mz-1)+224,224,tg[-1782]or ko(122651,6101,-1782)
            end
        elseif Ir<34317 then
            if(bF[2]>=0 and bF[1]>bF[5])or((bF[2]<0 or bF[2]~=bF[2])and bF[1]<bF[5])then
                Ir=34317
            else
                Ir=36942
            end
        elseif Ir<=34317 then
            return bF[4]
        else
            bF[3]=bF[1]
            if bF[5]~=bF[5]then
                Ir=34317
            else
                Ir=tg[-24758]or ko(42941,47808,-24758)
            end
        end
    until Ir==25777
end)('\187\v\173Q\235','\217b')][(function(Lc,_n)
    local Ic,cl,Oc,Si;
    cl={};
    Ic,Oc=function(ws,eF,_G)
        Oc[_G]=E(ws,9515)-E(eF,33239)
        return Oc[_G]
    end,{};
    Si=Oc[-21717]or Ic(70993,54772,-21717)
    while Si~=54806 do
        if Si<=49836 then
            if Si<=14779 then
                if Si<=10474 then
                    if Si>9069 then
                        if(cl[1]>=0 and cl[2]>cl[3])or((cl[1]<0 or cl[1]~=cl[1])and cl[2]<cl[3])then
                            Si=9069
                        else
                            Si=14779
                        end
                    else
                        return cl[4]
                    end
                else
                    Si,cl[4]=Oc[-30429]or Ic(89825,10416,-30429),cl[4]..al(sf(Lr(Lc,(cl[5]-39)+1),Lr(_n,(cl[5]-39)%#_n+1)))
                end
            else
                cl[5]=cl[2]
                if cl[3]~=cl[3]then
                    Si=Oc[24565]or Ic(81221,29910,24565)
                else
                    Si=Oc[29867]or Ic(20961,51767,29867)
                end
            end
        elseif Si<=53859 then
            cl[2]=cl[2]+cl[1];
            cl[5]=cl[2]
            if cl[2]~=cl[2]then
                Si=9069
            else
                Si=10474
            end
        else
            cl[4]='';
            Si,cl[1],cl[3],cl[2]=49836,1,(#Lc-1)+39,39
        end
    end
end)('\165\150\177\190\131\173','\215\229\217')],nC[(function(GE,vv)
    local nv,l_,Yu,xd;
    l_={};
    xd,nv=function(Mu,Sl,qq)
        nv[Sl]=E(qq,40399)-E(Mu,13502)
        return nv[Sl]
    end,{};
    Yu=nv[30083]or xd(6387,30083,19389)
    while Yu~=56961 do
        if Yu<29046 then
            if Yu>15428 then
                if(l_[1]>=0 and l_[2]>l_[3])or((l_[1]<0 or l_[1]~=l_[1])and l_[2]<l_[3])then
                    Yu=nv[2564]or xd(37877,2564,99598)
                else
                    Yu=15428
                end
            elseif Yu<=261 then
                l_[2]=l_[2]+l_[1];
                l_[4]=l_[2]
                if l_[2]~=l_[2]then
                    Yu=nv[-1431]or xd(64370,-1431,121997)
                else
                    Yu=nv[3282]or xd(22890,3282,11010)
                end
            else
                Yu,l_[5]=nv[20990]or xd(31380,20990,53984),l_[5]..al(sf(Lr(GE,(l_[4]-84)+1),Lr(vv,(l_[4]-84)%#vv+1)))
            end
        elseif Yu>43557 then
            l_[4]=l_[2]
            if l_[3]~=l_[3]then
                Yu=nv[16185]or xd(45675,16185,25988)
            else
                Yu=18681
            end
        elseif Yu<=29046 then
            return l_[5]
        else
            l_[5]='';
            l_[3],Yu,l_[1],l_[2]=(#GE-1)+84,44922,1,84
        end
    end
end)(']RK\b\r','?;')][(function(lA,ru)
    local gr,em,cn,NC;
    NC={};
    cn,em={},function(Mh,Lu,dh)
        cn[Lu]=E(Mh,22811)-E(dh,391)
        return cn[Lu]
    end;
    gr=cn[12370]or em(10239,12370,10594)
    repeat
        if gr>=38251 then
            if gr>50983 then
                NC[1],gr=NC[1]..al(sf(Lr(lA,(NC[2]-164)+1),Lr(ru,(NC[2]-164)%#ru+1))),cn[8892]or em(2210,8892,2735)
            elseif gr<=38251 then
                if(NC[3]>=0 and NC[4]>NC[5])or((NC[3]<0 or NC[3]~=NC[3])and NC[4]<NC[5])then
                    gr=20593
                else
                    gr=cn[29857]or em(127971,29857,47519)
                end
            else
                NC[2]=NC[4]
                if NC[5]~=NC[5]then
                    gr=cn[14777]or em(8553,14777,10630)
                else
                    gr=cn[5926]or em(42968,5926,26847)
                end
            end
        elseif gr<20593 then
            NC[4]=NC[4]+NC[3];
            NC[2]=NC[4]
            if NC[4]~=NC[4]then
                gr=20593
            else
                gr=cn[18281]or em(91243,18281,43394)
            end
        elseif gr<=20593 then
            return NC[1]
        else
            NC[1]='';
            NC[3],gr,NC[4],NC[5]=1,cn[28680]or em(88675,28680,15830),164,(#lA-1)+164
        end
    until gr==46120
end)('x\218\145}\207\141','\20\169\249')],nC[(function(Fo,gl)
    local tx,sn,qC,Kd;
    sn={};
    tx,qC=function(Qm,Ot,Fp)
        qC[Ot]=E(Fp,47638)-E(Qm,61114)
        return qC[Ot]
    end,{};
    Kd=qC[6213]or tx(24953,6213,28358)
    while Kd~=7599 do
        if Kd<=31875 then
            if Kd<=17677 then
                if Kd<=11314 then
                    if Kd>10179 then
                        sn[1]=sn[2]
                        if sn[3]~=sn[3]then
                            Kd=64794
                        else
                            Kd=qC[-26665]or tx(34221,-26665,10444)
                        end
                    else
                        if(sn[4]>=0 and sn[2]>sn[3])or((sn[4]<0 or sn[4]~=sn[4])and sn[2]<sn[3])then
                            Kd=64794
                        else
                            Kd=qC[-24822]or tx(48875,-24822,30402)
                        end
                    end
                else
                    sn[5]='';
                    sn[4],sn[3],sn[2],Kd=1,(#Fo-1)+56,56,qC[26973]or tx(18250,26973,27700)
                end
            else
                Kd,sn[5]=qC[26058]or tx(27193,26058,116638),sn[5]..al(sf(Lr(Fo,(sn[1]-56)+1),Lr(gl,(sn[1]-56)%#gl+1)))
            end
        elseif Kd<=63749 then
            sn[2]=sn[2]+sn[4];
            sn[1]=sn[2]
            if sn[2]~=sn[2]then
                Kd=64794
            else
                Kd=10179
            end
        else
            return sn[5]
        end
    end
end)('\215&\193|\135','\181O')][(function(jh,Ie)
    local Jk,PB,ox,DB;
    Jk={};
    ox,PB={},function(Dr,Bk,hi)
        ox[Dr]=E(hi,18843)-E(Bk,39785)
        return ox[Dr]
    end;
    DB=ox[25060]or PB(25060,42138,59022)
    repeat
        if DB<28450 then
            if DB>=20751 then
                if DB<=20751 then
                    return Jk[1]
                else
                    if(Jk[2]>=0 and Jk[3]>Jk[4])or((Jk[2]<0 or Jk[2]~=Jk[2])and Jk[3]<Jk[4])then
                        DB=ox[-21955]or PB(-21955,42578,51153)
                    else
                        DB=61157
                    end
                end
            else
                Jk[3]=Jk[3]+Jk[2];
                Jk[5]=Jk[3]
                if Jk[3]~=Jk[3]then
                    DB=ox[-912]or PB(-912,31117,96872)
                else
                    DB=ox[14454]or PB(14454,22129,97180)
                end
            end
        elseif DB<47351 then
            Jk[1]='';
            DB,Jk[4],Jk[3],Jk[2]=47351,(#jh-1)+107,107,1
        elseif DB>47351 then
            DB,Jk[1]=ox[-3794]or PB(-3794,43846,14549),Jk[1]..al(sf(Lr(jh,(Jk[5]-107)+1),Lr(Ie,(Jk[5]-107)%#Ie+1)))
        else
            Jk[5]=Jk[3]
            if Jk[4]~=Jk[4]then
                DB=20751
            else
                DB=25839
            end
        end
    until DB==43145
end)('\21o\133\2v\146\4','p\23\241')],{[4.0094572966681215*6873]={},[32549+-1484]={},[-2299+23883]={{0.00017305229640397329*28893,-5.1988562516246424e-05*-19235,true},{-17871+17878,-95451/-31817,false},{-6729- -6733,-120204/-17172,true},{27335-27327,112480/11248,false},{-25352+25357,115816/14477,false},{30063+-30059,4.3919364047608591e-05*22769,false},{15318-15310,-5412/-1804,true},{-919- -926,0,false},{10327+-10320,-29572- -29575,true},{-23600+23607,0,false},{4738+-4737,26691-26681,true},{-9606- -9613,0,false},{16491+-16490,-30084- -30086,false},{-20065- -20073,0.0004153470743990447*19261,true},{-5548/-5548,0.00057562239171103755*13898,true},{3.1645569620253167e-05*31600,0,false},{1795+-1787,294610/29461,false},{-171592/-21449,-0.00047936340539763193*-20861,false},{23818+-23814,0.00016778523489932885*17880,true},{6995+-6994,254256/31782,false},{26447+-26445,21593-21590,true},{-11435+11442,-0.0011916110581506197*-8392,false},{4.6598322460391427e-05*21460,9342+-9334,true},{-53368/-6671,-0.00094921689606074992*-8428,true},{55184/27592,0.00038319070123898327*23487,false},{-15119+15126,13524/13524,false},{98504/12313,-26953- -26963,false},{-31821- -31822,-0.0001879416629078334*-26604,true},{30540-30532,22678-22668,false},{-27702+27709,-21307+21314,true},{155407/22201,20980+-20977,false},{-0.00055115397864278332*-14515,0,false},{0.00053167248974631627*13166,0.00034716195105016491*5761,false},{-78736/-11248,0,true},{-182024/-22753,-22946- -22947,false},{3.8981795501500798e-05*25653,0.00018318373328448433*10918,false},{-0.0004431396443804354*-18053,0,false},{6991+-6983,0.00021637216011539847*13865,false},{172396/24628,0.00058754406580493535*15318,true},{17017-17010,-93035/-18607,false},{-14727/-14727,-6291+6301,false},{0.011267605633802818*355,-29813+29818,true},{31185/6237,26170-26163,false},{43470/21735,0.0009765625*3072,false},{41433/5919,31687+-31684,false},{1252-1247,-29108+29113,false},{30050-30048,-27100/-27100,false},{30317-30310,11987+-11977,false},{121810/24362,-0.00053928706250337059*-18543,false},{8640/2160,-22031+22033,true},{78292/19573,-9.833163984398047e-05*-30509,false},{19790/3958,-290220/-29022,true},{-0.00013515339910798757*-29596,0,true},{23165+-23161,-0.00011798945960827499*-25426,true},{6285-6278,-19811- -19813,false},{4.3909721612364978e-05*22774,-16649+16657,false},{-12863- -12867,-0.00065720294426919036*-7608,false},{91210/13030,-36231/-12077,true},{20081-20074,-15828- -15831,false},{228976/28622,27681-27671,false},{-18318+18325,-26414+26417,false},{28609+-28608,-27266- -27268,false},{22450+-22443,-12063- -12064,false},{57776/28888,-52556/-7508,false},{-124055/-24811,18984/6328,true},{-15187- -15192,18818-18808,false},{-51620/-12905,-11068/-11068,true},{15609+-15607,-6221+6228,true},{-23316+23318,-23893- -23902,false},{-105352/-26338,-29550- -29553,false},{-0.00048926671151611526*-16351,289440/28944,false},{28247-28240,-9192- -9201,true},{178647/25521,-17905+17915,false},{-17681- -17682,242+-240,false},{-0.00048869883934025656*-8185,7.7921065960182332e-05*25667,true},{20752-20744,-944+950,false},{210944/26368,0.00040165481784954009*24897,false},{-3.7136066547831256e-05*-26928,0.00031401556121558915*28661,true},{-0.0058479532163742687*-1368,-26565- -26572,true},{-13565+13566,152180/30436,true},{-20377- -20384,-22672- -22682,false},{-0.00049248953459738983*-16244,-7593+7603,true},{-13917+13925,132890/13289,false},{-9.6139979810604242e-05*-20803,-4298- -4303,false},{68880/13776,24620+-24613,false},{12055-12051,0.00018962138929271222*15821,false},{21539-21532,0.00012034659820282414*24928,false},{90370/18074,20761+-20756,true},{-20109+20117,-12990/-1299,false},{0.0029069767441860465*2408,5752+-5742,true},{-13974+13981,-1445- -1455,true},{-3.379063323646685e-05*-29594,-14507- -14512,true},{115040/14380,17728+-17718,true},{32223+-32219,29013-29005,true},{46648/5831,214330/21433,false},{3.8474856681158864e-05*25991,-0.00053812624441694024*-18583,false},{0.00014342058085335246*27890,181960/18196,true},{74704/9338,-13065+13073,true},{2876+-2875,-0.00030940594059405941*-32320,false},{8693-8689,-18899+18900,false},{0.00169548999660902*2949,132475/18925,false},{-8148/-8148,23655-23648,false},{16098+-16090,-8981+8991,false},{0.00024688745459034318*28353,-322230/-32223,false},{-20523+20531,-336- -346,false},{-165305/-23615,0.00011038339833689013*27178,false},{18278-18270,0,false},{106568/13321,-27525+27535,false},{13160-13158,196596/21844,true},{-111175/-22235,1546-1543,true},{-0.00025865190626454918*-19331,-21528- -21538,true},{-1480- -1488,0.00025874058022575116*30919,true},{-25614- -25615,-0.00041367185480117895*-19339,false},{-30801- -30806,-9570+9571,false},{11655+-11651,36880/3688,false},{4015+-4007,-0.00077130736598534516*-12965,false},{17426+-17425,11240/5620,true},{-16315/-16315,-6690+6698,true},{3690-3685,0,false},{-23993+23994,-0.00038663115387919922*-23278,false},{0.00046253469010175765*17296,-0.0013753266400770184*-7271,false},{8321-8316,-248770/-24877,false},{-32555- -32562,7105+-7095,false},{5662-5657,0,false},{15642-15638,-0.00041684035014589413*-2399,false},{0.00015983377287620874*25026,23028/23028,false},{30377-30375,100245/20049,true},{-52768/-13192,-16952+16960,true},{-3448- -3453,-11884- -11891,false},{-1810+1814,-4059+4067,false},{501+-497,-0.00035403242937053034*-28246,true},{-5488+5496,-5885- -5890,false},{-32108+32116,-30255- -30257,true},{-0.00076606339174566693*-10443,-0.00069046468273147824*-14483,false},{26760+-26752,0,false},{31805-31803,108608/13576,true},{-44184/-6312,5635+-5628,false},{24289+-24285,-12525- -12533,false},{-22127+22135,0,false},{20654+-20646,-191394/-31899,false},{-614- -621,4149-4139,true},{-2513+2521,-7306- -7308,true},{-25180/-6295,267381/29709,true},{30906+-30898,-4736- -4739,false},{7602+-7595,0.00046775810223855663*14965,true},{0.00022023659702995218*31784,-0.0023380093520374082*-2994,true},{2650+-2648,84972/28324,false},{-9597+9601,-0.00024926000934725036*-32095,false},{258928/32366,-21884- -21889,true},{0.0013437248051599033*3721,11153-11148,true},{-53280/-10656,16211-16203,true},{-0.00037671877943115466*-21236,-0.00032603025560772042*-30672,false},{-21124- -21131,32454+-32444,false},{-14332+14333,280-275,false},{27554-27546,-17302+17304,false},{1253+-1249,-11223+11233,true},{26413-26411,-10042+10049,true},{-0.00047087313332436431*-14866,0,false},{-886- -894,62640/20880,true},{12078-12070,99650/9965,false},{-0.00024595059906538772*-28461,23144-23143,true},{-156086/-22298,-18869- -18872,false},{-194656/-24332,12744-12736,false},{-54776/-6847,-26084- -26094,false},{8173/8173,613+-611,false},{-24031/-3433,-10980/-2196,true},{5828/1457,-824+827,false},{-165039/-23577,-14849+14856,true},{18385-18377,159395/31879,false},{-115955/-16565,-21162+21163,true},{7247+-7246,-175500/-19500,true},{-19274+19276,-11561+11568,true},{-30400- -30405,-0.00031497165255127039*-28574,false},{2656/2656,1885-1877,false},{7773-7768,-19137- -19142,true},{16119-16112,-34838/-17419,true},{-140077/-20011,-0.00023934897079942556*-8356,true},{25580+-25573,-12677+12685,false},{-10367/-10367,-0.00028518013878766756*-31559,true},{-11494+11501,-6949- -6959,false},{3080/3080,0,false},{3830-3822,-145292/-20756,true},{-2752- -2760,-31979+31989,false},{21803-21802,0.0029498525073746312*1356,false},{-125800/-31450,0,true},{-0.00082595870206489679*-8475,-21824+21827,false},{23299-23295,-20328- -20338,false},{82968/10371,-30946+30954,true},{-24756- -24764,0,false},{-71344/-10192,-25779- -25789,true},{184786/26398,235150/23515,true},{-32385- -32393,10819-10809,false},{-0.00019056330512996417*-26238,110852/15836,true},{29000+-28992,11719+-11709,false},{214680/26835,4898+-4890,true},{-7228/-1807,10147-10138,false},{31101-31096,-77370/-7737,false},{3936/984,0,true},{-6664/-3332,-17680- -17682,false},{-0.00054112554112554113*-1848,-9548+9551,true},{11066-11058,42370/4237,false},{-7468- -7469,-23402- -23412,true},{18846+-18841,49700/24850,false},{-84496/-10562,0,false},{1696-1691,-15156- -15164,false},{-6008+6013,-10958+10961,false},{-2907- -2915,-58320/-5832,false},{-26970- -26971,-100404/-11156,false},{6093/6093,-91836/-10204,true},{-0.00016648630650129028*-24026,24199/24199,false},{2701+-2693,-163096/-20387,true},{26507+-26505,20500/20500,true},{36398/18199,-0.00034220792553555539*-29222,false},{9509-9507,-27635/-5527,false},{-10318+10326,-20136+20138,false},{-55736/-6967,14781-14771,false},{202230/28890,-231420/-23142,false},{22863+-22861,0.00082440230832646333*12130,false},{-20128+20135,60350/6035,true},{-0.00041365046535677351*-19340,-0.000452980612429788*-22076,false},{-0.0002818330421058565*-17741,-26529+26534,true},{0.003937007874015748*2032,-26380/-2638,false},{58373/8339,-3163+3170,true},{0.00034869023231486729*22943,-0.00039513197407934248*-25308,true},{-0.0012012012012012011*-3330,-31823- -31833,false},{-154328/-19291,274968/30552,false},{-25198+25202,27088-27085,false},{-14912/-14912,-15296+15299,true},{0.008385744234800839*954,169404/28234,false},{227752/32536,164230/16423,false},{0.00031279324366593683*25576,0,true},{1974/282,11809-11804,true},{20654-20649,0,false},{15990+-15986,0,true},{15546-15539,8749+-8744,true},{2785+-2778,27674-27673,true},{-106813/-15259,-25578- -25588,false},{-16063/-16063,16676-16673,true},{-21192- -21193,-12487+12497,true},{-28075/-5615,4811-4810,false},{-2834+2842,-11006+11008,false},{23425+-23421,-0.00045735193231191402*-21865,true},{12420/3105,-0.0031535793125197099*-3171,false},{-0.00023459231207480143*-29839,0.00062578222778473093*11186,false},{24310+-24306,4355+-4346,false},{-20136+20144,31-23,true},{-33624/-4203,-290970/-29097,false},{-0.00069348127600554787*-10094,-0.0008055421298533913*-12414,true},{-248728/-31091,-18564+18574,false},{14423-14415,10371+-10368,false},{-20718+20723,150346/21478,true},{-0.00093874677305796764*-4261,0,false},{42208/5276,26817+-26807,false},{88248/11031,-0.00039274212552038333*-25462,false},{12968/1621,-14771+14772,true},{0.00084245998315080029*9496,0,false}}}
local Dg=(function(ae)
    local ED=Cs[27557][ae]
    if(ED)then
        return ED
    end
    local sr=1
    local function wj()
        local ha,pF,KB,Ey,Ng,Ss,vd,Us,td,xC,rD,Bd,oj,Xf,ya,Pt,Bu,Aq,Bg,fc,y,xF,hp,Ne,J,vq,De,vG,Ts,ba,av,Ad;
        Xf,Ng=function(Qj,sz,YA)
            Ng[sz]=E(Qj,61857)-E(YA,8039)
            return Ng[sz]
        end,{};
        fc=Ng[1920]or Xf(117706,1920,49790)
        repeat
            if fc<=35378 then
                if fc>=15896 then
                    if fc<24194 then
                        if fc>18281 then
                            if fc<=23102 then
                                if fc>22657 then
                                    td=0;
                                    fc,Pt,hp,ya=4477,155,1,151
                                elseif fc<=21175 then
                                    if fc<=19178 then
                                        fc,Bu=63401,nil
                                    else
                                        fc=Ng[30818]or Xf(8595,30818,35418)
                                        continue
                                    end
                                else
                                    fc,Bg=Ng[4060]or Xf(48677,4060,14434),Bu
                                    continue
                                end
                            elseif fc>23885 then
                                xF,fc=nil,Ng[5327]or Xf(7854,5327,53883)
                            elseif fc>23719 then
                                Bd=o_((function(Vv,uG)
                                    local nx,Rl,gw,Xt;
                                    nx={};
                                    Rl,gw=function(Wm,r_,VD)
                                        gw[Wm]=E(VD,20796)-E(r_,34314)
                                        return gw[Wm]
                                    end,{};
                                    Xt=gw[17022]or Rl(17022,48365,48458)
                                    repeat
                                        if Xt<31666 then
                                            if Xt<28337 then
                                                nx[1],Xt=nx[1]..al(sf(Lr(Vv,(nx[2]-94)+1),Lr(uG,(nx[2]-94)%#uG+1))),gw[-1131]or Rl(-1131,27120,129086)
                                            elseif Xt>28337 then
                                                nx[2]=nx[3]
                                                if nx[4]~=nx[4]then
                                                    Xt=28337
                                                else
                                                    Xt=31666
                                                end
                                            else
                                                return nx[1]
                                            end
                                        elseif Xt<45455 then
                                            if(nx[5]>=0 and nx[3]>nx[4])or((nx[5]<0 or nx[5]~=nx[5])and nx[3]<nx[4])then
                                                Xt=gw[-20815]or Rl(-20815,48422,63713)
                                            else
                                                Xt=gw[-3825]or Rl(-3825,44860,56869)
                                            end
                                        elseif Xt<=45455 then
                                            nx[1]='';
                                            nx[4],Xt,nx[5],nx[3]=(#Vv-1)+94,gw[17044]or Rl(17044,55048,37677),1,94
                                        else
                                            nx[3]=nx[3]+nx[5];
                                            nx[2]=nx[3]
                                            if nx[3]~=nx[3]then
                                                Xt=28337
                                            else
                                                Xt=31666
                                            end
                                        end
                                    until Xt==53500
                                end)('\197','\135'),ae,sr);
                                fc,sr=Ng[27431]or Xf(101820,27431,40993),sr+1
                            else
                                fc,ba=18281,nil
                            end
                        elseif fc>16421 then
                            if fc>18088 then
                                av=o_((function(Os,D)
                                    local dF,Iv,KA,hl;
                                    dF={};
                                    hl,KA=function(ZA,oa,ww)
                                        KA[ZA]=E(ww,10289)-E(oa,45987)
                                        return KA[ZA]
                                    end,{};
                                    Iv=KA[7812]or hl(7812,38386,35653)
                                    repeat
                                        if Iv<=35355 then
                                            if Iv>32035 then
                                                Iv,dF[1]=KA[30418]or hl(30418,1769,114246),dF[1]..al(sf(Lr(Os,(dF[2]-136)+1),Lr(D,(dF[2]-136)%#D+1)))
                                            elseif Iv>22136 then
                                                dF[1]='';
                                                dF[3],Iv,dF[4],dF[5]=136,22136,1,(#Os-1)+136
                                            elseif Iv>5957 then
                                                dF[2]=dF[3]
                                                if dF[5]~=dF[5]then
                                                    Iv=5957
                                                else
                                                    Iv=42234
                                                end
                                            else
                                                return dF[1]
                                            end
                                        elseif Iv<=42234 then
                                            if(dF[4]>=0 and dF[3]>dF[5])or((dF[4]<0 or dF[4]~=dF[4])and dF[3]<dF[5])then
                                                Iv=5957
                                            else
                                                Iv=KA[23179]or hl(23179,43620,35795)
                                            end
                                        else
                                            dF[3]=dF[3]+dF[4];
                                            dF[2]=dF[3]
                                            if dF[3]~=dF[3]then
                                                Iv=5957
                                            else
                                                Iv=42234
                                            end
                                        end
                                    until Iv==64776
                                end)('o\26g','S'),ae,sr);
                                sr,fc=sr+4,Ng[26818]or Xf(90805,26818,35472)
                            elseif fc<=16508 then
                                if(y==8)then
                                    fc=Ng[14806]or Xf(6604,14806,23185)
                                    continue
                                else
                                    fc=Ng[-30716]or Xf(128783,-30716,59060)
                                    continue
                                end
                                fc=Ng[16442]or Xf(55223,16442,1628)
                            else
                                oj,rD,fc=xF,nil,Ng[32687]or Xf(4190,32687,48403)
                            end
                        elseif fc>15993 then
                            if fc<=16267 then
                                Aq=o_((function(Dd,gF)
                                    local CA,wp,rE,ea;
                                    ea={};
                                    rE,CA=function(It,oi,mA)
                                        CA[oi]=E(mA,40116)-E(It,19378)
                                        return CA[oi]
                                    end,{};
                                    wp=CA[24008]or rE(44489,24008,112638)
                                    while wp~=26396 do
                                        if wp<=51006 then
                                            if wp<43997 then
                                                if wp>17615 then
                                                    if(ea[1]>=0 and ea[2]>ea[3])or((ea[1]<0 or ea[1]~=ea[1])and ea[2]<ea[3])then
                                                        wp=CA[4812]or rE(46376,4812,88428)
                                                    else
                                                        wp=43997
                                                    end
                                                else
                                                    ea[4]='';
                                                    wp,ea[3],ea[2],ea[1]=53528,(#Dd-1)+198,198,1
                                                end
                                            elseif wp<=43997 then
                                                wp,ea[4]=CA[6307]or rE(44508,6307,77417),ea[4]..al(sf(Lr(Dd,(ea[5]-198)+1),Lr(gF,(ea[5]-198)%#gF+1)))
                                            else
                                                return ea[4]
                                            end
                                        elseif wp<=52335 then
                                            ea[2]=ea[2]+ea[1];
                                            ea[5]=ea[2]
                                            if ea[2]~=ea[2]then
                                                wp=51006
                                            else
                                                wp=22627
                                            end
                                        else
                                            ea[5]=ea[2]
                                            if ea[3]~=ea[3]then
                                                wp=CA[-17319]or rE(10294,-17319,112246)
                                            else
                                                wp=22627
                                            end
                                        end
                                    end
                                end)('\147','\209'),ae,sr);
                                fc,sr=58273,sr+1
                            else
                                fc,vG=47657,nil
                            end
                        elseif fc<15935 then
                            fc,vG[(ha-134)]=Ng[14236]or Xf(100801,14236,40645),y
                        elseif fc<=15935 then
                            Bu=o_((function(wx,XC)
                                local sD,fq,Hi,gx;
                                gx={};
                                fq,sD={},function(Jn,OB,of)
                                    fq[of]=E(OB,14451)-E(Jn,61126)
                                    return fq[of]
                                end;
                                Hi=fq[23933]or sD(33383,42811,23933)
                                while Hi~=40829 do
                                    if Hi>=44736 then
                                        if Hi<=46072 then
                                            if Hi>44736 then
                                                gx[1]=gx[2]
                                                if gx[3]~=gx[3]then
                                                    Hi=24687
                                                else
                                                    Hi=fq[-28263]or sD(61586,76094,-28263)
                                                end
                                            else
                                                gx[4],Hi=gx[4]..al(sf(Lr(wx,(gx[1]-186)+1),Lr(XC,(gx[1]-186)%#XC+1))),fq[-14877]or sD(63738,49021,-14877)
                                            end
                                        else
                                            if(gx[5]>=0 and gx[2]>gx[3])or((gx[5]<0 or gx[5]~=gx[5])and gx[2]<gx[3])then
                                                Hi=24687
                                            else
                                                Hi=fq[-23994]or sD(36489,79740,-23994)
                                            end
                                        end
                                    elseif Hi<24687 then
                                        gx[4]='';
                                        gx[3],gx[2],Hi,gx[5]=(#wx-1)+186,186,46072,1
                                    elseif Hi>24687 then
                                        gx[2]=gx[2]+gx[5];
                                        gx[1]=gx[2]
                                        if gx[2]~=gx[2]then
                                            Hi=24687
                                        else
                                            Hi=fq[6078]or sD(13022,128866,6078)
                                        end
                                    else
                                        return gx[4]
                                    end
                                end
                            end)('\194\154','\254'),ae,sr);
                            sr,fc=sr+8,Ng[27387]or Xf(16590,27387,18313)
                        else
                            KB=ba
                            if av~=av then
                                fc=Ng[-17835]or Xf(8351,-17835,22635)
                            else
                                fc=Ng[-15797]or Xf(1929,-15797,16284)
                            end
                        end
                    elseif fc<30415 then
                        if fc<27688 then
                            if fc>=24592 then
                                if fc<=24592 then
                                    J=J+Ne;
                                    ha=J
                                    if J~=J then
                                        fc=12456
                                    else
                                        fc=40980
                                    end
                                else
                                    ba=ba+De;
                                    KB=ba
                                    if ba~=ba then
                                        fc=Ng[28429]or Xf(5827,28429,16983)
                                    else
                                        fc=Ng[-28684]or Xf(10747,-28684,7242)
                                    end
                                end
                            elseif fc>24194 then
                                td=Ey;
                                ya,Pt=rv(td),false;
                                hp,Ad,vG,fc=173,(td)+172,1,Ng[13529]or Xf(2821,13529,63834)
                            else
                                fc,ba=Ng[9535]or Xf(100931,9535,24698),av
                                continue
                            end
                        elseif fc<=29720 then
                            if fc>=28232 then
                                if fc<=28232 then
                                    xF,fc=_m(oj,51),Ng[-11586]or Xf(4938,-11586,33572)
                                    continue
                                else
                                    Ss=Bu
                                    if(Ss==0)then
                                        fc=Ng[-6326]or Xf(119622,-6326,64104)
                                        continue
                                    else
                                        fc=Ng[2556]or Xf(97414,2556,33495)
                                        continue
                                    end
                                    fc=Ng[-13772]or Xf(40349,-13772,15925)
                                end
                            else
                                if(y==1)then
                                    fc=Ng[-7440]or Xf(118000,-7440,55437)
                                    continue
                                else
                                    fc=Ng[8412]or Xf(12010,8412,33192)
                                    continue
                                end
                                fc=Ng[-2503]or Xf(23173,-2503,33070)
                            end
                        else
                            ba,av=ly(_j(ha,8),16777215),nil;
                            av=if ba<8388608 then ba else ba-16777216;
                            Ss[5076],fc=av,Ng[29488]or Xf(48541,29488,8198)
                        end
                    elseif fc<33255 then
                        if fc>=31744 then
                            if fc>31744 then
                                xC=o_((function(LD,Nu)
                                    local ol,Ku,bE,Sb;
                                    bE={};
                                    Ku,ol=function(Vz,Qk,Yo)
                                        ol[Yo]=E(Vz,28411)-E(Qk,46019)
                                        return ol[Yo]
                                    end,{};
                                    Sb=ol[-18679]or Ku(4611,47457,-18679)
                                    while Sb~=13867 do
                                        if Sb>29389 then
                                            if Sb>29872 then
                                                bE[1]=bE[1]+bE[2];
                                                bE[3]=bE[1]
                                                if bE[1]~=bE[1]then
                                                    Sb=11887
                                                else
                                                    Sb=9989
                                                end
                                            else
                                                Sb,bE[4]=ol[18159]or Ku(62465,37759,18159),bE[4]..al(sf(Lr(LD,(bE[3]-28)+1),Lr(Nu,(bE[3]-28)%#Nu+1)))
                                            end
                                        elseif Sb>29270 then
                                            bE[3]=bE[1]
                                            if bE[5]~=bE[5]then
                                                Sb=ol[-23736]or Ku(13958,39373,-23736)
                                            else
                                                Sb=9989
                                            end
                                        elseif Sb>11887 then
                                            bE[4]='';
                                            bE[2],Sb,bE[1],bE[5]=1,29389,28,(#LD-1)+28
                                        elseif Sb>9989 then
                                            return bE[4]
                                        else
                                            if(bE[2]>=0 and bE[1]>bE[5])or((bE[2]<0 or bE[2]~=bE[2])and bE[1]<bE[5])then
                                                Sb=ol[-4099]or Ku(45187,970,-4099)
                                            else
                                                Sb=29872
                                            end
                                        end
                                    end
                                end)('\31',']'),ae,sr);
                                sr,fc=sr+1,Ng[-20969]or Xf(18925,-20969,2293)
                            else
                                av=o_((function(SA,ob)
                                    local pz,lm,zn,yh;
                                    zn={};
                                    yh,pz=function(IE,dr,zq)
                                        pz[dr]=E(zq,34375)-E(IE,24690)
                                        return pz[dr]
                                    end,{};
                                    lm=pz[12193]or yh(61099,12193,121424)
                                    while lm~=7122 do
                                        if lm>47608 then
                                            if lm>52542 then
                                                zn[1]=zn[2]
                                                if zn[3]~=zn[3]then
                                                    lm=pz[-5564]or yh(28070,-5564,54462)
                                                else
                                                    lm=47608
                                                end
                                            else
                                                zn[4]='';
                                                zn[5],zn[3],zn[2],lm=1,(#SA-1)+205,205,pz[19660]or yh(57874,19660,128580)
                                            end
                                        elseif lm>25811 then
                                            if(zn[5]>=0 and zn[2]>zn[3])or((zn[5]<0 or zn[5]~=zn[5])and zn[2]<zn[3])then
                                                lm=pz[-25032]or yh(65477,-25032,25243)
                                            else
                                                lm=pz[-29174]or yh(15869,-29174,9197)
                                            end
                                        elseif lm<18459 then
                                            return zn[4]
                                        elseif lm>18459 then
                                            zn[2]=zn[2]+zn[5];
                                            zn[1]=zn[2]
                                            if zn[2]~=zn[2]then
                                                lm=pz[32139]or yh(47182,32139,105254)
                                            else
                                                lm=pz[14789]or yh(27519,14789,17218)
                                            end
                                        else
                                            lm,zn[4]=pz[24913]or yh(15994,24913,17564),zn[4]..al(sf(Lr(SA,(zn[1]-205)+1),Lr(ob,(zn[1]-205)%#ob+1)))
                                        end
                                    end
                                end)('\177','\210')..Ss,ae,sr);
                                fc,sr=24194,sr+Ss
                            end
                        elseif fc>30415 then
                            Ss=ly(_j(y,10),1023);
                            fc,Bd[46599]=Ng[32157]or Xf(17614,32157,19000),vG[Ss+1]
                        else
                            Ne=Ne+Bd;
                            xC=Ne
                            if Ne~=Ne then
                                fc=Ng[12902]or Xf(46841,12902,4868)
                            else
                                fc=52019
                            end
                        end
                    elseif fc<35321 then
                        if fc<=33255 then
                            fc,hp=Ng[-1636]or Xf(97108,-1636,57369),nil
                        else
                            Pt,fc=pF,Ng[-26172]or Xf(100916,-26172,61049)
                        end
                    elseif fc<=35321 then
                        fc,ha=23885,nil
                    else
                        Bu,fc=_m(Ss,1879762098),29720
                        continue
                    end
                elseif fc>=7040 then
                    if fc<10838 then
                        if fc>=8319 then
                            if fc<9852 then
                                if fc>8319 then
                                    oj=o_((function(kl,Qn)
                                        local ep,Mc,Iz,ez;
                                        ep={};
                                        Mc,Iz={},function(Ha,yt,ag)
                                            Mc[ag]=E(Ha,2995)-E(yt,64018)
                                            return Mc[ag]
                                        end;
                                        ez=Mc[25367]or Iz(29754,60837,25367)
                                        repeat
                                            if ez>26578 then
                                                if ez<=36526 then
                                                    ez,ep[1]=Mc[-28515]or Iz(27177,56046,-28515),ep[1]..al(sf(Lr(kl,(ep[2]-21)+1),Lr(Qn,(ep[2]-21)%#Qn+1)))
                                                else
                                                    if(ep[3]>=0 and ep[4]>ep[5])or((ep[3]<0 or ep[3]~=ep[3])and ep[4]<ep[5])then
                                                        ez=Mc[-12067]or Iz(4101,62363,-12067)
                                                    else
                                                        ez=36526
                                                    end
                                                end
                                            elseif ez>25636 then
                                                ep[1]='';
                                                ep[3],ez,ep[5],ep[4]=1,25636,(#kl-1)+21,21
                                            elseif ez<=16542 then
                                                if ez<=4653 then
                                                    return ep[1]
                                                else
                                                    ep[4]=ep[4]+ep[3];
                                                    ep[2]=ep[4]
                                                    if ep[4]~=ep[4]then
                                                        ez=4653
                                                    else
                                                        ez=49011
                                                    end
                                                end
                                            else
                                                ep[2]=ep[4]
                                                if ep[5]~=ep[5]then
                                                    ez=4653
                                                else
                                                    ez=49011
                                                end
                                            end
                                        until ez==57572
                                    end)('\130','\192'),ae,sr);
                                    sr,fc=sr+1,28232
                                else
                                    Bd[22984]=vG[nb(Bd[43979],0,24)+1];
                                    Bd[65228],fc=nb(Bd[43979],31,1)==1,Ng[12010]or Xf(40499,12010,4325)
                                end
                            elseif fc<=9852 then
                                if xC==3 then
                                    fc=Ng[-21034]or Xf(92985,-21034,59095)
                                    continue
                                end
                                fc=Ng[-30969]or Xf(19810,-30969,17364)
                            else
                                fc,y=Ng[32093]or Xf(4782,32093,48016),Bg
                            end
                        elseif fc>7401 then
                            ha=J
                            if pF~=pF then
                                fc=Ng[-30417]or Xf(31371,-30417,20338)
                            else
                                fc=43005
                            end
                        elseif fc>7040 then
                            av=ba;
                            Ss[43979]=av;
                            mE(ya,{});
                            fc=Ng[-24498]or Xf(16252,-24498,44090)
                        else
                            fc,pF=Ng[21508]or Xf(114697,21508,45145),Bu
                            continue
                        end
                    elseif fc<=12456 then
                        if fc<=12071 then
                            if fc<11775 then
                                vG=vG+pF;
                                Ne=vG
                                if vG~=vG then
                                    fc=Ng[-24921]or Xf(128011,-24921,13003)
                                else
                                    fc=Ng[-21472]or Xf(106292,-21472,37053)
                                end
                            elseif fc<=11775 then
                                vq=Ts;
                                Ss=GC(Ss,eA(ly(vq,127),(KB-61)*7))
                                if not Vi(vq,128)then
                                    fc=Ng[-397]or Xf(107573,-397,47282)
                                    continue
                                end
                                fc=Ng[-11733]or Xf(39104,-11733,6154)
                            else
                                Us,fc,Ey=vd,23102,nil
                            end
                        elseif fc>12252 then
                            fc,J=46828,nil
                        else
                            ha=o_((function(hv,fy)
                                local Nv,hh,oD,na;
                                oD={};
                                hh,Nv={},function(wi,YF,ad)
                                    hh[ad]=E(wi,65272)-E(YF,38796)
                                    return hh[ad]
                                end;
                                na=hh[-30874]or Nv(49809,40755,-30874)
                                while na~=12146 do
                                    if na>=17574 then
                                        if na>25059 then
                                            oD[1]=oD[2]
                                            if oD[3]~=oD[3]then
                                                na=hh[-8937]or Nv(44703,40013,-8937)
                                            else
                                                na=hh[16741]or Nv(26706,65010,16741)
                                            end
                                        elseif na<=17574 then
                                            return oD[4]
                                        else
                                            na,oD[4]=hh[23291]or Nv(35614,51841,23291),oD[4]..al(sf(Lr(hv,(oD[1]-131)+1),Lr(fy,(oD[1]-131)%#fy+1)))
                                        end
                                    elseif na>11308 then
                                        oD[4]='';
                                        na,oD[2],oD[3],oD[5]=hh[22037]or Nv(109071,51449,22037),131,(#hv-1)+131,1
                                    elseif na<=6361 then
                                        oD[2]=oD[2]+oD[5];
                                        oD[1]=oD[2]
                                        if oD[2]~=oD[2]then
                                            na=hh[-17542]or Nv(46196,37482,-17542)
                                        else
                                            na=11308
                                        end
                                    else
                                        if(oD[5]>=0 and oD[2]>oD[3])or((oD[5]<0 or oD[5]~=oD[5])and oD[2]<oD[3])then
                                            na=17574
                                        else
                                            na=25059
                                        end
                                    end
                                end
                            end)('v\3~','J'),ae,sr);
                            fc,sr=50541,sr+4
                        end
                    elseif fc>15125 then
                        fc,Bg=Ng[13243]or Xf(115308,13243,39736),rs''
                        continue
                    elseif fc<=15093 then
                        J,fc=_m(pF,1879762098),46252
                        continue
                    else
                        fc,Ne,J,pF=Ng[-20009]or Xf(37000,-20009,22845),1,9,(td)+8
                    end
                elseif fc>=3114 then
                    if fc<5223 then
                        if fc>=3291 then
                            if fc<=3291 then
                                if Bu then
                                    fc=Ng[14329]or Xf(10693,14329,25818)
                                    continue
                                end
                                fc=Ng[29693]or Xf(49440,29693,2662)
                            else
                                Ad=ya
                                if Pt~=Pt then
                                    fc=Ng[18445]or Xf(8340,18445,12991)
                                else
                                    fc=2737
                                end
                            end
                        elseif fc<=3114 then
                            Bg=o_((function(Tk,Bm)
                                local fu_,En,zs,WF;
                                WF={};
                                zs,fu_=function(Tv,dB,kk)
                                    fu_[Tv]=E(kk,37405)-E(dB,17245)
                                    return fu_[Tv]
                                end,{};
                                En=fu_[6756]or zs(6756,35821,102702)
                                while En~=64722 do
                                    if En<15324 then
                                        if En<10928 then
                                            WF[1]=WF[2]
                                            if WF[3]~=WF[3]then
                                                En=10928
                                            else
                                                En=fu_[13321]or zs(13321,64049,119296)
                                            end
                                        elseif En>10928 then
                                            WF[4]='';
                                            En,WF[5],WF[3],WF[2]=fu_[-28376]or zs(-28376,54202,13999),1,(#Tk-1)+74,74
                                        else
                                            return WF[4]
                                        end
                                    elseif En>=34481 then
                                        if En>34481 then
                                            En,WF[4]=fu_[7909]or zs(7909,25163,52975),WF[4]..al(sf(Lr(Tk,(WF[1]-74)+1),Lr(Bm,(WF[1]-74)%#Bm+1)))
                                        else
                                            if(WF[5]>=0 and WF[2]>WF[3])or((WF[5]<0 or WF[5]~=WF[5])and WF[2]<WF[3])then
                                                En=fu_[-1986]or zs(-1986,1961,64953)
                                            else
                                                En=56571
                                            end
                                        end
                                    else
                                        WF[2]=WF[2]+WF[5];
                                        WF[1]=WF[2]
                                        if WF[2]~=WF[2]then
                                            En=fu_[-8513]or zs(-8513,12640,3824)
                                        else
                                            En=fu_[28197]or zs(28197,26737,9152)
                                        end
                                    end
                                end
                            end)('\144','\210'),ae,sr);
                            sr,fc=sr+1,45069
                        else
                            J=vG;
                            td=GC(td,eA(ly(J,127),(Ad-151)*7))
                            if not Vi(J,128)then
                                fc=Ng[14646]or Xf(53175,14646,10332)
                                continue
                            end
                            fc=Ng[-30100]or Xf(26821,-30100,39824)
                        end
                    elseif fc<6863 then
                        if fc>5223 then
                            ya=ya+hp;
                            Ad=ya
                            if ya~=ya then
                                fc=Ng[-27372]or Xf(11031,-27372,10302)
                            else
                                fc=Ng[-31809]or Xf(40218,-31809,32109)
                            end
                        else
                            J=hp
                            if Ad~=Ad then
                                fc=33255
                            else
                                fc=Ng[-16992]or Xf(1668,-16992,5942)
                            end
                        end
                    elseif fc>6863 then
                        fc=Ng[-22146]or Xf(90400,-22146,42980)
                        continue
                    else
                        ha=J
                        if pF~=pF then
                            fc=Ng[-14913]or Xf(15448,-14913,33334)
                        else
                            fc=Ng[-5370]or Xf(128955,-5370,31073)
                        end
                    end
                elseif fc<=1755 then
                    if fc<=1604 then
                        if fc>=1017 then
                            if fc>1017 then
                                fc,Ts=11775,_m(vq,51)
                                continue
                            else
                                Ss[59342]=ly(_j(ha,8),255);
                                ba=ly(_j(ha,16),65535);
                                Ss[61239]=ba;
                                av=nil;
                                av=if ba<32768 then ba else ba-65536;
                                fc,Ss[49763]=Ng[-12524]or Xf(11056,-12524,53969),av
                            end
                        else
                            fc,pF=Ng[7935]or Xf(90263,7935,49275),nil
                        end
                    else
                        fc=Ng[-6738]or Xf(107084,-6738,45047)
                        continue
                    end
                elseif fc>=2737 then
                    if fc>2737 then
                        y=Bd[43979];
                        Bg,Bu=_j(y,30),ly(_j(y,20),1023);
                        Bd[22984]=vG[Bu+1];
                        Bd[34358]=Bg
                        if Bg==2 then
                            fc=Ng[-27695]or Xf(12081,-27695,32187)
                            continue
                        elseif(Bg==3)then
                            fc=Ng[-1082]or Xf(108079,-1082,25651)
                            continue
                        else
                            fc=Ng[-7189]or Xf(112058,-7189,64364)
                            continue
                        end
                        fc=Ng[9774]or Xf(36187,9774,909)
                    else
                        if(hp>=0 and ya>Pt)or((hp<0 or hp~=hp)and ya<Pt)then
                            fc=Ng[-10368]or Xf(95825,-10368,64500)
                        else
                            fc=16421
                        end
                    end
                else
                    if(xC==7)then
                        fc=Ng[13308]or Xf(21506,13308,39491)
                        continue
                    else
                        fc=Ng[27510]or Xf(45187,27510,1473)
                        continue
                    end
                    fc=Ng[-11722]or Xf(19440,-11722,17702)
                end
            elseif fc<48821 then
                if fc<43005 then
                    if fc<=40980 then
                        if fc>=38037 then
                            if fc<=38854 then
                                if fc>38513 then
                                    Ne[(y-219)],fc=wj(),Ng[-31284]or Xf(89536,-31284,64713)
                                elseif fc<=38037 then
                                    fc,Bd[22984]=Ng[-31849]or Xf(107614,-31849,60040),vG[Bd[43979]+1]
                                else
                                    return{[62337]=Ne,[51376]=Aq,[39512]='',[39302]=Us,[63352]=ya,[33483]=oj}
                                end
                            else
                                if(Ne>=0 and J>pF)or((Ne<0 or Ne~=Ne)and J<pF)then
                                    fc=Ng[19771]or Xf(17418,19771,39524)
                                else
                                    fc=62041
                                end
                            end
                        elseif fc<35703 then
                            if fc<=35397 then
                                Ne=vG
                                if J~=J then
                                    fc=Ng[31576]or Xf(6497,31576,4005)
                                else
                                    fc=57019
                                end
                            else
                                hp=hp+vG;
                                J=hp
                                if hp~=hp then
                                    fc=33255
                                else
                                    fc=61140
                                end
                            end
                        elseif fc<=35703 then
                            Ad=0;
                            vG,J,fc,pF=151,155,35397,1
                        else
                            y=ha
                            if Bd~=Bd then
                                fc=Ng[26154]or Xf(128015,26154,28762)
                            else
                                fc=48821
                            end
                        end
                    elseif fc>=41821 then
                        if fc<=41914 then
                            if fc>41821 then
                                fc,Bg=Ng[-1240]or Xf(114914,-1240,60515),nil
                            else
                                Ey,fc=_m(td,1879762098),24511
                                continue
                            end
                        else
                            Bd=ha;
                            Ad=GC(Ad,eA(ly(Bd,127),(Ne-151)*7))
                            if(not Vi(Bd,128))then
                                fc=Ng[-13543]or Xf(37327,-13543,23134)
                                continue
                            else
                                fc=Ng[-6635]or Xf(27824,-6635,28124)
                                continue
                            end
                            fc=Ng[1574]or Xf(128892,1574,50144)
                        end
                    elseif fc>=41192 then
                        if fc>41192 then
                            Ss[59342]=ly(_j(ha,8),255);
                            Ss[42338]=ly(_j(ha,16),255);
                            fc,Ss[54188]=Ng[-21162]or Xf(42586,-21162,21575),ly(_j(ha,24),255)
                        else
                            fc,Bd[22984]=Ng[240]or Xf(6339,240,38453),vG[Bd[49763]+1]
                        end
                    else
                        Bd,fc=_m(xC,51),58889
                        continue
                    end
                elseif fc<=45651 then
                    if fc>45069 then
                        if fc<=45594 then
                            if fc>45163 then
                                fc,Ne=12252,nil
                            else
                                fc,vd=Ng[26202]or Xf(6812,26202,41841),_m(Us,51)
                                continue
                            end
                        else
                            fc,Aq,vd=Ng[-12166]or Xf(5043,-12166,6916),rD,nil
                        end
                    elseif fc<=44479 then
                        if fc>=44012 then
                            if fc>44012 then
                                fc=Ng[-27969]or Xf(94265,-27969,59393)
                                continue
                            else
                                Bg,fc=rs(nil),Ng[-18466]or Xf(116778,-18466,61894)
                            end
                        else
                            if(Ne>=0 and J>pF)or((Ne<0 or Ne~=Ne)and J<pF)then
                                fc=15125
                            else
                                fc=Ng[-26788]or Xf(130475,-26788,12438)
                            end
                        end
                    elseif fc<=44910 then
                        y,fc=fv(Bg[1],1,Bg[2]),Ng[29691]or Xf(17380,29691,27466)
                    else
                        y,fc=_m(Bg,51),Ng[12601]or Xf(99849,12601,48457)
                        continue
                    end
                elseif fc<46843 then
                    if fc<46425 then
                        pF=J;
                        Ne=rv(pF);
                        fc,ha,xC,Bd=37193,220,1,(pF)+219
                    elseif fc<=46425 then
                        fc,Ts=Ng[29296]or Xf(76725,29296,59439),nil
                    else
                        pF=0;
                        Bd,Ne,fc,ha=1,28,Ng[-18069]or Xf(107071,-18069,38126),32
                    end
                elseif fc<=47657 then
                    if fc<47194 then
                        ha=Ne;
                        Bd=ly(ha,255);
                        xC=Cs[21584][Bd+1];
                        y,Bg,Bu=xC[1],xC[2],xC[3];
                        Ss={[61239]=0,[54188]=0,[59342]=0,[34849]=0,[42338]=0,[5076]=0,[20508]=Bg,[22984]=0,[26202]=Bd,[65228]=0,[34358]=0,[46599]=0,[43979]=0,[49763]=0,[30245]=nil};
                        mE(ya,Ss)
                        if(y==7)then
                            fc=Ng[26070]or Xf(57437,26070,4452)
                            continue
                        else
                            fc=Ng[14128]or Xf(126303,14128,44977)
                            continue
                        end
                        fc=3291
                    elseif fc<=47194 then
                        if(Pt)then
                            fc=Ng[-9476]or Xf(114450,-9476,28274)
                            continue
                        else
                            fc=Ng[5647]or Xf(12281,5647,49955)
                            continue
                        end
                        fc=Ng[-23989]or Xf(26622,-23989,5263)
                    else
                        J=o_((function(Jb,ZE)
                            local tB,on,_i,Kr;
                            tB={};
                            Kr,on={},function(Uu,qp,Bj)
                                Kr[Bj]=E(qp,38959)-E(Uu,38749)
                                return Kr[Bj]
                            end;
                            _i=Kr[23895]or on(42820,6232,23895)
                            repeat
                                if _i>=45057 then
                                    if _i>52495 then
                                        tB[1]=tB[2]
                                        if tB[3]~=tB[3]then
                                            _i=Kr[8508]or on(60083,22367,8508)
                                        else
                                            _i=Kr[2810]or on(27204,112149,2810)
                                        end
                                    elseif _i>45057 then
                                        _i,tB[4]=Kr[17261]or on(21746,125855,17261),tB[4]..al(sf(Lr(Jb,(tB[1]-139)+1),Lr(ZE,(tB[1]-139)%#ZE+1)))
                                    else
                                        tB[2]=tB[2]+tB[5];
                                        tB[1]=tB[2]
                                        if tB[2]~=tB[2]then
                                            _i=20866
                                        else
                                            _i=Kr[-16557]or on(60242,13599,-16557)
                                        end
                                    end
                                elseif _i<=20574 then
                                    if _i>12577 then
                                        tB[4]='';
                                        _i,tB[5],tB[2],tB[3]=Kr[8538]or on(10870,81040,8538),1,139,(#Jb-1)+139
                                    else
                                        if(tB[5]>=0 and tB[2]>tB[3])or((tB[5]<0 or tB[5]~=tB[5])and tB[2]<tB[3])then
                                            _i=20866
                                        else
                                            _i=52495
                                        end
                                    end
                                else
                                    return tB[4]
                                end
                            until _i==25335
                        end)('3','q'),ae,sr);
                        sr,fc=sr+1,Ng[-25795]or Xf(102149,-25795,35621)
                    end
                else
                    ha,fc=_m(Bd,51),Ng[30921]or Xf(92834,30921,59457)
                    continue
                end
            elseif fc<56932 then
                if fc<=53712 then
                    if fc>51221 then
                        if fc<52019 then
                            ha=ha+xC;
                            y=ha
                            if ha~=ha then
                                fc=38513
                            else
                                fc=Ng[28782]or Xf(99365,28782,43432)
                            end
                        elseif fc<=52019 then
                            if(Bd>=0 and Ne>ha)or((Bd<0 or Bd~=Bd)and Ne<ha)then
                                fc=Ng[30573]or Xf(1254,30573,42293)
                            else
                                fc=Ng[-20442]or Xf(84173,-20442,59920)
                            end
                        else
                            if xC==0 then
                                fc=Ng[24178]or Xf(108104,24178,43848)
                                continue
                            end
                            fc=Ng[11372]or Xf(3585,11372,57071)
                        end
                    elseif fc>=50541 then
                        if fc>50939 then
                            xC=Ne
                            if ha~=ha then
                                fc=Ng[3521]or Xf(25181,3521,18016)
                            else
                                fc=52019
                            end
                        elseif fc<=50541 then
                            fc,Ne=Ng[-12075]or Xf(3022,-12075,23571),_m(ha,52138596)
                            continue
                        else
                            Bd[22984],fc=vG[Bd[5076]+1],Ng[20002]or Xf(34105,20002,3055)
                        end
                    elseif fc>48821 then
                        y,fc=nil,Ng[4135]or Xf(59690,4135,4870)
                    else
                        if(xC>=0 and ha>Bd)or((xC<0 or xC~=xC)and ha<Bd)then
                            fc=Ng[25929]or Xf(123136,25929,25943)
                        else
                            fc=Ng[-24157]or Xf(14508,-24157,11808)
                        end
                    end
                elseif fc>=56345 then
                    if fc>=56734 then
                        if fc>56734 then
                            Us=o_((function(Rt,Um)
                                local uh,sy,Sq,wA;
                                sy={};
                                wA,Sq=function(jb,cu,ik)
                                    Sq[jb]=E(ik,4700)-E(cu,37647)
                                    return Sq[jb]
                                end,{};
                                uh=Sq[3664]or wA(3664,2674,36343)
                                while uh~=29611 do
                                    if uh>=48432 then
                                        if uh<=62137 then
                                            if uh<=48432 then
                                                sy[1]=sy[1]+sy[2];
                                                sy[3]=sy[1]
                                                if sy[1]~=sy[1]then
                                                    uh=Sq[-29032]or wA(-29032,32964,70872)
                                                else
                                                    uh=39647
                                                end
                                            else
                                                return sy[4]
                                            end
                                        else
                                            sy[3]=sy[1]
                                            if sy[5]~=sy[5]then
                                                uh=Sq[31534]or wA(31534,65519,85445)
                                            else
                                                uh=39647
                                            end
                                        end
                                    elseif uh<=39647 then
                                        if uh<=1582 then
                                            sy[4]='';
                                            sy[2],uh,sy[1],sy[5]=1,Sq[15353]or wA(15353,58435,91140),32,(#Rt-1)+32
                                        else
                                            if(sy[2]>=0 and sy[1]>sy[5])or((sy[2]<0 or sy[2]~=sy[2])and sy[1]<sy[5])then
                                                uh=Sq[13815]or wA(13815,51140,87512)
                                            else
                                                uh=Sq[20302]or wA(20302,11866,92162)
                                            end
                                        end
                                    else
                                        uh,sy[4]=Sq[7613]or wA(7613,24936,114123),sy[4]..al(sf(Lr(Rt,(sy[3]-32)+1),Lr(Um,(sy[3]-32)%#Um+1)))
                                    end
                                end
                            end)('\204','\142'),ae,sr);
                            sr,fc=sr+1,45163
                        else
                            fc,Pt=Ng[27562]or Xf(19062,27562,11783),false
                        end
                    elseif fc>56345 then
                        Ss,ba=ly(_j(y,10),1023),ly(_j(y,0),1023);
                        Bd[46599]=vG[Ss+1];
                        fc,Bd[34849]=Ng[-9933]or Xf(14185,-9933,31199),vG[ba+1]
                    else
                        Bd,fc=nil,32905
                    end
                elseif fc>54650 then
                    fc,hp=65376,_m(Ad,1879762098)
                    continue
                elseif fc<=54573 then
                    if(De>=0 and ba>av)or((De<0 or De~=De)and ba<av)then
                        fc=Ng[31160]or Xf(17501,31160,13485)
                    else
                        fc=46425
                    end
                else
                    Bg=y;
                    pF=GC(pF,eA(ly(Bg,127),(xC-28)*7))
                    if not Vi(Bg,128)then
                        fc=Ng[3147]or Xf(7558,3147,34327)
                        continue
                    end
                    fc=Ng[-25865]or Xf(16800,-25865,9813)
                end
            elseif fc<61140 then
                if fc>=58273 then
                    if fc<=58889 then
                        if fc>=58465 then
                            if fc>58465 then
                                xC=Bd
                                if xC==6 then
                                    fc=Ng[9132]or Xf(124003,9132,11782)
                                    continue
                                elseif(xC==5)then
                                    fc=Ng[-28942]or Xf(106308,-28942,56734)
                                    continue
                                else
                                    fc=Ng[27284]or Xf(89971,27284,49765)
                                    continue
                                end
                                fc=Ng[-15964]or Xf(123696,-15964,51998)
                            else
                                y,fc=nil,Ng[-10107]or Xf(124070,-10107,51592)
                            end
                        else
                            fc,rD=45651,_m(Aq,51)
                            continue
                        end
                    else
                        fc,vG=3289,_m(J,51)
                        continue
                    end
                elseif fc>=57019 then
                    if fc>57019 then
                        vq=o_((function(Lq,qg)
                            local la,hD,Rv,Tl;
                            Tl={};
                            hD,la={},function(Fk,Zb,Rj)
                                hD[Zb]=E(Rj,17832)-E(Fk,32670)
                                return hD[Zb]
                            end;
                            Rv=hD[18778]or la(21644,18778,5555)
                            repeat
                                if Rv>37318 then
                                    if Rv<=46753 then
                                        Tl[1],Rv=Tl[1]..al(sf(Lr(Lq,(Tl[2]-44)+1),Lr(qg,(Tl[2]-44)%#qg+1))),hD[-31833]or la(40595,-31833,97629)
                                    else
                                        return Tl[1]
                                    end
                                elseif Rv<=22504 then
                                    if Rv>11594 then
                                        Tl[3]=Tl[3]+Tl[4];
                                        Tl[2]=Tl[3]
                                        if Tl[3]~=Tl[3]then
                                            Rv=hD[29776]or la(5304,29776,93660)
                                        else
                                            Rv=hD[-2385]or la(63034,-2385,89794)
                                        end
                                    elseif Rv<=9481 then
                                        Tl[1]='';
                                        Rv,Tl[4],Tl[3],Tl[5]=hD[-22646]or la(51678,-22646,42530),1,44,(#Lq-1)+44
                                    else
                                        Tl[2]=Tl[3]
                                        if Tl[5]~=Tl[5]then
                                            Rv=hD[18559]or la(51485,18559,79481)
                                        else
                                            Rv=hD[26423]or la(62357,26423,88185)
                                        end
                                    end
                                else
                                    if(Tl[4]>=0 and Tl[3]>Tl[5])or((Tl[4]<0 or Tl[4]~=Tl[4])and Tl[3]<Tl[5])then
                                        Rv=48462
                                    else
                                        Rv=hD[17859]or la(8933,17859,86452)
                                    end
                                end
                            until Rv==17142
                        end)('\183','\245'),ae,sr);
                        fc,sr=1604,sr+1
                    else
                        if(pF>=0 and vG>J)or((pF<0 or pF~=pF)and vG<J)then
                            fc=Ng[24682]or Xf(82822,24682,50510)
                        else
                            fc=Ng[-21270]or Xf(123026,-21270,39005)
                        end
                    end
                else
                    if xC==2 then
                        fc=Ng[-4080]or Xf(52741,-4080,11191)
                        continue
                    elseif(xC==8)then
                        fc=Ng[18448]or Xf(94356,18448,62407)
                        continue
                    else
                        fc=Ng[24126]or Xf(16304,24126,56062)
                        continue
                    end
                    fc=Ng[-27722]or Xf(30544,-27722,14726)
                end
            elseif fc>63401 then
                if fc<=64797 then
                    if fc>64709 then
                        ba,fc=_m(av,52138596),Ng[19028]or Xf(129975,19028,62026)
                        continue
                    else
                        fc,Bg=Ng[-11654]or Xf(112375,-11654,34959),rs(ba)
                        continue
                    end
                else
                    Ad=hp;
                    vG=rv(Ad);
                    fc,Ne,J,pF=Ng[4893]or Xf(50981,4893,2450),1,135,(Ad)+134
                end
            elseif fc<62041 then
                if fc<=61140 then
                    if(vG>=0 and hp>Ad)or((vG<0 or vG~=vG)and hp<Ad)then
                        fc=Ng[-22631]or Xf(115653,-22631,44826)
                    else
                        fc=Ng[-31886]or Xf(95478,-31886,54170)
                    end
                else
                    ba,fc=nil,31744
                end
            elseif fc>63166 then
                Ss=0;
                av,De,fc,ba=65,1,15993,61
            elseif fc>62041 then
                J=J+Ne;
                ha=J
                if J~=J then
                    fc=15125
                else
                    fc=43005
                end
            else
                Bd=ya[(ha-8)];
                xC=Bd[20508]
                if(xC==4)then
                    fc=Ng[-20687]or Xf(117505,-20687,27842)
                    continue
                else
                    fc=Ng[-16979]or Xf(93599,-16979,41661)
                    continue
                end
                fc=Ng[-8338]or Xf(115581,-8338,52651)
            end
        until fc==31413
    end
    local Fz=wj();
    Cs[27557][ae]=Fz
    return Fz
end)
local Cc=(function(xf,Th)
    xf=Dg(xf)
    local ge=jG()
    local function ux(n_,Ja)
        local Mj=(function(...)
            return{...},aE('#',...)
        end)
        local oo;
        oo=(function(lD,Uq,Wi)
            if Uq>Wi then
                return
            end
            return lD[Uq],oo(lD,Uq+1,Wi)
        end)
        local function lr(wq,ls,EB,kB)
            local Sk,op,mf,AA,Oh,wd,hC,Ud,km,Tw,us,V,Vp,eu,Nx,wE,ei,Fw,ka,_C,pC,Oq,dx,li;
            hC,_C={},function(Yi,SD,Mx)
                hC[Mx]=E(SD,2661)-E(Yi,15774)
                return hC[Mx]
            end;
            eu=hC[8609]or _C(4952,76652,8609)
            repeat
                if eu<30467 then
                    if eu<12133 then
                        if eu<=6231 then
                            if eu>=3683 then
                                if eu<5374 then
                                    if eu>=4961 then
                                        if eu<=5219 then
                                            if eu>4961 then
                                                wq[pC[59342]],eu=not wq[pC[42338]],hC[18574]or _C(40377,86697,18574)
                                            else
                                                if(Tw==1)then
                                                    eu=hC[1381]or _C(39709,109095,1381)
                                                    continue
                                                else
                                                    eu=hC[-9334]or _C(31743,55740,-9334)
                                                    continue
                                                end
                                                eu=hC[-12154]or _C(34712,56233,-12154)
                                            end
                                        else
                                            wd+=1;
                                            eu=hC[-15525]or _C(53773,107101,-15525)
                                        end
                                    elseif eu>3683 then
                                        AA,Ud=V(wE,Fw);
                                        Fw=AA
                                        if Fw==nil then
                                            eu=hC[-32384]or _C(48871,42767,-32384)
                                        else
                                            eu=64506
                                        end
                                    else
                                        Fw,AA=V[22984],pC[22984];
                                        AA=(function(qx,Ov)
                                            local xa,is,dq,Ug;
                                            is={};
                                            xa,Ug={},function(T,yv,wC)
                                                xa[yv]=E(wC,3115)-E(T,55736)
                                                return xa[yv]
                                            end;
                                            dq=xa[-12182]or Ug(38803,-12182,23014)
                                            repeat
                                                if dq>38648 then
                                                    if dq>49332 then
                                                        dq,is[1]=xa[-3877]or Ug(6396,-3877,72169),is[1]..al(sf(Lr(qx,(is[2]-88)+1),Lr(Ov,(is[2]-88)%#Ov+1)))
                                                    else
                                                        return is[1]
                                                    end
                                                elseif dq>21630 then
                                                    if(is[3]>=0 and is[4]>is[5])or((is[3]<0 or is[3]~=is[3])and is[4]<is[5])then
                                                        dq=xa[26566]or Ug(53027,26566,56164)
                                                    else
                                                        dq=xa[-29973]or Ug(26020,-29973,104489)
                                                    end
                                                elseif dq<=6977 then
                                                    if dq>1954 then
                                                        is[2]=is[4]
                                                        if is[5]~=is[5]then
                                                            dq=49332
                                                        else
                                                            dq=38648
                                                        end
                                                    else
                                                        is[1]='';
                                                        is[5],dq,is[4],is[3]=(#qx-1)+88,xa[-28469]or Ug(22513,-28469,42401),88,1
                                                    end
                                                else
                                                    is[4]=is[4]+is[3];
                                                    is[2]=is[4]
                                                    if is[4]~=is[4]then
                                                        dq=xa[-31953]or Ug(50709,-31953,60490)
                                                    else
                                                        dq=xa[-10969]or Ug(7090,-10969,87337)
                                                    end
                                                end
                                            until dq==17665
                                        end)('\189\30','\16')..AA;
                                        Ud='';
                                        km,us,dx,eu=(#Fw-1)+232,232,1,28910
                                    end
                                elseif eu<6086 then
                                    if eu<=5563 then
                                        if eu<=5374 then
                                            V[46599]=Fw;
                                            AA,eu=nil,53578
                                        else
                                            if Oh>29 then
                                                eu=hC[-27378]or _C(50106,85252,-27378)
                                                continue
                                            else
                                                eu=hC[-13492]or _C(28863,45659,-13492)
                                                continue
                                            end
                                            eu=hC[-18001]or _C(55192,108750,-18001)
                                        end
                                    else
                                        V,wE,Fw=Nx
                                        if qv(V)~=(function(Dn,Ox)
                                            local fE,Wf,Kv,Wz;
                                            Wz={};
                                            Wf,fE={},function(fh,Qt,Oj)
                                                Wf[Qt]=E(Oj,49278)-E(fh,33535)
                                                return Wf[Qt]
                                            end;
                                            Kv=Wf[-8405]or fE(60316,-8405,3143)
                                            repeat
                                                if Kv>=58157 then
                                                    if Kv>=61062 then
                                                        if Kv>61062 then
                                                            Wz[1]=Wz[1]+Wz[2];
                                                            Wz[3]=Wz[1]
                                                            if Wz[1]~=Wz[1]then
                                                                Kv=Wf[-24405]or fE(45441,-24405,19957)
                                                            else
                                                                Kv=50138
                                                            end
                                                        else
                                                            Wz[4],Kv=Wz[4]..al(sf(Lr(Dn,(Wz[3]-5)+1),Lr(Ox,(Wz[3]-5)%#Ox+1))),Wf[8158]or fE(61639,8158,109143)
                                                        end
                                                    else
                                                        Wz[3]=Wz[1]
                                                        if Wz[5]~=Wz[5]then
                                                            Kv=23053
                                                        else
                                                            Kv=50138
                                                        end
                                                    end
                                                elseif Kv<25302 then
                                                    return Wz[4]
                                                elseif Kv<=25302 then
                                                    Wz[4]='';
                                                    Kv,Wz[2],Wz[5],Wz[1]=Wf[-30145]or fE(10479,-30145,85315),1,(#Dn-1)+5,5
                                                else
                                                    if(Wz[2]>=0 and Wz[1]>Wz[5])or((Wz[2]<0 or Wz[2]~=Wz[2])and Wz[1]<Wz[5])then
                                                        Kv=Wf[16657]or fE(65501,16657,5969)
                                                    else
                                                        Kv=61062
                                                    end
                                                end
                                            until Kv==53145
                                        end)('\215&qz\197:pw','\177S\31\25')then
                                            eu=hC[-18978]or _C(54963,126079,-18978)
                                            continue
                                        end
                                        eu=hC[9051]or _C(27393,65523,9051)
                                    end
                                elseif eu>6129 then
                                    Ud[(Oq-236)],eu=mf,hC[22187]or _C(60176,58417,22187)
                                elseif eu<=6086 then
                                    us=us+dx;
                                    Oq=us
                                    if us~=us then
                                        eu=hC[17237]or _C(24838,73560,17237)
                                    else
                                        eu=42833
                                    end
                                else
                                    V[22984]=wE
                                    if Vp==2 then
                                        eu=hC[-9403]or _C(18941,77238,-9403)
                                        continue
                                    elseif Vp==3 then
                                        eu=hC[-13880]or _C(9165,61293,-13880)
                                        continue
                                    end
                                    eu=hC[20687]or _C(22246,69478,20687)
                                end
                            elseif eu>=930 then
                                if eu>3125 then
                                    if eu>3367 then
                                        eu,wE=hC[20689]or _C(14133,10489,20689),Ud
                                        continue
                                    else
                                        Vp=Ja[pC[42338]+1];
                                        wq[pC[59342]],eu=Vp[1][Vp[3]],hC[25509]or _C(31862,61672,25509)
                                    end
                                elseif eu<=2303 then
                                    if eu>930 then
                                        if(us>=0 and AA>Ud)or((us<0 or us~=us)and AA<Ud)then
                                            eu=hC[28676]or _C(33779,82705,28676)
                                        else
                                            eu=hC[20847]or _C(8527,69699,20847)
                                        end
                                    else
                                        wd+=pC[49763];
                                        eu=hC[-1583]or _C(47685,84709,-1583)
                                    end
                                else
                                    Vp,V=nil,_m(pC[61239],4789);
                                    Vp=if V<32768 then V else V-65536;
                                    wE=Vp;
                                    Fw=ls[wE+1];
                                    AA=Fw[39302];
                                    Ud=rv(AA);
                                    wq[_m(pC[59342],0)]=ux(Fw,Ud);
                                    us,km,dx,eu=237,(AA)+236,1,13600
                                end
                            elseif eu>332 then
                                if eu<=454 then
                                    li=false;
                                    wd+=1
                                    if(Oh>163)then
                                        eu=hC[-20687]or _C(46385,87062,-20687)
                                        continue
                                    else
                                        eu=hC[5835]or _C(35979,79082,5835)
                                        continue
                                    end
                                    eu=hC[5843]or _C(33035,98143,5843)
                                else
                                    wd-=1;
                                    eu,EB[wd]=hC[1601]or _C(23952,70358,1601),{[26202]=102,[59342]=_m(pC[59342],14),[42338]=_m(pC[42338],20),[54188]=0}
                                end
                            elseif eu<194 then
                                if(pC[54188]==1)then
                                    eu=hC[31715]or _C(60016,64638,31715)
                                    continue
                                else
                                    eu=hC[-30023]or _C(41669,102488,-30023)
                                    continue
                                end
                                eu=hC[-13030]or _C(23844,70458,-13030)
                            elseif eu>194 then
                                if(Oh>120)then
                                    eu=hC[1757]or _C(31138,54906,1757)
                                    continue
                                else
                                    eu=hC[7228]or _C(16901,86762,7228)
                                    continue
                                end
                                eu=hC[-7487]or _C(17808,80598,-7487)
                            else
                                eu,wq[pC[59342]]=hC[21681]or _C(17178,81228,21681),nil
                            end
                        elseif eu>=8888 then
                            if eu>10334 then
                                if eu<11433 then
                                    if eu>10737 then
                                        AA,Ud=V(wE,Fw);
                                        Fw=AA
                                        if Fw==nil then
                                            eu=32105
                                        else
                                            eu=34123
                                        end
                                    else
                                        eu=hC[10151]or _C(28355,77245,10151)
                                        continue
                                    end
                                elseif eu>11433 then
                                    Vp=Gv(V)
                                    if Vp~=nil and Vp[(function(pw,Ws)
                                        local TD,ga,uz,vF;
                                        vF={};
                                        TD,uz={},function(xA,Hx,lG)
                                            TD[Hx]=E(lG,41954)-E(xA,36943)
                                            return TD[Hx]
                                        end;
                                        ga=TD[6570]or uz(52603,6570,1526)
                                        repeat
                                            if ga>25021 then
                                                if ga<=40950 then
                                                    vF[1]=vF[1]+vF[2];
                                                    vF[3]=vF[1]
                                                    if vF[1]~=vF[1]then
                                                        ga=TD[-27198]or uz(28382,-27198,130581)
                                                    else
                                                        ga=25021
                                                    end
                                                else
                                                    vF[4],ga=vF[4]..al(sf(Lr(pw,(vF[3]-101)+1),Lr(Ws,(vF[3]-101)%#Ws+1))),TD[16667]or uz(55482,16667,19209)
                                                end
                                            elseif ga>24422 then
                                                if(vF[2]>=0 and vF[1]>vF[5])or((vF[2]<0 or vF[2]~=vF[2])and vF[1]<vF[5])then
                                                    ga=24422
                                                else
                                                    ga=41112
                                                end
                                            elseif ga>18656 then
                                                return vF[4]
                                            elseif ga<=5123 then
                                                vF[3]=vF[1]
                                                if vF[5]~=vF[5]then
                                                    ga=TD[-23616]or uz(8382,-23616,111541)
                                                else
                                                    ga=TD[26026]or uz(35010,26026,55720)
                                                end
                                            else
                                                vF[4]='';
                                                vF[5],ga,vF[2],vF[1]=(#pw-1)+101,5123,1,101
                                            end
                                        until ga==26887
                                    end)('E.tn\20o','\26q\29')]~=nil then
                                        eu=hC[-18928]or _C(18463,74859,-18928)
                                        continue
                                    elseif(qv(V)==(function(Qi,Pu)
                                        local Qv,rp,gG,zi;
                                        Qv={};
                                        zi,rp=function(yo,cf,nd)
                                            rp[cf]=E(yo,54218)-E(nd,22174)
                                            return rp[cf]
                                        end,{};
                                        gG=rp[10025]or zi(123122,10025,63435)
                                        while gG~=26854 do
                                            if gG<=46239 then
                                                if gG>37347 then
                                                    gG,Qv[1]=rp[17833]or zi(70421,17833,48754),Qv[1]..al(sf(Lr(Qi,(Qv[2]-134)+1),Lr(Pu,(Qv[2]-134)%#Pu+1)))
                                                elseif gG<33678 then
                                                    if(Qv[3]>=0 and Qv[4]>Qv[5])or((Qv[3]<0 or Qv[3]~=Qv[3])and Qv[4]<Qv[5])then
                                                        gG=rp[6584]or zi(28538,6584,28604)
                                                    else
                                                        gG=rp[20391]or zi(90701,20391,43638)
                                                    end
                                                elseif gG<=33678 then
                                                    return Qv[1]
                                                else
                                                    Qv[1]='';
                                                    Qv[3],gG,Qv[5],Qv[4]=1,rp[4717]or zi(123477,4717,2942),(#Qi-1)+134,134
                                                end
                                            elseif gG>54207 then
                                                Qv[4]=Qv[4]+Qv[3];
                                                Qv[2]=Qv[4]
                                                if Qv[4]~=Qv[4]then
                                                    gG=rp[30717]or zi(15837,30717,15383)
                                                else
                                                    gG=12804
                                                end
                                            else
                                                Qv[2]=Qv[4]
                                                if Qv[5]~=Qv[5]then
                                                    gG=33678
                                                else
                                                    gG=rp[-17477]or zi(32978,-17477,30602)
                                                end
                                            end
                                        end
                                    end)('\197\254\211\243\212','\177\159'))then
                                        eu=hC[-4764]or _C(14698,48082,-4764)
                                        continue
                                    else
                                        eu=hC[-20191]or _C(41401,49672,-20191)
                                        continue
                                    end
                                    eu=hC[23409]or _C(19939,38566,23409)
                                else
                                    km=km+Oq;
                                    op=km
                                    if km~=km then
                                        eu=hC[27263]or _C(17060,42406,27263)
                                    else
                                        eu=58188
                                    end
                                end
                            elseif eu<=9860 then
                                if eu<=9846 then
                                    if eu<=9440 then
                                        if eu<=8888 then
                                            eu,Fw=hC[3407]or _C(19852,61024,3407),us
                                            continue
                                        else
                                            eu,V[34849]=hC[-16345]or _C(6812,51944,-16345),AA
                                        end
                                    else
                                        wd+=1;
                                        eu=hC[-6316]or _C(58206,105728,-6316)
                                    end
                                else
                                    V=kB[52959];
                                    eu,ka=hC[13465]or _C(2370,69998,13465),Vp+V-1
                                end
                            elseif eu<=9884 then
                                if(Oh>245)then
                                    eu=hC[-1887]or _C(20432,91868,-1887)
                                    continue
                                else
                                    eu=hC[-13818]or _C(21054,77879,-13818)
                                    continue
                                end
                                eu=hC[-27262]or _C(58517,105429,-27262)
                            else
                                wd-=1;
                                EB[wd],eu={[26202]=28,[59342]=_m(pC[59342],186),[42338]=_m(pC[42338],105),[54188]=0},hC[7209]or _C(63092,102122,7209)
                            end
                        elseif eu<7889 then
                            if eu<7689 then
                                if eu>6423 then
                                    wd-=1;
                                    EB[wd],eu={[26202]=163,[59342]=_m(pC[59342],207),[42338]=_m(pC[42338],201),[54188]=0},hC[-29777]or _C(42172,88994,-29777)
                                else
                                    wd+=pC[49763];
                                    eu=hC[13313]or _C(43454,83616,13313)
                                end
                            elseif eu<=7725 then
                                if eu>7689 then
                                    wd-=1;
                                    EB[wd],eu={[26202]=221,[59342]=_m(pC[59342],42),[42338]=_m(pC[42338],162),[54188]=0},hC[-17401]or _C(31461,68165,-17401)
                                else
                                    V,wE,Fw=Nx
                                    if(qv(V)~=(function(Cj,lB)
                                        local mm,Ns,Db,Go;
                                        Go={};
                                        Ns,mm=function(Dy,uo,Nq)
                                            mm[uo]=E(Dy,5647)-E(Nq,31353)
                                            return mm[uo]
                                        end,{};
                                        Db=mm[4098]or Ns(66959,4098,11892)
                                        repeat
                                            if Db<=35894 then
                                                if Db>=31702 then
                                                    if Db<=31702 then
                                                        return Go[1]
                                                    else
                                                        Go[2]=Go[3]
                                                        if Go[4]~=Go[4]then
                                                            Db=31702
                                                        else
                                                            Db=mm[21511]or Ns(67509,21511,12947)
                                                        end
                                                    end
                                                elseif Db>13974 then
                                                    Go[3]=Go[3]+Go[5];
                                                    Go[2]=Go[3]
                                                    if Go[3]~=Go[3]then
                                                        Db=31702
                                                    else
                                                        Db=51408
                                                    end
                                                else
                                                    Db,Go[1]=mm[-22840]or Ns(35910,-22840,17106),Go[1]..al(sf(Lr(Cj,(Go[2]-155)+1),Lr(lB,(Go[2]-155)%#lB+1)))
                                                end
                                            elseif Db>49011 then
                                                if(Go[5]>=0 and Go[3]>Go[4])or((Go[5]<0 or Go[5]~=Go[5])and Go[3]<Go[4])then
                                                    Db=mm[2186]or Ns(43923,2186,15295)
                                                else
                                                    Db=13974
                                                end
                                            else
                                                Go[1]='';
                                                Go[5],Go[4],Go[3],Db=1,(#Cj-1)+155,155,35894
                                            end
                                        until Db==23734
                                    end)('\230v5\187\244j4\182','\128\3[\216'))then
                                        eu=hC[10671]or _C(7042,24232,10671)
                                        continue
                                    else
                                        eu=hC[92]or _C(63644,64301,92)
                                        continue
                                    end
                                    eu=hC[-1106]or _C(53080,71017,-1106)
                                end
                            else
                                eu,wq[pC[59342]]=hC[-32009]or _C(47877,89462,-32009),wE[pC[46599]][pC[34849]]
                            end
                        elseif eu<8055 then
                            if eu<=7889 then
                                AA,Ud=V[46599],pC[46599];
                                Ud=(function(ak,Ly)
                                    local S,ai,Df,Sr;
                                    S={};
                                    ai,Df=function(rw,Zj,Jq)
                                        Df[rw]=E(Jq,2965)-E(Zj,50127)
                                        return Df[rw]
                                    end,{};
                                    Sr=Df[-5688]or ai(-5688,20385,65484)
                                    while Sr~=38206 do
                                        if Sr>40227 then
                                            if Sr<=42518 then
                                                S[1]=S[1]+S[2];
                                                S[3]=S[1]
                                                if S[1]~=S[1]then
                                                    Sr=6332
                                                else
                                                    Sr=Df[-24012]or ai(-24012,44828,31161)
                                                end
                                            else
                                                Sr,S[4]=Df[10259]or ai(10259,26378,82254),S[4]..al(sf(Lr(ak,(S[3]-240)+1),Lr(Ly,(S[3]-240)%#Ly+1)))
                                            end
                                        elseif Sr>=26603 then
                                            if Sr>26603 then
                                                S[3]=S[1]
                                                if S[5]~=S[5]then
                                                    Sr=Df[6052]or ai(6052,4239,57449)
                                                else
                                                    Sr=1369
                                                end
                                            else
                                                S[4]='';
                                                Sr,S[2],S[1],S[5]=Df[24464]or ai(24464,48823,69902),1,240,(#ak-1)+240
                                            end
                                        elseif Sr>1369 then
                                            return S[4]
                                        else
                                            if(S[2]>=0 and S[1]>S[5])or((S[2]<0 or S[2]~=S[2])and S[1]<S[5])then
                                                Sr=6332
                                            else
                                                Sr=Df[14443]or ai(14443,45231,79219)
                                            end
                                        end
                                    end
                                end)('\207l','b')..Ud;
                                us='';
                                km,eu,Oq,dx=106,35508,1,(#AA-1)+106
                            else
                                eu,Fw=hC[2830]or _C(57919,113706,2830),V-1
                            end
                        elseif eu<=8134 then
                            if eu<=8055 then
                                if not wq[pC[59342]]then
                                    eu=hC[6132]or _C(21240,74636,6132)
                                    continue
                                end
                                eu=hC[-1052]or _C(7858,53684,-1052)
                            else
                                eu,wq[pC[59342]]=hC[21494]or _C(58528,105350,21494),pC[22984]
                            end
                        else
                            Vp,V=pC[59342],pC[54188];
                            wE,Fw=BB(Kt,wq,'',Vp,V)
                            if not wE then
                                eu=hC[30365]or _C(23707,55828,30365)
                                continue
                            end
                            eu=hC[-16447]or _C(4777,45147,-16447)
                        end
                    elseif eu>21898 then
                        if eu<27421 then
                            if eu>24387 then
                                if eu<27040 then
                                    if eu>24687 then
                                        if pC[54188]==47 then
                                            eu=hC[25336]or _C(3140,30128,25336)
                                            continue
                                        elseif(pC[54188]==139)then
                                            eu=hC[23226]or _C(32350,21635,23226)
                                            continue
                                        else
                                            eu=hC[-31271]or _C(33489,55767,-31271)
                                            continue
                                        end
                                        eu=hC[7145]or _C(48600,78478,7145)
                                    else
                                        Vp,V=pC[34358],pC[22984];
                                        wE=ge[V]or Cs[31065][V]
                                        if(Vp==1)then
                                            eu=hC[-30303]or _C(51514,114879,-30303)
                                            continue
                                        else
                                            eu=hC[-8864]or _C(40393,73023,-8864)
                                            continue
                                        end
                                        eu=53368
                                    end
                                elseif eu<=27040 then
                                    V,wE,Fw=br_(V);
                                    eu=hC[7804]or _C(28187,63513,7804)
                                else
                                    V,wE,Fw=Vp[(function(je,Hs)
                                        local Wg,_z,Zp,nF;
                                        _z={};
                                        Wg,nF={},function(Dj,Lg,ID)
                                            Wg[ID]=E(Lg,63337)-E(Dj,10830)
                                            return Wg[ID]
                                        end;
                                        Zp=Wg[-21607]or nF(52042,77302,-21607)
                                        while Zp~=34278 do
                                            if Zp<=49134 then
                                                if Zp>39659 then
                                                    if(_z[1]>=0 and _z[2]>_z[3])or((_z[1]<0 or _z[1]~=_z[1])and _z[2]<_z[3])then
                                                        Zp=16430
                                                    else
                                                        Zp=39659
                                                    end
                                                elseif Zp<=38258 then
                                                    if Zp>16430 then
                                                        _z[2]=_z[2]+_z[1];
                                                        _z[4]=_z[2]
                                                        if _z[2]~=_z[2]then
                                                            Zp=16430
                                                        else
                                                            Zp=49134
                                                        end
                                                    else
                                                        return _z[5]
                                                    end
                                                else
                                                    _z[5],Zp=_z[5]..al(sf(Lr(je,(_z[4]-226)+1),Lr(Hs,(_z[4]-226)%#Hs+1))),Wg[23194]or nF(46628,116405,23194)
                                                end
                                            elseif Zp<=55561 then
                                                _z[4]=_z[2]
                                                if _z[3]~=_z[3]then
                                                    Zp=16430
                                                else
                                                    Zp=49134
                                                end
                                            else
                                                _z[5]='';
                                                Zp,_z[3],_z[2],_z[1]=Wg[31854]or nF(64659,88207,31854),(#je-1)+226,226,1
                                            end
                                        end
                                    end)('riqYSj','-6\24')](V);
                                    eu=hC[-13082]or _C(26599,25385,-13082)
                                end
                            elseif eu<=23252 then
                                if eu<=23159 then
                                    if eu>=22647 then
                                        if eu>22647 then
                                            wq[pC[42338]]=rv(pC[43979]);
                                            wd+=1;
                                            eu=hC[9576]or _C(28017,66545,9576)
                                        else
                                            if Oh>183 then
                                                eu=hC[-14281]or _C(58963,106007,-14281)
                                                continue
                                            else
                                                eu=hC[-11529]or _C(27776,56158,-11529)
                                                continue
                                            end
                                            eu=hC[7690]or _C(36437,91669,7690)
                                        end
                                    else
                                        if Oh>104 then
                                            eu=hC[-31839]or _C(20360,39865,-31839)
                                            continue
                                        else
                                            eu=hC[3937]or _C(10319,15739,3937)
                                            continue
                                        end
                                        eu=hC[9390]or _C(49951,113987,9390)
                                    end
                                else
                                    AA,Ud=V[46599],pC[46599];
                                    Ud=(function(ee,ma)
                                        local Po,fG,Sh,Jc;
                                        Sh={};
                                        Po,Jc=function(ib,Yj,RF)
                                            Jc[Yj]=E(ib,52591)-E(RF,24063)
                                            return Jc[Yj]
                                        end,{};
                                        fG=Jc[21150]or Po(124846,21150,45728)
                                        while fG~=5134 do
                                            if fG<52901 then
                                                if fG>=15202 then
                                                    if fG>15202 then
                                                        Sh[1]=Sh[2]
                                                        if Sh[3]~=Sh[3]then
                                                            fG=Jc[-27584]or Po(113130,-27584,63519)
                                                        else
                                                            fG=11867
                                                        end
                                                    else
                                                        Sh[4]='';
                                                        fG,Sh[5],Sh[3],Sh[2]=Jc[15674]or Po(26414,15674,30287),1,(#ee-1)+52,52
                                                    end
                                                else
                                                    if(Sh[5]>=0 and Sh[2]>Sh[3])or((Sh[5]<0 or Sh[5]~=Sh[5])and Sh[2]<Sh[3])then
                                                        fG=52901
                                                    else
                                                        fG=Jc[-39]or Po(15482,-39,23302)
                                                    end
                                                end
                                            elseif fG<55304 then
                                                return Sh[4]
                                            elseif fG>55304 then
                                                fG,Sh[4]=Jc[-15219]or Po(5958,-15219,24542),Sh[4]..al(sf(Lr(ee,(Sh[1]-52)+1),Lr(ma,(Sh[1]-52)%#ma+1)))
                                            else
                                                Sh[2]=Sh[2]+Sh[5];
                                                Sh[1]=Sh[2]
                                                if Sh[2]~=Sh[2]then
                                                    fG=52901
                                                else
                                                    fG=Jc[16875]or Po(43663,16875,25722)
                                                end
                                            end
                                        end
                                    end)('\27\184','\182')..Ud;
                                    us='';
                                    eu,km,Oq,dx=hC[-16305]or _C(36454,59070,-16305),12,1,(#AA-1)+12
                                end
                            elseif eu<=24327 then
                                Vp=Ja[pC[42338]+1];
                                eu,Vp[1][Vp[3]]=hC[-18271]or _C(17015,78571,-18271),wq[pC[59342]]
                            else
                                wd-=1;
                                EB[wd],eu={[26202]=70,[59342]=_m(pC[59342],235),[42338]=_m(pC[42338],99),[54188]=0},hC[-18613]or _C(56261,103781,-18613)
                            end
                        elseif eu>29410 then
                            if eu<29876 then
                                if eu>29683 then
                                    Vp,V,wE=pC[22984],pC[65228],wq[pC[59342]]
                                    if((wE==Vp)~=V)then
                                        eu=hC[7299]or _C(13869,35763,7299)
                                        continue
                                    else
                                        eu=hC[30614]or _C(47722,38589,30614)
                                        continue
                                    end
                                    eu=hC[19823]or _C(28082,66228,19823)
                                else
                                    V[46599],eu=Fw,hC[-26243]or _C(7367,45185,-26243)
                                end
                            elseif eu>29876 then
                                wd+=pC[49763];
                                eu=hC[-21506]or _C(9262,55344,-21506)
                            else
                                Vp=Gv(V)
                                if Vp~=nil and Vp[(function(Hp,Hj)
                                    local nz,wy,fo_,bm;
                                    fo_={};
                                    bm,wy={},function(PC,_f,Z)
                                        bm[_f]=E(PC,42516)-E(Z,10524)
                                        return bm[_f]
                                    end;
                                    nz=bm[5092]or wy(26435,5092,26977)
                                    while nz~=16804 do
                                        if nz>=18539 then
                                            if nz<26776 then
                                                fo_[1]=fo_[1]+fo_[2];
                                                fo_[3]=fo_[1]
                                                if fo_[1]~=fo_[1]then
                                                    nz=3032
                                                else
                                                    nz=17259
                                                end
                                            elseif nz>26776 then
                                                fo_[4]='';
                                                fo_[1],nz,fo_[2],fo_[5]=54,26776,1,(#Hp-1)+54
                                            else
                                                fo_[3]=fo_[1]
                                                if fo_[5]~=fo_[5]then
                                                    nz=bm[-20046]or wy(36483,-20046,13731)
                                                else
                                                    nz=17259
                                                end
                                            end
                                        elseif nz<17259 then
                                            return fo_[4]
                                        elseif nz<=17259 then
                                            if(fo_[2]>=0 and fo_[1]>fo_[5])or((fo_[2]<0 or fo_[2]~=fo_[2])and fo_[1]<fo_[5])then
                                                nz=3032
                                            else
                                                nz=18139
                                            end
                                        else
                                            fo_[4],nz=fo_[4]..al(sf(Lr(Hp,(fo_[3]-54)+1),Lr(Hj,(fo_[3]-54)%#Hj+1))),bm[23442]or wy(19301,23442,35866)
                                        end
                                    end
                                end)('M\176\236f\138\247','\18\239\133')]~=nil then
                                    eu=hC[-27776]or _C(58696,84144,-27776)
                                    continue
                                elseif qv(V)==(function(Hy,kh)
                                    local js,VA,OA,ce;
                                    ce={};
                                    VA,js=function(EA,Nw,gb)
                                        js[EA]=E(Nw,16820)-E(gb,23206)
                                        return js[EA]
                                    end,{};
                                    OA=js[-167]or VA(-167,88615,48454)
                                    repeat
                                        if OA>=28227 then
                                            if OA<=29092 then
                                                if OA<=28227 then
                                                    ce[1]=ce[2]
                                                    if ce[3]~=ce[3]then
                                                        OA=40547
                                                    else
                                                        OA=13846
                                                    end
                                                else
                                                    ce[2]=ce[2]+ce[4];
                                                    ce[1]=ce[2]
                                                    if ce[2]~=ce[2]then
                                                        OA=40547
                                                    else
                                                        OA=js[4856]or VA(4856,36123,52287)
                                                    end
                                                end
                                            else
                                                return ce[5]
                                            end
                                        elseif OA<13235 then
                                            OA,ce[5]=js[2292]or VA(2292,33789,2563),ce[5]..al(sf(Lr(Hy,(ce[1]-118)+1),Lr(kh,(ce[1]-118)%#kh+1)))
                                        elseif OA>13235 then
                                            if(ce[4]>=0 and ce[2]>ce[3])or((ce[4]<0 or ce[4]~=ce[4])and ce[2]<ce[3])then
                                                OA=js[9289]or VA(9289,70506,61149)
                                            else
                                                OA=js[-3024]or VA(-3024,43682,37471)
                                            end
                                        else
                                            ce[5]='';
                                            ce[2],ce[4],ce[3],OA=118,1,(#Hy-1)+118,js[16191]or VA(16191,48612,54443)
                                        end
                                    until OA==14287
                                end)('3\170%\167\"','G\203')then
                                    eu=hC[-27859]or _C(25162,42516,-27859)
                                    continue
                                end
                                eu=hC[18209]or _C(35817,53039,18209)
                            end
                        elseif eu>28524 then
                            if eu>28910 then
                                eu,V=14497,AA
                                continue
                            else
                                Oq=us
                                if km~=km then
                                    eu=hC[-8929]or _C(62275,54963,-8929)
                                else
                                    eu=31308
                                end
                            end
                        elseif eu<28230 then
                            if eu>27421 then
                                if(op>=0 and dx>Oq)or((op<0 or op~=op)and dx<Oq)then
                                    eu=hC[-7032]or _C(19325,51355,-7032)
                                else
                                    eu=36627
                                end
                            else
                                if Oh>28 then
                                    eu=hC[-32758]or _C(15320,19473,-32758)
                                    continue
                                else
                                    eu=hC[19496]or _C(19582,83627,19496)
                                    continue
                                end
                                eu=hC[24199]or _C(57088,102694,24199)
                            end
                        elseif eu>28230 then
                            Fw=wq[Vp];
                            Ud,AA,us,eu=V,Vp+1,1,hC[19119]or _C(11378,38019,19119)
                        else
                            Vp,V=pC[59342],pC[42338]-1
                            if V==-1 then
                                eu=hC[2788]or _C(784,28535,2788)
                                continue
                            end
                            eu=58927
                        end
                    elseif eu>=16111 then
                        if eu>=19154 then
                            if eu>=19963 then
                                if eu<=21333 then
                                    if eu<=19963 then
                                        wd-=1;
                                        EB[wd],eu={[26202]=17,[59342]=_m(pC[59342],159),[42338]=_m(pC[42338],148),[54188]=0},hC[11367]or _C(59804,100034,11367)
                                    else
                                        op=EB[wd];
                                        wd+=1;
                                        Tw=op[59342]
                                        if(Tw==0)then
                                            eu=hC[11117]or _C(62206,95312,11117)
                                            continue
                                        else
                                            eu=hC[-13972]or _C(59251,58411,-13972)
                                            continue
                                        end
                                        eu=hC[-13833]or _C(35860,49973,-13833)
                                    end
                                else
                                    Tw=dx
                                    if Oq~=Oq then
                                        eu=hC[21244]or _C(46224,57164,21244)
                                    else
                                        eu=27658
                                    end
                                end
                            elseif eu<=19483 then
                                if eu>19154 then
                                    eu,AA=hC[-29426]or _C(31291,26336,-29426),km
                                    continue
                                else
                                    wd+=1;
                                    eu=hC[28311]or _C(2066,58452,28311)
                                end
                            else
                                V,wE,Fw=br_(V);
                                eu=hC[-2158]or _C(23818,25858,-2158)
                            end
                        elseif eu>=18501 then
                            if eu>=18749 then
                                if eu<=18749 then
                                    if Oh>70 then
                                        eu=hC[-20394]or _C(17591,65499,-20394)
                                        continue
                                    else
                                        eu=hC[-27638]or _C(51061,80147,-27638)
                                        continue
                                    end
                                    eu=hC[2773]or _C(59133,106093,2773)
                                else
                                    wq[pC[59342]],eu=#wq[pC[42338]],hC[591]or _C(4848,57974,591)
                                end
                            else
                                wq[pC[59342]],eu=wE[pC[46599]],hC[4913]or _C(13157,54550,4913)
                            end
                        elseif eu>16111 then
                            Vp,V,wE=pC[22984],pC[65228],wq[pC[59342]]
                            if(wE==Vp)~=V then
                                eu=hC[27369]or _C(6036,18756,27369)
                                continue
                            else
                                eu=hC[-13621]or _C(29029,40360,-13621)
                                continue
                            end
                            eu=hC[-15140]or _C(33654,97768,-15140)
                        else
                            if(pC[54188]==63)then
                                eu=hC[1337]or _C(47996,65979,1337)
                                continue
                            else
                                eu=hC[15089]or _C(46229,64820,15089)
                                continue
                            end
                            eu=hC[-28668]or _C(42779,88399,-28668)
                        end
                    elseif eu<=13625 then
                        if eu<=12503 then
                            if eu<12425 then
                                if eu>12133 then
                                    Vp,V=pC[59342],pC[42338];
                                    wE=V-1
                                    if(wE==-1)then
                                        eu=hC[26252]or _C(3000,56561,26252)
                                        continue
                                    else
                                        eu=hC[-31102]or _C(64407,61259,-31102)
                                        continue
                                    end
                                    eu=hC[32056]or _C(23559,78370,32056)
                                else
                                    eu,Vp,V,wE=hC[26929]or _C(33142,49454,26929),pC[34358],EB[wd+1],nil
                                end
                            elseif eu<=12425 then
                                eu,Fw=5374,us
                                continue
                            else
                                km=km+Oq;
                                op=km
                                if km~=km then
                                    eu=hC[22270]or _C(60616,65131,22270)
                                else
                                    eu=hC[-24385]or _C(40193,97009,-24385)
                                end
                            end
                        elseif eu>13600 then
                            eu,us=hC[-19233]or _C(28681,28709,-19233),us..Sw(_m(Sp(AA,(op-12)+1),Sp(Ud,(op-12)%#Ud+1)))
                        else
                            Oq=us
                            if km~=km then
                                eu=hC[26027]or _C(36304,90774,26027)
                            else
                                eu=hC[20499]or _C(54017,106389,20499)
                            end
                        end
                    elseif eu>14497 then
                        if eu>14563 then
                            if(pC[54188]==246)then
                                eu=hC[-10272]or _C(36636,79985,-10272)
                                continue
                            else
                                eu=hC[-14109]or _C(28729,17420,-14109)
                                continue
                            end
                            eu=hC[-10966]or _C(13010,52628,-10966)
                        else
                            op=km
                            if dx~=dx then
                                eu=hC[-3549]or _C(32936,59354,-3549)
                            else
                                eu=hC[23756]or _C(61164,113883,23756)
                            end
                        end
                    elseif eu>14475 then
                        Vp[22984]=V;
                        eu,pC[26202]=hC[-3435]or _C(64494,95600,-3435),224
                    elseif eu>14123 then
                        if pC[54188]==42 then
                            eu=hC[-31613]or _C(2930,21807,-31613)
                            continue
                        else
                            eu=hC[1034]or _C(21553,49875,1034)
                            continue
                        end
                        eu=hC[4698]or _C(9558,56072,4698)
                    else
                        if Oh>80 then
                            eu=hC[-6794]or _C(11120,58882,-6794)
                            continue
                        else
                            eu=hC[14904]or _C(63708,53400,14904)
                            continue
                        end
                        eu=hC[5629]or _C(37317,94053,5629)
                    end
                elseif eu>47962 then
                    if eu<=56176 then
                        if eu<53578 then
                            if eu<=52510 then
                                if eu>50869 then
                                    if eu>51890 then
                                        qi(Ud,1,us,Vp,wq);
                                        eu=hC[-19813]or _C(61927,102267,-19813)
                                    else
                                        Vp,V,wE=pC[59342],pC[54188],pC[22984];
                                        Fw=wq[V];
                                        wq[Vp+1]=Fw;
                                        wq[Vp]=Fw[wE];
                                        wd+=1;
                                        eu=hC[-6911]or _C(48715,79391,-6911)
                                    end
                                elseif eu>49675 then
                                    Fw,eu=nil,hC[113]or _C(24752,45671,113)
                                elseif eu>=49119 then
                                    if eu<=49119 then
                                        us=us+dx;
                                        Oq=us
                                        if us~=us then
                                            eu=hC[32524]or _C(14677,6305,32524)
                                        else
                                            eu=31308
                                        end
                                    else
                                        if Oh>224 then
                                            eu=hC[19192]or _C(23879,26475,19192)
                                            continue
                                        else
                                            eu=hC[-1520]or _C(39365,98150,-1520)
                                            continue
                                        end
                                        eu=hC[13470]or _C(48698,79404,13470)
                                    end
                                else
                                    if Oh>201 then
                                        eu=hC[27113]or _C(40920,105173,27113)
                                        continue
                                    else
                                        eu=hC[-16329]or _C(17016,44089,-16329)
                                        continue
                                    end
                                    eu=hC[17890]or _C(28778,68860,17890)
                                end
                            elseif eu>=53368 then
                                if eu>53368 then
                                    if Oh>223 then
                                        eu=hC[25783]or _C(46701,85757,25783)
                                        continue
                                    else
                                        eu=hC[2890]or _C(31013,61867,2890)
                                        continue
                                    end
                                    eu=hC[23870]or _C(23976,70334,23870)
                                else
                                    wd+=1;
                                    eu=hC[23028]or _C(29752,67630,23028)
                                end
                            elseif eu<=53097 then
                                if(pC[54188]==125)then
                                    eu=hC[-29851]or _C(58917,54627,-29851)
                                    continue
                                else
                                    eu=hC[-8024]or _C(45485,43014,-8024)
                                    continue
                                end
                                eu=hC[-7217]or _C(57405,105517,-7217)
                            else
                                if(Oq>=0 and km>dx)or((Oq<0 or Oq~=Oq)and km<dx)then
                                    eu=hC[-4185]or _C(57783,62596,-4185)
                                else
                                    eu=47962
                                end
                            end
                        elseif eu<54958 then
                            if eu>=54649 then
                                if eu>=54724 then
                                    if eu>54724 then
                                        wq[pC[59342]],eu=wE,hC[-20807]or _C(32580,71991,-20807)
                                    else
                                        if Oh>216 then
                                            eu=hC[-25663]or _C(59982,90642,-25663)
                                            continue
                                        else
                                            eu=hC[-25739]or _C(46787,92330,-25739)
                                            continue
                                        end
                                        eu=hC[23720]or _C(34165,97269,23720)
                                    end
                                else
                                    if Oh>102 then
                                        eu=hC[-29985]or _C(16367,64932,-29985)
                                        continue
                                    else
                                        eu=hC[-23506]or _C(3003,55664,-23506)
                                        continue
                                    end
                                    eu=hC[-11648]or _C(13485,52157,-11648)
                                end
                            elseif eu>53578 then
                                eu,us=hC[-7911]or _C(19793,79752,-7911),wE-1
                            else
                                Ud,us=V[34849],pC[34849];
                                us=(function(su,od)
                                    local vt,an_,Yb,Yk;
                                    Yk={};
                                    Yb,an_=function(aD,Up,xu)
                                        an_[xu]=E(Up,4291)-E(aD,44354)
                                        return an_[xu]
                                    end,{};
                                    vt=an_[24376]or Yb(59445,50840,24376)
                                    while vt~=39471 do
                                        if vt>37092 then
                                            if vt<=50258 then
                                                vt,Yk[1]=an_[-11232]or Yb(5316,74484,-11232),Yk[1]..al(sf(Lr(su,(Yk[2]-244)+1),Lr(od,(Yk[2]-244)%#od+1)))
                                            else
                                                return Yk[1]
                                            end
                                        elseif vt<=30897 then
                                            if vt<30834 then
                                                Yk[2]=Yk[3]
                                                if Yk[4]~=Yk[4]then
                                                    vt=an_[-25415]or Yb(17432,119215,-25415)
                                                else
                                                    vt=30834
                                                end
                                            elseif vt>30834 then
                                                Yk[3]=Yk[3]+Yk[5];
                                                Yk[2]=Yk[3]
                                                if Yk[3]~=Yk[3]then
                                                    vt=an_[16132]or Yb(27070,101837,16132)
                                                else
                                                    vt=an_[-28197]or Yb(16032,72855,-28197)
                                                end
                                            else
                                                if(Yk[5]>=0 and Yk[3]>Yk[4])or((Yk[5]<0 or Yk[5]~=Yk[5])and Yk[3]<Yk[4])then
                                                    vt=55314
                                                else
                                                    vt=an_[-12842]or Yb(57367,65892,-12842)
                                                end
                                            end
                                        else
                                            Yk[1]='';
                                            Yk[4],Yk[3],Yk[5],vt=(#su-1)+244,244,1,28027
                                        end
                                    end
                                end)('\184\27','\21')..us;
                                km='';
                                dx,op,eu,Oq=21,1,hC[-17523]or _C(30786,37123,-17523),(#Ud-1)+21
                            end
                        elseif eu<56046 then
                            if eu<=55154 then
                                if eu>54958 then
                                    if(Oh>193)then
                                        eu=hC[-8759]or _C(46917,73252,-8759)
                                        continue
                                    else
                                        eu=hC[-892]or _C(49282,90102,-892)
                                        continue
                                    end
                                    eu=hC[-25660]or _C(50388,113546,-25660)
                                else
                                    return oo(wq,Vp,Vp+Fw-1)
                                end
                            else
                                if Oh>116 then
                                    eu=hC[9532]or _C(24655,64978,9532)
                                    continue
                                else
                                    eu=hC[23343]or _C(24709,60990,23343)
                                    continue
                                end
                                eu=hC[-29669]or _C(30880,63366,-29669)
                            end
                        elseif eu<56113 then
                            if Oh>26 then
                                eu=hC[1557]or _C(4687,9652,1557)
                                continue
                            else
                                eu=hC[-6698]or _C(777,30691,-6698)
                                continue
                            end
                            eu=hC[10324]or _C(53955,107111,10324)
                        elseif eu>56113 then
                            wE,Fw=Vp[22984],pC[22984];
                            Fw=(function(Aw,Zl)
                                local qw,Rk,Xp,by;
                                Rk={};
                                Xp,qw=function(kr,kv,dp)
                                    qw[kv]=E(kr,10233)-E(dp,46503)
                                    return qw[kv]
                                end,{};
                                by=qw[-8258]or Xp(55256,-8258,24465)
                                while by~=2990 do
                                    if by<=39778 then
                                        if by>=34713 then
                                            if by<=34713 then
                                                return Rk[1]
                                            else
                                                Rk[1],by=Rk[1]..al(sf(Lr(Aw,(Rk[2]-166)+1),Lr(Zl,(Rk[2]-166)%#Zl+1))),qw[-21671]or Xp(23814,-21671,37552)
                                            end
                                        elseif by>1515 then
                                            Rk[3]=Rk[3]+Rk[4];
                                            Rk[2]=Rk[3]
                                            if Rk[3]~=Rk[3]then
                                                by=34713
                                            else
                                                by=qw[-21040]or Xp(111755,-21040,5270)
                                            end
                                        else
                                            Rk[1]='';
                                            Rk[4],Rk[5],Rk[3],by=1,(#Aw-1)+166,166,qw[29108]or Xp(113600,29108,6871)
                                        end
                                    elseif by>60617 then
                                        if(Rk[4]>=0 and Rk[3]>Rk[5])or((Rk[4]<0 or Rk[4]~=Rk[4])and Rk[3]<Rk[5])then
                                            by=qw[19896]or Xp(50825,19896,60528)
                                        else
                                            by=qw[14529]or Xp(68138,14529,10198)
                                        end
                                    else
                                        Rk[2]=Rk[3]
                                        if Rk[5]~=Rk[5]then
                                            by=qw[10245]or Xp(72750,10245,409)
                                        else
                                            by=62017
                                        end
                                    end
                                end
                            end)('\195\96','n')..Fw;
                            AA='';
                            eu,us,km,Ud=hC[-11067]or _C(42681,100986,-11067),(#wE-1)+88,1,88
                        else
                            V,wE,Fw=Vp[(function(KE,Zw)
                                local hr,Hq,eG,Ny;
                                Hq={};
                                hr,Ny={},function(XD,Yf,Zv)
                                    hr[XD]=E(Zv,18043)-E(Yf,31651)
                                    return hr[XD]
                                end;
                                eG=hr[-7097]or Ny(-7097,55961,73369)
                                while eG~=8642 do
                                    if eG>47016 then
                                        if eG>52166 then
                                            if(Hq[1]>=0 and Hq[2]>Hq[3])or((Hq[1]<0 or Hq[1]~=Hq[1])and Hq[2]<Hq[3])then
                                                eG=hr[23256]or Ny(23256,44490,123988)
                                            else
                                                eG=10517
                                            end
                                        else
                                            return Hq[4]
                                        end
                                    elseif eG>20267 then
                                        Hq[4]='';
                                        Hq[1],Hq[3],Hq[2],eG=1,(#KE-1)+170,170,hr[2407]or Ny(2407,57553,57648)
                                    elseif eG<10517 then
                                        Hq[5]=Hq[2]
                                        if Hq[3]~=Hq[3]then
                                            eG=hr[-22440]or Ny(-22440,37837,127567)
                                        else
                                            eG=hr[-4847]or Ny(-4847,11636,66277)
                                        end
                                    elseif eG>10517 then
                                        Hq[2]=Hq[2]+Hq[1];
                                        Hq[5]=Hq[2]
                                        if Hq[2]~=Hq[2]then
                                            eG=52166
                                        else
                                            eG=60871
                                        end
                                    else
                                        eG,Hq[4]=hr[-6310]or Ny(-6310,54293,47258),Hq[4]..al(sf(Lr(KE,(Hq[5]-170)+1),Lr(Zw,(Hq[5]-170)%#Zw+1)))
                                    end
                                end
                            end)('Qi\3zS\24','\14\54j')](V);
                            eu=hC[9659]or _C(56362,101070,9659)
                        end
                    elseif eu>=62800 then
                        if eu<=64226 then
                            if eu>63935 then
                                if eu<=64107 then
                                    if(pC[54188]==14)then
                                        eu=hC[7536]or _C(4268,41048,7536)
                                        continue
                                    else
                                        eu=hC[-24249]or _C(38951,57146,-24249)
                                        continue
                                    end
                                    eu=hC[-20663]or _C(39104,87142,-20663)
                                else
                                    if pC[54188]==219 then
                                        eu=hC[-1249]or _C(64801,76391,-1249)
                                        continue
                                    else
                                        eu=hC[971]or _C(65021,51183,971)
                                        continue
                                    end
                                    eu=hC[21536]or _C(65493,94357,21536)
                                end
                            elseif eu>=63113 then
                                if eu>63113 then
                                    ei=op[42338];
                                    mf=Nx[ei]
                                    if mf==nil then
                                        eu=hC[-3464]or _C(59112,97524,-3464)
                                        continue
                                    end
                                    eu=6231
                                else
                                    if Oh>167 then
                                        eu=hC[-881]or _C(31798,43122,-881)
                                        continue
                                    else
                                        eu=hC[29370]or _C(22183,54540,29370)
                                        continue
                                    end
                                    eu=hC[455]or _C(8980,56650,455)
                                end
                            elseif eu<=62800 then
                                wd+=pC[49763];
                                eu=hC[4019]or _C(52354,107428,4019)
                            else
                                Ud[2]=Ud[1][Ud[3]];
                                Ud[1]=Ud;
                                Ud[3]=2;
                                eu,Nx[AA]=hC[-7573]or _C(22720,69168,-7573),nil
                            end
                        elseif eu>=64506 then
                            if eu>64506 then
                                Fw..=wq[km];
                                eu=hC[-15247]or _C(26433,67472,-15247)
                            else
                                yx(Ud);
                                Sk[AA],eu=nil,hC[-4115]or _C(60353,61271,-4115)
                            end
                        elseif eu>64237 then
                            Ud=Ud+km;
                            dx=Ud
                            if Ud~=Ud then
                                eu=hC[-26257]or _C(14471,32158,-26257)
                            else
                                eu=hC[29438]or _C(50289,109771,29438)
                            end
                        else
                            Vp=Gv(V)
                            if Vp~=nil and Vp[(function(Ni,Oy)
                                local DD,zv,c,As;
                                zv={};
                                c,DD=function(Cu,Zm,hm)
                                    DD[hm]=E(Zm,48983)-E(Cu,30743)
                                    return DD[hm]
                                end,{};
                                As=DD[-23799]or c(52403,26957,-23799)
                                repeat
                                    if As<51350 then
                                        if As<=21558 then
                                            if As>8566 then
                                                return zv[1]
                                            else
                                                zv[1]='';
                                                As,zv[2],zv[3],zv[4]=64859,169,(#Ni-1)+169,1
                                            end
                                        else
                                            if(zv[4]>=0 and zv[2]>zv[3])or((zv[4]<0 or zv[4]~=zv[4])and zv[2]<zv[3])then
                                                As=21558
                                            else
                                                As=DD[-9956]or c(44727,92839,-9956)
                                            end
                                        end
                                    elseif As<=64859 then
                                        if As<=51350 then
                                            zv[2]=zv[2]+zv[4];
                                            zv[5]=zv[2]
                                            if zv[2]~=zv[2]then
                                                As=DD[8662]or c(39448,100626,8662)
                                            else
                                                As=35332
                                            end
                                        else
                                            zv[5]=zv[2]
                                            if zv[3]~=zv[3]then
                                                As=DD[-11494]or c(55998,18824,-11494)
                                            else
                                                As=35332
                                            end
                                        end
                                    else
                                        zv[1],As=zv[1]..al(sf(Lr(Ni,(zv[5]-169)+1),Lr(Oy,(zv[5]-169)%#Oy+1))),DD[-4186]or c(6030,100216,-4186)
                                    end
                                until As==26316
                            end)('\237?\127\198\5d','\178\96\22')]~=nil then
                                eu=hC[-27677]or _C(58771,112987,-27677)
                                continue
                            elseif qv(V)==(function(nj,vb)
                                local Xo,hc,t_,qy;
                                hc={};
                                Xo,t_=function(ym,zb,we)
                                    t_[ym]=E(we,16890)-E(zb,40110)
                                    return t_[ym]
                                end,{};
                                qy=t_[-5618]or Xo(-5618,17715,101224)
                                repeat
                                    if qy<=51392 then
                                        if qy>51166 then
                                            hc[1],qy=hc[1]..al(sf(Lr(nj,(hc[2]-254)+1),Lr(vb,(hc[2]-254)%#vb+1))),t_[-31476]or Xo(-31476,787,94646)
                                        elseif qy>=49726 then
                                            if qy>49726 then
                                                return hc[1]
                                            else
                                                if(hc[3]>=0 and hc[4]>hc[5])or((hc[3]<0 or hc[3]~=hc[3])and hc[4]<hc[5])then
                                                    qy=51166
                                                else
                                                    qy=t_[-31423]or Xo(-31423,54628,86896)
                                                end
                                            end
                                        else
                                            hc[4]=hc[4]+hc[3];
                                            hc[2]=hc[4]
                                            if hc[4]~=hc[4]then
                                                qy=51166
                                            else
                                                qy=t_[-18432]or Xo(-18432,35001,38831)
                                            end
                                        end
                                    elseif qy>54795 then
                                        hc[1]='';
                                        hc[3],hc[4],qy,hc[5]=1,254,t_[-14010]or Xo(-14010,51776,93443),(#nj-1)+254
                                    else
                                        hc[2]=hc[4]
                                        if hc[5]~=hc[5]then
                                            qy=51166
                                        else
                                            qy=t_[20371]or Xo(20371,22345,118751)
                                        end
                                    end
                                until qy==18594
                            end)("1t\'y ",'E\21')then
                                eu=hC[16946]or _C(38825,72114,16946)
                                continue
                            end
                            eu=hC[-11903]or _C(40204,79340,-11903)
                        end
                    elseif eu<58891 then
                        if eu<58607 then
                            if eu>58188 then
                                eu,AA=hC[27042]or _C(59072,122099,27042),AA..Sw(_m(Sp(wE,(dx-88)+1),Sp(Fw,(dx-88)%#Fw+1)))
                            else
                                if(Oq>=0 and km>dx)or((Oq<0 or Oq~=Oq)and km<dx)then
                                    eu=hC[-30431]or _C(53646,71420,-30431)
                                else
                                    eu=13625
                                end
                            end
                        elseif eu<58616 then
                            Ud,eu=Ud..Sw(_m(Sp(Fw,(Oq-232)+1),Sp(AA,(Oq-232)%#AA+1))),hC[15644]or _C(63077,98751,15644)
                        elseif eu<=58616 then
                            dx=Ud
                            if us~=us then
                                eu=hC[-19067]or _C(15986,31915,-19067)
                            else
                                eu=44223
                            end
                        else
                            eu,ka=hC[-32260]or _C(3882,62903,-32260),Vp+us-1
                        end
                    elseif eu<61034 then
                        if eu<=58891 then
                            if Ud[3]>=pC[59342]then
                                eu=hC[8943]or _C(9191,73354,8943)
                                continue
                            end
                            eu=hC[12971]or _C(41478,79082,12971)
                        else
                            qi(kB[59031],1,V,Vp,wq);
                            eu=hC[-28043]or _C(64587,94239,-28043)
                        end
                    elseif eu<=62019 then
                        if eu>61034 then
                            ka,wd,Nx,eu,Sk,li=-1,1,St({},{[(function(qB,eo)
                                local Jg,tl,Cz,jl;
                                jl={};
                                tl,Jg=function(CB,Om,fx)
                                    Jg[CB]=E(fx,37442)-E(Om,61366)
                                    return Jg[CB]
                                end,{};
                                Cz=Jg[-16097]or tl(-16097,55963,15667)
                                repeat
                                    if Cz>=38429 then
                                        if Cz>=42811 then
                                            if Cz>42811 then
                                                jl[1]=jl[1]+jl[2];
                                                jl[3]=jl[1]
                                                if jl[1]~=jl[1]then
                                                    Cz=42811
                                                else
                                                    Cz=6357
                                                end
                                            else
                                                return jl[4]
                                            end
                                        else
                                            jl[4],Cz=jl[4]..al(sf(Lr(qB,(jl[3]-141)+1),Lr(eo,(jl[3]-141)%#eo+1))),Jg[1559]or tl(1559,45463,101310)
                                        end
                                    elseif Cz>=31300 then
                                        if Cz<=31300 then
                                            jl[4]='';
                                            jl[1],Cz,jl[2],jl[5]=141,Jg[-174]or tl(-174,63536,1386),1,(#qB-1)+141
                                        else
                                            jl[3]=jl[1]
                                            if jl[5]~=jl[5]then
                                                Cz=Jg[24725]or tl(24725,1283,66482)
                                            else
                                                Cz=6357
                                            end
                                        end
                                    else
                                        if(jl[2]>=0 and jl[1]>jl[5])or((jl[2]<0 or jl[2]~=jl[2])and jl[1]<jl[5])then
                                            Cz=42811
                                        else
                                            Cz=38429
                                        end
                                    end
                                until Cz==2562
                            end)('\219\162\199\235\153\207','\132\253\170')]=(function(We,UB)
                                local xo,ld,sv,F;
                                F={};
                                ld,xo=function(Hf,ua,Gn)
                                    xo[Hf]=E(ua,55090)-E(Gn,7290)
                                    return xo[Hf]
                                end,{};
                                sv=xo[-15665]or ld(-15665,109414,25097)
                                while sv~=34135 do
                                    if sv>39230 then
                                        if sv>61254 then
                                            F[1]='';
                                            F[2],F[3],sv,F[4]=(#We-1)+103,103,xo[-277]or ld(-277,46446,260),1
                                        else
                                            sv,F[1]=xo[-5185]or ld(-5185,106761,49287),F[1]..al(sf(Lr(We,(F[5]-103)+1),Lr(UB,(F[5]-103)%#UB+1)))
                                        end
                                    elseif sv<17630 then
                                        if sv>4122 then
                                            return F[1]
                                        else
                                            if(F[4]>=0 and F[3]>F[2])or((F[4]<0 or F[4]~=F[4])and F[3]<F[2])then
                                                sv=xo[20781]or ld(20781,20,34764)
                                            else
                                                sv=xo[3383]or ld(3383,125360,21318)
                                            end
                                        end
                                    elseif sv>17630 then
                                        F[3]=F[3]+F[4];
                                        F[5]=F[3]
                                        if F[3]~=F[3]then
                                            sv=15216
                                        else
                                            sv=xo[-29119]or ld(-29119,49333,6935)
                                        end
                                    else
                                        F[5]=F[3]
                                        if F[2]~=F[2]then
                                            sv=15216
                                        else
                                            sv=xo[-4741]or ld(-4741,9166,63640)
                                        end
                                    end
                                end
                            end)('z\127','\f')}),47269,St({},{[(function(Vs,Di)
                                local bj,QD,jC,ct;
                                jC={};
                                QD,bj={},function(Uj,OC,iA)
                                    QD[Uj]=E(iA,43845)-E(OC,34265)
                                    return QD[Uj]
                                end;
                                ct=QD[-10304]or bj(-10304,50452,51941)
                                while ct~=10279 do
                                    if ct<25637 then
                                        if ct>=5272 then
                                            if ct>5272 then
                                                jC[1]='';
                                                jC[2],jC[3],ct,jC[4]=(#Vs-1)+36,1,QD[11203]or bj(11203,54461,7884),36
                                            else
                                                jC[4]=jC[4]+jC[3];
                                                jC[5]=jC[4]
                                                if jC[4]~=jC[4]then
                                                    ct=QD[-11721]or bj(-11721,24455,67232)
                                                else
                                                    ct=QD[27041]or bj(27041,41879,100687)
                                                end
                                            end
                                        else
                                            ct,jC[1]=QD[23638]or bj(23638,3321,14077),jC[1]..al(sf(Lr(Vs,(jC[5]-36)+1),Lr(Di,(jC[5]-36)%#Di+1)))
                                        end
                                    elseif ct<54151 then
                                        jC[5]=jC[4]
                                        if jC[2]~=jC[2]then
                                            ct=54151
                                        else
                                            ct=64444
                                        end
                                    elseif ct<=54151 then
                                        return jC[1]
                                    else
                                        if(jC[3]>=0 and jC[4]>jC[2])or((jC[3]<0 or jC[3]~=jC[3])and jC[4]<jC[2])then
                                            ct=54151
                                        else
                                            ct=QD[20252]or bj(20252,34349,42283)
                                        end
                                    end
                                end
                            end)('2P\31\2k\23','m\15r')]=(function(vh,fk)
                                local lo_,YE,Vc,nA;
                                lo_={};
                                nA,Vc={},function(Ds,uk,_B)
                                    nA[uk]=E(Ds,55491)-E(_B,17309)
                                    return nA[uk]
                                end;
                                YE=nA[-31069]or Vc(31761,-31069,8933)
                                repeat
                                    if YE<=37719 then
                                        if YE>20579 then
                                            lo_[1]=lo_[2]
                                            if lo_[3]~=lo_[3]then
                                                YE=65186
                                            else
                                                YE=6003
                                            end
                                        elseif YE>17242 then
                                            lo_[2]=lo_[2]+lo_[4];
                                            lo_[1]=lo_[2]
                                            if lo_[2]~=lo_[2]then
                                                YE=65186
                                            else
                                                YE=nA[-16463]or Vc(26868,-16463,56153)
                                            end
                                        elseif YE<=6003 then
                                            if(lo_[4]>=0 and lo_[2]>lo_[3])or((lo_[4]<0 or lo_[4]~=lo_[4])and lo_[2]<lo_[3])then
                                                YE=nA[-16008]or Vc(121904,-16008,17868)
                                            else
                                                YE=61017
                                            end
                                        else
                                            lo_[5]='';
                                            YE,lo_[4],lo_[3],lo_[2]=37719,1,(#vh-1)+60,60
                                        end
                                    elseif YE>61017 then
                                        return lo_[5]
                                    else
                                        YE,lo_[5]=nA[-28356]or Vc(193,-28356,50178),lo_[5]..al(sf(Lr(vh,(lo_[1]-60)+1),Lr(fk,(lo_[1]-60)%#fk+1)))
                                    end
                                until YE==57147
                            end)('UM','>')}),false
                        else
                            Vp=pC[22984];
                            wq[pC[42338]]=wq[pC[54188]][Vp];
                            wd+=1;
                            eu=hC[-15697]or _C(64162,95620,-15697)
                        end
                    else
                        eu,wq[pC[59342]]=hC[32666]or _C(40239,86835,32666),wq[pC[42338]]
                    end
                elseif eu>=39307 then
                    if eu<42833 then
                        if eu>40695 then
                            if eu>=41473 then
                                if eu<41610 then
                                    dx=dx+op;
                                    Tw=dx
                                    if dx~=dx then
                                        eu=hC[19325]or _C(49401,82919,19325)
                                    else
                                        eu=hC[12226]or _C(30449,48412,12226)
                                    end
                                elseif eu>41610 then
                                    wd-=1;
                                    EB[wd],eu={[26202]=151,[59342]=_m(pC[59342],6),[42338]=_m(pC[42338],187),[54188]=0},hC[24738]or _C(31464,68222,24738)
                                else
                                    pC=EB[wd];
                                    eu,Oh=hC[29707]or _C(61344,56929,29707),pC[26202]
                                end
                            elseif eu<=40726 then
                                eu,Vp,V=hC[23175]or _C(36980,99135,23175),EB[wd],nil
                            else
                                eu,Fw=hC[-22190]or _C(24448,78505,-22190),ka-Vp+1
                            end
                        elseif eu<=39707 then
                            if eu<39398 then
                                if eu>39307 then
                                    Ud[(Oq-236)],eu=Ja[op[42338]+1],hC[-2976]or _C(37265,51632,-2976)
                                else
                                    pC[26202]=201;
                                    wd+=1;
                                    eu=hC[13703]or _C(19622,74680,13703)
                                end
                            elseif eu<=39398 then
                                Vp,V,wE=_m(pC[42338],42),_m(pC[54188],177),_m(pC[59342],20);
                                Fw,AA=V==0 and ka-Vp or V-1,wq[Vp];
                                Ud,us=Mj(AA(oo(wq,Vp+1,Vp+Fw)))
                                if(wE==0)then
                                    eu=hC[154]or _C(14058,64348,154)
                                    continue
                                else
                                    eu=hC[7948]or _C(2618,65735,7948)
                                    continue
                                end
                                eu=52510
                            else
                                mf={[3]=ei,[1]=wq};
                                Nx[ei],eu=mf,hC[17349]or _C(32873,56363,17349)
                            end
                        elseif eu<=40176 then
                            if Oh>88 then
                                eu=hC[19217]or _C(37394,73715,19217)
                                continue
                            else
                                eu=hC[14581]or _C(20419,62263,14581)
                                continue
                            end
                            eu=hC[-17365]or _C(15221,46581,-17365)
                        else
                            AA,Ud=V(wE,Fw);
                            Fw=AA
                            if Fw==nil then
                                eu=hC[9920]or _C(31181,63133,9920)
                            else
                                eu=hC[30852]or _C(52098,120386,30852)
                            end
                        end
                    elseif eu<45936 then
                        if eu<44227 then
                            if eu>42833 then
                                if(km>=0 and Ud>us)or((km<0 or km~=km)and Ud<us)then
                                    eu=hC[23604]or _C(18054,59295,23604)
                                else
                                    eu=58379
                                end
                            else
                                if(dx>=0 and us>km)or((dx<0 or dx~=dx)and us<km)then
                                    eu=hC[30958]or _C(37758,93664,30958)
                                else
                                    eu=hC[10116]or _C(24134,48456,10116)
                                end
                            end
                        elseif eu>=44757 then
                            if eu<=44757 then
                                ei={[2]=wq[op[42338]],[3]=2};
                                ei[1]=ei;
                                Ud[(Oq-236)],eu=ei,hC[328]or _C(63879,53690,328)
                            else
                                AA=AA+us;
                                km=AA
                                if AA~=AA then
                                    eu=hC[13453]or _C(14028,39996,13453)
                                else
                                    eu=hC[-30029]or _C(61100,54868,-30029)
                                end
                            end
                        else
                            V,wE,Fw=br_(V);
                            eu=hC[17025]or _C(46031,45298,17025)
                        end
                    elseif eu<=47269 then
                        if eu>=47245 then
                            if eu<=47245 then
                                V,wE,Fw=Vp[(function(ul,zk)
                                    local dC,zm,ff,Su;
                                    zm={};
                                    ff,dC={},function(cw,Bc,pv)
                                        ff[cw]=E(Bc,46025)-E(pv,10943)
                                        return ff[cw]
                                    end;
                                    Su=ff[-24356]or dC(-24356,80277,56676)
                                    repeat
                                        if Su>=37505 then
                                            if Su<=43251 then
                                                if Su<=37505 then
                                                    zm[1]='';
                                                    Su,zm[2],zm[3],zm[4]=11272,(#ul-1)+67,67,1
                                                else
                                                    if(zm[4]>=0 and zm[3]>zm[2])or((zm[4]<0 or zm[4]~=zm[4])and zm[3]<zm[2])then
                                                        Su=59611
                                                    else
                                                        Su=31408
                                                    end
                                                end
                                            else
                                                return zm[1]
                                            end
                                        elseif Su>11272 then
                                            Su,zm[1]=ff[-19019]or dC(-19019,47161,10933),zm[1]..al(sf(Lr(ul,(zm[5]-67)+1),Lr(zk,(zm[5]-67)%#zk+1)))
                                        elseif Su<=3046 then
                                            zm[3]=zm[3]+zm[4];
                                            zm[5]=zm[3]
                                            if zm[3]~=zm[3]then
                                                Su=ff[-25140]or dC(-25140,81842,35103)
                                            else
                                                Su=ff[14530]or dC(14530,122003,60632)
                                            end
                                        else
                                            zm[5]=zm[3]
                                            if zm[2]~=zm[2]then
                                                Su=59611
                                            else
                                                Su=43251
                                            end
                                        end
                                    until Su==20413
                                end)('us\203^I\208','*,\162')](V);
                                eu=hC[-7126]or _C(15140,14693,-7126)
                            else
                                if not li then
                                    eu=hC[-5129]or _C(56078,99199,-5129)
                                    continue
                                end
                                eu=454
                            end
                        elseif eu>45936 then
                            if(Oh>221)then
                                eu=hC[-4309]or _C(1341,39295,-4309)
                                continue
                            else
                                eu=hC[-2434]or _C(22481,78813,-2434)
                                continue
                            end
                            eu=hC[24426]or _C(57095,102747,24426)
                        else
                            Fw,eu=nil,7889
                        end
                    elseif eu<=47747 then
                        wd+=pC[49763];
                        eu=hC[-31603]or _C(17967,81459,-31603)
                    else
                        us,eu=us..Sw(_m(Sp(AA,(op-106)+1),Sp(Ud,(op-106)%#Ud+1))),hC[-670]or _C(39698,56582,-670)
                    end
                elseif eu>34624 then
                    if eu>36216 then
                        if eu<=37031 then
                            if eu<=36627 then
                                if eu>36218 then
                                    eu,km=hC[-18894]or _C(53081,106157,-18894),km..Sw(_m(Sp(Ud,(Tw-21)+1),Sp(us,(Tw-21)%#us+1)))
                                else
                                    if(Oh>103)then
                                        eu=hC[14542]or _C(6378,11429,14542)
                                        continue
                                    else
                                        eu=hC[-15241]or _C(60334,67390,-15241)
                                        continue
                                    end
                                    eu=hC[-12907]or _C(35319,92011,-12907)
                                end
                            else
                                if Oh>236 then
                                    eu=hC[17503]or _C(27733,29186,17503)
                                    continue
                                else
                                    eu=hC[26412]or _C(32126,67726,26412)
                                    continue
                                end
                                eu=hC[-25043]or _C(15704,45838,-25043)
                            end
                        else
                            if(Oh>151)then
                                eu=hC[19747]or _C(52719,77956,19747)
                                continue
                            else
                                eu=hC[-19544]or _C(4798,25178,-19544)
                                continue
                            end
                            eu=hC[27206]or _C(58345,105849,27206)
                        end
                    elseif eu>=35591 then
                        if eu>=36090 then
                            if eu<=36090 then
                                km=AA
                                if Ud~=Ud then
                                    eu=hC[-13474]or _C(1557,52471,-13474)
                                else
                                    eu=hC[-4763]or _C(8186,8454,-4763)
                                end
                            else
                                if Tw==2 then
                                    eu=hC[4362]or _C(48741,71646,4362)
                                    continue
                                end
                                eu=hC[24546]or _C(48437,37396,24546)
                            end
                        else
                            wq[pC[42338]],eu=Fw,hC[-28051]or _C(60958,99904,-28051)
                        end
                    elseif eu<35174 then
                        if Vp==3 then
                            eu=hC[29392]or _C(6480,18804,29392)
                            continue
                        end
                        eu=hC[24616]or _C(14302,53469,24616)
                    elseif eu>35174 then
                        op=km
                        if dx~=dx then
                            eu=hC[16176]or _C(54082,72689,16176)
                        else
                            eu=53237
                        end
                    else
                        if Oh>210 then
                            eu=hC[-20314]or _C(56316,69564,-20314)
                            continue
                        else
                            eu=hC[-8889]or _C(2128,63561,-8889)
                            continue
                        end
                        eu=hC[3613]or _C(12154,49644,3613)
                    end
                elseif eu>32658 then
                    if eu<34123 then
                        if eu>32797 then
                            wd-=1;
                            eu,EB[wd]=hC[537]or _C(38491,93711,537),{[26202]=253,[59342]=_m(pC[59342],164),[42338]=_m(pC[42338],215),[54188]=0}
                        else
                            if(Oh>175)then
                                eu=hC[-14548]or _C(61330,97095,-14548)
                                continue
                            else
                                eu=hC[9717]or _C(496,80018,9717)
                                continue
                            end
                            eu=hC[32203]or _C(52472,106606,32203)
                        end
                    elseif eu<34549 then
                        Ud[2]=Ud[1][Ud[3]];
                        Ud[1]=Ud;
                        Ud[3]=2;
                        eu,Nx[AA]=hC[3474]or _C(59246,68947,3474),nil
                    elseif eu<=34549 then
                        if pC[54188]==49 then
                            eu=hC[25450]or _C(31585,59193,25450)
                            continue
                        else
                            eu=hC[-22719]or _C(55088,120702,-22719)
                            continue
                        end
                        eu=hC[29479]or _C(1142,63720,29479)
                    else
                        if(Oh>105)then
                            eu=hC[4476]or _C(64168,64766,4476)
                            continue
                        else
                            eu=hC[584]or _C(10056,30943,584)
                            continue
                        end
                        eu=hC[-18673]or _C(51343,108499,-18673)
                    end
                elseif eu>=32011 then
                    if eu>=32105 then
                        if eu>32105 then
                            wd-=1;
                            eu,EB[wd]=hC[-12301]or _C(1989,63845,-12301),{[26202]=88,[59342]=_m(pC[59342],174),[42338]=_m(pC[42338],99),[54188]=0}
                        else
                            V,wE,Fw=Sk
                            if(qv(V)~=(function(df,dD)
                                local yi,hx,Wk,Q;
                                Wk={};
                                hx,yi={},function(h,nn,Ty)
                                    hx[Ty]=E(nn,5824)-E(h,25071)
                                    return hx[Ty]
                                end;
                                Q=hx[-7234]or yi(39557,115802,-7234)
                                while Q~=29174 do
                                    if Q>=27175 then
                                        if Q<38207 then
                                            Wk[1]=Wk[1]+Wk[2];
                                            Wk[3]=Wk[1]
                                            if Wk[1]~=Wk[1]then
                                                Q=hx[18843]or yi(28523,46339,18843)
                                            else
                                                Q=8851
                                            end
                                        elseif Q<=38207 then
                                            return Wk[4]
                                        else
                                            Wk[4]='';
                                            Q,Wk[5],Wk[2],Wk[1]=hx[9904]or yi(37714,68049,9904),(#df-1)+102,1,102
                                        end
                                    elseif Q>8851 then
                                        Wk[3]=Wk[1]
                                        if Wk[5]~=Wk[5]then
                                            Q=38207
                                        else
                                            Q=8851
                                        end
                                    elseif Q>4249 then
                                        if(Wk[2]>=0 and Wk[1]>Wk[5])or((Wk[2]<0 or Wk[2]~=Wk[2])and Wk[1]<Wk[5])then
                                            Q=hx[13695]or yi(31832,42038,13695)
                                        else
                                            Q=hx[24777]or yi(20678,22274,24777)
                                        end
                                    else
                                        Wk[4],Q=Wk[4]..al(sf(Lr(df,(Wk[3]-102)+1),Lr(dD,(Wk[3]-102)%#dD+1))),hx[-2962]or yi(13838,54472,-2962)
                                    end
                                end
                            end)('\224\174e(\242\178d%','\134\219\vK'))then
                                eu=hC[2224]or _C(58152,88335,2224)
                                continue
                            else
                                eu=hC[30029]or _C(17306,34482,30029)
                                continue
                            end
                            eu=hC[-19936]or _C(54469,62027,-19936)
                        end
                    else
                        wd-=1;
                        eu,EB[wd]=hC[24340]or _C(20602,77036,24340),{[26202]=26,[59342]=_m(pC[59342],219),[42338]=_m(pC[42338],107),[54188]=0}
                    end
                elseif eu<31308 then
                    if(Vp==2)then
                        eu=hC[7221]or _C(17129,52697,7221)
                        continue
                    else
                        eu=hC[31074]or _C(16248,33001,31074)
                        continue
                    end
                    eu=hC[5006]or _C(41552,96803,5006)
                elseif eu>31308 then
                    if(wq[pC[59342]])then
                        eu=hC[-4585]or _C(17108,34953,-4585)
                        continue
                    else
                        eu=hC[-27467]or _C(12292,52314,-27467)
                        continue
                    end
                    eu=hC[15724]or _C(29590,68808,15724)
                else
                    if(dx>=0 and us>km)or((dx<0 or dx~=dx)and us<km)then
                        eu=hC[28182]or _C(61732,53462,28182)
                    else
                        eu=58607
                    end
                end
            until eu==54395
        end
        return function(...)
            local wD,ov,yp,Zf,Iu,uC,AE,vC,gt,pD,Xd;
            Iu,ov=function(BF,nt,Cf)
                ov[nt]=E(Cf,44729)-E(BF,41694)
                return ov[nt]
            end,{};
            pD=ov[-13678]or Iu(40448,-13678,8424)
            repeat
                if pD>=26039 then
                    if pD>=43234 then
                        if pD>43234 then
                            AE,gt=Zf[2],nil;
                            wD=AE;
                            gt=aF(wD)==(function(WA,To)
                                local Zk,fF,uq,lc;
                                fF={};
                                uq,Zk={},function(hs,Er,Iq)
                                    uq[Iq]=E(Er,28158)-E(hs,26763)
                                    return uq[Iq]
                                end;
                                lc=uq[8985]or Zk(22146,97229,8985)
                                repeat
                                    if lc>=55338 then
                                        if lc<=61052 then
                                            if lc>55338 then
                                                if(fF[1]>=0 and fF[2]>fF[3])or((fF[1]<0 or fF[1]~=fF[1])and fF[2]<fF[3])then
                                                    lc=46045
                                                else
                                                    lc=uq[-30761]or Zk(24073,63028,-30761)
                                                end
                                            else
                                                fF[4]='';
                                                fF[1],fF[3],lc,fF[2]=1,(#WA-1)+139,36426,139
                                            end
                                        else
                                            fF[2]=fF[2]+fF[1];
                                            fF[5]=fF[2]
                                            if fF[2]~=fF[2]then
                                                lc=uq[11934]or Zk(27439,55935,11934)
                                            else
                                                lc=uq[-31425]or Zk(35108,114133,-31425)
                                            end
                                        end
                                    elseif lc>=36426 then
                                        if lc<=36426 then
                                            fF[5]=fF[2]
                                            if fF[3]~=fF[3]then
                                                lc=uq[-26461]or Zk(33155,127259,-26461)
                                            else
                                                lc=61052
                                            end
                                        else
                                            return fF[4]
                                        end
                                    else
                                        lc,fF[4]=uq[-11678]or Zk(3458,79932,-11678),fF[4]..al(sf(Lr(WA,(fF[5]-139)+1),Lr(To,(fF[5]-139)%#To+1)))
                                    end
                                until lc==6467
                            end)('\241@:\235Z/','\130\52H')
                            if(gt==false)then
                                pD=ov[-27479]or Iu(62423,-27479,14941)
                                continue
                            else
                                pD=ov[-11576]or Iu(42890,-11576,50610)
                                continue
                            end
                            pD=ov[7164]or Iu(31168,7164,126572)
                        else
                            pD=ov[-28847]or Iu(50708,-28847,107765)
                            continue
                        end
                    elseif pD<=26039 then
                        return tk(AE,0)
                    else
                        Zf,Xd=Mj(BB(lr,vC,n_[62337],n_[63352],yp))
                        if(Zf[1])then
                            pD=ov[-20996]or Iu(1804,-20996,29981)
                            continue
                        else
                            pD=ov[6993]or Iu(64792,6993,101883)
                            continue
                        end
                        pD=43234
                    end
                elseif pD<=17371 then
                    if pD>=13778 then
                        if pD<=13778 then
                            return oo(Zf,2,Xd)
                        else
                            AE,pD=aF(AE),ov[2795]or Iu(58680,2795,804)
                        end
                    else
                        Zf,Xd=n_[51376]+1,uC[(function(EF,ue)
                            local FD,Xg,Rz,m;
                            FD={};
                            m,Rz={},function(pn,ME,fd)
                                m[fd]=E(pn,7693)-E(ME,7249)
                                return m[fd]
                            end;
                            Xg=m[26749]or Rz(80407,45471,26749)
                            repeat
                                if Xg>=25497 then
                                    if Xg>30284 then
                                        FD[1]=FD[2]
                                        if FD[3]~=FD[3]then
                                            Xg=m[12351]or Rz(24625,17030,12351)
                                        else
                                            Xg=9518
                                        end
                                    elseif Xg>25497 then
                                        FD[4]='';
                                        FD[3],FD[5],FD[2],Xg=(#EF-1)+74,1,74,33090
                                    else
                                        Xg,FD[4]=m[24049]or Rz(50497,49045,24049),FD[4]..al(sf(Lr(EF,(FD[1]-74)+1),Lr(ue,(FD[1]-74)%#ue+1)))
                                    end
                                elseif Xg<9518 then
                                    return FD[4]
                                elseif Xg>9518 then
                                    FD[2]=FD[2]+FD[5];
                                    FD[1]=FD[2]
                                    if FD[2]~=FD[2]then
                                        Xg=m[31208]or Rz(11943,3348,31208)
                                    else
                                        Xg=9518
                                    end
                                else
                                    if(FD[5]>=0 and FD[2]>FD[3])or((FD[5]<0 or FD[5]~=FD[5])and FD[2]<FD[3])then
                                        Xg=m[-30309]or Rz(54277,46834,-30309)
                                    else
                                        Xg=m[21569]or Rz(42286,19419,21569)
                                    end
                                end
                            until Xg==1376
                        end)('B',',')]-n_[51376];
                        yp[52959]=Xd;
                        qi(uC,Zf,Zf+Xd-1,1,yp[59031]);
                        pD=ov[-8962]or Iu(56688,-8962,21474)
                    end
                else
                    uC,vC,yp=Uw(...),rv(n_[33483]),{[52959]=0,[59031]={}};
                    qi(uC,1,n_[51376],0,vC)
                    if n_[51376]<uC[(function(Vt,cd)
                        local aG,Bh,qt,jt;
                        Bh={};
                        aG,qt=function(Ld,or_,qh)
                            qt[Ld]=E(or_,15833)-E(qh,96)
                            return qt[Ld]
                        end,{};
                        jt=qt[-29707]or aG(-29707,49320,49590)
                        repeat
                            if jt>45116 then
                                if jt>47269 then
                                    return Bh[1]
                                else
                                    if(Bh[2]>=0 and Bh[3]>Bh[4])or((Bh[2]<0 or Bh[2]~=Bh[2])and Bh[3]<Bh[4])then
                                        jt=qt[143]or aG(143,122990,63699)
                                    else
                                        jt=45116
                                    end
                                end
                            elseif jt<30115 then
                                if jt>15259 then
                                    Bh[3]=Bh[3]+Bh[2];
                                    Bh[5]=Bh[3]
                                    if Bh[3]~=Bh[3]then
                                        jt=58628
                                    else
                                        jt=47269
                                    end
                                else
                                    Bh[1]='';
                                    Bh[4],jt,Bh[2],Bh[3]=(#Vt-1)+36,30115,1,36
                                end
                            elseif jt>30115 then
                                Bh[1],jt=Bh[1]..al(sf(Lr(Vt,(Bh[5]-36)+1),Lr(cd,(Bh[5]-36)%#cd+1))),qt[-25739]or aG(-25739,47701,12534)
                            else
                                Bh[5]=Bh[3]
                                if Bh[4]~=Bh[4]then
                                    jt=58628
                                else
                                    jt=qt[-14645]or aG(-14645,104185,61979)
                                end
                            end
                        until jt==33826
                    end)('\163','\205')]then
                        pD=ov[16324]or Iu(38002,16324,52200)
                        continue
                    end
                    pD=32173
                end
            until pD==42370
        end
    end
    return ux(xf,Th)
end)
local U
local sl,TE,cz,Na;
Na={};
cz,sl=function(xh,mB,Fe)
    sl[Fe]=E(xh,24424)-E(mB,47685)
    return sl[Fe]
end,{};
TE=sl[-4811]or cz(90994,9950,-4811)
while TE~=0.55320844958150661*10036 do
    if TE>-130041191/-5669 then
        if TE>759445624/19516 then
            Na[1],TE=0,sl[-12021]or cz(119,49089,-12021)
        else
            TE,Na[1]=sl[5636]or cz(9116,37083,5636),{[Na[1]]=Na[2]}
        end
    elseif TE<50502+-27627 then
        U,lv,TE=Na[1],function()
            local hB,cF,bh,RC;
            cF={};
            RC,hB={},function(i_,rn,jp)
                RC[rn]=E(jp,52257)-E(i_,23824)
                return RC[rn]
            end;
            bh=RC[4783]or hB(48219,4783,9610)
            while bh~=88491-30999 do
                if bh<-802+25638 then
                    if bh<200778191/15061 then
                        if bh<499+3917 then
                            if bh<=0.066189182514201042*32392 then
                                cF[1],bh=0,269524200/18524
                            else
                                bh,cF[2]=1.7784461152882205*13965,28081
                            end
                        elseif bh<=29803-25387 then
                            bh,cF[2]=RC[-3069]or hB(3800,-3069,28412),U[cF[2]]
                        else
                            bh,cF[3]=RC[-32639]or hB(3823,-32639,44611),28084
                        end
                    elseif bh>27523362/1843 then
                        cF[1],bh={[cF[1]]=U,[cF[3]]=cF[2]},RC[-14721]or hB(13560,-14721,117995)
                    elseif bh>=-2010- -16560 then
                        if bh>14338+212 then
                            cF[3],bh=-20033,RC[-25034]or hB(22429,-25034,8172)
                        else
                            bh,cF[1]=RC[-18316]or hB(32216,-18316,11862),U[cF[1]]
                        end
                    else
                        cF[3],bh=cF[3]/cF[2],46066+12926
                    end
                elseif bh>=32211+12533 then
                    if bh>=-99.459459459459453*-518 then
                        if bh<31009+27983 then
                            cF[1],bh=cF[1]+cF[3],1879+9299
                        elseif bh<=40141- -18851 then
                            cF[1],bh=cF[1]+cF[3],RC[-7944]or hB(61764,-7944,92318)
                        else
                            U[0],bh=cF[1],RC[-29020]or hB(50728,-29020,101495)
                        end
                    elseif bh>41438+3306 then
                        bh,cF[3]=RC[-28285]or hB(22660,-28285,30845),15947
                    else
                        cF[2],bh=15947,RC[-24487]or hB(57205,-24487,31321)
                    end
                elseif bh<=46346-7720 then
                    if bh>62420+-31105 then
                        return cF[1]
                    elseif bh<=-2.2224608501118568*-11175 then
                        cF[3],bh=cF[3]-cF[2],RC[-2585]or hB(11474,-2585,8244)
                    else
                        bh,cF[2]=RC[17660]or hB(17147,17660,64778),0
                    end
                else
                    cF[1],bh=20034,RC[-8470]or hB(41818,-8470,128129)
                end
            end
        end,sl[-16800]or cz(82214,32438,-16800)
    elseif TE>-195901500/-8564 then
        Na[2],TE=0,-1184503246/-30439
    else
        TE,_g=sl[32475]or cz(48980,28873,32475),Cc
        continue
    end
end
local Jx,jw,yy,Bx;
yy={};
jw,Jx={},function(B,Ch,Vg)
    jw[B]=E(Vg,35755)-E(Ch,20137)
    return jw[B]
end;
Bx=jw[19670]or Jx(19670,17489,25090)
while Bx~=-24399+27201 do
    if Bx>819363207/17069 then
        Bx,yy[1]=jw[19287]or Jx(19287,36611,26340),rs((function()
            local Zq,ir,be,ti;
            be={};
            ti,Zq={},function(ho,fz,gp)
                ti[ho]=E(gp,54947)-E(fz,22268)
                return ti[ho]
            end;
            ir=ti[1972]or Zq(1972,5248,20406)
            repeat
                if ir>=6102- -16067 then
                    if ir>-8675+30844 then
                        ir,be[1]=ti[3266]or Zq(3266,37683,115682),rs((function(Ou)
                            local function de(rh)
                                return Ou[rh+-174702660/13380]
                            end
                            local FC={[de(-8969- -13225)]=de(140100870/-7665),[de(5014+-8919)]=_g};
                            FC[de(25644+-13197)]=FC
                            local Sa={[de(-277872090/-27355)]=Ea,[de(0.18817480719794344*9725)]=de(-1.6439031004248394*-22126)};
                            Sa[de(-4.9966377632277474*-5651)]=Sa
                            local Gg={[de(-32742- -28992)]=io,[de(-10287- -21343)]=de(-8- -14609)};
                            Gg[de(-31953- -19337)]=Gg
                            local aB={[de(124839720/-10818)]=vx,[de(0.45277507302823761*13351)]=de(-0.11439888164026095*-8584)};
                            aB[de(-345925580/-20548)]=aB
                            return _g(lt(de(27355)),{[de(11692+23394)]=aB,[de(51008+-21451)]=Gg,[de(1799- -2508)]=FC,[de(1.6536452665941241*18380)]=Sa})
                        end)(be[1]))
                    else
                        ir,be[1]=61367+1279,{[5629+-1851]=-29722+29723,[20568+-22569]=1302+-1299,[6770+-7380]=0.00026178010471204191*3820,[7628- -8872]=0.00021479200973723776*13967,[-23690+14940]=-7.1270757608153377e-05*-14031,[-17.905714285714286*1750]=-15647- -15649,[17369- -5947]=-19473+19475,[-28423+29967]=13637-13635,[1.0237378210806023*16935]=-63074/-31537,[42968-27789]=-26234+26235,[-2.3900401432136271*-9217]=0.00013257764078088231*30171,[3233+-15308]=57840/28920,[0.39490876323496282*-17756]=-4068+4071,[11252- -3046]=(function(Cr,mx)
                            local kj,Pf,zE,Lh;
                            zE={};
                            Lh,kj=function(Mw,Gd,Dh)
                                kj[Gd]=E(Mw,8612)-E(Dh,50477)
                                return kj[Gd]
                            end,{};
                            Pf=kj[-1529]or Lh(31376,-1529,58810)
                            while Pf~=41087 do
                                if Pf>15005 then
                                    if Pf>17785 then
                                        return zE[1]
                                    else
                                        Pf,zE[1]=kj[-21445]or Lh(41960,-21445,34941),zE[1]..al(sf(Lr(Cr,(zE[2]-107)+1),Lr(mx,(zE[2]-107)%#mx+1)))
                                    end
                                elseif Pf<=13564 then
                                    if Pf>12364 then
                                        zE[3]=zE[3]+zE[4];
                                        zE[2]=zE[3]
                                        if zE[3]~=zE[3]then
                                            Pf=kj[464]or Lh(129462,464,13453)
                                        else
                                            Pf=kj[8323]or Lh(49331,8323,4578)
                                        end
                                    elseif Pf>3144 then
                                        zE[2]=zE[3]
                                        if zE[5]~=zE[5]then
                                            Pf=58994
                                        else
                                            Pf=kj[31977]or Lh(13737,31977,49896)
                                        end
                                    else
                                        if(zE[4]>=0 and zE[3]>zE[5])or((zE[4]<0 or zE[4]~=zE[4])and zE[3]<zE[5])then
                                            Pf=kj[636]or Lh(95894,636,46573)
                                        else
                                            Pf=17785
                                        end
                                    end
                                else
                                    zE[1]='';
                                    zE[5],Pf,zE[3],zE[4]=(#Cr-1)+107,kj[-29196]or Lh(46759,-29196,41882),107,1
                                end
                            end
                        end)(lt'2RqszXYrC1MCoR0ZUwzka2wssa5dKL+QaCLvWKD0A8ZjM9lmXmRRI98qr2M85RugWL2WumnumtbA/YUYBtA3dBpjXAUfeo1h+QR1kzl+ntK3I1stMk0RdZwW9wWnHvAaGjltUG7fyMtbJ/lZjohZunEwfSnBo5+djsAWqgLd+UJj03VoAfQ5vjCanDlTE8Il/5eIf3zBJVLK7vVkAaCEOyQihidO4gxqXfdKsrtBOyLwKrfybh13fVLdVRP2l/yLSsLbnaJqZBhw4wGA1k4jiwyiMyQi8cEJ7emVufpBeULR/bv8oFAMXXy3rkujbY6lAf+fOM+DyXN0Fte9KNpqRSAbCkjNW/TuU1wROmntx2/S9q4e2KrX7iEjPLa6TxWjF0p9yyDd+W7xLT3nUc5Xg6PBNoi3wCDVodwgEUmxxkCKanRf+XPtLX6WloZNocy6Nyov+aVdjr67YMTaKie6uRb/ZySszXeayY2z6l1AptNarcjIzzmhE9ACkLPYTQwrr9Bj662ie8Wj1l9I26efgJOCWY9jfL9BTJ4+d8PA8fu82m+/2fejMER40EM0ldsDoibY65SNX+REAhQDlUZDk0twvXn8XgMnbkWH7pAZgEM74JtWM9bfScSDxuPh5HHp4IAjbFF0Myl2ZKtyA755rbz6IUmnpRRG9rLDvHZT9tBJ2DpNyQaaKGUiIn9/+DT1BSwAnhvIO93mb259vyu6UpA+INpj+1++ZRfnWgxTZrLWuQ5ihUjk0Fvapb5h7TuMY9kb8O+ISKNB6yEOjSAxIKHJVezXfIW+No1zQUGpTIqdHf2MuG7+/znEB2X7H/2TT9pDs3etyoq+TdEoXgPqYx3S5SDdVCT/UMc7jZAWBztJUjmgkiFB07bFLrrxDD2YtmPZ13kyEWlafQql5aCseEVNzWyb0bOxOjXSZe/x8WzML5rsQAbfhHIFexH14SJnfKx4kgdoWoeE2xgBgt3gOiKvjrPB954lPqCmHmUyNTwDlpRQxvlCiBhI0PKCIAb3YHaQD8qho23nW461yCUQGMMJCq92/VH9Oe+X+Ez4n3qkpy79zOHvz7PlFQO/9YUKbgHX1pD2YTIRx4iKSL5fsSrJDcNvVNndDt4DyWUlYIcAe7Tsk5BiFzTdbU1Ky9eX20L2mVG9PSet3IFXKyqg0s9FffhlK3+Y/tgsy9ubmemNiGwmKKxhVAbYinE9wfq/2YO+Yq2OgY2spKaIRyiNOpyXbiytI/Wc/gQ5oZdUlKIJ7aK+Bde+Z94b5AzSMpK+TMKJAgGzwn9MTWnOYmWOuA/OtY2d/5t5QHfYOrNz0/tWJKZD0LiY95naSVj7NBfTsQH02wGvx/ADuOBBJ2xCHkqK9mTmcomnxKLTT+3IMQrHMFPSqWdMchi2F7hmMHoj9QIf4cTcjyPJf2P9/VGssIl4piJ+UjLaJ5DjCunb3bvH4wo+u8OgIolJdSfK+VPKhFY+DEDmaqj/Mc/SmDjeMKpgdvAOMLfH9+5qgE6Cnkq/yTegz0gfDmy4Q8IXW8CR6EzoSXrVW6vvZX1RIYh3G6lv6vUKJ/EwHZw7yIewZGifyAKuBkryNxFlXL9lQQiag5Q6H9s8LalkpIjLK0l8Lk5b1K3tnNOG4goPkH2X+PHnvgPi8tqqBES6GhvJn8kMJBWx/j7C8Qxw5H7n6TqsIcKxXLVJYnx7cXbSZ+JNoNUne9IPEf10FwvKxfYq7Kc/7jE47VUuBGRfN/uvUAxnfLitOnHmoQvs9ZIm9mTyEOpe2shV1Y0AQfRTHyD8jkgggh+c2pNdrmykITPT98hcm6BWAtPrNtGj8YZSqOjscko2UQo9pb5E5q7yqxeV3O7h4iSPdtfHqR30JLRBqbljws+Eh/M/CmFepWmAIV0Y9TxYr4KaV6tpA0AJ5KQMVXWWLJYxIeN6Db3mVkOZNeBIw8cJhHqr/Wdt+Bfv/BArWeIKJgiIuYhRZuKWylzsNa8xWD2Jp2XSdoYjRybj37ZylRrMI7IfUXfizPq1Yy7NqYVj55S6lHSxFwPNk+yhkVhcMdoJHF1ivjNk8dXeUZGB5UXzvZH0spG5T26VKWyuRsRNek9EFi5w7NMBQzegKslV16kBsYqiU0BxrGkKH3/jJqeVbDdMMgeiOTFOC/lOEyzohC8ZtvdMGpJTjI4qwF8s4mN/fFEG3RLXPC7+PbVgooKKWfOU4srFgQMalV01U2V1Nyld01j3Mkn3Yza7uZQNQwU7cxBqtCD0ONgk62wTAXYyWcrp20YChgmt+iX2VEZMAbfw+Jys1DiZKfjqdj7xeWhL4TSUGbf2E1kxui3qurh3WcYAC+Tw/Ro844A3IDe4bU/pNXtD/juj400VPPVUuPFnDW5aKqJFCvLh+o5ji4ieoXlmVlLXd7rSQW69MLkiSFHTz3Pc1IqkuBpyR9PdqrC1TQIASZibf/R71rNYwrkym7XFAz8G14clmAcYLzIJHsJ9+o9fRDEZQq38BcjomRLexZXdS1Q+kM5FcaAlRiePJeGgIe82Zcks3kqNrPc5jLOpJea5xnoCcZiAULRNYFTcaJFcLtqxv22+ua0BVkvshFjR34hew5MuY6+ncL4ca8vLfp/A+L7lWiWv/mCRhdPpALhM2QOctMFOChjuj1Wmqq95mLTAcnPbhtL15/Fgq2d+sG1yjxlZpunLueH4b4jn3uU0ZXiTQHOWxhqGZuWW0fVQvXNXUi2uQ3LSC3CACY8jHRttZaTKsV2+USmenW9rp89c5rXK9LP5Rf7X82lXclZICn8YqSMJoiaOkIkraMPZIhXSqsiICAnsiVzyIE7YPskdThdAal3/TMQqcB+7OM4y29k4TUG7eLQqjgUxzDbhO6RIFdwsJnIQodK6PW6CcPWnZoeou2/rfc5c9WLJv4J/olzxAnLxDAUgrstD2u10su85pWhmCepiku4lyY6Ab9zzfdILUsB9ntN06xq6YKrshacNuFtaDopwYeD5a90yZ9N4wWCLxDIUfXE8baeuCn3c28QRnMVSVYXKJuriGCEICUsDBOvcle9bQ1vLb+7EiK82MPM3/fn9SIISq/RWQsq3ERgRUNiDM00Xj1KSF2VUjarCA1fC5N4KOvLonsjXtAIkgIk+AhskAm2ChVi9zFSLG3e92+JcFuBJVfA2h7K1cd9LvrywEjQdvRcDvWTxert75OihVITRHLmLOfzIjcDSxd8fZ8X+oXdGc+XbjJV4ByDAnLtZ7kO6Lb535nJVzfdq3QfmVn07n2YSl8/0yR0OPu9uKXDCzeWYGNbqCsYff6KlkSIcNb6L6jlM5zIHdIPjzxiOx7iE64nVclcXs3xkeP+KT2iY+bLdltdpvLea3+Ci4bxJUoAJ6LxyJdQv/oLNLw6ZzwvE/Tn2jotcwMhR0zCfecYjmadJ7Jg4P7PLMENEW9hIVr+DSsyAirLbiAYCdaI6pm2X/F5R4knnvazfu9xxPa4fAdfXcNaJFbP16QLG4SAxZmspMoGMabdkhJj1is5QyOBhQoV/UIunfkIXG8ZmukZofDOvGAPm4fPjaZ88QcvWVqmT7WiFXiAIAfRBjr0ixeHsmpXxKSvh7JAI9ndaJdPGPPnKVgwVQOdSq70/0uudBusfu2JLjjNr7+DCoTCkBuzOdKHyC5aJZB5Pe8wjtxZH8pb9eNN7RMtG3JpnU1FJtEwOuHDetE54ng8UuDLEuuQRRYr0W9wDEeo3FmJysmlhQIqGqiES2EQjplm05eoRbSRIDkXY7vHY0ZqxCwycdZjA16C8P8HRi4o6YYw0dc2V9XJKL/HSJ4r2DG/lKbLUF78+56J8vGxyLmpdYeVDx2DS/RVl4R8E2nkNSuLo+RGtpRTkJCibbC0XdXcL1ZprFHcao4xUSsHkJej/nx3Kf88IwD+W8Dehhyo++WouK/2VWA6pIODD7H7MGsEcLeXk92yV2gV149M//77E0X+1ve1ldzlfJguJ7UHooIzqJOPc3/udDppC0s2EJPU9tEHYsGzz+dmm3TtdaF+QC/FaRCbIPgmggoRXhE49Z3zWvjlXfJANny4d21sx3ORfabVO71TH5HSwWcGIeyD+LsHxGQJu1kgMWpb43ExX8bDXHdlzngRMIOuIfOJ0iw1ua/n0rGjWEcUB43tlcc2szZFjau6AiTjowevIM9AqDOWGnZyFWU8h1RcBQkylFkbC/PB/uqGePvyAsYbPv6t/SZEiQYp2+FVXMwF/XXG72jtED74u4kKrlSLsnaY9c1WeXQd2dw==',lt'l17h/hsEegpx20xwGEStGyVF3dQWTPDCL1WiFsu2cIIreogRLSgkcJh74QhXjWjkEPTHwhq906ajlO5xTb52BCpWBWdeDb8zvmMlx1UG7ZbzeQJ3czRYAf9FmX/ocJorUnA0Yx2nsYwVa7A65swWwwQFNHCAkczOybdbyWqZujpbqUBdOK5V9VPbrFo7eY1cmf3cMiyIQ2SnorhUT9HuQUluyxcbiFgsNboPx5QYeWmCZYCeCWtYCGORF3uA2MvoIO255NMjFG80rzDu5RgI5VvbZ2MJq6dGmoXm0sIsMC2bmNjJ4iR0MCvZwiqWGqHcMIv7dfjzgTQHRZvySvUwLUN9P2erEJvXNS95VhCavkChr9tYjO7liWBnbvP3LUTlcH8RoGOIyRi9XQqfHZ0j1OmxeuuYkVOTzpZJYDv3sRrzGA5tihqja0+54+c6zvz8bRl/qP0PoezxJ4DiY1HNwyGHLxPkqjuqr6Lk0jcWx4QZwv+rglf7erQz8tiIeE9v2eAXicfuPrPOgzop79W0xtKpDd8lLdEDBdx0LfKwvYHKnz35tISVVisL4QJYpp9r0hSI0+S6KtcwYTtv4hYFuDNG1Uq7alFKHwv0gsMt0wsCq8kOHJ+2CorE86fWsh+vkcEIARgTfEgYLcEQQOhLx+bIbwLs7Wwil/Cw6U5mlbsxoG0gu1T5cA9NGh0TzB+AQRx68lehYe+wDTQRyUDtHL9GcIhXrxDUIW+SakEgX+v5/GQaxjy34yvu0dENvVK+NY8smd6xGdYKnU9BxFhVd8+RbJWjM8Pdc+dHEnOcCf+tcbDC9QmdnUq3RCiWLMTrF4ps/Sfrh8nzeeFjPUG/BFCEtBKOYFGWHqpXvKlkdUo/BV/q+UQOse6gaOynNQ3u+xGTukEZSSYOMUzctsfbFiEeui7alvGEcVqBUKSUvia6WdieGTC74ll9VCmy11EeOMo2wlQwEP/LtHNvsqutWGOdpcuRktJ3fNrjTlZhdHY0+MAU9a4yw3wh6YLba1KWIznAbrLH2SK2L+jZhmt5SuhgQPsvxBvOTLW4mTm1pyzMzGuEvdm1m/2cWlPqxvY5NEakocjBM1RhqunTGN0t13mIRaoWFouQJZBCoBBNVdc1KuKHpaEue1+eIhg5rJrVqXK1snqNSxX1lfkWaFLIuroWC5cBbRbhp5lPuJLQ1Nvo5DR8QNUUIUis3TdHq6r2kuLnMeX+27XL75f6P325Q6z6BHybapv4iUBp6ac68dJ9pMraMLCNC7J2z0+nYtbsG5rfdXb2kQV6FTOcOh3X8HibzP/VtetANjOJeMUjpI07HIkHoPDhluGtMw2ZZji250Cl4lTYgJFF8LYQdAoKW3PJzgXfBevdluanFZqRBHr2Gz3mzDV1OH7wIP8SGzNnm3RQloe9u0bxEyyzkmDgxbwxzRoSOHS4DNvRQ6iWjt2ihmVaj6HjUMM9H1+EjQSaqxB2eXmuP/qPaJqk8U2nSN4wOr9EAoCptJQCw2XbqxiKnXrxvCxsNj/+FfpcNJT6sTuaEQixEJLdDDEXceYCeO4+q8R+FMdmdd1BjNfcJjLcjSmWZyGhcloNBNkIMHjdyc5tJ6FvVeMs0t2mWR1PeT5wndym6J73hUNj5hDQs56W8Uujq7LpYBPpW0z/77tAEnnIh0S4pm861RGDgHDlUZbyJOUOBAUCBxWjIogJl7pdH4BYVpMsYWGNv4FFmPByl3x5rzRLXjITYZPZOHsmStPrAgWzjkmKkepwmByoUo9q44Bik99IDpcefmmO4TxLw3qvtcMOnVX1al2rgqIE9uk8MZa4eZT0qeQW/tqKKxgOaEtHxN0zgvTFxWDMvaWtzWLrMZaC6FDCV/Ip4co5iZft7Jh+P1Fsw1G2EjJLsXk/zcbrBN0+aQlOhuZ7FB/RdOVedZEdZ+iNZzvTeYIO6Ig5xxeSuREUuVyZmlZAG6V5RzvHjbsjLbrdpmSUAcdUIXXc5DWDP+J3I1+6h9Qn/VStSdU0Fza1nKPULh6L7O5XsqaC/Af7RlWh5cf4xBwpRZNBSg4J6HkyhJOfOPLCqAaa7uez5OjdHR7hES3bF44hEgo1Lm8ZlKtiN3XsbKZ65NxU1NLkFgM85BNGS0o='),[0.31161990755670216*-9303]=17952/8976,[-16677+-7920]=-23926+23928,[478852796/-18652]=-12186/-12186,[9824+-18625]=-400- -403,[-500056722/29481]=0.00010151768945738795*19701,[3.9255244755244756*-2860]=17204+-17201,[-42975+26168]=26253-26251}
                    end
                else
                    return fv(be[1][1],1,be[1][2])
                end
            until ir==47944-7981
        end)())
    elseif Bx<=-7478- -18651 then
        if Bx>-10849+21140 then
            yy[2],Bx=rs(...),-320008936/-31096
        else
            Bx,yy[1]=jw[26994]or Jx(26994,45825,78464),rs(fv(yy[1][1],1,yy[1][2])(fv(yy[2][1],1,yy[2][2])))
        end
    else
        return fv(yy[1][1],1,yy[1][2])
    end
end
