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
local Ma,kc,Wa,uc,fa_,E=type,bit32.bxor,pairs,getmetatable
local W,V,vc,oa,h,xa,_a,ac,Rb,zc,Sb,ya,sb,pa,da,ua,O,Ha,c,q,nc,ma,Qb,Fb,Fc,kb,Bc,yc,M,xc;
ma=(select);
W=(function(...)
    return{[1]={...},[2]=ma('#',...)}
end);
yc=((function()
    local function ic(Cc,Za,Nb)
        if Za>Nb then
            return
        end
        return Cc[Za],ic(Cc,Za+1,Nb)
    end
    return ic
end)());
Fb,da=(string.gsub),(string.char);
Bc=(function(Z)
    Z=Fb(Z,'[^ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=]','')
    return(Z:gsub('.',function(ha)
        if(ha=='=')then
            return''
        end
        local Y,Ac='',(('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'):find(ha)-1)
        for Yb=6,1,-1 do
            Y=Y..(Ac%2^Yb-Ac%2^(Yb-1)>0 and'1'or'0')
        end
        return Y
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?',function(Ta)
        if(#Ta~=8)then
            return''
        end
        local zb=0
        for o_=1,8 do
            zb=zb+(Ta:sub(o_,o_)=='1'and 2^(8-o_)or 0)
        end
        return da(zb)
    end))
end);
M,zc,Ha,oa,Rb,xc,q,Sb=string.unpack,string.sub,string.byte,bit32 .lshift,bit32 .rshift,bit32 .band,table.concat,{};
kb=(function(t_)
    local Fa=Sb[t_]
    if Fa then
        return Fa
    end
    local gc,ub,Ba,na,Ia=oa(1,11),oa(1,5),1,{},''
    while Ba<=#t_ do
        local n_=Ha(t_,Ba);
        Ba=Ba+1
        for jc=1,8 do
            local r_=nil
            if xc(n_,1)~=0 then
                if Ba<=#t_ then
                    r_=zc(t_,Ba,Ba);
                    Ba=Ba+1
                end
            else
                if Ba+1<=#t_ then
                    local P=M('>I2',t_,Ba);
                    Ba=Ba+2
                    local p,gb=#Ia-Rb(P,5),xc(P,(ub-1))+3;
                    r_=zc(Ia,p,p+gb-1)
                end
            end
            n_=Rb(n_,1)
            if r_ then
                na[#na+1]=r_;
                Ia=zc(Ia..r_,-gc)
            end
        end
    end
    local vb=q(na);
    Sb[t_]=vb
    return vb
end)
local j,Ka,rb,Jb,y,fc,qb,z,Ib,X,N,ga,ec,wc,H,hc,e_,qa,pb,Lb,Q,u_,Pb,dc,bc,va,l_,f_,B,Ob=type,pcall,error,tonumber,assert,select,setmetatable,string.format,string.unpack,string.sub,string.byte,string.char,table.move,table.pack,table.create,table.insert,table.concat,coroutine.create,coroutine.yield,coroutine.resume,coroutine.close,getfenv,bit32 .bor,bit32 .bxor,bit32 .band,bit32 .btest,bit32 .rshift,bit32 .lshift,bit32 .extract,{[21386]={},[48405]={{6,2,true},{10,8,false},{3,6,false},{10,10,false},{10,10,true},{4,1,false},{6,4,true},{3,10,false},{3,10,false},{9,1,false},{0,1,false},{0,8,true},{10,10,false},{6,8,true},{9,10,false},{10,10,false},{4,8,false},{10,10,false},{3,10,false},{3,10,false},{10,10,true},{10,10,false},{4,9,false},{6,7,true},{10,7,true},{3,4,false},{10,3,true},{10,8,false},{0,6,true},{0,2,true},{6,6,true},{4,10,false},{3,10,true},{0,5,false},{3,4,false},{6,2,true},{3,10,false},{6,2,true},{3,3,true},{6,2,true},{3,10,false},{3,10,false},{6,7,true},{0,7,true},{3,3,true},{9,2,true},{10,3,false},{6,1,true},{9,10,true},{9,8,true},{10,10,false},{6,9,false},{0,9,true},{3,3,true},{10,7,true},{3,4,false},{3,10,false},{3,10,false},{0,2,true},{10,8,false},{10,10,true},{3,3,true},{9,10,false},{9,8,true},{4,7,false},{10,7,false},{4,6,true},{4,4,false},{4,2,true},{3,10,false},{3,10,false},{9,7,false},{0,2,false},{0,10,false},{0,9,true},{6,3,false},{6,3,false},{0,1,true},{10,3,false},{3,8,true},{3,0,false},{3,2,true},{9,1,false},{9,7,false},{3,0,false},{9,8,false},{4,9,false},{3,6,true},{10,3,true},{0,2,true},{0,2,false},{3,0,false},{9,3,true},{0,2,true},{0,6,true},{3,10,false},{9,8,true},{4,4,true},{4,8,true},{0,8,true},{3,10,false},{10,8,true},{4,3,true},{3,10,false},{3,10,false},{10,10,false},{3,10,false},{4,3,true},{3,0,false},{6,1,false},{0,3,false},{3,0,false},{9,4,false},{3,9,true},{6,8,true},{0,10,true},{9,8,false},{6,6,false},{9,10,false},{6,9,false},{3,10,false},{3,10,false},{4,9,true},{10,10,false},{3,8,false},{3,10,false},{3,0,false},{3,8,true},{3,7,true},{10,10,false},{6,10,true},{3,7,false},{10,10,false},{10,3,true},{3,7,false},{9,10,false},{10,10,false},{10,4,false},{9,3,false},{10,10,true},{0,7,true},{4,2,true},{10,2,true},{4,7,false},{0,4,true},{3,4,false},{4,8,false},{3,6,false},{9,6,true},{10,9,true},{10,4,false},{0,6,true},{3,10,false},{3,10,false},{4,10,true},{3,10,false},{10,10,true},{0,4,false},{3,1,false},{9,6,false},{10,10,true},{0,9,true},{3,6,true},{10,4,false},{0,7,true},{4,9,false},{3,10,false},{10,8,true},{4,8,true},{9,7,false},{3,8,true},{9,6,true},{0,9,false},{4,4,true},{10,9,true},{6,6,true},{3,0,false},{0,10,false},{4,9,true},{9,9,true},{3,3,true},{10,3,true},{0,1,true},{9,3,true},{0,8,false},{3,3,true},{9,4,false},{6,7,false},{4,4,false},{3,10,false},{10,2,true},{10,4,false},{3,10,true},{3,10,false},{6,7,true},{0,8,false},{4,9,true},{3,2,true},{10,3,false},{3,8,true},{4,2,true},{6,1,false},{4,2,false},{3,10,false},{6,2,true},{0,6,false},{4,7,false},{0,2,true},{3,4,false},{3,4,false},{6,9,true},{0,2,false},{10,10,false},{10,6,false},{3,6,true},{10,10,true},{10,4,true},{3,7,false},{9,2,true},{3,10,false},{3,8,false},{3,10,false},{4,10,true},{3,3,true},{10,1,true},{3,10,false},{10,9,true},{6,7,true},{4,8,true},{3,10,false},{4,4,false},{3,1,true},{10,7,true},{3,10,true},{3,3,true},{4,1,false},{0,6,true},{0,9,true},{9,4,true},{10,10,true},{6,1,true},{3,0,false},{0,7,true},{4,1,true},{10,10,false},{6,7,false},{3,10,false},{4,1,false},{3,7,true},{9,8,false},{3,3,true},{10,9,true},{3,1,false},{4,6,true},{3,10,false},{4,9,false}},[59889]={}}
local Sa=(function(ia)
    local i_=Ob[21386][ia]
    if i_ then
        return i_
    end
    local ba=1
    local function hb()
        local jb,fb,Na,lc,S,T,Ca,Xa,Ra,ob,A,ta,Gc,xb,v,K,Cb,ab,eb,_c,cc,g,lb,Va,la,R,Eb,oc,F,wa,Dc,k;
        ab,Ra={},function(Ab,Qa,ib)
            ab[Qa]=kc(ib,37795)-kc(Ab,16303)
            return ab[Qa]
        end;
        lb=ab[7567]or Ra(58501,7567,101642)
        repeat
            if lb>=27173 then
                if lb>45504 then
                    if lb<=55785 then
                        if lb<=51936 then
                            if lb>=47053 then
                                if lb<=49239 then
                                    if lb>47953 then
                                        v,lb=nil,ab[-4021]or Ra(54961,-4021,79820)
                                    elseif lb<=47053 then
                                        lb,_c=ab[30036]or Ra(644,30036,104168),dc(lc,255)
                                        continue
                                    else
                                        fb=Ib('<I4',ia,ba);
                                        ba,lb=ba+4,6357
                                    end
                                elseif lb<=51232 then
                                    lc=_c;
                                    Gc=Pb(Gc,f_(bc(lc,127),g*7))
                                    if not va(lc,128)then
                                        lb=ab[25521]or Ra(4710,25521,60027)
                                        continue
                                    end
                                    lb=ab[13309]or Ra(36840,13309,112363)
                                else
                                    lb=ab[20896]or Ra(5726,20896,22767)
                                    continue
                                end
                            elseif lb>46168 then
                                lb,xb=8644,R
                                continue
                            elseif lb>=45965 then
                                if lb<=45965 then
                                    lb,jb=ab[-22684]or Ra(30165,-22684,58878),nil
                                else
                                    Gc=0;
                                    T,F,lb,Cb=1,4,28057,0
                                end
                            else
                                Va=Xa
                                if Va==6 then
                                    lb=ab[29602]or Ra(61893,29602,102460)
                                    continue
                                elseif Va==3 then
                                    lb=ab[12028]or Ra(46591,12028,15558)
                                    continue
                                elseif Va==5 then
                                    lb=ab[-32051]or Ra(54986,-32051,24707)
                                    continue
                                elseif Va==2 then
                                    lb=ab[15349]or Ra(64724,15349,23400)
                                    continue
                                end
                                lb=ab[-32086]or Ra(526,-32086,113885)
                            end
                        elseif lb>54462 then
                            if lb>=55416 then
                                if lb<=55416 then
                                    ob=eb;
                                    ta=Pb(ta,f_(bc(ob,127),jb*7))
                                    if not va(ob,128)then
                                        lb=ab[19778]or Ra(5344,19778,4084)
                                        continue
                                    end
                                    lb=ab[8795]or Ra(7892,8795,43323)
                                else
                                    lb,wa,cc=ab[24118]or Ra(14109,24118,42367),S,nil
                                end
                            else
                                Na,lb=nil,30276
                            end
                        elseif lb<53257 then
                            if lb<=52539 then
                                ta[30272]=bc(l_(fb,8),255);
                                ta[54477]=bc(l_(fb,16),255);
                                ta[5694],lb=bc(l_(fb,24),255),ab[-5308]or Ra(41641,-5308,105923)
                            else
                                lc,lb=dc(Ca,-67368000),6449
                                continue
                            end
                        elseif lb>53257 then
                            Xa=Ib('B',ia,ba);
                            ba,lb=ba+1,ab[22990]or Ra(51227,22990,110408)
                        else
                            xb,lb=W(Na),ab[5155]or Ra(39063,5155,22176)
                            continue
                        end
                    elseif lb>60818 then
                        if lb>=61917 then
                            if lb>=63321 then
                                if lb>63321 then
                                    lb,Xa[28616]=ab[-24613]or Ra(7695,-24613,101257),_c[Xa[42581]+1]
                                else
                                    Va=Ib('B',ia,ba);
                                    lb,ba=ab[-26522]or Ra(35845,-26522,12106),ba+1
                                end
                            elseif lb>61917 then
                                lc=lc+v;
                                fb=lc
                                if lc~=lc then
                                    lb=ab[17799]or Ra(57850,17799,121194)
                                else
                                    lb=45504
                                end
                            else
                                _c[fb],lb=la,ab[25552]or Ra(63281,25552,124397)
                            end
                        elseif lb<61544 then
                            ob=Ib('B',ia,ba);
                            ba,lb=ba+1,40848
                        elseif lb<=61544 then
                            if(_c>=0 and T>g)or((_c<0 or _c~=_c)and T<g)then
                                lb=28608
                            else
                                lb=ab[-16376]or Ra(64333,-16376,30942)
                            end
                        else
                            fb=fb+Va;
                            la=fb
                            if fb~=fb then
                                lb=1282
                            else
                                lb=24079
                            end
                        end
                    elseif lb<=58527 then
                        if lb<=56272 then
                            if lb<56174 then
                                lb,F=ab[3335]or Ra(59457,3335,87025),Ca
                            elseif lb>56174 then
                                lb,T=5112,dc(g,-67368000)
                                continue
                            else
                                Xa[28616],lb=_c[Xa[20206]+1],ab[-27042]or Ra(16229,-27042,25847)
                            end
                        elseif lb<=58013 then
                            jb=Na
                            if Eb~=Eb then
                                lb=ab[22706]or Ra(34356,22706,20503)
                            else
                                lb=ab[13986]or Ra(14624,13986,36330)
                            end
                        else
                            fb=lc
                            if Ca~=Ca then
                                lb=ab[-10539]or Ra(42347,-10539,10019)
                            else
                                lb=ab[13625]or Ra(23770,13625,15265)
                            end
                        end
                    elseif lb<60161 then
                        T=T+_c;
                        lc=T
                        if T~=T then
                            lb=28608
                        else
                            lb=61544
                        end
                    elseif lb<=60161 then
                        A,lb=dc(Gc,-67368000),ab[4884]or Ra(46011,4884,26979)
                        continue
                    else
                        lb,_c=ab[25351]or Ra(10874,25351,46771),nil
                    end
                elseif lb<33026 then
                    if lb<=29953 then
                        if lb>=28332 then
                            if lb<28936 then
                                if lb<=28332 then
                                    Gc=A;
                                    Cb,F=H(Gc),false;
                                    lb,T,g,_c=ab[-15169]or Ra(5963,-15169,54105),1,Gc,1
                                else
                                    T,lb=nil,ab[14540]or Ra(61607,14540,99134)
                                end
                            elseif lb<=29018 then
                                if lb>28936 then
                                    if R then
                                        lb=ab[-13624]or Ra(22474,-13624,104626)
                                        continue
                                    end
                                    lb=ab[-346]or Ra(47871,-346,6162)
                                else
                                    lb=ab[4752]or Ra(53937,4752,25748)
                                    continue
                                end
                            else
                                Cb=Cb+T;
                                g=Cb
                                if Cb~=Cb then
                                    lb=ab[-3845]or Ra(25258,-3845,121765)
                                else
                                    lb=ab[-30989]or Ra(17045,-30989,26352)
                                end
                            end
                        elseif lb<=27764 then
                            if lb<=27622 then
                                if lb<=27173 then
                                    Xa[28616],lb=B(Xa[42581],0,16),ab[8868]or Ra(1133,8868,106991)
                                else
                                    ta[30272]=bc(l_(fb,8),255);
                                    Na=bc(l_(fb,16),65535);
                                    ta[37295]=Na;
                                    Eb=nil;
                                    Eb=if Na<32768 then Na else Na-65536;
                                    lb,ta[9383]=ab[-21451]or Ra(16550,-21451,25536),Eb
                                end
                            else
                                lb,lc=ab[-8399]or Ra(39022,-8399,111279),nil
                            end
                        else
                            g=Cb
                            if F~=F then
                                lb=ab[-842]or Ra(46939,-842,122966)
                            else
                                lb=ab[-14931]or Ra(61449,-14931,119836)
                            end
                        end
                    elseif lb<31051 then
                        if lb>30276 then
                            if(T>=0 and Cb>F)or((T<0 or T~=T)and Cb<F)then
                                lb=ab[-25710]or Ra(48568,-25710,130747)
                            else
                                lb=ab[-10796]or Ra(5113,-10796,100939)
                            end
                        elseif lb<=30207 then
                            lb,R=ab[2999]or Ra(37000,2999,9503),nil
                        else
                            Eb=Ib('c'..ta,ia,ba);
                            ba,lb=ba+ta,8253
                        end
                    elseif lb>=32431 then
                        if lb<=32431 then
                            lb,Ca=49239,nil
                        else
                            Xa=fb;
                            g=Pb(g,f_(bc(Xa,127),v*7))
                            if not va(Xa,128)then
                                lb=ab[11131]or Ra(41721,11131,108900)
                                continue
                            end
                            lb=ab[9236]or Ra(64078,9236,23264)
                        end
                    elseif lb>31051 then
                        ta=ta+Eb;
                        K=ta
                        if ta~=ta then
                            lb=ab[-981]or Ra(5535,-981,22568)
                        else
                            lb=ab[-2984]or Ra(13388,-2984,3723)
                        end
                    else
                        Ca=0;
                        Xa,fb,v,lb=1,4,0,ab[27524]or Ra(54754,27524,120273)
                    end
                elseif lb<40075 then
                    if lb>36583 then
                        if lb>37189 then
                            ta=bc(l_(la,10),1023);
                            lb,Xa[24452]=ab[-24589]or Ra(49957,-24589,90295),_c[ta+1]
                        elseif lb<=36946 then
                            fb=v;
                            Xa=bc(fb,255);
                            Va=Ob[48405][Xa+1];
                            la,xb,R=Va[1],Va[2],Va[3];
                            ta={[9383]=0,[42581]=0,[30272]=0,[5694]=0,[28616]=0,[52660]=xb,[20206]=0,[42003]=0,[52854]=Xa,[49502]=nil,[14080]=0,[24452]=0,[22949]=0,[37295]=0,[54477]=0};
                            hc(Cb,ta)
                            if la==3 then
                                lb=ab[-3245]or Ra(17288,-3245,121537)
                                continue
                            elseif la==10 then
                                lb=ab[-18901]or Ra(50265,-18901,128127)
                                continue
                            elseif la==0 then
                                lb=ab[-17083]or Ra(2329,-17083,1626)
                                continue
                            end
                            lb=29018
                        else
                            if(Eb>=0 and ta>Na)or((Eb<0 or Eb~=Eb)and ta<Na)then
                                lb=ab[-31701]or Ra(60194,-31701,124491)
                            else
                                lb=ab[-32159]or Ra(3124,-32159,29835)
                            end
                        end
                    elseif lb>33786 then
                        if lb<=34655 then
                            wa=Ib('B',ia,ba);
                            lb,ba=19053,ba+1
                        else
                            la,lb=nil,ab[-4303]or Ra(38557,-4303,10953)
                        end
                    elseif lb<=33565 then
                        if lb>33026 then
                            v=v+Xa;
                            Va=v
                            if v~=v then
                                lb=ab[24490]or Ra(9114,24490,31287)
                            else
                                lb=13613
                            end
                        else
                            lb=ab[194]or Ra(44568,194,117941)
                            continue
                        end
                    else
                        Xa[28616]=B(Xa[42581],0,1)==1;
                        lb,Xa[14080]=ab[12355]or Ra(64027,12355,77725),B(Xa[42581],31,1)==1
                    end
                elseif lb<=41644 then
                    if lb>=40848 then
                        if lb>=41307 then
                            if lb<=41307 then
                                lb,xb=17266,W(dc(R,-67368000))
                                continue
                            else
                                lb,Na=ab[7690]or Ra(40089,7690,104483),nil
                            end
                        else
                            lb,eb=ab[13612]or Ra(24423,13612,109283),dc(ob,255)
                            continue
                        end
                    elseif lb>40075 then
                        lb=ab[-10782]or Ra(30401,-10782,112285)
                        continue
                    else
                        xb=la;
                        Ca=Pb(Ca,f_(bc(xb,127),Va*7))
                        if not va(xb,128)then
                            lb=ab[-11146]or Ra(63912,-11146,119978)
                            continue
                        end
                        lb=ab[-14212]or Ra(2433,-14212,10984)
                    end
                elseif lb<44464 then
                    if lb>42592 then
                        if(Ca>=0 and _c>lc)or((Ca<0 or Ca~=Ca)and _c<lc)then
                            lb=ab[-8622]or Ra(62089,-8622,80725)
                        else
                            lb=113
                        end
                    else
                        Xa=Cb[fb];
                        Va=Xa[52660]
                        if Va==5 then
                            lb=ab[-15987]or Ra(12741,-15987,31355)
                            continue
                        elseif Va==7 then
                            lb=ab[19786]or Ra(41323,19786,110877)
                            continue
                        elseif Va==1 then
                            lb=ab[-14899]or Ra(39290,-14899,104106)
                            continue
                        elseif Va==9 then
                            lb=ab[-10577]or Ra(42472,-10577,104399)
                            continue
                        elseif Va==3 then
                            lb=ab[29779]or Ra(18358,29779,123167)
                            continue
                        elseif Va==4 then
                            lb=ab[-3848]or Ra(14360,-3848,62690)
                            continue
                        end
                        lb=ab[-15740]or Ra(58593,-15740,82555)
                    end
                elseif lb<=44464 then
                    lc=lc+v;
                    fb=lc
                    if lc~=lc then
                        lb=ab[24843]or Ra(53558,24843,105462)
                    else
                        lb=17549
                    end
                else
                    if(v>=0 and lc>Ca)or((v<0 or v~=v)and lc<Ca)then
                        lb=ab[15656]or Ra(35348,15656,110988)
                    else
                        lb=ab[21721]or Ra(40486,21721,119882)
                    end
                end
            elseif lb>=9883 then
                if lb<19053 then
                    if lb<16597 then
                        if lb>=13613 then
                            if lb<15280 then
                                if lb>13613 then
                                    la,lb=nil,ab[813]or Ra(61663,813,86766)
                                else
                                    if(Xa>=0 and v>fb)or((Xa<0 or Xa~=Xa)and v<fb)then
                                        lb=ab[9221]or Ra(23919,9221,107452)
                                    else
                                        lb=ab[8879]or Ra(19675,8879,102904)
                                    end
                                end
                            elseif lb<=15280 then
                                Na,lb=dc(Eb,1513120829),ab[25367]or Ra(30962,25367,16348)
                                continue
                            else
                                eb=jb;
                                R=Pb(R,f_(bc(eb,127),K*7))
                                if not va(eb,128)then
                                    lb=ab[-29289]or Ra(45974,-29289,115898)
                                    continue
                                end
                                lb=ab[-3098]or Ra(49574,-3098,125041)
                            end
                        elseif lb<=11235 then
                            if lb<=9974 then
                                if lb>9883 then
                                    lb,eb=61105,nil
                                else
                                    if F then
                                        lb=ab[-3026]or Ra(42013,-3026,11885)
                                        continue
                                    else
                                        lb=ab[-2106]or Ra(40379,-2106,111456)
                                        continue
                                    end
                                    lb=ab[20625]or Ra(39489,20625,73201)
                                end
                            else
                                eb=Ib('B',ia,ba);
                                ba,lb=ba+1,21731
                            end
                        else
                            k=Ib('B',ia,ba);
                            ba,lb=ba+1,ab[-166]or Ra(13375,-166,57286)
                        end
                    elseif lb<17266 then
                        if lb<16721 then
                            if lb>16597 then
                                oc,lb,S=Dc,ab[12076]or Ra(38935,12076,113844),nil
                            else
                                lb,cc=ab[-27876]or Ra(31422,-27876,3860),dc(k,255)
                                continue
                            end
                        elseif lb>16721 then
                            g=0;
                            _c,Ca,lb,lc=0,1,20682,4
                        else
                            lb,Xa=63321,nil
                        end
                    elseif lb<17549 then
                        if lb>17266 then
                            lb,Dc=ab[-26211]or Ra(40270,-26211,16364),nil
                        else
                            la,lb=yc(xb[1],1,xb[2]),ab[4590]or Ra(14090,4590,26913)
                        end
                    elseif lb>17549 then
                        fb,lb=dc(Xa,255),32736
                        continue
                    else
                        if(v>=0 and lc>Ca)or((v<0 or v~=v)and lc<Ca)then
                            lb=6588
                        else
                            lb=ab[23927]or Ra(5113,23927,65028)
                        end
                    end
                elseif lb>24079 then
                    if lb>25024 then
                        if lb>=26616 then
                            if lb<=26616 then
                                R=Ib('<d',ia,ba);
                                lb,ba=ab[17979]or Ra(20754,17979,110785),ba+8
                            else
                                Eb=Ib('<I4',ia,ba);
                                ba,lb=ba+4,15280
                            end
                        else
                            Eb=Na;
                            ta[42581]=Eb;
                            hc(Cb,{});
                            lb=ab[30796]or Ra(55184,30796,32003)
                        end
                    elseif lb>24458 then
                        ta=R
                        if ta==0 then
                            lb=ab[-30816]or Ra(50096,-30816,122163)
                            continue
                        else
                            lb=ab[31051]or Ra(11380,31051,31545)
                            continue
                        end
                        lb=ab[19943]or Ra(36490,19943,111751)
                    elseif lb<24387 then
                        la=Xa[42581];
                        xb,R=l_(la,30),bc(l_(la,20),1023);
                        Xa[28616]=_c[R+1];
                        Xa[22949]=xb
                        if xb==2 then
                            lb=ab[-32162]or Ra(38911,-32162,110187)
                            continue
                        elseif xb==3 then
                            lb=ab[-3557]or Ra(61448,-3557,114414)
                            continue
                        end
                        lb=ab[7680]or Ra(62260,7680,86150)
                    elseif lb>24387 then
                        lb,Xa[28616]=ab[-5174]or Ra(17310,-5174,123160),_c[Xa[9383]+1]
                    else
                        Na,Eb=bc(l_(fb,8),16777215),nil;
                        Eb=if Na<8388608 then Na else Na-16777216;
                        lb,ta[20206]=ab[30790]or Ra(17583,30790,32761),Eb
                    end
                elseif lb<=21731 then
                    if lb<=20682 then
                        if lb>=19471 then
                            if lb<=19471 then
                                lb=ab[-29708]or Ra(35848,-29708,68875)
                                continue
                            else
                                v=_c
                                if lc~=lc then
                                    lb=ab[1653]or Ra(62871,1653,79275)
                                else
                                    lb=42737
                                end
                            end
                        else
                            S,lb=dc(wa,255),ab[-13331]or Ra(38004,-13331,71271)
                            continue
                        end
                    elseif lb>21105 then
                        jb,lb=dc(eb,255),ab[-29186]or Ra(40203,-29186,28958)
                        continue
                    else
                        lb,xb=ab[-27684]or Ra(35054,-27684,18095),W''
                        continue
                    end
                elseif lb>=23974 then
                    if lb<=23974 then
                        ta,Na=bc(l_(la,10),1023),bc(l_(la,0),1023);
                        Xa[24452]=_c[ta+1];
                        Xa[42003],lb=_c[Na+1],ab[-12512]or Ra(60556,-12512,88590)
                    else
                        if(Va>=0 and fb>Xa)or((Va<0 or Va~=Va)and fb<Xa)then
                            lb=1282
                        else
                            lb=8005
                        end
                    end
                elseif lb<=22438 then
                    k,A,lb=cc,nil,ab[-3554]or Ra(5095,-3554,29443)
                else
                    Va=v
                    if fb~=fb then
                        lb=ab[7084]or Ra(60567,7084,78644)
                    else
                        lb=ab[-31291]or Ra(42430,-31291,23709)
                    end
                end
            elseif lb<5932 then
                if lb<1941 then
                    if lb>866 then
                        if lb<1360 then
                            return{[16002]=oc,[57745]=wa,[52483]=Cb,[54289]='',[59406]=k,[22307]=v}
                        elseif lb>1360 then
                            Ca,lb=R,ab[-17676]or Ra(23576,-17676,109758)
                            continue
                        else
                            lb,xb=26616,nil
                        end
                    elseif lb<=625 then
                        if lb>592 then
                            R=0;
                            Na,lb,ta,Eb=4,8935,0,1
                        elseif lb>113 then
                            fb=lc
                            if Ca~=Ca then
                                lb=27764
                            else
                                lb=ab[-11052]or Ra(33597,-11052,130545)
                            end
                        else
                            lb,fb=ab[16815]or Ra(23251,16815,108953),nil
                        end
                    else
                        _c=_c+Ca;
                        v=_c
                        if _c~=_c then
                            lb=ab[27487]or Ra(60943,27487,81619)
                        else
                            lb=ab[-31839]or Ra(52035,-31839,67710)
                        end
                    end
                elseif lb>=2585 then
                    if lb>=4152 then
                        if lb<=4152 then
                            xb=Ib('B',ia,ba);
                            ba,lb=ba+1,5932
                        else
                            g=T;
                            _c=H(g);
                            Ca,lc,v,lb=g,1,1,58527
                        end
                    elseif lb>2585 then
                        lc=Ib('B',ia,ba);
                        ba,lb=ba+1,ab[-5389]or Ra(3986,-5389,31657)
                    else
                        lb,R=25024,dc(ta,-67368000)
                        continue
                    end
                elseif lb>=2414 then
                    if lb>2414 then
                        lb,xb=ab[30353]or Ra(14129,30353,60734),W(nil)
                    else
                        oc=Ib('B',ia,ba);
                        ba,lb=ba+1,ab[-818]or Ra(52869,-818,99054)
                    end
                elseif lb>1941 then
                    Xa,lb=dc(Va,255),ab[-7713]or Ra(4834,-7713,19612)
                    continue
                else
                    ta=0;
                    Eb,Na,lb,K=4,0,ab[20168]or Ra(12813,20168,25500),1
                end
            elseif lb>=7627 then
                if lb>=8644 then
                    if lb>=8935 then
                        if lb>8935 then
                            xb,lb=W(nil),ab[-16815]or Ra(36481,-16815,8252)
                        else
                            K=ta
                            if Na~=Na then
                                lb=ab[18766]or Ra(8830,18766,11407)
                            else
                                lb=37189
                            end
                        end
                    elseif lb>8644 then
                        F,lb=false,ab[-15758]or Ra(44420,-15758,125228)
                    else
                        la,lb=xb,ab[-26757]or Ra(44952,-26757,70071)
                    end
                elseif lb<8227 then
                    if lb<=7627 then
                        la,lb=yc(xb[1],1,xb[2]),ab[18823]or Ra(21113,18823,117776)
                    else
                        lb,v[la]=ab[19378]or Ra(1690,19378,113183),hb()
                    end
                elseif lb<=8227 then
                    Dc,lb=dc(oc,255),16705
                    continue
                else
                    Na,lb=Eb,ab[-5779]or Ra(57868,-5779,81423)
                    continue
                end
            elseif lb<=6429 then
                if lb<6166 then
                    if lb>5932 then
                        if(K>=0 and Na>Eb)or((K<0 or K~=K)and Na<Eb)then
                            lb=ab[2283]or Ra(34821,2283,21088)
                        else
                            lb=9974
                        end
                    else
                        la,lb=dc(xb,255),40075
                        continue
                    end
                elseif lb>=6357 then
                    if lb>6357 then
                        Na=Na+K;
                        jb=Na
                        if Na~=Na then
                            lb=ab[13186]or Ra(12603,13186,35598)
                        else
                            lb=ab[-933]or Ra(27922,-933,63956)
                        end
                    else
                        lb,v=ab[-14439]or Ra(54952,-14439,125690),dc(fb,1513120829)
                        continue
                    end
                else
                    lc=T
                    if g~=g then
                        lb=28608
                    else
                        lb=61544
                    end
                end
            elseif lb>6588 then
                la=fb
                if Xa~=Xa then
                    lb=ab[-11305]or Ra(7605,-11305,46271)
                else
                    lb=ab[11844]or Ra(21588,11844,22953)
                end
            elseif lb>6449 then
                lc,lb,v,Ca=1,ab[27228]or Ra(46226,27228,7726),1,Gc
            else
                Ca=lc;
                v=H(Ca);
                Xa,Va,lb,fb=Ca,1,ab[27039]or Ra(44875,27039,14501),1
            end
        until lb==40132
    end
    local Ya=hb();
    Ob[21386][ia]=Ya
    return Ya
end)
local pc=(function(tc,w_)
    tc=Sa(tc)
    local Zb=u_()
    local function Gb(nb,d_)
        local U=(function(...)
            return{...},fc('#',...)
        end)
        local La;
        La=(function(Bb,aa,bb)
            if aa>bb then
                return
            end
            return Bb[aa],La(Bb,aa+1,bb)
        end)
        local function Pa(ea,cb,Ga,db)
            local L,Mb,I,Kb,ra,x,sc,Aa,Ua,Tb,Db,rc,J,Xb,Wb,tb,Hb,G,Da,ja,Ec,Vb,ka,m;
            ra,L=function(D,mb,ca)
                L[mb]=kc(ca,7033)-kc(D,37236)
                return L[mb]
            end,{};
            Tb=L[29189]or ra(35102,29189,55803)
            while Tb~=27938 do
                if Tb>=33590 then
                    if Tb>48142 then
                        if Tb>=57185 then
                            if Tb<=62011 then
                                if Tb>60655 then
                                    if Tb<=61863 then
                                        if Tb<61249 then
                                            Ec=cb[Xb[28616]+1];
                                            I=Ec[59406];
                                            ja=H(I);
                                            ea[Xb[30272]]=Gb(Ec,ja);
                                            Db,m,Tb,G=I,1,49901,1
                                        elseif Tb<=61249 then
                                            Ec=Xb[28616];
                                            ea[Xb[5694]]=ea[Xb[30272]][Ec];
                                            Ua+=1;
                                            Tb=L[-6525]or ra(20515,-6525,54967)
                                        else
                                            sc=Ga[Ua];
                                            Ua+=1;
                                            Mb=sc[30272]
                                            if Mb==0 then
                                                Tb=L[28811]or ra(60091,28811,68716)
                                                continue
                                            elseif Mb==2 then
                                                Tb=L[-31320]or ra(3664,-31320,98463)
                                                continue
                                            end
                                            Tb=L[23166]or ra(48724,23166,32190)
                                        end
                                    elseif Tb>61913 then
                                        ja,Tb=G,22635
                                        continue
                                    else
                                        if Da>36 then
                                            Tb=L[-21991]or ra(39986,-21991,39536)
                                            continue
                                        else
                                            Tb=L[18597]or ra(21458,18597,105512)
                                            continue
                                        end
                                        Tb=L[32073]or ra(1682,32073,48932)
                                    end
                                elseif Tb<59372 then
                                    if Tb>57325 then
                                        m,Db=I[28616],Xb[28616];
                                        Db='\206]\23\231\"\208\170\219'..Db;
                                        G='';
                                        rc,Tb,Mb,sc=0,45795,1,#m-1
                                    elseif Tb>57185 then
                                        if Da>121 then
                                            Tb=L[-29507]or ra(1024,-29507,77273)
                                            continue
                                        else
                                            Tb=L[16354]or ra(1271,16354,94109)
                                            continue
                                        end
                                        Tb=L[-25119]or ra(20548,-25119,55006)
                                    else
                                        I,ja,m=Vb
                                        if Ma(I)~='function'then
                                            Tb=L[9906]or ra(13393,9906,43534)
                                            continue
                                        end
                                        Tb=L[6756]or ra(16316,6756,52352)
                                    end
                                elseif Tb<=59573 then
                                    if Tb<59463 then
                                        Ua+=Xb[9383];
                                        Tb=L[15206]or ra(23723,15206,49455)
                                    elseif Tb>59463 then
                                        ec(G,1,I,Ec+3,ea);
                                        ea[Ec+2]=ea[Ec+3];
                                        Ua+=Xb[9383];
                                        Tb=L[-21718]or ra(50431,-21718,31099)
                                    else
                                        G[2]=G[3][G[1]];
                                        G[3]=G;
                                        G[1]=2;
                                        Vb[Db],Tb=nil,L[8371]or ra(46440,8371,21240)
                                    end
                                else
                                    Db={ja(ea[Ec+1],ea[Ec+2])};
                                    ec(Db,1,I,Ec+3,ea)
                                    if ea[Ec+3]~=nil then
                                        Tb=L[30369]or ra(45772,30369,45961)
                                        continue
                                    else
                                        Tb=L[20074]or ra(38230,20074,49989)
                                        continue
                                    end
                                    Tb=L[-6473]or ra(53795,-6473,21687)
                                end
                            elseif Tb<63858 then
                                if Tb<=63008 then
                                    if Tb>62682 then
                                        Ec,Tb,I=Ga[Ua],39917,nil
                                    elseif Tb<=62421 then
                                        ea[Xb[54477]]=Xb[30272]==1;
                                        Ua+=Xb[5694];
                                        Tb=L[-19478]or ra(21464,-19478,54362)
                                    else
                                        Hb=false;
                                        Ua+=1
                                        if Da>115 then
                                            Tb=L[-2648]or ra(11784,-2648,93961)
                                            continue
                                        else
                                            Tb=L[-102]or ra(42495,-102,60260)
                                            continue
                                        end
                                        Tb=L[-5868]or ra(51028,-5868,31214)
                                    end
                                elseif Tb<=63493 then
                                    if(Mb>=0 and rc>sc)or((Mb<0 or Mb~=Mb)and rc<sc)then
                                        Tb=L[21685]or ra(36628,21685,68578)
                                    else
                                        Tb=L[-9008]or ra(14543,-9008,65423)
                                    end
                                else
                                    rc=rc+Mb;
                                    Kb=rc
                                    if rc~=rc then
                                        Tb=L[-25304]or ra(38411,-25304,2191)
                                    else
                                        Tb=33590
                                    end
                                end
                            elseif Tb>=64706 then
                                if Tb<=64953 then
                                    if Tb>64706 then
                                        if Xb[5694]==117 then
                                            Tb=L[-19296]or ra(2704,-19296,49003)
                                            continue
                                        elseif Xb[5694]==143 then
                                            Tb=L[19536]or ra(15307,19536,91865)
                                            continue
                                        elseif Xb[5694]==146 then
                                            Tb=L[23931]or ra(62695,23931,57867)
                                            continue
                                        else
                                            Tb=L[-11711]or ra(49029,-11711,54801)
                                            continue
                                        end
                                        Tb=L[31973]or ra(16537,31973,50461)
                                    else
                                        Tb,ja[rc]=L[-548]or ra(3894,-548,52880),d_[sc[54477]+1]
                                    end
                                else
                                    ec(G,1,rc,Ec,ea);
                                    Tb=L[-4219]or ra(38612,-4219,3950)
                                end
                            elseif Tb>=63930 then
                                if Tb>63930 then
                                    tb=sc
                                    if Mb~=Mb then
                                        Tb=L[27700]or ra(38204,27700,24086)
                                    else
                                        Tb=L[-18395]or ra(52210,-18395,57683)
                                    end
                                else
                                    sc=sc+Kb;
                                    tb=sc
                                    if sc~=sc then
                                        Tb=L[31015]or ra(2850,31015,49156)
                                    else
                                        Tb=40868
                                    end
                                end
                            else
                                Tb=L[2613]or ra(48617,2613,33478)
                                continue
                            end
                        elseif Tb<=52574 then
                            if Tb>50324 then
                                if Tb>=51839 then
                                    if Tb<52333 then
                                        if Da>232 then
                                            Tb=L[22159]or ra(58614,22159,58101)
                                            continue
                                        else
                                            Tb=L[16936]or ra(31224,16936,99593)
                                            continue
                                        end
                                        Tb=L[1835]or ra(52813,1835,28873)
                                    elseif Tb>52333 then
                                        tb=sc
                                        if Mb~=Mb then
                                            Tb=L[-23380]or ra(37840,-23380,33504)
                                        else
                                            Tb=L[29906]or ra(10365,29906,86705)
                                        end
                                    else
                                        Ec=d_[Xb[54477]+1];
                                        Tb,ea[Xb[30272]]=L[-4616]or ra(53380,-4616,21790),Ec[3][Ec[1]]
                                    end
                                elseif Tb>50347 then
                                    Tb,sc=L[13689]or ra(44860,13689,59372),sc..ga(dc(N(G,Aa+1),N(rc,Aa%#rc+1)))
                                else
                                    if Xb[5694]==22 then
                                        Tb=L[15148]or ra(16293,15148,104334)
                                        continue
                                    elseif Xb[5694]==195 then
                                        Tb=L[32223]or ra(41884,32223,32353)
                                        continue
                                    elseif Xb[5694]==220 then
                                        Tb=L[-17815]or ra(31739,-17815,108093)
                                        continue
                                    else
                                        Tb=L[-21466]or ra(8635,-21466,54310)
                                        continue
                                    end
                                    Tb=L[-13896]or ra(48060,-13896,11334)
                                end
                            elseif Tb<=49804 then
                                if Tb<=49500 then
                                    if Tb<48717 then
                                        G=G+sc;
                                        Mb=G
                                        if G~=G then
                                            Tb=L[10434]or ra(14897,10434,103414)
                                        else
                                            Tb=14224
                                        end
                                    elseif Tb>48717 then
                                        Ua+=1;
                                        Tb=L[16563]or ra(64603,16563,25311)
                                    else
                                        Mb=Mb+tb;
                                        Aa=Mb
                                        if Mb~=Mb then
                                            Tb=L[-2396]or ra(26136,-2396,104757)
                                        else
                                            Tb=24241
                                        end
                                    end
                                else
                                    I,ja,m=Ec.__iter(I);
                                    Tb=L[-4771]or ra(6307,-4771,53611)
                                end
                            elseif Tb>50118 then
                                m,Tb=nil,44883
                            elseif Tb>49901 then
                                Ua+=1;
                                Tb=L[4861]or ra(1761,4861,49013)
                            else
                                rc=m
                                if Db~=Db then
                                    Tb=L[2481]or ra(30836,2481,60942)
                                else
                                    Tb=L[15570]or ra(53111,15570,71386)
                                end
                            end
                        elseif Tb>54298 then
                            if Tb<56650 then
                                if Tb<=55438 then
                                    if Da>41 then
                                        Tb=L[-7518]or ra(6775,-7518,59264)
                                        continue
                                    else
                                        Tb=L[-18587]or ra(21022,-18587,60144)
                                        continue
                                    end
                                    Tb=L[-31765]or ra(2126,-31765,48840)
                                else
                                    Ua+=1;
                                    Tb=L[-29173]or ra(58210,-29173,26100)
                                end
                            elseif Tb<=56650 then
                                I,Tb=Db,L[26383]or ra(19424,26383,64872)
                                continue
                            else
                                Ua-=1;
                                Ga[Ua],Tb={[52854]=57,[30272]=dc(Xb[30272],154),[54477]=dc(Xb[54477],139),[5694]=0},L[774]or ra(45247,774,13627)
                            end
                        elseif Tb>53941 then
                            if Tb>53985 then
                                Ua+=1;
                                Tb=L[-7864]or ra(65217,-7864,26453)
                            else
                                Ua-=1;
                                Tb,Ga[Ua]=L[-1151]or ra(40827,-1151,511),{[52854]=193,[30272]=dc(Xb[30272],245),[54477]=dc(Xb[54477],93),[5694]=0}
                            end
                        elseif Tb>=53647 then
                            if Tb<=53647 then
                                Zb[Xb[28616]]=ea[Xb[54477]];
                                Ua+=1;
                                Tb=L[2953]or ra(4005,2953,45105)
                            else
                                Ua-=1;
                                Tb,Ga[Ua]=L[-28640]or ra(30189,-28640,60009),{[52854]=254,[30272]=dc(Xb[30272],206),[54477]=dc(Xb[54477],250),[5694]=0}
                            end
                        elseif Tb<=52736 then
                            I[24452],Tb=m,L[13427]or ra(63741,13427,60935)
                        else
                            Ec,I=Xb[30272],Xb[54477]-1
                            if I==-1 then
                                Tb=L[-28721]or ra(61909,-28721,43251)
                                continue
                            end
                            Tb=L[25501]or ra(60632,25501,43420)
                        end
                    elseif Tb>=39750 then
                        if Tb>=43993 then
                            if Tb>=46324 then
                                if Tb>=47098 then
                                    if Tb<48018 then
                                        I,ja,m=Vb
                                        if Ma(I)~='function'then
                                            Tb=L[24944]or ra(37594,24944,346)
                                            continue
                                        end
                                        Tb=L[-7881]or ra(11044,-7881,50380)
                                    elseif Tb>48018 then
                                        if Da>193 then
                                            Tb=L[-14687]or ra(49149,-14687,43058)
                                            continue
                                        else
                                            Tb=L[-25164]or ra(33548,-25164,12113)
                                            continue
                                        end
                                        Tb=L[3418]or ra(48077,3418,11337)
                                    else
                                        if Da>50 then
                                            Tb=L[28908]or ra(31739,28908,88004)
                                            continue
                                        else
                                            Tb=L[-19593]or ra(62347,-19593,56019)
                                            continue
                                        end
                                        Tb=L[-20874]or ra(2892,-20874,48598)
                                    end
                                elseif Tb<46564 then
                                    if Da>191 then
                                        Tb=L[32416]or ra(26477,32416,121825)
                                        continue
                                    else
                                        Tb=L[31800]or ra(40436,31800,19058)
                                        continue
                                    end
                                    Tb=L[-20122]or ra(450,-20122,34388)
                                elseif Tb>46564 then
                                    Ec,I,ja=dc(Xb[30272],29),dc(Xb[5694],200),dc(Xb[54477],34);
                                    m,Db=I==0 and ka-Ec or I-1,ea[Ec];
                                    G,rc=U(Db(La(ea,Ec+1,Ec+m)))
                                    if ja==0 then
                                        Tb=L[-9137]or ra(19852,-9137,91276)
                                        continue
                                    else
                                        Tb=L[12375]or ra(17514,12375,81366)
                                        continue
                                    end
                                    Tb=L[28052]or ra(1285,28052,100484)
                                else
                                    if Da>224 then
                                        Tb=L[688]or ra(25587,688,93028)
                                        continue
                                    else
                                        Tb=L[2553]or ra(23624,2553,52008)
                                        continue
                                    end
                                    Tb=L[30366]or ra(31141,30366,60977)
                                end
                            elseif Tb>=45763 then
                                if Tb>45795 then
                                    if Da>182 then
                                        Tb=L[-1970]or ra(38576,-1970,49706)
                                        continue
                                    else
                                        Tb=L[18702]or ra(54998,18702,38094)
                                        continue
                                    end
                                    Tb=L[7267]or ra(42495,7267,23163)
                                elseif Tb>45763 then
                                    Kb=rc
                                    if sc~=sc then
                                        Tb=L[-13022]or ra(26903,-13022,127463)
                                    else
                                        Tb=63493
                                    end
                                else
                                    ec(ea,I,I+ja-1,Xb[42581],ea[Ec]);
                                    Ua+=1;
                                    Tb=L[-741]or ra(1174,-741,47392)
                                end
                            elseif Tb>=44883 then
                                if Tb>44883 then
                                    if(G>=0 and m>Db)or((G<0 or G~=G)and m<Db)then
                                        Tb=L[570]or ra(56588,570,17302)
                                    else
                                        Tb=L[-20855]or ra(37681,-20855,59541)
                                    end
                                else
                                    Db,G=I[24452],Xb[24452];
                                    G='\206]\23\231\"\208\170\219'..G;
                                    rc='';
                                    Tb,sc,Mb,Kb=52574,0,#Db-1,1
                                end
                            else
                                I,ja,m=Wa(I);
                                Tb=L[-15598]or ra(31487,-15598,69573)
                            end
                        elseif Tb>40974 then
                            if Tb<41725 then
                                if Tb>41252 then
                                    Ec,I=nil,ea[Xb[30272]];
                                    Ec=j(I)=='function'
                                    if not Ec then
                                        Tb=L[32392]or ra(58322,32392,25587)
                                        continue
                                    end
                                    Tb=L[-26011]or ra(16601,-26011,70466)
                                else
                                    ea[Xb[30272]],Tb=ja[Xb[24452]],L[21985]or ra(32966,21985,52737)
                                end
                            elseif Tb>41934 then
                                Tb,ka,Ua,Vb,J,Hb=3191,-1,1,qb({},{__mode='vs'}),qb({},{__mode='ks'}),false
                            elseif Tb<=41725 then
                                ka,Tb=Ec+rc-1,L[2528]or ra(349,2528,103628)
                            else
                                G,rc=I[42003],Xb[42003];
                                rc='\206]\23\231\"\208\170\219'..rc;
                                sc='';
                                Tb,Kb,tb,Mb=L[-27909]or ra(11338,-27909,70217),#G-1,1,0
                            end
                        elseif Tb<=40567 then
                            if Tb<=40255 then
                                if Tb<=39917 then
                                    if Tb>39750 then
                                        ja,m=Ec[28616],Xb[28616];
                                        m='\206]\23\231\"\208\170\219'..m;
                                        Db='';
                                        G,Tb,rc,sc=0,4201,#ja-1,1
                                    else
                                        Kb={[2]=ea[sc[54477]],[1]=2};
                                        Kb[3]=Kb;
                                        Tb,ja[rc]=L[1739]or ra(18206,1739,71016),Kb
                                    end
                                else
                                    Kb=rc
                                    if sc~=sc then
                                        Tb=L[-28145]or ra(49248,-28145,18162)
                                    else
                                        Tb=L[3119]or ra(44849,3119,55810)
                                    end
                                end
                            else
                                Ec,I=Xb[30272],Xb[54477];
                                ja=I-1
                                if ja==-1 then
                                    Tb=L[26793]or ra(51519,26793,26983)
                                    continue
                                else
                                    Tb=L[3784]or ra(31603,3784,77826)
                                    continue
                                end
                                Tb=39233
                            end
                        elseif Tb>40868 then
                            Ua+=1;
                            Tb=L[-10327]or ra(33783,-10327,1411)
                        else
                            if(Kb>=0 and sc>Mb)or((Kb<0 or Kb~=Kb)and sc<Mb)then
                                Tb=L[26321]or ra(19635,26321,66967)
                            else
                                Tb=21479
                            end
                        end
                    elseif Tb<=36262 then
                        if Tb<=34618 then
                            if Tb<33910 then
                                if Tb>33625 then
                                    if Da>251 then
                                        Tb=L[29942]or ra(33597,29942,17123)
                                        continue
                                    else
                                        Tb=L[-14227]or ra(47139,-14227,25820)
                                        continue
                                    end
                                    Tb=L[-11443]or ra(8102,-11443,32816)
                                elseif Tb<=33590 then
                                    if(Mb>=0 and rc>sc)or((Mb<0 or Mb~=Mb)and rc<sc)then
                                        Tb=L[-15321]or ra(46906,-15321,10684)
                                    else
                                        Tb=17590
                                    end
                                else
                                    Tb,ea[Xb[30272]]=L[12666]or ra(36051,12666,12647),Xb[28616]
                                end
                            elseif Tb>=34104 then
                                if Tb>34104 then
                                    Tb,I[42003]=L[-14402]or ra(41820,-14402,42340),Db
                                else
                                    ea[Ec+2]=ea[Ec+3];
                                    Ua+=Xb[9383];
                                    Tb=L[13565]or ra(56144,13565,19938)
                                end
                            elseif Tb>33910 then
                                Ec,I,ja=Xb[5694],Xb[54477],Xb[28616];
                                m=ea[I];
                                ea[Ec+1]=m;
                                ea[Ec]=m[ja];
                                Ua+=1;
                                Tb=L[1668]or ra(52358,1668,28944)
                            else
                                I,ja,m=J
                                if Ma(I)~='function'then
                                    Tb=L[20038]or ra(31058,20038,87430)
                                    continue
                                end
                                Tb=L[-24308]or ra(12685,-24308,64077)
                            end
                        elseif Tb<=35700 then
                            if Tb>=35552 then
                                if Tb<=35552 then
                                    Tb,Db=34618,sc
                                    continue
                                else
                                    Ua+=Xb[9383];
                                    Tb=L[-5378]or ra(3497,-5378,45613)
                                end
                            else
                                Db,G=Lb(J[Xb],ja,ea[Ec+1],ea[Ec+2])
                                if not Db then
                                    Tb=L[-26645]or ra(53284,-26645,34915)
                                    continue
                                end
                                Tb=L[-10865]or ra(32734,-10865,84805)
                            end
                        elseif Tb>35829 then
                            rc=rc+Mb;
                            Kb=rc
                            if rc~=rc then
                                Tb=L[-8039]or ra(17862,-8039,122260)
                            else
                                Tb=L[-6679]or ra(38652,-6679,58612)
                            end
                        else
                            Xb[52854]=115;
                            Ua+=1;
                            Tb=L[-22407]or ra(134,-22407,34064)
                        end
                    elseif Tb<38645 then
                        if Tb<=37772 then
                            if Tb<=37055 then
                                if Tb>37037 then
                                    if(Kb>=0 and sc>Mb)or((Kb<0 or Kb~=Kb)and sc<Mb)then
                                        Tb=L[19682]or ra(51394,19682,60370)
                                    else
                                        Tb=L[7915]or ra(51796,7915,48189)
                                    end
                                else
                                    Tb,m=979,nil
                                end
                            else
                                if Da>57 then
                                    Tb=L[1832]or ra(15864,1832,98484)
                                    continue
                                else
                                    Tb=L[10604]or ra(37949,10604,26806)
                                    continue
                                end
                                Tb=L[-18502]or ra(17691,-18502,64415)
                            end
                        elseif Tb<=37855 then
                            Ua-=1;
                            Ga[Ua],Tb={[52854]=36,[30272]=dc(Xb[30272],179),[54477]=dc(Xb[54477],150),[5694]=0},L[-18797]or ra(21978,-18797,51804)
                        else
                            Ec,I=Xb[22949],Xb[28616];
                            ja=Zb[I]or Ob[59889][I]
                            if Ec==1 then
                                Tb=L[5791]or ra(28840,5791,86224)
                                continue
                            elseif Ec==2 then
                                Tb=L[4255]or ra(5506,4255,81251)
                                continue
                            elseif Ec==3 then
                                Tb=L[24337]or ra(36677,24337,19864)
                                continue
                            end
                            Tb=50118
                        end
                    elseif Tb<=38754 then
                        if Tb<38729 then
                            if Tb<=38645 then
                                Tb,m=52736,rc
                                continue
                            else
                                G[Kb],Tb=d_[tb[54477]+1],L[23340]or ra(14757,23340,112993)
                            end
                        elseif Tb<=38729 then
                            Ua+=Xb[9383];
                            Tb=L[-16552]or ra(14670,-16552,45000)
                        else
                            if Xb[5694]==104 then
                                Tb=L[23369]or ra(55820,23369,25032)
                                continue
                            else
                                Tb=L[5516]or ra(10375,5516,66572)
                                continue
                            end
                            Tb=L[-30824]or ra(36266,-30824,12844)
                        end
                    elseif Tb>38821 then
                        return La(ea,Ec,Ec+m-1)
                    else
                        if G[1]>=Xb[30272]then
                            Tb=L[-4416]or ra(29586,-4416,78087)
                            continue
                        end
                        Tb=L[4859]or ra(12150,4859,64586)
                    end
                elseif Tb>16679 then
                    if Tb>24292 then
                        if Tb<29217 then
                            if Tb>26329 then
                                if Tb>=27285 then
                                    if Tb>=28294 then
                                        if Tb<=28294 then
                                            if Xb[5694]==135 then
                                                Tb=L[-14692]or ra(5338,-14692,35425)
                                                continue
                                            elseif Xb[5694]==208 then
                                                Tb=L[-29118]or ra(37189,-29118,17944)
                                                continue
                                            else
                                                Tb=L[-20027]or ra(1324,-20027,97212)
                                                continue
                                            end
                                            Tb=L[-11161]or ra(8421,-11161,42353)
                                        else
                                            if not ea[Xb[30272]]then
                                                Tb=L[1794]or ra(55800,1794,50348)
                                                continue
                                            end
                                            Tb=L[-17496]or ra(15566,-17496,41288)
                                        end
                                    else
                                        if Da>32 then
                                            Tb=L[28920]or ra(55768,28920,75189)
                                            continue
                                        else
                                            Tb=L[12302]or ra(51196,12302,16766)
                                            continue
                                        end
                                        Tb=L[-5521]or ra(32439,-5521,59203)
                                    end
                                elseif Tb>26931 then
                                    ea[Xb[30272]],Tb=ja,L[7605]or ra(3506,7605,97269)
                                else
                                    if Da>150 then
                                        Tb=L[21256]or ra(12958,21256,67429)
                                        continue
                                    else
                                        Tb=L[-18837]or ra(41855,-18837,8538)
                                        continue
                                    end
                                    Tb=L[18763]or ra(44193,18763,20789)
                                end
                            elseif Tb<=25924 then
                                if Tb>=25134 then
                                    if Tb<=25134 then
                                        if Da>61 then
                                            Tb=L[-840]or ra(63206,-840,37658)
                                            continue
                                        else
                                            Tb=L[-2543]or ra(35954,-2543,17063)
                                            continue
                                        end
                                        Tb=L[16055]or ra(51024,16055,31202)
                                    else
                                        Ec,I,ja=Xb[5694],Xb[54477],Xb[30272]-1
                                        if ja==-1 then
                                            Tb=L[16337]or ra(38887,16337,40039)
                                            continue
                                        end
                                        Tb=L[9878]or ra(49700,9878,73066)
                                    end
                                elseif Tb>24662 then
                                    if G==-2 then
                                        Tb=L[-12144]or ra(815,-12144,59848)
                                        continue
                                    else
                                        Tb=L[17307]or ra(42174,17307,66822)
                                        continue
                                    end
                                    Tb=L[15162]or ra(17194,15162,50604)
                                else
                                    J[Xb]=nil;
                                    Ua+=1;
                                    Tb=L[-14220]or ra(1349,-14220,48081)
                                end
                            elseif Tb>25986 then
                                Ec=uc(I)
                                if Ec~=nil and Ec.__iter~=nil then
                                    Tb=L[23667]or ra(32200,23667,111665)
                                    continue
                                elseif Ma(I)=='table'then
                                    Tb=L[-14241]or ra(2949,-14241,70697)
                                    continue
                                end
                                Tb=L[-2846]or ra(8909,-2846,59533)
                            else
                                Tb,ea[Xb[30272]]=L[11927]or ra(36578,11927,14196),ea[Xb[54477]]
                            end
                        elseif Tb>=29943 then
                            if Tb>=32150 then
                                if Tb<32557 then
                                    Ec=Xb[14080]
                                    if(ea[Xb[30272]]==nil)~=Ec then
                                        Tb=L[2897]or ra(45634,2897,69723)
                                        continue
                                    else
                                        Tb=L[-28888]or ra(13372,-28888,62887)
                                        continue
                                    end
                                    Tb=L[-27087]or ra(22291,-27087,51623)
                                elseif Tb>32557 then
                                    Tb,ja=L[-14143]or ra(3934,-14143,84884),ka-I+1
                                else
                                    Ua+=Xb[9383];
                                    Tb=L[11055]or ra(47896,11055,11674)
                                end
                            elseif Tb>=30770 then
                                if Tb<=30770 then
                                    if Da>160 then
                                        Tb=L[-11182]or ra(37600,-11182,72244)
                                        continue
                                    else
                                        Tb=L[20944]or ra(36493,20944,35309)
                                        continue
                                    end
                                    Tb=L[10726]or ra(2384,10726,49122)
                                else
                                    Ec=Xb[28616];
                                    ea[Xb[5694]]=Zb[Ec]or Ob[59889][Ec];
                                    Ua+=1;
                                    Tb=L[-32427]or ra(61629,-32427,30009)
                                end
                            else
                                Ec,I=nil,dc(Xb[37295],61054);
                                Ec=if I<32768 then I else I-65536;
                                ja=Ec;
                                Tb,ea[dc(Xb[30272],11)]=L[-29247]or ra(41503,-29247,9371),ja
                            end
                        elseif Tb<=29540 then
                            if Tb<=29339 then
                                if Tb<=29217 then
                                    Ec,I=Xb[30272],Xb[28616];
                                    ka=Ec+6;
                                    ja,m=ea[Ec],nil;
                                    m=j(ja)=='function'
                                    if m then
                                        Tb=L[-24246]or ra(34017,-24246,72189)
                                        continue
                                    else
                                        Tb=L[32556]or ra(8769,32556,73808)
                                        continue
                                    end
                                    Tb=L[1203]or ra(59366,1203,39024)
                                else
                                    if ea[Xb[30272]]==ea[Xb[42581]]then
                                        Tb=L[32536]or ra(27298,32536,90234)
                                        continue
                                    else
                                        Tb=L[23989]or ra(8040,23989,79187)
                                        continue
                                    end
                                    Tb=L[30433]or ra(44517,30433,21105)
                                end
                            else
                                Ec,I=nil,dc(Xb[37295],48322);
                                Ec=if I<32768 then I else I-65536;
                                ja=Ec;
                                m=cb[ja+1];
                                Db=m[59406];
                                G=H(Db);
                                ea[dc(Xb[30272],97)]=Gb(m,G);
                                Tb,sc,rc,Mb=40255,Db,1,1
                            end
                        elseif Tb>29635 then
                            I,ja,m=Wa(I);
                            Tb=L[-27226]or ra(49549,-27226,35405)
                        else
                            Ec=Xb[28616];
                            ea[Xb[5694]][Ec]=ea[Xb[54477]];
                            Ua+=1;
                            Tb=L[-17361]or ra(13780,-17361,43630)
                        end
                    elseif Tb>19492 then
                        if Tb>22635 then
                            if Tb>=24235 then
                                if Tb>=24241 then
                                    if Tb<=24241 then
                                        if(tb>=0 and Mb>Kb)or((tb<0 or tb~=tb)and Mb<Kb)then
                                            Tb=L[-6327]or ra(53597,-6327,53360)
                                        else
                                            Tb=50865
                                        end
                                    else
                                        if Da>12 then
                                            Tb=L[-1875]or ra(19485,-1875,62105)
                                            continue
                                        else
                                            Tb=L[31747]or ra(59324,31747,46568)
                                            continue
                                        end
                                        Tb=L[8379]or ra(21019,8379,54431)
                                    end
                                else
                                    if Da>33 then
                                        Tb=L[1253]or ra(10768,1253,100491)
                                        continue
                                    else
                                        Tb=L[-6194]or ra(33660,-6194,3564)
                                        continue
                                    end
                                    Tb=L[-16666]or ra(34987,-16666,15663)
                                end
                            elseif Tb<=23260 then
                                I,ja,m=Wa(I);
                                Tb=L[-31880]or ra(56315,-31880,29837)
                            else
                                Ua-=1;
                                Tb,Ga[Ua]=L[-21622]or ra(64821,-21622,25537),{[52854]=125,[30272]=dc(Xb[30272],25),[54477]=dc(Xb[54477],90),[5694]=0}
                            end
                        elseif Tb<21479 then
                            if Tb<20938 then
                                rc,Tb=ja-1,L[20341]or ra(38256,20341,71913)
                            elseif Tb<=20938 then
                                rb(G);
                                Tb=L[25673]or ra(61056,25673,64255)
                            else
                                I=db[44431];
                                ka,Tb=Ec+I-1,L[-1166]or ra(48792,-1166,32348)
                            end
                        elseif Tb<=22094 then
                            if Tb>21479 then
                                if Da>233 then
                                    Tb=L[17234]or ra(16665,17234,88567)
                                    continue
                                else
                                    Tb=L[5695]or ra(36886,5695,32223)
                                    continue
                                end
                                Tb=L[6784]or ra(58449,6784,39653)
                            else
                                Tb,rc=L[20888]or ra(62288,20888,82087),rc..ga(dc(N(Db,tb+1),N(G,tb%#G+1)))
                            end
                        else
                            I[28616]=ja
                            if Ec==2 then
                                Tb=L[-1867]or ra(54203,-1867,72730)
                                continue
                            elseif Ec==3 then
                                Tb=L[5883]or ra(10503,5883,86617)
                                continue
                            end
                            Tb=L[-10948]or ra(3015,-10948,81361)
                        end
                    elseif Tb>=18328 then
                        if Tb>18838 then
                            if Tb<=19442 then
                                Aa=Mb
                                if Kb~=Kb then
                                    Tb=L[-22826]or ra(19219,-22826,97854)
                                else
                                    Tb=L[-18841]or ra(11007,-18841,65861)
                                end
                            else
                                Tb,rc=L[-29581]or ra(20797,-29581,55289),rc..ga(dc(N(Db,tb+1),N(G,tb%#G+1)))
                            end
                        elseif Tb>18820 then
                            Ua+=1;
                            Tb=L[-23623]or ra(42503,-23623,22675)
                        elseif Tb>=18453 then
                            if Tb>18453 then
                                if Da>105 then
                                    Tb=L[-2051]or ra(61528,-2051,30426)
                                    continue
                                else
                                    Tb=L[-1760]or ra(40930,-1760,39555)
                                    continue
                                end
                                Tb=L[-2563]or ra(27621,-2563,72817)
                            else
                                Ec,Tb,I,ja=Xb[22949],L[-30907]or ra(4061,-30907,104474),Ga[Ua+1],nil
                            end
                        else
                            G[2]=G[3][G[1]];
                            G[3]=G;
                            G[1]=2;
                            Vb[Db],Tb=nil,L[-11923]or ra(56539,-11923,28057)
                        end
                    elseif Tb<=17547 then
                        if Tb>17493 then
                            if Da>166 then
                                Tb=L[25830]or ra(54385,25830,18630)
                                continue
                            else
                                Tb=L[7690]or ra(37273,7690,29017)
                                continue
                            end
                            Tb=L[-25542]or ra(59040,-25542,40754)
                        elseif Tb>=17037 then
                            if Tb<=17037 then
                                I,ja,m=Ec.__iter(I);
                                Tb=L[31997]or ra(4345,31997,48523)
                            else
                                x=tb[54477];
                                Wb=Vb[x]
                                if Wb==nil then
                                    Tb=L[12789]or ra(56442,12789,40177)
                                    continue
                                end
                                Tb=L[-15256]or ra(50851,-15256,32239)
                            end
                        else
                            m,Tb=I-1,L[-13699]or ra(54377,-13699,50471)
                        end
                    elseif Tb<=17590 then
                        tb=Ga[Ua];
                        Ua+=1;
                        Aa=tb[30272]
                        if Aa==0 then
                            Tb=L[29818]or ra(48769,29818,8879)
                            continue
                        elseif Aa==1 then
                            Tb=L[37]or ra(54164,37,40012)
                            continue
                        elseif Aa==2 then
                            Tb=L[23333]or ra(47410,23333,41996)
                            continue
                        end
                        Tb=L[-28789]or ra(56021,-28789,90001)
                    else
                        Ec=d_[Xb[54477]+1];
                        Tb,Ec[3][Ec[1]]=L[16646]or ra(20444,16646,61542),ea[Xb[30272]]
                    end
                elseif Tb>=9272 then
                    if Tb<=13625 then
                        if Tb<=12089 then
                            if Tb<=10545 then
                                if Tb<=9573 then
                                    if Tb<9362 then
                                        Ec,I,ja,m=Xb[28616],Xb[14080],ea[Xb[30272]],nil;
                                        m=j(ja)=='boolean'
                                        if(m and(ja==Ec))~=I then
                                            Tb=L[-15213]or ra(11381,-15213,86796)
                                            continue
                                        else
                                            Tb=L[-14080]or ra(58285,-14080,77644)
                                            continue
                                        end
                                        Tb=L[17913]or ra(31048,17913,61386)
                                    elseif Tb>9362 then
                                        Db,G=I(ja,m);
                                        m=Db
                                        if m==nil then
                                            Tb=L[9741]or ra(4544,9741,73299)
                                        else
                                            Tb=L[32183]or ra(9726,32183,100264)
                                        end
                                    else
                                        if Da>54 then
                                            Tb=L[405]or ra(55025,405,50590)
                                            continue
                                        else
                                            Tb=L[1819]or ra(20158,1819,67629)
                                            continue
                                        end
                                        Tb=L[28006]or ra(19262,28006,64952)
                                    end
                                else
                                    Db,G=I(ja,m);
                                    m=Db
                                    if m==nil then
                                        Tb=L[-12982]or ra(30368,-12982,61234)
                                    else
                                        Tb=L[-30305]or ra(34265,-30305,46891)
                                    end
                                end
                            elseif Tb>11807 then
                                Ua-=1;
                                Ga[Ua],Tb={[52854]=189,[30272]=dc(Xb[30272],132),[54477]=dc(Xb[54477],118),[5694]=0},L[-14896]or ra(22996,-14896,52846)
                            elseif Tb>11085 then
                                if Da>38 then
                                    Tb=L[15490]or ra(43239,15490,79377)
                                    continue
                                else
                                    Tb=L[17951]or ra(8045,17951,91275)
                                    continue
                                end
                                Tb=L[-32456]or ra(36022,-32456,12608)
                            else
                                I,ja,m=Ec.__iter(I);
                                Tb=L[-22324]or ra(19404,-22324,71824)
                            end
                        elseif Tb<12848 then
                            if Tb>12131 then
                                Ua-=1;
                                Tb,Ga[Ua]=L[7169]or ra(12800,7169,46226),{[52854]=166,[30272]=dc(Xb[30272],233),[54477]=dc(Xb[54477],20),[5694]=0}
                            else
                                I[24452]=m;
                                Db,Tb=nil,L[-16531]or ra(62883,-16531,70620)
                            end
                        elseif Tb<13194 then
                            Ua-=1;
                            Tb,Ga[Ua]=L[-28790]or ra(30908,-28790,60742),{[52854]=121,[30272]=dc(Xb[30272],49),[54477]=dc(Xb[54477],29),[5694]=0}
                        elseif Tb>13194 then
                            ec(db[26664],1,I,Ec,ea);
                            Tb=L[-22285]or ra(63146,-22285,28460)
                        else
                            if Da>53 then
                                Tb=L[-15013]or ra(34442,-15013,10063)
                                continue
                            else
                                Tb=L[2839]or ra(18037,2839,84637)
                                continue
                            end
                            Tb=L[-3543]or ra(18308,-3543,63518)
                        end
                    elseif Tb<=14713 then
                        if Tb<14281 then
                            if Tb<14224 then
                                Ua+=Xb[9383];
                                Tb=L[-2905]or ra(23794,-2905,49796)
                            elseif Tb<=14224 then
                                if(sc>=0 and G>rc)or((sc<0 or sc~=sc)and G<rc)then
                                    Tb=L[5450]or ra(31061,5450,122386)
                                else
                                    Tb=87
                                end
                            else
                                m=m+G;
                                rc=m
                                if m~=m then
                                    Tb=L[-9081]or ra(27621,-9081,72817)
                                else
                                    Tb=44960
                                end
                            end
                        elseif Tb>14512 then
                            Q(G);
                            Tb,J[Db]=L[609]or ra(58555,609,44403),nil
                        elseif Tb>14281 then
                            Tb,ea[Xb[30272]]=L[-26311]or ra(62978,-26311,77893),ja[Xb[24452]][Xb[42003]]
                        else
                            if Da>7 then
                                Tb=L[-1348]or ra(58194,-1348,64612)
                                continue
                            else
                                Tb=L[29359]or ra(22823,29359,91149)
                                continue
                            end
                            Tb=L[-10604]or ra(27588,-10604,72798)
                        end
                    elseif Tb<15576 then
                        if Tb>14970 then
                            Tb,G=L[-5163]or ra(34654,-5163,47273),G..ga(dc(N(m,Kb+1),N(Db,Kb%#Db+1)))
                        else
                            Wb={[1]=x,[3]=ea};
                            Tb,Vb[x]=L[2415]or ra(18599,2415,62443),Wb
                        end
                    elseif Tb<16443 then
                        if Da>56 then
                            Tb=L[31244]or ra(10521,31244,86144)
                            continue
                        else
                            Tb=L[-17280]or ra(13140,-17280,56779)
                            continue
                        end
                        Tb=L[-12888]or ra(62865,-12888,27173)
                    elseif Tb<=16443 then
                        Db,G=I(ja,m);
                        m=Db
                        if m==nil then
                            Tb=L[-7539]or ra(30869,-7539,129066)
                        else
                            Tb=L[-25349]or ra(14570,-25349,63598)
                        end
                    else
                        Tb,m=L[23680]or ra(53703,23680,27503),rc
                        continue
                    end
                elseif Tb<3127 then
                    if Tb>1508 then
                        if Tb<=2529 then
                            if Tb>=2094 then
                                if Tb>2094 then
                                    x={[2]=ea[tb[54477]],[1]=2};
                                    x[3]=x;
                                    G[Kb],Tb=x,L[2513]or ra(6752,2513,106274)
                                else
                                    Ua-=1;
                                    Ga[Ua],Tb={[52854]=56,[30272]=dc(Xb[30272],66),[54477]=dc(Xb[54477],236),[5694]=0},L[-3198]or ra(57232,-3198,16418)
                                end
                            else
                                if Da>123 then
                                    Tb=L[9429]or ra(12920,9429,81180)
                                    continue
                                else
                                    Tb=L[25638]or ra(62125,25638,88255)
                                    continue
                                end
                                Tb=L[16284]or ra(31064,16284,61402)
                            end
                        elseif Tb<=2922 then
                            Ua-=1;
                            Ga[Ua],Tb={[52854]=70,[30272]=dc(Xb[30272],164),[54477]=dc(Xb[54477],97),[5694]=0},L[-172]or ra(15513,-172,41245)
                        else
                            Ec[28616]=I;
                            Tb,Xb[52854]=L[30882]or ra(16067,30882,42839),14
                        end
                    elseif Tb>979 then
                        if Tb<=1165 then
                            if Da>14 then
                                Tb=L[4137]or ra(41162,4137,34602)
                                continue
                            else
                                Tb=L[32592]or ra(32462,32592,87527)
                                continue
                            end
                            Tb=L[28279]or ra(21531,28279,51871)
                        else
                            rb'';
                            Tb=L[-21204]or ra(62492,-21204,32911)
                        end
                    elseif Tb>895 then
                        Db,G=I[24452],Xb[24452];
                        G='\206]\23\231\"\208\170\219'..G;
                        rc='';
                        Tb,Mb,Kb,sc=L[-30260]or ra(16825,-30260,119016),#Db-1,1,0
                    elseif Tb<=789 then
                        if Tb>87 then
                            if Da>223 then
                                Tb=L[-6379]or ra(63256,-6379,57399)
                                continue
                            else
                                Tb=L[-13452]or ra(41670,-13452,62649)
                                continue
                            end
                            Tb=L[16806]or ra(36678,16806,12752)
                        else
                            Db,Tb=Db..ga(dc(N(ja,Mb+1),N(m,Mb%#m+1))),L[19144]or ra(584,19144,87092)
                        end
                    else
                        ea[Xb[30272]]=H(Xb[42581]);
                        Ua+=1;
                        Tb=L[29041]or ra(46634,29041,10412)
                    end
                elseif Tb>=5749 then
                    if Tb>=7824 then
                        if Tb>=8401 then
                            if Tb>8401 then
                                if Xb[5694]==175 then
                                    Tb=L[-31646]or ra(13251,-31646,51551)
                                    continue
                                else
                                    Tb=L[-23700]or ra(13159,-23700,92774)
                                    continue
                                end
                                Tb=L[29136]or ra(12153,29136,53757)
                            else
                                if Da>106 then
                                    Tb=L[-31869]or ra(36338,-31869,60968)
                                    continue
                                else
                                    Tb=L[-21414]or ra(33805,-21414,17796)
                                    continue
                                end
                                Tb=L[-29854]or ra(53159,-29854,28723)
                            end
                        else
                            ea[Xb[30272]],Tb=nil,L[-10188]or ra(63188,-10188,28526)
                        end
                    elseif Tb>6147 then
                        m,Tb=ka-Ec+1,L[-23491]or ra(3786,-23491,74630)
                    elseif Tb>5749 then
                        Xb=Ga[Ua];
                        Da,Tb=Xb[52854],L[-4281]or ra(22615,-4281,108164)
                    else
                        Ec=uc(I)
                        if Ec~=nil and Ec.__iter~=nil then
                            Tb=L[-32428]or ra(45685,-32428,32503)
                            continue
                        elseif Ma(I)=='table'then
                            Tb=L[11430]or ra(16771,11430,77994)
                            continue
                        end
                        Tb=L[-21206]or ra(17806,-21206,57638)
                    end
                elseif Tb<3770 then
                    if Tb<=3154 then
                        if Tb<=3127 then
                            sc=sc+Kb;
                            tb=sc
                            if sc~=sc then
                                Tb=L[14675]or ra(24072,14675,97544)
                            else
                                Tb=L[-5809]or ra(12371,-5809,76447)
                            end
                        else
                            Ec=uc(I)
                            if Ec~=nil and Ec.__iter~=nil then
                                Tb=L[23999]or ra(26695,23999,81913)
                                continue
                            elseif Ma(I)=='table'then
                                Tb=L[-24792]or ra(42650,-24792,63678)
                                continue
                            end
                            Tb=L[18023]or ra(28567,18023,78701)
                        end
                    else
                        if not Hb then
                            Tb=L[2643]or ra(63732,2643,39674)
                            continue
                        end
                        Tb=62682
                    end
                elseif Tb>3775 then
                    Mb=G
                    if rc~=rc then
                        Tb=L[-32634]or ra(29114,-32634,107873)
                    else
                        Tb=14224
                    end
                elseif Tb<=3770 then
                    if Da>185 then
                        Tb=L[-22420]or ra(45818,-22420,68102)
                        continue
                    else
                        Tb=L[20123]or ra(65320,20123,80210)
                        continue
                    end
                    Tb=L[-3429]or ra(59183,-3429,39339)
                else
                    Tb,G[Kb]=L[346]or ra(14026,346,113276),Wb
                end
            end
        end
        return function(...)
            local _b,za,qc,s_,Ub,a_,C,Ja,Oa,mc,Ea;
            qc,Oa=function(sa,wb,b_)
                Oa[b_]=kc(wb,14004)-kc(sa,11282)
                return Oa[b_]
            end,{};
            _b=Oa[-32463]or qc(25177,67571,-32463)
            while _b~=32774 do
                if _b<=53908 then
                    if _b>=36656 then
                        if _b>=40117 then
                            if _b<=40117 then
                                return La(s_,2,Ja)
                            else
                                a_,_b=j(a_),Oa[-4708]or qc(38882,104886,-4708)
                            end
                        else
                            a_,za=s_[2],nil;
                            Ea=a_;
                            za=j(Ea)=='string'
                            if za==false then
                                _b=Oa[-8989]or qc(30628,71934,-8989)
                                continue
                            end
                            _b=62226
                        end
                    elseif _b<=14955 then
                        _b=Oa[16805]or qc(9289,48853,16805)
                        continue
                    else
                        s_,Ja=U(Ka(Pa,Ub,nb[22307],nb[52483],C))
                        if s_[1]then
                            _b=Oa[2501]or qc(46020,68159,2501)
                            continue
                        else
                            _b=Oa[10236]or qc(3541,34371,10236)
                            continue
                        end
                        _b=Oa[-10620]or qc(41120,61865,-10620)
                    end
                elseif _b>=62226 then
                    if _b<=62226 then
                        return rb(a_,0)
                    else
                        s_,Ja=nb[57745]+1,mc.n-nb[57745];
                        C[44431]=Ja;
                        ec(mc,s_,s_+Ja-1,1,C[26664]);
                        _b=Oa[-17405]or qc(8020,49057,-17405)
                    end
                else
                    mc,Ub,C=wc(...),H(nb[16002]),{[44431]=0,[26664]={}};
                    ec(mc,1,nb[57745],0,Ub)
                    if nb[57745]<mc.n then
                        _b=Oa[25249]or qc(16233,75316,25249)
                        continue
                    end
                    _b=Oa[26766]or qc(14169,18350,26766)
                end
            end
        end
    end
    return Gb(tc,w_)
end)
local yb;
yb,fa_={[0]=0},function()
    yb[0]=yb[0]+1
    return{[3]=yb,[1]=yb[0]}
end;
E=pc
return(function()
    return E(kb(Bc'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'),{})
end)()(...)
