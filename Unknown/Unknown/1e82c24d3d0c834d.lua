--[[
                                                                                                                    
                                                                                                bbbbbbbb            
MMMMMMMM               MMMMMMMMBBBBBBBBBBBBBBBBB        HHHHHHHHH     HHHHHHHHH                 b::::::b            
M:::::::M             M:::::::MB::::::::::::::::B       H:::::::H     H:::::::H                 b::::::b            
M::::::::M           M::::::::MB::::::BBBBBB:::::B      H:::::::H     H:::::::H                 b::::::b            
M:::::::::M         M:::::::::MBB:::::B     B:::::B     HH::::::H     H::::::HH                  b:::::b            
M::::::::::M       M::::::::::M  B::::B     B:::::B       H:::::H     H:::::H  uuuuuu    uuuuuu  b:::::bbbbbbbbb    
M:::::::::::M     M:::::::::::M  B::::B     B:::::B       H:::::H     H:::::H  u::::u    u::::u  b::::::::::::::bb  
M:::::::M::::M   M::::M:::::::M  B::::BBBBBB:::::B        H::::::HHHHH::::::H  u::::u    u::::u  b::::::::::::::::b 
M::::::M M::::M M::::M M::::::M  B:::::::::::::BB         H:::::::::::::::::H  u::::u    u::::u  b:::::bbbbb:::::::b
M::::::M  M::::M::::M  M::::::M  B::::BBBBBB:::::B        H:::::::::::::::::H  u::::u    u::::u  b:::::b    b::::::b
M::::::M   M:::::::M   M::::::M  B::::B     B:::::B       H::::::HHHHH::::::H  u::::u    u::::u  b:::::b     b:::::b
M::::::M    M:::::M    M::::::M  B::::B     B:::::B       H:::::H     H:::::H  u::::u    u::::u  b:::::b     b:::::b
M::::::M     MMMMM     M::::::M  B::::B     B:::::B       H:::::H     H:::::H  u:::::uuuu:::::u  b:::::b     b:::::b
M::::::M               M::::::MBB:::::BBBBBB::::::B     HH::::::H     H::::::HHu:::::::::::::::uub:::::bbbbbb::::::b
M::::::M               M::::::MB:::::::::::::::::B      H:::::::H     H:::::::H u:::::::::::::::ub::::::::::::::::b 
M::::::M               M::::::MB::::::::::::::::B       H:::::::H     H:::::::H  uu::::::::uu:::ub:::::::::::::::b  
MMMMMMMM               MMMMMMMMBBBBBBBBBBBBBBBBB        HHHHHHHHH     HHHHHHHHH    uuuuuuuu  uuuubbbbbbbbbbbbbbbb   
                                                                                                                    
                                                                                                                    
                                                                                                           
					Join our Discord for more scripts! https://discord.gg/KFvcKdCnnj
                                                    

]]--

local fb,Ha,Vb,A,N,Ab=getmetatable,type,pairs,bit32.bxor
local da,Ea,lb,Va,sb,U,vc,n_,Gb,S,ub,uc,Ac,ya,m,rb,kb,e_,q,Fa,_a,bb,Ta,Kb,gb,Ib,Y,i_,Da,Ec;
lb=(select);
ub=(function(...)
    return{[1]={...},[2]=lb('#',...)}
end);
i_=((function()
    local function ja(Fb,nc,db)
        if nc>db then
            return
        end
        return Fb[nc],ja(Fb,nc+1,db)
    end
    return ja
end)());
ya,Ea=(string.gsub),(string.char);
U=(function(fc)
    fc=ya(fc,'[^ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=]','')
    return(fc:gsub('.',function(Qb)
        if(Qb=='=')then
            return''
        end
        local oc,pb='',(('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'):find(Qb)-1)
        for H=6,1,-1 do
            oc=oc..(pb%2^H-pb%2^(H-1)>0 and'1'or'0')
        end
        return oc
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?',function(Ja)
        if(#Ja~=8)then
            return''
        end
        local Hb=0
        for p=1,8 do
            Hb=Hb+(Ja:sub(p,p)=='1'and 2^(8-p)or 0)
        end
        return Ea(Hb)
    end))
end);
bb,Y,uc,da,_a,e_,Kb,kb=string.unpack,string.sub,string.byte,bit32 .lshift,bit32 .rshift,bit32 .band,table.concat,{};
q=(function(f_)
    local Ia=kb[f_]
    if Ia then
        return Ia
    end
    local D,z,Ga,ec,Pb=da(1,11),da(1,5),1,{},''
    while Ga<=#f_ do
        local K=uc(f_,Ga);
        Ga=Ga+1
        for d_=1,8 do
            local va=nil
            if e_(K,1)~=0 then
                if Ga<=#f_ then
                    va=Y(f_,Ga,Ga);
                    Ga=Ga+1
                end
            else
                if Ga+1<=#f_ then
                    local sa=bb('>I2',f_,Ga);
                    Ga=Ga+2
                    local Lb,za=#Pb-_a(sa,5),e_(sa,(z-1))+3;
                    va=Y(Pb,Lb,Lb+za-1)
                end
            end
            K=_a(K,1)
            if va then
                ec[#ec+1]=va;
                Pb=Y(Pb..va,-D)
            end
        end
    end
    local cb=Kb(ec);
    kb[f_]=cb
    return cb
end)
local l_,Xb,jb,wc,Ra,jc,Mb,ma,Bb,Gc,u_,L,ba,g,w_,qb,Ya,ea,Ua,ua,G,X,aa,_c,C,wa,c,cc,xc,Pa=type,pcall,error,tonumber,assert,select,setmetatable,string.format,string.unpack,string.sub,string.byte,string.char,table.move,table.pack,table.create,table.insert,table.concat,coroutine.create,coroutine.yield,coroutine.resume,coroutine.close,getfenv,bit32 .bor,bit32 .bxor,bit32 .band,bit32 .btest,bit32 .rshift,bit32 .lshift,bit32 .extract,{[15818]={{8,7,false},{3,6,false},{3,6,false},{2,3,true},{6,4,true},{1,9,true},{4,9,false},{2,5,true},{6,7,false},{1,9,true},{8,1,false},{1,2,false},{1,9,false},{8,10,false},{1,9,false},{4,6,false},{1,9,false},{1,3,true},{8,1,true},{4,9,false},{2,9,true},{4,3,true},{1,3,true},{2,6,true},{1,9,false},{4,9,true},{2,3,true},{4,7,false},{1,0,false},{3,5,true},{1,9,false},{3,9,true},{1,1,true},{6,2,true},{8,9,false},{2,6,true},{8,2,false},{6,4,false},{8,2,true},{4,2,true},{2,3,true},{8,3,false},{2,6,true},{3,9,true},{8,2,false},{4,8,true},{6,9,true},{4,9,true},{1,4,true},{1,4,false},{1,9,false},{6,1,true},{4,8,false},{1,9,false},{2,3,true},{6,3,true},{6,3,true},{1,2,true},{1,9,false},{1,0,false},{4,7,true},{1,2,false},{4,8,true},{8,5,true},{1,9,false},{3,6,true},{4,9,false},{1,4,true},{3,1,false},{3,3,false},{3,2,false},{6,7,false},{8,1,true},{3,3,false},{1,9,false},{2,2,false},{4,9,false},{4,1,false},{3,3,false},{4,1,true},{8,3,false},{6,8,true},{1,9,false},{1,9,true},{1,8,true},{1,9,false},{1,9,true},{1,9,false},{2,4,false},{4,9,false},{3,9,false},{1,7,false},{2,7,false},{1,9,false},{8,7,false},{1,7,false},{2,5,true},{4,7,true},{4,6,true},{4,9,false},{8,6,false},{6,3,false},{1,4,true},{4,9,true},{1,9,false},{1,5,false},{4,6,false},{1,9,false},{8,7,false},{1,9,false},{3,8,false},{2,1,false},{4,9,false},{6,4,false},{8,7,true},{1,9,true},{4,9,false},{4,5,true},{3,6,false},{6,6,true},{4,9,false},{1,9,false},{8,7,false},{1,2,false},{1,9,false},{1,9,false},{4,8,false},{3,3,false},{4,9,false},{3,9,false},{1,8,false},{8,8,false},{8,7,true},{1,9,false},{6,3,false},{8,6,true},{4,7,false},{1,9,false},{3,9,false},{3,4,false},{2,7,true},{1,9,false},{1,0,false},{8,9,true},{2,5,true},{6,7,true},{1,9,false},{8,2,false},{4,3,false},{6,2,false},{1,4,true},{3,9,true},{1,7,false},{1,4,true},{3,5,false},{1,0,false},{8,1,true},{8,4,false},{2,4,false},{1,9,false},{8,3,true},{1,9,false},{1,1,false},{6,4,true},{4,3,true},{1,7,false},{3,1,true},{8,4,true},{4,9,false},{1,2,false},{8,1,false},{1,1,false},{1,9,false},{2,4,false},{6,2,false},{6,7,false},{3,6,true},{4,1,true},{6,5,true},{6,7,true},{4,9,true},{2,6,false},{1,7,true},{1,4,true},{1,9,false},{4,9,true},{3,9,false},{4,9,false},{1,0,false},{8,9,false},{3,6,false},{1,7,false},{3,8,false},{1,6,true},{4,9,false},{3,7,true},{6,5,false},{1,4,true},{4,4,true},{8,3,false},{1,5,false},{2,3,true},{3,2,false},{3,9,false},{6,5,true},{6,8,true},{6,7,true},{2,7,true},{6,6,true},{2,1,true},{4,6,false},{8,7,true},{2,3,false},{4,5,false},{6,7,true},{4,8,true},{2,7,true},{1,0,false},{6,4,false},{8,3,true},{1,5,true},{6,9,true},{1,9,false},{1,1,false},{4,9,true},{3,4,false},{6,3,false},{6,1,false},{8,7,true},{1,6,true},{2,8,false},{8,5,false},{2,8,false},{3,3,false},{4,6,false},{3,1,false},{1,1,true},{4,9,false},{8,3,true},{8,9,false},{3,9,false},{4,2,true},{1,0,false},{1,9,false},{4,9,true},{1,4,true},{4,8,true},{4,9,true},{4,4,false},{6,9,false},{6,5,true},{3,4,true},{4,8,true},{1,0,false},{4,3,true},{1,9,false}},[4698]={},[1049]={}}
local Ob=(function(tb)
    local ob=Pa[4698][tb]
    if ob then
        return ob
    end
    local a_=1
    local function Cc()
        local Ma,ta,O,dc,rc,E,ga,Zb,B,s_,kc,mc,oa,Ca,ib,Yb,Na,eb,Fc,ca,qa,vb,Tb,wb,sc,Rb,Bc,o_,bc,Za,Eb,Wb;
        Na,O=function(Q,na,Ub)
            O[Q]=A(na,3158)-A(Ub,42507)
            return O[Q]
        end,{};
        dc=O[19644]or Na(19644,73477,63444)
        repeat
            if dc>35832 then
                if dc>52121 then
                    if dc<=57833 then
                        if dc<=56670 then
                            if dc<53779 then
                                if dc<52603 then
                                    if dc>52339 then
                                        Rb=Bb('B',tb,a_);
                                        dc,a_=O[15762]or Na(15762,19288,40941),a_+1
                                    else
                                        Zb=B
                                        if oa~=oa then
                                            dc=O[11777]or Na(11777,70915,3796)
                                        else
                                            dc=O[31335]or Na(31335,25473,61518)
                                        end
                                    end
                                elseif dc>52603 then
                                    dc,qa=O[-2632]or Na(-2632,94815,4465),nil
                                else
                                    dc=O[590]or Na(590,74191,59641)
                                    continue
                                end
                            elseif dc<=54076 then
                                if dc<53922 then
                                    Za=o_;
                                    rc=aa(rc,cc(C(Za,127),E*7))
                                    if not wa(Za,128)then
                                        dc=O[-25307]or Na(-25307,72775,49503)
                                        continue
                                    end
                                    dc=O[7474]or Na(7474,69604,9728)
                                elseif dc>53922 then
                                    Tb,dc=nil,31614
                                else
                                    Tb[31796],dc=Fc[Tb[60812]+1],O[-20888]or Na(-20888,65812,56413)
                                end
                            elseif dc>54785 then
                                ib,Ca,dc=vb,nil,O[-12057]or Na(-12057,62191,37960)
                            else
                                kc=Bb('B',tb,a_);
                                a_,dc=a_+1,8701
                            end
                        elseif dc>57162 then
                            if dc<57697 then
                                mc=0;
                                bc,Eb,s_,dc=0,1,4,O[22733]or Na(22733,63583,39719)
                            elseif dc<=57697 then
                                E=ca
                                if qa~=qa then
                                    dc=O[17672]or Na(17672,74502,51332)
                                else
                                    dc=63208
                                end
                            else
                                Zb=0;
                                dc,rc,Fc,kc=O[16828]or Na(16828,76014,27072),1,0,4
                            end
                        elseif dc>=56999 then
                            if dc<=56999 then
                                dc,eb=45913,_c(mc,1750181962)
                                continue
                            else
                                Ma=Bb('B',tb,a_);
                                dc,a_=41829,a_+1
                            end
                        elseif dc>56677 then
                            dc,Za=46234,ub(_c(eb,1750181962))
                            continue
                        else
                            eb=0;
                            mc,bc,s_,dc=0,4,1,O[27784]or Na(27784,57851,19554)
                        end
                    elseif dc>=62481 then
                        if dc>=63390 then
                            if dc>=64693 then
                                if dc<=64693 then
                                    dc,ca=O[-28606]or Na(-28606,10130,45076),nil
                                else
                                    ta=ta+Fc;
                                    kc=ta
                                    if ta~=ta then
                                        dc=11610
                                    else
                                        dc=6716
                                    end
                                end
                            elseif dc<=63390 then
                                Za,dc=ub'',42954
                                continue
                            else
                                ga=Yb;
                                eb=aa(eb,cc(C(ga,127),Eb*7))
                                if not wa(ga,128)then
                                    dc=O[3912]or Na(3912,41528,46301)
                                    continue
                                end
                                dc=O[19868]or Na(19868,88458,4144)
                            end
                        elseif dc<=63208 then
                            if dc>63182 then
                                if(Tb>=0 and ca>qa)or((Tb<0 or Tb~=Tb)and ca<qa)then
                                    dc=O[7318]or Na(7318,97171,4367)
                                else
                                    dc=2025
                                end
                            elseif dc<=62481 then
                                Za=Bb('B',tb,a_);
                                a_,dc=a_+1,O[-18333]or Na(-18333,4666,48935)
                            else
                                sc=ga;
                                mc=aa(mc,cc(C(sc,127),Yb*7))
                                if not wa(sc,128)then
                                    dc=O[31572]or Na(31572,105966,25142)
                                    continue
                                end
                                dc=O[-13050]or Na(-13050,55854,15726)
                            end
                        else
                            ca[o_],dc=Cc(),O[4791]or Na(4791,61172,51814)
                        end
                    elseif dc>59438 then
                        if dc>60894 then
                            qa=kc
                            if rc~=rc then
                                dc=O[29990]or Na(29990,31296,49222)
                            else
                                dc=O[5232]or Na(5232,87112,21126)
                            end
                        elseif dc<=59501 then
                            dc,Za=19330,nil
                        else
                            bc,s_=C(c(qa,8),16777215),nil;
                            s_=if bc<8388608 then bc else bc-16777216;
                            mc[60812],dc=s_,O[-30803]or Na(-30803,41970,54566)
                        end
                    elseif dc<59058 then
                        if dc<=58557 then
                            Tb[31796]=xc(Tb[24302],0,1)==1;
                            dc,Tb[36975]=O[10124]or Na(10124,97012,17853),xc(Tb[24302],31,1)==1
                        else
                            dc,o_=O[-2135]or Na(-2135,75539,27756),nil
                        end
                    elseif dc<=59058 then
                        s_=Bb('c'..mc,tb,a_);
                        a_,dc=a_+mc,1991
                    else
                        o_=qa
                        if Tb~=Tb then
                            dc=O[-19109]or Na(-19109,75310,51997)
                        else
                            dc=36097
                        end
                    end
                elseif dc<=43988 then
                    if dc>=40865 then
                        if dc>42612 then
                            if dc>=43888 then
                                if dc>43888 then
                                    dc,Tb=25332,_c(E,159)
                                    continue
                                else
                                    if oa then
                                        dc=O[28655]or Na(28655,71633,4721)
                                        continue
                                    else
                                        dc=O[-4056]or Na(-4056,48903,47948)
                                        continue
                                    end
                                    dc=O[31373]or Na(31373,114985,27090)
                                end
                            elseif dc>42954 then
                                dc=O[2277]or Na(2277,66682,57696)
                                continue
                            else
                                o_,dc=i_(Za[1],1,Za[2]),O[19642]or Na(19642,75664,27875)
                            end
                        elseif dc<41463 then
                            if dc>40865 then
                                dc,Za=O[-19547]or Na(-19547,54821,11843),eb
                                continue
                            else
                                mc=mc+s_;
                                Eb=mc
                                if mc~=mc then
                                    dc=O[6457]or Na(6457,71369,39584)
                                else
                                    dc=O[-3363]or Na(-3363,47788,57203)
                                end
                            end
                        elseif dc<41829 then
                            ga=Bb('B',tb,a_);
                            a_,dc=a_+1,O[-16863]or Na(-16863,70896,12722)
                        elseif dc<=41829 then
                            Wb,dc=_c(Ma,159),O[-17959]or Na(-17959,89865,2784)
                            continue
                        else
                            Ma,vb,dc=Wb,nil,O[20943]or Na(20943,97697,31205)
                        end
                    elseif dc<38410 then
                        if dc<37385 then
                            if dc<=36097 then
                                if(E>=0 and qa>Tb)or((E<0 or E~=E)and qa<Tb)then
                                    dc=48482
                                else
                                    dc=63324
                                end
                            else
                                Tb[31796],dc=Fc[Tb[24302]+1],O[3371]or Na(3371,52738,35171)
                            end
                        elseif dc<=37385 then
                            ib=Bb('B',tb,a_);
                            a_,dc=a_+1,O[-28607]or Na(-28607,31191,59432)
                        else
                            kc=kc+ca;
                            qa=kc
                            if kc~=kc then
                                dc=23677
                            else
                                dc=O[-32120]or Na(-32120,96488,2755)
                            end
                        end
                    elseif dc>=39750 then
                        if dc<=39750 then
                            dc,rc=12885,eb
                            continue
                        else
                            dc=O[3719]or Na(3719,111602,18363)
                            continue
                        end
                    elseif dc<=38410 then
                        dc,rc=O[-1319]or Na(-1319,120525,31725),nil
                    else
                        kc=Fc;
                        wb=aa(wb,cc(C(kc,127),Zb*7))
                        if not wa(kc,128)then
                            dc=O[-11786]or Na(-11786,109795,29463)
                            continue
                        end
                        dc=O[7842]or Na(7842,93697,4214)
                    end
                elseif dc>48482 then
                    if dc<50831 then
                        if dc<49524 then
                            kc,dc=_c(rc,1750181962),O[-22147]or Na(-22147,85108,14331)
                            continue
                        elseif dc>49524 then
                            Fc,dc=nil,O[9882]or Na(9882,95320,1030)
                        else
                            Wb,dc=nil,O[-23135]or Na(-23135,91244,12027)
                        end
                    elseif dc>51617 then
                        dc=O[2374]or Na(2374,91727,24488)
                        continue
                    elseif dc>=51190 then
                        if dc<=51190 then
                            if(ca>=0 and kc>rc)or((ca<0 or ca~=ca)and kc<rc)then
                                dc=23677
                            else
                                dc=O[-17155]or Na(-17155,48362,12177)
                            end
                        else
                            qa=kc
                            if rc~=rc then
                                dc=O[-5100]or Na(-5100,70414,25808)
                            else
                                dc=O[-18608]or Na(-18608,57636,33655)
                            end
                        end
                    else
                        Tb=Bb('B',tb,a_);
                        dc,a_=O[22433]or Na(22433,39252,44801),a_+1
                    end
                elseif dc>=46813 then
                    if dc<48351 then
                        if dc<=46813 then
                            Yb=bc
                            if s_~=s_ then
                                dc=O[-886]or Na(-886,88042,56094)
                            else
                                dc=47706
                            end
                        else
                            if(Eb>=0 and bc>s_)or((Eb<0 or Eb~=Eb)and bc<s_)then
                                dc=O[7332]or Na(7332,84736,52900)
                            else
                                dc=1050
                            end
                        end
                    elseif dc<=48351 then
                        Rb,dc,Bc=Ca,34969,nil
                    else
                        return{[26460]=ib,[17508]=B,[13636]=Rb,[52811]='',[31626]=Ma,[44916]=ca}
                    end
                elseif dc<45913 then
                    if dc>43994 then
                        rc=kc;
                        ca=w_(rc);
                        dc,qa,Tb,E=59438,1,rc,1
                    else
                        B=B+ta;
                        Zb=B
                        if B~=B then
                            dc=O[24583]or Na(24583,94160,21787)
                        else
                            dc=O[-18247]or Na(-18247,50815,5788)
                        end
                    end
                elseif dc<=45913 then
                    mc=eb
                    if mc==0 then
                        dc=O[4586]or Na(4586,89759,64800)
                        continue
                    else
                        dc=O[4710]or Na(4710,42203,62803)
                        continue
                    end
                    dc=O[4916]or Na(4916,82250,21628)
                else
                    o_,dc=i_(Za[1],1,Za[2]),O[24421]or Na(24421,28039,42744)
                end
            elseif dc<=15989 then
                if dc>=5541 then
                    if dc<=11466 then
                        if dc<=8701 then
                            if dc<6716 then
                                if dc<=5541 then
                                    qa=Bb('<I4',tb,a_);
                                    a_,dc=a_+4,O[24513]or Na(24513,55116,53724)
                                else
                                    if(ta>=0 and B>oa)or((ta<0 or ta~=ta)and B<oa)then
                                        dc=O[27437]or Na(27437,53938,51301)
                                    else
                                        dc=O[-8805]or Na(-8805,108359,17156)
                                    end
                                end
                            elseif dc>=7298 then
                                if dc<=7298 then
                                    bc,dc=_c(s_,-776352415),O[-27368]or Na(-27368,75868,3492)
                                    continue
                                else
                                    dc,Fc=O[-7405]or Na(-7405,81177,12319),_c(kc,159)
                                    continue
                                end
                            else
                                if(Fc>=0 and ta>Zb)or((Fc<0 or Fc~=Fc)and ta<Zb)then
                                    dc=O[-29060]or Na(-29060,31537,60422)
                                else
                                    dc=O[30668]or Na(30668,53778,38111)
                                end
                            end
                        elseif dc<10078 then
                            if dc<=9063 then
                                dc,Za=42954,ub(bc)
                                continue
                            else
                                Tb=B[qa];
                                E=Tb[28705]
                                if E==3 then
                                    dc=O[24917]or Na(24917,39011,50992)
                                    continue
                                elseif E==1 then
                                    dc=O[14861]or Na(14861,26190,39749)
                                    continue
                                elseif E==10 then
                                    dc=O[-18877]or Na(-18877,105670,7141)
                                    continue
                                elseif E==4 then
                                    dc=O[24074]or Na(24074,49561,39457)
                                    continue
                                elseif E==6 then
                                    dc=O[31020]or Na(31020,54462,56224)
                                    continue
                                elseif E==8 then
                                    dc=O[-11355]or Na(-11355,98905,3929)
                                    continue
                                end
                                dc=O[15568]or Na(15568,49680,40273)
                            end
                        elseif dc<=10078 then
                            vb,dc=_c(ib,159),56670
                            continue
                        else
                            dc,Tb[31796]=O[21919]or Na(21919,60047,62950),xc(Tb[24302],0,16)
                        end
                    elseif dc>15123 then
                        if dc<=15746 then
                            if dc<=15479 then
                                if eb then
                                    dc=O[598]or Na(598,25723,61549)
                                    continue
                                end
                                dc=O[14684]or Na(14684,96228,18023)
                            else
                                if(s_>=0 and mc>bc)or((s_<0 or s_~=s_)and mc<bc)then
                                    dc=O[-8076]or Na(-8076,85494,50599)
                                else
                                    dc=17612
                                end
                            end
                        else
                            if(rc>=0 and Fc>kc)or((rc<0 or rc~=rc)and Fc<kc)then
                                dc=O[19242]or Na(19242,28462,63596)
                            else
                                dc=53637
                            end
                        end
                    elseif dc<12885 then
                        if dc>11602 then
                            dc,ta=57833,nil
                        else
                            kc=ta
                            if Zb~=Zb then
                                dc=11610
                            else
                                dc=O[-2426]or Na(-2426,62362,17307)
                            end
                        end
                    elseif dc<=13050 then
                        if dc>12885 then
                            o_=Tb[24302];
                            Za,eb=c(o_,30),C(c(o_,20),1023);
                            Tb[31796]=Fc[eb+1];
                            Tb[18518]=Za
                            if Za==2 then
                                dc=O[-13183]or Na(-13183,14056,40487)
                                continue
                            elseif Za==3 then
                                dc=O[-2101]or Na(-2101,83571,17987)
                                continue
                            end
                            dc=O[23174]or Na(23174,43526,46447)
                        else
                            oa,dc=rc,O[18013]or Na(18013,84820,61271)
                        end
                    else
                        bc=bc+Eb;
                        Yb=bc
                        if bc~=bc then
                            dc=O[2062]or Na(2062,70655,59145)
                        else
                            dc=47706
                        end
                    end
                elseif dc<=1991 then
                    if dc<=1072 then
                        if dc>836 then
                            if dc<=1050 then
                                ga,dc=nil,O[-31490]or Na(-31490,36802,40534)
                            else
                                mc[31928]=C(c(qa,8),255);
                                bc=C(c(qa,16),65535);
                                mc[61919]=bc;
                                s_=nil;
                                s_=if bc<32768 then bc else bc-65536;
                                dc,mc[51281]=O[17804]or Na(17804,34278,60210),s_
                            end
                        elseif dc>658 then
                            Eb=mc
                            if bc~=bc then
                                dc=O[-20294]or Na(-20294,109229,28428)
                            else
                                dc=15746
                            end
                        elseif dc<=147 then
                            rc=0;
                            Tb,qa,ca,dc=1,4,0,O[24267]or Na(24267,105378,4248)
                        else
                            mc=C(c(o_,10),1023);
                            dc,Tb[37052]=O[-19632]or Na(-19632,39884,41637),Fc[mc+1]
                        end
                    elseif dc<=1344 then
                        if dc<=1297 then
                            if dc>1177 then
                                ta,dc=_c(Zb,1750181962),2261
                                continue
                            else
                                Za,dc=ub(nil),O[19431]or Na(19431,61829,1317)
                            end
                        else
                            o_,dc=_c(Za,159),O[14534]or Na(14534,113802,30914)
                            continue
                        end
                    else
                        bc,dc=s_,O[29547]or Na(29547,45429,16311)
                        continue
                    end
                elseif dc>=3368 then
                    if dc<4332 then
                        if dc<=3368 then
                            dc,Ca=48351,_c(Rb,159)
                            continue
                        else
                            kc,dc,ca,rc=1,51617,1,wb
                        end
                    elseif dc<=4332 then
                        qa=ca;
                        Tb=C(qa,255);
                        E=Pa[15818][Tb+1];
                        o_,Za,eb=E[1],E[2],E[3];
                        mc={[24302]=0,[31796]=0,[31928]=0,[17288]=0,[4207]=0,[60812]=0,[51281]=0,[28705]=Za,[18518]=0,[36976]=nil,[36975]=0,[16415]=Tb,[37052]=0,[61919]=0,[42766]=0};
                        qb(B,mc)
                        if o_==1 then
                            dc=O[4775]or Na(4775,55614,60649)
                            continue
                        elseif o_==8 then
                            dc=O[-28744]or Na(-28744,91040,9235)
                            continue
                        elseif o_==4 then
                            dc=O[26948]or Na(26948,36117,56088)
                            continue
                        end
                        dc=15479
                    else
                        dc,bc=O[23625]or Na(23625,68413,15579),nil
                    end
                elseif dc<=2261 then
                    if dc<=2025 then
                        o_,dc=nil,O[1859]or Na(1859,74147,40943)
                    else
                        Zb=ta;
                        Fc=w_(Zb);
                        rc,dc,kc,ca=Zb,O[14022]or Na(14022,104329,3631),1,1
                    end
                else
                    Fc=Fc+rc;
                    ca=Fc
                    if Fc~=Fc then
                        dc=O[-4631]or Na(-4631,26316,50050)
                    else
                        dc=O[1406]or Na(1406,20934,47376)
                    end
                end
            elseif dc<25489 then
                if dc>=21813 then
                    if dc>=23978 then
                        if dc<=25332 then
                            if dc>24798 then
                                E=Tb
                                if E==2 then
                                    dc=O[24259]or Na(24259,35319,39431)
                                    continue
                                elseif E==0 then
                                    dc=O[-19369]or Na(-19369,104548,3534)
                                    continue
                                elseif E==1 then
                                    dc=O[-15160]or Na(-15160,100898,1707)
                                    continue
                                elseif E==5 then
                                    dc=O[-29476]or Na(-29476,23294,62468)
                                    continue
                                end
                                dc=O[22962]or Na(22962,31715,45276)
                            elseif dc>23978 then
                                dc,Fc[qa]=O[-14227]or Na(-14227,75474,6496),o_
                            else
                                dc,ga=O[-16989]or Na(-16989,103102,3601),_c(sc,159)
                                continue
                            end
                        else
                            ca,dc=_c(qa,-776352415),4332
                            continue
                        end
                    elseif dc<23357 then
                        if dc<=21813 then
                            bc,dc=nil,59058
                        else
                            eb,dc=nil,O[-10786]or Na(-10786,112995,29406)
                        end
                    elseif dc<=23357 then
                        Tb[31796],dc=Fc[Tb[51281]+1],O[7205]or Na(7205,46256,33777)
                    else
                        dc,kc=147,nil
                    end
                elseif dc>19330 then
                    if dc>=21035 then
                        if dc>21035 then
                            ca=Fc
                            if kc~=kc then
                                dc=O[18953]or Na(18953,36342,55940)
                            else
                                dc=15989
                            end
                        else
                            dc,o_=O[18968]or Na(18968,55579,53860),Za
                        end
                    else
                        wb=Bc;
                        B,oa=w_(wb),false;
                        ta,Zb,Fc,dc=1,wb,1,11602
                    end
                elseif dc>=19255 then
                    if dc<=19255 then
                        sc=Bb('B',tb,a_);
                        a_,dc=a_+1,O[18193]or Na(18193,32017,46486)
                    else
                        eb=Bb('<d',tb,a_);
                        dc,a_=40902,a_+8
                    end
                elseif dc>17612 then
                    dc,Za=56677,ub(nil)
                else
                    Yb,dc=nil,O[-308]or Na(-308,86742,6786)
                end
            elseif dc<=30811 then
                if dc<27417 then
                    if dc>26685 then
                        mc,bc=C(c(o_,10),1023),C(c(o_,0),1023);
                        Tb[37052]=Fc[mc+1];
                        Tb[42766],dc=Fc[bc+1],O[-31428]or Na(-31428,45227,35866)
                    elseif dc>26381 then
                        Tb=qa;
                        Zb=aa(Zb,cc(C(Tb,127),ca*7))
                        if not wa(Tb,128)then
                            dc=O[29454]or Na(29454,89139,28767)
                            continue
                        end
                        dc=O[19374]or Na(19374,69472,24149)
                    elseif dc<=25489 then
                        if(ca>=0 and kc>rc)or((ca<0 or ca~=ca)and kc<rc)then
                            dc=O[-1474]or Na(-1474,22399,60779)
                        else
                            dc=54076
                        end
                    else
                        oa,dc=false,O[-27517]or Na(-27517,98597,10694)
                    end
                elseif dc<28790 then
                    if dc>27417 then
                        s_=Bb('<I4',tb,a_);
                        dc,a_=7298,a_+4
                    else
                        kc=kc+ca;
                        qa=kc
                        if kc~=kc then
                            dc=O[2664]or Na(2664,12901,34913)
                        else
                            dc=25489
                        end
                    end
                elseif dc>=30261 then
                    if dc>30261 then
                        s_=bc;
                        mc[24302]=s_;
                        qb(B,{});
                        dc=O[-16581]or Na(-16581,106013,20750)
                    else
                        qa=qa+E;
                        o_=qa
                        if qa~=qa then
                            dc=48482
                        else
                            dc=36097
                        end
                    end
                else
                    dc,Bc=O[13577]or Na(13577,82036,22926),_c(wb,1750181962)
                    continue
                end
            elseif dc<33703 then
                if dc>31614 then
                    Yb,dc=_c(ga,159),O[-32189]or Na(-32189,123578,20655)
                    continue
                elseif dc>31249 then
                    E=Bb('B',tb,a_);
                    dc,a_=O[-17704]or Na(-17704,76035,57226),a_+1
                else
                    dc=O[25117]or Na(25117,38120,13734)
                    continue
                end
            elseif dc<=35462 then
                if dc>=34969 then
                    if dc<=34969 then
                        wb=0;
                        ta,dc,B,oa=1,52339,0,4
                    else
                        mc[31928]=C(c(qa,8),255);
                        mc[4207]=C(c(qa,16),255);
                        mc[17288],dc=C(c(qa,24),255),O[-13672]or Na(-13672,53822,2042)
                    end
                else
                    ca=ca+Tb;
                    E=ca
                    if ca~=ca then
                        dc=O[-10413]or Na(-10413,74544,51374)
                    else
                        dc=63208
                    end
                end
            else
                qa,dc=_c(Tb,159),O[-14727]or Na(-14727,84932,31070)
                continue
            end
        until dc==49660
    end
    local v=Cc();
    Pa[4698][tb]=v
    return v
end)
local y=(function(pa,la)
    pa=Ob(pa)
    local Dc=X()
    local function ka(xb,ha)
        local _b=(function(...)
            return{...},jc('#',...)
        end)
        local nb;
        nb=(function(ac,ab,k)
            if ab>k then
                return
            end
            return ac[ab],nb(ac,ab+1,k)
        end)
        local function Sa(Ka,mb,fa_,V)
            local x,r_,lc,Aa,hb,hc,Z,F,ic,La,qc,Xa,Sb,Cb,ra,Qa,xa,zb,Db,tc,yb,gc,T,Jb;
            xa,ic={},function(Wa,Oa,R)
                xa[R]=A(Oa,48836)-A(Wa,62087)
                return xa[R]
            end;
            Jb=xa[28030]or ic(34649,120652,28030)
            repeat
                if Jb>28761 then
                    if Jb<48982 then
                        if Jb<=39273 then
                            if Jb<=34403 then
                                if Jb>=31386 then
                                    if Jb>=32772 then
                                        if Jb<33975 then
                                            if not qc then
                                                Jb=xa[20186]or ic(59392,52201,20186)
                                                continue
                                            end
                                            Jb=29671
                                        elseif Jb>33975 then
                                            Jb,tc[F]=xa[-2556]or ic(65399,54923,-2556),ha[Xa[4207]+1]
                                        else
                                            if Db[17288]==62 then
                                                Jb=xa[-24432]or ic(52651,21371,-24432)
                                                continue
                                            elseif Db[17288]==130 then
                                                Jb=xa[-13537]or ic(12097,100829,-13537)
                                                continue
                                            elseif Db[17288]==254 then
                                                Jb=xa[-6571]or ic(9356,130344,-6571)
                                                continue
                                            else
                                                Jb=xa[4017]or ic(48639,49347,4017)
                                                continue
                                            end
                                            Jb=xa[-12926]or ic(54557,6490,-12926)
                                        end
                                    elseif Jb>31504 then
                                        if Aa>85 then
                                            Jb=xa[-21068]or ic(15887,26427,-21068)
                                            continue
                                        else
                                            Jb=xa[7611]or ic(14554,67329,7611)
                                            continue
                                        end
                                        Jb=xa[18595]or ic(55020,6827,18595)
                                    elseif Jb>31386 then
                                        if Aa>48 then
                                            Jb=xa[27487]or ic(8076,121185,27487)
                                            continue
                                        else
                                            Jb=xa[-8883]or ic(24914,5574,-8883)
                                            continue
                                        end
                                        Jb=xa[-7271]or ic(37102,23721,-7271)
                                    else
                                        gc,lc,Z=zb
                                        if Ha(gc)~='function'then
                                            Jb=xa[30102]or ic(47542,54256,30102)
                                            continue
                                        end
                                        Jb=xa[10339]or ic(44268,107263,10339)
                                    end
                                elseif Jb<30167 then
                                    if Jb<29671 then
                                        if Aa>143 then
                                            Jb=xa[-10303]or ic(42413,54868,-10303)
                                            continue
                                        else
                                            Jb=xa[18313]or ic(26697,22627,18313)
                                            continue
                                        end
                                        Jb=xa[22844]or ic(49150,29625,22844)
                                    elseif Jb<=29671 then
                                        qc=false;
                                        hb+=1
                                        if Aa>103 then
                                            Jb=xa[-18139]or ic(511,115968,-18139)
                                            continue
                                        else
                                            Jb=xa[-19057]or ic(24387,111799,-19057)
                                            continue
                                        end
                                        Jb=xa[3557]or ic(10080,125743,3557)
                                    else
                                        Jb,Ka[Db[31928]]=xa[-6027]or ic(16242,116768,-6027),lc
                                    end
                                elseif Jb>30344 then
                                    Jb,r_=xa[-15695]or ic(57690,7353,-15695),r_..L(_c(u_(tc,x+1),u_(La,x%#La+1)))
                                elseif Jb<=30167 then
                                    gc,lc,Z=ra
                                    if Ha(gc)~='function'then
                                        Jb=xa[-23565]or ic(28784,7066,-23565)
                                        continue
                                    end
                                    Jb=xa[19277]or ic(53670,63924,19277)
                                else
                                    gc,lc,Z=Cb.__iter(gc);
                                    Jb=xa[-18537]or ic(51028,58598,-18537)
                                end
                            elseif Jb<=36817 then
                                if Jb<=36377 then
                                    if Jb<35926 then
                                        if Jb>34892 then
                                            if Db[17288]==27 then
                                                Jb=xa[-23133]or ic(4509,126391,-23133)
                                                continue
                                            elseif Db[17288]==77 then
                                                Jb=xa[-6309]or ic(40547,29147,-6309)
                                                continue
                                            elseif Db[17288]==153 then
                                                Jb=xa[31412]or ic(63135,43847,31412)
                                                continue
                                            elseif Db[17288]==209 then
                                                Jb=xa[-2723]or ic(4451,109552,-2723)
                                                continue
                                            else
                                                Jb=xa[23451]or ic(60703,16312,23451)
                                                continue
                                            end
                                            Jb=xa[25247]or ic(11988,123539,25247)
                                        else
                                            if Aa>183 then
                                                Jb=xa[-14879]or ic(45430,23871,-14879)
                                                continue
                                            else
                                                Jb=xa[24326]or ic(1162,105589,24326)
                                                continue
                                            end
                                            Jb=xa[-13836]or ic(25105,110174,-13836)
                                        end
                                    elseif Jb<=35926 then
                                        if Db[17288]==118 then
                                            Jb=xa[29212]or ic(14662,121561,29212)
                                            continue
                                        else
                                            Jb=xa[-7905]or ic(3795,125157,-7905)
                                            continue
                                        end
                                        Jb=xa[29011]or ic(38970,21509,29011)
                                    else
                                        T=Xa[4207];
                                        hc=zb[T]
                                        if hc==nil then
                                            Jb=xa[-26133]or ic(29465,24530,-26133)
                                            continue
                                        end
                                        Jb=xa[10047]or ic(11400,117205,10047)
                                    end
                                elseif Jb>36512 then
                                    Jb,gc[42766]=xa[-13390]or ic(43233,12434,-13390),Qa
                                else
                                    yb=yb+Xa;
                                    x=yb
                                    if yb~=yb then
                                        Jb=xa[27701]or ic(17415,76450,27701)
                                    else
                                        Jb=32
                                    end
                                end
                            elseif Jb<=39170 then
                                if Jb<39004 then
                                    if Aa>160 then
                                        Jb=xa[6930]or ic(59878,19029,6930)
                                        continue
                                    else
                                        Jb=xa[9686]or ic(8869,116083,9686)
                                        continue
                                    end
                                    Jb=xa[17811]or ic(30165,113042,17811)
                                elseif Jb>39004 then
                                    tc[F],Jb=hc,xa[9215]or ic(3577,124697,9215)
                                else
                                    hb-=1;
                                    fa_[hb],Jb={[16415]=121,[31928]=_c(Db[31928],252),[4207]=_c(Db[4207],187),[17288]=0},xa[-27379]or ic(43301,25954,-27379)
                                end
                            elseif Jb>39206 then
                                T={[2]=Ka[Xa[4207]],[1]=2};
                                T[3]=T;
                                Jb,tc[F]=xa[-8073]or ic(9380,101958,-8073),T
                            else
                                Xa=r_
                                if yb~=yb then
                                    Jb=xa[14480]or ic(11400,71072,14480)
                                else
                                    Jb=13432
                                end
                            end
                        elseif Jb<=43925 then
                            if Jb<=42159 then
                                if Jb<=40970 then
                                    if Jb<=40480 then
                                        if Jb<39998 then
                                            gc,lc,Z=Vb(gc);
                                            Jb=xa[-6888]or ic(60008,50308,-6888)
                                        elseif Jb>39998 then
                                            if Aa>15 then
                                                Jb=xa[204]or ic(20614,5099,204)
                                                continue
                                            else
                                                Jb=xa[-6320]or ic(3535,122694,-6320)
                                                continue
                                            end
                                            Jb=xa[31475]or ic(47472,30015,31475)
                                        else
                                            Cb,gc,lc,Z=Db[31796],Db[36975],Ka[Db[31928]],nil;
                                            Z=l_(lc)=='boolean'
                                            if(Z and(lc==Cb))~=gc then
                                                Jb=xa[-14735]or ic(38317,14792,-14735)
                                                continue
                                            else
                                                Jb=xa[-21719]or ic(31349,127488,-21719)
                                                continue
                                            end
                                            Jb=xa[1596]or ic(22562,103533,1596)
                                        end
                                    else
                                        if Aa>237 then
                                            Jb=xa[-3941]or ic(32208,130956,-3941)
                                            continue
                                        else
                                            Jb=xa[11215]or ic(63033,34096,11215)
                                            continue
                                        end
                                        Jb=xa[9696]or ic(62997,14930,9696)
                                    end
                                elseif Jb>42131 then
                                    Cb=Db[36975]
                                    if(Ka[Db[31928]]==nil)~=Cb then
                                        Jb=xa[25179]or ic(28921,28656,25179)
                                        continue
                                    else
                                        Jb=xa[13433]or ic(52405,7527,13433)
                                        continue
                                    end
                                    Jb=xa[3194]or ic(3065,116550,3194)
                                else
                                    if Aa>14 then
                                        Jb=xa[10451]or ic(22443,77700,10451)
                                        continue
                                    else
                                        Jb=xa[-21127]or ic(2727,116448,-21127)
                                        continue
                                    end
                                    Jb=xa[-12741]or ic(51350,1233,-12741)
                                end
                            elseif Jb>=42502 then
                                if Jb<43247 then
                                    if Ka[Db[31928]]==Ka[Db[24302]]then
                                        Jb=xa[23713]or ic(12986,115338,23713)
                                        continue
                                    else
                                        Jb=xa[-30268]or ic(1085,124252,-30268)
                                        continue
                                    end
                                    Jb=xa[10492]or ic(65269,12978,10492)
                                elseif Jb<=43247 then
                                    hb+=1;
                                    Jb=xa[-29153]or ic(32015,110920,-29153)
                                else
                                    Cb,gc,lc,Jb=Db[18518],fa_[hb+1],nil,24789
                                end
                            elseif Jb>42162 then
                                Cb,gc=nil,Ka[Db[31928]];
                                Cb=l_(gc)=='function'
                                if not Cb then
                                    Jb=xa[18821]or ic(12144,18052,18821)
                                    continue
                                end
                                Jb=xa[14105]or ic(49266,63907,14105)
                            else
                                if tc[1]>=Db[31928]then
                                    Jb=xa[-18337]or ic(16886,81228,-18337)
                                    continue
                                end
                                Jb=xa[20024]or ic(38675,105888,20024)
                            end
                        elseif Jb>46373 then
                            if Jb<=48592 then
                                if Jb>48145 then
                                    Qa,tc=gc(lc,Z);
                                    Z=Qa
                                    if Z==nil then
                                        Jb=xa[-8227]or ic(38888,23479,-8227)
                                    else
                                        Jb=xa[9550]or ic(55026,30691,9550)
                                    end
                                elseif Jb<=46882 then
                                    Sb,Jb=Cb+La-1,xa[-30315]or ic(41861,55392,-30315)
                                else
                                    hb+=Db[51281];
                                    Jb=xa[-23771]or ic(11493,123042,-23771)
                                end
                            else
                                Qa,tc=gc[37052],Db[37052];
                                tc='\252\132\129'..tc;
                                La='';
                                r_,yb,F,Jb=0,#Qa-1,1,xa[7492]or ic(34515,11562,7492)
                            end
                        elseif Jb>46020 then
                            if Jb>46304 then
                                Jb,Ka[Db[31928]]=xa[20786]or ic(52575,22019,20786),lc[Db[37052]][Db[42766]]
                            else
                                Ka[Db[31928]],Jb=lc[Db[37052]],xa[23705]or ic(47360,19122,23705)
                            end
                        elseif Jb<45609 then
                            if Jb>44691 then
                                if Aa>254 then
                                    Jb=xa[-10799]or ic(52274,57435,-10799)
                                    continue
                                else
                                    Jb=xa[26665]or ic(33973,26656,26665)
                                    continue
                                end
                                Jb=xa[18444]or ic(34951,17600,18444)
                            else
                                hb-=1;
                                Jb,fa_[hb]=xa[-19031]or ic(14922,128533,-19031),{[16415]=24,[31928]=_c(Db[31928],166),[4207]=_c(Db[4207],65),[17288]=0}
                            end
                        elseif Jb>45609 then
                            Jb,La=xa[-28122]or ic(45899,52531,-28122),La..L(_c(u_(Qa,Xa+1),u_(tc,Xa%#tc+1)))
                        else
                            if Aa>6 then
                                Jb=xa[6307]or ic(42468,23933,6307)
                                continue
                            else
                                Jb=xa[400]or ic(38187,8558,400)
                                continue
                            end
                            Jb=xa[-12340]or ic(34279,18848,-12340)
                        end
                    elseif Jb<=57012 then
                        if Jb>=53311 then
                            if Jb>55479 then
                                if Jb>56806 then
                                    if Jb<=56832 then
                                        if not Ka[Db[31928]]then
                                            Jb=xa[-16884]or ic(23629,118631,-16884)
                                            continue
                                        end
                                        Jb=xa[-23862]or ic(58732,10539,-23862)
                                    else
                                        return nb(Ka,Cb,Cb+Z-1)
                                    end
                                elseif Jb>56424 then
                                    Qa,Jb=r_,xa[-26450]or ic(41538,24146,-26450)
                                    continue
                                elseif Jb<=55600 then
                                    Cb,gc=Db[31928],Db[31796];
                                    Sb=Cb+6;
                                    lc,Z=Ka[Cb],nil;
                                    Z=l_(lc)=='function'
                                    if Z then
                                        Jb=xa[19943]or ic(6141,104281,19943)
                                        continue
                                    else
                                        Jb=xa[26386]or ic(59595,114045,26386)
                                        continue
                                    end
                                    Jb=xa[2628]or ic(21026,106093,2628)
                                else
                                    Cb,gc=Db[18518],Db[31796];
                                    lc=Dc[gc]or Pa[1049][gc]
                                    if Cb==1 then
                                        Jb=xa[-30642]or ic(4601,125213,-30642)
                                        continue
                                    elseif Cb==2 then
                                        Jb=xa[-20786]or ic(17453,120142,-20786)
                                        continue
                                    elseif Cb==3 then
                                        Jb=xa[188]or ic(25387,129045,188)
                                        continue
                                    end
                                    Jb=xa[27755]or ic(33773,107677,27755)
                                end
                            elseif Jb<=55370 then
                                if Jb>=54782 then
                                    if Jb>54782 then
                                        G(tc);
                                        Jb,ra[Qa]=xa[3610]or ic(3136,105938,3610),nil
                                    else
                                        Z=Z+tc;
                                        La=Z
                                        if Z~=Z then
                                            Jb=xa[-21202]or ic(18337,101358,-21202)
                                        else
                                            Jb=14091
                                        end
                                    end
                                elseif Jb<=53311 then
                                    gc[31796]=lc
                                    if Cb==2 then
                                        Jb=xa[-2396]or ic(19492,72554,-2396)
                                        continue
                                    elseif Cb==3 then
                                        Jb=xa[-30707]or ic(57803,18207,-30707)
                                        continue
                                    end
                                    Jb=xa[-9607]or ic(58900,63047,-9607)
                                else
                                    F=La
                                    if r_~=r_ then
                                        Jb=xa[-24552]or ic(12770,130477,-24552)
                                    else
                                        Jb=9226
                                    end
                                end
                            elseif Jb<=55415 then
                                if Jb>55392 then
                                    F=La
                                    if r_~=r_ then
                                        Jb=xa[-8051]or ic(41001,1434,-8051)
                                    else
                                        Jb=61864
                                    end
                                else
                                    if Aa>120 then
                                        Jb=xa[-24752]or ic(59053,9765,-24752)
                                        continue
                                    else
                                        Jb=xa[18382]or ic(54826,38664,18382)
                                        continue
                                    end
                                    Jb=xa[-15295]or ic(47010,31725,-15295)
                                end
                            else
                                if Aa>177 then
                                    Jb=xa[-9632]or ic(36815,7903,-9632)
                                    continue
                                else
                                    Jb=xa[15684]or ic(16252,122138,15684)
                                    continue
                                end
                                Jb=xa[9440]or ic(16876,101803,9440)
                            end
                        elseif Jb<=49902 then
                            if Jb>49608 then
                                if Jb>49881 then
                                    Ka[Db[4207]]=w_(Db[24302]);
                                    hb+=1;
                                    Jb=xa[-4095]or ic(52636,475,-4095)
                                else
                                    hb+=Db[51281];
                                    Jb=xa[24710]or ic(16406,101457,24710)
                                end
                            elseif Jb<=49564 then
                                if Jb>49545 then
                                    Cb,gc=nil,_c(Db[61919],37910);
                                    Cb=if gc<32768 then gc else gc-65536;
                                    lc=Cb;
                                    Jb,Ka[_c(Db[31928],93)]=xa[15099]or ic(38554,23269,15099),lc
                                elseif Jb>48982 then
                                    lc,Z=Cb[31796],Db[31796];
                                    Z='\252\132\129'..Z;
                                    Qa='';
                                    Jb,r_,tc,La=xa[14854]or ic(28897,119721,14854),1,0,#lc-1
                                else
                                    Qa,tc=gc[37052],Db[37052];
                                    tc='\252\132\129'..tc;
                                    La='';
                                    yb,F,Jb,r_=#Qa-1,1,39206,0
                                end
                            else
                                ba(tc,1,gc,Cb+3,Ka);
                                Ka[Cb+2]=Ka[Cb+3];
                                hb+=Db[51281];
                                Jb=xa[-26770]or ic(33743,20360,-26770)
                            end
                        elseif Jb>52565 then
                            if Jb<=52754 then
                                tc=tc+r_;
                                yb=tc
                                if tc~=tc then
                                    Jb=xa[-16110]or ic(16995,71012,-16110)
                                else
                                    Jb=21944
                                end
                            else
                                tc[2]=tc[3][tc[1]];
                                tc[3]=tc;
                                tc[1]=2;
                                zb[Qa],Jb=nil,xa[1470]or ic(44330,107449,1470)
                            end
                        elseif Jb>50702 then
                            Jb,Z=xa[13676]or ic(4392,128833,13676),La
                            continue
                        elseif Jb>50130 then
                            if Aa>186 then
                                Jb=xa[18852]or ic(23724,128173,18852)
                                continue
                            else
                                Jb=xa[7548]or ic(50736,2687,7548)
                                continue
                            end
                            Jb=xa[-30327]or ic(21751,104624,-30327)
                        else
                            hb+=1;
                            Jb=xa[-376]or ic(20073,98870,-376)
                        end
                    elseif Jb<61944 then
                        if Jb>59757 then
                            if Jb>=60436 then
                                if Jb<61288 then
                                    Cb=mb[Db[31796]+1];
                                    gc=Cb[13636];
                                    lc=w_(gc);
                                    Ka[Db[31928]]=ka(Cb,lc);
                                    Qa,Jb,Z,tc=gc,xa[6509]or ic(13271,109516,6509),1,1
                                elseif Jb>61288 then
                                    if(yb>=0 and La>r_)or((yb<0 or yb~=yb)and La<r_)then
                                        Jb=xa[-16705]or ic(48756,2919,-16705)
                                    else
                                        Jb=xa[-31075]or ic(32897,32629,-31075)
                                    end
                                else
                                    if Aa>67 then
                                        Jb=xa[-6346]or ic(61188,57314,-6346)
                                        continue
                                    else
                                        Jb=xa[-23855]or ic(40754,121734,-23855)
                                        continue
                                    end
                                    Jb=xa[2492]or ic(40732,21339,2492)
                                end
                            elseif Jb>60167 then
                                La,Jb=La..L(_c(u_(Qa,Xa+1),u_(tc,Xa%#tc+1))),xa[-30295]or ic(4077,102794,-30295)
                            else
                                yb=tc
                                if La~=La then
                                    Jb=xa[3155]or ic(15507,95764,3155)
                                else
                                    Jb=21944
                                end
                            end
                        elseif Jb>=59147 then
                            if Jb<59387 then
                                Jb,Z=48982,nil
                            elseif Jb>59387 then
                                Qa,tc=ua(ra[Db],lc,Ka[Cb+1],Ka[Cb+2])
                                if not Qa then
                                    Jb=xa[26074]or ic(50372,62085,26074)
                                    continue
                                end
                                Jb=24690
                            else
                                Jb,La=xa[-32088]or ic(16198,23975,-32088),lc-1
                            end
                        elseif Jb>=58317 then
                            if Jb>58317 then
                                Z,Jb=nil,xa[-1744]or ic(35187,99414,-1744)
                            else
                                hb+=1;
                                Jb=xa[1984]or ic(42136,26855,1984)
                            end
                        else
                            hb-=1;
                            fa_[hb],Jb={[16415]=124,[31928]=_c(Db[31928],254),[4207]=_c(Db[4207],253),[17288]=0},xa[-31944]or ic(11414,123089,-31944)
                        end
                    elseif Jb>63373 then
                        if Jb<=64550 then
                            if Jb>64472 then
                                gc,lc,Z=Cb.__iter(gc);
                                Jb=xa[-813]or ic(35810,25714,-813)
                            elseif Jb>64188 then
                                Cb=Db[31796];
                                Ka[Db[17288]]=Dc[Cb]or Pa[1049][Cb];
                                hb+=1;
                                Jb=xa[-23331]or ic(47738,30661,-23331)
                            else
                                Jb,gc=xa[-13392]or ic(65138,59988,-13392),Qa
                                continue
                            end
                        elseif Jb<=64553 then
                            ra[Db]=nil;
                            hb+=1;
                            Jb=xa[-29281]or ic(12677,130498,-29281)
                        else
                            La=La+yb;
                            F=La
                            if La~=La then
                                Jb=xa[12836]or ic(59207,49332,12836)
                            else
                                Jb=xa[11553]or ic(29851,116992,11553)
                            end
                        end
                    elseif Jb<62986 then
                        if Jb>62080 then
                            Sb,hb,zb,Jb,ra,qc=-1,1,Mb({},{__mode='vs'}),32772,Mb({},{__mode='ks'}),false
                        elseif Jb>61944 then
                            Ka[Cb+2]=Ka[Cb+3];
                            hb+=Db[51281];
                            Jb=xa[26350]or ic(44587,25204,26350)
                        else
                            gc,lc,Z=Cb.__iter(gc);
                            Jb=xa[26676]or ic(53864,24699,26676)
                        end
                    elseif Jb<63344 then
                        Cb,gc,lc=Db[31928],Db[17288],Db[31796];
                        Z=Ka[gc];
                        Ka[Cb+1]=Z;
                        Ka[Cb]=Z[lc];
                        hb+=1;
                        Jb=xa[-11650]or ic(55560,5463,-11650)
                    elseif Jb>63344 then
                        if Aa>64 then
                            Jb=xa[17011]or ic(62812,17185,17011)
                            continue
                        else
                            Jb=xa[17098]or ic(50129,36336,17098)
                            continue
                        end
                        Jb=xa[28002]or ic(40347,20964,28002)
                    else
                        Cb=Db[31796];
                        Ka[Db[31928]][Cb]=Ka[Db[17288]];
                        hb+=1;
                        Jb=xa[8337]or ic(61203,9052,8337)
                    end
                elseif Jb>13432 then
                    if Jb>23206 then
                        if Jb<25060 then
                            if Jb>=24493 then
                                if Jb<24754 then
                                    if Jb>24493 then
                                        if tc==-2 then
                                            Jb=xa[16657]or ic(56152,104652,16657)
                                            continue
                                        else
                                            Jb=xa[12212]or ic(38351,104404,12212)
                                            continue
                                        end
                                        Jb=xa[-9443]or ic(48770,29389,-9443)
                                    else
                                        Jb,Z=xa[-18320]or ic(5530,97045,-18320),Sb-Cb+1
                                    end
                                elseif Jb>24789 then
                                    Qa,tc=gc(lc,Z);
                                    Z=Qa
                                    if Z==nil then
                                        Jb=30167
                                    else
                                        Jb=21436
                                    end
                                elseif Jb<=24754 then
                                    if Aa>245 then
                                        Jb=xa[-21237]or ic(1317,92878,-21237)
                                        continue
                                    else
                                        Jb=xa[26257]or ic(34055,118172,26257)
                                        continue
                                    end
                                    Jb=xa[-9053]or ic(10666,124405,-9053)
                                else
                                    Z,Qa=gc[31796],Db[31796];
                                    Qa='\252\132\129'..Qa;
                                    tc='';
                                    La,yb,r_,Jb=0,1,#Z-1,55415
                                end
                            elseif Jb>23727 then
                                if Jb>24013 then
                                    hc={[1]=T,[3]=Ka};
                                    zb[T],Jb=hc,xa[-6240]or ic(16002,121795,-6240)
                                else
                                    if Aa>128 then
                                        Jb=xa[8877]or ic(20933,109107,8877)
                                        continue
                                    else
                                        Jb=xa[5316]or ic(48698,56314,5316)
                                        continue
                                    end
                                    Jb=xa[-4689]or ic(23521,104366,-4689)
                                end
                            elseif Jb>23656 then
                                if Aa>53 then
                                    Jb=xa[26805]or ic(58724,10447,26805)
                                    continue
                                else
                                    Jb=xa[-6836]or ic(44419,17376,-6836)
                                    continue
                                end
                                Jb=xa[-18230]or ic(22363,105252,-18230)
                            elseif Jb<=23651 then
                                gc[37052]=Z;
                                Jb,Qa=4198,nil
                            else
                                if Aa>215 then
                                    Jb=xa[12134]or ic(34154,50138,12134)
                                    continue
                                else
                                    Jb=xa[-9621]or ic(38873,103848,-9621)
                                    continue
                                end
                                Jb=xa[31222]or ic(56984,4839,31222)
                            end
                        elseif Jb<=25907 then
                            if Jb>=25691 then
                                if Jb>=25822 then
                                    if Jb<=25822 then
                                        hb+=1;
                                        Jb=xa[11763]or ic(57733,11714,11763)
                                    else
                                        Cb,gc,lc=_c(Db[31928],138),_c(Db[17288],29),_c(Db[4207],8);
                                        Z,Qa=gc==0 and Sb-Cb or gc-1,Ka[Cb];
                                        tc,La=_b(Qa(nb(Ka,Cb+1,Cb+Z)))
                                        if lc==0 then
                                            Jb=xa[-19537]or ic(46003,18066,-19537)
                                            continue
                                        else
                                            Jb=xa[-31019]or ic(31151,118247,-31019)
                                            continue
                                        end
                                        Jb=xa[-12735]or ic(16010,24427,-12735)
                                    end
                                else
                                    if Db[17288]==9 then
                                        Jb=xa[-307]or ic(18861,24233,-307)
                                        continue
                                    elseif Db[17288]==58 then
                                        Jb=xa[-5737]or ic(4909,97167,-5737)
                                        continue
                                    else
                                        Jb=xa[-3984]or ic(9584,18319,-3984)
                                        continue
                                    end
                                    Jb=xa[5993]or ic(22246,105121,5993)
                                end
                            elseif Jb>=25146 then
                                if Jb<=25146 then
                                    if Aa>13 then
                                        Jb=xa[31018]or ic(10891,115291,31018)
                                        continue
                                    else
                                        Jb=xa[-18299]or ic(54610,60858,-18299)
                                        continue
                                    end
                                    Jb=xa[-27122]or ic(44548,25155,-27122)
                                else
                                    hb-=1;
                                    fa_[hb],Jb={[16415]=141,[31928]=_c(Db[31928],176),[4207]=_c(Db[4207],43),[17288]=0},xa[2203]or ic(30403,113292,2203)
                                end
                            else
                                Ka[Db[31928]],Jb=nil,xa[24832]or ic(21707,104596,24832)
                            end
                        elseif Jb>26800 then
                            if Jb<=28129 then
                                hb-=1;
                                Jb,fa_[hb]=xa[-9581]or ic(43886,26409,-9581),{[16415]=93,[31928]=_c(Db[31928],237),[4207]=_c(Db[4207],111),[17288]=0}
                            else
                                hb-=1;
                                fa_[hb],Jb={[16415]=85,[31928]=_c(Db[31928],224),[4207]=_c(Db[4207],208),[17288]=0},xa[-29041]or ic(45554,32189,-29041)
                            end
                        elseif Jb>26070 then
                            lc,Jb=tc,xa[28210]or ic(50407,112731,28210)
                            continue
                        elseif Jb>25969 then
                            gc[37052],Jb=Z,xa[10291]or ic(43901,13102,10291)
                        else
                            hb+=1;
                            Jb=xa[15897]or ic(35115,17780,15897)
                        end
                    elseif Jb<=20150 then
                        if Jb<=17856 then
                            if Jb<=14334 then
                                if Jb>=14188 then
                                    if Jb<=14188 then
                                        gc,lc,Z=Vb(gc);
                                        Jb=xa[20740]or ic(36099,7447,20740)
                                    else
                                        hb+=Db[51281];
                                        Jb=xa[13313]or ic(19018,99861,13313)
                                    end
                                elseif Jb<=14091 then
                                    if(tc>=0 and Z>Qa)or((tc<0 or tc~=tc)and Z<Qa)then
                                        Jb=xa[30988]or ic(20368,99295,30988)
                                    else
                                        Jb=17856
                                    end
                                else
                                    if Aa>234 then
                                        Jb=xa[32031]or ic(29743,103095,32031)
                                        continue
                                    else
                                        Jb=xa[-9395]or ic(55357,14822,-9395)
                                        continue
                                    end
                                    Jb=xa[-13005]or ic(52510,345,-13005)
                                end
                            elseif Jb>17443 then
                                r_=fa_[hb];
                                hb+=1;
                                yb=r_[31928]
                                if yb==0 then
                                    Jb=xa[18439]or ic(43501,5298,18439)
                                    continue
                                elseif yb==2 then
                                    Jb=xa[4568]or ic(63918,60377,4568)
                                    continue
                                end
                                Jb=xa[-3990]or ic(11350,68107,-3990)
                            elseif Jb>17315 then
                                Qa={lc(Ka[Cb+1],Ka[Cb+2])};
                                ba(Qa,1,gc,Cb+3,Ka)
                                if Ka[Cb+3]~=nil then
                                    Jb=xa[-16507]or ic(52389,101990,-16507)
                                    continue
                                else
                                    Jb=xa[-3954]or ic(52194,107510,-3954)
                                    continue
                                end
                                Jb=xa[-6469]or ic(45672,32311,-6469)
                            else
                                if Aa>76 then
                                    Jb=xa[31734]or ic(7528,20292,31734)
                                    continue
                                else
                                    Jb=xa[5515]or ic(1460,67083,5515)
                                    continue
                                end
                                Jb=xa[-2965]or ic(29174,114097,-2965)
                            end
                        elseif Jb<=18932 then
                            if Jb<=18331 then
                                if Jb<=18165 then
                                    Cb=fb(gc)
                                    if Cb~=nil and Cb.__iter~=nil then
                                        Jb=xa[-13191]or ic(8257,94248,-13191)
                                        continue
                                    elseif Ha(gc)=='table'then
                                        Jb=xa[27323]or ic(24379,128715,27323)
                                        continue
                                    end
                                    Jb=xa[10589]or ic(50257,9955,10589)
                                else
                                    Cb[31796]=gc;
                                    Jb,Db[16415]=xa[-12714]or ic(26989,107818,-12714),186
                                end
                            else
                                Jb,lc[La]=xa[-12074]or ic(40897,130432,-12074),ha[r_[4207]+1]
                            end
                        elseif Jb<=19417 then
                            hb+=1;
                            Jb=xa[30257]or ic(43298,25965,30257)
                        else
                            hb+=Db[51281];
                            Jb=xa[1512]or ic(41364,28115,1512)
                        end
                    elseif Jb<=22867 then
                        if Jb>21436 then
                            if Jb<=21944 then
                                if(r_>=0 and tc>La)or((r_<0 or r_~=r_)and tc<La)then
                                    Jb=xa[-28344]or ic(16122,96765,-28344)
                                else
                                    Jb=10843
                                end
                            else
                                hb-=1;
                                fa_[hb],Jb={[16415]=12,[31928]=_c(Db[31928],141),[4207]=_c(Db[4207],102),[17288]=0},xa[723]or ic(8694,126385,723)
                            end
                        elseif Jb<=21432 then
                            if Jb>=20395 then
                                if Jb>20395 then
                                    La=Z
                                    if Qa~=Qa then
                                        Jb=xa[29295]or ic(1807,117576,29295)
                                    else
                                        Jb=14091
                                    end
                                else
                                    Jb,tc=xa[-22781]or ic(7726,87286,-22781),tc..L(_c(u_(Z,F+1),u_(Qa,F%#Qa+1)))
                                end
                            else
                                F={[2]=Ka[r_[4207]],[1]=2};
                                F[3]=F;
                                lc[La],Jb=F,xa[32263]or ic(10650,69599,32263)
                            end
                        else
                            tc[2]=tc[3][tc[1]];
                            tc[3]=tc;
                            tc[1]=2;
                            zb[Qa],Jb=nil,xa[10755]or ic(40310,28550,10755)
                        end
                    elseif Jb<23135 then
                        if Jb>22970 then
                            Cb,gc=Db[31928],Db[4207]-1
                            if gc==-1 then
                                Jb=xa[-6980]or ic(42769,50064,-6980)
                                continue
                            end
                            Jb=xa[3322]or ic(54928,61200,3322)
                        else
                            Xa=fa_[hb];
                            hb+=1;
                            x=Xa[31928]
                            if x==0 then
                                Jb=xa[-22222]or ic(12964,124744,-22222)
                                continue
                            elseif x==1 then
                                Jb=xa[12523]or ic(64165,10495,12523)
                                continue
                            elseif x==2 then
                                Jb=xa[-21190]or ic(30371,111683,-21190)
                                continue
                            end
                            Jb=xa[23700]or ic(39070,31420,23700)
                        end
                    elseif Jb>23199 then
                        Db=fa_[hb];
                        Jb,Aa=xa[28935]or ic(28697,18497,28935),Db[16415]
                    elseif Jb>23135 then
                        gc,lc,Z=zb
                        if Ha(gc)~='function'then
                            Jb=xa[12247]or ic(56798,51338,12247)
                            continue
                        end
                        Jb=xa[5163]or ic(13097,105531,5163)
                    else
                        La=La+yb;
                        F=La
                        if La~=La then
                            Jb=xa[29637]or ic(57493,11474,29637)
                        else
                            Jb=xa[30504]or ic(17904,25925,30504)
                        end
                    end
                elseif Jb>8090 then
                    if Jb>11177 then
                        if Jb>=12624 then
                            if Jb>=12843 then
                                if Jb>13296 then
                                    if(F>=0 and r_>yb)or((F<0 or F~=F)and r_<yb)then
                                        Jb=xa[-32433]or ic(16266,74918,-32433)
                                    else
                                        Jb=xa[-24169]or ic(51457,20878,-24169)
                                    end
                                elseif Jb<=12843 then
                                    r_=r_+F;
                                    Xa=r_
                                    if r_~=r_ then
                                        Jb=xa[1576]or ic(54322,19150,1576)
                                    else
                                        Jb=13432
                                    end
                                else
                                    Db[16415]=143;
                                    hb+=1;
                                    Jb=xa[-1074]or ic(53660,7643,-1074)
                                end
                            elseif Jb<=12624 then
                                hb-=1;
                                Jb,fa_[hb]=xa[-14442]or ic(30920,111767,-14442),{[16415]=64,[31928]=_c(Db[31928],193),[4207]=_c(Db[4207],74),[17288]=0}
                            else
                                r_=r_+F;
                                Xa=r_
                                if r_~=r_ then
                                    Jb=xa[-21679]or ic(24700,6057,-21679)
                                else
                                    Jb=2698
                                end
                            end
                        elseif Jb>=11919 then
                            if Jb>12291 then
                                Z,Jb=gc-1,xa[26708]or ic(47512,104215,26708)
                            elseif Jb>11919 then
                                Cb,Jb,gc=fa_[hb],xa[16949]or ic(2930,67002,16949),nil
                            else
                                Cb,gc=Db[31928],Db[4207];
                                lc=gc-1
                                if lc==-1 then
                                    Jb=xa[-28423]or ic(21961,112703,-28423)
                                    continue
                                else
                                    Jb=xa[3121]or ic(39386,9485,3121)
                                    continue
                                end
                                Jb=57012
                            end
                        elseif Jb<=11428 then
                            if Aa>150 then
                                Jb=xa[-8141]or ic(26744,118130,-8141)
                                continue
                            else
                                Jb=xa[1597]or ic(59181,52659,1597)
                                continue
                            end
                            Jb=xa[30458]or ic(48750,29225,30458)
                        else
                            ba(V[64101],1,gc,Cb,Ka);
                            Jb=xa[30194]or ic(719,118408,30194)
                        end
                    elseif Jb<9226 then
                        if Jb>8707 then
                            if Jb>8807 then
                                Cb=Db[31796];
                                Ka[Db[17288]]=Ka[Db[31928]][Cb];
                                hb+=1;
                                Jb=xa[2307]or ic(2636,116235,2307)
                            else
                                Cb=fb(gc)
                                if Cb~=nil and Cb.__iter~=nil then
                                    Jb=xa[-23164]or ic(4860,125383,-23164)
                                    continue
                                elseif Ha(gc)=='table'then
                                    Jb=xa[30741]or ic(10497,109622,30741)
                                    continue
                                end
                                Jb=xa[-27730]or ic(242,108544,-27730)
                            end
                        elseif Jb>=8532 then
                            if Jb<=8532 then
                                Jb,Ka[Db[31928]]=xa[-24614]or ic(12645,130338,-24614),Ka[Db[4207]]
                            else
                                Cb=fb(gc)
                                if Cb~=nil and Cb.__iter~=nil then
                                    Jb=xa[2106]or ic(28301,78022,2106)
                                    continue
                                elseif Ha(gc)=='table'then
                                    Jb=xa[-789]or ic(14728,29346,-789)
                                    continue
                                end
                                Jb=xa[6211]or ic(62992,31907,6211)
                            end
                        elseif Jb>8162 then
                            Ka[Db[31928]]=Db[17288]==1;
                            hb+=Db[4207];
                            Jb=xa[27582]or ic(61031,8736,27582)
                        else
                            hb+=Db[51281];
                            Jb=xa[-9889]or ic(21235,106172,-9889)
                        end
                    elseif Jb<=10174 then
                        if Jb>=9539 then
                            if Jb<=9539 then
                                hb-=1;
                                fa_[hb],Jb={[16415]=184,[31928]=_c(Db[31928],228),[4207]=_c(Db[4207],122),[17288]=0},xa[24415]or ic(21856,104751,24415)
                            else
                                gc=V[21181];
                                Jb,Sb=xa[6861]or ic(37143,12169,6861),Cb+gc-1
                            end
                        elseif Jb>9226 then
                            Qa,tc=gc(lc,Z);
                            Z=Qa
                            if Z==nil then
                                Jb=2087
                            else
                                Jb=xa[-574]or ic(34942,126343,-574)
                            end
                        else
                            if(yb>=0 and La>r_)or((yb<0 or yb~=yb)and La<r_)then
                                Jb=xa[-24716]or ic(38789,23490,-24716)
                            else
                                Jb=22970
                            end
                        end
                    elseif Jb>10843 then
                        if Aa>12 then
                            Jb=xa[7118]or ic(53363,60467,7118)
                            continue
                        else
                            Jb=xa[15909]or ic(48869,16463,15909)
                            continue
                        end
                        Jb=xa[-22801]or ic(51940,1699,-22801)
                    else
                        Qa,Jb=Qa..L(_c(u_(lc,yb+1),u_(Z,yb%#Z+1))),xa[-10052]or ic(56463,17118,-10052)
                    end
                elseif Jb>=3447 then
                    if Jb>=5630 then
                        if Jb<6273 then
                            if Jb<=5746 then
                                if Jb>5630 then
                                    Z,Jb=La,23651
                                    continue
                                else
                                    jb(tc);
                                    Jb=xa[27429]or ic(64301,54488,27429)
                                end
                            else
                                if Aa>24 then
                                    Jb=xa[22680]or ic(9416,95099,22680)
                                    continue
                                else
                                    Jb=xa[-8575]or ic(58145,8793,-8575)
                                    continue
                                end
                                Jb=xa[16145]or ic(28762,113701,16145)
                            end
                        elseif Jb>6729 then
                            Xa=r_
                            if yb~=yb then
                                Jb=xa[-27974]or ic(30737,8140,-27974)
                            else
                                Jb=2698
                            end
                        elseif Jb>6273 then
                            jb'';
                            Jb=xa[2863]or ic(34770,14083,2863)
                        else
                            if Aa>121 then
                                Jb=xa[21647]or ic(28336,115955,21647)
                                continue
                            else
                                Jb=xa[13603]or ic(13422,74125,13603)
                                continue
                            end
                            Jb=xa[19900]or ic(27299,108268,19900)
                        end
                    elseif Jb>=4459 then
                        if Jb<=5234 then
                            if Jb<=4459 then
                                hb-=1;
                                Jb,fa_[hb]=xa[3743]or ic(53571,7436,3743),{[16415]=50,[31928]=_c(Db[31928],150),[4207]=_c(Db[4207],246),[17288]=0}
                            else
                                hb+=Db[51281];
                                Jb=xa[24888]or ic(52829,538,24888)
                            end
                        else
                            ba(tc,1,La,Cb,Ka);
                            Jb=xa[2528]or ic(24317,103098,2528)
                        end
                    elseif Jb>4198 then
                        Dc[Db[31796]]=Ka[Db[31928]];
                        hb+=1;
                        Jb=xa[24990]or ic(61769,15638,24990)
                    elseif Jb<=3447 then
                        if Aa>93 then
                            Jb=xa[-11779]or ic(27312,98553,-11779)
                            continue
                        else
                            Jb=xa[-27429]or ic(31635,12809,-27429)
                            continue
                        end
                        Jb=xa[-1508]or ic(1311,117080,-1508)
                    else
                        tc,La=gc[42766],Db[42766];
                        La='\252\132\129'..La;
                        r_='';
                        Xa,yb,F,Jb=1,0,#tc-1,xa[4923]or ic(49930,34129,4923)
                    end
                elseif Jb<1311 then
                    if Jb<=401 then
                        if Jb>343 then
                            Cb=ha[Db[4207]+1];
                            Jb,Cb[3][Cb[1]]=xa[-4667]or ic(9927,125568,-4667),Ka[Db[31928]]
                        elseif Jb<=32 then
                            if Jb<=29 then
                                Cb=ha[Db[4207]+1];
                                Ka[Db[31928]],Jb=Cb[3][Cb[1]],xa[18577]or ic(64076,13835,18577)
                            else
                                if(Xa>=0 and yb>F)or((Xa<0 or Xa~=Xa)and yb<F)then
                                    Jb=xa[17497]or ic(38004,129565,17497)
                                else
                                    Jb=31137
                                end
                            end
                        else
                            gc,lc,Z=Vb(gc);
                            Jb=xa[-348]or ic(38812,105519,-348)
                        end
                    elseif Jb<=478 then
                        if Aa>62 then
                            Jb=xa[26525]or ic(53196,33708,26525)
                            continue
                        else
                            Jb=xa[7504]or ic(10747,81647,7504)
                            continue
                        end
                        Jb=xa[-7329]or ic(60023,9776,-7329)
                    else
                        if Aa>86 then
                            Jb=xa[18414]or ic(37644,31522,18414)
                            continue
                        else
                            Jb=xa[-17146]or ic(3848,97977,-17146)
                            continue
                        end
                        Jb=xa[-15504]or ic(47327,29848,-15504)
                    end
                elseif Jb>2568 then
                    if Jb<=2698 then
                        if(F>=0 and r_>yb)or((F<0 or F~=F)and r_<yb)then
                            Jb=xa[4764]or ic(58828,37753,4764)
                        else
                            Jb=xa[-28490]or ic(19701,71424,-28490)
                        end
                    else
                        if Aa>50 then
                            Jb=xa[-14852]or ic(26143,18191,-14852)
                            continue
                        else
                            Jb=xa[1502]or ic(33210,20617,1502)
                            continue
                        end
                        Jb=xa[-23265]or ic(8904,126615,-23265)
                    end
                elseif Jb>2087 then
                    x=yb
                    if F~=F then
                        Jb=xa[-16730]or ic(27776,116009,-16730)
                    else
                        Jb=xa[24398]or ic(34643,52016,24398)
                    end
                elseif Jb>=1329 then
                    if Jb<=1329 then
                        Jb,Ka[Db[31928]]=xa[-457]or ic(16004,127683,-457),Db[31796]
                    else
                        Jb=xa[30953]or ic(47846,12959,30953)
                        continue
                    end
                else
                    Cb,gc=nil,_c(Db[61919],54810);
                    Cb=if gc<32768 then gc else gc-65536;
                    lc=Cb;
                    Z=mb[lc+1];
                    Qa=Z[13636];
                    tc=w_(Qa);
                    Ka[_c(Db[31928],201)]=ka(Z,tc);
                    yb,r_,La,Jb=1,Qa,1,53603
                end
            until Jb==17402
        end
        return function(...)
            local h,W,ia,yc,Nb,t_,M,zc,Ba,P,j;
            P,Nb={},function(pc,J,I)
                P[J]=A(I,5286)-A(pc,47226)
                return P[J]
            end;
            M=P[28360]or Nb(46849,28360,3725)
            repeat
                if M<41286 then
                    if M>22955 then
                        return nb(j,2,ia)
                    elseif M<=18507 then
                        if M>2736 then
                            t_,Ba=j[2],nil;
                            W=t_;
                            Ba=l_(W)=='string'
                            if Ba==false then
                                M=P[-23706]or Nb(60258,-23706,80904)
                                continue
                            end
                            M=P[-21229]or Nb(43557,-21229,56551)
                        else
                            h,zc,yc=g(...),w_(xb[31626]),{[21181]=0,[64101]={}};
                            ba(h,1,xb[26460],0,zc)
                            if xb[26460]<h.n then
                                M=P[1768]or Nb(64929,1768,58214)
                                continue
                            end
                            M=P[16392]or Nb(32178,16392,95144)
                        end
                    else
                        M=P[-3108]or Nb(1233,-3108,59619)
                        continue
                    end
                elseif M<46562 then
                    if M<=41286 then
                        j,ia=_b(Xb(Sa,zc,xb[44916],xb[17508],yc))
                        if j[1]then
                            M=P[13337]or Nb(47806,13337,24998)
                            continue
                        else
                            M=P[11939]or Nb(58037,11939,47036)
                            continue
                        end
                        M=P[-26676]or Nb(23083,-26676,77658)
                    else
                        j,ia=xb[26460]+1,h.n-xb[26460];
                        yc[21181]=ia;
                        ba(h,j,j+ia-1,1,yc[64101]);
                        M=P[-7168]or Nb(21891,-7168,105369)
                    end
                elseif M<=46562 then
                    return jb(t_,0)
                else
                    t_,M=l_(t_),P[3873]or Nb(19966,3873,114624)
                end
            until M==16282
        end
    end
    return ka(pa,la)
end)
local b_;
b_,N={[0]=0},function()
    b_[0]=b_[0]+1
    return{[1]=b_[0],[3]=b_}
end;
Ab=y
return(function()
    return Ab(q(U'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'),{})
end)()(...)
