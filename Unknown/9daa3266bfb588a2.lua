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

local t_,mb,y,G,Ea,Bc=bit32.bxor,type,pairs,getmetatable
local mc,K,jb,db,e_,_a,jc,Ha,Wb,ac,Y,Bb,F,Tb,bc,B,c,x,Pb,Xb,ha,ab,wa,d_,v,R,Ya,zb,W,O;
Xb=(select);
Y=(function(...)
    return{[1]={...},[2]=Xb('#',...)}
end);
zb=((function()
    local function Vb(qa,m,ec)
        if m>ec then
            return
        end
        return qa[m],Vb(qa,m+1,ec)
    end
    return Vb
end)());
jb,W=(string.gsub),(string.char);
Ya=(function(Yb)
    Yb=jb(Yb,'[^ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=]','')
    return(Yb:gsub('.',function(Gb)
        if(Gb=='=')then
            return''
        end
        local cb,ta='',(('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'):find(Gb)-1)
        for gc=6,1,-1 do
            cb=cb..(ta%2^gc-ta%2^(gc-1)>0 and'1'or'0')
        end
        return cb
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?',function(Q)
        if(#Q~=8)then
            return''
        end
        local Nb=0
        for Gc=1,8 do
            Nb=Nb+(Q:sub(Gc,Gc)=='1'and 2^(8-Gc)or 0)
        end
        return W(Nb)
    end))
end);
_a,ha,F,mc,B,Tb,v,d_=string.unpack,string.sub,string.byte,bit32 .lshift,bit32 .rshift,bit32 .band,table.concat,{};
c=(function(Z)
    local cc=d_[Z]
    if cc then
        return cc
    end
    local tc,r_,ua,Oa,fb=mc(1,11),mc(1,5),1,{},''
    while ua<=#Z do
        local Ia=F(Z,ua);
        ua=ua+1
        for zc=1,8 do
            local Jb=nil
            if Tb(Ia,1)~=0 then
                if ua<=#Z then
                    Jb=ha(Z,ua,ua);
                    ua=ua+1
                end
            else
                if ua+1<=#Z then
                    local wb=_a('>I2',Z,ua);
                    ua=ua+2
                    local l_,Cc=#fb-B(wb,5),Tb(wb,(r_-1))+3;
                    Jb=ha(fb,l_,l_+Cc-1)
                end
            end
            Ia=B(Ia,1)
            if Jb then
                Oa[#Oa+1]=Jb;
                fb=ha(fb..Jb,-tc)
            end
        end
    end
    local Ka=v(Oa);
    d_[Z]=Ka
    return Ka
end)
local U,rc,pc,xa,qb,C,Ua,Fa,Va,la,Db,kc,pa,za,nc,Da,Lb,ea,fc,tb,va,na,oc,Kb,Wa,sa,lb,D,lc,Ec=type,pcall,error,tonumber,assert,select,setmetatable,string.format,string.unpack,string.sub,string.byte,string.char,table.move,table.pack,table.create,table.insert,table.concat,coroutine.create,coroutine.yield,coroutine.resume,coroutine.close,getfenv,bit32 .bor,bit32 .bxor,bit32 .band,bit32 .btest,bit32 .rshift,bit32 .lshift,bit32 .extract,{[5473]={},[1235]={{7,9,false},{7,9,false},{7,3,true},{7,5,true},{8,0,true},{10,0,false},{10,9,false},{10,3,true},{9,2,true},{7,10,false},{9,3,true},{10,8,false},{10,7,true},{4,5,false},{10,9,true},{4,9,true},{4,2,true},{10,4,true},{4,10,true},{4,7,false},{8,5,false},{7,2,true},{10,9,false},{10,9,false},{8,2,false},{4,2,false},{9,0,false},{8,4,false},{10,9,false},{4,9,false},{8,4,false},{10,9,false},{10,9,false},{8,5,true},{7,9,false},{10,2,true},{7,2,true},{10,3,true},{10,9,false},{6,1,false},{10,8,false},{7,9,false},{10,9,false},{6,0,true},{8,1,false},{6,10,true},{7,7,false},{10,9,false},{6,3,false},{7,9,false},{6,9,false},{10,0,false},{4,2,true},{10,1,false},{4,2,false},{4,3,true},{8,4,true},{4,3,true},{9,0,false},{7,9,true},{9,10,false},{10,3,false},{10,5,false},{7,0,true},{10,7,true},{7,0,true},{6,1,true},{7,1,false},{10,2,true},{10,9,false},{10,3,true},{4,1,true},{8,9,false},{7,3,true},{10,9,false},{6,2,true},{10,7,true},{10,9,false},{9,10,false},{4,9,true},{7,9,false},{10,1,false},{10,10,true},{9,5,true},{7,9,true},{10,9,false},{7,2,false},{9,4,false},{10,9,false},{4,9,false},{8,9,false},{10,5,false},{6,7,false},{6,5,false},{8,3,true},{9,0,false},{4,10,true},{9,4,true},{10,5,false},{10,8,false},{8,0,true},{6,5,true},{10,1,true},{9,7,false},{7,10,false},{10,3,false},{8,9,true},{4,9,false},{7,9,true},{10,4,false},{10,9,false},{8,9,true},{7,9,true},{7,9,false},{10,7,false},{8,5,true},{7,0,true},{7,9,true},{4,0,true},{9,4,true},{10,9,false},{7,5,false},{8,4,false},{9,10,true},{8,1,false},{8,10,false},{6,1,false},{10,0,false},{4,5,true},{4,2,false},{8,7,false},{7,9,true},{7,1,true},{4,4,true},{10,9,false},{7,9,false},{7,4,true},{6,3,true},{7,4,false},{10,1,true},{6,5,true},{6,5,false},{6,5,false},{10,8,false},{8,3,false},{8,2,false},{10,0,true},{7,9,false},{6,7,true},{10,7,true},{9,1,false},{7,3,false},{8,1,false},{7,0,true},{10,7,false},{7,9,false},{9,10,false},{4,0,true},{4,10,true},{10,7,false},{7,0,true},{9,0,true},{10,9,false},{7,9,false},{10,9,false},{6,2,false},{6,9,true},{10,9,true},{7,2,true},{4,4,true},{4,10,true},{10,8,false},{9,2,false},{9,7,true},{4,3,true},{10,10,false},{4,3,true},{7,4,false},{4,4,true},{10,1,false},{10,9,false},{6,4,false},{8,6,false},{10,9,false},{6,5,true},{8,3,true},{9,9,true},{10,9,true},{10,3,true},{7,3,true},{10,4,true},{10,9,false},{10,7,true},{6,7,true},{10,9,false},{7,3,true},{10,3,false},{4,3,true},{6,0,true},{10,1,false},{7,0,false},{6,3,false},{10,5,true},{6,1,false},{7,2,false},{8,9,false},{6,9,false},{10,9,false},{10,10,false},{8,0,false},{7,10,false},{9,1,true},{6,0,false},{7,10,false},{8,5,true},{10,9,false},{7,9,false},{8,4,false},{6,4,true},{9,5,false},{10,7,true},{8,4,false},{9,2,false},{7,10,false},{10,3,false},{10,9,false},{9,9,false},{10,9,false},{9,4,false},{7,1,false},{10,0,false},{7,9,true},{8,4,false},{6,0,true},{9,0,false},{8,0,true},{10,9,true},{10,9,false},{6,3,true},{8,1,false},{4,10,true},{10,7,true},{8,9,false},{10,9,true},{7,9,true},{7,4,true},{10,7,true},{10,1,true},{4,4,true},{10,9,false},{6,7,true},{10,9,false},{8,3,false},{4,5,true},{10,1,false},{10,9,false}},[62470]={}}
local Pa=(function(w_)
    local N=Ec[5473][w_]
    if N then
        return N
    end
    local bb=1
    local function rb()
        local Xa,gb,S,ia,ca,h,Rb,dc,sc,hc,xb,_b,Ra,ma,uc,Sa,oa,aa,b_,Ba,M,ob,Ja,J,Eb,Fc,ba,ub,vc,ka,yb,j;
        ub,gb=function(Qb,Ga,sb)
            gb[sb]=t_(Qb,26828)-t_(Ga,47883)
            return gb[sb]
        end,{};
        sc=gb[26514]or ub(90576,2405,26514)
        repeat
            if sc>=34190 then
                if sc>51471 then
                    if sc>58844 then
                        if sc>=62341 then
                            if sc<=64121 then
                                if sc>63552 then
                                    if sc<=63589 then
                                        Sa,sc=Y(nil),43428
                                    else
                                        ca=0;
                                        S,yb,sc,h=0,4,41694,1
                                    end
                                elseif sc>=62545 then
                                    if sc>62545 then
                                        _b=0;
                                        sc,Ra,dc,J=12628,1,0,4
                                    else
                                        J=Va('<I4',w_,bb);
                                        bb,sc=bb+4,gb[-13133]or ub(130404,6141,-13133)
                                    end
                                else
                                    if xb then
                                        sc=gb[-18614]or ub(57461,47715,-18614)
                                        continue
                                    end
                                    sc=gb[22343]or ub(93870,22485,22343)
                                end
                            elseif sc<=65169 then
                                if sc>64999 then
                                    sc,Eb=3623,nil
                                else
                                    xb,sc=Kb(_b,-1075841145),30877
                                    continue
                                end
                            else
                                sc,vc=gb[10820]or ub(59339,45464,10820),zb(Sa[1],1,Sa[2])
                            end
                        elseif sc<60970 then
                            if sc<59570 then
                                J=Va('c'.._b,w_,bb);
                                bb,sc=bb+_b,20284
                            elseif sc<=59570 then
                                dc,sc=Kb(J,919944234),gb[-10314]or ub(919,54066,-10314)
                                continue
                            else
                                oa=0;
                                ca,sc,ka,ob=1,17262,4,0
                            end
                        elseif sc<=62179 then
                            if sc>61205 then
                                sc,vc=22257,nil
                            elseif sc<=60970 then
                                Fc=Va('B',w_,bb);
                                bb,sc=bb+1,gb[10418]or ub(30924,47072,10418)
                            else
                                h=yb;
                                oa=oc(oa,D(Wa(h,127),S*7))
                                if not sa(h,128)then
                                    sc=gb[-1429]or ub(59358,59040,-1429)
                                    continue
                                end
                                sc=gb[18849]or ub(34084,11341,18849)
                            end
                        else
                            oa=Ba
                            if M~=M then
                                sc=gb[28671]or ub(122829,24506,28671)
                            else
                                sc=gb[14101]or ub(97495,29353,14101)
                            end
                        end
                    elseif sc<=54151 then
                        if sc>53062 then
                            if sc>=53840 then
                                if sc>53840 then
                                    sc,Ja=60001,nil
                                else
                                    sc,ma=23200,Kb(uc,-1075841145)
                                    continue
                                end
                            elseif sc<=53617 then
                                sc,Sa=gb[-10702]or ub(38028,59066,-10702),Y''
                                continue
                            else
                                Ja,sc=Kb(oa,-1075841145),51805
                                continue
                            end
                        elseif sc>52520 then
                            if sc>52880 then
                                vc=yb
                                if h~=h then
                                    sc=2503
                                else
                                    sc=18930
                                end
                            else
                                sc,Sa=gb[-2047]or ub(50186,8003,-2047),Y(nil)
                            end
                        elseif sc>52274 then
                            vc=h[36227];
                            Sa,xb=lb(vc,30),Wa(lb(vc,20),1023);
                            h[36845]=ob[xb+1];
                            h[32006]=Sa
                            if Sa==2 then
                                sc=gb[3763]or ub(79170,24395,3763)
                                continue
                            elseif Sa==3 then
                                sc=gb[31832]or ub(126182,3315,31832)
                                continue
                            end
                            sc=gb[-25308]or ub(46568,3277,-25308)
                        elseif sc<=51805 then
                            oa=Ja;
                            ob=nc(oa);
                            ca,S,ka,sc=oa,1,1,13163
                        else
                            _b,dc=Wa(lb(vc,10),1023),Wa(lb(vc,0),1023);
                            h[56304]=ob[_b+1];
                            h[1488],sc=ob[dc+1],gb[-15612]or ub(56033,14276,-15612)
                        end
                    elseif sc<57180 then
                        if sc<=56997 then
                            if sc>56796 then
                                if(Ra>=0 and dc>J)or((Ra<0 or Ra~=Ra)and dc<J)then
                                    sc=gb[27835]or ub(100219,19163,27835)
                                else
                                    sc=31031
                                end
                            else
                                sc,S[vc]=gb[26036]or ub(96462,21095,26036),rb()
                            end
                        else
                            ka=Va('B',w_,bb);
                            bb,sc=bb+1,18910
                        end
                    elseif sc<=58583 then
                        if sc<57731 then
                            ka=Ja
                            if oa~=oa then
                                sc=54151
                            else
                                sc=gb[-31565]or ub(79617,2220,-31565)
                            end
                        elseif sc<=57731 then
                            Ra=_b
                            if dc~=dc then
                                sc=gb[-1104]or ub(57629,61658,-1104)
                            else
                                sc=43591
                            end
                        else
                            _b[13654]=Wa(lb(yb,8),255);
                            dc=Wa(lb(yb,16),65535);
                            _b[9152]=dc;
                            J=nil;
                            J=if dc<32768 then dc else dc-65536;
                            _b[54930],sc=J,gb[-17527]or ub(85231,35733,-17527)
                        end
                    else
                        vc,sc=nil,gb[-28281]or ub(38503,49468,-28281)
                    end
                elseif sc<42261 then
                    if sc>36614 then
                        if sc<39440 then
                            if sc>=39123 then
                                if sc>39123 then
                                    sc,M=gb[15308]or ub(14188,36000,15308),ca
                                else
                                    ia,sc=Kb(ba,153),gb[9072]or ub(55430,12835,9072)
                                    continue
                                end
                            else
                                sc,hc=gb[-16303]or ub(41395,60762,-16303),Kb(b_,153)
                                continue
                            end
                        elseif sc>40599 then
                            Fc=S
                            if yb~=yb then
                                sc=gb[6419]or ub(88659,50975,6419)
                            else
                                sc=30981
                            end
                        elseif sc<=40591 then
                            if sc<=39440 then
                                Eb,sc=Kb(ia,153),35827
                                continue
                            else
                                sc,vc=gb[-1696]or ub(88883,5248,-1696),zb(Sa[1],1,Sa[2])
                            end
                        else
                            sc,h[36845]=gb[-3718]or ub(12987,36370,-3718),ob[h[56851]+1]
                        end
                    elseif sc<=34944 then
                        if sc>=34781 then
                            if sc>=34878 then
                                if sc<=34878 then
                                    ka=ka+S;
                                    yb=ka
                                    if ka~=ka then
                                        sc=gb[-18918]or ub(52817,9636,-18918)
                                    else
                                        sc=gb[23456]or ub(65051,56353,23456)
                                    end
                                else
                                    Sa,sc=xb,gb[-7570]or ub(99,55680,-7570)
                                    continue
                                end
                            else
                                Ba=Ba+Ja;
                                oa=Ba
                                if Ba~=Ba then
                                    sc=gb[29606]or ub(85681,61222,29606)
                                else
                                    sc=gb[2287]or ub(57118,54866,2287)
                                end
                            end
                        elseif sc<=34190 then
                            dc,sc=nil,gb[1388]or ub(97468,38852,1388)
                        else
                            dc,sc=nil,gb[13889]or ub(80521,59135,13889)
                        end
                    elseif sc<36473 then
                        if sc>35188 then
                            ia=Eb;
                            xb=oc(xb,D(Wa(ia,127),Ra*7))
                            if not sa(ia,128)then
                                sc=gb[12418]or ub(90058,32678,12418)
                                continue
                            end
                            sc=gb[-13166]or ub(55642,11258,-13166)
                        else
                            aa=Va('B',w_,bb);
                            sc,bb=48552,bb+1
                        end
                    elseif sc>36473 then
                        dc,J=Wa(lb(yb,8),16777215),nil;
                        J=if dc<8388608 then dc else dc-16777216;
                        sc,_b[56851]=gb[19334]or ub(110785,24451,19334),J
                    else
                        sc=gb[-12367]or ub(98943,22471,-12367)
                        continue
                    end
                elseif sc<45865 then
                    if sc>43591 then
                        if sc<44878 then
                            if(ob>=0 and Ja>oa)or((ob<0 or ob~=ob)and Ja<oa)then
                                sc=54151
                            else
                                sc=gb[-6390]or ub(4171,55584,-6390)
                            end
                        elseif sc>44878 then
                            S,sc=nil,17145
                        else
                            _b[13654]=Wa(lb(yb,8),255);
                            _b[45061]=Wa(lb(yb,16),255);
                            _b[42833],sc=Wa(lb(yb,24),255),gb[-10999]or ub(94126,43222,-10999)
                        end
                    elseif sc<=43233 then
                        if sc<42496 then
                            Rb,sc,ma=j,20565,nil
                        elseif sc<=42496 then
                            ca=ka;
                            S=nc(ca);
                            Fc,sc,yb,h=1,gb[3758]or ub(91745,33900,3758),1,ca
                        else
                            sc,S=gb[-11426]or ub(77843,8998,-11426),Kb(yb,919944234)
                            continue
                        end
                    elseif sc<=43428 then
                        xb=0;
                        J,sc,dc,_b=1,57731,4,0
                    else
                        if(J>=0 and _b>dc)or((J<0 or J~=J)and _b<dc)then
                            sc=gb[-25859]or ub(11948,45931,-25859)
                        else
                            sc=gb[-19246]or ub(96671,43465,-19246)
                        end
                    end
                elseif sc<48552 then
                    if sc<=46731 then
                        if sc>46625 then
                            ka,sc=Kb(ca,-1075841145),42496
                            continue
                        elseif sc<=45865 then
                            h[36845],sc=ob[h[36227]+1],gb[4164]or ub(65265,52180,4164)
                        else
                            b_=Va('B',w_,bb);
                            sc,bb=38319,bb+1
                        end
                    else
                        h=Ba[yb];
                        Fc=h[54145]
                        if Fc==6 then
                            sc=gb[-18759]or ub(126506,21316,-18759)
                            continue
                        elseif Fc==7 then
                            sc=gb[-11139]or ub(90385,60863,-11139)
                            continue
                        elseif Fc==10 then
                            sc=gb[26970]or ub(91635,28242,26970)
                            continue
                        elseif Fc==3 then
                            sc=gb[17531]or ub(78412,13907,17531)
                            continue
                        elseif Fc==2 then
                            sc=gb[5800]or ub(21545,33254,5800)
                            continue
                        elseif Fc==0 then
                            sc=gb[-2253]or ub(46423,49723,-2253)
                            continue
                        end
                        sc=gb[3137]or ub(48559,2830,3137)
                    end
                elseif sc>=49330 then
                    if sc<=49867 then
                        if sc>49330 then
                            S=S+h;
                            Fc=S
                            if S~=S then
                                sc=gb[-29644]or ub(128018,23896,-29644)
                            else
                                sc=gb[11073]or ub(37915,14553,11073)
                            end
                        else
                            yb=S;
                            h=Wa(yb,255);
                            Fc=Ec[1235][h+1];
                            vc,Sa,xb=Fc[1],Fc[2],Fc[3];
                            _b={[1488]=0,[13654]=0,[24496]=h,[45061]=0,[9152]=0,[3713]=nil,[42833]=0,[36227]=0,[5264]=0,[54145]=Sa,[56851]=0,[32006]=0,[56304]=0,[54930]=0,[36845]=0};
                            Da(Ba,_b)
                            if vc==8 then
                                sc=gb[6579]or ub(56642,40323,6579)
                                continue
                            elseif vc==10 then
                                sc=gb[-6510]or ub(80245,6496,-6510)
                                continue
                            elseif vc==7 then
                                sc=gb[1793]or ub(92316,41074,1793)
                                continue
                            end
                            sc=62341
                        end
                    else
                        Fc=h
                        if Fc==0 then
                            sc=gb[-27789]or ub(71782,6417,-27789)
                            continue
                        elseif Fc==1 then
                            sc=gb[-4823]or ub(66936,52804,-4823)
                            continue
                        elseif Fc==3 then
                            sc=gb[-20722]or ub(76611,16310,-20722)
                            continue
                        elseif Fc==5 then
                            sc=gb[-19662]or ub(37309,43166,-19662)
                            continue
                        end
                        sc=33908
                    end
                elseif sc>48552 then
                    Sa,sc=nil,gb[1192]or ub(42929,30920,1192)
                else
                    sc,Xa=27726,Kb(aa,153)
                    continue
                end
            elseif sc<=17145 then
                if sc>7370 then
                    if sc<=12205 then
                        if sc>=9878 then
                            if sc<=10229 then
                                if sc>10018 then
                                    Ja=Ja+ob;
                                    ka=Ja
                                    if Ja~=Ja then
                                        sc=gb[-27419]or ub(92135,32943,-27419)
                                    else
                                        sc=gb[26677]or ub(73865,10004,26677)
                                    end
                                elseif sc<=9878 then
                                    yb=yb+Fc;
                                    vc=yb
                                    if yb~=yb then
                                        sc=gb[-8549]or ub(58096,15230,-8549)
                                    else
                                        sc=gb[12335]or ub(34179,6230,12335)
                                    end
                                else
                                    ba=ia;
                                    _b=oc(_b,D(Wa(ba,127),Eb*7))
                                    if not sa(ba,128)then
                                        sc=gb[-12460]or ub(124665,17591,-12460)
                                        continue
                                    end
                                    sc=gb[-13287]or ub(80495,23154,-13287)
                                end
                            else
                                if(S>=0 and ka>ca)or((S<0 or S~=S)and ka<ca)then
                                    sc=gb[-16154]or ub(416,55925,-16154)
                                else
                                    sc=4815
                                end
                            end
                        elseif sc>=9566 then
                            if sc>9566 then
                                sc=gb[14523]or ub(73295,1267,14523)
                                continue
                            else
                                ka=ka+S;
                                yb=ka
                                if ka~=ka then
                                    sc=gb[-22505]or ub(41631,28989,-22505)
                                else
                                    sc=gb[-28606]or ub(85074,2036,-28606)
                                end
                            end
                        elseif sc>8357 then
                            sc,ob=57117,nil
                        else
                            _b=_b+J;
                            Ra=_b
                            if _b~=_b then
                                sc=gb[-9874]or ub(51033,51870,-9874)
                            else
                                sc=gb[12253]or ub(68687,311,12253)
                            end
                        end
                    elseif sc>=14310 then
                        if sc<16084 then
                            if sc>14310 then
                                Sa,sc=Y(Kb(xb,-1075841145)),65385
                                continue
                            else
                                h[36845],sc=ob[h[54930]+1],gb[28116]or ub(13594,33651,28116)
                            end
                        elseif sc<=16084 then
                            Sa=vc;
                            ca=oc(ca,D(Wa(Sa,127),Fc*7))
                            if not sa(Sa,128)then
                                sc=gb[7312]or ub(84702,18220,7312)
                                continue
                            end
                            sc=gb[921]or ub(48096,43882,921)
                        else
                            yb=Va('<I4',w_,bb);
                            sc,bb=43233,bb+4
                        end
                    elseif sc<12647 then
                        Eb=dc
                        if J~=J then
                            sc=gb[-1739]or ub(75863,63935,-1739)
                        else
                            sc=56997
                        end
                    elseif sc>12647 then
                        yb=ka
                        if ca~=ca then
                            sc=gb[-18776]or ub(38612,19745,-18776)
                        else
                            sc=12205
                        end
                    else
                        sc=gb[-4056]or ub(87799,55066,-4056)
                        continue
                    end
                elseif sc>=3002 then
                    if sc<=4815 then
                        if sc<=4179 then
                            if sc>3623 then
                                Sa,sc=Y(dc),gb[-32403]or ub(51649,47477,-32403)
                                continue
                            elseif sc>3002 then
                                ia=Va('B',w_,bb);
                                sc,bb=39440,bb+1
                            else
                                xb=Va('<d',w_,bb);
                                bb,sc=bb+8,gb[-27433]or ub(33312,55655,-27433)
                            end
                        elseif sc>4193 then
                            sc,h=60970,nil
                        else
                            yb=ka
                            if ca~=ca then
                                sc=gb[11086]or ub(49553,4683,11086)
                            else
                                sc=gb[-18420]or ub(54172,59578,-18420)
                            end
                        end
                    elseif sc>=6532 then
                        if sc>6532 then
                            h=Va('B',w_,bb);
                            sc,bb=34056,bb+1
                        else
                            sc,ca=gb[-31037]or ub(83352,12156,-31037),xb
                            continue
                        end
                    elseif sc>4968 then
                        if M then
                            sc=gb[-19576]or ub(89492,19180,-19576)
                            continue
                        else
                            sc=gb[-25188]or ub(66004,21271,-25188)
                            continue
                        end
                        sc=gb[-12807]or ub(43913,8283,-12807)
                    else
                        sc,yb=7370,nil
                    end
                elseif sc>1572 then
                    if sc<2174 then
                        sc,ka,ca,S=4193,1,uc,1
                    elseif sc<=2174 then
                        sc,xb=63552,nil
                    else
                        return{[29527]=b_,[52100]='',[39256]=Rb,[38025]=S,[23964]=aa,[61620]=Ba}
                    end
                elseif sc<789 then
                    if sc>29 then
                        h[36845]=lc(h[36227],0,1)==1;
                        h[5264],sc=lc(h[36227],31,1)==1,gb[23097]or ub(94920,20397,23097)
                    else
                        sc,ka=gb[-14591]or ub(112372,22708,-14591),nil
                    end
                elseif sc<=802 then
                    if sc>789 then
                        J=dc;
                        _b[36227]=J;
                        Da(Ba,{});
                        sc=gb[-24374]or ub(16420,46191,-24374)
                    else
                        h,sc=Kb(Fc,153),51471
                        continue
                    end
                else
                    vc,sc=Sa,gb[1436]or ub(83635,4352,1436)
                end
            elseif sc>=27726 then
                if sc>=30877 then
                    if sc>=33020 then
                        if sc>=34005 then
                            if sc>34005 then
                                sc,yb=gb[3085]or ub(77455,60453,3085),Kb(h,153)
                                continue
                            else
                                ka=ob;
                                uc=oc(uc,D(Wa(ka,127),oa*7))
                                if not sa(ka,128)then
                                    sc=gb[20878]or ub(49769,35866,20878)
                                    continue
                                end
                                sc=gb[9318]or ub(61851,43633,9318)
                            end
                        elseif sc>33020 then
                            sc,ob[yb]=gb[-11810]or ub(56243,36938,-11810),vc
                        else
                            sc,ca=gb[14456]or ub(81514,6261,14456),nil
                        end
                    elseif sc>=31031 then
                        if sc>31031 then
                            _b=Wa(lb(vc,10),1023);
                            h[56304],sc=ob[_b+1],gb[-29087]or ub(12194,39195,-29087)
                        else
                            sc,ia=gb[30629]or ub(36046,51975,30629),nil
                        end
                    elseif sc>30877 then
                        if(h>=0 and S>yb)or((h<0 or h~=h)and S<yb)then
                            sc=gb[9992]or ub(115168,18858,9992)
                        else
                            sc=gb[-22139]or ub(80944,55570,-22139)
                        end
                    else
                        _b=xb
                        if _b==0 then
                            sc=gb[-14523]or ub(72044,6948,-14523)
                            continue
                        else
                            sc=gb[-22683]or ub(70264,20013,-22683)
                            continue
                        end
                        sc=gb[15892]or ub(30733,45896,15892)
                    end
                elseif sc<29588 then
                    if sc>29273 then
                        b_,sc,Xa=hc,gb[31022]or ub(52392,41467,31022),nil
                    elseif sc>=28970 then
                        if sc<=28970 then
                            dc=dc+Ra;
                            Eb=dc
                            if dc~=dc then
                                sc=gb[28100]or ub(110932,24762,28100)
                            else
                                sc=gb[-25650]or ub(35609,48699,-25650)
                            end
                        else
                            sc=gb[20598]or ub(93302,32177,20598)
                            continue
                        end
                    else
                        sc,aa,j=29935,Xa,nil
                    end
                elseif sc<=29935 then
                    if sc<=29686 then
                        if sc<=29588 then
                            sc=gb[18954]or ub(123463,816,18954)
                            continue
                        else
                            ba=Va('B',w_,bb);
                            sc,bb=39123,bb+1
                        end
                    else
                        Rb=Va('B',w_,bb);
                        sc,bb=30851,bb+1
                    end
                else
                    sc,j=42261,Kb(Rb,153)
                    continue
                end
            elseif sc>=20952 then
                if sc<=22257 then
                    if sc<=22178 then
                        if sc>=21049 then
                            if sc>21049 then
                                ob=ob+ca;
                                S=ob
                                if ob~=ob then
                                    sc=gb[-9777]or ub(118329,28608,-9777)
                                else
                                    sc=20952
                                end
                            else
                                sc,vc=gb[-21075]or ub(37621,110,-21075),Kb(Sa,153)
                                continue
                            end
                        else
                            if(ca>=0 and ob>ka)or((ca<0 or ca~=ca)and ob<ka)then
                                sc=gb[-14099]or ub(93731,36814,-14099)
                            else
                                sc=4968
                            end
                        end
                    elseif sc<=22190 then
                        hc,sc=nil,gb[20866]or ub(37024,63808,20866)
                    else
                        Sa=Va('B',w_,bb);
                        sc,bb=21049,bb+1
                    end
                elseif sc<=25707 then
                    if sc<=23200 then
                        uc=ma;
                        Ba,M=nc(uc),false;
                        sc,oa,ob,Ja=57180,uc,1,1
                    else
                        sc,h[36845]=gb[-27434]or ub(48757,2640,-27434),lc(h[36227],0,16)
                    end
                else
                    if(S>=0 and ka>ca)or((S<0 or S~=S)and ka<ca)then
                        sc=gb[26680]or ub(11271,65445,26680)
                    else
                        sc=gb[-7722]or ub(80755,9046,-7722)
                    end
                end
            elseif sc>18930 then
                if sc<=20284 then
                    if sc<=19065 then
                        if(Ja>=0 and Ba>M)or((Ja<0 or Ja~=Ja)and Ba<M)then
                            sc=gb[-22927]or ub(36294,43441,-22927)
                        else
                            sc=9104
                        end
                    else
                        dc,sc=J,gb[-27964]or ub(44370,3648,-27964)
                        continue
                    end
                else
                    uc=0;
                    M,sc,Ba,Ja=4,gb[-28195]or ub(122092,31692,-28195),0,1
                end
            elseif sc>=18910 then
                if sc<=18910 then
                    sc,ob=34005,Kb(ka,153)
                    continue
                else
                    if(Fc>=0 and yb>h)or((Fc<0 or Fc~=Fc)and yb<h)then
                        sc=gb[-32522]or ub(6527,56551,-32522)
                    else
                        sc=gb[-30935]or ub(125247,7964,-30935)
                    end
                end
            elseif sc>17262 then
                M,sc=false,gb[20250]or ub(97334,22030,20250)
            else
                S=ob
                if ka~=ka then
                    sc=gb[4442]or ub(88052,54789,4442)
                else
                    sc=20952
                end
            end
        until sc==47074
    end
    local eb=rb();
    Ec[5473][w_]=eb
    return eb
end)
local n_=(function(z,La)
    z=Pa(z)
    local ya=na()
    local function H(Na,E)
        local Aa=(function(...)
            return{...},C('#',...)
        end)
        local ib;
        ib=(function(yc,qc,Qa)
            if qc>Qa then
                return
            end
            return yc[qc],ib(yc,qc+1,Qa)
        end)
        local function L(Cb,T,q,hb)
            local Fb,Za,Dc,xc,i_,s_,Ab,Sb,Ma,ic,da,kb,Ob,p,ra,f_,wc,k,Ca,pb,Zb,V,_c,fa_;
            Dc,fa_=function(ja,g,Hb)
                fa_[g]=t_(ja,18514)-t_(Hb,39249)
                return fa_[g]
            end,{};
            kb=fa_[-7696]or Dc(83748,-7696,27332)
            repeat
                if kb>33524 then
                    if kb>47293 then
                        if kb<=58537 then
                            if kb>=54491 then
                                if kb>=56907 then
                                    if kb<=58375 then
                                        if kb<=58115 then
                                            if kb<57111 then
                                                da[3]=da[1][da[2]];
                                                da[1]=da;
                                                da[2]=3;
                                                kb,_c[ic]=fa_[-21967]or Dc(89154,-21967,20186),nil
                                            elseif kb<=57111 then
                                                Cb[Ma[42833]]=nc(Ma[36227]);
                                                Ob+=1;
                                                kb=fa_[2162]or Dc(45289,2162,8875)
                                            else
                                                Ob+=Ma[54930];
                                                kb=fa_[-14986]or Dc(85667,-14986,21345)
                                            end
                                        else
                                            ic,da=tb(pb[Ma],f_,Cb[i_+1],Cb[i_+2])
                                            if not ic then
                                                kb=fa_[-20892]or Dc(56350,-20892,49676)
                                                continue
                                            end
                                            kb=60250
                                        end
                                    elseif kb<=58438 then
                                        i_,Fb=Ma[13654],Ma[45061]-1
                                        if Fb==-1 then
                                            kb=fa_[5793]or Dc(85848,5793,23675)
                                            continue
                                        end
                                        kb=4025
                                    else
                                        Sb=q[Ob];
                                        Ob+=1;
                                        V=Sb[13654]
                                        if V==0 then
                                            kb=fa_[-12569]or Dc(91690,-12569,56247)
                                            continue
                                        elseif V==1 then
                                            kb=fa_[27429]or Dc(3266,27429,46652)
                                            continue
                                        elseif V==2 then
                                            kb=fa_[3402]or Dc(57817,3402,4035)
                                            continue
                                        end
                                        kb=fa_[11084]or Dc(93572,11084,9096)
                                    end
                                elseif kb<=56273 then
                                    if kb<56095 then
                                        if kb>54491 then
                                            i_,Fb=nil,Kb(Ma[9152],61667);
                                            i_=if Fb<32768 then Fb else Fb-65536;
                                            f_=i_;
                                            kb,Cb[Kb(Ma[13654],114)]=fa_[-18669]or Dc(94217,-18669,25291),f_
                                        else
                                            Ob+=1;
                                            kb=fa_[-26142]or Dc(94086,-26142,29250)
                                        end
                                    elseif kb>56095 then
                                        Ma[24496]=106;
                                        Ob+=1;
                                        kb=fa_[-10379]or Dc(61306,-10379,62262)
                                    else
                                        k,ic=Fb[36845],Ma[36845];
                                        ic='0z\29'..ic;
                                        da='';
                                        Za,p,s_,kb=#k-1,0,1,fa_[-28589]or Dc(36218,-28589,6113)
                                    end
                                elseif kb<=56421 then
                                    pa(da,1,Fb,i_+3,Cb);
                                    Cb[i_+2]=Cb[i_+3];
                                    Ob+=Ma[54930];
                                    kb=fa_[31735]or Dc(47382,31735,11730)
                                else
                                    kb,f_[p]=fa_[20238]or Dc(79786,20238,32613),E[Za[45061]+1]
                                end
                            elseif kb<=52476 then
                                if kb>=50955 then
                                    if kb>51818 then
                                        k,kb=Fb-1,fa_[675]or Dc(43561,675,13545)
                                    elseif kb>50955 then
                                        i_,Fb,kb,f_=Ma[32006],q[Ob+1],56095,nil
                                    else
                                        f_,kb=da,fa_[1192]or Dc(52077,1192,39252)
                                        continue
                                    end
                                elseif kb<49679 then
                                    Ob+=1;
                                    kb=fa_[9016]or Dc(90276,9016,30052)
                                elseif kb>49679 then
                                    Fb,f_,k=i_.__iter(Fb);
                                    kb=fa_[-23179]or Dc(68184,-23179,55978)
                                else
                                    kb=fa_[16610]or Dc(46663,16610,43454)
                                    continue
                                end
                            elseif kb>53420 then
                                if kb>53853 then
                                    pc'';
                                    kb=fa_[1368]or Dc(59723,1368,58217)
                                else
                                    if Ma[42833]==35 then
                                        kb=fa_[-5264]or Dc(82060,-5264,15699)
                                        continue
                                    elseif Ma[42833]==126 then
                                        kb=fa_[-26117]or Dc(60504,-26117,7630)
                                        continue
                                    elseif Ma[42833]==155 then
                                        kb=fa_[-5691]or Dc(13191,-5691,51192)
                                        continue
                                    elseif Ma[42833]==176 then
                                        kb=fa_[8058]or Dc(35582,8058,45136)
                                        continue
                                    else
                                        kb=fa_[23510]or Dc(98633,23510,32132)
                                        continue
                                    end
                                    kb=fa_[7982]or Dc(49263,7982,53805)
                                end
                            elseif kb<=52854 then
                                if kb<=52792 then
                                    if ra>120 then
                                        kb=fa_[-15476]or Dc(47839,-15476,59492)
                                        continue
                                    else
                                        kb=fa_[6340]or Dc(91320,6340,30903)
                                        continue
                                    end
                                    kb=fa_[19791]or Dc(89039,19791,20365)
                                else
                                    Ab,kb=i_+p-1,fa_[-18204]or Dc(4547,-18204,48204)
                                end
                            else
                                if(Sb>=0 and s_>Zb)or((Sb<0 or Sb~=Sb)and s_<Zb)then
                                    kb=fa_[-17492]or Dc(34444,-17492,58101)
                                else
                                    kb=fa_[7633]or Dc(36707,7633,5167)
                                end
                            end
                        elseif kb>=62598 then
                            if kb>=63876 then
                                if kb>=64557 then
                                    if kb>=64716 then
                                        if kb<=64716 then
                                            if ra>192 then
                                                kb=fa_[-15229]or Dc(119432,-15229,31564)
                                                continue
                                            else
                                                kb=fa_[365]or Dc(59398,365,61853)
                                                continue
                                            end
                                            kb=fa_[-26408]or Dc(93477,-26408,29159)
                                        else
                                            ic,da=Fb(f_,k);
                                            k=ic
                                            if k==nil then
                                                kb=fa_[-2160]or Dc(58385,-2160,63187)
                                            else
                                                kb=23395
                                            end
                                        end
                                    else
                                        p=p+s_;
                                        Zb=p
                                        if p~=p then
                                            kb=fa_[8788]or Dc(33081,8788,39729)
                                        else
                                            kb=42026
                                        end
                                    end
                                elseif kb<=63899 then
                                    if kb>63876 then
                                        Sb=Za
                                        if s_~=s_ then
                                            kb=fa_[25437]or Dc(46392,25437,8546)
                                        else
                                            kb=44910
                                        end
                                    else
                                        Cb[Ma[45061]]=Ma[42833]==1;
                                        Ob+=Ma[13654];
                                        kb=fa_[38]or Dc(97177,38,28251)
                                    end
                                else
                                    i_=G(Fb)
                                    if i_~=nil and i_.__iter~=nil then
                                        kb=fa_[-28333]or Dc(79461,-28333,18184)
                                        continue
                                    elseif mb(Fb)=='table'then
                                        kb=fa_[-19149]or Dc(78447,-19149,16589)
                                        continue
                                    end
                                    kb=fa_[25570]or Dc(93184,25570,32412)
                                end
                            elseif kb<=63168 then
                                if kb<=62878 then
                                    if kb<=62598 then
                                        Fb,f_,k=y(Fb);
                                        kb=fa_[4526]or Dc(112037,4526,26297)
                                    else
                                        i_=Ma[5264]
                                        if(Cb[Ma[13654]]==nil)~=i_ then
                                            kb=fa_[-15350]or Dc(94081,-15350,56705)
                                            continue
                                        else
                                            kb=fa_[22755]or Dc(66737,22755,20144)
                                            continue
                                        end
                                        kb=fa_[25068]or Dc(9720,25068,43448)
                                    end
                                else
                                    if ra>113 then
                                        kb=fa_[-28892]or Dc(70762,-28892,5969)
                                        continue
                                    else
                                        kb=fa_[21597]or Dc(34357,21597,64654)
                                        continue
                                    end
                                    kb=fa_[-13385]or Dc(16347,-13385,41881)
                                end
                            elseif kb<=63690 then
                                if ra>246 then
                                    kb=fa_[31403]or Dc(14049,31403,46211)
                                    continue
                                else
                                    kb=fa_[-4308]or Dc(119595,-4308,30219)
                                    continue
                                end
                                kb=fa_[-31008]or Dc(36263,-31008,4197)
                            else
                                Ob+=1;
                                kb=fa_[1227]or Dc(52390,1227,53602)
                            end
                        elseif kb>=60250 then
                            if kb>=60411 then
                                if kb>=60788 then
                                    if kb<=60788 then
                                        i_,Fb=nil,Kb(Ma[9152],50396);
                                        i_=if Fb<32768 then Fb else Fb-65536;
                                        f_=i_;
                                        k=T[f_+1];
                                        ic=k[39256];
                                        da=nc(ic);
                                        Cb[Kb(Ma[13654],27)]=H(k,da);
                                        p,Za,kb,s_=1,ic,41752,1
                                    else
                                        if ra>223 then
                                            kb=fa_[-26026]or Dc(79903,-26026,20333)
                                            continue
                                        else
                                            kb=fa_[-18613]or Dc(28712,-18613,38827)
                                            continue
                                        end
                                        kb=fa_[-480]or Dc(40585,-480,843)
                                    end
                                else
                                    Za=Za+Zb;
                                    Sb=Za
                                    if Za~=Za then
                                        kb=fa_[2289]or Dc(34790,2289,59541)
                                    else
                                        kb=22316
                                    end
                                end
                            elseif kb<=60250 then
                                if da==-2 then
                                    kb=fa_[-21604]or Dc(7414,-21604,32776)
                                    continue
                                else
                                    kb=fa_[1196]or Dc(89890,1196,41562)
                                    continue
                                end
                                kb=fa_[-8727]or Dc(7699,-8727,32977)
                            else
                                wc={[3]=Cb[Sb[45061]],[2]=3};
                                wc[1]=wc;
                                da[Zb],kb=wc,fa_[29961]or Dc(60633,29961,41183)
                            end
                        elseif kb<59220 then
                            if kb<=59109 then
                                k,kb=nil,39693
                            else
                                if Cb[Ma[13654]]==Cb[Ma[36227]]then
                                    kb=fa_[31331]or Dc(94151,31331,4259)
                                    continue
                                else
                                    kb=fa_[22877]or Dc(45532,22877,39415)
                                    continue
                                end
                                kb=fa_[29068]or Dc(8143,29068,33677)
                            end
                        elseif kb<=59238 then
                            if kb>59220 then
                                if Ma[42833]==80 then
                                    kb=fa_[-2466]or Dc(965,-2466,34536)
                                    continue
                                else
                                    kb=fa_[26989]or Dc(38904,26989,20702)
                                    continue
                                end
                                kb=fa_[-18137]or Dc(65304,-18137,58328)
                            else
                                i_=G(Fb)
                                if i_~=nil and i_.__iter~=nil then
                                    kb=fa_[-27440]or Dc(86515,-27440,7416)
                                    continue
                                elseif mb(Fb)=='table'then
                                    kb=fa_[-21696]or Dc(89826,-21696,61331)
                                    continue
                                end
                                kb=fa_[3535]or Dc(6238,3535,42021)
                            end
                        else
                            i_=E[Ma[45061]+1];
                            Cb[Ma[13654]],kb=i_[1][i_[2]],fa_[-3902]or Dc(44775,-3902,12453)
                        end
                    elseif kb>=40926 then
                        if kb>44063 then
                            if kb>46154 then
                                if kb<=46798 then
                                    if kb>=46427 then
                                        if kb<=46427 then
                                            Ob+=1;
                                            kb=fa_[2267]or Dc(93924,2267,28836)
                                        else
                                            Ob-=1;
                                            q[Ob],kb={[24496]=207,[13654]=Kb(Ma[13654],134),[45061]=Kb(Ma[45061],117),[42833]=0},fa_[8351]or Dc(47415,8351,11765)
                                        end
                                    else
                                        i_,Fb=nil,Cb[Ma[13654]];
                                        i_=U(Fb)=='function'
                                        if not i_ then
                                            kb=fa_[-12961]or Dc(92214,-12961,54429)
                                            continue
                                        end
                                        kb=9953
                                    end
                                elseif kb<=46966 then
                                    if ra>47 then
                                        kb=fa_[-7026]or Dc(92669,-7026,30581)
                                        continue
                                    else
                                        kb=fa_[9874]or Dc(5812,9874,44076)
                                        continue
                                    end
                                    kb=fa_[17297]or Dc(15487,17297,44605)
                                else
                                    if ra>210 then
                                        kb=fa_[10750]or Dc(62920,10750,38844)
                                        continue
                                    else
                                        kb=fa_[-30021]or Dc(86579,-30021,12619)
                                        continue
                                    end
                                    kb=fa_[1897]or Dc(60864,1897,61824)
                                end
                            elseif kb>45491 then
                                if kb<=45833 then
                                    kb,Fb=fa_[15304]or Dc(96304,15304,1961),ic
                                    continue
                                else
                                    pa(Cb,Fb,Fb+f_-1,Ma[36227],Cb[i_]);
                                    Ob+=1;
                                    kb=fa_[26231]or Dc(12904,26231,42024)
                                end
                            elseif kb<44910 then
                                if kb<=44229 then
                                    if ra>80 then
                                        kb=fa_[-23063]or Dc(88693,-23063,16107)
                                        continue
                                    else
                                        kb=fa_[-5822]or Dc(44718,-5822,43245)
                                        continue
                                    end
                                    kb=fa_[21999]or Dc(794,21999,38870)
                                else
                                    if not Cb[Ma[13654]]then
                                        kb=fa_[-25451]or Dc(63214,-25451,9645)
                                        continue
                                    end
                                    kb=fa_[-25360]or Dc(11375,-25360,48685)
                                end
                            elseif kb<=44910 then
                                if(Zb>=0 and Za>s_)or((Zb<0 or Zb~=Zb)and Za<s_)then
                                    kb=fa_[8276]or Dc(58015,8276,64711)
                                else
                                    kb=37646
                                end
                            else
                                va(da);
                                kb,pb[ic]=fa_[15122]or Dc(45653,15122,32318),nil
                            end
                        elseif kb>=41879 then
                            if kb>43150 then
                                if kb>43927 then
                                    if ra>243 then
                                        kb=fa_[-5997]or Dc(71240,-5997,28357)
                                        continue
                                    else
                                        kb=fa_[32166]or Dc(96718,32166,52180)
                                        continue
                                    end
                                    kb=fa_[32458]or Dc(89945,32458,17179)
                                else
                                    Ob+=1;
                                    kb=fa_[-10]or Dc(215,-10,37525)
                                end
                            elseif kb<=42047 then
                                if kb>=42026 then
                                    if kb<=42026 then
                                        if(s_>=0 and p>Za)or((s_<0 or s_~=s_)and p<Za)then
                                            kb=fa_[17601]or Dc(95500,17601,61186)
                                        else
                                            kb=43150
                                        end
                                    else
                                        Cb[Ma[13654]],kb=f_[Ma[56304]][Ma[1488]],fa_[15965]or Dc(72211,15965,1463)
                                    end
                                else
                                    Cb[Ma[13654]],kb=nil,fa_[-28081]or Dc(88289,-28081,19107)
                                end
                            else
                                kb,da=fa_[-1096]or Dc(71161,-1096,63535),da..kc(Kb(Db(k,Zb+1),Db(ic,Zb%#ic+1)))
                            end
                        elseif kb<41121 then
                            if kb>40942 then
                                kb,k=fa_[31467]or Dc(56128,31467,50974),Ab-i_+1
                            elseif kb<=40926 then
                                Fb,f_,k=i_.__iter(Fb);
                                kb=fa_[2233]or Dc(14770,2233,44042)
                            else
                                Fb,f_,k=y(Fb);
                                kb=fa_[8325]or Dc(84706,8325,26953)
                            end
                        elseif kb<41306 then
                            Fb,f_,k=y(Fb);
                            kb=fa_[-3588]or Dc(84715,-3588,24421)
                        elseif kb<=41306 then
                            i_,Fb,f_=Ma[13654],Ma[42833],Ma[36845];
                            k=Cb[Fb];
                            Cb[i_+1]=k;
                            Cb[i_]=k[f_];
                            Ob+=1;
                            kb=fa_[-12745]or Dc(46451,-12745,22833)
                        else
                            Zb=p
                            if Za~=Za then
                                kb=fa_[-18286]or Dc(52583,-18286,53541)
                            else
                                kb=15048
                            end
                        end
                    elseif kb<=37226 then
                        if kb>36170 then
                            if kb>=37044 then
                                if kb>37152 then
                                    i_[36845]=Fb;
                                    kb,Ma[24496]=fa_[-22781]or Dc(35905,-22781,7683),29
                                elseif kb>37044 then
                                    Fb[56304]=k;
                                    ic,kb=nil,fa_[-13934]or Dc(77807,-13934,29043)
                                else
                                    if Ma[42833]==148 then
                                        kb=fa_[-197]or Dc(53285,-197,46263)
                                        continue
                                    else
                                        kb=fa_[-15767]or Dc(97227,-15767,53798)
                                        continue
                                    end
                                    kb=fa_[19226]or Dc(39690,19226,4038)
                                end
                            elseif kb>36539 then
                                i_,Fb,f_=Kb(Ma[45061],82),Kb(Ma[42833],83),Kb(Ma[13654],220);
                                k,ic=Fb==0 and Ab-i_ or Fb-1,Cb[i_];
                                da,p=Aa(ic(ib(Cb,i_+1,i_+k)))
                                if f_==0 then
                                    kb=fa_[14198]or Dc(37015,14198,37662)
                                    continue
                                else
                                    kb=fa_[-21030]or Dc(16901,-21030,37710)
                                    continue
                                end
                                kb=13428
                            else
                                if ra>76 then
                                    kb=fa_[6232]or Dc(77675,6232,59688)
                                    continue
                                else
                                    kb=fa_[18103]or Dc(66312,18103,27192)
                                    continue
                                end
                                kb=fa_[2096]or Dc(59958,2096,64754)
                            end
                        elseif kb<=33878 then
                            if kb<33773 then
                                if kb>33594 then
                                    f_,k=i_[36845],Ma[36845];
                                    k='0z\29'..k;
                                    ic='';
                                    Za,da,p,kb=1,0,#f_-1,fa_[31133]or Dc(91764,31133,20809)
                                else
                                    Fb[36845]=f_
                                    if i_==2 then
                                        kb=fa_[-25491]or Dc(51655,-25491,59486)
                                        continue
                                    elseif i_==3 then
                                        kb=fa_[-5094]or Dc(75037,-5094,7995)
                                        continue
                                    end
                                    kb=56273
                                end
                            elseif kb<=33773 then
                                i_=T[Ma[36845]+1];
                                Fb=i_[39256];
                                f_=nc(Fb);
                                Cb[Ma[13654]]=H(i_,f_);
                                da,ic,k,kb=1,Fb,1,9144
                            else
                                Za=q[Ob];
                                Ob+=1;
                                s_=Za[13654]
                                if s_==0 then
                                    kb=fa_[7353]or Dc(29666,7353,48688)
                                    continue
                                elseif s_==2 then
                                    kb=fa_[-11163]or Dc(78854,-11163,1932)
                                    continue
                                end
                                kb=fa_[-32326]or Dc(43044,-32326,57315)
                            end
                        elseif kb>=35670 then
                            if kb>35670 then
                                da=da+Za;
                                s_=da
                                if da~=da then
                                    kb=fa_[-20545]or Dc(94356,-20545,7404)
                                else
                                    kb=fa_[21700]or Dc(10417,21700,39650)
                                end
                            else
                                kb,p=fa_[4254]or Dc(126619,4254,9119),p..kc(Kb(Db(ic,Sb+1),Db(da,Sb%#da+1)))
                            end
                        else
                            kb,Cb[Ma[13654]]=fa_[2110]or Dc(40485,2110,47181),f_[Ma[56304]]
                        end
                    elseif kb<39693 then
                        if kb<39339 then
                            if kb<=37646 then
                                p,kb=p..kc(Kb(Db(ic,Sb+1),Db(da,Sb%#da+1))),fa_[-28716]or Dc(62168,-28716,41058)
                            else
                                Fb,f_,k=i_.__iter(Fb);
                                kb=fa_[1801]or Dc(29947,1801,45888)
                            end
                        elseif kb<39364 then
                            Ob-=1;
                            kb,q[Ob]=fa_[-19174]or Dc(92775,-19174,31781),{[24496]=162,[13654]=Kb(Ma[13654],185),[45061]=Kb(Ma[45061],115),[42833]=0}
                        elseif kb<=39364 then
                            k=k+da;
                            p=k
                            if k~=k then
                                kb=fa_[-26855]or Dc(82779,-26855,22297)
                            else
                                kb=22817
                            end
                        else
                            if Ma[42833]==89 then
                                kb=fa_[30677]or Dc(34830,30677,42553)
                                continue
                            elseif Ma[42833]==198 then
                                kb=fa_[29032]or Dc(2447,29032,43869)
                                continue
                            else
                                kb=fa_[-22189]or Dc(23,-22189,45416)
                                continue
                            end
                            kb=fa_[30047]or Dc(38455,30047,14581)
                        end
                    elseif kb<40584 then
                        if kb>=39888 then
                            if kb>39888 then
                                Ob+=Ma[54930];
                                kb=fa_[27291]or Dc(32950,27291,5490)
                            else
                                if ra>182 then
                                    kb=fa_[-4330]or Dc(54560,-4330,888)
                                    continue
                                else
                                    kb=fa_[13762]or Dc(62789,13762,61004)
                                    continue
                                end
                                kb=fa_[26512]or Dc(48952,26512,9208)
                            end
                        else
                            ic,da=Fb[56304],Ma[56304];
                            da='0z\29'..da;
                            p='';
                            s_,kb,Za,Zb=#ic-1,31627,0,1
                        end
                    elseif kb<40697 then
                        Ob+=Ma[54930];
                        kb=fa_[-4519]or Dc(11195,-4519,48761)
                    elseif kb>40697 then
                        if ra>162 then
                            kb=fa_[-23163]or Dc(122590,-23163,9676)
                            continue
                        else
                            kb=fa_[-19428]or Dc(75154,-19428,17501)
                            continue
                        end
                        kb=fa_[8979]or Dc(46373,8979,23015)
                    else
                        i_=G(Fb)
                        if i_~=nil and i_.__iter~=nil then
                            kb=fa_[-22245]or Dc(43825,-22245,34111)
                            continue
                        elseif mb(Fb)=='table'then
                            kb=fa_[27408]or Dc(101573,27408,18752)
                            continue
                        end
                        kb=fa_[24313]or Dc(123197,24313,12849)
                    end
                elseif kb<=15048 then
                    if kb<=8179 then
                        if kb<=5199 then
                            if kb>=3976 then
                                if kb<4230 then
                                    if kb>=4025 then
                                        if kb<=4025 then
                                            pa(hb[45462],1,Fb,i_,Cb);
                                            kb=fa_[-11391]or Dc(96928,-11391,28512)
                                        else
                                            Ob-=1;
                                            q[Ob],kb={[24496]=249,[13654]=Kb(Ma[13654],16),[45061]=Kb(Ma[45061],132),[42833]=0},fa_[-17999]or Dc(36177,-17999,4371)
                                        end
                                    else
                                        da[3]=da[1][da[2]];
                                        da[1]=da;
                                        da[2]=3;
                                        kb,_c[ic]=fa_[-17184]or Dc(94742,-17184,42340),nil
                                    end
                                elseif kb>4857 then
                                    Zb={[3]=Cb[Za[45061]],[2]=3};
                                    Zb[1]=Zb;
                                    kb,f_[p]=fa_[16793]or Dc(44995,16793,54428),Zb
                                elseif kb<=4760 then
                                    if kb>4230 then
                                        ic,da=Fb(f_,k);
                                        k=ic
                                        if k==nil then
                                            kb=fa_[19755]or Dc(47628,19755,43294)
                                        else
                                            kb=45491
                                        end
                                    else
                                        k,kb=nil,8779
                                    end
                                else
                                    kb,da[Zb]=fa_[7347]or Dc(47080,7347,3564),E[Sb[45061]+1]
                                end
                            elseif kb<=1817 then
                                if kb<=841 then
                                    if kb>448 then
                                        i_=Ma[36845];
                                        Cb[Ma[45061]]=Cb[Ma[13654]][i_];
                                        Ob+=1;
                                        kb=fa_[-10474]or Dc(35175,-10474,7461)
                                    elseif kb<=56 then
                                        p,kb=f_-1,fa_[25471]or Dc(31973,25471,39186)
                                    else
                                        Ob+=Ma[54930];
                                        kb=fa_[26281]or Dc(47437,26281,11535)
                                    end
                                else
                                    if ra>163 then
                                        kb=fa_[27989]or Dc(121319,27989,1350)
                                        continue
                                    else
                                        kb=fa_[17677]or Dc(74419,17677,21237)
                                        continue
                                    end
                                    kb=fa_[-11018]or Dc(92001,-11018,27427)
                                end
                            elseif kb<=2006 then
                                xc={[2]=wc,[1]=Cb};
                                _c[wc],kb=xc,fa_[-3438]or Dc(54697,-3438,55901)
                            else
                                Ca=false;
                                Ob+=1
                                if ra>160 then
                                    kb=fa_[11767]or Dc(84264,11767,22268)
                                    continue
                                else
                                    kb=fa_[3625]or Dc(78103,3625,29659)
                                    continue
                                end
                                kb=fa_[-26115]or Dc(33270,-26115,5554)
                            end
                        elseif kb>=7468 then
                            if kb<8043 then
                                if kb>=7640 then
                                    if kb<=7640 then
                                        if ra>73 then
                                            kb=fa_[-2021]or Dc(81774,-2021,19635)
                                            continue
                                        else
                                            kb=fa_[30096]or Dc(94193,30096,59772)
                                            continue
                                        end
                                        kb=fa_[-24850]or Dc(45123,-24850,8705)
                                    else
                                        Cb[Ma[13654]],kb=f_,fa_[-16440]or Dc(41641,-16440,44273)
                                    end
                                else
                                    Ob-=1;
                                    kb,q[Ob]=fa_[-31433]or Dc(38413,-31433,14543),{[24496]=32,[13654]=Kb(Ma[13654],171),[45061]=Kb(Ma[45061],140),[42833]=0}
                                end
                            elseif kb<8145 then
                                Ob-=1;
                                q[Ob],kb={[24496]=85,[13654]=Kb(Ma[13654],67),[45061]=Kb(Ma[45061],149),[42833]=0},fa_[4442]or Dc(60502,4442,65042)
                            elseif kb<=8145 then
                                if ra>29 then
                                    kb=fa_[-7797]or Dc(87942,-7797,41279)
                                    continue
                                else
                                    kb=fa_[27828]or Dc(43855,27828,16141)
                                    continue
                                end
                                kb=fa_[4711]or Dc(4563,4711,34193)
                            else
                                kb,f_=fa_[21222]or Dc(33848,21222,33137),Ab-Fb+1
                            end
                        elseif kb>=5733 then
                            if kb<6037 then
                                if ra>21 then
                                    kb=fa_[22570]or Dc(12603,22570,42489)
                                    continue
                                else
                                    kb=fa_[-6833]or Dc(15776,-6833,56717)
                                    continue
                                end
                                kb=fa_[-14643]or Dc(39186,-14643,3374)
                            elseif kb>6037 then
                                Ab,Ob,_c,kb,pb,Ca=-1,1,Ua({},{__mode='vs'}),15553,Ua({},{__mode='ks'}),false
                            else
                                Fb,f_,k=_c
                                if mb(Fb)~='function'then
                                    kb=fa_[-15308]or Dc(66121,-15308,54789)
                                    continue
                                end
                                kb=fa_[-27154]or Dc(86836,-27154,18352)
                            end
                        elseif kb>5411 then
                            Cb[Ma[13654]],kb=Cb[Ma[45061]],fa_[15250]or Dc(11331,15250,48641)
                        else
                            wc=Sb[45061];
                            xc=_c[wc]
                            if xc==nil then
                                kb=fa_[10459]or Dc(59108,10459,16305)
                                continue
                            end
                            kb=23279
                        end
                    elseif kb<13428 then
                        if kb<=10601 then
                            if kb>9144 then
                                if kb>9953 then
                                    if ra>42 then
                                        kb=fa_[26391]or Dc(73973,26391,63090)
                                        continue
                                    else
                                        kb=fa_[-12366]or Dc(101364,-12366,26648)
                                        continue
                                    end
                                    kb=fa_[24073]or Dc(13849,24073,55515)
                                else
                                    Ob+=Ma[54930];
                                    kb=fa_[18204]or Dc(62616,18204,6488)
                                end
                            elseif kb<8779 then
                                if kb<=8204 then
                                    i_,Fb=Ma[13654],Ma[45061];
                                    f_=Fb-1
                                    if f_==-1 then
                                        kb=fa_[-11251]or Dc(34312,-11251,46856)
                                        continue
                                    else
                                        kb=fa_[16056]or Dc(89083,16056,57340)
                                        continue
                                    end
                                    kb=13507
                                else
                                    if ra>106 then
                                        kb=fa_[-24113]or Dc(127823,-24113,21752)
                                        continue
                                    else
                                        kb=fa_[1611]or Dc(66227,1611,1563)
                                        continue
                                    end
                                    kb=fa_[-21744]or Dc(94042,-21744,29462)
                                end
                            elseif kb<=8779 then
                                ic,da=Fb[56304],Ma[56304];
                                da='0z\29'..da;
                                p='';
                                Za,Zb,s_,kb=0,1,#ic-1,fa_[-24305]or Dc(75012,-24305,60138)
                            else
                                p=k
                                if ic~=ic then
                                    kb=fa_[-21682]or Dc(9934,-21682,43146)
                                else
                                    kb=22817
                                end
                            end
                        elseif kb>12566 then
                            if kb>12749 then
                                i_,Fb=Ma[32006],Ma[36845];
                                f_=ya[Fb]or Ec[62470][Fb]
                                if i_==1 then
                                    kb=fa_[-22626]or Dc(26090,-22626,38605)
                                    continue
                                elseif i_==2 then
                                    kb=fa_[-25170]or Dc(62583,-25170,44518)
                                    continue
                                elseif i_==3 then
                                    kb=fa_[-13210]or Dc(121657,-13210,30333)
                                    continue
                                end
                                kb=46427
                            else
                                if ra>216 then
                                    kb=fa_[-31699]or Dc(15751,-31699,41648)
                                    continue
                                else
                                    kb=fa_[13502]or Dc(46813,13502,39058)
                                    continue
                                end
                                kb=fa_[32021]or Dc(3979,32021,37449)
                            end
                        elseif kb>=11230 then
                            if kb<=11230 then
                                Ob-=1;
                                q[Ob],kb={[24496]=134,[13654]=Kb(Ma[13654],199),[45061]=Kb(Ma[45061],196),[42833]=0},fa_[-32288]or Dc(2840,-32288,40920)
                            else
                                if ra>12 then
                                    kb=fa_[20570]or Dc(85935,20570,8558)
                                    continue
                                else
                                    kb=fa_[11588]or Dc(48486,11588,3645)
                                    continue
                                end
                                kb=fa_[13577]or Dc(36403,13577,4337)
                            end
                        else
                            Cb[Ma[13654]],kb=Ma[36845],fa_[-13260]or Dc(6351,-13260,35469)
                        end
                    elseif kb<14216 then
                        if kb>=13867 then
                            if kb>13872 then
                                Zb=p
                                if Za~=Za then
                                    kb=fa_[-8540]or Dc(125300,-8540,17226)
                                else
                                    kb=fa_[-25914]or Dc(91514,-25914,4527)
                                end
                            elseif kb>13867 then
                                Cb[i_+2]=Cb[i_+3];
                                Ob+=Ma[54930];
                                kb=fa_[19410]or Dc(34810,19410,2998)
                            else
                                Ma=q[Ob];
                                ra,kb=Ma[24496],fa_[-28320]or Dc(63927,-28320,12430)
                            end
                        elseif kb>=13507 then
                            if kb>13507 then
                                i_,Fb,f_=Ma[42833],Ma[45061],Ma[13654]-1
                                if f_==-1 then
                                    kb=fa_[-23905]or Dc(61040,-23905,8062)
                                    continue
                                end
                                kb=46154
                            else
                                return ib(Cb,i_,i_+k-1)
                            end
                        else
                            pa(da,1,p,i_,Cb);
                            kb=fa_[14862]or Dc(41260,14862,13804)
                        end
                    elseif kb>=14771 then
                        if kb>=14836 then
                            if kb>14836 then
                                if(s_>=0 and p>Za)or((s_<0 or s_~=s_)and p<Za)then
                                    kb=fa_[-10466]or Dc(63368,-10466,6728)
                                else
                                    kb=fa_[-17215]or Dc(48217,-17215,38451)
                                end
                            else
                                if ra>241 then
                                    kb=fa_[-28524]or Dc(99119,-28524,19426)
                                    continue
                                else
                                    kb=fa_[-26331]or Dc(43422,-26331,15153)
                                    continue
                                end
                                kb=fa_[-5055]or Dc(6017,-5055,47683)
                            end
                        else
                            kb,Za=fa_[7407]or Dc(77362,7407,26777),Za..kc(Kb(Db(da,V+1),Db(p,V%#p+1)))
                        end
                    elseif kb<=14575 then
                        if kb<=14216 then
                            if ra>168 then
                                kb=fa_[13510]or Dc(79896,13510,19755)
                                continue
                            else
                                kb=fa_[-15301]or Dc(56155,-15301,4769)
                                continue
                            end
                            kb=fa_[-12675]or Dc(7967,-12675,33757)
                        else
                            pc(da);
                            kb=fa_[-5284]or Dc(121119,-5284,15522)
                        end
                    else
                        i_=Ma[36845];
                        Cb[Ma[45061]]=ya[i_]or Ec[62470][i_];
                        Ob+=1;
                        kb=fa_[-8734]or Dc(58097,-8734,62643)
                    end
                elseif kb>24008 then
                    if kb>29255 then
                        if kb>32667 then
                            if kb<33112 then
                                if kb>33012 then
                                    Za=Za+Zb;
                                    Sb=Za
                                    if Za~=Za then
                                        kb=fa_[15941]or Dc(1787,15941,36899)
                                    else
                                        kb=fa_[-17031]or Dc(41367,-17031,41734)
                                    end
                                else
                                    Ob-=1;
                                    kb,q[Ob]=fa_[21066]or Dc(87379,21066,30993),{[24496]=42,[13654]=Kb(Ma[13654],22),[45061]=Kb(Ma[45061],138),[42833]=0}
                                end
                            elseif kb<=33112 then
                                i_,Fb=Ma[13654],Ma[36845];
                                Ab=i_+6;
                                f_,k=Cb[i_],nil;
                                k=U(f_)=='function'
                                if k then
                                    kb=fa_[-27486]or Dc(55219,-27486,46683)
                                    continue
                                else
                                    kb=fa_[-29342]or Dc(71832,-29342,62866)
                                    continue
                                end
                                kb=fa_[5973]or Dc(8935,5973,46245)
                            else
                                if ra>23 then
                                    kb=fa_[12046]or Dc(86213,12046,24983)
                                    continue
                                else
                                    kb=fa_[14923]or Dc(1481,14923,44647)
                                    continue
                                end
                                kb=fa_[-6785]or Dc(47494,-6785,11330)
                            end
                        elseif kb>31260 then
                            if kb>31627 then
                                da,p=Fb[1488],Ma[1488];
                                p='0z\29'..p;
                                Za='';
                                Zb,kb,s_,Sb=#da-1,fa_[-8386]or Dc(39159,-8386,49159),0,1
                            else
                                Sb=Za
                                if s_~=s_ then
                                    kb=fa_[31413]or Dc(64535,31413,52996)
                                else
                                    kb=22316
                                end
                            end
                        elseif kb>=30543 then
                            if kb<=30543 then
                                V=s_
                                if Zb~=Zb then
                                    kb=fa_[32454]or Dc(33718,32454,57851)
                                else
                                    kb=53420
                                end
                            else
                                if ra>85 then
                                    kb=fa_[13616]or Dc(126263,13616,17322)
                                    continue
                                else
                                    kb=fa_[24883]or Dc(117993,24883,20135)
                                    continue
                                end
                                kb=fa_[-19515]or Dc(97914,-19515,24630)
                            end
                        elseif kb<=29848 then
                            s_=s_+Sb;
                            V=s_
                            if s_~=s_ then
                                kb=fa_[9572]or Dc(49959,9572,41322)
                            else
                                kb=53420
                            end
                        else
                            Ob+=1;
                            kb=fa_[-18796]or Dc(55294,-18796,64442)
                        end
                    elseif kb<27194 then
                        if kb<=26126 then
                            if kb>25820 then
                                s_=da
                                if p~=p then
                                    kb=fa_[-28848]or Dc(33226,-28848,36830)
                                else
                                    kb=fa_[32138]or Dc(9324,32138,38495)
                                end
                            elseif kb>=25310 then
                                if kb<=25310 then
                                    Fb,f_,k=_c
                                    if mb(Fb)~='function'then
                                        kb=fa_[-1115]or Dc(118857,-1115,24691)
                                        continue
                                    end
                                    kb=fa_[-3522]or Dc(72439,-3522,52679)
                                else
                                    Ob-=1;
                                    q[Ob],kb={[24496]=227,[13654]=Kb(Ma[13654],202),[45061]=Kb(Ma[45061],184),[42833]=0},fa_[28749]or Dc(83681,28749,18595)
                                end
                            else
                                kb,k=fa_[20280]or Dc(80468,20280,31159),p
                                continue
                            end
                        elseif kb>26246 then
                            if ra>94 then
                                kb=fa_[-17238]or Dc(51012,-17238,63353)
                                continue
                            else
                                kb=fa_[4029]or Dc(52146,4029,37013)
                                continue
                            end
                            kb=fa_[-9248]or Dc(41231,-9248,13773)
                        else
                            ya[Ma[36845]]=Cb[Ma[42833]];
                            Ob+=1;
                            kb=fa_[-1195]or Dc(61551,-1195,57901)
                        end
                    elseif kb>=27389 then
                        if kb>=28887 then
                            if kb>28887 then
                                if ra>207 then
                                    kb=fa_[25384]or Dc(43931,25384,50829)
                                    continue
                                else
                                    kb=fa_[-16666]or Dc(52274,-16666,47315)
                                    continue
                                end
                                kb=fa_[25880]or Dc(35205,25880,7239)
                            else
                                ic={f_(Cb[i_+1],Cb[i_+2])};
                                pa(ic,1,Fb,i_+3,Cb)
                                if Cb[i_+3]~=nil then
                                    kb=fa_[32158]or Dc(42324,32158,12167)
                                    continue
                                else
                                    kb=fa_[-21301]or Dc(71252,-21301,1653)
                                    continue
                                end
                                kb=fa_[20821]or Dc(87463,20821,30821)
                            end
                        else
                            p=p+s_;
                            Zb=p
                            if p~=p then
                                kb=fa_[-381]or Dc(5517,-381,47183)
                            else
                                kb=15048
                            end
                        end
                    elseif kb<27245 then
                        if ra>227 then
                            kb=fa_[-23273]or Dc(85041,-23273,22491)
                            continue
                        else
                            kb=fa_[-7302]or Dc(110551,-7302,27337)
                            continue
                        end
                        kb=fa_[-17497]or Dc(93338,-17497,29014)
                    elseif kb>27245 then
                        Ob-=1;
                        kb,q[Ob]=fa_[27048]or Dc(61375,27048,62077),{[24496]=164,[13654]=Kb(Ma[13654],130),[45061]=Kb(Ma[45061],230),[42833]=0}
                    else
                        if Ma[42833]==145 then
                            kb=fa_[-13713]or Dc(97054,-13713,58671)
                            continue
                        elseif Ma[42833]==209 then
                            kb=fa_[-22869]or Dc(14276,-22869,55971)
                            continue
                        else
                            kb=fa_[-14904]or Dc(62586,-14904,33216)
                            continue
                        end
                        kb=fa_[7220]or Dc(9017,7220,47099)
                    end
                elseif kb<=20414 then
                    if kb>16864 then
                        if kb>17914 then
                            if kb<=19204 then
                                if ra>117 then
                                    kb=fa_[-10409]or Dc(80018,-10409,31118)
                                    continue
                                else
                                    kb=fa_[-3672]or Dc(77280,-3672,59341)
                                    continue
                                end
                                kb=fa_[-5825]or Dc(16253,-5825,41791)
                            else
                                i_,Fb,f_,k=Ma[36845],Ma[5264],Cb[Ma[13654]],nil;
                                k=U(f_)=='boolean'
                                if(k and(f_==i_))~=Fb then
                                    kb=fa_[3751]or Dc(63444,3751,47535)
                                    continue
                                else
                                    kb=fa_[14754]or Dc(36973,14754,39477)
                                    continue
                                end
                                kb=fa_[-23552]or Dc(10371,-23552,48449)
                            end
                        elseif kb>=17719 then
                            if kb>17719 then
                                kb,i_,Fb=33645,q[Ob],nil
                            else
                                kb,k=fa_[-15626]or Dc(43082,-15626,7532),p
                                continue
                            end
                        else
                            Fb,f_,k=pb
                            if mb(Fb)~='function'then
                                kb=fa_[-28628]or Dc(128204,-28628,19483)
                                continue
                            end
                            kb=fa_[26941]or Dc(10275,26941,54408)
                        end
                    elseif kb<15493 then
                        if kb>15268 then
                            Fb[1488],kb=ic,fa_[27141]or Dc(128129,27141,30803)
                        elseif kb>15179 then
                            Ob-=1;
                            kb,q[Ob]=fa_[4186]or Dc(90005,4186,16983),{[24496]=225,[13654]=Kb(Ma[13654],170),[45061]=Kb(Ma[45061],187),[42833]=0}
                        else
                            pb[Ma]=nil;
                            Ob+=1;
                            kb=fa_[9074]or Dc(52303,9074,56845)
                        end
                    elseif kb<=16236 then
                        if kb<=15553 then
                            if kb<=15493 then
                                ic,da=Fb(f_,k);
                                k=ic
                                if k==nil then
                                    kb=17667
                                else
                                    kb=56907
                                end
                            else
                                if not Ca then
                                    kb=fa_[-17398]or Dc(61342,-17398,59632)
                                    continue
                                end
                                kb=fa_[-23498]or Dc(29033,-23498,43108)
                            end
                        else
                            if ra>236 then
                                kb=fa_[28317]or Dc(48420,28317,9577)
                                continue
                            else
                                kb=fa_[15613]or Dc(35012,15613,53005)
                                continue
                            end
                            kb=fa_[1212]or Dc(86949,1212,18023)
                        end
                    else
                        Fb=hb[3609];
                        kb,Ab=fa_[-32003]or Dc(24944,-32003,32824),i_+Fb-1
                    end
                elseif kb<22817 then
                    if kb>=21997 then
                        if kb<22316 then
                            ic,kb=ic..kc(Kb(Db(f_,s_+1),Db(k,s_%#k+1))),fa_[5010]or Dc(92288,5010,2777)
                        elseif kb<=22316 then
                            if(Zb>=0 and Za>s_)or((Zb<0 or Zb~=Zb)and Za<s_)then
                                kb=fa_[25420]or Dc(10498,25420,39473)
                            else
                                kb=fa_[13135]or Dc(38607,13135,51734)
                            end
                        else
                            if ra>32 then
                                kb=fa_[-16574]or Dc(43625,-16574,23858)
                                continue
                            else
                                kb=fa_[-26586]or Dc(34243,-26586,54220)
                                continue
                            end
                            kb=fa_[-16758]or Dc(11359,-16758,48669)
                        end
                    elseif kb<=20705 then
                        i_=E[Ma[45061]+1];
                        kb,i_[1][i_[2]]=fa_[22594]or Dc(97029,22594,28615),Cb[Ma[13654]]
                    else
                        kb,ic=15318,Za
                        continue
                    end
                elseif kb<23515 then
                    if kb>=23279 then
                        if kb>23279 then
                            if da[2]>=Ma[13654]then
                                kb=fa_[-2147]or Dc(3834,-2147,44657)
                                continue
                            end
                            kb=fa_[1736]or Dc(86716,1736,34190)
                        else
                            kb,da[Zb]=fa_[27865]or Dc(89614,27865,12814),xc
                        end
                    else
                        if(da>=0 and k>ic)or((da<0 or da~=da)and k<ic)then
                            kb=fa_[-4575]or Dc(36531,-4575,4977)
                        else
                            kb=fa_[-20055]or Dc(117661,-20055,26152)
                        end
                    end
                elseif kb>23856 then
                    i_=Ma[36845];
                    Cb[Ma[42833]][i_]=Cb[Ma[13654]];
                    Ob+=1;
                    kb=fa_[-7942]or Dc(45955,-7942,9793)
                elseif kb<=23515 then
                    kb,Fb[56304]=fa_[31904]or Dc(122913,31904,22003),k
                else
                    if(Za>=0 and da>p)or((Za<0 or Za~=Za)and da<p)then
                        kb=fa_[-29144]or Dc(124997,-29144,29791)
                    else
                        kb=fa_[-4318]or Dc(95527,-4318,32473)
                    end
                end
            until kb==52518
        end
        return function(...)
            local Mb,vb,nb,X,Ac,ga,Ub,u_,A,o_,P;
            Ub,A=function(a_,I,Ib)
                A[a_]=t_(I,613)-t_(Ib,65471)
                return A[a_]
            end,{};
            ga=A[-12313]or Ub(-12313,36517,40949)
            while ga~=11994 do
                if ga<=37926 then
                    if ga>=17150 then
                        if ga<31036 then
                            u_,Ac=Aa(rc(L,X,Na[38025],Na[61620],o_))
                            if u_[1]then
                                ga=A[12458]or Ub(12458,89035,42282)
                                continue
                            else
                                ga=A[-15076]or Ub(-15076,70088,33783)
                                continue
                            end
                            ga=37926
                        elseif ga>31036 then
                            ga=A[3837]or Ub(3837,23586,53458)
                            continue
                        else
                            vb,ga=U(vb),A[28752]or Ub(28752,49455,17358)
                        end
                    elseif ga<=1753 then
                        return pc(vb,0)
                    else
                        P,X,o_=za(...),nc(Na[29527]),{[45462]={},[3609]=0};
                        pa(P,1,Na[23964],0,X)
                        if Na[23964]<P.n then
                            ga=A[-20830]or Ub(-20830,106479,11616)
                            continue
                        end
                        ga=A[21458]or Ub(21458,63708,18436)
                    end
                elseif ga<51883 then
                    vb,nb=u_[2],nil;
                    Mb=vb;
                    nb=U(Mb)=='string'
                    if nb==false then
                        ga=A[-2571]or Ub(-2571,92202,3756)
                        continue
                    end
                    ga=A[9637]or Ub(9637,63113,4524)
                elseif ga>51883 then
                    return ib(u_,2,Ac)
                else
                    u_,Ac=Na[23964]+1,P.n-Na[23964];
                    o_[3609]=Ac;
                    pa(P,u_,u_+Ac-1,1,o_[45462]);
                    ga=A[29541]or Ub(29541,77181,5029)
                end
            end
        end
    end
    return H(z,La)
end)
local Ta;
Ta,Ea={[0]=0},function()
    Ta[0]=Ta[0]+1
    return{[1]=Ta,[2]=Ta[0]}
end;
Bc=n_
return(function()
    return Bc(c(Ya'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'),{})
end)()(...)
