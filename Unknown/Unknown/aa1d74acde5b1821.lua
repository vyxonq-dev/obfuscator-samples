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

local gb,Xa,ka,rb,qa,yb=type,bit32.bxor,pairs,getmetatable
local yc,s_,G,Tb,n_,Mb,Ec,S,na,Ta,Ab,ib,J,W,Fb,d_,oc,e_,tb,Jb,hb,Kb,Da,Ba,u_,zc,X,sc,C,Db;
Ab=(select);
e_=(function(...)
    return{[1]={...},[2]=Ab('#',...)}
end);
G=((function()
    local function mb(P,p,bc)
        if p>bc then
            return
        end
        return P[p],mb(P,p+1,bc)
    end
    return mb
end)());
Jb,zc=(string.gsub),(string.char);
ib=(function(Bc)
    Bc=Jb(Bc,'[^ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=]','')
    return(Bc:gsub('.',function(N)
        if(N=='=')then
            return''
        end
        local ic,kc='',(('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'):find(N)-1)
        for jc=6,1,-1 do
            ic=ic..(kc%2^jc-kc%2^(jc-1)>0 and'1'or'0')
        end
        return ic
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?',function(xa)
        if(#xa~=8)then
            return''
        end
        local ja=0
        for Y=1,8 do
            ja=ja+(xa:sub(Y,Y)=='1'and 2^(8-Y)or 0)
        end
        return zc(ja)
    end))
end);
Tb,Db,Ba,S,n_,Ta,d_,Mb=string.unpack,string.sub,string.byte,bit32 .lshift,bit32 .rshift,bit32 .band,table.concat,{};
u_=(function(Q)
    local da=Mb[Q]
    if da then
        return da
    end
    local oa,Wb,k,la,ya=S(1,11),S(1,5),1,{},''
    while k<=#Q do
        local A=Ba(Q,k);
        k=k+1
        for ha=1,8 do
            local Sb=nil
            if Ta(A,1)~=0 then
                if k<=#Q then
                    Sb=Db(Q,k,k);
                    k=k+1
                end
            else
                if k+1<=#Q then
                    local Wa=Tb('>I2',Q,k);
                    k=k+2
                    local fb,Lb=#ya-n_(Wa,5),Ta(Wa,(Wb-1))+3;
                    Sb=Db(ya,fb,fb+Lb-1)
                end
            end
            A=n_(A,1)
            if Sb then
                la[#la+1]=Sb;
                ya=Db(ya..Sb,-oa)
            end
        end
    end
    local Vb=d_(la);
    Mb[Q]=Vb
    return Vb
end)
local dc,U,wb,Na,ta,cb,Rb,V,Ca,_b,ua,Eb,pc,xb,tc,zb,Ib,db,c,Ua,Pa,vb,o_,B,jb,Fa,Ha,Ra,v,Ob=type,pcall,error,tonumber,assert,select,setmetatable,string.format,string.unpack,string.sub,string.byte,string.char,table.move,table.pack,table.create,table.insert,table.concat,coroutine.create,coroutine.yield,coroutine.resume,coroutine.close,getfenv,bit32 .bor,bit32 .bxor,bit32 .band,bit32 .btest,bit32 .rshift,bit32 .lshift,bit32 .extract,{[14515]={{5,6,false},{3,8,false},{4,8,false},{5,6,false},{6,6,true},{1,5,false},{6,9,true},{5,6,false},{5,8,false},{3,2,false},{3,2,true},{3,0,false},{5,6,false},{0,6,true},{6,6,true},{5,4,true},{1,10,false},{1,2,true},{0,10,true},{6,6,true},{3,8,false},{5,2,true},{0,4,false},{5,4,true},{6,9,true},{5,6,false},{6,6,false},{6,9,false},{6,6,false},{0,8,true},{1,7,true},{4,8,false},{4,7,true},{3,6,false},{5,8,false},{1,9,false},{4,9,true},{6,9,true},{3,4,true},{4,9,false},{5,6,false},{5,6,false},{5,4,false},{5,6,false},{6,6,false},{5,2,false},{3,9,true},{6,5,false},{6,9,true},{3,6,true},{0,7,true},{0,5,false},{6,6,false},{3,10,false},{0,3,true},{5,6,false},{3,8,true},{3,2,false},{1,9,true},{6,6,true},{5,6,false},{1,10,true},{5,6,false},{4,8,false},{5,8,true},{1,2,true},{3,8,true},{5,10,true},{4,5,true},{5,2,true},{1,4,false},{1,6,true},{4,10,false},{6,6,false},{5,5,true},{5,1,false},{5,2,true},{3,10,false},{5,4,true},{5,5,true},{3,10,true},{6,9,false},{3,6,true},{6,6,false},{5,4,true},{0,5,false},{1,2,false},{0,6,true},{4,9,true},{4,2,true},{1,8,false},{6,10,false},{5,6,false},{0,7,true},{3,4,true},{5,4,true},{5,8,false},{1,3,false},{6,2,false},{5,3,true},{1,3,true},{5,2,true},{5,6,false},{5,6,true},{6,6,false},{3,8,false},{5,6,false},{4,3,true},{6,9,false},{5,3,false},{0,6,true},{0,4,true},{5,6,false},{6,8,true},{5,10,false},{6,6,true},{6,3,true},{1,9,false},{0,6,false},{5,6,false},{3,4,true},{3,10,false},{1,3,false},{5,3,false},{5,6,false},{4,3,false},{5,8,false},{1,2,false},{6,10,false},{0,2,false},{4,4,true},{0,10,true},{0,10,true},{0,7,false},{6,6,false},{3,10,false},{6,6,false},{5,8,true},{5,6,false},{6,6,false},{5,6,false},{5,3,true},{3,7,false},{4,6,false},{6,7,false},{3,6,false},{1,2,false},{6,3,true},{5,8,true},{4,10,true},{3,3,false},{6,2,true},{3,9,true},{5,6,true},{4,6,true},{0,8,true},{5,6,false},{6,6,false},{6,2,false},{3,5,false},{3,5,true},{6,3,true},{3,7,false},{5,6,false},{5,6,true},{5,6,false},{6,8,true},{5,6,false},{5,1,false},{5,8,false},{5,6,false},{6,3,false},{5,2,false},{4,6,true},{1,5,true},{6,10,false},{0,7,false},{0,6,true},{5,10,true},{5,2,false},{0,6,false},{5,6,false},{0,6,false},{6,2,true},{4,9,true},{5,10,false},{4,9,true},{1,10,false},{1,6,true},{5,9,true},{4,8,true},{5,6,true},{5,2,false},{5,6,false},{6,3,true},{6,7,true},{5,6,true},{6,2,true},{5,6,false},{3,5,true},{3,7,false},{4,5,false},{0,6,false},{6,2,false},{4,5,true},{6,10,true},{5,6,false},{6,10,true},{3,2,true},{6,6,true},{5,6,false},{1,7,true},{6,10,true},{0,5,true},{3,10,true},{5,4,true},{3,5,true},{5,4,true},{6,2,false},{0,10,true},{0,9,false},{4,4,false},{1,5,true},{0,2,true},{5,6,false},{6,10,true},{1,8,false},{0,6,true},{5,3,true},{6,6,true},{6,5,true},{0,4,true},{5,6,false},{0,6,true},{5,6,false},{6,5,false},{5,1,false},{5,2,true},{5,3,false},{3,10,false},{5,2,false},{5,4,false},{3,10,false},{5,10,false},{0,5,false},{3,7,true},{0,6,true},{5,4,true},{6,3,true},{3,2,true},{5,2,false},{6,6,false},{5,4,true},{5,1,false},{3,4,true},{6,7,true}},[13777]={},[64411]={}}
local x=(function(Dc)
    local aa=Ob[64411][Dc]
    if aa then
        return aa
    end
    local L=1
    local function ia()
        local ub,T,nb,y,g,Va,Pb,pb,E,vc,i_,sa,h,Nb,b_,uc,Ga,eb,Ya,Xb,kb,Cc,xc,j,D,gc,Oa,f_,O,pa,ec,Yb;
        E,D={},function(Ka,wa,wc)
            E[Ka]=Xa(wa,26244)-Xa(wc,9400)
            return E[Ka]
        end;
        Yb=E[5654]or D(5654,57702,13043)
        while Yb~=63551 do
            if Yb>=26835 then
                if Yb<=44473 then
                    if Yb<36377 then
                        if Yb<31035 then
                            if Yb>=29079 then
                                if Yb>30124 then
                                    if(uc>=0 and Cc>T)or((uc<0 or uc~=uc)and Cc<T)then
                                        Yb=E[-19888]or D(-19888,6185,30198)
                                    else
                                        Yb=21584
                                    end
                                elseif Yb>29417 then
                                    T=Ca('<I4',Dc,L);
                                    L,Yb=L+4,13157
                                elseif Yb<=29079 then
                                    Yb,nb=E[30512]or D(30512,45820,40328),nil
                                else
                                    y=Ca('B',Dc,L);
                                    L,Yb=L+1,E[-15036]or D(-15036,40949,26858)
                                end
                            elseif Yb>=27943 then
                                if Yb>27943 then
                                    Yb=E[-30769]or D(-30769,43469,34130)
                                    continue
                                else
                                    y,Yb=nil,E[-13695]or D(-13695,110482,54171)
                                end
                            else
                                j,Yb,Ga=kb,E[-4327]or D(-4327,123303,58902),nil
                            end
                        elseif Yb<=34283 then
                            if Yb>=32989 then
                                if Yb<=33134 then
                                    if Yb<=32989 then
                                        Yb,y[32217]=E[-29305]or D(-29305,35575,36133),Pb[y[64870]+1]
                                    else
                                        Yb,Oa=13688,nil
                                    end
                                else
                                    Yb,gc=E[-21651]or D(-21651,82177,55615),B(Oa,-1424926592)
                                    continue
                                end
                            elseif Yb>31035 then
                                O=b_;
                                Pb=tc(O);
                                gc,Yb,Oa,xc=1,18360,O,1
                            else
                                if(b_>=0 and Ya>sa)or((b_<0 or b_~=b_)and Ya<sa)then
                                    Yb=E[-17585]or D(-17585,57624,19889)
                                else
                                    Yb=5886
                                end
                            end
                        elseif Yb>=35365 then
                            if Yb>35365 then
                                Oa=0;
                                xc,y,ec,Yb=0,1,4,E[32585]or D(32585,97569,43093)
                            else
                                Xb=ec
                                if y~=y then
                                    Yb=1934
                                else
                                    Yb=60072
                                end
                            end
                        else
                            Cc=Cc+uc;
                            eb=Cc
                            if Cc~=Cc then
                                Yb=E[-16215]or D(-16215,56246,43883)
                            else
                                Yb=30873
                            end
                        end
                    elseif Yb>=40653 then
                        if Yb>=41819 then
                            if Yb<=44319 then
                                if Yb>=44242 then
                                    if Yb>44242 then
                                        Yb,ec=5149,B(y,178)
                                        continue
                                    else
                                        i_[1236]=jb(Ha(ec,8),255);
                                        Cc=jb(Ha(ec,16),65535);
                                        i_[42833]=Cc;
                                        T=nil;
                                        T=if Cc<32768 then Cc else Cc-65536;
                                        i_[39765],Yb=T,E[-16889]or D(-16889,9676,15597)
                                    end
                                else
                                    Yb,sa=E[-10940]or D(-10940,124178,39739),Oa
                                end
                            else
                                i_[1236]=jb(Ha(ec,8),255);
                                i_[15164]=jb(Ha(ec,16),255);
                                i_[57651],Yb=jb(Ha(ec,24),255),E[-25597]or D(-25597,85973,56038)
                            end
                        elseif Yb>41531 then
                            ub=Xb;
                            Oa=o_(Oa,Ra(jb(ub,127),f_*7))
                            if not Fa(ub,128)then
                                Yb=E[-4914]or D(-4914,76073,58668)
                                continue
                            end
                            Yb=E[-16326]or D(-16326,7315,28851)
                        elseif Yb>=41312 then
                            if Yb>41312 then
                                Yb,y[32217]=E[-9002]or D(-9002,62890,29920),Pb[y[39765]+1]
                            else
                                Yb=E[-682]or D(-682,72150,54464)
                                continue
                            end
                        else
                            y,Yb=B(f_,178),E[16379]or D(16379,95713,56020)
                            continue
                        end
                    elseif Yb>36999 then
                        if Yb>=40112 then
                            if Yb>40112 then
                                g,Yb,pb=nb,37180,nil
                            else
                                ec=ec+f_;
                                Xb=ec
                                if ec~=ec then
                                    Yb=1934
                                else
                                    Yb=60072
                                end
                            end
                        else
                            h=Ca('B',Dc,L);
                            Yb,L=E[8018]or D(8018,75286,56674),L+1
                        end
                    elseif Yb>=36570 then
                        if Yb<=36570 then
                            b_,Yb=B(O,-1424926592),31125
                            continue
                        else
                            Yb=E[-14826]or D(-14826,4559,31744)
                            continue
                        end
                    elseif Yb<=36377 then
                        Yb=E[26831]or D(26831,47184,31825)
                        continue
                    else
                        f_=xc
                        if ec~=ec then
                            Yb=E[-19022]or D(-19022,44325,24846)
                        else
                            Yb=14090
                        end
                    end
                elseif Yb>=53627 then
                    if Yb>=58544 then
                        if Yb>60344 then
                            if Yb>62099 then
                                j=Ca('B',Dc,L);
                                Yb,L=E[14265]or D(14265,59336,29571),L+1
                            elseif Yb>61246 then
                                Xb,Yb=B(ub,178),41619
                                continue
                            else
                                Yb,Cc=E[-2791]or D(-2791,57078,26238),nil
                            end
                        elseif Yb>60072 then
                            Xb,Yb=G(ub[1],1,ub[2]),E[1225]or D(1225,12954,14186)
                        elseif Yb<59525 then
                            sa,Yb=false,E[-9121]or D(-9121,79541,43174)
                        elseif Yb>59525 then
                            if(f_>=0 and ec>y)or((f_<0 or f_~=f_)and ec<y)then
                                Yb=E[-19834]or D(-19834,47932,62098)
                            else
                                Yb=E[-105]or D(-105,22187,3034)
                            end
                        else
                            Yb,xc=56260,B(ec,2104335798)
                            continue
                        end
                    elseif Yb>=56074 then
                        if Yb>56260 then
                            ub=Ca('B',Dc,L);
                            L,Yb=L+1,E[-22578]or D(-22578,94166,12807)
                        elseif Yb<56192 then
                            i_=jb(Ha(Xb,10),1023);
                            y[35485],Yb=Pb[i_+1],E[-6237]or D(-6237,95899,59889)
                        elseif Yb>56192 then
                            ec=xc;
                            y=jb(ec,255);
                            f_=Ob[14515][y+1];
                            Xb,ub,Va=f_[1],f_[2],f_[3];
                            i_={[42833]=0,[15164]=0,[39765]=0,[1236]=0,[28625]=0,[64870]=0,[35485]=0,[10652]=0,[32217]=0,[58231]=ub,[42784]=0,[4116]=0,[57651]=0,[19908]=nil,[56738]=y};
                            zb(Ya,i_)
                            if Xb==6 then
                                Yb=E[17882]or D(17882,54602,8772)
                                continue
                            elseif Xb==5 then
                                Yb=E[-8100]or D(-8100,76912,47491)
                                continue
                            elseif Xb==3 then
                                Yb=E[29591]or D(29591,36214,1532)
                                continue
                            end
                            Yb=10995
                        else
                            gc=gc+xc;
                            ec=gc
                            if gc~=gc then
                                Yb=54836
                            else
                                Yb=48366
                            end
                        end
                    elseif Yb<=53747 then
                        if Yb>53627 then
                            f_=Ca('B',Dc,L);
                            L,Yb=L+1,40653
                        else
                            y[32217]=v(y[64870],0,1)==1;
                            Yb,y[4116]=E[-1801]or D(-1801,39107,40905),v(y[64870],31,1)==1
                        end
                    else
                        Yb,gc,Oa,xc=50252,1,Nb,1
                    end
                elseif Yb<50293 then
                    if Yb<48372 then
                        if Yb<=47490 then
                            if Yb<=45134 then
                                i_=0;
                                uc,Cc,Yb,T=1,0,12464,4
                            else
                                Yb,ub=E[13720]or D(13720,58748,6910),nil
                            end
                        else
                            if(xc>=0 and gc>Oa)or((xc<0 or xc~=xc)and gc<Oa)then
                                Yb=54836
                            else
                                Yb=27943
                            end
                        end
                    elseif Yb<50195 then
                        if Yb>48372 then
                            Yb,pa=53001,B(vc,178)
                            continue
                        else
                            Yb,Xb=E[31393]or D(31393,52801,19649),nil
                        end
                    elseif Yb>50195 then
                        ec=gc
                        if Oa~=Oa then
                            Yb=10249
                        else
                            Yb=E[-31432]or D(-31432,35960,61326)
                        end
                    else
                        b_=b_+Pb;
                        gc=b_
                        if b_~=b_ then
                            Yb=18577
                        else
                            Yb=15374
                        end
                    end
                elseif Yb<52147 then
                    if Yb<51301 then
                        Nb=0;
                        b_,Ya,Yb,sa=1,0,25574,4
                    elseif Yb<=51301 then
                        i_=Va
                        if i_==0 then
                            Yb=E[-8723]or D(-8723,94797,63591)
                            continue
                        else
                            Yb=E[6211]or D(6211,58865,2414)
                            continue
                        end
                        Yb=E[2871]or D(2871,63808,26226)
                    else
                        Cc,T=jb(Ha(ec,8),16777215),nil;
                        T=if Cc<8388608 then Cc else Cc-16777216;
                        Yb,i_[10652]=E[-17557]or D(-17557,11715,1260),T
                    end
                elseif Yb<=53056 then
                    if Yb>=53001 then
                        if Yb<=53001 then
                            vc=pa;
                            i_=o_(i_,Ra(jb(vc,127),eb*7))
                            if not Fa(vc,128)then
                                Yb=E[-1694]or D(-1694,82075,37582)
                                continue
                            end
                            Yb=E[32479]or D(32479,34945,17166)
                        else
                            T=Cc;
                            i_[64870]=T;
                            zb(Ya,{});
                            Yb=E[-16084]or D(-16084,96740,30485)
                        end
                    else
                        Yb,Oa=41819,Va
                        continue
                    end
                else
                    vc=Ca('B',Dc,L);
                    Yb,L=E[11533]or D(11533,69914,36924),L+1
                end
            elseif Yb<=12464 then
                if Yb>6984 then
                    if Yb<10750 then
                        if Yb<=8150 then
                            if Yb>8134 then
                                Pb=Pb+Oa;
                                xc=Pb
                                if Pb~=Pb then
                                    Yb=E[-13952]or D(-13952,70100,52430)
                                else
                                    Yb=E[-28260]or D(-28260,11209,6797)
                                end
                            elseif Yb<=7827 then
                                if Yb<=7387 then
                                    Yb,ec=29417,nil
                                else
                                    Ga,Yb=B(Nb,-1424926592),E[-29111]or D(-29111,45547,34416)
                                    continue
                                end
                            else
                                if(xc>=0 and gc>Oa)or((xc<0 or xc~=xc)and gc<Oa)then
                                    Yb=10249
                                else
                                    Yb=E[3065]or D(3065,53817,21569)
                                end
                            end
                        elseif Yb<9740 then
                            Pb,Yb=B(gc,178),25999
                            continue
                        elseif Yb>9740 then
                            gc,Yb=nil,E[14979]or D(14979,72781,51302)
                        else
                            xc=xc+y;
                            f_=xc
                            if xc~=xc then
                                Yb=E[-7489]or D(-7489,34217,31226)
                            else
                                Yb=E[-19164]or D(-19164,51646,23688)
                            end
                        end
                    elseif Yb>=11017 then
                        if Yb>11615 then
                            eb=Cc
                            if T~=T then
                                Yb=E[-25037]or D(-25037,18869,9578)
                            else
                                Yb=E[-17994]or D(-17994,34274,20085)
                            end
                        elseif Yb<=11303 then
                            if Yb<=11017 then
                                Yb,ub=23802,e_(nil)
                            else
                                T=Ca('c'..i_,Dc,L);
                                Yb,L=1167,L+i_
                            end
                        else
                            Va,Yb=B(i_,-1424926592),E[-5150]or D(-5150,47068,11339)
                            continue
                        end
                    elseif Yb>=10769 then
                        if Yb>10769 then
                            if Va then
                                Yb=E[-31726]or D(-31726,117315,39217)
                                continue
                            end
                            Yb=E[31853]or D(31853,73946,24083)
                        else
                            kb,Yb=B(j,178),E[6859]or D(6859,90735,47264)
                            continue
                        end
                    else
                        Oa=gc;
                        xc=tc(Oa);
                        ec,y,f_,Yb=1,Oa,1,E[-326]or D(-326,38584,17071)
                    end
                elseif Yb<=3973 then
                    if Yb>=3528 then
                        if Yb>3864 then
                            Yb,ub=E[31137]or D(31137,119784,60684),e_(Cc)
                            continue
                        elseif Yb<3754 then
                            Yb,Xb=E[-28293]or D(-28293,9772,9444),ub
                        elseif Yb<=3754 then
                            if sa then
                                Yb=E[-17268]or D(-17268,84623,25571)
                                continue
                            else
                                Yb=E[6558]or D(6558,64854,16092)
                                continue
                            end
                            Yb=E[-13035]or D(-13035,123265,58954)
                        else
                            if(Oa>=0 and Pb>gc)or((Oa<0 or Oa~=Oa)and Pb<gc)then
                                Yb=E[-22253]or D(-22253,78236,60550)
                            else
                                Yb=7387
                            end
                        end
                    elseif Yb<1828 then
                        if Yb<=205 then
                            xc[Xb],Yb=ia(),E[-24745]or D(-24745,50537,9093)
                        else
                            Yb,Cc=E[-17046]or D(-17046,53297,33672),T
                            continue
                        end
                    elseif Yb>1828 then
                        return{[37491]=j,[63798]=xc,[23905]='',[51838]=Ya,[37525]=g,[51974]=h}
                    else
                        gc=Ca('B',Dc,L);
                        L,Yb=L+1,9307
                    end
                elseif Yb>=5853 then
                    if Yb<=6474 then
                        if Yb>5886 then
                            gc=b_
                            if O~=O then
                                Yb=18577
                            else
                                Yb=E[-2451]or D(-2451,89202,55888)
                            end
                        elseif Yb<=5853 then
                            ec=Ca('<I4',Dc,L);
                            Yb,L=E[-20040]or D(-20040,107684,64803),L+4
                        else
                            Yb,Pb=1828,nil
                        end
                    else
                        g=Ca('B',Dc,L);
                        Yb,L=12989,L+1
                    end
                elseif Yb<=5149 then
                    if Yb<=4854 then
                        ub,Yb=Va,E[30612]or D(30612,10418,25814)
                        continue
                    else
                        y=ec;
                        O=o_(O,Ra(jb(y,127),xc*7))
                        if not Fa(y,128)then
                            Yb=E[-3416]or D(-3416,92225,18909)
                            continue
                        end
                        Yb=E[-8700]or D(-8700,94012,52570)
                    end
                else
                    f_=y
                    if f_==5 then
                        Yb=E[-5333]or D(-5333,42828,8300)
                        continue
                    elseif f_==2 then
                        Yb=E[-15340]or D(-15340,83716,53967)
                        continue
                    elseif f_==4 then
                        Yb=E[-22751]or D(-22751,40802,25820)
                        continue
                    end
                    Yb=16460
                end
            elseif Yb<=18360 then
                if Yb>=16460 then
                    if Yb<=17427 then
                        if Yb>17110 then
                            if Yb<=17348 then
                                y=Ya[ec];
                                f_=y[58231]
                                if f_==3 then
                                    Yb=E[-25310]or D(-25310,92357,34986)
                                    continue
                                elseif f_==5 then
                                    Yb=E[-27642]or D(-27642,58196,6301)
                                    continue
                                elseif f_==4 then
                                    Yb=E[2684]or D(2684,61551,12982)
                                    continue
                                elseif f_==7 then
                                    Yb=E[22551]or D(22551,122579,49764)
                                    continue
                                elseif f_==0 then
                                    Yb=E[30695]or D(30695,2150,16177)
                                    continue
                                elseif f_==10 then
                                    Yb=E[-25744]or D(-25744,92611,18868)
                                    continue
                                end
                                Yb=E[20676]or D(20676,49847,17893)
                            else
                                h,Yb,kb=pb,E[8246]or D(8246,119252,39129),nil
                            end
                        elseif Yb>16713 then
                            gc=gc+xc;
                            ec=gc
                            if gc~=gc then
                                Yb=E[24956]or D(24956,95361,52548)
                            else
                                Yb=8134
                            end
                        elseif Yb>16460 then
                            xc=Pb
                            if gc~=gc then
                                Yb=E[16648]or D(16648,53205,16079)
                            else
                                Yb=3864
                            end
                        else
                            Yb,Pb[ec]=E[14567]or D(14567,70111,48995),Xb
                        end
                    elseif Yb<18104 then
                        Va=Ca('<d',Dc,L);
                        L,Yb=L+8,E[-5870]or D(-5870,65197,41355)
                    elseif Yb>18104 then
                        ec=gc
                        if Oa~=Oa then
                            Yb=E[-9020]or D(-9020,129859,58155)
                        else
                            Yb=E[-15938]or D(-15938,36807,2285)
                        end
                    else
                        Yb,pb=17427,B(h,178)
                        continue
                    end
                elseif Yb<=13688 then
                    if Yb<13479 then
                        if Yb<=12989 then
                            Yb,nb=E[-27917]or D(-27917,37099,31842),B(g,178)
                            continue
                        else
                            Cc,Yb=B(T,2104335798),E[8100]or D(8100,96954,26694)
                            continue
                        end
                    elseif Yb<=13479 then
                        Nb=Ga;
                        Ya,sa=tc(Nb),false;
                        O,Yb,b_,Pb=Nb,E[-14082]or D(-14082,34218,60764),1,1
                    else
                        xc,Yb=nil,E[-7868]or D(-7868,37525,63884)
                    end
                elseif Yb<14314 then
                    if(y>=0 and xc>ec)or((y<0 or y~=y)and xc<ec)then
                        Yb=E[7393]or D(7393,56413,4182)
                    else
                        Yb=E[-18596]or D(-18596,64920,5877)
                    end
                elseif Yb>14314 then
                    if(Pb>=0 and b_>O)or((Pb<0 or Pb~=Pb)and b_<O)then
                        Yb=18577
                    else
                        Yb=E[-6886]or D(-6886,47769,59851)
                    end
                else
                    Yb,ub=E[32068]or D(32068,72916,43552),e_''
                    continue
                end
            elseif Yb>21699 then
                if Yb>=25574 then
                    if Yb<25999 then
                        O=Ya
                        if sa~=sa then
                            Yb=E[9184]or D(9184,55423,34000)
                        else
                            Yb=E[-2884]or D(-2884,45062,31231)
                        end
                    elseif Yb>25999 then
                        Yb,Xb=58025,nil
                    else
                        gc=Pb;
                        Nb=o_(Nb,Ra(jb(gc,127),O*7))
                        if not Fa(gc,128)then
                            Yb=E[17878]or D(17878,94399,41228)
                            continue
                        end
                        Yb=E[3278]or D(3278,41182,21807)
                    end
                elseif Yb<23802 then
                    Yb,Cc=E[8312]or D(8312,47405,38714),nil
                elseif Yb>23802 then
                    y[32217],Yb=v(y[64870],0,16),E[3464]or D(3464,86653,54939)
                else
                    Yb,Va=E[15481]or D(15481,96459,19129),nil
                end
            elseif Yb>=21337 then
                if Yb>=21584 then
                    if Yb>21584 then
                        Ya=Ya+b_;
                        O=Ya
                        if Ya~=Ya then
                            Yb=E[8580]or D(8580,93160,51809)
                        else
                            Yb=31035
                        end
                    else
                        pa,Yb=nil,53370
                    end
                elseif Yb<=21337 then
                    y[32217],Yb=Pb[y[10652]+1],E[25907]or D(25907,1768,14638)
                else
                    i_,Cc=jb(Ha(Xb,10),1023),jb(Ha(Xb,0),1023);
                    y[35485]=Pb[i_+1];
                    y[42784],Yb=Pb[Cc+1],E[5154]or D(5154,51847,19861)
                end
            elseif Yb<18859 then
                b_,Yb=nil,20605
            elseif Yb>18859 then
                O=0;
                Yb,gc,Oa,Pb=E[-19069]or D(-19069,54690,21861),4,1,0
            else
                Xb=y[64870];
                ub,Va=Ha(Xb,30),jb(Ha(Xb,20),1023);
                y[32217]=Pb[Va+1];
                y[28625]=ub
                if ub==2 then
                    Yb=E[-18979]or D(-18979,83631,24985)
                    continue
                elseif ub==3 then
                    Yb=E[-244]or D(-244,88302,52772)
                    continue
                end
                Yb=E[11558]or D(11558,47815,48597)
            end
        end
    end
    local Ac=ia();
    Ob[64411][Dc]=Ac
    return Ac
end)
local ba=(function(w_,Ja)
    w_=x(w_)
    local Gb=vb()
    local function lc(I,sb)
        local ob=(function(...)
            return{...},cb('#',...)
        end)
        local Qb;
        Qb=(function(ab,qb,K)
            if qb>K then
                return
            end
            return ab[qb],Qb(ab,qb+1,K)
        end)
        local function qc(va,M,_c,l_)
            local H,Cb,fc,ra,La,q,F,z,_a,Za,Hb,ac,m,rc,lb,bb,ca,cc,hc,Ma,nc,ea,Z,Aa;
            Z,rc=function(za,ga,Ub)
                rc[za]=Xa(Ub,60087)-Xa(ga,8624)
                return rc[za]
            end,{};
            Ma=rc[16059]or Z(16059,21459,24779)
            while Ma~=58285 do
                if Ma<27490 then
                    if Ma<12949 then
                        if Ma>5635 then
                            if Ma>=9270 then
                                if Ma>11314 then
                                    if Ma<11742 then
                                        if Ma<=11600 then
                                            if(H>=0 and fc>hc)or((H<0 or H~=H)and fc<hc)then
                                                Ma=rc[-1518]or Z(-1518,43794,1990)
                                            else
                                                Ma=45972
                                            end
                                        else
                                            Ma,ra,Za,ea=25994,q[28625],_c[bb+1],nil
                                        end
                                    elseif Ma<=12090 then
                                        if Ma<=11742 then
                                            Za,ea,ca=ra.__iter(Za);
                                            Ma=rc[27370]or Z(27370,7005,54380)
                                        else
                                            lb=false;
                                            bb+=1
                                            if Cb>140 then
                                                Ma=rc[-13469]or Z(-13469,44050,129283)
                                                continue
                                            else
                                                Ma=rc[21248]or Z(21248,35281,3541)
                                                continue
                                            end
                                            Ma=rc[10822]or Z(10822,17664,27617)
                                        end
                                    else
                                        fc[2]=fc[3][fc[1]];
                                        fc[3]=fc;
                                        fc[1]=2;
                                        Ma,nc[cc]=rc[-19138]or Z(-19138,7554,43671),nil
                                    end
                                elseif Ma<=10819 then
                                    if Ma>=10313 then
                                        if Ma<=10313 then
                                            ra=q[32217];
                                            va[q[15164]]=va[q[57651]][ra];
                                            bb+=1;
                                            Ma=rc[15800]or Z(15800,37564,9477)
                                        else
                                            Ma,va[q[1236]]=rc[-26220]or Z(-26220,44945,126294),ea[q[35485]][q[42784]]
                                        end
                                    elseif Ma<=9270 then
                                        Za[35485],Ma=ca,rc[-22701]or Z(-22701,37720,130275)
                                    else
                                        pc(va,Za,Za+ea-1,q[64870],va[ra]);
                                        bb+=1;
                                        Ma=rc[1332]or Z(1332,9437,51364)
                                    end
                                elseif Ma<=10889 then
                                    ra=q[32217];
                                    va[q[15164]]=Gb[ra]or Ob[13777][ra];
                                    bb+=1;
                                    Ma=rc[-16917]or Z(-16917,13633,56096)
                                else
                                    if Cb>95 then
                                        Ma=rc[30336]or Z(30336,5085,43262)
                                        continue
                                    else
                                        Ma=rc[-18359]or Z(-18359,46350,22000)
                                        continue
                                    end
                                    Ma=rc[-6206]or Z(-6206,12311,50426)
                                end
                            elseif Ma<7334 then
                                if Ma<6738 then
                                    if Ma<=6169 then
                                        Hb,bb,nc,z,Ma,lb=-1,1,Rb({},{__mode='vs'}),Rb({},{__mode='ks'}),rc[-28041]or Z(-28041,53866,129591),false
                                    else
                                        Za,ea,ca=ka(Za);
                                        Ma=rc[28974]or Z(28974,51503,1594)
                                    end
                                elseif Ma<=6782 then
                                    if Ma<=6738 then
                                        H=H+Aa;
                                        m=H
                                        if H~=H then
                                            Ma=rc[-21546]or Z(-21546,46138,97110)
                                        else
                                            Ma=49282
                                        end
                                    else
                                        m=H
                                        if F~=F then
                                            Ma=rc[28252]or Z(28252,42226,92974)
                                        else
                                            Ma=rc[-26037]or Z(-26037,25794,126787)
                                        end
                                    end
                                else
                                    pc(fc,1,hc,ra,va);
                                    Ma=rc[2397]or Z(2397,30558,39203)
                                end
                            elseif Ma>8201 then
                                if Ma>8452 then
                                    Za,ea,ca=ra.__iter(Za);
                                    Ma=rc[-10656]or Z(-10656,30490,21213)
                                else
                                    Ma,hc=rc[-22342]or Z(-22342,12049,1993),hc..Eb(B(ua(cc,m+1),ua(fc,m%#fc+1)))
                                end
                            elseif Ma>7681 then
                                if not va[q[1236]]then
                                    Ma=rc[14536]or Z(14536,27435,115997)
                                    continue
                                end
                                Ma=rc[-23260]or Z(-23260,50498,125743)
                            elseif Ma>=7485 then
                                if Ma<=7485 then
                                    return Qb(va,ra,ra+ca-1)
                                else
                                    cc=cc+hc;
                                    H=cc
                                    if cc~=cc then
                                        Ma=rc[22027]or Z(22027,30911,113708)
                                    else
                                        Ma=43248
                                    end
                                end
                            else
                                if not lb then
                                    Ma=rc[28919]or Z(28919,39261,6909)
                                    continue
                                end
                                Ma=rc[-24712]or Z(-24712,30197,27080)
                            end
                        elseif Ma>=2900 then
                            if Ma>=4538 then
                                if Ma<5180 then
                                    if Ma<=4755 then
                                        if Ma<=4538 then
                                            Ma,hc=rc[-15251]or Z(-15251,454,53375),hc..Eb(B(ua(cc,m+1),ua(fc,m%#fc+1)))
                                        else
                                            ca=va[ra];
                                            hc,fc,cc,Ma=1,Za,ra+1,25612
                                        end
                                    else
                                        cc,fc=Za(ea,ca);
                                        ca=cc
                                        if ca==nil then
                                            Ma=rc[13383]or Z(13383,40573,107693)
                                        else
                                            Ma=rc[27340]or Z(27340,458,22314)
                                        end
                                    end
                                elseif Ma<5289 then
                                    if Cb>210 then
                                        Ma=rc[-15621]or Z(-15621,57434,132)
                                        continue
                                    else
                                        Ma=rc[4438]or Z(4438,54517,68833)
                                        continue
                                    end
                                    Ma=rc[26500]or Z(26500,11127,52698)
                                elseif Ma<=5289 then
                                    Za[35485]=ca;
                                    cc,Ma=nil,rc[22296]or Z(22296,21133,102204)
                                else
                                    wb'';
                                    Ma=rc[2133]or Z(2133,54717,68863)
                                end
                            elseif Ma<3880 then
                                if Ma>3184 then
                                    wb(fc);
                                    Ma=rc[8402]or Z(8402,15409,31075)
                                elseif Ma>2900 then
                                    if Cb>28 then
                                        Ma=rc[2007]or Z(2007,29060,45375)
                                        continue
                                    else
                                        Ma=rc[23876]or Z(23876,65455,5279)
                                        continue
                                    end
                                    Ma=rc[-3420]or Z(-3420,61772,1813)
                                else
                                    if q[57651]==38 then
                                        Ma=rc[-20163]or Z(-20163,54743,75015)
                                        continue
                                    elseif q[57651]==80 then
                                        Ma=rc[-30911]or Z(-30911,51118,82948)
                                        continue
                                    elseif q[57651]==137 then
                                        Ma=rc[6108]or Z(6108,37766,1419)
                                        continue
                                    else
                                        Ma=rc[7697]or Z(7697,52624,95517)
                                        continue
                                    end
                                    Ma=rc[22290]or Z(22290,29400,39609)
                                end
                            elseif Ma<4060 then
                                ra=q[4116]
                                if(va[q[1236]]==nil)~=ra then
                                    Ma=rc[-2229]or Z(-2229,55819,100685)
                                    continue
                                else
                                    Ma=rc[4440]or Z(4440,6708,3627)
                                    continue
                                end
                                Ma=rc[-21192]or Z(-21192,63722,7351)
                            elseif Ma>4060 then
                                La={[2]=va[m[15164]],[1]=2};
                                La[3]=La;
                                Ma,fc[Aa]=rc[-18115]or Z(-18115,21904,120324),La
                            else
                                va[q[15164]]=tc(q[64870]);
                                bb+=1;
                                Ma=rc[-12153]or Z(-12153,28045,33364)
                            end
                        elseif Ma>=1872 then
                            if Ma<=2521 then
                                if Ma<2335 then
                                    if Ma<=1872 then
                                        ra,Za=nil,B(q[42833],57660);
                                        ra=if Za<32768 then Za else Za-65536;
                                        ea=ra;
                                        va[B(q[1236],215)],Ma=ea,rc[-3966]or Z(-3966,37497,15064)
                                    else
                                        bb-=1;
                                        Ma,_c[bb]=rc[10732]or Z(10732,34683,10694),{[56738]=140,[1236]=B(q[1236],215),[15164]=B(q[15164],116),[57651]=0}
                                    end
                                elseif Ma>2335 then
                                    if Cb>49 then
                                        Ma=rc[-20690]or Z(-20690,16520,7308)
                                        continue
                                    else
                                        Ma=rc[-25270]or Z(-25270,32236,24440)
                                        continue
                                    end
                                    Ma=rc[7386]or Z(7386,13142,50491)
                                else
                                    ea,Ma=fc,rc[24474]or Z(24474,41222,116031)
                                    continue
                                end
                            elseif Ma>2603 then
                                fc[Aa],Ma=_a,rc[6632]or Z(6632,7291,126185)
                            else
                                if Cb>252 then
                                    Ma=rc[-10315]or Z(-10315,56634,101624)
                                    continue
                                else
                                    Ma=rc[14325]or Z(14325,6002,11754)
                                    continue
                                end
                                Ma=rc[12874]or Z(12874,48487,21450)
                            end
                        elseif Ma>1518 then
                            if Ma<=1779 then
                                va[ra+2]=va[ra+3];
                                bb+=q[39765];
                                Ma=rc[-14900]or Z(-14900,57337,127064)
                            else
                                if Cb>78 then
                                    Ma=rc[-16139]or Z(-16139,23893,15339)
                                    continue
                                else
                                    Ma=rc[-8892]or Z(-8892,64414,117008)
                                    continue
                                end
                                Ma=rc[3392]or Z(3392,23140,29389)
                            end
                        elseif Ma<=1006 then
                            if Ma>=616 then
                                if Ma>616 then
                                    cc,fc=Za(ea,ca);
                                    ca=cc
                                    if ca==nil then
                                        Ma=rc[-15583]or Z(-15583,27115,126488)
                                    else
                                        Ma=rc[8237]or Z(8237,33455,14458)
                                    end
                                else
                                    La=m[15164];
                                    _a=nc[La]
                                    if _a==nil then
                                        Ma=rc[25907]or Z(25907,45702,9734)
                                        continue
                                    end
                                    Ma=2613
                                end
                            else
                                hc=hc+F;
                                Aa=hc
                                if hc~=hc then
                                    Ma=rc[31893]or Z(31893,32231,36801)
                                else
                                    Ma=rc[-15952]or Z(-15952,58159,126476)
                                end
                            end
                        else
                            bb+=1;
                            Ma=rc[10778]or Z(10778,47029,22556)
                        end
                    elseif Ma>21411 then
                        if Ma<25024 then
                            if Ma>=23092 then
                                if Ma>=24134 then
                                    if Ma>=24217 then
                                        if Ma<=24217 then
                                            ra,Za=q[15164],q[1236];
                                            ea,ca=U(Ib,va,'',ra,Za)
                                            if not ea then
                                                Ma=rc[13237]or Z(13237,25808,48452)
                                                continue
                                            end
                                            Ma=64908
                                        else
                                            if Cb>23 then
                                                Ma=rc[-3410]or Z(-3410,27204,45779)
                                                continue
                                            else
                                                Ma=rc[29173]or Z(29173,9066,15268)
                                                continue
                                            end
                                            Ma=rc[-23598]or Z(-23598,42487,19034)
                                        end
                                    else
                                        ra=rb(Za)
                                        if ra~=nil and ra.__iter~=nil then
                                            Ma=rc[-6414]or Z(-6414,31656,38414)
                                            continue
                                        elseif gb(Za)=='table'then
                                            Ma=rc[-14637]or Z(-14637,23918,107818)
                                            continue
                                        end
                                        Ma=rc[6700]or Z(6700,50078,108889)
                                    end
                                elseif Ma<=23191 then
                                    if Ma<=23092 then
                                        Za,ea,ca=ra.__iter(Za);
                                        Ma=rc[8378]or Z(8378,59535,14270)
                                    else
                                        ra,Za,Ma=_c[bb],nil,14958
                                    end
                                else
                                    ra[32217]=Za;
                                    q[56738],Ma=118,rc[-10880]or Z(-10880,26900,36861)
                                end
                            elseif Ma<22220 then
                                if Ma>21623 then
                                    if Cb>217 then
                                        Ma=rc[-1753]or Z(-1753,40973,123753)
                                        continue
                                    else
                                        Ma=rc[-2856]or Z(-2856,39,57188)
                                        continue
                                    end
                                    Ma=rc[-6528]or Z(-6528,45208,18297)
                                else
                                    if q[57651]==138 then
                                        Ma=rc[22040]or Z(22040,54824,114717)
                                        continue
                                    elseif q[57651]==155 then
                                        Ma=rc[-14473]or Z(-14473,44176,128429)
                                        continue
                                    elseif q[57651]==184 then
                                        Ma=rc[-16209]or Z(-16209,48957,19730)
                                        continue
                                    else
                                        Ma=rc[2902]or Z(2902,9763,53584)
                                        continue
                                    end
                                    Ma=rc[16695]or Z(16695,51763,123550)
                                end
                            elseif Ma>22303 then
                                bb+=1;
                                Ma=rc[-8261]or Z(-8261,14598,57323)
                            elseif Ma>22220 then
                                if Cb>230 then
                                    Ma=rc[-27569]or Z(-27569,48128,20705)
                                    continue
                                else
                                    Ma=rc[30748]or Z(30748,339,40248)
                                    continue
                                end
                                Ma=rc[24795]or Z(24795,30138,39431)
                            else
                                F=F+m;
                                ac=F
                                if F~=F then
                                    Ma=rc[-31807]or Z(-31807,17677,117369)
                                else
                                    Ma=29027
                                end
                            end
                        elseif Ma>=25760 then
                            if Ma<=26777 then
                                if Ma<=26687 then
                                    if Ma<=25994 then
                                        if Ma<=25760 then
                                            bb+=q[39765];
                                            Ma=rc[-10765]or Z(-10765,7528,46025)
                                        else
                                            ca,cc=Za[32217],q[32217];
                                            cc='\145k\151f-\200'..cc;
                                            fc='';
                                            F,H,hc,Ma=1,#ca-1,0,58419
                                        end
                                    else
                                        bb+=q[39765];
                                        Ma=rc[-19960]or Z(-19960,58307,13742)
                                    end
                                else
                                    if Cb>232 then
                                        Ma=rc[17251]or Z(17251,56806,126006)
                                        continue
                                    else
                                        Ma=rc[21332]or Z(21332,56205,113643)
                                        continue
                                    end
                                    Ma=rc[-21163]or Z(-21163,29337,34168)
                                end
                            elseif Ma>27077 then
                                ra,Za=q[1236],q[32217];
                                Hb=ra+6;
                                ea,ca=va[ra],nil;
                                ca=dc(ea)=='function'
                                if ca then
                                    Ma=rc[22773]or Z(22773,52599,96606)
                                    continue
                                else
                                    Ma=rc[-13570]or Z(-13570,42762,100537)
                                    continue
                                end
                                Ma=rc[3918]or Z(3918,28032,33377)
                            else
                                ra,Za,ea,ca=q[32217],q[4116],va[q[1236]],nil;
                                ca=dc(ea)=='boolean'
                                if(ca and(ea==ra))~=Za then
                                    Ma=rc[27312]or Z(27312,59874,116293)
                                    continue
                                else
                                    Ma=rc[6674]or Z(6674,18151,44)
                                    continue
                                end
                                Ma=rc[-2413]or Z(-2413,33102,22291)
                            end
                        elseif Ma>=25452 then
                            if Ma<=25612 then
                                if Ma>25452 then
                                    H=cc
                                    if fc~=fc then
                                        Ma=rc[19456]or Z(19456,47637,95110)
                                    else
                                        Ma=43248
                                    end
                                else
                                    q[56738]=49;
                                    bb+=1;
                                    Ma=rc[30869]or Z(30869,3044,44109)
                                end
                            else
                                ca,Ma=hc,5289
                                continue
                            end
                        elseif Ma>25024 then
                            Ma,Za=23801,cc
                            continue
                        else
                            cc,fc=Za(ea,ca);
                            ca=cc
                            if ca==nil then
                                Ma=rc[32341]or Z(32341,39712,15745)
                            else
                                Ma=rc[-22258]or Z(-22258,53997,78831)
                            end
                        end
                    elseif Ma<=16129 then
                        if Ma<=14173 then
                            if Ma>13689 then
                                if Ma>13828 then
                                    q=_c[bb];
                                    Cb,Ma=q[56738],rc[-6802]or Z(-6802,27573,37768)
                                elseif Ma<=13749 then
                                    pc(l_[45350],1,Za,ra,va);
                                    Ma=rc[-25396]or Z(-25396,39630,12947)
                                else
                                    if Cb>7 then
                                        Ma=rc[-24775]or Z(-24775,10927,36609)
                                        continue
                                    else
                                        Ma=rc[12244]or Z(12244,22528,123536)
                                        continue
                                    end
                                    Ma=rc[-20809]or Z(-20809,8691,63070)
                                end
                            elseif Ma<13396 then
                                if Ma>12949 then
                                    bb-=1;
                                    _c[bb],Ma={[56738]=43,[1236]=B(q[1236],121),[15164]=B(q[15164],186),[57651]=0},rc[-1918]or Z(-1918,48620,21429)
                                else
                                    if Cb>138 then
                                        Ma=rc[26411]or Z(26411,36889,119515)
                                        continue
                                    else
                                        Ma=rc[-22261]or Z(-22261,62093,123393)
                                        continue
                                    end
                                    Ma=rc[-21871]or Z(-21871,29003,34582)
                                end
                            elseif Ma<=13396 then
                                ra,Za=q[1236],q[15164]-1
                                if Za==-1 then
                                    Ma=rc[32758]or Z(32758,38395,120255)
                                    continue
                                end
                                Ma=rc[30565]or Z(30565,3965,36405)
                            else
                                if Cb>134 then
                                    Ma=rc[-18891]or Z(-18891,46005,118661)
                                    continue
                                else
                                    Ma=rc[-12465]or Z(-12465,42472,124655)
                                    continue
                                end
                                Ma=rc[31626]or Z(31626,17159,38378)
                            end
                        elseif Ma>=15622 then
                            if Ma>15841 then
                                if Cb>92 then
                                    Ma=rc[-16050]or Z(-16050,26043,4378)
                                    continue
                                else
                                    Ma=rc[-4254]or Z(-4254,17000,18985)
                                    continue
                                end
                                Ma=rc[-8849]or Z(-8849,48307,21278)
                            elseif Ma>15622 then
                                if Cb>163 then
                                    Ma=rc[1439]or Z(1439,61494,128541)
                                    continue
                                else
                                    Ma=rc[30846]or Z(30846,7291,4013)
                                    continue
                                end
                                Ma=rc[-21681]or Z(-21681,16235,53558)
                            else
                                bb-=1;
                                _c[bb],Ma={[56738]=41,[1236]=B(q[1236],158),[15164]=B(q[15164],133),[57651]=0},rc[20373]or Z(20373,549,43660)
                            end
                        elseif Ma<14958 then
                            _a={[1]=La,[3]=va};
                            Ma,nc[La]=rc[27490]or Z(27490,10733,63525),_a
                        elseif Ma>14958 then
                            if Cb>43 then
                                Ma=rc[-8324]or Z(-8324,11023,64372)
                                continue
                            else
                                Ma=rc[21720]or Z(21720,58605,118618)
                                continue
                            end
                            Ma=rc[2141]or Z(2141,58401,2176)
                        else
                            ea,ca=ra[32217],q[32217];
                            ca='\145k\151f-\200'..ca;
                            cc='';
                            fc,Ma,hc,H=0,rc[4807]or Z(4807,38582,111193),#ea-1,1
                        end
                    elseif Ma>=18376 then
                        if Ma>19236 then
                            if Ma<=19653 then
                                m=_c[bb];
                                bb+=1;
                                ac=m[1236]
                                if ac==0 then
                                    Ma=rc[29184]or Z(29184,62992,662)
                                    continue
                                elseif ac==1 then
                                    Ma=rc[-12893]or Z(-12893,61833,14358)
                                    continue
                                elseif ac==2 then
                                    Ma=rc[8351]or Z(8351,48833,91481)
                                    continue
                                end
                                Ma=rc[30961]or Z(30961,19690,122714)
                            else
                                if Cb>104 then
                                    Ma=rc[-6207]or Z(-6207,40458,84199)
                                    continue
                                else
                                    Ma=rc[-30964]or Z(-30964,40257,112575)
                                    continue
                                end
                                Ma=rc[-4776]or Z(-4776,44092,16517)
                            end
                        elseif Ma<18809 then
                            if Ma<=18376 then
                                ra=q[32217];
                                va[q[57651]][ra]=va[q[1236]];
                                bb+=1;
                                Ma=rc[-1421]or Z(-1421,8869,62732)
                            else
                                if(F>=0 and hc>H)or((F<0 or F~=F)and hc<H)then
                                    Ma=rc[4771]or Z(4771,46549,23484)
                                else
                                    Ma=rc[10984]or Z(10984,51462,122828)
                                end
                            end
                        elseif Ma>18809 then
                            Za,ea,ca=nc
                            if gb(Za)~='function'then
                                Ma=rc[-26744]or Z(-26744,40893,128740)
                                continue
                            end
                            Ma=rc[9814]or Z(9814,43706,1661)
                        else
                            if Cb>73 then
                                Ma=rc[28202]or Z(28202,46721,124964)
                                continue
                            else
                                Ma=rc[-31170]or Z(-31170,51476,6346)
                                continue
                            end
                            Ma=rc[32512]or Z(32512,19996,26341)
                        end
                    elseif Ma>=17164 then
                        if Ma>17243 then
                            Za[42784],Ma=cc,rc[4100]or Z(4100,16878,10621)
                        elseif Ma>17164 then
                            Aa=hc
                            if H~=H then
                                Ma=rc[-753]or Z(-753,26781,36708)
                            else
                                Ma=18547
                            end
                        else
                            if Cb>165 then
                                Ma=rc[22403]or Z(22403,21545,127329)
                                continue
                            else
                                Ma=rc[11004]or Z(11004,53242,87785)
                                continue
                            end
                            Ma=rc[29557]or Z(29557,11829,50844)
                        end
                    elseif Ma>16802 then
                        if(F>=0 and hc>H)or((F<0 or F~=F)and hc<H)then
                            Ma=rc[-31771]or Z(-31771,22764,26828)
                        else
                            Ma=28768
                        end
                    else
                        Ma,va[q[1236]]=rc[-25138]or Z(-25138,37161,10120),q[32217]
                    end
                elseif Ma<=43288 then
                    if Ma<=36989 then
                        if Ma<33870 then
                            if Ma<30903 then
                                if Ma<=29027 then
                                    if Ma<=28768 then
                                        if Ma<=28730 then
                                            if Ma>27490 then
                                                if Cb>170 then
                                                    Ma=rc[19958]or Z(19958,52072,116429)
                                                    continue
                                                else
                                                    Ma=rc[3987]or Z(3987,56550,97023)
                                                    continue
                                                end
                                                Ma=rc[-17114]or Z(-17114,53199,123282)
                                            else
                                                Gb[q[32217]]=va[q[57651]];
                                                bb+=1;
                                                Ma=rc[-21779]or Z(-21779,34670,10547)
                                            end
                                        else
                                            fc,Ma=fc..Eb(B(ua(ca,Aa+1),ua(cc,Aa%#cc+1))),rc[-30059]or Z(-30059,59526,9051)
                                        end
                                    else
                                        if(m>=0 and F>Aa)or((m<0 or m~=m)and F<Aa)then
                                            Ma=rc[-13442]or Z(-13442,39434,105852)
                                        else
                                            Ma=rc[18180]or Z(18180,55194,74435)
                                        end
                                    end
                                elseif Ma<=30291 then
                                    if fc==-2 then
                                        Ma=rc[14852]or Z(14852,33716,119125)
                                        continue
                                    else
                                        Ma=rc[-15976]or Z(-15976,33715,117152)
                                        continue
                                    end
                                    Ma=rc[-28141]or Z(-28141,65504,4161)
                                else
                                    Ma,Hb=rc[13126]or Z(13126,24183,29142),ra+hc-1
                                end
                            elseif Ma<32136 then
                                if Ma<=31168 then
                                    if Ma<=30903 then
                                        Za,ea,ca=nc
                                        if gb(Za)~='function'then
                                            Ma=rc[6749]or Z(6749,14047,11103)
                                            continue
                                        end
                                        Ma=rc[-29964]or Z(-29964,43880,25713)
                                    else
                                        bb+=1;
                                        Ma=rc[31584]or Z(31584,38684,14821)
                                    end
                                else
                                    fc[2]=fc[3][fc[1]];
                                    fc[3]=fc;
                                    fc[1]=2;
                                    Ma,nc[cc]=rc[17375]or Z(17375,62026,122637),nil
                                end
                            elseif Ma>=33044 then
                                if Ma<=33044 then
                                    pc(fc,1,Za,ra+3,va);
                                    va[ra+2]=va[ra+3];
                                    bb+=q[39765];
                                    Ma=rc[-32441]or Z(-32441,64827,4998)
                                else
                                    bb+=1;
                                    Ma=rc[-18724]or Z(-18724,5006,42067)
                                end
                            else
                                if Cb>175 then
                                    Ma=rc[-12412]or Z(-12412,24374,26393)
                                    continue
                                else
                                    Ma=rc[-28328]or Z(-28328,55344,99085)
                                    continue
                                end
                                Ma=rc[-1856]or Z(-1856,9373,52068)
                            end
                        elseif Ma<=35425 then
                            if Ma>=34499 then
                                if Ma>=34849 then
                                    if Ma<=34849 then
                                        ra,Za=q[28625],q[32217];
                                        ea=Gb[Za]or Ob[13777][Za]
                                        if ra==1 then
                                            Ma=rc[-8122]or Z(-8122,18756,5708)
                                            continue
                                        elseif ra==2 then
                                            Ma=rc[28311]or Z(28311,37649,108798)
                                            continue
                                        elseif ra==3 then
                                            Ma=rc[-24013]or Z(-24013,60687,7605)
                                            continue
                                        end
                                        Ma=31168
                                    else
                                        bb+=q[39765];
                                        Ma=rc[23730]or Z(23730,43991,19898)
                                    end
                                elseif Ma<=34499 then
                                    if q[57651]==200 then
                                        Ma=rc[-415]or Z(-415,13412,3981)
                                        continue
                                    else
                                        Ma=rc[6709]or Z(6709,23231,130606)
                                        continue
                                    end
                                    Ma=rc[22813]or Z(22813,8698,63047)
                                else
                                    if va[q[1236]]then
                                        Ma=rc[16918]or Z(16918,4828,22394)
                                        continue
                                    end
                                    Ma=rc[-23528]or Z(-23528,65410,4207)
                                end
                            elseif Ma>34322 then
                                if(Aa>=0 and H>F)or((Aa<0 or Aa~=Aa)and H<F)then
                                    Ma=rc[-23660]or Z(-23660,64810,109183)
                                else
                                    Ma=rc[-3250]or Z(-3250,65477,5582)
                                end
                            elseif Ma<=33870 then
                                ra,Za,ea=q[1236],q[57651],q[15164]-1
                                if ea==-1 then
                                    Ma=rc[16290]or Z(16290,6440,126967)
                                    continue
                                end
                                Ma=rc[-5074]or Z(-5074,29180,37613)
                            else
                                if Cb>196 then
                                    Ma=rc[22108]or Z(22108,4633,30453)
                                    continue
                                else
                                    Ma=rc[-28723]or Z(-28723,45197,16126)
                                    continue
                                end
                                Ma=rc[-22808]or Z(-22808,25969,35792)
                            end
                        elseif Ma>36471 then
                            if Ma<=36776 then
                                va[q[1236]],Ma=ea[q[35485]],rc[18463]or Z(18463,16950,14321)
                            else
                                bb-=1;
                                Ma,_c[bb]=rc[-11754]or Z(-11754,63157,6428),{[56738]=170,[1236]=B(q[1236],143),[15164]=B(q[15164],196),[57651]=0}
                            end
                        elseif Ma<=36429 then
                            if Ma>35517 then
                                Ma=rc[-5315]or Z(-5315,3916,129054)
                                continue
                            else
                                Za=l_[7859];
                                Ma,Hb=rc[20209]or Z(20209,25881,37097),ra+Za-1
                            end
                        else
                            ra,Za,ea=B(q[15164],137),B(q[1236],208),B(q[57651],1);
                            ca,cc=Za==0 and Hb-ra or Za-1,va[ra];
                            fc,hc=ob(cc(Qb(va,ra+1,ra+ca)))
                            if ea==0 then
                                Ma=rc[-10988]or Z(-10988,40373,122546)
                                continue
                            else
                                Ma=rc[20952]or Z(20952,22015,120368)
                                continue
                            end
                            Ma=rc[-16556]or Z(-16556,56897,127292)
                        end
                    elseif Ma>39390 then
                        if Ma>=42142 then
                            if Ma<=42831 then
                                if Ma<42786 then
                                    if Ma>42142 then
                                        if Cb>195 then
                                            Ma=rc[15379]or Z(15379,49626,101903)
                                            continue
                                        else
                                            Ma=rc[-21673]or Z(-21673,55490,105549)
                                            continue
                                        end
                                        Ma=rc[17201]or Z(17201,7276,45109)
                                    else
                                        bb-=1;
                                        Ma,_c[bb]=rc[17119]or Z(17119,22090,32279),{[56738]=210,[1236]=B(q[1236],131),[15164]=B(q[15164],160),[57651]=0}
                                    end
                                elseif Ma>42786 then
                                    Ma,va[q[15164]]=rc[18640]or Z(18640,46573,23476),va[q[1236]][va[q[57651]]]
                                else
                                    cc={ea(va[ra+1],va[ra+2])};
                                    pc(cc,1,Za,ra+3,va)
                                    if va[ra+3]~=nil then
                                        Ma=rc[11460]or Z(11460,33510,16638)
                                        continue
                                    else
                                        Ma=rc[5434]or Z(5434,11295,63786)
                                        continue
                                    end
                                    Ma=rc[25268]or Z(25268,59691,4086)
                                end
                            elseif Ma>43248 then
                                bb+=1;
                                Ma=rc[12220]or Z(12220,4051,41406)
                            else
                                if(hc>=0 and cc>fc)or((hc<0 or hc~=hc)and cc<fc)then
                                    Ma=rc[4312]or Z(4312,6581,122662)
                                else
                                    Ma=53412
                                end
                            end
                        elseif Ma<40960 then
                            if Ma>40227 then
                                Za,ea,ca=ka(Za);
                                Ma=rc[-24914]or Z(-24914,31241,34100)
                            else
                                Pa(fc);
                                z[cc],Ma=nil,rc[6853]or Z(6853,54824,123349)
                            end
                        elseif Ma>40983 then
                            F=fc
                            if hc~=hc then
                                Ma=rc[12374]or Z(12374,15501,27323)
                            else
                                Ma=11600
                            end
                        elseif Ma<=40960 then
                            ra,Za=q[1236],q[15164];
                            ea=Za-1
                            if ea==-1 then
                                Ma=rc[-11057]or Z(-11057,33987,84775)
                                continue
                            else
                                Ma=rc[-12868]or Z(-12868,14670,3012)
                                continue
                            end
                            Ma=rc[27511]or Z(27511,50000,125610)
                        else
                            if Cb>103 then
                                Ma=rc[-10738]or Z(-10738,18283,120860)
                                continue
                            else
                                Ma=rc[8427]or Z(8427,56997,115184)
                                continue
                            end
                            Ma=rc[1133]or Z(1133,36873,9448)
                        end
                    elseif Ma>38147 then
                        if Ma<=38943 then
                            if Ma>38899 then
                                fc=fc+H;
                                F=fc
                                if fc~=fc then
                                    Ma=rc[-10038]or Z(-10038,37587,130181)
                                else
                                    Ma=rc[-32219]or Z(-32219,55730,118757)
                                end
                            elseif Ma<=38289 then
                                if Cb>157 then
                                    Ma=rc[27659]or Z(27659,4794,35524)
                                    continue
                                else
                                    Ma=rc[31308]or Z(31308,31130,130808)
                                    continue
                                end
                                Ma=rc[25121]or Z(25121,27562,35959)
                            else
                                bb+=q[39765];
                                Ma=rc[-19414]or Z(-19414,52906,123255)
                            end
                        elseif Ma>39306 then
                            z[q]=nil;
                            bb+=1;
                            Ma=rc[2611]or Z(2611,33917,10436)
                        else
                            Ma,va[q[1236]]=rc[30393]or Z(30393,16258,53359),nil
                        end
                    elseif Ma<=37677 then
                        if Ma<37618 then
                            if Ma>37019 then
                                bb-=1;
                                Ma,_c[bb]=rc[17966]or Z(17966,59151,2514),{[56738]=138,[1236]=B(q[1236],95),[15164]=B(q[15164],205),[57651]=0}
                            else
                                if Cb>251 then
                                    Ma=rc[14168]or Z(14168,36693,7194)
                                    continue
                                else
                                    Ma=rc[28003]or Z(28003,22650,27565)
                                    continue
                                end
                                Ma=rc[-12571]or Z(-12571,26220,36405)
                            end
                        elseif Ma<=37618 then
                            ra=sb[q[15164]+1];
                            Ma,ra[3][ra[1]]=rc[-23138]or Z(-23138,55854,127731),va[q[1236]]
                        else
                            if q[57651]==37 then
                                Ma=rc[13263]or Z(13263,37726,113979)
                                continue
                            elseif q[57651]==139 then
                                Ma=rc[14018]or Z(14018,49866,104768)
                                continue
                            elseif q[57651]==244 then
                                Ma=rc[10463]or Z(10463,58612,103938)
                                continue
                            else
                                Ma=rc[-12051]or Z(-12051,14283,23756)
                                continue
                            end
                            Ma=rc[19598]or Z(19598,51440,126801)
                        end
                    elseif Ma>=38079 then
                        if Ma>38079 then
                            ra,Za=nil,B(q[42833],7987);
                            ra=if Za<32768 then Za else Za-65536;
                            ea=ra;
                            ca=M[ea+1];
                            cc=ca[37491];
                            fc=tc(cc);
                            va[B(q[1236],98)]=lc(ca,fc);
                            hc,F,Ma,H=1,1,17243,cc
                        else
                            ra=rb(Za)
                            if ra~=nil and ra.__iter~=nil then
                                Ma=rc[5302]or Z(5302,15991,37708)
                                continue
                            elseif gb(Za)=='table'then
                                Ma=rc[-25172]or Z(-25172,55681,97699)
                                continue
                            end
                            Ma=rc[-13301]or Z(-13301,24018,31387)
                        end
                    else
                        va[q[1236]],Ma=ea,rc[-7879]or Z(-7879,32913,127062)
                    end
                elseif Ma<53094 then
                    if Ma<48212 then
                        if Ma>=45972 then
                            if Ma>=47010 then
                                if Ma>=48145 then
                                    if Ma<=48145 then
                                        cc,Ma=H,18135
                                        continue
                                    else
                                        if Cb>147 then
                                            Ma=rc[-7520]or Z(-7520,1262,22502)
                                            continue
                                        else
                                            Ma=rc[-3557]or Z(-3557,13759,38767)
                                            continue
                                        end
                                        Ma=rc[17291]or Z(17291,62118,1291)
                                    end
                                else
                                    if Cb>124 then
                                        Ma=rc[24659]or Z(24659,15559,47803)
                                        continue
                                    else
                                        Ma=rc[-7902]or Z(-7902,26702,30486)
                                        continue
                                    end
                                    Ma=rc[-24610]or Z(-24610,13504,55457)
                                end
                            elseif Ma>46302 then
                                bb-=1;
                                Ma,_c[bb]=rc[-20712]or Z(-20712,34216,10761),{[56738]=92,[1236]=B(q[1236],91),[15164]=B(q[15164],90),[57651]=0}
                            elseif Ma<=45972 then
                                cc,Ma=cc..Eb(B(ua(ea,F+1),ua(ca,F%#ca+1))),rc[-29408]or Z(-29408,56765,97947)
                            else
                                ra,Za,ea=q[57651],q[15164],q[32217];
                                ca=va[Za];
                                va[ra+1]=ca;
                                va[ra]=ca[ea];
                                bb+=1;
                                Ma=rc[3661]or Z(3661,28372,34493)
                            end
                        elseif Ma<=44754 then
                            if Ma>=44197 then
                                if Ma>44197 then
                                    Za[32217]=ea
                                    if ra==2 then
                                        Ma=rc[-4925]or Z(-4925,25045,5497)
                                        continue
                                    elseif ra==3 then
                                        Ma=rc[-1643]or Z(-1643,65383,96826)
                                        continue
                                    end
                                    Ma=25452
                                else
                                    m=H
                                    if F~=F then
                                        Ma=rc[-5769]or Z(-5769,23724,3069)
                                    else
                                        Ma=rc[27030]or Z(27030,21571,5666)
                                    end
                                end
                            else
                                ra=rb(Za)
                                if ra~=nil and ra.__iter~=nil then
                                    Ma=rc[3226]or Z(3226,49926,129571)
                                    continue
                                elseif gb(Za)=='table'then
                                    Ma=rc[6235]or Z(6235,32051,40811)
                                    continue
                                end
                                Ma=rc[24917]or Z(24917,33441,19528)
                            end
                        elseif Ma<=45494 then
                            Ma,ca=rc[3427]or Z(3427,28946,108433),nil
                        else
                            Ma,va[q[1236]]=rc[-13211]or Z(-13211,54610,129855),va[q[15164]]
                        end
                    elseif Ma<=51347 then
                        if Ma>=51256 then
                            if Ma>51317 then
                                hc=hc+F;
                                Aa=hc
                                if hc~=hc then
                                    Ma=rc[-16781]or Z(-16781,39720,15753)
                                else
                                    Ma=rc[18133]or Z(18133,17447,17597)
                                end
                            elseif Ma>51256 then
                                ca,Ma=Za-1,rc[2919]or Z(2919,17842,27528)
                            else
                                hc,Ma=ea-1,rc[29552]or Z(29552,33684,22281)
                            end
                        elseif Ma<=49001 then
                            if Ma>48212 then
                                ca,Ma=nil,rc[-15094]or Z(-15094,62025,87751)
                            else
                                Za,ea,ca=z
                                if gb(Za)~='function'then
                                    Ma=rc[-438]or Z(-438,17371,7581)
                                    continue
                                end
                                Ma=rc[-19987]or Z(-19987,47100,16545)
                            end
                        else
                            if(Aa>=0 and H>F)or((Aa<0 or Aa~=Aa)and H<F)then
                                Ma=rc[30680]or Z(30680,16187,127061)
                            else
                                Ma=rc[10215]or Z(10215,27372,47009)
                            end
                        end
                    elseif Ma>52392 then
                        if Ma>52756 then
                            if Cb>12 then
                                Ma=rc[11373]or Z(11373,25449,7424)
                                continue
                            else
                                Ma=rc[-20722]or Z(-20722,28990,117154)
                                continue
                            end
                            Ma=rc[-23284]or Z(-23284,19984,26353)
                        else
                            if Cb>160 then
                                Ma=rc[-7286]or Z(-7286,43282,11316)
                                continue
                            else
                                Ma=rc[19269]or Z(19269,3591,12287)
                                continue
                            end
                            Ma=rc[-10168]or Z(-10168,54684,129637)
                        end
                    elseif Ma>52176 then
                        Ma,ea=rc[-22494]or Z(-22494,51564,129629),Hb-Za+1
                    elseif Ma<=51349 then
                        bb-=1;
                        _c[bb],Ma={[56738]=112,[1236]=B(q[1236],169),[15164]=B(q[15164],182),[57651]=0},rc[-15344]or Z(-15344,17440,26753)
                    else
                        ra,Za=nil,va[q[1236]];
                        ra=dc(Za)=='function'
                        if not ra then
                            Ma=rc[-22907]or Z(-22907,25240,45980)
                            continue
                        end
                        Ma=rc[-14556]or Z(-14556,62860,76992)
                    end
                elseif Ma<=58875 then
                    if Ma<56148 then
                        if Ma>53895 then
                            if Ma>53951 then
                                bb-=1;
                                _c[bb],Ma={[56738]=55,[1236]=B(q[1236],183),[15164]=B(q[15164],105),[57651]=0},rc[14125]or Z(14125,9918,51459)
                            else
                                Za,ea,ca=ka(Za);
                                Ma=rc[-8972]or Z(-8972,16404,10707)
                            end
                        elseif Ma<=53834 then
                            if Ma<=53412 then
                                if Ma<=53094 then
                                    bb-=1;
                                    _c[bb],Ma={[56738]=165,[1236]=B(q[1236],114),[15164]=B(q[15164],52),[57651]=0},rc[-8847]or Z(-8847,6675,45822)
                                else
                                    ca..=va[H];
                                    Ma=rc[29986]or Z(29986,23264,29670)
                                end
                            else
                                H,Ma=H..Eb(B(ua(fc,ac+1),ua(hc,ac%#hc+1))),rc[-20140]or Z(-20140,30185,16786)
                            end
                        else
                            if Cb>11 then
                                Ma=rc[-18996]or Z(-18996,13918,130847)
                                continue
                            else
                                Ma=rc[13530]or Z(13530,47073,9954)
                                continue
                            end
                            Ma=rc[-14673]or Z(-14673,57793,14240)
                        end
                    elseif Ma>58419 then
                        if Ma<=58639 then
                            bb+=q[39765];
                            Ma=rc[-17025]or Z(-17025,33756,21925)
                        else
                            if fc[1]>=q[1236]then
                                Ma=rc[-26950]or Z(-26950,51702,100677)
                                continue
                            end
                            Ma=rc[2034]or Z(2034,52938,113549)
                        end
                    elseif Ma>58006 then
                        Aa=hc
                        if H~=H then
                            Ma=rc[-25688]or Z(-25688,39275,11085)
                        else
                            Ma=rc[21572]or Z(21572,63676,127391)
                        end
                    elseif Ma<57053 then
                        cc,fc=Ua(z[q],ea,va[ra+1],va[ra+2])
                        if not cc then
                            Ma=rc[24914]or Z(24914,13381,51224)
                            continue
                        end
                        Ma=30291
                    elseif Ma<=57053 then
                        H=H+Aa;
                        m=H
                        if H~=H then
                            Ma=rc[10322]or Z(10322,12609,40872)
                        else
                            Ma=rc[-30437]or Z(-30437,40222,109031)
                        end
                    else
                        if Cb>118 then
                            Ma=rc[-17692]or Z(-17692,25686,20168)
                            continue
                        else
                            Ma=rc[20135]or Z(20135,11670,49787)
                            continue
                        end
                        Ma=rc[20518]or Z(20518,34360,11929)
                    end
                elseif Ma<=62030 then
                    if Ma>61713 then
                        if Ma>62011 then
                            fc,hc=Za[42784],q[42784];
                            hc='\145k\151f-\200'..hc;
                            H='';
                            Aa,F,m,Ma=#fc-1,0,1,59645
                        else
                            bb+=q[39765];
                            Ma=rc[19736]or Z(19736,41506,19087)
                        end
                    elseif Ma>61565 then
                        ra=sb[q[15164]+1];
                        va[q[1236]],Ma=ra[3][ra[1]],rc[31395]or Z(31395,38230,15163)
                    elseif Ma<59645 then
                        cc,fc=Za[35485],q[35485];
                        fc='\145k\151f-\200'..fc;
                        hc='';
                        Aa,F,Ma,H=1,#cc-1,6782,0
                    elseif Ma<=59645 then
                        ac=F
                        if Aa~=Aa then
                            Ma=rc[26494]or Z(26494,35185,101989)
                        else
                            Ma=29027
                        end
                    else
                        Ma,fc[Aa]=rc[25792]or Z(25792,37433,104107),sb[m[15164]+1]
                    end
                elseif Ma>64644 then
                    if Ma<=64908 then
                        Ma,va[q[57651]]=rc[1054]or Z(1054,60197,3468),ca
                    else
                        va[q[57651]]=q[1236]==1;
                        bb+=q[15164];
                        Ma=rc[7483]or Z(7483,16253,53700)
                    end
                elseif Ma>64599 then
                    cc,fc=Za[35485],q[35485];
                    fc='\145k\151f-\200'..fc;
                    hc='';
                    Aa,F,H,Ma=1,#cc-1,0,rc[19507]or Z(19507,47062,108988)
                elseif Ma>64541 then
                    Ma,ca=9270,hc
                    continue
                else
                    Ma,ca=rc[8543]or Z(8543,63967,7963),Hb-ra+1
                end
            end
        end
        return function(...)
            local ma,Gc,Ia,Bb,R,r_,Sa,Qa,fa_,Ea,a_;
            Ia,ma=function(t_,Zb,Fc)
                ma[Fc]=Xa(Zb,7535)-Xa(t_,57402)
                return ma[Fc]
            end,{};
            Gc=ma[-29500]or Ia(25839,72762,-29500)
            while Gc~=29561 do
                if Gc<=34801 then
                    if Gc<23618 then
                        if Gc>2460 then
                            Gc=ma[22491]or Ia(59303,26233,22491)
                            continue
                        else
                            return Qb(a_,2,R)
                        end
                    elseif Gc<31872 then
                        Gc,Qa=ma[23254]or Ia(58204,37486,23254),dc(Qa)
                    elseif Gc>31872 then
                        a_,R=I[51974]+1,r_.n-I[51974];
                        Bb[7859]=R;
                        pc(r_,a_,a_+R-1,1,Bb[45350]);
                        Gc=ma[7243]or Ia(10186,85113,7243)
                    else
                        r_,fa_,Bb=xb(...),tc(I[37525]),{[45350]={},[7859]=0};
                        pc(r_,1,I[51974],0,fa_)
                        if I[51974]<r_.n then
                            Gc=ma[-4676]or Ia(48349,63927,-4676)
                            continue
                        end
                        Gc=35110
                    end
                elseif Gc>35739 then
                    Qa,Ea=a_[2],nil;
                    Sa=Qa;
                    Ea=dc(Sa)=='string'
                    if Ea==false then
                        Gc=ma[-6960]or Ia(42443,48988,-6960)
                        continue
                    end
                    Gc=35739
                elseif Gc>35110 then
                    return wb(Qa,0)
                else
                    a_,R=ob(U(qc,fa_,I[63798],I[51838],Bb))
                    if a_[1]then
                        Gc=ma[4956]or Ia(39349,40516,4956)
                        continue
                    else
                        Gc=ma[-5765]or Ia(62817,48045,-5765)
                        continue
                    end
                    Gc=22002
                end
            end
        end
    end
    return lc(w_,Ja)
end)
local mc;
mc,qa={[0]=0},function()
    mc[0]=mc[0]+1
    return{[3]=mc,[1]=mc[0]}
end;
yb=ba
return(function()
    return yb(u_(ib'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'),{})
end)()(...)
