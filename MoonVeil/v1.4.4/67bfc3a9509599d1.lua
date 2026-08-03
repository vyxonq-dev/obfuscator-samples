-- This script was generated using the MoonVeil Obfuscator v1.4.4 [https://moonveil.cc]

local Dc,B,fd,ib,sc,Vc=pairs,bit32.bxor,getmetatable,type;
local Xa,xc,da,P,Ga,Ub,Ca,S,hc,lc,R,ra,Na,ja,Rc,Tc,Ac,ma,fb,j,T,Aa,r_,l_,zb,fa_,Fa,ia,Z,b_,E,Va,Gb,Bc,Ra,eb,h,Pa
Ra,fa_,xc=(string.char),(string.byte),(bit32 .bxor);
ia=function(Ua,Ob)
    local t_,tc,Nb,ea,aa,hd,m,zc
    tc,aa={},function(_c,Lc,Za)
        tc[Lc]=B(Za,61733)-B(_c,32405)
        return tc[Lc]
    end
    m=tc[-10319]or aa(11436,-10319,128942)
    repeat
        while true do
            if m>35903 then
                if m<=47038 then
                    if m>42848 then
                        if m<=45839 then
                            Nb=ea;
                            if t_~=t_ then
                                m=tc[-26784]or aa(28770,-26784,52952)
                            else
                                m=tc[-10453]or aa(57045,-10453,96319)
                            end
                        else
                            zc='';
                            t_,ea,hd=#Ua-1,0,1
                            m=45517
                        end
                    else
                        ea=ea+hd;
                        Nb=ea;
                        if ea~=ea then
                            m=12550
                        else
                            m=59610
                        end
                    end
                else
                    if(hd>=0 and ea>t_)or((hd<0 or hd~=hd)and ea<t_)then
                        m=tc[15293]or aa(29951,15293,51797)
                    else
                        m=14717
                    end
                end
            elseif m>13633 then
                zc=zc..Ra(xc(fa_(Ua,Nb+1),fa_(Ob,Nb%#Ob+1)))
                m=tc[23020]or aa(4395,23020,3813)
            else
                return zc
            end
        end
    until m==25629
end;
Tc=(select);
Z=(function(...)
    return{[1]={...},[2]=Tc('#',...)}
end);
Ac=((function()
    local function w_(xb,Y,yc)
        if Y>yc then
            return
        end
        return xb[Y],w_(xb,Y+1,yc)
    end
    return w_
end)());
R,Aa=(string.gsub),(string.char);
Gb=(function(p)
    p=R(p,'[^ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=]','')
    return(p:gsub('.',function(U)
        if(U=='=')then
            return''
        end
        local u_,ec='',(('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'):find(U)-1)
        for gd=6,1,-1 do
            u_=u_..(ec%2^gd-ec%2^(gd-1)>0 and'1'or'0')
        end
        return u_;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?',function(Ba)
        if(#Ba~=8)then
            return''
        end
        local ic=0
        for Ma=1,8 do
            ic=ic+(Ba:sub(Ma,Ma)=='1'and 2^(8-Ma)or 0)
        end
        return Aa(ic)
    end))
end);
Rc,S,Ga,ra,r_,lc,Ub,T=string.unpack,string.sub,string.byte,bit32 .lshift,bit32 .rshift,bit32 .band,table.concat,{};
P=(function(sb)
    local oa=T[sb]
    if oa then
        return oa
    end
    local dc,Ta,bc,Wa,o_=ra(1,11),ra(1,5),1,{},''
    while bc<=#sb do
        local id=Ga(sb,bc)
        bc=bc+1
        for La=1,8 do
            local Pb=nil
            if lc(id,1)~=0 then
                if bc<=#sb then
                    Pb=S(sb,bc,bc)
                    bc=bc+1
                end
            else
                if bc+1<=#sb then
                    local X=Rc('>I2',sb,bc)
                    bc=bc+2
                    local qa,Fc=#o_-r_(X,5),lc(X,(Ta-1))+3
                    Pb=S(o_,qa,qa+Fc-1)
                end
            end
            id=r_(id,1)
            if Pb then
                Wa[#Wa+1]=Pb
                o_=S(o_..Pb,-dc)
            end
        end
    end
    local Hc=Ub(Wa)
    T[sb]=Hc
    return Hc
end);
local Vb,Bb,bb,C,Ea,ga,V,N,wc,F,Da,Qc,g,kb,i_,Kc,Mc,Uc,gc,ta,yb,Jb,ac,J,Jc,Ha,Nc,Xc,ob,pa=type,pcall,error,tonumber,assert,select,setmetatable,string.format,string.unpack,string.sub,string.byte,string.char,table.move,table.pack,table.create,table.insert,table.concat,coroutine.create,coroutine.yield,coroutine.resume,coroutine.close,getfenv,bit32 .bor,bit32 .bxor,bit32 .band,bit32 .btest,bit32 .rshift,bit32 .lshift,bit32 .extract,{[18556]={},[27202]={{7,1,true},{6,3,false},{7,0,true},{7,9,true},{9,5,true},{5,8,false},{7,5,false},{5,1,true},{6,0,false},{3,9,false},{9,9,false},{2,9,false},{2,9,false},{3,2,true},{2,9,false},{2,5,true},{3,9,false},{3,6,false},{3,7,false},{3,9,false},{5,7,true},{5,8,false},{3,9,true},{9,3,true},{3,2,true},{3,9,false},{3,2,true},{3,9,false},{3,9,false},{6,2,true},{2,9,false},{2,9,true},{3,5,false},{3,9,false},{3,9,false},{9,10,false},{3,9,false},{6,9,true},{2,8,true},{9,2,true},{5,9,false},{2,7,false},{3,9,false},{9,1,false},{5,2,true},{7,9,true},{7,2,true},{5,2,true},{3,2,false},{9,9,false},{6,3,false},{5,2,false},{5,9,false},{6,9,true},{3,9,false},{6,9,false},{2,5,true},{5,8,false},{6,5,false},{2,9,true},{3,9,true},{6,7,false},{2,9,false},{3,9,false},{9,3,true},{5,8,true},{3,6,false},{7,3,true},{5,1,false},{9,0,true},{9,9,false},{5,8,false},{6,9,false},{3,9,false},{3,2,true},{2,9,true},{9,9,false},{2,7,false},{9,2,false},{2,1,true},{7,10,true},{5,2,true},{3,3,true},{3,9,false},{3,1,false},{9,8,true},{6,10,true},{5,0,false},{3,9,false},{2,7,false},{2,0,true},{2,0,true},{3,9,false},{3,6,false},{2,3,true},{5,7,true},{6,8,false},{3,10,true},{6,3,true},{3,5,false},{7,0,false},{3,5,false},{2,9,false},{5,0,false},{3,2,true},{7,7,false},{6,1,false},{7,5,false},{2,3,true},{7,9,true},{7,0,true},{3,2,true},{6,0,true},{6,3,false},{2,7,false},{2,9,false},{9,1,false},{3,9,false},{2,9,false},{2,3,true},{5,8,false},{9,8,false},{3,9,false},{6,5,true},{6,5,false},{3,10,false},{3,9,false},{6,2,true},{9,2,true},{3,6,false},{3,9,false},{2,9,false},{7,5,true},{2,8,true},{2,9,true},{6,2,true},{3,9,false},{6,7,false},{2,3,true},{3,9,false},{7,7,true},{9,2,false},{2,1,true},{3,6,false},{7,3,true},{7,7,false},{6,8,true},{2,7,false},{7,5,false},{9,8,true},{6,7,false},{9,9,false},{2,0,true},{7,10,true},{2,2,false},{3,9,false},{5,10,true},{2,9,true},{7,3,false},{3,0,true},{5,8,true},{7,9,false},{7,7,false},{7,9,false},{6,3,false},{9,3,true},{3,2,true},{2,9,false},{3,0,true},{2,7,false},{2,8,true},{3,9,false},{9,5,false},{6,0,true},{3,9,false},{7,1,true},{9,8,true},{3,5,false},{2,3,true},{5,5,false},{9,9,true},{9,9,false},{2,1,false},{2,8,false},{3,5,true},{2,10,true},{9,5,false},{5,1,false},{9,5,false},{9,10,true},{7,5,false},{9,9,false},{3,9,false},{9,7,false},{6,1,true},{2,0,true},{7,9,true},{5,1,false},{3,9,false},{2,7,false},{3,9,false},{6,0,false},{5,5,false},{2,9,false},{6,8,false},{2,10,true},{3,9,false},{2,5,false},{7,2,false},{3,7,true},{3,9,false},{3,2,true},{3,0,true},{5,0,true},{2,8,true},{5,1,true},{3,9,false},{3,2,true},{7,9,false},{7,7,false},{6,8,false},{9,0,true},{5,7,false},{3,5,false},{3,7,false},{6,2,true},{3,2,true},{3,10,false},{3,5,true},{3,9,true},{9,9,false},{5,8,true},{5,2,true},{7,4,false},{3,8,false},{2,1,true},{9,2,false},{5,5,true},{3,9,false},{6,10,false},{6,5,true},{6,3,true},{2,3,false},{9,0,false},{7,8,true},{9,3,false},{9,3,true},{2,3,true},{3,5,false},{6,5,false},{9,0,true},{5,1,true},{7,9,true},{3,0,false},{3,9,false},{2,9,true}},[36052]={}}
local _a=(function(Sb)
    local Ia=pa[18556][Sb]
    if Ia then
        return Ia
    end
    local Oa=1
    local function Eb()
        local gb,jc,mb,kc,rb,nc,Tb,Wc,uc,hb,nb,za,cc,ba,y,Db,q,sa,lb,Ib,cd,L,Kb,qc,Fb,cb,D,pb,Lb,Zc,Pc,Mb,pc
        qc,sa={},function(ca,s_,rc)
            qc[s_]=B(ca,3098)-B(rc,29383)
            return qc[s_]
        end
        jc=qc[6537]or sa(98284,6537,44635)
        repeat
            while true do
                if jc<=34427 then
                    if jc>18189 then
                        if jc<=25865 then
                            if jc<=22796 then
                                if jc<=21142 then
                                    if jc>20309 then
                                        if pb then
                                            jc=qc[10759]or sa(89389,10759,6781)
                                            break
                                        else
                                            jc=qc[25257]or sa(56070,25257,15094)
                                            break
                                        end
                                        jc=qc[11422]or sa(30631,11422,23118)
                                    elseif jc>20087 then
                                        jc=qc[6998]or sa(70179,6998,50090)
                                        break
                                    else
                                        Kb=Kb+q;
                                        cc=Kb;
                                        if Kb~=Kb then
                                            jc=7163
                                        else
                                            jc=qc[14272]or sa(41166,14272,7984)
                                        end
                                    end
                                elseif jc<=21766 then
                                    if jc<=21339 then
                                        Zc=Zc+y;
                                        mb=Zc;
                                        if Zc~=Zc then
                                            jc=qc[-21839]or sa(42696,-21839,5136)
                                        else
                                            jc=qc[31152]or sa(111682,31152,37567)
                                        end
                                    else
                                        hb=mb;
                                        za=i_(hb);
                                        Pc,Kb,q=hb,1,1
                                        jc=qc[-30295]or sa(66441,-30295,62833)
                                    end
                                elseif jc<=22193 then
                                    Db=0;
                                    hb,y,mb=1,0,4
                                    jc=qc[-1202]or sa(34149,-1202,27307)
                                else
                                    if Fb then
                                        jc=qc[-6575]or sa(102545,-6575,60639)
                                        break
                                    end
                                    jc=qc[31931]or sa(87219,31931,59302)
                                end
                            elseif jc>24243 then
                                if jc<=25412 then
                                    Ib=J(Mb,133)
                                    jc=qc[-27381]or sa(68461,-27381,16312)
                                    break
                                elseif jc<=25744 then
                                    uc=wc('B',Sb,Oa);
                                    Oa=Oa+1
                                    jc=37305
                                else
                                    if(Zc>=0 and ba>pb)or((Zc<0 or Zc~=Zc)and ba<pb)then
                                        jc=qc[-24550]or sa(72087,-24550,60198)
                                    else
                                        jc=37267
                                    end
                                end
                            elseif jc>23542 then
                                if jc>23862 then
                                    kc=nil;
                                    jc=16108;
                                else
                                    cc=J(nb,133)
                                    jc=qc[-2379]or sa(75731,-2379,10110)
                                    break
                                end
                            elseif jc<=23328 then
                                za=ba;
                                Kb=nil;
                                jc=qc[-23044]or sa(55116,-23044,20782);
                            elseif jc>23424 then
                                Fb=kc;
                                if Fb==0 then
                                    jc=qc[-6235]or sa(60462,-6235,48366)
                                    break
                                else
                                    jc=qc[6625]or sa(73441,6625,11183)
                                    break
                                end
                                jc=qc[-4329]or sa(28695,-4329,27728)
                            else
                                kc=wc('<d',Sb,Oa);
                                Oa=Oa+8
                                jc=qc[-7099]or sa(38517,-7099,30746)
                            end
                        elseif jc>28935 then
                            if jc<=30079 then
                                if jc<=29192 then
                                    if jc<=29041 then
                                        if jc>28986 then
                                            Pc[42102]=ob(Pc[48389],0,16)
                                            jc=qc[-28571]or sa(41259,-28571,18837)
                                        else
                                            za=y;
                                            if mb~=mb then
                                                jc=qc[-23896]or sa(56681,-23896,5728)
                                            else
                                                jc=12201
                                            end
                                        end
                                    else
                                        mb=mb+za;
                                        Kb=mb;
                                        if mb~=mb then
                                            jc=44155
                                        else
                                            jc=qc[23478]or sa(93851,23478,41071)
                                        end
                                    end
                                elseif jc>29418 then
                                    nc=0;
                                    Zc,pb,ba=1,4,0
                                    jc=qc[16219]or sa(71213,16219,20522)
                                else
                                    Fb=Fb+L;
                                    lb=Fb;
                                    if Fb~=Fb then
                                        jc=qc[2763]or sa(100129,2763,36491)
                                    else
                                        jc=62675
                                    end
                                end
                            elseif jc>31189 then
                                if jc<=31427 then
                                    if jc<=31310 then
                                        Lb=Jc(Nc(nb,10),1023);
                                        Pc[18512]=q[Lb+1]
                                        jc=qc[-19805]or sa(83592,-19805,43636)
                                    else
                                        Kb=mb;
                                        if hb~=hb then
                                            jc=44155
                                        else
                                            jc=qc[11655]or sa(49780,11655,19538)
                                        end
                                    end
                                else
                                    cd=J(nc,-2124004751)
                                    jc=qc[7664]or sa(45363,7664,9468)
                                    break
                                end
                            else
                                Lb=Lb+lb;
                                Tb=Lb;
                                if Lb~=Lb then
                                    jc=qc[-12343]or sa(81466,-12343,11491)
                                else
                                    jc=qc[25786]or sa(115363,25786,38280)
                                end
                            end
                        elseif jc<=27219 then
                            if jc>26505 then
                                if jc<=26582 then
                                    Pc=wc('B',Sb,Oa);
                                    Oa=Oa+1
                                    jc=42194
                                else
                                    cc=nil;
                                    jc=55141;
                                end
                            else
                                nc=cd;
                                ba=i_(nc);
                                pb=false;
                                y,Db,Zc=1,nc,1
                                jc=49956
                            end
                        elseif jc<=27934 then
                            if jc>27835 then
                                Zc=J(Db,-2124004751)
                                jc=3839
                                break
                            else
                                D=Tb;
                                kc=ac(kc,Xc(Jc(D,127),lb*7))
                                if not Ha(D,128)then
                                    jc=qc[-25652]or sa(69567,-25652,16573)
                                    break
                                end
                                jc=qc[19212]or sa(93297,19212,40705)
                            end
                        else
                            D=J(pc,133)
                            jc=qc[-29782]or sa(73648,-29782,21658)
                            break
                        end
                    elseif jc>9964 then
                        if jc<=14025 then
                            if jc<=11843 then
                                if jc<=11333 then
                                    if jc>11119 then
                                        pc=wc('B',Sb,Oa);
                                        Oa=Oa+1
                                        jc=28134
                                    else
                                        mb=mb+za;
                                        Kb=mb;
                                        if mb~=mb then
                                            jc=qc[19344]or sa(14884,19344,21808)
                                        else
                                            jc=55139
                                        end
                                    end
                                elseif jc>11547 then
                                    Kb=J(Pc,-1705336966)
                                    jc=qc[-25658]or sa(58891,-25658,14617)
                                    break
                                else
                                    nb=nil;
                                    jc=23336;
                                end
                            elseif jc<=12523 then
                                if jc<=12282 then
                                    if(hb>=0 and y>mb)or((hb<0 or hb~=hb)and y<mb)then
                                        jc=qc[-3872]or sa(50695,-3872,12182)
                                    else
                                        jc=7987
                                    end
                                else
                                    uc=gb;
                                    Wc=nil;
                                    jc=qc[22178]or sa(67134,22178,18283);
                                end
                            else
                                za[cc]=Eb()
                                jc=qc[-1510]or sa(26404,-1510,28570)
                            end
                        elseif jc<=16206 then
                            if jc>15630 then
                                if jc>16100 then
                                    Fb=0;
                                    Lb,L,lb=0,4,1
                                    jc=qc[13372]or sa(90856,13372,1736)
                                else
                                    if(q>=0 and Kb>Pc)or((q<0 or q~=q)and Kb<Pc)then
                                        jc=qc[-119]or sa(67474,-119,40266)
                                    else
                                        jc=13006
                                    end
                                end
                            elseif jc>15316 then
                                if jc<=15507 then
                                    q=Pc;
                                    if q==2 then
                                        jc=qc[5936]or sa(71817,5936,597)
                                        break
                                    elseif q==0 then
                                        jc=qc[8168]or sa(65577,8168,7582)
                                        break
                                    elseif q==5 then
                                        jc=qc[7424]or sa(90389,7424,49291)
                                        break
                                    elseif q==6 then
                                        jc=qc[9849]or sa(29522,9849,8339)
                                        break
                                    end
                                    jc=qc[11919]or sa(50040,11919,56609)
                                else
                                    Lb[30236]=Jc(Nc(Pc,8),255)
                                    Lb[25742]=Jc(Nc(Pc,16),255)
                                    Lb[61663]=Jc(Nc(Pc,24),255)
                                    jc=qc[29267]or sa(31185,29267,27888)
                                end
                            else
                                mb=y;
                                nc=ac(nc,Xc(Jc(mb,127),Db*7))
                                if not Ha(mb,128)then
                                    jc=qc[9309]or sa(112897,9309,43483)
                                    break
                                end
                                jc=qc[16186]or sa(100488,16186,63701)
                            end
                        elseif jc>17647 then
                            Kb=mb;
                            if hb~=hb then
                                jc=3655
                            else
                                jc=qc[31306]or sa(99472,31306,50144)
                            end
                        else
                            Zc=nil;
                            jc=qc[-20881]or sa(53909,-20881,64006);
                        end
                    elseif jc<=5904 then
                        if jc>3427 then
                            if jc<=4402 then
                                if jc<=3747 then
                                    mb,za,hb=1,1,nc
                                    jc=31422
                                else
                                    Db=Zc;
                                    y=i_(Db);
                                    za,mb,hb=1,1,Db
                                    jc=17891
                                end
                            elseif jc<=5058 then
                                nb=Z''
                                jc=8345
                                break
                            else
                                nb=Pc[48389];
                                kc=Nc(nb,30);
                                Fb=Jc(Nc(nb,20),1023);
                                Pc[42102]=q[Fb+1]
                                Pc[29441]=kc
                                if kc==2 then
                                    jc=qc[18419]or sa(37173,18419,20887)
                                    break
                                elseif kc==3 then
                                    jc=qc[920]or sa(93093,920,1988)
                                    break
                                end
                                jc=qc[12957]or sa(60234,12957,1974)
                            end
                        elseif jc<=1478 then
                            y=J(mb,133)
                            jc=14936
                            break
                        else
                            Pc=nil;
                            jc=49222;
                        end
                    elseif jc>7761 then
                        if jc<=8521 then
                            if jc<=8130 then
                                if jc>8023 then
                                    y[Kb]=cc
                                    jc=qc[16776]or sa(53466,16776,50095)
                                else
                                    Kb=nil;
                                    jc=26562;
                                end
                            else
                                cc=Ac(nb[1],1,nb[2])
                                jc=qc[-7175]or sa(69417,-7175,37232)
                            end
                        else
                            nb=Z(Lb)
                            jc=8345
                            break
                        end
                    elseif jc>7001 then
                        if jc>7180 then
                            jc=qc[17159]or sa(26587,17159,8893)
                            break
                        else
                            return{[3620]=ba,[59449]=za,[24517]=cb,[3526]=rb,[964]=uc,[26939]=Mb}
                        end
                    elseif jc>6823 then
                        mb=J(hb,-2124004751)
                        jc=qc[-29783]or sa(76098,-29783,41746)
                        break
                    else
                        q=za;
                        if Kb~=Kb then
                            jc=qc[31003]or sa(67741,31003,39815)
                        else
                            jc=37884
                        end
                    end
                elseif jc<=48077 then
                    if jc<=40840 then
                        if jc<=37663 then
                            if jc<=36690 then
                                if jc>36081 then
                                    if jc<=36514 then
                                        Lb=lb
                                        jc=qc[29024]or sa(19362,29024,21277)
                                        break
                                    elseif jc<=36589 then
                                        hb=nil;
                                        jc=23137;
                                    else
                                        nb=Z(J(kc,-2124004751))
                                        jc=41925
                                        break
                                    end
                                else
                                    cc=Kb;
                                    if Pc~=Pc then
                                        jc=qc[14167]or sa(49733,14167,49315)
                                    else
                                        jc=16093
                                    end
                                end
                            elseif jc<=37038 then
                                if jc<=36822 then
                                    if jc>36725 then
                                        nb=kc
                                        jc=qc[18393]or sa(77868,18393,1945)
                                        break
                                    else
                                        Pc[42102]=ob(Pc[48389],0,1)==1
                                        Pc[1977]=ob(Pc[48389],31,1)==1
                                        jc=qc[-31217]or sa(82296,-31217,43332)
                                    end
                                elseif jc<=36919 then
                                    if(za>=0 and mb>hb)or((za<0 or za~=za)and mb<hb)then
                                        jc=qc[-31842]or sa(70400,-31842,88)
                                    else
                                        jc=41857
                                    end
                                else
                                    Pc=Kb;
                                    Db=ac(Db,Xc(Jc(Pc,127),za*7))
                                    if not Ha(Pc,128)then
                                        jc=qc[21752]or sa(54340,21752,64406)
                                        break
                                    end
                                    jc=qc[21146]or sa(84307,21146,56810)
                                end
                            elseif jc>37326 then
                                rb=Wc;
                                cb='';
                                cd=nil;
                                jc=qc[22783]or sa(80835,22783,46702);
                            elseif jc<=37286 then
                                y=nil;
                                jc=qc[-7521]or sa(79164,-7521,63413);
                            else
                                gb=J(uc,133)
                                jc=12364
                                break
                            end
                        elseif jc>39193 then
                            if jc>40480 then
                                if jc>40643 then
                                    Tb=nil;
                                    jc=qc[30881]or sa(60522,30881,30170);
                                else
                                    Pc=Kb;
                                    q=Jc(Pc,255);
                                    cc=pa[27202][q+1];
                                    nb=cc[1];
                                    kc=cc[2];
                                    Fb=cc[3];
                                    Lb={[25742]=0,[1977]=0,[4666]=0,[50198]=0,[59670]=0,[29441]=0,[61663]=0,[31415]=kc,[18512]=0,[1442]=nil,[24532]=q,[48389]=0,[42102]=0,[30236]=0,[32401]=0};
                                    Kc(za,Lb)
                                    if nb==7 then
                                        jc=qc[-6710]or sa(73095,-6710,3847)
                                        break
                                    elseif nb==2 then
                                        jc=qc[30063]or sa(110907,30063,33216)
                                        break
                                    elseif nb==3 then
                                        jc=qc[-14927]or sa(66280,-14927,41153)
                                        break
                                    end
                                    jc=22420
                                end
                            else
                                cc=nil
                                jc=qc[-1432]or sa(20096,-1432,20953)
                            end
                        elseif jc<=38227 then
                            if jc<=37868 then
                                L=Jc(Nc(Pc,8),16777215);
                                lb=nil;
                                Tb=L;
                                lb=if Tb<8388608 then Tb else Tb-16777216
                                Lb[32401]=lb
                                jc=qc[-20159]or sa(64856,-20159,60265)
                            else
                                if(Pc>=0 and za>Kb)or((Pc<0 or Pc~=Pc)and za<Kb)then
                                    jc=qc[8954]or sa(14760,8954,26796)
                                else
                                    jc=qc[15493]or sa(79878,15493,48886)
                                end
                            end
                        elseif jc<=38587 then
                            y=y+hb;
                            za=y;
                            if y~=y then
                                jc=qc[-28674]or sa(86033,-28674,40440)
                            else
                                jc=12201
                            end
                        else
                            Ib=nil;
                            jc=49515;
                        end
                    elseif jc>44016 then
                        if jc<=46128 then
                            if jc<=44786 then
                                if jc>44380 then
                                    if jc<=44493 then
                                        lb=wc('<I4',Sb,Oa);
                                        Oa=Oa+4
                                        jc=qc[9873]or sa(101243,9873,52722)
                                    else
                                        Pc[42102]=q[Pc[4666]+1]
                                        jc=qc[11258]or sa(49405,11258,10703)
                                    end
                                else
                                    mb=nil;
                                    jc=42494;
                                end
                            else
                                mb=wc('B',Sb,Oa);
                                Oa=Oa+1
                                jc=qc[8034]or sa(22012,8034,10880)
                            end
                        elseif jc<=47470 then
                            Pc=wc('<I4',Sb,Oa);
                            Oa=Oa+4
                            jc=qc[-6994]or sa(52957,-6994,59203)
                        elseif jc<=47642 then
                            if jc>47557 then
                                Mb=Ib;
                                gb=nil;
                                jc=25636;
                            else
                                Lb=nil;
                                jc=qc[26860]or sa(64519,26860,13870);
                            end
                        else
                            nb=Z(nil);
                            jc=qc[-12078]or sa(63893,-12078,60126);
                        end
                    elseif jc>42326 then
                        if jc>43028 then
                            if jc<=43565 then
                                lb=Fb;
                                if Lb~=Lb then
                                    jc=qc[-19138]or sa(38830,-19138,32258)
                                else
                                    jc=qc[-20622]or sa(117397,-20622,41851)
                                end
                            else
                                L=Fb;
                                lb=wc('c'..L,Sb,Oa);
                                Oa=Oa+L
                                jc=36365
                            end
                        elseif jc<=42491 then
                            kc=0;
                            Lb,L,Fb=4,1,0
                            jc=43302
                        else
                            hb=0;
                            za,Kb,Pc=0,4,1
                            jc=qc[24247]or sa(28008,24247,13741)
                        end
                    elseif jc>41859 then
                        if jc<=42045 then
                            if jc>41955 then
                                nb=Z(nil);
                                jc=42488;
                            else
                                cc=Ac(nb[1],1,nb[2])
                                jc=qc[21079]or sa(62169,21079,44416)
                            end
                        elseif jc<=42135 then
                            Wc=J(rb,133)
                            jc=37407
                            break
                        else
                            Kb=J(Pc,133)
                            jc=qc[30809]or sa(96559,30809,38488)
                            break
                        end
                    elseif jc<=41488 then
                        lb=L;
                        Lb[48389]=lb;
                        Kc(za,{})
                        jc=qc[27979]or sa(88334,27979,58123)
                    else
                        Pc,q=ba[Kb],y;
                        cc=Pc[31415];
                        if cc==2 then
                            jc=qc[-23562]or sa(83441,-23562,4118)
                            break
                        elseif cc==1 then
                            jc=qc[-9903]or sa(37597,-9903,32168)
                            break
                        elseif cc==4 then
                            jc=qc[-10995]or sa(98870,-10995,41777)
                            break
                        elseif cc==3 then
                            jc=qc[-13668]or sa(44229,-13668,23993)
                            break
                        elseif cc==7 then
                            jc=qc[-4118]or sa(87711,-4118,56936)
                            break
                        elseif cc==0 then
                            jc=qc[10389]or sa(62255,10389,39803)
                            break
                        end
                        jc=qc[8726]or sa(75264,8726,51964)
                    end
                elseif jc<=55972 then
                    if jc>52560 then
                        if jc>54730 then
                            if jc>55297 then
                                if jc<=55721 then
                                    D=wc('B',Sb,Oa);
                                    Oa=Oa+1
                                    jc=qc[12169]or sa(91173,12169,53799)
                                else
                                    jc=qc[19729]or sa(29433,19729,29168)
                                    break
                                end
                            elseif jc>55086 then
                                if jc<=55181 then
                                    if jc>55140 then
                                        nb=wc('B',Sb,Oa);
                                        Oa=Oa+1
                                        jc=23799
                                    else
                                        if(za>=0 and mb>hb)or((za<0 or za~=za)and mb<hb)then
                                            jc=3655
                                        else
                                            jc=2541
                                        end
                                    end
                                else
                                    if(y>=0 and Zc>Db)or((y<0 or y~=y)and Zc<Db)then
                                        jc=17403
                                    else
                                        jc=20755
                                    end
                                end
                            else
                                nb=cc;
                                hb=ac(hb,Xc(Jc(nb,127),q*7))
                                if not Ha(nb,128)then
                                    jc=qc[13355]or sa(16769,13355,17337)
                                    break
                                end
                                jc=qc[26414]or sa(76037,26414,9767)
                            end
                        elseif jc<=53879 then
                            if jc>53429 then
                                jc=qc[27143]or sa(79844,27143,57288)
                                break
                            else
                                za=za+Pc;
                                q=za;
                                if za~=za then
                                    jc=qc[-24029]or sa(9749,-24029,31759)
                                else
                                    jc=37884
                                end
                            end
                        elseif jc>54330 then
                            rb=wc('B',Sb,Oa);
                            Oa=Oa+1
                            jc=qc[-22076]or sa(106183,-22076,40006)
                        else
                            kc=J(Fb,-2124004751)
                            jc=23513
                            break
                        end
                    elseif jc>50390 then
                        if jc>51407 then
                            if jc>51924 then
                                Pc=J(q,133)
                                jc=qc[30876]or sa(47220,30876,2803)
                                break
                            else
                                Lb[30236]=Jc(Nc(Pc,8),255)
                                L=Jc(Nc(Pc,16),65535)
                                Lb[50198]=L
                                lb=nil
                                Tb=L
                                lb=if Tb<32768 then Tb else Tb-65536
                                Lb[4666]=lb
                                jc=qc[-15135]or sa(24830,-15135,26519)
                            end
                        elseif jc<=51062 then
                            if jc>50971 then
                                Tb=J(D,133)
                                jc=qc[-18009]or sa(75883,-18009,50432)
                                break
                            else
                                cc=nb
                                jc=qc[6735]or sa(22317,6735,18812)
                            end
                        else
                            L=J(lb,-1705336966)
                            jc=41119
                            break
                        end
                    elseif jc<=49373 then
                        if jc>48702 then
                            q=wc('B',Sb,Oa);
                            Oa=Oa+1
                            jc=qc[20762]or sa(72196,20762,14423)
                        else
                            Pc[42102]=q[Pc[32401]+1]
                            jc=qc[-24903]or sa(57029,-24903,5063)
                        end
                    elseif jc>49821 then
                        if jc>49974 then
                            hb=Fb
                            jc=qc[-32724]or sa(81108,-32724,13487)
                            break
                        else
                            mb=Zc;
                            if Db~=Db then
                                jc=qc[-15830]or sa(18467,-15830,29433)
                            else
                                jc=55264
                            end
                        end
                    else
                        Mb=wc('B',Sb,Oa);
                        Oa=Oa+1
                        jc=qc[-26579]or sa(67732,-26579,53542)
                    end
                elseif jc<=61223 then
                    if jc>59183 then
                        if jc<=59878 then
                            if jc<=59379 then
                                if(lb>=0 and Lb>L)or((lb<0 or lb~=lb)and Lb<L)then
                                    jc=qc[-18155]or sa(116208,-18155,34601)
                                else
                                    jc=57043
                                end
                            else
                                pb=false
                                jc=qc[-3309]or sa(31076,-3309,20621)
                            end
                        elseif jc<=60377 then
                            pb=hb
                            jc=qc[26881]or sa(59245,26881,60036)
                        else
                            pc=D;
                            Fb=ac(Fb,Xc(Jc(pc,127),Tb*7))
                            if not Ha(pc,128)then
                                jc=qc[-18283]or sa(114055,-18283,48671)
                                break
                            end
                            jc=qc[3200]or sa(87716,3200,37238)
                        end
                    elseif jc>58256 then
                        if jc>58863 then
                            Pc[42102]=q[Pc[48389]+1]
                            jc=qc[-25160]or sa(45388,-25160,14768)
                        else
                            jc=qc[-17023]or sa(87129,-17023,63104)
                            break
                        end
                    else
                        D=nil;
                        jc=11143;
                    end
                elseif jc>63602 then
                    if jc<=64498 then
                        if jc>64177 then
                            Tb=Lb;
                            if L~=L then
                                jc=qc[-17199]or sa(118639,-17199,40382)
                            else
                                jc=qc[25000]or sa(79967,25000,15900)
                            end
                        else
                            ba=ba+Zc;
                            Db=ba;
                            if ba~=ba then
                                jc=qc[30492]or sa(77204,30492,55077)
                            else
                                jc=qc[15377]or sa(55902,15377,911)
                            end
                        end
                    else
                        L=nil;
                        jc=qc[298]or sa(100004,298,44605);
                    end
                elseif jc<=62707 then
                    if jc>62407 then
                        if(L>=0 and Fb>Lb)or((L<0 or L~=L)and Fb<Lb)then
                            jc=qc[-17254]or sa(69060,-17254,40)
                        else
                            jc=qc[-7777]or sa(52219,-7777,23114)
                        end
                    else
                        Lb=Jc(Nc(nb,10),1023);
                        L=Jc(Nc(nb,0),1023);
                        Pc[18512]=q[Lb+1]
                        Pc[59670]=q[L+1]
                        jc=qc[-19178]or sa(74138,-19178,51558)
                    end
                else
                    Db=ba;
                    if pb~=pb then
                        jc=qc[-7189]or sa(44329,-7189,22336)
                    else
                        jc=25852
                    end
                end
            end
        until jc==59106
    end
    local ab=Eb()
    pa[18556][Sb]=ab
    return ab
end)
local db=(function(M,dd)
    M=_a(M)
    local H,_d=M,Jb()
    local function x(Wb,Rb)
        local function ya(...)
            return{[28398]=ga('#',...),[64635]={...}}
        end
        local function _b(A,Zb,Q)
            local Yb,vb,Yc
            Yb,Yc={},function(Xb,oc,Hb)
                Yb[Xb]=B(oc,57712)-B(Hb,57999)
                return Yb[Xb]
            end
            vb=Yb[27879]or Yc(27879,109297,38323)
            repeat
                while true do
                    if vb>37362 then
                        if vb<=50801 then
                            return A[Zb],_b(A,Zb+1,Q)
                        else
                            if Zb>Q then
                                vb=Yb[2804]or Yc(2804,7814,13710)
                                break
                            end
                            vb=47262
                        end
                    else
                        return
                    end
                end
            until vb==37265
        end
        local function ub(I,fc,O,Ka)
            local W,va,la,a_,e_,Gc,Qa,Cb,ed,Ja,Ic,n_,c,wb,G,Qb,wa,ka,Ec,xa,jb,Sc,f_,d_
            xa,Ec={},function(z,tb,ua)
                xa[tb]=B(ua,42932)-B(z,9227)
                return xa[tb]
            end
            la=xa[-24283]or Ec(46286,-24283,1669)
            repeat
                while true do
                    if la<=31239 then
                        if la>14473 then
                            if la<=22856 then
                                if la<=18156 then
                                    if la>15588 then
                                        if la>16346 then
                                            if la<=16748 then
                                                return _b(I,Cb,Cb+ka-1)
                                            else
                                                Gc,W=f_(Ic,ka);
                                                ka=Gc;
                                                if ka==nil then
                                                    la=xa[-30479]or Ec(6692,-30479,63202)
                                                else
                                                    la=xa[11680]or Ec(21090,11680,6336)
                                                end
                                            end
                                        elseif la>15945 then
                                            if Sc>12 then
                                                la=xa[17121]or Ec(1845,17121,3366)
                                                break
                                            else
                                                la=xa[17077]or Ec(59057,17077,16655)
                                                break
                                            end
                                            la=xa[29527]or Ec(31196,29527,55114)
                                        else
                                            W,e_=f_[59670],c[59670];
                                            e_='C\199x*j'..e_
                                            wa=''
                                            a_,jb,ed=#W-1,1,0
                                            la=13772
                                        end
                                    elseif la>14982 then
                                        if la<=15212 then
                                            Cb=fd(f_)
                                            if Cb~=nil and Cb.__iter~=nil then
                                                la=xa[-13032]or Ec(60661,-13032,19950)
                                                break
                                            elseif ib(f_)==ia('9\154/\151(','M\251')then
                                                la=xa[27373]or Ec(20169,27373,21658)
                                                break
                                            end
                                            la=xa[-24409]or Ec(41458,-24409,8036)
                                        elseif la>15318 then
                                            g(W[64635],1,e_,Cb,I)
                                            la=xa[-28626]or Ec(54318,-28626,107768)
                                        else
                                            Gc,W=f_[18512],c[18512];
                                            W='C\199x*j'..W
                                            e_=''
                                            ed,a_,wa=#Gc-1,1,0
                                            la=6416
                                        end
                                    elseif la>14638 then
                                        Cb=fd(f_)
                                        if Cb~=nil and Cb.__iter~=nil then
                                            la=xa[-19893]or Ec(37979,-19893,17972)
                                            break
                                        elseif ib(f_)==ia('~\179h\190o','\n\210')then
                                            la=xa[30245]or Ec(65364,30245,126913)
                                            break
                                        end
                                        la=xa[-15414]or Ec(30639,-15414,12746)
                                    else
                                        Cb=c[30236];
                                        f_=c[42102];
                                        Qa=Cb+6
                                        Ic=I[Cb]
                                        ka=nil
                                        Gc=Ic
                                        ka=Vb(Gc)=='function'
                                        if ka then
                                            la=xa[7465]or Ec(35787,7465,32183)
                                            break
                                        else
                                            la=xa[-28907]or Ec(22508,-28907,3481)
                                            break
                                        end
                                        la=xa[-22418]or Ec(57390,-22418,28920)
                                    end
                                elseif la<=20081 then
                                    if la<=18547 then
                                        if la>18265 then
                                            I[c[30236]]=c[61663]==1
                                            d_+=c[25742]
                                            la=xa[8395]or Ec(19985,8395,56053)
                                        elseif la>18211 then
                                            if Sc>234 then
                                                la=xa[28692]or Ec(1068,28692,38153)
                                                break
                                            else
                                                la=xa[5957]or Ec(62714,5957,124811)
                                                break
                                            end
                                            la=xa[7232]or Ec(20110,7232,55832)
                                        else
                                            if(a_>=0 and wa>ed)or((a_<0 or a_~=a_)and wa<ed)then
                                                la=xa[-31792]or Ec(64599,-31792,79556)
                                            else
                                                la=37941
                                            end
                                        end
                                    elseif la<=18830 then
                                        if la<=18700 then
                                            if W[1]>=c[30236]then
                                                la=xa[-15528]or Ec(2747,-15528,110794)
                                                break
                                            end
                                            la=xa[-23770]or Ec(23809,-23770,7248)
                                        else
                                            d_-=1
                                            O[d_]={[24532]=16,[30236]=J(c[30236],115),[25742]=J(c[25742],125),[61663]=0}
                                            la=xa[17538]or Ec(17294,17538,56600)
                                        end
                                    else
                                        ed=W;
                                        if e_~=e_ then
                                            la=xa[-29778]or Ec(27475,-29778,27172)
                                        else
                                            la=xa[-27989]or Ec(7837,-27989,26715)
                                        end
                                    end
                                elseif la<=21615 then
                                    if la<=21025 then
                                        if la>20934 then
                                            if la>20984 then
                                                f_=Ka[28398]
                                                Qa=Cb+f_-1
                                                la=xa[-29638]or Ec(26263,-29638,32226)
                                            else
                                                ka=ka+W;
                                                e_=ka;
                                                if ka~=ka then
                                                    la=xa[-8535]or Ec(44705,-8535,14949)
                                                else
                                                    la=xa[11726]or Ec(2225,11726,13647)
                                                end
                                            end
                                        else
                                            a_=e_;
                                            if wa~=wa then
                                                la=xa[8165]or Ec(2482,8165,59220)
                                            else
                                                la=xa[-13727]or Ec(600,-13727,23633)
                                            end
                                        end
                                    else
                                        Cb=nil;
                                        f_=I[c[30236]];
                                        Cb=Vb(f_)=='function'
                                        if not Cb then
                                            la=xa[31717]or Ec(1749,31717,37366)
                                            break
                                        end
                                        la=xa[-26759]or Ec(61904,-26759,94761)
                                    end
                                elseif la<=22796 then
                                    if(jb>=0 and ed>a_)or((jb<0 or jb~=jb)and ed<a_)then
                                        la=xa[23926]or Ec(3574,23926,107393)
                                    else
                                        la=8871
                                    end
                                else
                                    d_-=1
                                    O[d_]={[24532]=139,[30236]=J(c[30236],167),[25742]=J(c[25742],246),[61663]=0}
                                    la=xa[-11081]or Ec(61498,-11081,16620)
                                end
                            elseif la>28050 then
                                if la<=29623 then
                                    if la>28990 then
                                        if la<=29472 then
                                            Gc,W=f_(Ic,ka);
                                            ka=Gc;
                                            if ka==nil then
                                                la=43673
                                            else
                                                la=xa[-2000]or Ec(53093,-2000,91419)
                                            end
                                        else
                                            f_,Ic,ka=Dc(f_)
                                            la=xa[30794]or Ec(55521,30794,116939)
                                        end
                                    elseif la>28508 then
                                        ka=Qa-Cb+1
                                        la=xa[28131]or Ec(39759,28131,22774)
                                    else
                                        Cb=O[d_];
                                        f_=nil;
                                        la=xa[9472]or Ec(38098,9472,80088);
                                    end
                                elseif la>30129 then
                                    if la<=30641 then
                                        ka,Gc=f_[42102],c[42102];
                                        Gc='C\199x*j'..Gc
                                        W=''
                                        wa,ed,e_=#ka-1,1,0
                                        la=xa[26145]or Ec(20552,26145,114932)
                                    else
                                        d_+=1
                                        la=xa[21976]or Ec(19835,21976,56099)
                                    end
                                elseif la<=29788 then
                                    if la<=29696 then
                                        Cb[42102]=f_
                                        c[24532]=230
                                        la=xa[31685]or Ec(36476,31685,6698)
                                    else
                                        Cb=nil;
                                        f_=J(c[50198],43793);
                                        Cb=if f_<32768 then f_ else f_-65536
                                        Ic=Cb
                                        I[J(c[30236],217)]=Ic
                                        la=xa[-11485]or Ec(47760,-11485,5750)
                                    end
                                else
                                    e_=e_+ed;
                                    a_=e_;
                                    if e_~=e_ then
                                        la=xa[-25995]or Ec(34529,-25995,4517)
                                    else
                                        la=xa[14940]or Ec(43390,14940,115891)
                                    end
                                end
                            elseif la>26635 then
                                if la>27591 then
                                    if la<=27798 then
                                        if la<=27735 then
                                            I[Cb+2]=I[Cb+3]
                                            d_+=c[4666]
                                            la=xa[-6480]or Ec(47186,-6480,2100)
                                        else
                                            n_=jb[25742];
                                            Ja=wb[n_];
                                            if Ja==nil then
                                                la=xa[25608]or Ec(55459,25608,114307)
                                                break
                                            end
                                            la=7295
                                        end
                                    else
                                        f_,Ic,ka=Dc(f_)
                                        la=xa[-4865]or Ec(48300,-4865,31797)
                                    end
                                else
                                    Cb=c[30236];
                                    f_=c[25742]-1;
                                    if f_==-1 then
                                        la=xa[-1895]or Ec(25311,-1895,16213)
                                        break
                                    end
                                    la=xa[21943]or Ec(35922,21943,124839)
                                end
                            elseif la>25998 then
                                if la<=26495 then
                                    if(W>=0 and ka>Gc)or((W<0 or W~=W)and ka<Gc)then
                                        la=xa[-30488]or Ec(37846,-30488,27824)
                                    else
                                        la=xa[9984]or Ec(49910,9984,76249)
                                    end
                                elseif la>26601 then
                                    if la<=26618 then
                                        d_-=1
                                        O[d_]={[24532]=25,[30236]=J(c[30236],157),[25742]=J(c[25742],48),[61663]=0}
                                        la=xa[-22926]or Ec(31889,-22926,52341)
                                    else
                                        if Sc>244 then
                                            la=xa[2713]or Ec(53715,2713,91947)
                                            break
                                        else
                                            la=xa[15827]or Ec(1720,15827,52816)
                                            break
                                        end
                                        la=xa[-823]or Ec(41661,-823,15977)
                                    end
                                else
                                    if Sc>231 then
                                        la=xa[-7364]or Ec(14389,-7364,9203)
                                        break
                                    else
                                        la=xa[19120]or Ec(17119,19120,104192)
                                        break
                                    end
                                    la=xa[18549]or Ec(33209,18549,8045)
                                end
                            elseif la>25005 then
                                d_+=1
                                la=xa[-10343]or Ec(9545,-10343,46045)
                            else
                                d_-=1
                                O[d_]={[24532]=216,[30236]=J(c[30236],41),[25742]=J(c[25742],90),[61663]=0}
                                la=xa[9405]or Ec(41246,9405,16264)
                            end
                        elseif la<=7899 then
                            if la>4899 then
                                if la<=6415 then
                                    if la<=5358 then
                                        if la<=5069 then
                                            if la<=4933 then
                                                if not G then
                                                    la=xa[10536]or Ec(53647,10536,23785)
                                                    break
                                                end
                                                la=xa[14757]or Ec(8794,14757,2091)
                                            else
                                                bb''
                                                la=xa[32652]or Ec(22751,32652,121634)
                                            end
                                        elseif la<=5205 then
                                            if Sc>200 then
                                                la=xa[-20734]or Ec(60364,-20734,99663)
                                                break
                                            else
                                                la=xa[9105]or Ec(37204,9105,28674)
                                                break
                                            end
                                            la=xa[-22651]or Ec(35329,-22651,26245)
                                        else
                                            a_={[3]=I[wa[25742]],[1]=3};
                                            a_[2]=a_
                                            Ic[e_]=a_
                                            la=xa[-18037]or Ec(28584,-18037,14899)
                                        end
                                    elseif la>5936 then
                                        d_+=c[4666]
                                        la=xa[-14110]or Ec(51093,-14110,20849)
                                    else
                                        if(ed>=0 and e_>wa)or((ed<0 or ed~=ed)and e_<wa)then
                                            la=xa[-11698]or Ec(47416,-11698,106469)
                                        else
                                            la=xa[12107]or Ec(14266,12107,39919)
                                        end
                                    end
                                elseif la>7208 then
                                    if la>7409 then
                                        if la>7570 then
                                            bb(e_)
                                            la=xa[19863]or Ec(9750,19863,47095)
                                        else
                                            I[c[30236]]=Ic[c[18512]][c[59670]]
                                            la=xa[-18664]or Ec(37032,-18664,117083)
                                        end
                                    elseif la>7301 then
                                        Ja={[1]=n_,[2]=I}
                                        wb[n_]=Ja
                                        la=xa[26108]or Ec(53706,26108,112116)
                                    elseif la>7296 then
                                        if Sc>106 then
                                            la=xa[-31928]or Ec(56841,-31928,103747)
                                            break
                                        else
                                            la=xa[18169]or Ec(62356,18169,78854)
                                            break
                                        end
                                        la=xa[-13072]or Ec(44212,-13072,15442)
                                    else
                                        W[a_]=Ja
                                        la=xa[-27210]or Ec(9984,-27210,57259)
                                    end
                                elseif la>6874 then
                                    if la>7103 then
                                        d_-=1
                                        O[d_]={[24532]=28,[30236]=J(c[30236],252),[25742]=J(c[25742],145),[61663]=0}
                                        la=xa[-18714]or Ec(47488,-18714,5894)
                                    else
                                        d_+=c[4666]
                                        la=xa[-23667]or Ec(57289,-23667,108893)
                                    end
                                else
                                    jb=wa;
                                    if ed~=ed then
                                        la=xa[-260]or Ec(53457,-260,23384)
                                    else
                                        la=xa[-19050]or Ec(13617,-19050,26621)
                                    end
                                end
                            elseif la>3131 then
                                if la<=4101 then
                                    if la>3724 then
                                        jb=O[d_];
                                        d_+=1
                                        Qb=jb[30236]
                                        if Qb==0 then
                                            la=xa[16320]or Ec(17138,16320,109860)
                                            break
                                        elseif Qb==1 then
                                            la=xa[-3409]or Ec(31286,-3409,27935)
                                            break
                                        elseif Qb==2 then
                                            la=xa[30903]or Ec(58199,30903,23823)
                                            break
                                        end
                                        la=xa[-11680]or Ec(3779,-11680,14440)
                                    elseif la>3541 then
                                        if e_==-2 then
                                            la=xa[-2076]or Ec(25958,-2076,31591)
                                            break
                                        else
                                            la=xa[14695]or Ec(43053,14695,113780)
                                            break
                                        end
                                        la=xa[-11198]or Ec(23814,-11198,11136)
                                    else
                                        wa=wa+a_;
                                        jb=wa;
                                        if wa~=wa then
                                            la=xa[-6709]or Ec(55948,-6709,69679)
                                        else
                                            la=18198
                                        end
                                    end
                                elseif la>4383 then
                                    if la>4583 then
                                        Cb=c[1977];
                                        if(I[c[30236]]==nil)~=Cb then
                                            la=xa[-6555]or Ec(14380,-6555,37520)
                                            break
                                        else
                                            la=xa[-12891]or Ec(38726,-12891,123309)
                                            break
                                        end
                                        la=xa[17039]or Ec(43207,17039,14407)
                                    else
                                        if Sc>23 then
                                            la=xa[2928]or Ec(22621,2928,14687)
                                            break
                                        else
                                            la=xa[10741]or Ec(30037,10741,112582)
                                            break
                                        end
                                        la=xa[-31179]or Ec(3414,-31179,39728)
                                    end
                                elseif la<=4184 then
                                    if Sc>27 then
                                        la=xa[-32405]or Ec(33025,-32405,127054)
                                        break
                                    else
                                        la=xa[16997]or Ec(64542,16997,68828)
                                        break
                                    end
                                    la=xa[25929]or Ec(1181,25929,37897)
                                else
                                    Qa,d_,wb,va=-1,1,V({},{__mode='vs'}),V({},{__mode='ks'});
                                    G=false;
                                    la=xa[-10338]or Ec(35354,-10338,26252);
                                end
                            elseif la<=1772 then
                                if la>1099 then
                                    c=O[d_]
                                    Sc=c[24532]
                                    la=xa[-9915]or Ec(61935,-9915,120966)
                                else
                                    d_-=1
                                    O[d_]={[24532]=33,[30236]=J(c[30236],83),[25742]=J(c[25742],7),[61663]=0}
                                    la=xa[-30354]or Ec(17943,-30354,54007)
                                end
                            elseif la>2222 then
                                if Sc>67 then
                                    la=xa[8230]or Ec(62953,8230,79251)
                                    break
                                else
                                    la=xa[-22557]or Ec(30001,-22557,30850)
                                    break
                                end
                                la=xa[11920]or Ec(18655,11920,55375)
                            elseif la<=1977 then
                                Cb=fc[c[42102]+1];
                                f_=Cb[3526];
                                Ic=i_(f_);
                                I[c[30236]]=x(Cb,Ic)
                                Gc,ka,W=f_,1,1
                                la=40010
                            else
                                ka=e_
                                la=53366
                                break
                            end
                        elseif la<=11019 then
                            if la>9495 then
                                if la<=10235 then
                                    if la>9736 then
                                        Cb=c[42102];
                                        I[c[25742]][Cb]=I[c[61663]]
                                        d_+=1
                                        la=xa[-20886]or Ec(55492,-20886,108610)
                                    elseif la<=9672 then
                                        if I[c[30236]]==I[c[48389]]then
                                            la=xa[-28786]or Ec(28190,-28786,49857)
                                            break
                                        else
                                            la=xa[29228]or Ec(65138,29228,104615)
                                            break
                                        end
                                        la=xa[10039]or Ec(55977,10039,112253)
                                    else
                                        wa=wa+a_;
                                        jb=wa;
                                        if wa~=wa then
                                            la=xa[976]or Ec(36738,976,5167)
                                        else
                                            la=44815
                                        end
                                    end
                                elseif la<=10734 then
                                    W=W..Qc(J(Da(ka,a_+1),Da(Gc,a_%#Gc+1)))
                                    la=xa[-14659]or Ec(17883,-14659,105287)
                                elseif la<=10896 then
                                    W={Ic(I[Cb+1],I[Cb+2])};
                                    g(W,1,f_,Cb+3,I)
                                    if I[Cb+3]~=nil then
                                        la=xa[-30964]or Ec(29640,-30964,25527)
                                        break
                                    else
                                        la=xa[-16564]or Ec(30623,-16564,9689)
                                        break
                                    end
                                    la=xa[18337]or Ec(43511,18337,1687)
                                else
                                    Ic=Qa-f_+1
                                    la=xa[-24742]or Ec(61922,-24742,78524)
                                end
                            elseif la<=8940 then
                                if la>8731 then
                                    if la>8838 then
                                        if la>8862 then
                                            wa=wa..Qc(J(Da(W,Qb+1),Da(e_,Qb%#e_+1)))
                                            la=xa[25775]or Ec(34568,25775,115803)
                                        else
                                            if c[61663]==90 then
                                                la=xa[12463]or Ec(6303,12463,15584)
                                                break
                                            else
                                                la=xa[-668]or Ec(18772,-668,28940)
                                                break
                                            end
                                            la=xa[22739]or Ec(54252,22739,109754)
                                        end
                                    else
                                        if c[61663]==128 then
                                            la=xa[14812]or Ec(2470,14812,38878)
                                            break
                                        else
                                            la=xa[-25491]or Ec(59066,-25491,92152)
                                            break
                                        end
                                        la=xa[31707]or Ec(29717,31707,50417)
                                    end
                                elseif la<=8572 then
                                    f_,Ic,ka=Cb.__iter(f_)
                                    la=xa[27932]or Ec(36751,27932,31215)
                                else
                                    d_-=1
                                    O[d_]={[24532]=27,[30236]=J(c[30236],131),[25742]=J(c[25742],87),[61663]=0}
                                    la=xa[1346]or Ec(52907,1346,23155)
                                end
                            elseif la>9287 then
                                if Sc>9 then
                                    la=xa[12348]or Ec(32422,12348,16459)
                                    break
                                else
                                    la=xa[-8363]or Ec(14128,-8363,6255)
                                    break
                                end
                                la=xa[32008]or Ec(48343,32008,2999)
                            elseif la<=9246 then
                                if Sc>11 then
                                    la=xa[15587]or Ec(46595,15587,113257)
                                    break
                                else
                                    la=xa[28657]or Ec(54564,28657,115396)
                                    break
                                end
                                la=xa[7642]or Ec(63054,7642,17112)
                            else
                                d_-=1
                                O[d_]={[24532]=136,[30236]=J(c[30236],167),[25742]=J(c[25742],40),[61663]=0}
                                la=xa[-4783]or Ec(9182,-4783,48456)
                            end
                        elseif la>12959 then
                            if la>13682 then
                                if la<=13982 then
                                    if la<=13833 then
                                        Qb=ed;
                                        if a_~=a_ then
                                            la=xa[30725]or Ec(64256,30725,73463)
                                        else
                                            la=xa[19836]or Ec(31897,19836,5846)
                                        end
                                    else
                                        W,e_=ta(va[c],Ic,I[Cb+1],I[Cb+2]);
                                        if not W then
                                            la=xa[-19801]or Ec(17154,-19801,9053)
                                            break
                                        end
                                        la=xa[-19061]or Ec(50235,-19061,18914)
                                    end
                                elseif la>14132 then
                                    if Sc>144 then
                                        la=xa[16120]or Ec(24888,16120,65518)
                                        break
                                    else
                                        la=xa[-2949]or Ec(45356,-2949,114214)
                                        break
                                    end
                                    la=xa[-10197]or Ec(43615,-10197,1743)
                                else
                                    Cb=c[42102];
                                    I[c[61663]]=_d[Cb]or pa[36052][Cb]
                                    d_+=1
                                    la=xa[-18683]or Ec(62266,-18683,19948)
                                end
                            elseif la>13083 then
                                W[a_]=Rb[jb[25742]+1]
                                la=xa[-17499]or Ec(53691,-17499,118128)
                            else
                                Gc,W=f_(Ic,ka);
                                ka=Gc;
                                if ka==nil then
                                    la=xa[26682]or Ec(55915,26682,84860)
                                else
                                    la=xa[-30953]or Ec(54344,-30953,72944)
                                end
                            end
                        elseif la<=12091 then
                            if la<=11702 then
                                if Sc>167 then
                                    la=xa[25513]or Ec(45098,25513,123568)
                                    break
                                else
                                    la=xa[-4128]or Ec(64404,-4128,110928)
                                    break
                                end
                                la=xa[-18648]or Ec(20002,-18648,56036)
                            elseif la<=11900 then
                                Gc,W=f_[18512],c[18512];
                                W='C\199x*j'..W
                                e_=''
                                ed,a_,wa=#Gc-1,1,0
                                la=45285
                            else
                                d_+=1
                                la=xa[26444]or Ec(59080,26444,29278)
                            end
                        elseif la>12675 then
                            Ic[e_]=Rb[wa[25742]+1]
                            la=xa[-4794]or Ec(41015,-4794,29076)
                        else
                            f_,Ic,ka=Cb.__iter(f_)
                            la=xa[-13996]or Ec(58637,-13996,107604)
                        end
                    elseif la<=47643 then
                        if la>39337 then
                            if la>42571 then
                                if la>44934 then
                                    if la>46092 then
                                        if la>47042 then
                                            ka=e_
                                            la=53211
                                            break
                                        else
                                            ka=nil;
                                            la=15213;
                                        end
                                    elseif la<=45458 then
                                        if la>45284 then
                                            jb=wa;
                                            if ed~=ed then
                                                la=xa[-27075]or Ec(25620,-27075,24199)
                                            else
                                                la=18198
                                            end
                                        else
                                            if Sc>190 then
                                                la=xa[4066]or Ec(59815,4066,17961)
                                                break
                                            else
                                                la=xa[18415]or Ec(33367,18415,74640)
                                                break
                                            end
                                            la=xa[752]or Ec(45382,752,4032)
                                        end
                                    else
                                        if c[61663]==76 then
                                            la=xa[-7624]or Ec(49772,-7624,109846)
                                            break
                                        else
                                            la=xa[30576]or Ec(41383,30576,124265)
                                            break
                                        end
                                        la=xa[-10879]or Ec(54538,-10879,107420)
                                    end
                                elseif la<=43777 then
                                    if la>43293 then
                                        if la>43507 then
                                            la=xa[-29724]or Ec(16680,-29724,130067);
                                            break;
                                        else
                                            G=false
                                            d_+=1
                                            if Sc>115 then
                                                la=xa[9420]or Ec(1805,9420,7556)
                                                break
                                            else
                                                la=xa[27433]or Ec(1622,27433,110747)
                                                break
                                            end
                                            la=xa[-26426]or Ec(53841,-26426,110133)
                                        end
                                    else
                                        wa=O[d_];
                                        d_+=1
                                        ed=wa[30236]
                                        if ed==0 then
                                            la=xa[15979]or Ec(4362,15979,60943)
                                            break
                                        elseif ed==2 then
                                            la=xa[16024]or Ec(46467,16024,25835)
                                            break
                                        end
                                        la=xa[6185]or Ec(24527,6185,27164)
                                    end
                                elseif la<=44503 then
                                    if Sc>2 then
                                        la=xa[-31851]or Ec(25358,-31851,6394)
                                        break
                                    else
                                        la=xa[15050]or Ec(19088,15050,109155)
                                        break
                                    end
                                    la=xa[19041]or Ec(8784,19041,48694)
                                else
                                    if(a_>=0 and wa>ed)or((a_<0 or a_~=a_)and wa<ed)then
                                        la=xa[-1096]or Ec(29408,-1096,63817)
                                    else
                                        la=33572
                                    end
                                end
                            elseif la<=40601 then
                                if la>39845 then
                                    if la<=40223 then
                                        e_=ka;
                                        if Gc~=Gc then
                                            la=xa[14666]or Ec(27674,14666,64652)
                                        else
                                            la=26177
                                        end
                                    else
                                        d_+=c[4666]
                                        la=xa[21680]or Ec(31756,21680,52378)
                                    end
                                elseif la>39656 then
                                    if la<=39742 then
                                        if la<=39722 then
                                            Ic=W
                                            la=xa[-16270]or Ec(205,-16270,17035)
                                            break
                                        else
                                            Cb=c[29441];
                                            f_=c[42102];
                                            Ic=_d[f_]or pa[36052][f_];
                                            if Cb==1 then
                                                la=xa[-14073]or Ec(49914,-14073,122680)
                                                break
                                            elseif Cb==2 then
                                                la=xa[-18905]or Ec(43424,-18905,73956)
                                                break
                                            elseif Cb==3 then
                                                la=xa[-9007]or Ec(22675,-9007,15977)
                                                break
                                            end
                                            la=47692
                                        end
                                    else
                                        va[c]=nil
                                        d_+=1
                                        la=xa[-28736]or Ec(44264,-28736,15294)
                                    end
                                else
                                    if Sc>91 then
                                        la=xa[-16854]or Ec(37364,-16854,121946)
                                        break
                                    else
                                        la=xa[27956]or Ec(27241,27956,102230)
                                        break
                                    end
                                    la=xa[6391]or Ec(40240,6391,27606)
                                end
                            elseif la>41357 then
                                if la>41780 then
                                    n_={[3]=I[jb[25742]],[1]=3};
                                    n_[2]=n_
                                    W[a_]=n_
                                    la=xa[-27569]or Ec(29593,-27569,27410)
                                elseif la<=41731 then
                                    Cb,f_,Ic=J(c[30236],74),J(c[61663],72),J(c[25742],138);
                                    ka=f_==0 and Qa-Cb or f_-1;
                                    Gc=I[Cb];
                                    W=ya(Gc(_b(I,Cb+1,Cb+ka)));
                                    e_=W[28398];
                                    if Ic==0 then
                                        la=xa[-23309]or Ec(54294,-23309,71873)
                                        break
                                    else
                                        la=xa[18849]or Ec(29320,18849,111520)
                                        break
                                    end
                                    la=xa[28192]or Ec(2964,28192,52330)
                                else
                                    if c[61663]==21 then
                                        la=xa[28195]or Ec(44463,28195,29957)
                                        break
                                    elseif c[61663]==39 then
                                        la=xa[-27003]or Ec(14361,-27003,39450)
                                        break
                                    elseif c[61663]==60 then
                                        la=xa[27173]or Ec(50995,27173,74901)
                                        break
                                    else
                                        la=xa[4384]or Ec(57178,4384,87273)
                                        break
                                    end
                                    la=xa[19796]or Ec(55496,19796,108638)
                                end
                            elseif la<=40934 then
                                Cb=c[29441];
                                f_=O[d_+1];
                                Ic=nil;
                                la=30490;
                            elseif la>41019 then
                                W=W+wa;
                                ed=W;
                                if W~=W then
                                    la=xa[-21382]or Ec(28858,-21382,30045)
                                else
                                    la=xa[13427]or Ec(63336,13427,118536)
                                end
                            else
                                d_-=1
                                O[d_]={[24532]=198,[30236]=J(c[30236],45),[25742]=J(c[25742],211),[61663]=0}
                                la=xa[-10471]or Ec(46874,-10471,396)
                            end
                        elseif la<=36244 then
                            if la>34393 then
                                if la<=35417 then
                                    if la>34784 then
                                        f_,Ic,ka=Dc(f_)
                                        la=xa[19089]or Ec(14550,19089,59392)
                                    else
                                        _d[c[42102]]=I[c[25742]]
                                        d_+=1
                                        la=xa[-8993]or Ec(48098,-8993,5284)
                                    end
                                elseif la>35839 then
                                    if Sc>13 then
                                        la=xa[29167]or Ec(7379,29167,27514)
                                        break
                                    else
                                        la=xa[24443]or Ec(22417,24443,5433)
                                        break
                                    end
                                    la=xa[31641]or Ec(56238,31641,111992)
                                elseif la<=35670 then
                                    Cb=fd(f_)
                                    if Cb~=nil and Cb.__iter~=nil then
                                        la=xa[7651]or Ec(41943,7651,119954)
                                        break
                                    elseif ib(f_)==ia('\211]\197P\194','\167<')then
                                        la=xa[-20563]or Ec(56824,-20563,117290)
                                        break
                                    end
                                    la=xa[-26984]or Ec(39300,-26984,104336)
                                else
                                    if not I[c[30236]]then
                                        la=xa[-1054]or Ec(6904,-1054,31580)
                                        break
                                    end
                                    la=xa[-11777]or Ec(19633,-11777,56405)
                                end
                            elseif la<=33370 then
                                if la>32710 then
                                    ka=nil;
                                    la=xa[15240]or Ec(51826,15240,113452);
                                else
                                    f_=Gc
                                    la=xa[21215]or Ec(65134,21215,125328)
                                    break
                                end
                            elseif la>33810 then
                                if la>33930 then
                                    if Sc>28 then
                                        la=xa[21143]or Ec(56496,21143,124875)
                                        break
                                    else
                                        la=xa[-25412]or Ec(40045,-25412,123277)
                                        break
                                    end
                                    la=xa[22219]or Ec(7700,22219,60146)
                                else
                                    if Sc>139 then
                                        la=xa[4716]or Ec(39424,4716,66622)
                                        break
                                    else
                                        la=xa[-16095]or Ec(25593,-16095,19645)
                                        break
                                    end
                                    la=xa[-8612]or Ec(21954,-8612,9028)
                                end
                            else
                                e_=e_..Qc(J(Da(Gc,jb+1),Da(W,jb%#W+1)))
                                la=xa[-23383]or Ec(8712,-23383,35951)
                            end
                        elseif la>37668 then
                            if la>38387 then
                                if la<=38792 then
                                    if Sc>203 then
                                        la=xa[1634]or Ec(28985,1634,6988)
                                        break
                                    else
                                        la=xa[5883]or Ec(4952,5883,50379)
                                        break
                                    end
                                    la=xa[-4570]or Ec(43900,-4570,1322)
                                elseif la>38839 then
                                    g(Ka[64635],1,f_,Cb,I)
                                    la=xa[-22764]or Ec(24156,-22764,10954)
                                else
                                    f_[59670]=Gc
                                    la=xa[22194]or Ec(1114,22194,109859)
                                end
                            elseif la>38084 then
                                if la>38259 then
                                    if Sc>214 then
                                        la=xa[-31637]or Ec(1782,-31637,30866)
                                        break
                                    else
                                        la=xa[-26538]or Ec(13742,-26538,40859)
                                        break
                                    end
                                    la=xa[-3110]or Ec(10911,-3110,34319)
                                else
                                    if(wa>=0 and W>e_)or((wa<0 or wa~=wa)and W<e_)then
                                        la=xa[-2550]or Ec(61048,-2550,126751)
                                    else
                                        la=xa[25999]or Ec(21506,25999,128391)
                                    end
                                end
                            elseif la<=37909 then
                                if c[61663]==220 then
                                    la=xa[7392]or Ec(59724,7392,98619)
                                    break
                                else
                                    la=xa[-9706]or Ec(45925,-9706,129234)
                                    break
                                end
                                la=xa[-31987]or Ec(32153,-31987,51981)
                            else
                                e_=e_..Qc(J(Da(Gc,jb+1),Da(W,jb%#W+1)))
                                la=xa[-14154]or Ec(56710,-14154,106661)
                            end
                        elseif la<=36828 then
                            if la>36528 then
                                if la>36730 then
                                    g(e_,1,f_,Cb+3,I)
                                    I[Cb+2]=I[Cb+3]
                                    d_+=c[4666]
                                    la=xa[-6871]or Ec(18962,-6871,9972)
                                else
                                    Cb=Rb[c[25742]+1];
                                    I[c[30236]]=Cb[2][Cb[1]]
                                    la=xa[-14406]or Ec(1497,-14406,37709)
                                end
                            elseif la>36327 then
                                Cb=c[25742];
                                f_=c[30236];
                                Ic=c[61663]-1;
                                if Ic==-1 then
                                    la=xa[-424]or Ec(41781,-424,5551)
                                    break
                                end
                                la=xa[-3381]or Ec(15690,-3381,32724)
                            else
                                if Sc>25 then
                                    la=xa[5846]or Ec(59772,5846,31247)
                                    break
                                else
                                    la=xa[20241]or Ec(50901,20241,21411)
                                    break
                                end
                                la=xa[-28547]or Ec(10193,-28547,45237)
                            end
                        elseif la<=37427 then
                            I[c[30236]]=Ic
                            la=xa[16667]or Ec(8846,16667,26469)
                        else
                            d_+=1
                            la=xa[-4590]or Ec(47764,-4590,5746)
                        end
                    elseif la<=55431 then
                        if la<=51008 then
                            if la>48739 then
                                if la<=49399 then
                                    if la>49145 then
                                        if la<=49294 then
                                            if la>49247 then
                                                f_[42102]=Ic
                                                if Cb==2 then
                                                    la=xa[2554]or Ec(12319,2554,27952)
                                                    break
                                                elseif Cb==3 then
                                                    la=xa[-3182]or Ec(33808,-3182,100059)
                                                    break
                                                end
                                                la=xa[-16300]or Ec(39600,-16300,69301)
                                            else
                                                Cb=c[42102];
                                                I[c[61663]]=I[c[30236]][Cb]
                                                d_+=1
                                                la=xa[16047]or Ec(17523,16047,54315)
                                            end
                                        else
                                            ed=ed+jb;
                                            Qb=ed;
                                            if ed~=ed then
                                                la=xa[-28660]or Ec(28939,-28660,100492)
                                            else
                                                la=22736
                                            end
                                        end
                                    elseif la>48921 then
                                        g(I,f_,f_+Ic-1,c[48389],I[Cb])
                                        d_+=1
                                        la=xa[7217]or Ec(11671,7217,47991)
                                    else
                                        I[c[61663]]=i_(c[48389])
                                        d_+=1
                                        la=xa[27172]or Ec(40935,27172,26791)
                                    end
                                else
                                    if Sc>109 then
                                        la=xa[25144]or Ec(51124,25144,79882)
                                        break
                                    else
                                        la=xa[2514]or Ec(45874,2514,5135)
                                        break
                                    end
                                    la=xa[5936]or Ec(8628,5936,48978)
                                end
                            elseif la>48173 then
                                if la>48481 then
                                    e_=Ic-1
                                    la=xa[25962]or Ec(51007,25962,112839)
                                else
                                    I[c[30236]]=nil
                                    la=xa[-9870]or Ec(34894,-9870,6360)
                                end
                            elseif la>48050 then
                                if la<=48140 then
                                    if la>48123 then
                                        Cb=nil;
                                        f_=J(c[50198],21110);
                                        Cb=if f_<32768 then f_ else f_-65536
                                        Ic=Cb
                                        ka=fc[Ic+1]
                                        Gc=ka[3526]
                                        W=i_(Gc)
                                        I[J(c[30236],34)]=x(ka,W)
                                        wa,e_,ed=Gc,1,1
                                        la=20833
                                    else
                                        d_+=1
                                        la=xa[-32590]or Ec(17610,-32590,54364)
                                    end
                                elseif la<=48158 then
                                    Cb=c[25742];
                                    f_=c[30236];
                                    Ic=c[42102];
                                    ka=I[f_];
                                    I[Cb+1]=ka
                                    I[Cb]=ka[Ic]
                                    d_+=1
                                    la=xa[11168]or Ec(7105,11168,62789)
                                else
                                    if Sc>216 then
                                        la=xa[-12939]or Ec(12374,-12939,60468)
                                        break
                                    else
                                        la=xa[-3991]or Ec(4952,-3991,98392)
                                        break
                                    end
                                    la=xa[-9153]or Ec(40007,-9153,27847)
                                end
                            else
                                d_+=1
                                la=xa[21160]or Ec(55783,21160,112295)
                            end
                        elseif la<=53277 then
                            if la>52267 then
                                if la>53040 then
                                    if la>53145 then
                                        f_[18512]=ka
                                        Gc=nil
                                        la=15776
                                    else
                                        Qa=Cb+e_-1
                                        la=xa[2178]or Ec(35280,2178,19886)
                                    end
                                else
                                    f_,Ic,ka=wb;
                                    if ib(f_)~='function'then
                                        la=xa[-7981]or Ec(51798,-7981,102209)
                                        break
                                    end;
                                    la=xa[6251]or Ec(35682,6251,17908);
                                end
                            elseif la<=51688 then
                                if la<=51436 then
                                    Cb=Rb[c[25742]+1];
                                    Cb[2][Cb[1]]=I[c[30236]]
                                    la=xa[-32313]or Ec(54823,-32313,107239)
                                else
                                    if Sc>218 then
                                        la=xa[26652]or Ec(21521,26652,9461)
                                        break
                                    else
                                        la=xa[-5583]or Ec(30359,-5583,20382)
                                        break
                                    end
                                    la=xa[-8087]or Ec(23294,-8087,13736)
                                end
                            elseif la>51940 then
                                W[3]=W[2][W[1]]
                                W[2]=W
                                W[1]=3
                                wb[Gc]=nil
                                la=xa[-9538]or Ec(62512,-9538,107686)
                            else
                                if Sc>254 then
                                    la=xa[22583]or Ec(39147,22583,17708)
                                    break
                                else
                                    la=xa[20581]or Ec(2204,20581,26675)
                                    break
                                end
                                la=xa[-9997]or Ec(9111,-9997,48503)
                            end
                        elseif la>54455 then
                            if la<=54973 then
                                if(ed>=0 and e_>wa)or((ed<0 or ed~=ed)and e_<wa)then
                                    la=xa[-7264]or Ec(15511,-7264,35959)
                                else
                                    la=4092
                                end
                            elseif la<=55123 then
                                yb(W)
                                va[Gc]=nil
                                la=xa[29590]or Ec(56939,29590,117569)
                            else
                                d_+=c[4666]
                                la=xa[20364]or Ec(17682,20364,54260)
                            end
                        elseif la<=53937 then
                            f_[18512]=ka
                            la=xa[8646]or Ec(52284,8646,95689)
                        elseif la>54222 then
                            if Sc>90 then
                                la=xa[-14806]or Ec(27720,-14806,17613)
                                break
                            else
                                la=xa[303]or Ec(62203,303,31204)
                                break
                            end
                            la=xa[-10422]or Ec(9204,-10422,48274)
                        else
                            if c[61663]==225 then
                                la=xa[-15860]or Ec(52018,-15860,83647)
                                break
                            else
                                la=xa[-6364]or Ec(24999,-6364,29362)
                                break
                            end
                            la=xa[-19000]or Ec(43598,-19000,1752)
                        end
                    elseif la>60657 then
                        if la<=63107 then
                            if la<=61747 then
                                if la<=61233 then
                                    if la>61053 then
                                        Ic,ka=Cb[42102],c[42102];
                                        ka='C\199x*j'..ka
                                        Gc=''
                                        W,wa,e_=0,1,#Ic-1
                                        la=19090
                                    else
                                        f_,Ic,ka=va;
                                        if ib(f_)~='function'then
                                            la=xa[5812]or Ec(43750,5812,114289)
                                            break
                                        end;
                                        la=xa[19021]or Ec(35983,19021,113837);
                                    end
                                else
                                    if c[61663]==17 then
                                        la=xa[17272]or Ec(31546,17272,56571)
                                        break
                                    elseif c[61663]==22 then
                                        la=xa[-16227]or Ec(61278,-16227,103669)
                                        break
                                    else
                                        la=xa[-16185]or Ec(56387,-16185,87395)
                                        break
                                    end
                                    la=xa[21972]or Ec(541,21972,40585)
                                end
                            elseif la>62261 then
                                if Sc>46 then
                                    la=xa[8830]or Ec(2730,8830,28478)
                                    break
                                else
                                    la=xa[-11051]or Ec(47594,-11051,122726)
                                    break
                                end
                                la=xa[2228]or Ec(17185,2228,56805)
                            elseif la>62055 then
                                a_=e_;
                                if wa~=wa then
                                    la=xa[-5144]or Ec(55634,-5144,81859)
                                else
                                    la=xa[-24704]or Ec(1465,-24704,37025)
                                end
                            else
                                d_-=1
                                O[d_]={[24532]=206,[30236]=J(c[30236],50),[25742]=J(c[25742],124),[61663]=0}
                                la=xa[15274]or Ec(2878,15274,58856)
                            end
                        elseif la<=64468 then
                            if la<=63850 then
                                I[c[30236]]=I[c[25742]]
                                la=xa[29971]or Ec(10055,29971,45511)
                            elseif la<=64026 then
                                I[c[30236]]=Ic[c[18512]]
                                la=xa[21994]or Ec(35641,21994,118474)
                            else
                                Cb=c[30236];
                                f_=c[25742];
                                Ic=f_-1;
                                if Ic==-1 then
                                    la=xa[287]or Ec(16174,287,11556)
                                    break
                                else
                                    la=xa[-20677]or Ec(40095,-20677,70212)
                                    break
                                end
                                la=xa[-27149]or Ec(49713,-27149,98700)
                            end
                        elseif la<=65085 then
                            if la>64891 then
                                f_,Ic,ka=wb;
                                if ib(f_)~='function'then
                                    la=xa[32544]or Ec(62406,32544,112257)
                                    break
                                end;
                                la=xa[-4761]or Ec(41375,-4761,28634);
                            else
                                ka=f_-1
                                la=xa[-8217]or Ec(16037,-8217,64792)
                            end
                        else
                            d_+=c[4666]
                            la=xa[-17947]or Ec(19318,-17947,9488)
                        end
                    elseif la<=57717 then
                        if la<=56144 then
                            if la>55987 then
                                if la>56074 then
                                    e_=e_+ed;
                                    a_=e_;
                                    if e_~=e_ then
                                        la=xa[-32552]or Ec(46,-32552,6391)
                                    else
                                        la=xa[25899]or Ec(57234,25899,112456)
                                    end
                                else
                                    if Sc>18 then
                                        la=xa[-26623]or Ec(28483,-26623,26693)
                                        break
                                    else
                                        la=xa[19955]or Ec(26642,19955,55040)
                                        break
                                    end
                                    la=xa[11254]or Ec(52871,11254,23047)
                                end
                            elseif la>55900 then
                                if Sc>78 then
                                    la=xa[17952]or Ec(40432,17952,76273)
                                    break
                                else
                                    la=xa[20638]or Ec(54264,20638,107839)
                                    break
                                end
                                la=xa[10586]or Ec(11810,10586,47844)
                            else
                                Gc=wa
                                la=38837
                                break
                            end
                        else
                            I[c[30236]]=c[42102]
                            la=xa[-3904]or Ec(55533,-3904,112569)
                        end
                    elseif la<=59291 then
                        if la>58324 then
                            Cb=c[42102];
                            f_=c[1977];
                            Ic=I[c[30236]];
                            ka=nil;
                            Gc=Ic;
                            ka=Vb(Gc)=='boolean'
                            if(ka and(Ic==Cb))~=f_ then
                                la=xa[-15078]or Ec(89,-15078,23555)
                                break
                            else
                                la=xa[-28291]or Ec(58259,-28291,74811)
                                break
                            end
                            la=xa[19601]or Ec(59661,19601,18329)
                        else
                            Gc=Gc..Qc(J(Da(Ic,ed+1),Da(ka,ed%#ka+1)))
                            la=xa[26167]or Ec(64184,26167,121076)
                        end
                    elseif la<=59935 then
                        W[3]=W[2][W[1]]
                        W[2]=W
                        W[1]=3
                        wb[Gc]=nil
                        la=xa[-16203]or Ec(61262,-16203,108971)
                    elseif la<=60104 then
                        c[24532]=3
                        d_+=1
                        la=xa[-6108]or Ec(21772,-6108,9114)
                    else
                        f_,Ic,ka=Cb.__iter(f_)
                        la=xa[28805]or Ec(27323,28805,26353)
                    end
                end
            until la==63108
        end
        local k
        k=function(...)
            local Sa,ad,ha,bd,K,Ab,vc,Ya,na,Oc
            na,bd={},function(mc,qb,Cc)
                na[qb]=B(Cc,19681)-B(mc,31604)
                return na[qb]
            end
            ha=na[20825]or bd(20589,20825,86552)
            repeat
                while true do
                    if ha>34267 then
                        if ha<=54458 then
                            return bb(ad,0)
                        elseif ha>59398 then
                            Sa=kb(...);
                            Ya=i_(Wb[26939]);
                            vc={[28398]=0,[64635]={}};
                            g(Sa,1,Wb[964],0,Ya)
                            if Wb[964]<Sa.n then
                                ha=na[7536]or bd(27603,7536,41010)
                                break
                            end
                            ha=na[-1695]or bd(12620,-1695,59668)
                        else
                            Oc=Wb[964]+1;
                            ad=Sa.n-Wb[964];
                            vc[28398]=ad;
                            g(Sa,Oc,Oc+ad-1,1,vc[64635])
                            ha=na[-5663]or bd(29498,-5663,10474)
                        end
                    elseif ha<=22152 then
                        if ha<=13542 then
                            ad=Oc[64635][2];
                            Ab=nil;
                            K=ad;
                            Ab=Vb(K)=='string'
                            if Ab==false then
                                ha=na[6740]or bd(48839,6740,66853)
                                break
                            end
                            ha=na[-25985]or bd(61334,-25985,69607)
                        else
                            return _b(Oc[64635],2,Oc[28398])
                        end
                    elseif ha>27893 then
                        ad=Vb(ad)
                        ha=na[-6770]or bd(43083,-6770,118146)
                    elseif ha>24935 then
                        ha=na[-5570]or bd(49084,-5570,91242);
                        break;
                    else
                        Oc=ya(Bb(ub,Ya,Wb[59449],Wb[3620],vc));
                        if Oc[64635][1]then
                            ha=na[-24674]or bd(27192,-24674,6543)
                            break
                        else
                            ha=na[-18668]or bd(23318,-18668,2796)
                            break
                        end
                        ha=26385
                    end
                end
            until ha==25539
        end
        return k
    end
    return x(M,dd)
end)
local v
v,sc={[0]=0},function()
    v[0]=v[0]+1
    return{[2]=v,[1]=v[0]}
end
Vc=db
return(function()
    return Vc(P(Gb'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'),{})
end)()(...)
