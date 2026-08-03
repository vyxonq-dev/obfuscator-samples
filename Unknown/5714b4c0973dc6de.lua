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

local Wb,hc,ob,R,d_,yc=bit32.bxor,pairs,getmetatable,type;
local Na,Vb,ca,ab,Kb,E,wa,uc,lc,Rb,aa,C,Tc,bb,g,Yc,Ja,ua,Sb,Xb,mb,Pb,hb,_c,Hb,pc,u_,T,_a,wc
ab=(select);
Sb=(function(...)
    return{[1]={...},[2]=ab('#',...)}
end);
Na=((function()
    local function vb(Ib,K,Jc)
        if K>Jc then
            return
        end
        return Ib[K],vb(Ib,K+1,Jc)
    end
    return vb
end)());
Tc,hb=(string.gsub),(string.char);
u_=(function(Ob)
    Ob=Tc(Ob,'[^ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=]','')
    return(Ob:gsub('.',function(Kc)
        if(Kc=='=')then
            return''
        end
        local Db,Ba='',(('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'):find(Kc)-1)
        for ta=6,1,-1 do
            Db=Db..(Ba%2^ta-Ba%2^(ta-1)>0 and'1'or'0')
        end
        return Db;
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?',function(Ia)
        if(#Ia~=8)then
            return''
        end
        local j=0
        for Lb=1,8 do
            j=j+(Ia:sub(Lb,Lb)=='1'and 2^(8-Lb)or 0)
        end
        return hb(j)
    end))
end);
ca,_a,wa,lc,ua,Ja,C,Pb=string.unpack,string.sub,string.byte,bit32 .lshift,bit32 .rshift,bit32 .band,table.concat,{};
Yc=(function(Ea)
    local r_=Pb[Ea]
    if r_ then
        return r_
    end
    local Pc,Pa,J,jc,Ua=lc(1,11),lc(1,5),1,{},''
    while J<=#Ea do
        local za=wa(Ea,J)
        J=J+1
        for B=1,8 do
            local _d=nil
            if Ja(za,1)~=0 then
                if J<=#Ea then
                    _d=_a(Ea,J,J)
                    J=J+1
                end
            else
                if J+1<=#Ea then
                    local ya=ca('>I2',Ea,J)
                    J=J+2
                    local Va,Oa=#Ua-ua(ya,5),Ja(ya,(Pa-1))+3
                    _d=_a(Ua,Va,Va+Oa-1)
                end
            end
            za=ua(za,1)
            if _d then
                jc[#jc+1]=_d
                Ua=_a(Ua.._d,-Pc)
            end
        end
    end
    local Vc=C(jc)
    Pb[Ea]=Vc
    return Vc
end);
local I,Q,F,p,vc,nb,Hc,Dc,pa,S,tb,oc,Qa,gb,Rc,wb,Ra,O,ac,_b,l_,H,Gb,Ka,L,gc,X,ia,o_,P=type,pcall,error,tonumber,assert,select,setmetatable,string.format,string.unpack,string.sub,string.byte,string.char,table.move,table.pack,table.create,table.insert,table.concat,coroutine.create,coroutine.yield,coroutine.resume,coroutine.close,getfenv,bit32 .bor,bit32 .bxor,bit32 .band,bit32 .btest,bit32 .rshift,bit32 .lshift,bit32 .extract,{[56941]={},[60284]={{2,4,true},{0,0,true},{6,8,false},{2,8,true},{6,8,false},{2,6,false},{0,8,false},{6,8,false},{0,4,true},{0,9,false},{8,5,true},{3,5,true},{0,3,false},{3,0,true},{2,5,false},{2,8,false},{8,0,true},{2,1,false},{6,8,false},{6,8,false},{4,8,true},{4,0,true},{0,3,false},{6,10,true},{6,8,true},{8,8,true},{0,8,true},{0,9,false},{6,3,true},{6,8,false},{0,5,true},{8,4,true},{6,8,false},{4,3,false},{8,8,false},{4,10,true},{8,8,false},{8,8,false},{2,7,false},{2,8,true},{8,10,true},{4,6,false},{8,1,true},{6,9,true},{6,8,false},{0,8,false},{6,8,false},{6,8,false},{8,3,true},{6,9,true},{0,9,true},{3,4,true},{8,8,true},{4,8,false},{2,6,false},{8,5,true},{0,0,false},{0,9,true},{2,1,true},{4,3,true},{2,8,false},{6,5,true},{4,8,true},{8,6,true},{8,3,true},{3,6,true},{6,1,false},{3,10,true},{0,0,true},{0,1,true},{3,10,true},{0,3,false},{6,8,false},{0,10,true},{6,2,false},{8,8,true},{0,5,false},{8,9,true},{2,6,true},{3,10,false},{8,3,false},{8,3,false},{3,10,true},{6,9,true},{2,9,false},{8,8,false},{6,2,false},{0,3,false},{2,3,false},{8,9,false},{6,5,false},{8,1,true},{6,5,false},{4,4,false},{6,8,false},{6,1,true},{3,0,false},{4,0,false},{2,6,true},{6,8,false},{6,4,false},{8,8,false},{0,10,true},{4,8,false},{6,10,false},{8,0,true},{6,9,true},{4,3,true},{8,4,true},{8,10,false},{8,6,true},{8,4,true},{8,8,false},{6,8,false},{6,9,true},{3,9,false},{2,10,true},{3,10,true},{6,8,false},{8,8,false},{6,1,false},{2,3,true},{6,8,false},{8,6,false},{6,8,false},{6,9,true},{2,1,true},{6,8,false},{2,9,false},{6,8,false},{6,8,false},{8,0,true},{8,3,false},{8,6,true},{2,6,true},{6,9,true},{8,6,false},{8,3,false},{8,8,true},{4,1,true},{6,8,false},{8,0,false},{6,8,true},{3,3,false},{8,0,true},{2,4,false},{8,6,false},{2,6,true},{2,6,false},{8,4,true},{8,8,true},{8,8,false},{4,5,false},{8,6,false},{4,5,true},{4,6,true},{8,3,false},{3,4,false},{6,10,false},{6,1,true},{2,0,false},{6,10,false},{6,1,false},{8,6,true},{8,4,true},{3,3,true},{3,9,true},{0,4,true},{8,8,false},{0,9,false},{2,1,false},{8,8,false},{6,10,false},{3,6,false},{4,8,true},{0,5,false},{0,10,true},{6,5,false},{6,8,false},{8,4,true},{0,9,false},{2,5,true},{6,8,false},{6,10,false},{6,9,true},{3,1,true},{6,8,false},{8,8,false},{6,8,false},{3,9,true},{0,8,true},{3,10,true},{4,10,false},{2,1,true},{0,1,true},{4,9,false},{6,1,false},{2,5,true},{0,5,true},{4,4,false},{6,10,false},{3,8,false},{2,5,true},{8,8,true},{6,2,false},{3,5,false},{4,1,true},{8,6,false},{3,8,false},{3,8,false},{6,9,false},{0,0,true},{6,2,false},{0,6,false},{2,9,true},{6,5,true},{3,1,false},{4,9,true},{3,9,false},{2,5,false},{8,1,true},{6,8,false},{0,3,true},{6,1,true},{2,5,false},{6,8,true},{6,8,false},{3,1,false},{8,6,true},{6,8,true},{2,4,true},{4,6,false},{4,6,true},{2,8,true},{6,6,true},{2,6,true},{6,5,false},{3,8,false},{8,8,false},{8,8,false},{6,8,false},{8,3,false},{2,8,false},{6,8,false},{8,3,false},{6,9,true},{0,0,true},{8,10,true},{3,9,false},{6,10,false},{6,8,false},{6,8,false},{3,8,false},{8,8,true},{2,10,true},{6,0,true}},[14728]={}}
local function eb(Fb)
    local Y=P[14728][Fb]
    if Y then
        return Y
    end
    local oa=1
    local function Ec()
        local Wc,ba,Mb,ec,Ac,yb,ra,k,cc,la,Zc,rb,qc,mc,rc,Uc,Nb,i_,n_,ub,Bc,t_,z,s_,M,ka,h,U
        ra,Wc={},function(Ca,Sc,c)
            ra[c]=Wb(Ca,28450)-Wb(Sc,62055)
            return ra[c]
        end
        Bc=ra[-21137]or Wc(38754,56102,-21137)
        repeat
            while true do
                if Bc>33155 then
                    if Bc<=48486 then
                        if Bc>40354 then
                            if Bc<=44815 then
                                if Bc>43211 then
                                    Nb=Mb
                                    Bc=31906
                                    break
                                else
                                    ub,rc=L(X(Ac,8),16777215),nil;
                                    rc=if ub<8388608 then ub else ub-16777216
                                    cc[31475]=rc
                                    Bc=ra[-22846]or Wc(92362,33613,-22846)
                                end
                            elseif Bc>46246 then
                                if Bc<=46940 then
                                    if Bc>46512 then
                                        t_[42978]=Uc[t_[64747]+1]
                                        Bc=ra[133]or Wc(75579,39189,133)
                                    else
                                        ka=pa('B',Fb,oa);
                                        oa=oa+1
                                        Bc=ra[30919]or Wc(63868,50913,30919)
                                    end
                                else
                                    if(Uc>=0 and rb>M)or((Uc<0 or Uc~=Uc)and rb<M)then
                                        Bc=4985
                                    else
                                        Bc=3798
                                    end
                                end
                            elseif Bc<=45567 then
                                if Bc>45179 then
                                    Zc=Ka(Mb,245)
                                    Bc=ra[26586]or Wc(34270,33211,26586)
                                    break
                                else
                                    Nb=Nb+Ac;
                                    z=Nb;
                                    if Nb~=Nb then
                                        Bc=28635
                                    else
                                        Bc=63734
                                    end
                                end
                            elseif Bc>45923 then
                                yb=ec;
                                k,qc=Rc(yb),false;
                                M,rb,Uc=yb,1,1
                                Bc=ra[17395]or Wc(36151,34086,17395)
                            else
                                if(U>=0 and z>t_)or((U<0 or U~=U)and z<t_)then
                                    Bc=19854
                                else
                                    Bc=ra[16497]or Wc(33907,56079,16497)
                                end
                            end
                        elseif Bc>36762 then
                            if Bc>39437 then
                                Uc[z]=mc()
                                Bc=ra[-10260]or Wc(91630,43146,-10260)
                            else
                                if Mb then
                                    Bc=ra[-7701]or Wc(85263,19366,-7701)
                                    break
                                end
                                Bc=ra[25958]or Wc(84037,35045,25958)
                            end
                        elseif Bc>34923 then
                            if Bc<=36527 then
                                z=Ac;
                                M=Gb(M,ia(L(z,127),s_*7))
                                if not gc(z,128)then
                                    Bc=ra[3015]or Wc(34633,18967,3015)
                                    break
                                end
                                Bc=ra[6382]or Wc(94995,11476,6382)
                            else
                                Ac=s_;
                                z=L(Ac,255);
                                t_=P[60284][z+1];
                                U,Zc,Mb=t_[1],t_[2],t_[3];
                                cc={[42978]=0,[53430]=0,[31392]=0,[65417]=0,[30992]=0,[1211]=0,[44495]=0,[27007]=nil,[64747]=0,[508]=z,[65182]=0,[64958]=0,[31475]=0,[31781]=0,[61577]=Zc};
                                wb(k,cc)
                                if U==6 then
                                    Bc=ra[-17853]or Wc(93309,54560,-17853)
                                    break
                                elseif U==8 then
                                    Bc=ra[1834]or Wc(16891,61534,1834)
                                    break
                                elseif U==2 then
                                    Bc=ra[-20775]or Wc(45948,50635,-20775)
                                    break
                                end
                                Bc=38590
                            end
                        elseif Bc<=33418 then
                            s_=Uc;
                            if mc~=mc then
                                Bc=ra[-19614]or Wc(3902,56246,-19614)
                            else
                                Bc=ra[15301]or Wc(42656,44460,15301)
                            end
                        else
                            ub=Ka(rc,59697883)
                            Bc=ra[32592]or Wc(94551,54323,32592)
                            break
                        end
                    elseif Bc>56687 then
                        if Bc<=60558 then
                            if Bc>58933 then
                                Nb=nil;
                                Bc=ra[9008]or Wc(43117,20628,9008);
                            elseif Bc<=57684 then
                                z=Nb;
                                if s_~=s_ then
                                    Bc=ra[9193]or Wc(121760,14937,9193)
                                else
                                    Bc=22418
                                end
                            else
                                ub,rc=L(X(Zc,10),1023),L(X(Zc,0),1023);
                                t_[64958]=Uc[ub+1]
                                t_[1211]=Uc[rc+1]
                                Bc=ra[-2206]or Wc(66833,32747,-2206)
                            end
                        elseif Bc>62208 then
                            if Bc>63627 then
                                if(Ac>=0 and Nb>s_)or((Ac<0 or Ac~=Ac)and Nb<s_)then
                                    Bc=28635
                                else
                                    Bc=ra[29495]or Wc(41523,56787,29495)
                                end
                            else
                                rc=ub;
                                cc[64747]=rc;
                                wb(k,{})
                                Bc=ra[12225]or Wc(41818,60916,12225)
                            end
                        elseif Bc<=61348 then
                            if Bc>60914 then
                                z=Nb;
                                if s_~=s_ then
                                    Bc=28635
                                else
                                    Bc=63734
                                end
                            elseif Bc>60777 then
                                ec=Ka(yb,1388901766)
                                Bc=ra[3868]or Wc(42030,58506,3868)
                                break
                            else
                                s_=Nb;
                                Ac=Rc(s_);
                                z,t_,U=1,s_,1
                                Bc=ra[-13525]or Wc(49989,33465,-13525)
                            end
                        else
                            la,ec=i_,nil;
                            Bc=32863;
                        end
                    elseif Bc<=53064 then
                        if Bc<=51349 then
                            if Bc>50448 then
                                if Bc>50980 then
                                    rb=rb+Uc;
                                    mc=rb;
                                    if rb~=rb then
                                        Bc=4985
                                    else
                                        Bc=ra[-16447]or Wc(76973,30789,-16447)
                                    end
                                else
                                    ba=pa('B',Fb,oa);
                                    oa=oa+1
                                    Bc=ra[-26264]or Wc(121947,11159,-26264)
                                end
                            else
                                Ac[Zc]=Ec()
                                Bc=ra[31515]or Wc(37612,27224,31515)
                            end
                        elseif Bc<=52836 then
                            Uc=Ka(mc,245)
                            Bc=28502
                            break
                        elseif Bc<=53024 then
                            h=nil;
                            Bc=ra[18594]or Wc(42852,61522,18594);
                        else
                            t_=k[z];
                            U=t_[61577];
                            if U==7 then
                                Bc=ra[-10605]or Wc(50574,37159,-10605)
                                break
                            elseif U==3 then
                                Bc=ra[24064]or Wc(8192,54285,24064)
                                break
                            elseif U==1 then
                                Bc=ra[29682]or Wc(78662,1416,29682)
                                break
                            elseif U==9 then
                                Bc=ra[16109]or Wc(38715,45155,16109)
                                break
                            end
                            Bc=ra[9372]or Wc(94962,45902,9372)
                        end
                    elseif Bc<=54969 then
                        z=pa('B',Fb,oa);
                        oa=oa+1
                        Bc=ra[-25789]or Wc(12496,56309,-25789)
                    elseif Bc<=56020 then
                        if Bc<=55621 then
                            Ac=Ac+t_;
                            U=Ac;
                            if Ac~=Ac then
                                Bc=ra[12150]or Wc(20586,55417,12150)
                            else
                                Bc=ra[-26167]or Wc(40241,30798,-26167)
                            end
                        else
                            h=Ka(ba,245)
                            Bc=ra[7921]or Wc(76486,11677,7921)
                            break
                        end
                    elseif Bc>56415 then
                        Nb=Nb+Ac;
                        z=Nb;
                        if Nb~=Nb then
                            Bc=ra[30931]or Wc(113120,6169,30931)
                        else
                            Bc=22418
                        end
                    else
                        cc[44495]=L(X(Ac,8),255)
                        cc[30992]=L(X(Ac,16),255)
                        cc[65182]=L(X(Ac,24),255)
                        Bc=ra[-19073]or Wc(37633,38658,-19073)
                    end
                elseif Bc<=17719 then
                    if Bc<=9779 then
                        if Bc<=5942 then
                            if Bc>3997 then
                                if Bc<=5201 then
                                    rb=nil;
                                    Bc=11629;
                                else
                                    Nb=Ka(s_,1388901766)
                                    Bc=60683
                                    break
                                end
                            elseif Bc>3187 then
                                if qc then
                                    Bc=ra[-23206]or Wc(3155,45823,-23206)
                                    break
                                else
                                    Bc=ra[-8222]or Wc(85236,18526,-8222)
                                    break
                                end
                                Bc=ra[3854]or Wc(86069,33976,3854)
                            else
                                ka,i_=n_,nil;
                                Bc=6853;
                            end
                        elseif Bc<=8036 then
                            if Bc>7267 then
                                s_=Ka(Ac,59697883)
                                Bc=36607
                                break
                            elseif Bc<=6808 then
                                U=Ac;
                                if z~=z then
                                    Bc=ra[-31994]or Wc(54228,21931,-31994)
                                else
                                    Bc=26602
                                end
                            else
                                la=pa('B',Fb,oa);
                                oa=oa+1
                                Bc=ra[26185]or Wc(37380,18600,26185)
                            end
                        elseif Bc>9114 then
                            s_=0;
                            t_,z,Ac=1,4,0
                            Bc=6764
                        else
                            qc=false
                            Bc=ra[-22969]or Wc(126921,19156,-22969)
                        end
                    elseif Bc>13703 then
                        if Bc>15441 then
                            if Bc<=16362 then
                                Uc=Uc+Nb;
                                s_=Uc;
                                if Uc~=Uc then
                                    Bc=ra[-9599]or Wc(44092,32436,-9599)
                                else
                                    Bc=ra[19339]or Wc(39555,31117,19339)
                                end
                            else
                                i_=Ka(la,245)
                                Bc=62014
                                break
                            end
                        elseif Bc<=14570 then
                            if Bc<=14127 then
                                if Bc<=13909 then
                                    rb=Ka(M,1388901766)
                                    Bc=ra[-17631]or Wc(22760,65147,-17631)
                                    break
                                else
                                    Ac=Ka(z,245)
                                    Bc=36447
                                    break
                                end
                            elseif Bc>14289 then
                                M=k;
                                if qc~=qc then
                                    Bc=ra[-27105]or Wc(87035,48502,-27105)
                                else
                                    Bc=ra[-15328]or Wc(67998,7520,-15328)
                                end
                            else
                                Bc=ra[32192]or Wc(23691,60440,32192)
                                break
                            end
                        elseif Bc<=15052 then
                            rc=pa('<I4',Fb,oa);
                            oa=oa+4
                            Bc=ra[-28309]or Wc(58148,64175,-28309)
                        else
                            Zc=z;
                            if t_~=t_ then
                                Bc=19854
                            else
                                Bc=45735
                            end
                        end
                    elseif Bc>11353 then
                        if Bc>11853 then
                            Bc=ra[-23130]or Wc(6417,52623,-23130)
                            break
                        elseif Bc>11526 then
                            M=0;
                            mc,Uc,Nb=4,0,1
                            Bc=ra[-29164]or Wc(57196,56336,-29164)
                        else
                            cc[44495]=L(X(Ac,8),255)
                            ub=L(X(Ac,16),65535)
                            cc[65417]=ub
                            rc=nil
                            rc=if ub<32768 then ub else ub-65536
                            cc[31392]=rc
                            Bc=ra[28311]or Wc(92399,33640,28311)
                        end
                    elseif Bc>10803 then
                        M=rb;
                        Uc=Rc(M);
                        mc=function()
                            local va,Ta,qb,db,m,Ga,Ma,Tb,tc,bc,A,ib,Nc,pb,zc
                            Ta,ib={},function(sa,ad,N)
                                Ta[ad]=Wb(sa,28910)-Wb(N,22229)
                                return Ta[ad]
                            end
                            Ma=Ta[23215]or ib(93386,23215,53120)
                            repeat
                                while true do
                                    if Ma>32811 then
                                        if Ma<=47316 then
                                            if Ma>40002 then
                                                if Ma>43722 then
                                                    if Ma>46411 then
                                                        Ma=Ta[32427]or ib(38702,32427,17623)
                                                        break
                                                    else
                                                        zc=db;
                                                        m=Gb(m,ia(L(zc,127),tc*7))
                                                        if not gc(zc,128)then
                                                            Ma=Ta[11380]or ib(128626,11380,34354)
                                                            break
                                                        end
                                                        Ma=Ta[7618]or ib(88866,7618,26643)
                                                    end
                                                else
                                                    qb=Sb(bc)
                                                    Ma=49034
                                                    break
                                                end
                                            elseif Ma>36201 then
                                                if Ma>38622 then
                                                    qb=Sb''
                                                    Ma=Ta[-8538]or ib(114735,-8538,42978)
                                                    break
                                                else
                                                    qb=Nc
                                                    Ma=35200
                                                    break
                                                end
                                            elseif Ma>34680 then
                                                if Ma<=35536 then
                                                    pb=qb
                                                    Ma=Ta[-22475]or ib(61846,-22475,5447)
                                                else
                                                    Nc=pa('<d',Fb,oa);
                                                    oa=oa+8
                                                    Ma=Ta[8235]or ib(82304,8235,52576)
                                                end
                                            else
                                                Ga=nil;
                                                Ma=Ta[-25629]or ib(50670,-25629,50359);
                                            end
                                        elseif Ma>55090 then
                                            if Ma>58828 then
                                                if Ma>60912 then
                                                    db=nil;
                                                    Ma=56510;
                                                else
                                                    bc=bc+Tb;
                                                    tc=bc;
                                                    if bc~=bc then
                                                        Ma=Ta[31849]or ib(82426,31849,3459)
                                                    else
                                                        Ma=4476
                                                    end
                                                end
                                            else
                                                zc=pa('B',Fb,oa);
                                                oa=oa+1
                                                Ma=Ta[-14335]or ib(36027,-14335,35994)
                                            end
                                        elseif Ma>51876 then
                                            if Ma>53952 then
                                                Nc=Ka(m,1388901766)
                                                Ma=22548
                                                break
                                            else
                                                m=0;
                                                Tb,bc,va=1,0,4
                                                Ma=Ta[-13029]or ib(91638,-13029,35384)
                                            end
                                        elseif Ma>50440 then
                                            va=pa('c'..m,Fb,oa);
                                            oa=oa+m
                                            Ma=25099
                                        else
                                            pb=Na(qb[1],1,qb[2])
                                            Ma=Ta[4188]or ib(84536,4188,43557)
                                        end
                                    elseif Ma>14928 then
                                        if Ma<=20496 then
                                            if Ma>17897 then
                                                qb=Sb(nil);
                                                Ma=5693;
                                            elseif Ma>15729 then
                                                return pb
                                            else
                                                A=Ga;
                                                if A==3 then
                                                    Ma=Ta[14725]or ib(37082,14725,39061)
                                                    break
                                                elseif A==1 then
                                                    Ma=Ta[28627]or ib(8407,28627,22455)
                                                    break
                                                elseif A==2 then
                                                    Ma=Ta[-12837]or ib(63480,-12837,2205)
                                                    break
                                                end
                                                Ma=15846
                                            end
                                        elseif Ma<=23964 then
                                            m=Nc;
                                            if m==0 then
                                                Ma=Ta[1585]or ib(38464,1585,6271)
                                                break
                                            else
                                                Ma=Ta[9171]or ib(15118,9171,25174)
                                                break
                                            end
                                            Ma=Ta[-7560]or ib(96387,-7560,42213)
                                        elseif Ma<=25240 then
                                            bc=va
                                            Ma=Ta[18744]or ib(94191,18744,10743)
                                            break
                                        else
                                            Ga=Ka(A,245)
                                            Ma=15612
                                            break
                                        end
                                    elseif Ma>9427 then
                                        if Ma<=12412 then
                                            pb=nil
                                            Ma=Ta[-13189]or ib(1362,-13189,24835)
                                        else
                                            tc=bc;
                                            if va~=va then
                                                Ma=Ta[12841]or ib(43562,12841,21459)
                                            else
                                                Ma=4476
                                            end
                                        end
                                    elseif Ma<=6669 then
                                        if Ma<=5228 then
                                            if Ma>4536 then
                                                qb=nil;
                                                Ma=35873;
                                            else
                                                if(Tb>=0 and bc>va)or((Tb<0 or Tb~=Tb)and bc<va)then
                                                    Ma=Ta[-19661]or ib(107379,-19661,43786)
                                                else
                                                    Ma=Ta[-8445]or ib(85209,-8445,7048)
                                                end
                                            end
                                        elseif Ma>5837 then
                                            bc=nil;
                                            Ma=Ta[24944]or ib(125133,24944,39752);
                                        else
                                            Nc=nil;
                                            Ma=Ta[23834]or ib(93985,23834,1753);
                                        end
                                    elseif Ma<=8786 then
                                        db=Ka(zc,245)
                                        Ma=46306
                                        break
                                    else
                                        A=pa('B',Fb,oa);
                                        oa=oa+1
                                        Ma=25381
                                    end
                                end
                            until Ma==48269
                        end
                        Ac,Nb,s_=1,1,M
                        Bc=ra[9365]or Wc(130477,20945,9365)
                    else
                        t_[42978]=Uc[t_[31392]+1]
                        Bc=ra[-30370]or Wc(39290,60374,-30370)
                    end
                elseif Bc<=25573 then
                    if Bc>21717 then
                        if Bc>23784 then
                            if Bc>25099 then
                                Bc=ra[14032]or Wc(92212,60201,14032)
                                break
                            else
                                n_=Ka(ka,245)
                                Bc=2576
                                break
                            end
                        elseif Bc>22849 then
                            if Bc<=23123 then
                                Ac=nil;
                                Bc=ra[30917]or Wc(124758,17871,30917);
                            else
                                ub=L(X(Zc,10),1023);
                                t_[64958]=Uc[ub+1]
                                Bc=ra[13853]or Wc(74453,33591,13853)
                            end
                        else
                            if(Ac>=0 and Nb>s_)or((Ac<0 or Ac~=Ac)and Nb<s_)then
                                Bc=60484
                            else
                                Bc=53057
                            end
                        end
                    elseif Bc>19409 then
                        if Bc>20194 then
                            if Bc>20423 then
                                mc=pa('B',Fb,oa);
                                oa=oa+1
                                Bc=52615
                            else
                                k=k+rb;
                                M=k;
                                if k~=k then
                                    Bc=ra[18245]or Wc(117500,19057,18245)
                                else
                                    Bc=ra[29314]or Wc(89184,18922,29314)
                                end
                            end
                        else
                            return{[19119]=ka,[14073]=Ac,[27578]=k,[53254]='',[29413]=ba,[17581]=la}
                        end
                    else
                        t_[42978]=Uc[t_[31475]+1]
                        Bc=ra[-24713]or Wc(97543,50969,-24713)
                    end
                elseif Bc>29266 then
                    if Bc>31378 then
                        if Bc<=32188 then
                            if Bc<=31709 then
                                Mb=pa('B',Fb,oa);
                                oa=oa+1
                                Bc=45335
                            else
                                qc=Nb
                                Bc=ra[-17005]or Wc(80007,32010,-17005)
                            end
                        else
                            yb=0;
                            qc,rb,k=4,1,0
                            Bc=ra[-25241]or Wc(14338,60778,-25241)
                        end
                    elseif Bc<=30269 then
                        Uc=nil;
                        Bc=20535;
                    elseif Bc>30570 then
                        if(rb>=0 and k>qc)or((rb<0 or rb~=rb)and k<qc)then
                            Bc=ra[9579]or Wc(72590,29827,9579)
                        else
                            Bc=29893
                        end
                    else
                        Mb=Zc;
                        s_=Gb(s_,ia(L(Mb,127),U*7))
                        if not gc(Mb,128)then
                            Bc=ra[17362]or Wc(8710,59379,17362)
                            break
                        end
                        Bc=ra[-2044]or Wc(35017,64653,-2044)
                    end
                elseif Bc>27152 then
                    if Bc<=27991 then
                        if Bc<=27660 then
                            mc=rb;
                            if M~=M then
                                Bc=4985
                            else
                                Bc=47469
                            end
                        elseif Bc<=27921 then
                            Zc=nil;
                            Bc=31513;
                        else
                            Ac=pa('<I4',Fb,oa);
                            oa=oa+4
                            Bc=7771
                        end
                    elseif Bc>28568 then
                        Nb,s_,Ac=1,yb,1
                        Bc=57383
                    else
                        mc=Uc;
                        yb=Gb(yb,ia(L(mc,127),M*7))
                        if not gc(mc,128)then
                            Bc=ra[-6230]or Wc(77314,11398,-6230)
                            break
                        end
                        Bc=ra[26152]or Wc(95295,14754,26152)
                    end
                elseif Bc>26366 then
                    if Bc<=26832 then
                        if Bc>26667 then
                            ub=nil;
                            Bc=14864;
                        else
                            if(t_>=0 and Ac>z)or((t_<0 or t_~=t_)and Ac<z)then
                                Bc=ra[-30680]or Wc(37893,6042,-30680)
                            else
                                Bc=ra[-6068]or Wc(721,62322,-6068)
                            end
                        end
                    elseif Bc>27050 then
                        if(Nb>=0 and Uc>mc)or((Nb<0 or Nb~=Nb)and Uc<mc)then
                            Bc=ra[11867]or Wc(2452,49676,11867)
                        else
                            Bc=ra[-3048]or Wc(49976,40964,-3048)
                        end
                    else
                        Nb=nil;
                        Bc=25670;
                    end
                elseif Bc>25880 then
                    if Bc<=26044 then
                        z=z+U;
                        Zc=z;
                        if z~=z then
                            Bc=ra[29222]or Wc(86536,7675,29222)
                        else
                            Bc=ra[-3988]or Wc(90700,43168,-3988)
                        end
                    else
                        ba,n_=h,nil;
                        Bc=46412;
                    end
                elseif Bc<=25693 then
                    s_=nil;
                    Bc=ra[-30132]or Wc(32957,28733,-30132);
                else
                    Zc=t_[64747];
                    Mb,cc=X(Zc,30),L(X(Zc,20),1023);
                    t_[42978]=Uc[cc+1]
                    t_[53430]=Mb
                    if Mb==2 then
                        Bc=ra[-30318]or Wc(88919,11234,-30318)
                        break
                    elseif Mb==3 then
                        Bc=ra[18844]or Wc(106757,6594,18844)
                        break
                    end
                    Bc=ra[-7178]or Wc(120826,11862,-7178)
                end
            end
        until Bc==53624
    end
    local V=Ec()
    P[14728][Fb]=V
    return V
end
local function Ic(fb,xa)
    fb=eb(fb)
    local Za,cb=fb,getfenv()
    local function w_(Xc,Cc)
        local function lb(...)
            return{[20435]=nb('#',...),[42454]={...}}
        end
        local function jb(zb,La,da)
            local Eb,fc,Ub
            Ub,fc={},function(Aa,xc,Ya)
                Ub[xc]=Wb(Ya,5680)-Wb(Aa,9289)
                return Ub[xc]
            end
            Eb=Ub[7139]or fc(40539,7139,61332)
            repeat
                while true do
                    if Eb>36841 then
                        return zb[La],jb(zb,La+1,da)
                    elseif Eb<=22381 then
                        if La>da then
                            Eb=Ub[18125]or fc(23640,18125,61801)
                            break
                        end
                        Eb=57409
                    else
                        return
                    end
                end
            until Eb==27175
        end
        local function Yb(qa,sc,Cb,Ab)
            local Lc,Xa,Gc,Fa,Mc,Ha,fa_,Wa,x,D,Zb,Qc,W,nc,Qb,v,Z,Sa,Jb,na,Bb,ja,xb,q
            Ha,xb={},function(Fc,ha,ma)
                Ha[ha]=Wb(ma,57558)-Wb(Fc,32041)
                return Ha[ha]
            end
            v=Ha[-2307]or xb(27595,-2307,32439)
            repeat
                while true do
                    if v>32484 then
                        if v>48983 then
                            if v<=57042 then
                                if v<=53081 then
                                    if v<=51006 then
                                        if v<=49966 then
                                            if v<=49491 then
                                                Qb-=1
                                                Cb[Qb]={[508]=18,[44495]=Ka(D[44495],200),[30992]=Ka(D[30992],146),[65182]=0}
                                                v=Ha[-9918]or xb(17258,-9918,24435)
                                            else
                                                fa_[Sa]=Mc
                                                v=Ha[-28993]or xb(34015,-28993,108582)
                                            end
                                        elseif v>50436 then
                                            Qc[64958]=Bb
                                            v=Ha[20780]or xb(3665,20780,26369)
                                        else
                                            Zb=W+q-1
                                            v=Ha[27692]or xb(37332,27692,98157)
                                        end
                                    elseif v>52129 then
                                        if Wa>4 then
                                            v=Ha[9417]or xb(42822,9417,125334)
                                            break
                                        else
                                            v=Ha[-23999]or xb(32782,-23999,120267)
                                            break
                                        end
                                        v=Ha[-25488]or xb(24096,-25488,17597)
                                    elseif v>51696 then
                                        Gc=Gc..oc(Ka(tb(fa_,Lc+1),tb(q,Lc%#q+1)))
                                        v=Ha[-31027]or xb(17012,-31027,47375)
                                    elseif v>51500 then
                                        if v>51561 then
                                            if Wa>43 then
                                                v=Ha[16418]or xb(54486,16418,113042)
                                                break
                                            else
                                                v=Ha[17397]or xb(40791,17397,126636)
                                                break
                                            end
                                            v=Ha[10563]or xb(46942,10563,109327)
                                        else
                                            Qb+=D[31392]
                                            v=Ha[-22504]or xb(56512,-22504,115613)
                                        end
                                    else
                                        if Wa>193 then
                                            v=Ha[15321]or xb(41686,15321,98743)
                                            break
                                        else
                                            v=Ha[765]or xb(35302,765,130583)
                                            break
                                        end
                                        v=Ha[26916]or xb(61051,26916,128098)
                                    end
                                elseif v<=55067 then
                                    if v>53881 then
                                        if v<=54284 then
                                            if v<=54096 then
                                                Lc=Fa;
                                                if Sa~=Sa then
                                                    v=Ha[-28769]or xb(63332,-28769,105161)
                                                else
                                                    v=Ha[-8121]or xb(62082,-8121,126668)
                                                end
                                            elseif v<=54194 then
                                                Qb+=1
                                                v=Ha[-15508]or xb(65096,-15508,123925)
                                            else
                                                Bb=q
                                                v=Ha[3665]or xb(28349,3665,14603)
                                                break
                                            end
                                        else
                                            Qb+=D[31392]
                                            v=Ha[15351]or xb(50487,15351,121174)
                                        end
                                    else
                                        Bb=nil;
                                        v=Ha[-20406]or xb(3257,-20406,17727);
                                    end
                                elseif v<=56178 then
                                    if v<=55761 then
                                        if v>55423 then
                                            if v<=55479 then
                                                q=x-1
                                                v=Ha[21954]or xb(23834,21954,12839)
                                            else
                                                if Wa>115 then
                                                    v=Ha[-11434]or xb(48133,-11434,127732)
                                                    break
                                                else
                                                    v=Ha[-31735]or xb(47131,-31735,107508)
                                                    break
                                                end
                                                v=Ha[16715]or xb(45662,16715,110607)
                                            end
                                        else
                                            Qc=Ab[20435]
                                            Zb=W+Qc-1
                                            v=Ha[7624]or xb(13540,7624,11596)
                                        end
                                    elseif v>56085 then
                                        x=Zb-Qc+1
                                        v=Ha[23777]or xb(40000,23777,128739)
                                    else
                                        Jb={[3]=qa[Z[30992]],[2]=3};
                                        Jb[1]=Jb
                                        fa_[Sa]=Jb
                                        v=Ha[-28743]or xb(16071,-28743,29246)
                                    end
                                else
                                    W,Qc,x=Ka(D[44495],88),Ka(D[65182],208),Ka(D[30992],45);
                                    Bb,nc=Qc==0 and Zb-W or Qc-1,qa[W];
                                    fa_=lb(nc(jb(qa,W+1,W+Bb)));
                                    q=fa_[20435];
                                    if x==0 then
                                        v=Ha[20406]or xb(28148,20406,13387)
                                        break
                                    else
                                        v=Ha[10942]or xb(34991,10942,77549)
                                        break
                                    end
                                    v=Ha[-8396]or xb(61147,-8396,108134)
                                end
                            elseif v>61038 then
                                if v<=63154 then
                                    if v<=62097 then
                                        if v<=61589 then
                                            nc=Gc
                                            v=39384
                                            break
                                        else
                                            qa[D[44495]]=x[D[64958]]
                                            v=Ha[13099]or xb(28571,13099,20441)
                                        end
                                    elseif v>62581 then
                                        Gc=nc;
                                        if fa_~=fa_ then
                                            v=Ha[-20807]or xb(21334,-20807,41880)
                                        else
                                            v=Ha[9249]or xb(20028,9249,34745)
                                        end
                                    elseif v>62464 then
                                        if v<=62534 then
                                            if Wa>227 then
                                                v=Ha[15145]or xb(27833,15145,30649)
                                                break
                                            else
                                                v=Ha[19977]or xb(54671,19977,371)
                                                break
                                            end
                                            v=Ha[32231]or xb(15281,32231,10028)
                                        else
                                            Jb=Z[30992];
                                            Mc=na[Jb];
                                            if Mc==nil then
                                                v=Ha[-10739]or xb(54090,-10739,13223)
                                                break
                                            end
                                            v=Ha[-28349]or xb(7094,-28349,117220)
                                        end
                                    else
                                        qa[D[65182]][qa[D[44495]]]=qa[D[30992]]
                                        v=Ha[12290]or xb(27202,12290,30747)
                                    end
                                elseif v<=64206 then
                                    if v>63850 then
                                        Qc,x,Bb=hc(Qc)
                                        v=Ha[4398]or xb(41377,4398,104574)
                                    else
                                        Qc,x,Bb=na;
                                        if R(Qc)~='function'then
                                            v=Ha[-12396]or xb(50638,-12396,5792)
                                            break
                                        end;
                                        v=Ha[-7556]or xb(24451,-7556,24092);
                                    end
                                elseif v>64768 then
                                    Qb-=1
                                    Cb[Qb]={[508]=124,[44495]=Ka(D[44495],44),[30992]=Ka(D[30992],238),[65182]=0}
                                    v=Ha[-7347]or xb(12295,-7347,11846)
                                else
                                    nc,fa_=Qc(x,Bb);
                                    Bb=nc;
                                    if Bb==nil then
                                        v=34525
                                    else
                                        v=6356
                                    end
                                end
                            elseif v>59024 then
                                if v<=60238 then
                                    if Wa>91 then
                                        v=Ha[-30322]or xb(36422,-30322,122200)
                                        break
                                    else
                                        v=Ha[30289]or xb(29128,30289,29200)
                                        break
                                    end
                                    v=Ha[22271]or xb(32509,22271,26080)
                                elseif v<=60722 then
                                    if v<=60631 then
                                        Qc[42978]=x
                                        if W==2 then
                                            v=Ha[-16609]or xb(33219,-16609,76886)
                                            break
                                        elseif W==3 then
                                            v=Ha[19661]or xb(28699,19661,10981)
                                            break
                                        end
                                        v=5215
                                    else
                                        Qc,x,Bb=W.__iter(Qc)
                                        v=Ha[20198]or xb(40267,20198,105556)
                                    end
                                else
                                    if(Fa>=0 and q>Gc)or((Fa<0 or Fa~=Fa)and q<Gc)then
                                        v=Ha[-16912]or xb(5170,-16912,32477)
                                    else
                                        v=Ha[31742]or xb(62065,31742,14560)
                                    end
                                end
                            elseif v>58056 then
                                W[42978]=Qc
                                D[508]=209
                                v=Ha[28661]or xb(22517,28661,19688)
                            elseif v>57603 then
                                if v<=57990 then
                                    if Wa>38 then
                                        v=Ha[29318]or xb(47766,29318,97256)
                                        break
                                    else
                                        v=Ha[-30389]or xb(11504,-30389,125526)
                                        break
                                    end
                                    v=Ha[6227]or xb(37459,6227,102410)
                                else
                                    qa[D[44495]]=x
                                    v=Ha[-29808]or xb(58688,-29808,119824)
                                end
                            else
                                if D[65182]==52 then
                                    v=Ha[16990]or xb(35690,16990,118591)
                                    break
                                else
                                    v=Ha[-3141]or xb(56791,-3141,125298)
                                    break
                                end
                                v=Ha[29860]or xb(30211,29860,27738)
                            end
                        elseif v<=40867 then
                            if v<=36949 then
                                if v>34794 then
                                    Qb-=1
                                    Cb[Qb]={[508]=250,[44495]=Ka(D[44495],98),[30992]=Ka(D[30992],230),[65182]=0}
                                    v=Ha[11146]or xb(57414,11146,130567)
                                elseif v>33869 then
                                    if v>34479 then
                                        if v<=34606 then
                                            v=Ha[30601]or xb(54724,30601,122425);
                                            break;
                                        else
                                            Zb,Qb,na,Xa,ja=-1,1,Hc({},{__mode='vs'}),Hc({},{__mode='ks'}),false;
                                            v=33122;
                                        end
                                    elseif v<=34274 then
                                        W,Qc,x=D[65182],D[44495],D[30992]-1;
                                        if x==-1 then
                                            v=Ha[25805]or xb(55295,25805,91874)
                                            break
                                        end
                                        v=13516
                                    else
                                        if Wa>82 then
                                            v=Ha[-23502]or xb(47975,-23502,128762)
                                            break
                                        else
                                            v=Ha[-11521]or xb(41910,-11521,1844)
                                            break
                                        end
                                        v=Ha[-16122]or xb(43184,-16122,112173)
                                    end
                                elseif v>33396 then
                                    Qa(Ab[42454],1,Qc,W,qa)
                                    v=Ha[2976]or xb(5859,2976,3578)
                                elseif v<=33087 then
                                    W,Qc,x=D[53430],Cb[Qb+1],nil;
                                    v=Ha[-31820]or xb(46964,-31820,116217);
                                else
                                    if not ja then
                                        v=Ha[23688]or xb(3401,23688,16465)
                                        break
                                    end
                                    v=38933
                                end
                            elseif v<=39064 then
                                if v>38107 then
                                    if v<=38644 then
                                        return jb(qa,W,W+Bb-1)
                                    elseif v>38853 then
                                        ja=false
                                        Qb+=1
                                        if Wa>126 then
                                            v=Ha[29568]or xb(15810,29568,22406)
                                            break
                                        else
                                            v=Ha[5344]or xb(47934,5344,13726)
                                            break
                                        end
                                        v=Ha[3703]or xb(32776,3703,106069)
                                    else
                                        W=ob(Qc)
                                        if W~=nil and W.__iter~=nil then
                                            v=Ha[30178]or xb(665,30178,28980)
                                            break
                                        elseif R(Qc)=='table'then
                                            v=Ha[-11969]or xb(19318,-11969,13517)
                                            break
                                        end
                                        v=Ha[14948]or xb(21111,14948,117531)
                                    end
                                else
                                    W,Qc=D[44495],D[30992]-1;
                                    if Qc==-1 then
                                        v=Ha[32437]or xb(49533,32437,95310)
                                        break
                                    end
                                    v=33741
                                end
                            elseif v>39959 then
                                if v<=40407 then
                                    if v>40174 then
                                        Qc,x,Bb=hc(Qc)
                                        v=Ha[-8178]or xb(48069,-8178,74637)
                                    elseif v<=39998 then
                                        nc,fa_=Qc(x,Bb);
                                        Bb=nc;
                                        if Bb==nil then
                                            v=24944
                                        else
                                            v=Ha[32012]or xb(20635,32012,40863)
                                        end
                                    else
                                        Qb+=1
                                        v=Ha[-553]or xb(48592,-553,107149)
                                    end
                                else
                                    Z=Gc;
                                    if Fa~=Fa then
                                        v=Ha[-13860]or xb(40880,-13860,87720)
                                    else
                                        v=Ha[-22541]or xb(39584,-22541,113255)
                                    end
                                end
                            elseif v>39228 then
                                Qc[1211]=nc
                                v=Ha[8832]or xb(31660,8832,64050)
                            else
                                if Wa>119 then
                                    v=Ha[12597]or xb(41846,12597,122403)
                                    break
                                else
                                    v=Ha[-14952]or xb(28949,-14952,1056)
                                    break
                                end
                                v=Ha[452]or xb(14076,452,11745)
                            end
                        elseif v<=44843 then
                            if v>42879 then
                                if v>44031 then
                                    Qc[64958]=Bb
                                    nc=nil
                                    v=Ha[-18252]or xb(25090,-18252,35627)
                                elseif v<=43636 then
                                    if v<=43468 then
                                        if v>43315 then
                                            Qb-=1
                                            Cb[Qb]={[508]=178,[44495]=Ka(D[44495],245),[30992]=Ka(D[30992],73),[65182]=0}
                                            v=Ha[-15994]or xb(18044,-15994,23649)
                                        else
                                            nc=nc+q;
                                            Gc=nc;
                                            if nc~=nc then
                                                v=Ha[-29941]or xb(754,-29941,29820)
                                            else
                                                v=13402
                                            end
                                        end
                                    else
                                        qa[D[65182]]=qa[D[44495]][qa[D[30992]]]
                                        v=Ha[-23188]or xb(29197,-23188,28752)
                                    end
                                else
                                    Bb=Zb-W+1
                                    v=Ha[-9266]or xb(42269,-9266,102097)
                                end
                            elseif v<=41925 then
                                if v>41365 then
                                    if v<=41718 then
                                        nc,fa_=Qc[64958],D[64958];
                                        fa_='\31\137\199'..fa_
                                        q=''
                                        Sa,Gc,Fa=1,0,#nc-1
                                        v=Ha[-20755]or xb(3254,-20755,128721)
                                    else
                                        if Wa>25 then
                                            v=Ha[-31001]or xb(4741,-31001,121341)
                                            break
                                        else
                                            v=Ha[-6041]or xb(47116,-6041,8095)
                                            break
                                        end
                                        v=Ha[18313]or xb(32598,18313,25399)
                                    end
                                else
                                    Qc,x,Bb=na;
                                    if R(Qc)~='function'then
                                        v=Ha[-9755]or xb(61951,-9755,10357)
                                        break
                                    end;
                                    v=Ha[-7378]or xb(22681,-7378,43386);
                                end
                            elseif v<=42415 then
                                if v>42108 then
                                    cb[D[42978]]=qa[D[65182]]
                                    Qb+=1
                                    v=Ha[26308]or xb(24199,26308,17862)
                                elseif v<=42036 then
                                    Qc,x,Bb=hc(Qc)
                                    v=Ha[-14779]or xb(17844,-14779,48207)
                                else
                                    Z=Gc;
                                    if Fa~=Fa then
                                        v=Ha[19835]or xb(27365,19835,52963)
                                    else
                                        v=Ha[11648]or xb(60252,11648,125910)
                                    end
                                end
                            elseif v>42660 then
                                if Wa>180 then
                                    v=Ha[4101]or xb(43191,4101,128683)
                                    break
                                else
                                    v=Ha[10889]or xb(18711,10889,1820)
                                    break
                                end
                                v=Ha[10387]or xb(59482,10387,128515)
                            else
                                fa_=fa_+Gc;
                                Fa=fa_;
                                if fa_~=fa_ then
                                    v=Ha[5654]or xb(18619,5654,17628)
                                else
                                    v=Ha[11833]or xb(62609,11833,31892)
                                end
                            end
                        elseif v<=46775 then
                            if v>45456 then
                                if v<=45901 then
                                    Qa(fa_[42454],1,q,W,qa)
                                    v=Ha[27794]or xb(5130,27794,2643)
                                elseif v>46004 then
                                    Qb-=1
                                    Cb[Qb]={[508]=221,[44495]=Ka(D[44495],179),[30992]=Ka(D[30992],189),[65182]=0}
                                    v=Ha[26705]or xb(11780,26705,13401)
                                else
                                    W=Cc[D[30992]+1];
                                    W[1][W[2]]=qa[D[44495]]
                                    v=Ha[17208]or xb(9470,17208,15343)
                                end
                            else
                                if Wa>46 then
                                    v=Ha[-20770]or xb(13899,-20770,37347)
                                    break
                                else
                                    v=Ha[19832]or xb(2549,19832,39474)
                                    break
                                end
                                v=Ha[-24772]or xb(63567,-24772,124446)
                            end
                        elseif v>47976 then
                            if v>48533 then
                                W=D[42978];
                                qa[D[65182]][W]=qa[D[44495]]
                                Qb+=1
                                v=Ha[13703]or xb(38813,13703,101568)
                            else
                                Bb=nil;
                                v=Ha[29528]or xb(38588,29528,93779);
                            end
                        elseif v<=47613 then
                            W,Qc=Cb[Qb],nil;
                            v=24060;
                        else
                            Bb=Qc-1
                            v=Ha[15916]or xb(42634,15916,102816)
                        end
                    elseif v>16211 then
                        if v>24409 then
                            if v<=28546 then
                                if v>26503 then
                                    if v<=27425 then
                                        if v>26680 then
                                            qa[D[44495]]=qa[D[30992]]
                                            v=Ha[-17652]or xb(18612,-17652,22057)
                                        else
                                            Qb-=1
                                            Cb[Qb]={[508]=226,[44495]=Ka(D[44495],125),[30992]=Ka(D[30992],99),[65182]=0}
                                            v=Ha[21894]or xb(7285,21894,616)
                                        end
                                    elseif v<=27980 then
                                        if v<=27828 then
                                            W,Qc=D[44495],D[30992];
                                            x=Qc-1;
                                            if x==-1 then
                                                v=Ha[-10827]or xb(30162,-10827,21601)
                                                break
                                            else
                                                v=Ha[-27985]or xb(44708,-27985,93751)
                                                break
                                            end
                                            v=38355
                                        else
                                            if not qa[D[44495]]then
                                                v=Ha[16497]or xb(36687,16497,88943)
                                                break
                                            end
                                            v=Ha[12272]or xb(58241,12272,114908)
                                        end
                                    else
                                        Qc=nc
                                        v=58949
                                        break
                                    end
                                elseif v>25596 then
                                    if v>26086 then
                                        if v>26368 then
                                            Qc,x,Bb=W.__iter(Qc)
                                            v=Ha[-25635]or xb(6416,-25635,26851)
                                        else
                                            if Wa>103 then
                                                v=Ha[-3707]or xb(10024,-3707,4727)
                                                break
                                            else
                                                v=Ha[13466]or xb(4061,13466,113517)
                                                break
                                            end
                                            v=Ha[-6916]or xb(38032,-6916,101325)
                                        end
                                    else
                                        if Wa>220 then
                                            v=Ha[23090]or xb(52452,23090,110892)
                                            break
                                        else
                                            v=Ha[28113]or xb(17312,28113,46591)
                                            break
                                        end
                                        v=Ha[32279]or xb(46000,32279,110381)
                                    end
                                elseif v>24835 then
                                    if v>24933 then
                                        Qc,x,Bb=Xa;
                                        if R(Qc)~='function'then
                                            v=Ha[-14863]or xb(23557,-14863,22644)
                                            break
                                        end;
                                        v=Ha[20578]or xb(38176,20578,66734);
                                    else
                                        q=q+Fa;
                                        Sa=q;
                                        if q~=q then
                                            v=Ha[-24803]or xb(31490,-24803,56269)
                                        else
                                            v=Ha[7304]or xb(7127,7304,111621)
                                        end
                                    end
                                else
                                    if Wa>125 then
                                        v=Ha[13772]or xb(58293,13772,130926)
                                        break
                                    else
                                        v=Ha[13990]or xb(32020,13990,17891)
                                        break
                                    end
                                    v=Ha[28418]or xb(21349,28418,20344)
                                end
                            elseif v<=30826 then
                                if v<=29797 then
                                    if v<=29531 then
                                        if v>29383 then
                                            if(Sa>=0 and Gc>Fa)or((Sa<0 or Sa~=Sa)and Gc<Fa)then
                                                v=Ha[-19366]or xb(63317,-19366,114359)
                                            else
                                                v=Ha[-23575]or xb(64671,-23575,10692)
                                            end
                                        else
                                            nc=nc..oc(Ka(tb(x,Fa+1),tb(Bb,Fa%#Bb+1)))
                                            v=Ha[32358]or xb(20462,32358,14437)
                                        end
                                    else
                                        Qb-=1
                                        Cb[Qb]={[508]=4,[44495]=Ka(D[44495],167),[30992]=Ka(D[30992],141),[65182]=0}
                                        v=Ha[15895]or xb(34978,15895,103995)
                                    end
                                elseif v<=30072 then
                                    if(Sa>=0 and Gc>Fa)or((Sa<0 or Sa~=Sa)and Gc<Fa)then
                                        v=Ha[3336]or xb(43850,3336,3098)
                                    else
                                        v=Ha[-15372]or xb(36931,-15372,4915)
                                    end
                                else
                                    if Wa>214 then
                                        v=Ha[12304]or xb(10930,12304,12472)
                                        break
                                    else
                                        v=Ha[15819]or xb(20715,15819,5706)
                                        break
                                    end
                                    v=Ha[-2299]or xb(58873,-2299,129764)
                                end
                            elseif v>31649 then
                                if v<=32221 then
                                    W,Qc=nil,Ka(D[65417],63675);
                                    W=if Qc<32768 then Qc else Qc-65536
                                    x=W
                                    Bb=sc[x+1]
                                    nc=Bb[17581]
                                    fa_=Rc(nc)
                                    qa[Ka(D[44495],130)]=w_(Bb,fa_)
                                    Fa,Gc,q=1,nc,1
                                    v=6516
                                elseif v<=32303 then
                                    if Wa>112 then
                                        v=Ha[-13263]or xb(24332,-13263,11334)
                                        break
                                    else
                                        v=Ha[-20845]or xb(42563,-20845,112739)
                                        break
                                    end
                                    v=Ha[-18425]or xb(3834,-18425,5603)
                                else
                                    if(Z>=0 and Fa>Sa)or((Z<0 or Z~=Z)and Fa<Sa)then
                                        v=Ha[-22573]or xb(17436,-22573,117201)
                                    else
                                        v=Ha[13119]or xb(9756,13119,116461)
                                    end
                                end
                            elseif v>31163 then
                                Bb=qa[W]
                                fa_,q,nc=Qc,1,W+1
                                v=62801
                            else
                                if Wa>235 then
                                    v=Ha[-5989]or xb(26184,-5989,35960)
                                    break
                                else
                                    v=Ha[-14003]or xb(37687,-14003,109438)
                                    break
                                end
                                v=Ha[3709]or xb(19923,3709,21130)
                            end
                        elseif v>20356 then
                            if v>22353 then
                                if v>23443 then
                                    if v>24103 then
                                        W,Qc,x=D[65182],D[30992],D[42978];
                                        Bb=qa[Qc];
                                        qa[W+1]=Bb
                                        qa[W]=Bb[x]
                                        Qb+=1
                                        v=Ha[-25804]or xb(60222,-25804,128943)
                                    elseif v<=24003 then
                                        if Wa>224 then
                                            v=Ha[29603]or xb(17063,29603,119651)
                                            break
                                        else
                                            v=Ha[26614]or xb(2894,26614,14855)
                                            break
                                        end
                                        v=Ha[-27886]or xb(28151,-27886,29334)
                                    else
                                        x,Bb=W[42978],D[42978];
                                        Bb='\31\137\199'..Bb
                                        nc=''
                                        fa_,q,Gc=0,#x-1,1
                                        v=Ha[-27053]or xb(18717,-27053,27059)
                                    end
                                elseif v<=23031 then
                                    if(Fa>=0 and q>Gc)or((Fa<0 or Fa~=Fa)and q<Gc)then
                                        v=Ha[-24725]or xb(21036,-24725,20657)
                                    else
                                        v=Ha[-22480]or xb(60146,-22480,3611)
                                    end
                                elseif v>23257 then
                                    Gc=Gc+Sa;
                                    Z=Gc;
                                    if Gc~=Gc then
                                        v=Ha[-18785]or xb(34858,-18785,75838)
                                    else
                                        v=Ha[-16787]or xb(13629,-16787,23530)
                                    end
                                elseif v<=23163 then
                                    if Wa>185 then
                                        v=Ha[20825]or xb(49762,20825,12172)
                                        break
                                    else
                                        v=Ha[-12184]or xb(34661,-12184,113095)
                                        break
                                    end
                                    v=Ha[3552]or xb(64161,3552,124988)
                                else
                                    Bb,nc=Qc[42978],D[42978];
                                    nc='\31\137\199'..nc
                                    fa_=''
                                    Gc,Fa,q=#Bb-1,1,0
                                    v=Ha[27466]or xb(57625,27466,22008)
                                end
                            elseif v<=21352 then
                                if v<=20897 then
                                    if v>20666 then
                                        if v>20806 then
                                            if v<=20850 then
                                                if D[65182]==110 then
                                                    v=Ha[19593]or xb(62922,19593,91811)
                                                    break
                                                elseif D[65182]==192 then
                                                    v=Ha[-14391]or xb(47080,-14391,10798)
                                                    break
                                                else
                                                    v=Ha[-16735]or xb(52605,-16735,1241)
                                                    break
                                                end
                                                v=Ha[22729]or xb(5411,22729,2490)
                                            else
                                                fa_[3]=fa_[1][fa_[2]]
                                                fa_[1]=fa_
                                                fa_[2]=3
                                                na[nc]=nil
                                                v=Ha[5807]or xb(45938,5807,101037)
                                            end
                                        else
                                            W,Qc=nil,Ka(D[65417],48652);
                                            W=if Qc<32768 then Qc else Qc-65536
                                            x=W
                                            qa[Ka(D[44495],90)]=x
                                            v=Ha[-7966]or xb(17709,-7966,22960)
                                        end
                                    elseif v<=20556 then
                                        W=D[42978];
                                        qa[D[65182]]=qa[D[44495]][W]
                                        Qb+=1
                                        v=Ha[5115]or xb(52773,5115,119992)
                                    else
                                        Bb..=qa[Gc]
                                        v=Ha[-9074]or xb(9871,-9074,123909)
                                    end
                                else
                                    fa_[Sa]=Cc[Z[30992]+1]
                                    v=Ha[4681]or xb(32878,4681,109719)
                                end
                            elseif v<=22033 then
                                Fa=fa_;
                                if q~=q then
                                    v=Ha[-18546]or xb(41501,-18546,109946)
                                else
                                    v=4746
                                end
                            else
                                Z=Cb[Qb];
                                Qb+=1
                                Lc=Z[44495]
                                if Lc==0 then
                                    v=Ha[4656]or xb(51943,4656,94796)
                                    break
                                elseif Lc==1 then
                                    v=Ha[12783]or xb(7908,12783,112869)
                                    break
                                elseif Lc==2 then
                                    v=Ha[24477]or xb(8100,24477,21799)
                                    break
                                end
                                v=Ha[-1307]or xb(6689,-1307,22228)
                            end
                        elseif v>18334 then
                            if v>19436 then
                                if v<=19942 then
                                    if v>19739 then
                                        W=Cc[D[30992]+1];
                                        qa[D[44495]]=W[1][W[2]]
                                        v=Ha[8708]or xb(47248,8708,108493)
                                    else
                                        fa_,q=Qc[1211],D[1211];
                                        q='\31\137\199'..q
                                        Gc=''
                                        Fa,Z,Sa=0,1,#fa_-1
                                        v=Ha[-30241]or xb(43708,-30241,84615)
                                    end
                                else
                                    q=q+Fa;
                                    Sa=q;
                                    if q~=q then
                                        v=Ha[9187]or xb(48820,9187,107561)
                                    else
                                        v=22626
                                    end
                                end
                            elseif v>18814 then
                                if Wa>100 then
                                    v=Ha[3076]or xb(51465,3076,92587)
                                    break
                                else
                                    v=Ha[4145]or xb(64700,4145,123425)
                                    break
                                end
                                v=Ha[1950]or xb(14685,1950,9472)
                            else
                                fa_=fa_..oc(Ka(tb(Bb,Sa+1),tb(nc,Sa%#nc+1)))
                                v=Ha[-459]or xb(14464,-459,18386)
                            end
                        elseif v<=17359 then
                            if v<=16529 then
                                fa_[3]=fa_[1][fa_[2]]
                                fa_[1]=fa_
                                fa_[2]=3
                                na[nc]=nil
                                v=Ha[-18451]or xb(65226,-18451,18185)
                            else
                                W,Qc=D[30992],D[44495];
                                x,Bb=Q(Ra,qa,'',W,Qc);
                                if not x then
                                    v=Ha[32539]or xb(8447,32539,14508)
                                    break
                                end
                                v=Ha[13107]or xb(15143,13107,47627)
                            end
                        elseif v<=18074 then
                            Gc=Gc+Sa;
                            Z=Gc;
                            if Gc~=Gc then
                                v=Ha[-18454]or xb(46255,-18454,16185)
                            else
                                v=Ha[-8291]or xb(63680,-8291,6818)
                            end
                        else
                            q=q..oc(Ka(tb(nc,Z+1),tb(fa_,Z%#fa_+1)))
                            v=Ha[-22337]or xb(17174,-22337,31002)
                        end
                    elseif v>7907 then
                        if v>12485 then
                            if v<=14501 then
                                if v<=13784 then
                                    if v>13422 then
                                        if v>13559 then
                                            if Wa>21 then
                                                v=Ha[-28680]or xb(40318,-28680,3821)
                                                break
                                            else
                                                v=Ha[28166]or xb(41810,28166,117513)
                                                break
                                            end
                                            v=Ha[23948]or xb(54239,23948,118926)
                                        elseif v>13534 then
                                            x=fa_
                                            v=Ha[18477]or xb(25802,18477,124580)
                                            break
                                        else
                                            Qa(qa,Qc,Qc+x-1,D[64747],qa[W])
                                            Qb+=1
                                            v=Ha[4266]or xb(61356,4266,127793)
                                        end
                                    elseif v>13322 then
                                        if v>13401 then
                                            if(q>=0 and nc>fa_)or((q<0 or q~=q)and nc<fa_)then
                                                v=Ha[-21588]or xb(55221,-21588,24509)
                                            else
                                                v=Ha[22030]or xb(38670,22030,121399)
                                            end
                                        else
                                            nc,fa_=Qc[64958],D[64958];
                                            fa_='\31\137\199'..fa_
                                            q=''
                                            Fa,Sa,Gc=#nc-1,1,0
                                            v=40846
                                        end
                                    else
                                        qa[D[44495]]=nil
                                        v=Ha[-26284]or xb(21938,-26284,18731)
                                    end
                                else
                                    if Wa>3 then
                                        v=Ha[-12523]or xb(54128,-12523,93554)
                                        break
                                    else
                                        v=Ha[32374]or xb(25435,32374,7620)
                                        break
                                    end
                                    v=Ha[20363]or xb(41975,20363,98454)
                                end
                            elseif v<=15175 then
                                if v>14737 then
                                    if v>14821 then
                                        if Wa>13 then
                                            v=Ha[1724]or xb(5086,1724,17615)
                                            break
                                        else
                                            v=Ha[27676]or xb(31719,27676,13793)
                                            break
                                        end
                                        v=Ha[-26020]or xb(36554,-26020,103827)
                                    else
                                        Qb-=1
                                        Cb[Qb]={[508]=188,[44495]=Ka(D[44495],19),[30992]=Ka(D[30992],19),[65182]=0}
                                        v=Ha[-6035]or xb(26492,-6035,31585)
                                    end
                                else
                                    if D[65182]==155 then
                                        v=Ha[-19857]or xb(61724,-19857,129592)
                                        break
                                    elseif D[65182]==193 then
                                        v=Ha[-30992]or xb(22657,-30992,31022)
                                        break
                                    elseif D[65182]==219 then
                                        v=Ha[21698]or xb(3512,21698,28415)
                                        break
                                    elseif D[65182]==248 then
                                        v=Ha[-19873]or xb(42655,-19873,97055)
                                        break
                                    else
                                        v=Ha[7352]or xb(38554,7352,105859)
                                        break
                                    end
                                    v=Ha[8666]or xb(18639,8666,22430)
                                end
                            elseif v>15534 then
                                if v>15660 then
                                    W=ob(Qc)
                                    if W~=nil and W.__iter~=nil then
                                        v=Ha[10633]or xb(48453,10633,85341)
                                        break
                                    elseif R(Qc)=='table'then
                                        v=Ha[-7466]or xb(32978,-7466,71698)
                                        break
                                    end
                                    v=Ha[-6992]or xb(40017,-6992,105806)
                                else
                                    if fa_[2]>=D[44495]then
                                        v=Ha[-28547]or xb(49930,-28547,7856)
                                        break
                                    end
                                    v=Ha[16135]or xb(43670,16135,7021)
                                end
                            else
                                W=ob(Qc)
                                if W~=nil and W.__iter~=nil then
                                    v=Ha[-20446]or xb(20227,-20446,31067)
                                    break
                                elseif R(Qc)=='table'then
                                    v=Ha[-8397]or xb(6343,-8397,125241)
                                    break
                                end
                                v=Ha[27832]or xb(23528,27832,43627)
                            end
                        elseif v<=10769 then
                            if v<=9975 then
                                if v<=9447 then
                                    nc,fa_=Qc(x,Bb);
                                    Bb=nc;
                                    if Bb==nil then
                                        v=Ha[-28428]or xb(44883,-28428,111370)
                                    else
                                        v=15561
                                    end
                                elseif v<=9584 then
                                    Mc={[2]=Jb,[1]=qa}
                                    na[Jb]=Mc
                                    v=Ha[19903]or xb(32679,19903,9719)
                                else
                                    W=D[42978];
                                    qa[D[44495]]=cb[W]or P[56941][W]
                                    Qb+=1
                                    v=Ha[2383]or xb(16355,2383,9466)
                                end
                            elseif v>10669 then
                                if Wa>182 then
                                    v=Ha[24914]or xb(18235,24914,29921)
                                    break
                                else
                                    v=Ha[-13385]or xb(60,-13385,115876)
                                    break
                                end
                                v=Ha[21636]or xb(63145,21636,126004)
                            else
                                qa[D[44495]]=x[D[64958]][D[1211]]
                                v=Ha[22182]or xb(20070,22182,12154)
                            end
                        elseif v>11793 then
                            if v>12156 then
                                D=Cb[Qb]
                                Wa=D[508]
                                v=Ha[-1254]or xb(16725,-1254,13383)
                            else
                                qa[D[44495]]=D[65182]==1
                                Qb+=D[30992]
                                v=Ha[372]or xb(41325,372,114032)
                            end
                        else
                            if Wa>40 then
                                v=Ha[7362]or xb(22835,7362,658)
                                break
                            else
                                v=Ha[30748]or xb(5757,30748,109939)
                                break
                            end
                            v=Ha[-24781]or xb(30475,-24781,27474)
                        end
                    elseif v>3815 then
                        if v<=5732 then
                            if v<=4608 then
                                if v>4000 then
                                    if Wa>186 then
                                        v=Ha[-22498]or xb(64830,-22498,3464)
                                        break
                                    else
                                        v=Ha[11561]or xb(22933,11561,129152)
                                        break
                                    end
                                    v=Ha[-13810]or xb(24279,-13810,17846)
                                else
                                    if Wa>64 then
                                        v=Ha[-30755]or xb(20937,-30755,29608)
                                        break
                                    else
                                        v=Ha[-24621]or xb(40842,-24621,91510)
                                        break
                                    end
                                    v=Ha[-23494]or xb(36454,-23494,103527)
                                end
                            elseif v>4992 then
                                if v>5271 then
                                    qa[D[65182]]=Bb
                                    v=Ha[8549]or xb(10809,8549,14500)
                                else
                                    D[508]=39
                                    Qb+=1
                                    v=Ha[18782]or xb(42904,18782,113861)
                                end
                            elseif v>4702 then
                                if(Gc>=0 and fa_>q)or((Gc<0 or Gc~=Gc)and fa_<q)then
                                    v=Ha[-6114]or xb(48815,-6114,119080)
                                else
                                    v=Ha[-17213]or xb(34599,-17213,101538)
                                end
                            else
                                Qc,x,Bb=W.__iter(Qc)
                                v=Ha[26334]or xb(33841,26334,70993)
                            end
                        elseif v>6656 then
                            if v<=7178 then
                                Fa=Fa+Z;
                                Lc=Fa;
                                if Fa~=Fa then
                                    v=Ha[-19807]or xb(28792,-19807,7669)
                                else
                                    v=Ha[3863]or xb(53346,3863,117612)
                                end
                            else
                                Qb-=1
                                Cb[Qb]={[508]=44,[44495]=Ka(D[44495],251),[30992]=Ka(D[30992],39),[65182]=0}
                                v=Ha[-23197]or xb(15144,-23197,10165)
                            end
                        elseif v>6126 then
                            if v<=6436 then
                                if v<=6377 then
                                    l_(fa_)
                                    Xa[nc]=nil
                                    v=Ha[-13253]or xb(14185,-13253,108153)
                                else
                                    Sa=q;
                                    if Gc~=Gc then
                                        v=Ha[-19922]or xb(27138,-19922,44237)
                                    else
                                        v=60885
                                    end
                                end
                            else
                                Sa=q;
                                if Gc~=Gc then
                                    v=Ha[21614]or xb(51663,21614,120478)
                                else
                                    v=22626
                                end
                            end
                        elseif v>5764 then
                            W,Qc=D[53430],D[42978];
                            x=cb[Qc]or P[56941][Qc];
                            if W==1 then
                                v=Ha[11131]or xb(45924,11131,86494)
                                break
                            elseif W==2 then
                                v=Ha[-1538]or xb(29193,-1538,123054)
                                break
                            elseif W==3 then
                                v=Ha[-26158]or xb(64502,-26158,20625)
                                break
                            end
                            v=Ha[-22962]or xb(19722,-22962,11350)
                        else
                            Bb=q
                            v=44753
                            break
                        end
                    elseif v>1805 then
                        if v<=2963 then
                            qa[D[44495]]=D[42978]
                            v=Ha[-8873]or xb(25087,-8873,32494)
                        else
                            qa[D[44495]]=Rc(D[64747])
                            Qb+=1
                            v=Ha[27327]or xb(4025,27327,4900)
                        end
                    elseif v>857 then
                        if v<=1601 then
                            if D[65182]==84 then
                                v=Ha[28654]or xb(41774,28654,92055)
                                break
                            elseif D[65182]==179 then
                                v=Ha[21615]or xb(17378,21615,17987)
                                break
                            elseif D[65182]==232 then
                                v=Ha[-17878]or xb(25529,-17878,12986)
                                break
                            else
                                v=Ha[31439]or xb(16162,31439,20218)
                                break
                            end
                            v=Ha[-30375]or xb(35890,-30375,103083)
                        else
                            q=q..oc(Ka(tb(nc,Z+1),tb(fa_,Z%#fa_+1)))
                            v=Ha[27626]or xb(47137,27626,125495)
                        end
                    else
                        Qb-=1
                        Cb[Qb]={[508]=72,[44495]=Ka(D[44495],116),[30992]=Ka(D[30992],152),[65182]=0}
                        v=Ha[-23625]or xb(30048,-23625,27005)
                    end
                end
            until v==38402
        end
        local kb
        kb=function(...)
            local Da,ga,Oc,G,y,ic,kc,e_,ea,b_
            b_,ea={},function(a_,dc,f_)
                b_[a_]=Wb(f_,9667)-Wb(dc,7275)
                return b_[a_]
            end
            e_=b_[10633]or ea(10633,62427,83827)
            repeat
                while true do
                    if e_>31774 then
                        if e_>50805 then
                            ic,Da=Xc[19119]+1,kc.n-Xc[19119];
                            G[20435]=Da;
                            Qa(kc,ic,ic+Da-1,1,G[42454])
                            e_=b_[-6532]or ea(-6532,53083,78752)
                        elseif e_<=45035 then
                            if e_<=42103 then
                                Da,ga=ic[42454][2],nil;
                                y=Da;
                                ga=I(y)=='string'
                                if ga==false then
                                    e_=b_[-19459]or ea(-19459,63627,98861)
                                    break
                                end
                                e_=24948
                            else
                                return jb(ic[42454],2,ic[20435])
                            end
                        else
                            Da=I(Da)
                            e_=b_[15465]or ea(15465,33862,56418)
                        end
                    elseif e_>15757 then
                        if e_<=23321 then
                            ic=lb(Q(Yb,Oc,Xc[14073],Xc[27578],G));
                            if ic[42454][1]then
                                e_=b_[19793]or ea(19793,24962,69581)
                                break
                            else
                                e_=b_[-11338]or ea(-11338,38084,65723)
                                break
                            end
                            e_=b_[18775]or ea(18775,59872,55397)
                        elseif e_>27194 then
                            kc,Oc,G=gb(...),Rc(Xc[29413]),{[42454]={},[20435]=0};
                            Qa(kc,1,Xc[19119],0,Oc)
                            if Xc[19119]<kc.n then
                                e_=b_[-17578]or ea(-17578,49259,125409)
                                break
                            end
                            e_=b_[17265]or ea(17265,28228,37025)
                        else
                            return F(Da,0)
                        end
                    else
                        e_=b_[8297]or ea(8297,28086,22425);
                        break;
                    end
                end
            until e_==125
        end
        return kb
    end
    return w_(fb,xa)
end
local sb
sb,d_={[0]=0},function()
    sb[0]=sb[0]+1
    return{[1]=sb,[2]=sb[0]}
end
yc=Ic
return(function()
    return yc(Yc(u_'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'),{})
end)()(...)

