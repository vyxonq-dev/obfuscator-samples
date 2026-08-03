-- This script was generated using the MoonVeil Obfuscator v1.4.5 [https://moonveil.cc]

local Ia,S,v,X,I,wb=type,getmetatable,bit32.bxor,pairs
local t_,Dc,xc,Wb,Z,m,Db,Ma,la,Pb,Mb,za,ha,cc,Fc,Ub,kb,Gc,gc,Ja,va,b_,cb,Ob,ic,Ac,o_,R,pc,dc;
Dc=(select);
ha=(function(...)
    return{[1]={...},[2]=Dc('#',...)}
end);
kb=((function()
    local function db(lc,jc,Ha)
        if jc>Ha then
            return
        end
        return lc[jc],db(lc,jc+1,Ha)
    end
    return db
end)());
Ja,Gc=(string.gsub),(string.char);
Fc=(function(N)
    N=Ja(N,'[^ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=]','')
    return(N:gsub('.',function(da)
        if(da=='=')then
            return''
        end
        local u_,fa_='',(('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'):find(da)-1)
        for Na=6,1,-1 do
            u_=u_..(fa_%2^Na-fa_%2^(Na-1)>0 and'1'or'0')
        end
        return u_
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?',function(pa)
        if(#pa~=8)then
            return''
        end
        local kc=0
        for Bb=1,8 do
            kc=kc+(pa:sub(Bb,Bb)=='1'and 2^(8-Bb)or 0)
        end
        return Gc(kc)
    end))
end);
R,va,Z,o_,la,Ob,Ub,Db=string.unpack,string.sub,string.byte,bit32 .lshift,bit32 .rshift,bit32 .band,table.concat,{};
Mb=(function(Ta)
    local Yb=Db[Ta]
    if Yb then
        return Yb
    end
    local Hb,tc,wa,O,ja=o_(1,11),o_(1,5),1,{},''
    while wa<=#Ta do
        local gb=Z(Ta,wa);
        wa=wa+1
        for La=1,8 do
            local uc=nil
            if Ob(gb,1)~=0 then
                if wa<=#Ta then
                    uc=va(Ta,wa,wa);
                    wa=wa+1
                end
            else
                if wa+1<=#Ta then
                    local Vb=R('>I2',Ta,wa);
                    wa=wa+2
                    local oc,ua=#ja-la(Vb,5),Ob(Vb,(tc-1))+3;
                    uc=va(ja,oc,oc+ua-1)
                end
            end
            gb=la(gb,1)
            if uc then
                O[#O+1]=uc;
                ja=va(ja..uc,-Hb)
            end
        end
    end
    local ac=Ub(O);
    Db[Ta]=ac
    return ac
end)
local wc,Y,xa,J,g,Ya,na,ib,sc,Fa,ka,Aa,mc,tb,Fb,ca,i_,xb,K,rc,w_,_a,h,E,Cb,Gb,p,Zb,Rb,fb=type,pcall,error,tonumber,assert,select,setmetatable,string.format,string.unpack,string.sub,string.byte,string.char,table.move,table.pack,table.create,table.insert,table.concat,coroutine.create,coroutine.yield,coroutine.resume,coroutine.close,getfenv,bit32 .bor,bit32 .bxor,bit32 .band,bit32 .btest,bit32 .rshift,bit32 .lshift,bit32 .extract,{[10508]={},[28596]={{2,8,false},{2,8,false},{2,6,false},{0,2,false},{2,6,false},{10,10,true},{8,9,false},{2,1,true},{3,6,false},{10,1,false},{2,1,true},{8,8,true},{2,6,false},{2,8,false},{0,2,false},{2,8,false},{8,0,false},{10,3,true},{10,6,false},{0,5,false},{3,6,true},{10,6,true},{2,0,false},{8,6,false},{10,6,false},{2,6,true},{10,10,false},{2,6,false},{2,6,true},{2,3,true},{4,2,false},{2,4,false},{4,10,true},{4,8,true},{4,1,true},{3,2,true},{2,8,false},{2,4,true},{3,8,true},{2,6,true},{2,6,false},{2,6,false},{8,1,false},{8,8,false},{8,8,false},{0,6,false},{8,0,false},{2,8,true},{2,7,false},{2,6,false},{3,6,false},{3,6,false},{3,0,false},{8,6,false},{0,6,false},{10,0,true},{8,10,true},{2,6,false},{8,3,false},{8,4,false},{2,1,true},{2,6,false},{10,6,false},{2,6,false},{4,2,true},{3,6,false},{0,6,true},{10,2,true},{10,8,true},{2,1,true},{8,9,false},{2,10,false},{2,6,false},{4,9,false},{0,3,true},{2,6,false},{8,4,false},{10,2,true},{10,9,false},{4,10,true},{10,1,true},{3,8,true},{2,3,false},{8,2,true},{0,4,true},{2,6,true},{10,6,false},{4,9,true},{2,1,true},{0,6,false},{3,1,false},{2,6,false},{10,10,false},{2,1,true},{2,6,false},{8,4,true},{8,4,true},{4,1,true},{10,9,true},{8,2,true},{2,6,false},{10,3,true},{8,2,false},{10,6,true},{10,6,false},{0,9,false},{2,6,false},{10,3,false},{2,6,false},{10,6,true},{8,8,false},{2,0,false},{2,8,false},{2,9,false},{4,6,false},{4,3,false},{2,1,true},{10,3,true},{0,1,true},{3,4,true},{2,4,false},{2,1,true},{2,6,false},{2,6,false},{10,9,true},{8,10,false},{10,6,true},{4,6,true},{3,3,false},{2,6,false},{2,2,true},{10,6,false},{10,6,false},{10,8,false},{0,3,true},{10,10,true},{10,6,true},{8,10,true},{4,2,false},{2,6,false},{2,6,false},{0,9,true},{0,10,false},{4,6,true},{4,9,true},{0,6,false},{0,10,true},{8,6,true},{10,3,true},{8,8,false},{0,6,false},{3,4,false},{4,8,true},{4,2,false},{3,8,false},{0,0,true},{0,2,false},{2,6,false},{10,2,true},{3,9,true},{0,0,false},{2,6,false},{3,1,false},{10,2,true},{10,6,true},{2,8,false},{2,6,false},{4,3,true},{2,2,false},{10,3,true},{10,6,false},{0,6,true},{10,6,false},{8,4,true},{2,9,false},{2,1,true},{2,8,false},{0,2,false},{2,6,false},{3,10,false},{8,9,false},{0,3,false},{0,9,true},{10,9,true},{3,6,true},{8,4,true},{8,9,true},{3,2,false},{3,4,false},{2,1,true},{2,6,false},{10,0,false},{2,6,false},{2,3,false},{10,0,false},{10,9,false},{2,6,false},{10,9,false},{10,4,true},{0,9,false},{2,6,false},{2,3,true},{4,6,true},{2,2,true},{0,1,false},{2,6,false},{10,10,true},{10,10,false},{10,6,false},{8,8,false},{4,10,false},{0,4,true},{2,7,false},{0,9,false},{0,9,false},{2,1,true},{3,6,false},{8,4,true},{10,10,false},{2,2,true},{4,1,true},{3,4,true},{0,2,false},{8,4,false},{2,4,false},{10,0,true},{2,8,true},{8,4,false},{2,8,false},{10,6,false},{10,6,true},{3,2,false},{8,9,false},{10,6,false},{3,3,false},{0,3,false},{4,10,false},{2,8,false},{10,1,true},{10,8,false},{10,9,true},{2,10,true},{0,4,true},{3,9,false},{2,6,true},{2,6,false},{3,8,false},{10,6,true},{2,10,true},{10,4,true},{2,4,false},{2,8,false},{2,6,false},{2,6,false},{3,9,true},{8,3,false}},[60300]={}}
local a_=(function(G)
    local Ba=fb[10508][G]
    if Ba then
        return Ba
    end
    local Bc=1
    local function Kb()
        local V,P,Qb,ec,Ua,Ra,lb,q,Ab,d_,ma,Ga,x,r_,ta,B,yb,ia,ra,jb,Sa,ab,ya,bc,oa,rb,pb,Nb,l_,aa,T,fc;
        ma,q={},function(ba,zb,Qa)
            ma[Qa]=v(ba,63202)-v(zb,46501)
            return ma[Qa]
        end;
        ec=ma[30181]or q(52109,40024,30181)
        repeat
            if ec<=33093 then
                if ec>18248 then
                    if ec<=23925 then
                        if ec<=22413 then
                            if ec>21127 then
                                if ec<22396 then
                                    if ec<=21745 then
                                        if(V>=0 and r_>l_)or((V<0 or V~=V)and r_<l_)then
                                            ec=ma[-7732]or q(121007,10579,-7732)
                                        else
                                            ec=43387
                                        end
                                    else
                                        pb=nil;
                                        ec=10141
                                    end
                                elseif ec>22396 then
                                    V=sc('c'..r_,G,Bc);
                                    Bc=Bc+r_;
                                    ec=ma[-31652]or q(103336,52362,-31652)
                                else
                                    P=E(B,22);
                                    ec=14105
                                    continue
                                end
                            elseif ec>=20861 then
                                if ec<20999 then
                                    oa=E(ra,22);
                                    ec=ma[12040]or q(123777,2297,12040)
                                    continue
                                elseif ec<=20999 then
                                    P=nil;
                                    ec=ma[-24045]or q(1415,36131,-24045)
                                else
                                    B[17713]=ya[B[59442]+1];
                                    ec=ma[4595]or q(20970,54942,4595)
                                end
                            elseif ec>19941 then
                                T=T+B;
                                ta=T
                                if T~=T then
                                    ec=ma[11160]or q(46065,48574,11160)
                                else
                                    ec=ma[17870]or q(120468,5357,17870)
                                end
                            else
                                P=T;
                                B=Cb(P,255);
                                ta=fb[28596][B+1];
                                yb,ia,Ua=ta[1],ta[2],ta[3];
                                r_={[59089]=0,[49655]=ia,[7953]=0,[12361]=0,[23109]=0,[59442]=0,[9179]=0,[711]=0,[55927]=B,[42692]=0,[656]=nil,[17713]=0,[31589]=0,[49807]=0,[42020]=0};
                                ca(fc,r_)
                                if yb==10 then
                                    ec=ma[-23829]or q(19675,59745,-23829)
                                    continue
                                elseif yb==0 then
                                    ec=ma[29723]or q(125970,11419,29723)
                                    continue
                                elseif yb==2 then
                                    ec=ma[-30769]or q(110106,20018,-30769)
                                    continue
                                end
                                ec=63879
                            end
                        elseif ec<23580 then
                            if ec<22774 then
                                ra,Qb=oa,nil;
                                ec=37434
                            elseif ec<=22774 then
                                l_=nil;
                                ec=22413
                            else
                                Sa=fc
                                if aa~=aa then
                                    ec=ma[-3108]or q(24336,61560,-3108)
                                else
                                    ec=46580
                                end
                            end
                        elseif ec>=23905 then
                            if ec>23905 then
                                r_[42020]=Cb(p(P,8),255);
                                l_=Cb(p(P,16),65535);
                                r_[7953]=l_;
                                V=nil;
                                V=if l_<32768 then l_ else l_-65536;
                                r_[59442]=V;
                                ec=ma[-16476]or q(120672,37470,-16476)
                            else
                                r_[42020]=Cb(p(P,8),255);
                                r_[9179]=Cb(p(P,16),255);
                                r_[31589]=Cb(p(P,24),255);
                                ec=ma[8105]or q(109881,55281,8105)
                            end
                        elseif ec<=23580 then
                            if(pb>=0 and ya>Nb)or((pb<0 or pb~=pb)and ya<Nb)then
                                ec=ma[-13117]or q(121007,56397,-13117)
                            else
                                ec=ma[940]or q(6357,10645,940)
                            end
                        else
                            x=E(rb,22);
                            ec=ma[17188]or q(8998,64504,17188)
                            continue
                        end
                    elseif ec<=27167 then
                        if ec<25621 then
                            if ec>=24763 then
                                if ec>24763 then
                                    pb,T,Nb=jb,1,1;
                                    ec=24145
                                else
                                    yb=P
                                    if B~=B then
                                        ec=ma[-17006]or q(4415,40758,-17006)
                                    else
                                        ec=65406
                                    end
                                end
                            elseif ec>24145 then
                                if aa then
                                    ec=ma[-24477]or q(104428,9831,-24477)
                                    continue
                                else
                                    ec=ma[-29708]or q(37515,47927,-29708)
                                    continue
                                end
                                ec=ma[21435]or q(130828,55816,21435)
                            else
                                P=Nb
                                if pb~=pb then
                                    ec=ma[-20577]or q(124736,54785,-20577)
                                else
                                    ec=32448
                                end
                            end
                        elseif ec>=26681 then
                            if ec>26681 then
                                l_=E(V,-439437599);
                                ec=ma[-5927]or q(15537,13998,-5927)
                                continue
                            else
                                ta=B
                                if ta==4 then
                                    ec=ma[-20009]or q(94794,23412,-20009)
                                    continue
                                elseif ta==6 then
                                    ec=ma[-9635]or q(97608,29475,-9635)
                                    continue
                                elseif ta==3 then
                                    ec=ma[16148]or q(102349,12107,16148)
                                    continue
                                elseif ta==2 then
                                    ec=ma[-16885]or q(113783,15705,-16885)
                                    continue
                                end
                                ec=ma[-6809]or q(18787,8056,-6809)
                            end
                        elseif ec<=25621 then
                            Ga=E(jb,1016237761);
                            ec=1786
                            continue
                        else
                            ia=yb;
                            pb=h(pb,Zb(Cb(ia,127),ta*7))
                            if not Gb(ia,128)then
                                ec=ma[-22497]or q(112594,32250,-22497)
                                continue
                            end
                            ec=ma[825]or q(35348,39751,825)
                        end
                    elseif ec<=31099 then
                        if ec>30929 then
                            Sa=0;
                            ya,pb,Nb=0,1,4;
                            ec=ma[-13459]or q(86137,31763,-13459)
                        elseif ec>=27926 then
                            if ec>27926 then
                                ec=ma[-14220]or q(129367,26392,-14220)
                                continue
                            else
                                yb=nil;
                                ec=ma[-1331]or q(29273,14061,-1331)
                            end
                        else
                            lb=E(ab,22);
                            ec=16845
                            continue
                        end
                    elseif ec<=32558 then
                        if ec<=32448 then
                            if(T>=0 and Nb>pb)or((T<0 or T~=T)and Nb<pb)then
                                ec=44542
                            else
                                ec=ma[19232]or q(129468,54488,19232)
                            end
                        else
                            if(B>=0 and T>P)or((B<0 or B~=B)and T<P)then
                                ec=ma[24070]or q(48939,47476,24070)
                            else
                                ec=ma[-32605]or q(6890,52055,-32605)
                            end
                        end
                    else
                        d_=sc('B',G,Bc);
                        Bc=Bc+1;
                        ec=ma[32254]or q(110728,53112,32254)
                    end
                elseif ec<=10141 then
                    if ec>=4978 then
                        if ec>6156 then
                            if ec>=7491 then
                                if ec>7491 then
                                    T=nil;
                                    ec=ma[-28498]or q(99098,28305,-28498)
                                else
                                    ta=sc('B',G,Bc);
                                    Bc=Bc+1;
                                    ec=50249
                                end
                            elseif ec>6690 then
                                Ra=nil;
                                ec=31099
                            else
                                jb=0;
                                aa,Ra,fc=4,1,0;
                                ec=23555
                            end
                        elseif ec>=6142 then
                            if ec>6151 then
                                ya=nil;
                                ec=59217
                            elseif ec<=6142 then
                                r_,l_=Cb(p(yb,10),1023),Cb(p(yb,0),1023);
                                B[59089]=ya[r_+1];
                                B[42692]=ya[l_+1];
                                ec=ma[1486]or q(5802,10718,1486)
                            else
                                B[17713]=Rb(B[711],0,16);
                                ec=ma[-30077]or q(2128,3904,-30077)
                            end
                        elseif ec<=4978 then
                            lb=nil;
                            ec=ma[17761]or q(27682,9224,17761)
                        else
                            ya[P]=yb;
                            ec=ma[31187]or q(4098,22189,31187)
                        end
                    elseif ec<=2323 then
                        if ec<984 then
                            if ec>371 then
                                yb=kb(ia[1],1,ia[2]);
                                ec=ma[-29243]or q(13356,7055,-29243)
                            else
                                ia=sc('B',G,Bc);
                                Bc=Bc+1;
                                ec=ma[8266]or q(79177,20031,8266)
                            end
                        elseif ec<=1786 then
                            if ec>984 then
                                jb=Ga;
                                fc,aa=Fb(jb),false;
                                Ra,Sa,ya=1,jb,1;
                                ec=ma[-31710]or q(95893,30590,-31710)
                            else
                                Nb=Nb+T;
                                P=Nb
                                if Nb~=Nb then
                                    ec=25439
                                else
                                    ec=ma[9208]or q(48857,44841,9208)
                                end
                            end
                        else
                            ab=sc('B',G,Bc);
                            Bc=Bc+1;
                            ec=27384
                        end
                    elseif ec>4373 then
                        V=sc('<I4',G,Bc);
                        Bc=Bc+4;
                        ec=27167
                    elseif ec<=2429 then
                        ec=ma[3766]or q(25916,39532,3766)
                        continue
                    else
                        if(Ab>=0 and l_>V)or((Ab<0 or Ab~=Ab)and l_<V)then
                            ec=ma[18424]or q(17241,38048,18424)
                        else
                            ec=ma[22330]or q(119921,33735,22330)
                        end
                    end
                elseif ec>=14399 then
                    if ec<=15664 then
                        if ec>15365 then
                            if ec<=15608 then
                                Nb=E(pb,1016237761);
                                ec=14054
                                continue
                            else
                                B=nil;
                                ec=ma[7080]or q(52924,44734,7080)
                            end
                        elseif ec>14957 then
                            ia=ha'';
                            ec=ma[-24425]or q(36727,62172,-24425)
                            continue
                        elseif ec<=14399 then
                            ia=ha(l_);
                            ec=12828
                            continue
                        else
                            aa=pb;
                            ec=ma[-2289]or q(15901,39707,-2289)
                        end
                    elseif ec<=17357 then
                        if ec>16845 then
                            Nb=Nb+T;
                            P=Nb
                            if Nb~=Nb then
                                ec=ma[-25829]or q(130959,61130,-25829)
                            else
                                ec=32448
                            end
                        else
                            ab,oa=lb,nil;
                            ec=47863
                        end
                    else
                        V=l_;
                        r_[711]=V;
                        ca(fc,{});
                        ec=ma[-29533]or q(84835,16634,-29533)
                    end
                elseif ec<12828 then
                    if ec<12340 then
                        if ec<=11053 then
                            ta=T
                            if P~=P then
                                ec=ma[-585]or q(47622,47689,-585)
                            else
                                ec=32558
                            end
                        else
                            if(T>=0 and Nb>pb)or((T<0 or T~=T)and Nb<pb)then
                                ec=25439
                            else
                                ec=ma[-18720]or q(121939,22564,-18720)
                            end
                        end
                    elseif ec>12340 then
                        r_=0;
                        Ab,V,l_=1,4,0;
                        ec=ma[19853]or q(130582,52482,19853)
                    else
                        ia=Ua;
                        ec=51604
                        continue
                    end
                elseif ec>14105 then
                    l_=l_+Ab;
                    x=l_
                    if l_~=l_ then
                        ec=ma[759]or q(18171,44742,759)
                    else
                        ec=ma[-2585]or q(41166,61618,-2585)
                    end
                elseif ec>14054 then
                    B=P;
                    Sa=h(Sa,Zb(Cb(B,127),T*7))
                    if not Gb(B,128)then
                        ec=ma[-7487]or q(122153,62447,-7487)
                        continue
                    end
                    ec=ma[31335]or q(21283,43774,31335)
                elseif ec<=12828 then
                    yb=kb(ia[1],1,ia[2]);
                    ec=ma[-32397]or q(130769,17962,-32397)
                else
                    pb=Nb;
                    T=Fb(pb);
                    B,P,ta=pb,1,1;
                    ec=24763
                end
            elseif ec>=50249 then
                if ec>=56934 then
                    if ec<61115 then
                        if ec<59217 then
                            if ec>=57690 then
                                if ec>57690 then
                                    ec=ma[-2913]or q(92202,28614,-2913)
                                    continue
                                else
                                    r_=Ua
                                    if r_==0 then
                                        ec=ma[-27287]or q(8966,11386,-27287)
                                        continue
                                    else
                                        ec=ma[-26243]or q(43371,45878,-26243)
                                        continue
                                    end
                                    ec=ma[12701]or q(13283,42718,12701)
                                end
                            elseif ec>56934 then
                                Ua=sc('<d',G,Bc);
                                Bc=Bc+8;
                                ec=12340
                            else
                                Qb=E(bc,22);
                                ec=34527
                                continue
                            end
                        elseif ec>60465 then
                            r_=Cb(p(yb,10),1023);
                            B[59089]=ya[r_+1];
                            ec=ma[10677]or q(18565,53055,10677)
                        elseif ec<=60443 then
                            if ec<=59217 then
                                Nb=sc('B',G,Bc);
                                Bc=Bc+1;
                                ec=ma[6193]or q(73113,22834,6193)
                            else
                                l_=V;
                                ec=ma[25508]or q(125190,20992,25508)
                                continue
                            end
                        else
                            rb=nil;
                            ec=33093
                        end
                    elseif ec<=65252 then
                        if ec<=63414 then
                            if ec>61401 then
                                pb=0;
                                P,T,B=4,0,1;
                                ec=11053
                            elseif ec>61115 then
                                T[yb]=Kb();
                                ec=ma[16455]or q(2996,53426,16455)
                            else
                                B[17713]=ya[B[711]+1];
                                ec=ma[5574]or q(11470,9210,5574)
                            end
                        elseif ec>63879 then
                            ya=E(Nb,22);
                            ec=54609
                            continue
                        else
                            if Ua then
                                ec=ma[12287]or q(9551,64667,12287)
                                continue
                            end
                            ec=ma[-32642]or q(127200,34885,-32642)
                        end
                    elseif ec<=65406 then
                        if ec<=65370 then
                            Ua=0;
                            r_,l_,V=0,4,1;
                            ec=ma[22365]or q(7981,63675,22365)
                        else
                            if(ta>=0 and P>B)or((ta<0 or ta~=ta)and P<B)then
                                ec=48458
                            else
                                ec=ma[-6548]or q(96434,11218,-6548)
                            end
                        end
                    else
                        P=Nb
                        if pb~=pb then
                            ec=ma[8397]or q(4945,14321,8397)
                        else
                            ec=ma[11212]or q(47578,37932,11212)
                        end
                    end
                elseif ec<=52109 then
                    if ec>=50880 then
                        if ec>=51234 then
                            if ec<51604 then
                                pb=Ua;
                                ec=ma[29612]or q(27793,54691,29612)
                                continue
                            elseif ec<=51604 then
                                yb=ia;
                                ec=ma[13621]or q(24475,8560,13621)
                            else
                                rb=E(d_,22);
                                ec=ma[4642]or q(100748,17315,4642)
                                continue
                            end
                        elseif ec>50880 then
                            yb=E(ia,22);
                            ec=ma[12776]or q(121779,32089,12776)
                            continue
                        else
                            B[17713]=ya[B[23109]+1];
                            ec=ma[-8918]or q(32089,62027,-8918)
                        end
                    elseif ec<=50468 then
                        if ec<50277 then
                            B=E(ta,22);
                            ec=26681
                            continue
                        elseif ec>50277 then
                            ia=nil;
                            ec=56958
                        else
                            Ra=E(Sa,1016237761);
                            ec=50818
                            continue
                        end
                    else
                        Sa=Ra;
                        ya=Fb(Sa);
                        T,pb,Nb=1,Sa,1;
                        ec=ma[-2354]or q(76464,26915,-2354)
                    end
                elseif ec<=56549 then
                    if ec>=55274 then
                        if ec<=55274 then
                            fc=fc+Ra;
                            Sa=fc
                            if fc~=fc then
                                ec=ma[-30360]or q(36560,41400,-30360)
                            else
                                ec=46580
                            end
                        else
                            T=ya
                            if Nb~=Nb then
                                ec=ma[19143]or q(8195,42969,19143)
                            else
                                ec=ma[4746]or q(119578,31865,4746)
                            end
                        end
                    elseif ec<=52556 then
                        aa=false;
                        ec=ma[10310]or q(7114,59202,10310)
                    else
                        Nb=ya;
                        jb=h(jb,Zb(Cb(Nb,127),Sa*7))
                        if not Gb(Nb,128)then
                            ec=ma[-23263]or q(6209,20611,-23263)
                            continue
                        end
                        ec=ma[-1900]or q(82619,27082,-1900)
                    end
                elseif ec<56890 then
                    T=E(P,-439437599);
                    ec=ma[25576]or q(28894,36338,25576)
                    continue
                elseif ec<=56890 then
                    ec=ma[-22268]or q(106432,25198,-22268)
                    continue
                else
                    ia=ha(nil);
                    ec=ma[31654]or q(127142,57627,31654)
                end
            elseif ec>38975 then
                if ec>=45446 then
                    if ec>=47863 then
                        if ec>48540 then
                            yb=nil;
                            ec=ma[-5993]or q(40648,58915,-5993)
                        elseif ec<48458 then
                            ra=sc('B',G,Bc);
                            Bc=Bc+1;
                            ec=20861
                        elseif ec>48458 then
                            Nb=Ra
                            if Sa~=Sa then
                                ec=ma[28499]or q(40003,64213,28499)
                            else
                                ec=45516
                            end
                        else
                            return{[11337]=bc,[15791]=ab,[48957]=ra,[21958]=T,[59769]=fc,[23284]=''}
                        end
                    elseif ec>46580 then
                        B=sc('B',G,Bc);
                        Bc=Bc+1;
                        ec=22396
                    elseif ec>45516 then
                        if(Ra>=0 and fc>aa)or((Ra<0 or Ra~=Ra)and fc<aa)then
                            ec=ma[30845]or q(116535,30821,30845)
                        else
                            ec=ma[32708]or q(11948,30183,32708)
                        end
                    elseif ec<=45446 then
                        Ua=nil;
                        ec=12461
                    else
                        if(ya>=0 and Ra>Sa)or((ya<0 or ya~=ya)and Ra<Sa)then
                            ec=6961
                        else
                            ec=ma[-23304]or q(9629,50919,-23304)
                        end
                    end
                elseif ec<40113 then
                    if ec>=39489 then
                        if ec>39489 then
                            P=sc('<I4',G,Bc);
                            Bc=Bc+4;
                            ec=56825
                        else
                            Ra=Ra+ya;
                            Nb=Ra
                            if Ra~=Ra then
                                ec=ma[-15702]or q(130007,18337,-15702)
                            else
                                ec=ma[-10321]or q(123780,54847,-10321)
                            end
                        end
                    else
                        B[17713]=Rb(B[711],0,1)==1;
                        B[12361]=Rb(B[711],31,1)==1;
                        ec=ma[29328]or q(1131,6937,29328)
                    end
                elseif ec<44513 then
                    if ec>40113 then
                        x=nil;
                        ec=ma[28795]or q(104774,28277,28795)
                    else
                        Ab=r_
                        if l_~=l_ then
                            ec=ma[-11743]or q(15449,36033,-11743)
                        else
                            ec=ma[-7528]or q(112811,19709,-7528)
                        end
                    end
                elseif ec<=44513 then
                    B=fc[P];
                    ta=B[49655]
                    if ta==1 then
                        ec=ma[15296]or q(122820,36814,15296)
                        continue
                    elseif ta==0 then
                        ec=ma[30382]or q(23701,42573,30382)
                        continue
                    elseif ta==9 then
                        ec=ma[-17237]or q(98318,26634,-17237)
                        continue
                    elseif ta==5 then
                        ec=ma[-14692]or q(93408,26343,-14692)
                        continue
                    elseif ta==2 then
                        ec=ma[326]or q(27280,12750,326)
                        continue
                    elseif ta==10 then
                        ec=ma[28498]or q(19653,53765,28498)
                        continue
                    end
                    ec=ma[31767]or q(20530,54950,31767)
                else
                    Nb=nil;
                    ec=63414
                end
            elseif ec<37207 then
                if ec>=35176 then
                    if ec<35884 then
                        if ec>35176 then
                            l_=nil;
                            ec=4416
                        else
                            d_=rb;
                            r_=h(r_,Zb(Cb(d_,127),x*7))
                            if not Gb(d_,128)then
                                ec=ma[27731]or q(25213,48598,27731)
                                continue
                            end
                            ec=ma[-21128]or q(14714,11697,-21128)
                        end
                    elseif ec>35884 then
                        x=l_
                        if V~=V then
                            ec=ma[9197]or q(109278,29219,9197)
                        else
                            ec=ma[-1284]or q(14747,3009,-1284)
                        end
                    else
                        ec=ma[-16643]or q(122693,8532,-16643)
                        continue
                    end
                elseif ec<=34527 then
                    if ec>34406 then
                        bc,Ga=Qb,nil;
                        ec=6690
                    elseif ec<=33202 then
                        l_,V=Cb(p(P,8),16777215),nil;
                        V=if l_<8388608 then l_ else l_-16777216;
                        r_[23109]=V;
                        ec=ma[-9111]or q(111467,63911,-9111)
                    else
                        ya=ya+pb;
                        T=ya
                        if ya~=ya then
                            ec=ma[-20925]or q(112577,51483,-20925)
                        else
                            ec=23580
                        end
                    end
                else
                    rb=x;
                    Ua=h(Ua,Zb(Cb(rb,127),Ab*7))
                    if not Gb(rb,128)then
                        ec=ma[31959]or q(97894,8175,31959)
                        continue
                    end
                    ec=ma[-6779]or q(2503,55613,-6779)
                end
            elseif ec<38070 then
                if ec>=37517 then
                    if ec<=37517 then
                        r_=r_+V;
                        Ab=r_
                        if r_~=r_ then
                            ec=ma[-32165]or q(115755,5335,-32165)
                        else
                            ec=ma[-15724]or q(112209,24167,-15724)
                        end
                    else
                        rb=sc('B',G,Bc);
                        Bc=Bc+1;
                        ec=ma[15660]or q(130207,6148,15660)
                    end
                elseif ec<=37207 then
                    ia=ha(E(Ua,1016237761));
                    ec=907
                    continue
                else
                    bc=sc('B',G,Bc);
                    Bc=Bc+1;
                    ec=56934
                end
            elseif ec>38543 then
                P=P+ta;
                yb=P
                if P~=P then
                    ec=ma[12094]or q(121477,55992,12094)
                else
                    ec=65406
                end
            elseif ec<38359 then
                Ua=E(r_,1016237761);
                ec=57690
                continue
            elseif ec>38359 then
                yb=B[711];
                ia,Ua=p(yb,30),Cb(p(yb,20),1023);
                B[17713]=ya[Ua+1];
                B[49807]=ia
                if ia==2 then
                    ec=ma[-22791]or q(111795,57634,-22791)
                    continue
                elseif ia==3 then
                    ec=ma[16502]or q(9630,3803,16502)
                    continue
                end
                ec=ma[-7617]or q(21297,55203,-7617)
            else
                ia=ha(nil);
                ec=ma[-10662]or q(75981,27504,-10662)
            end
        until ec==62103
    end
    local Ea=Kb();
    fb[10508][G]=Ea
    return Ea
end)
local Oa=(function(Za,k)
    Za=a_(Za)
    local Ca=_a()
    local function C(zc,vc)
        local Ec=(function(...)
            return{...},Ya('#',...)
        end)
        local qb;
        qb=(function(bb,ga,Eb)
            if ga>Eb then
                return
            end
            return bb[ga],qb(bb,ga+1,Eb)
        end)
        local function nc(L,hc,Ib,A)
            local sb,y,Wa,s_,c,Cc,ob,_c,Va,e_,U,Tb,f_,Da,j,W,Q,nb,hb,Pa,M,qa,ea,Xa;
            M,y={},function(eb,Ka,D)
                M[Ka]=v(D,16755)-v(eb,36611)
                return M[Ka]
            end;
            ea=M[-2579]or y(56889,-2579,91403)
            repeat
                if ea<33130 then
                    if ea<=17748 then
                        if ea>9776 then
                            if ea<=13386 then
                                if ea>=12189 then
                                    if ea<=12880 then
                                        if ea<=12849 then
                                            if ea>=12833 then
                                                if ea<=12833 then
                                                    Pa=Pa+Da;
                                                    Va=Pa
                                                    if Pa~=Pa then
                                                        ea=M[11018]or y(27343,11018,87125)
                                                    else
                                                        ea=M[-7970]or y(17154,-7970,71861)
                                                    end
                                                else
                                                    Cc,W=nil,L[Xa[42020]];
                                                    Cc=wc(W)=='function'
                                                    if not Cc then
                                                        ea=M[12687]or y(58502,12687,16207)
                                                        continue
                                                    end
                                                    ea=M[15916]or y(2239,15916,52637)
                                                end
                                            else
                                                e_=Pa;
                                                ea=59119
                                                continue
                                            end
                                        else
                                            Pa=Pa..Aa(E(ka(_c,Wa+1),ka(Q,Wa%#Q+1)));
                                            ea=M[7970]or y(6573,7970,47377)
                                        end
                                    elseif ea<=13028 then
                                        if f_>190 then
                                            ea=M[-23634]or y(5800,-23634,97818)
                                            continue
                                        else
                                            ea=M[18090]or y(37402,18090,63989)
                                            continue
                                        end
                                        ea=M[-5251]or y(20270,-5251,44788)
                                    else
                                        sb-=1;
                                        Ib[sb]={[55927]=106,[42020]=E(Xa[42020],247),[9179]=E(Xa[9179],189),[31589]=0};
                                        ea=M[4920]or y(38675,4920,1561)
                                    end
                                elseif ea<=11565 then
                                    if ea>=10983 then
                                        if ea<=10983 then
                                            Pa=e_
                                            if _c~=_c then
                                                ea=M[16606]or y(43840,16606,4846)
                                            else
                                                ea=M[20727]or y(17328,20727,79247)
                                            end
                                        else
                                            U[Pa]=vc[s_[9179]+1];
                                            ea=M[27979]or y(57636,27979,59457)
                                        end
                                    elseif ea<=10394 then
                                        if f_>124 then
                                            ea=M[11559]or y(58082,11559,59737)
                                            continue
                                        else
                                            ea=M[-15886]or y(27903,-15886,74875)
                                            continue
                                        end
                                        ea=M[-15868]or y(54885,-15868,51635)
                                    else
                                        if f_>233 then
                                            ea=M[16120]or y(24388,16120,91831)
                                            continue
                                        else
                                            ea=M[31820]or y(31540,31820,128986)
                                            continue
                                        end
                                        ea=M[-25716]or y(45647,-25716,11733)
                                    end
                                elseif ea<=11682 then
                                    if f_>161 then
                                        ea=M[31445]or y(19982,31445,118947)
                                        continue
                                    else
                                        ea=M[25059]or y(42434,25059,4648)
                                        continue
                                    end
                                    ea=M[-9117]or y(52442,-9117,12864)
                                else
                                    if not hb then
                                        ea=M[-13410]or y(47138,-13410,15622)
                                        continue
                                    end
                                    ea=M[-19257]or y(15030,-19257,33548)
                                end
                            elseif ea<=14921 then
                                if ea<13651 then
                                    if ea>=13427 then
                                        if ea<=13427 then
                                            sb+=1;
                                            ea=M[-8239]or y(2971,-8239,62081)
                                        else
                                            Q[Va]=Tb;
                                            ea=M[2254]or y(27455,2254,87854)
                                        end
                                    else
                                        W,U,e_=Cc.__iter(W);
                                        ea=M[-17782]or y(22709,-17782,126872)
                                    end
                                elseif ea<=14261 then
                                    if ea>13651 then
                                        sb+=1;
                                        ea=M[-26683]or y(55522,-26683,50760)
                                    else
                                        L[Xa[42020]]=U[Xa[59089]][Xa[42692]];
                                        ea=M[2352]or y(17308,2352,82017)
                                    end
                                else
                                    if f_>155 then
                                        ea=M[31241]or y(23049,31241,95104)
                                        continue
                                    else
                                        ea=M[-3669]or y(10480,-3669,93278)
                                        continue
                                    end
                                    ea=M[-14485]or y(28561,-14485,85663)
                                end
                            elseif ea>16822 then
                                if ea>17406 then
                                    Xa=Ib[sb];
                                    f_=Xa[55927];
                                    ea=M[-1975]or y(40488,-1975,23686)
                                else
                                    Cc,W,U=Xa[31589],Xa[9179],Xa[42020]-1
                                    if U==-1 then
                                        ea=M[-30005]or y(27161,-30005,127459)
                                        continue
                                    end
                                    ea=24714
                                end
                            elseif ea>15115 then
                                if f_>66 then
                                    ea=M[-16626]or y(51365,-16626,11042)
                                    continue
                                else
                                    ea=M[-28232]or y(46955,-28232,86425)
                                    continue
                                end
                                ea=M[-7397]or y(61117,-7397,53355)
                            elseif ea<=15097 then
                                sb+=Xa[59442];
                                ea=M[21665]or y(10215,21665,39245)
                            else
                                e_=e_+Q;
                                Pa=e_
                                if e_~=e_ then
                                    ea=M[5229]or y(31660,5229,91514)
                                else
                                    ea=M[-27530]or y(37782,-27530,34221)
                                end
                            end
                        elseif ea>=5474 then
                            if ea>8239 then
                                if ea>9699 then
                                    if ea>9766 then
                                        xa(Q);
                                        ea=M[19196]or y(27973,19196,114783)
                                    else
                                        Cc,W=nil,E(Xa[7953],27957);
                                        Cc=if W<32768 then W else W-65536;
                                        U=Cc;
                                        e_=hc[U+1];
                                        _c=e_[11337];
                                        Q=Fb(_c);
                                        L[E(Xa[42020],82)]=C(e_,Q);
                                        s_,Da,Pa=_c,1,1;
                                        ea=M[-20916]or y(29877,-20916,90346)
                                    end
                                elseif ea>8875 then
                                    Va=Pa
                                    if s_~=s_ then
                                        ea=M[-2378]or y(20277,-2378,44771)
                                    else
                                        ea=M[-23474]or y(49846,-23474,39433)
                                    end
                                elseif ea<=8821 then
                                    e_,_c=W[17713],Xa[17713];
                                    _c='~^+\171i\152k\234'.._c;
                                    Q='';
                                    Da,Pa,s_=1,0,#e_-1;
                                    ea=M[17356]or y(54421,17356,43898)
                                else
                                    if f_>88 then
                                        ea=M[-31191]or y(37240,-31191,31362)
                                        continue
                                    else
                                        ea=M[-29313]or y(46735,-29313,87469)
                                        continue
                                    end
                                    ea=M[-10549]or y(59255,-10549,54973)
                                end
                            elseif ea<6833 then
                                if ea>5580 then
                                    c=Cc+Pa-1;
                                    ea=M[22508]or y(20942,22508,73856)
                                elseif ea<=5474 then
                                    L[Xa[42020]]=nil;
                                    ea=M[-21448]or y(34171,-21448,30881)
                                else
                                    L[Xa[42020]]=L[Xa[9179]];
                                    ea=M[-16871]or y(36866,-16871,3880)
                                end
                            elseif ea>7542 then
                                Q,Pa=W[42692],Xa[42692];
                                Pa='~^+\171i\152k\234'..Pa;
                                s_='';
                                Va,Da,Wa=#Q-1,0,1;
                                ea=M[-32291]or y(55612,-32291,67152)
                            elseif ea<=7149 then
                                if ea<=6833 then
                                    L[Xa[9179]]=Fb(Xa[711]);
                                    sb+=1;
                                    ea=M[-28972]or y(20210,-28972,45112)
                                else
                                    sb+=Xa[59442];
                                    ea=M[18041]or y(21351,18041,84685)
                                end
                            else
                                if f_>92 then
                                    ea=M[-15207]or y(28666,-15207,126812)
                                    continue
                                else
                                    ea=M[-22737]or y(7886,-22737,55836)
                                    continue
                                end
                                ea=M[17553]or y(37931,17553,3057)
                            end
                        elseif ea>=3279 then
                            if ea<=4218 then
                                if ea<=3757 then
                                    if ea<=3379 then
                                        if ea<=3279 then
                                            Da=Q
                                            if Pa~=Pa then
                                                ea=M[-20198]or y(64975,-20198,47917)
                                            else
                                                ea=42936
                                            end
                                        else
                                            sb-=1;
                                            Ib[sb]={[55927]=91,[42020]=E(Xa[42020],204),[9179]=E(Xa[9179],233),[31589]=0};
                                            ea=M[18826]or y(49143,18826,8509)
                                        end
                                    else
                                        W,U,e_=nb
                                        if Ia(W)~='function'then
                                            ea=M[9910]or y(18948,9910,119003)
                                            continue
                                        end
                                        ea=M[-31859]or y(28704,-31859,104235)
                                    end
                                else
                                    Va={[1]=L[s_[9179]],[2]=1};
                                    Va[3]=Va;
                                    U[Pa]=Va;
                                    ea=M[10838]or y(20911,10838,88260)
                                end
                            elseif ea<=4632 then
                                if f_>26 then
                                    ea=M[5130]or y(63806,5130,53661)
                                    continue
                                else
                                    ea=M[24313]or y(55765,24313,47284)
                                    continue
                                end
                                ea=M[-7536]or y(28344,-7536,86118)
                            else
                                xa'';
                                ea=M[-23638]or y(35159,-23638,19189)
                            end
                        elseif ea>2773 then
                            if ea>2810 then
                                hb=false;
                                sb+=1
                                if f_>94 then
                                    ea=M[-3994]or y(39564,-3994,578)
                                    continue
                                else
                                    ea=M[4755]or y(64730,4755,62716)
                                    continue
                                end
                                ea=M[25775]or y(3751,25775,61837)
                            else
                                e_=nil;
                                ea=29146
                            end
                        elseif ea<2466 then
                            if ea>1330 then
                                Cc,W=Xa[42020],Xa[9179]-1
                                if W==-1 then
                                    ea=M[-10434]or y(29559,-10434,79954)
                                    continue
                                end
                                ea=45112
                            else
                                sb+=Xa[59442];
                                ea=M[-30558]or y(57267,-30558,49529)
                            end
                        elseif ea<=2466 then
                            if f_>91 then
                                ea=M[27759]or y(60718,27759,34254)
                                continue
                            else
                                ea=M[-16927]or y(40983,-16927,91410)
                                continue
                            end
                            ea=M[4635]or y(16168,4635,40694)
                        else
                            W,U,e_=Cc.__iter(W);
                            ea=M[-12131]or y(29141,-12131,99144)
                        end
                    elseif ea>25450 then
                        if ea<=29561 then
                            if ea<28585 then
                                if ea<26995 then
                                    if ea<=26309 then
                                        if ea>26225 then
                                            Cc,W=Xa[49807],Xa[17713];
                                            U=Ca[W]or fb[60300][W]
                                            if Cc==1 then
                                                ea=M[501]or y(50357,501,33471)
                                                continue
                                            elseif Cc==2 then
                                                ea=M[30465]or y(6755,30465,81696)
                                                continue
                                            elseif Cc==3 then
                                                ea=M[26365]or y(51966,26365,14883)
                                                continue
                                            end
                                            ea=13427
                                        else
                                            Wa=s_
                                            if Da~=Da then
                                                ea=M[20510]or y(28203,20510,86454)
                                            else
                                                ea=M[2866]or y(2966,2866,87774)
                                            end
                                        end
                                    else
                                        _c=_c..Aa(E(ka(U,Da+1),ka(e_,Da%#e_+1)));
                                        ea=M[-9740]or y(12492,-9740,123623)
                                    end
                                elseif ea>27220 then
                                    Tb={[2]=ob,[3]=L};
                                    nb[ob]=Tb;
                                    ea=M[-13936]or y(36703,-13936,30095)
                                elseif ea<=26995 then
                                    ob={[1]=L[Wa[9179]],[2]=1};
                                    ob[3]=ob;
                                    Q[Va]=ob;
                                    ea=M[-30456]or y(9631,-30456,40398)
                                else
                                    W[17713]=U
                                    if Cc==2 then
                                        ea=M[8719]or y(59110,8719,42602)
                                        continue
                                    elseif Cc==3 then
                                        ea=M[-19630]or y(36819,-19630,19129)
                                        continue
                                    end
                                    ea=M[20149]or y(12579,20149,94889)
                                end
                            elseif ea<28931 then
                                if ea<28813 then
                                    Cc=Xa[12361]
                                    if(L[Xa[42020]]==nil)~=Cc then
                                        ea=M[2699]or y(39127,2699,14194)
                                        continue
                                    else
                                        ea=M[-5847]or y(59552,-5847,70559)
                                        continue
                                    end
                                    ea=M[-26394]or y(7818,-26394,33168)
                                elseif ea<=28813 then
                                    if f_>172 then
                                        ea=M[26564]or y(62208,26564,80455)
                                        continue
                                    else
                                        ea=M[-8607]or y(16151,-8607,49005)
                                        continue
                                    end
                                    ea=M[-2121]or y(43854,-2121,4820)
                                else
                                    W[59089]=e_;
                                    ea=M[31154]or y(24731,31154,74785)
                                end
                            elseif ea<29146 then
                                Q[1]=Q[3][Q[2]];
                                Q[3]=Q;
                                Q[2]=1;
                                nb[_c]=nil;
                                ea=M[-32571]or y(58610,-32571,67670)
                            elseif ea>29146 then
                                if f_>39 then
                                    ea=M[24713]or y(32773,24713,32531)
                                    continue
                                else
                                    ea=M[14738]or y(23265,14738,88211)
                                    continue
                                end
                                ea=M[14404]or y(7566,14404,32916)
                            else
                                _c,Q=W[59089],Xa[59089];
                                Q='~^+\171i\152k\234'..Q;
                                Pa='';
                                s_,Da,Va=0,#_c-1,1;
                                ea=26225
                            end
                        elseif ea>31597 then
                            if ea>=32202 then
                                if ea>32202 then
                                    if f_>121 then
                                        ea=M[27913]or y(47107,27913,43250)
                                        continue
                                    else
                                        ea=M[-11550]or y(60698,-11550,68435)
                                        continue
                                    end
                                    ea=M[-6076]or y(24460,-6076,48794)
                                else
                                    return qb(L,Cc,Cc+e_-1)
                                end
                            elseif ea>31917 then
                                e_=nil;
                                ea=53912
                            else
                                W=A[54777];
                                c=Cc+W-1;
                                ea=M[-12023]or y(55916,-12023,83156)
                            end
                        elseif ea>30943 then
                            if ea<=31140 then
                                Cc=Xa[17713];
                                L[Xa[31589]][Cc]=L[Xa[9179]];
                                sb+=1;
                                ea=M[-15274]or y(56234,-15274,50544)
                            else
                                Q[Va]=vc[Wa[9179]+1];
                                ea=M[-987]or y(59789,-987,55772)
                            end
                        elseif ea<=30742 then
                            if ea>30138 then
                                L[Xa[42020]]=U;
                                ea=M[25514]or y(50479,25514,16364)
                            elseif ea<=29880 then
                                W,U,e_=j
                                if Ia(W)~='function'then
                                    ea=M[5168]or y(394,5168,68041)
                                    continue
                                end
                                ea=M[-26309]or y(37788,-26309,41335)
                            else
                                Xa[55927]=66;
                                sb+=1;
                                ea=M[-31042]or y(30798,-31042,92116)
                            end
                        else
                            sb-=1;
                            Ib[sb]={[55927]=108,[42020]=E(Xa[42020],242),[9179]=E(Xa[9179],78),[31589]=0};
                            ea=M[15348]or y(47905,15348,8719)
                        end
                    elseif ea<=22175 then
                        if ea>=19978 then
                            if ea>=21789 then
                                if ea<=21860 then
                                    if ea>21789 then
                                        _c=s_;
                                        ea=37181
                                        continue
                                    else
                                        Cc,W=Xa[42020],Xa[17713];
                                        c=Cc+6;
                                        U,e_=L[Cc],nil;
                                        e_=wc(U)=='function'
                                        if e_ then
                                            ea=M[-10327]or y(52151,-10327,57528)
                                            continue
                                        else
                                            ea=M[3299]or y(63854,3299,36373)
                                            continue
                                        end
                                        ea=M[-31940]or y(18196,-31940,46594)
                                    end
                                else
                                    Cc,W,U=E(Xa[9179],18),E(Xa[31589],209),E(Xa[42020],44);
                                    e_,_c=W==0 and c-Cc or W-1,L[Cc];
                                    Q,Pa=Ec(_c(qb(L,Cc+1,Cc+e_)))
                                    if U==0 then
                                        ea=M[23967]or y(26412,23967,48749)
                                        continue
                                    else
                                        ea=M[32158]or y(15007,32158,88181)
                                        continue
                                    end
                                    ea=33574
                                end
                            elseif ea>20106 then
                                Q[1]=Q[3][Q[2]];
                                Q[3]=Q;
                                Q[2]=1;
                                nb[_c]=nil;
                                ea=M[26266]or y(48240,26266,84955)
                            elseif ea>19978 then
                                W,U,e_=Cc.__iter(W);
                                ea=M[-15330]or y(26644,-15330,99640)
                            else
                                if not L[Xa[42020]]then
                                    ea=M[4663]or y(59418,4663,58209)
                                    continue
                                end
                                ea=M[-12230]or y(50043,-12230,15009)
                            end
                        elseif ea>18850 then
                            if ea>18917 then
                                w_(Q);
                                j[_c]=nil;
                                ea=M[-3853]or y(28822,-3853,99209)
                            else
                                s_=s_+Va;
                                Wa=s_
                                if s_~=s_ then
                                    ea=M[11603]or y(5256,11603,68576)
                                else
                                    ea=M[28812]or y(11476,28812,67789)
                                end
                            end
                        elseif ea>=18394 then
                            if ea>18394 then
                                sb-=1;
                                Ib[sb]={[55927]=161,[42020]=E(Xa[42020],252),[9179]=E(Xa[9179],14),[31589]=0};
                                ea=M[-22129]or y(30244,-22129,92658)
                            else
                                ob=Wa[9179];
                                Tb=nb[ob]
                                if Tb==nil then
                                    ea=M[15068]or y(35169,15068,12863)
                                    continue
                                end
                                ea=13472
                            end
                        elseif ea<=17977 then
                            Cc,W=nil,E(Xa[7953],26202);
                            Cc=if W<32768 then W else W-65536;
                            U=Cc;
                            L[E(Xa[42020],58)]=U;
                            ea=M[-17605]or y(37745,-17605,2751)
                        else
                            if(Da>=0 and Pa>s_)or((Da<0 or Da~=Da)and Pa<s_)then
                                ea=M[8506]or y(60997,8506,63874)
                            else
                                ea=M[-9491]or y(6090,-9491,117280)
                            end
                        end
                    elseif ea>24109 then
                        if ea<=25012 then
                            if ea<24825 then
                                mc(L,W,W+U-1,Xa[711],L[Cc]);
                                sb+=1;
                                ea=M[-32526]or y(58513,-32526,56223)
                            elseif ea<=24825 then
                                sb-=1;
                                Ib[sb]={[55927]=123,[42020]=E(Xa[42020],156),[9179]=E(Xa[9179],69),[31589]=0};
                                ea=M[-12161]or y(6825,-12161,33911)
                            else
                                s_=s_+Va;
                                Wa=s_
                                if s_~=s_ then
                                    ea=M[15649]or y(34428,15649,30831)
                                else
                                    ea=M[-32619]or y(51295,-32619,39687)
                                end
                            end
                        elseif ea>25232 then
                            Pa=U-1;
                            ea=M[-20108]or y(53221,-20108,34175)
                        else
                            L[Xa[42020]]=Xa[17713];
                            ea=M[13899]or y(4515,13899,35977)
                        end
                    elseif ea>=23831 then
                        if ea>24041 then
                            sb+=Xa[59442];
                            ea=M[17679]or y(2133,17679,63427)
                        elseif ea>23831 then
                            if Xa[31589]==66 then
                                ea=M[8567]or y(15366,8567,96367)
                                continue
                            elseif Xa[31589]==188 then
                                ea=M[3633]or y(7882,3633,34656)
                                continue
                            elseif Xa[31589]==233 then
                                ea=M[-27320]or y(29659,-27320,79044)
                                continue
                            else
                                ea=M[8588]or y(47765,8588,2577)
                                continue
                            end
                            ea=M[-27478]or y(17240,-27478,47814)
                        else
                            _c={U(L[Cc+1],L[Cc+2])};
                            mc(_c,1,W,Cc+3,L)
                            if L[Cc+3]~=nil then
                                ea=M[6698]or y(55033,6698,87223)
                                continue
                            else
                                ea=M[5304]or y(40401,5304,86109)
                                continue
                            end
                            ea=M[-22597]or y(3290,-22597,62016)
                        end
                    elseif ea<22443 then
                        if L[Xa[42020]]==L[Xa[711]]then
                            ea=M[28974]or y(34302,28974,26521)
                            continue
                        else
                            ea=M[-19679]or y(27441,-19679,118402)
                            continue
                        end
                        ea=M[5534]or y(10409,5534,38519)
                    elseif ea>22443 then
                        _c,Q=rc(j[Xa],U,L[Cc+1],L[Cc+2])
                        if not _c then
                            ea=M[5862]or y(25610,5862,86090)
                            continue
                        end
                        ea=40678
                    else
                        U=Q;
                        ea=27220
                        continue
                    end
                elseif ea>50362 then
                    if ea>=57345 then
                        if ea>62090 then
                            if ea<63930 then
                                if ea>=62797 then
                                    if ea<=62846 then
                                        if ea<=62797 then
                                            if Xa[31589]==32 then
                                                ea=M[29226]or y(52054,29226,43048)
                                                continue
                                            elseif Xa[31589]==212 then
                                                ea=M[2525]or y(38407,2525,45186)
                                                continue
                                            else
                                                ea=M[-29794]or y(12451,-29794,114878)
                                                continue
                                            end
                                            ea=M[29078]or y(25528,29078,89446)
                                        else
                                            e_=c-Cc+1;
                                            ea=M[-23890]or y(63512,-23890,46486)
                                        end
                                    else
                                        if Xa[31589]==214 then
                                            ea=M[24570]or y(13180,24570,89099)
                                            continue
                                        else
                                            ea=M[-19657]or y(6855,-19657,59989)
                                            continue
                                        end
                                        ea=M[-1860]or y(64116,-1860,58786)
                                    end
                                elseif ea>62394 then
                                    s_=Ib[sb];
                                    sb+=1;
                                    Da=s_[42020]
                                    if Da==0 then
                                        ea=M[10162]or y(3331,10162,54025)
                                        continue
                                    elseif Da==2 then
                                        ea=M[-17880]or y(18411,-17880,46950)
                                        continue
                                    end
                                    ea=M[3172]or y(12667,3172,47344)
                                else
                                    if f_>60 then
                                        ea=M[-11106]or y(14682,-11106,65549)
                                        continue
                                    else
                                        ea=M[24910]or y(7750,24910,95072)
                                        continue
                                    end
                                    ea=M[3398]or y(32663,3398,89757)
                                end
                            elseif ea>=65234 then
                                if ea<65329 then
                                    if f_>67 then
                                        ea=M[-23069]or y(8100,-23069,78646)
                                        continue
                                    else
                                        ea=M[17903]or y(60988,17903,63279)
                                        continue
                                    end
                                    ea=M[-1198]or y(7930,-1198,32800)
                                elseif ea>65329 then
                                    Pa=Pa..Aa(E(ka(_c,Wa+1),ka(Q,Wa%#Q+1)));
                                    ea=M[5544]or y(12604,5544,84311)
                                else
                                    Cc=Xa[17713];
                                    L[Xa[42020]]=Ca[Cc]or fb[60300][Cc];
                                    sb+=1;
                                    ea=M[17538]or y(39174,17538,1068)
                                end
                            elseif ea>65048 then
                                sb+=1;
                                ea=M[-22572]or y(61786,-22572,60608)
                            elseif ea>63930 then
                                Wa=Ib[sb];
                                sb+=1;
                                qa=Wa[42020]
                                if qa==0 then
                                    ea=M[-19453]or y(12434,-19453,92279)
                                    continue
                                elseif qa==1 then
                                    ea=M[-9227]or y(40893,-9227,6635)
                                    continue
                                elseif qa==2 then
                                    ea=M[1146]or y(38003,1146,55214)
                                    continue
                                end
                                ea=M[15598]or y(45716,15598,11979)
                            else
                                Pa=Pa+Da;
                                Va=Pa
                                if Pa~=Pa then
                                    ea=M[5369]or y(27587,5369,97560)
                                else
                                    ea=M[-31680]or y(38021,-31680,8738)
                                end
                            end
                        elseif ea<59399 then
                            if ea<=58668 then
                                if ea>58309 then
                                    Ca[Xa[17713]]=L[Xa[9179]];
                                    sb+=1;
                                    ea=M[15410]or y(53736,15410,53046)
                                elseif ea<=57758 then
                                    if ea<=57345 then
                                        if f_>86 then
                                            ea=M[-6628]or y(27882,-6628,72958)
                                            continue
                                        else
                                            ea=M[-31956]or y(40701,-31956,31063)
                                            continue
                                        end
                                        ea=M[25454]or y(29302,25454,93628)
                                    else
                                        Cc=Xa[17713];
                                        L[Xa[9179]]=L[Xa[31589]][Cc];
                                        sb+=1;
                                        ea=M[-19629]or y(30594,-19629,91816)
                                    end
                                else
                                    Q=Q+s_;
                                    Da=Q
                                    if Q~=Q then
                                        ea=M[-17208]or y(13988,-17208,65610)
                                    else
                                        ea=M[32241]or y(59894,32241,85982)
                                    end
                                end
                            elseif ea<=58686 then
                                Cc,W=Ib[sb],nil;
                                ea=M[-3936]or y(36654,-3936,36621)
                            else
                                W[59089]=e_;
                                _c=nil;
                                ea=M[32648]or y(29399,32648,89968)
                            end
                        elseif ea<61668 then
                            if ea<59635 then
                                if f_>108 then
                                    ea=M[-13694]or y(7955,-13694,78927)
                                    continue
                                else
                                    ea=M[28610]or y(37651,28610,63309)
                                    continue
                                end
                                ea=M[-806]or y(10558,-806,38116)
                            elseif ea<=59635 then
                                L[Xa[42020]]=U[Xa[59089]];
                                ea=M[6275]or y(56814,6275,50707)
                            else
                                sb+=1;
                                ea=M[12469]or y(28449,12469,85519)
                            end
                        elseif ea<=61671 then
                            if ea>61668 then
                                if Q[2]>=Xa[42020]then
                                    ea=M[10895]or y(23945,10895,90137)
                                    continue
                                end
                                ea=M[-17893]or y(3928,-17893,71395)
                            else
                                qa=Da
                                if Va~=Va then
                                    ea=M[-4804]or y(25611,-4804,65823)
                                else
                                    ea=M[-15418]or y(16754,-15418,69288)
                                end
                            end
                        else
                            Q=Q..Aa(E(ka(e_,Va+1),ka(_c,Va%#_c+1)));
                            ea=M[21396]or y(32288,21396,109486)
                        end
                    elseif ea<=54067 then
                        if ea>53104 then
                            if ea<53717 then
                                if ea<=53135 then
                                    Wa=s_
                                    if Da~=Da then
                                        ea=M[-29920]or y(56158,-29920,82454)
                                    else
                                        ea=M[19377]or y(54680,19377,82417)
                                    end
                                else
                                    if f_>192 then
                                        ea=M[15825]or y(53742,15825,50877)
                                        continue
                                    else
                                        ea=M[29617]or y(42324,29617,7240)
                                        continue
                                    end
                                    ea=M[-19178]or y(61818,-19178,60576)
                                end
                            elseif ea<=53912 then
                                if ea>53717 then
                                    _c,Q=W[59089],Xa[59089];
                                    Q='~^+\171i\152k\234'..Q;
                                    Pa='';
                                    Va,s_,Da=1,0,#_c-1;
                                    ea=M[4563]or y(17259,4563,121476)
                                else
                                    W,U,e_=X(W);
                                    ea=M[14748]or y(13502,14748,81489)
                                end
                            else
                                sb+=Xa[59442];
                                ea=M[16306]or y(61846,16306,60572)
                            end
                        elseif ea>52385 then
                            if ea<=52817 then
                                if ea>52534 then
                                    U,e_=Cc[17713],Xa[17713];
                                    e_='~^+\171i\152k\234'..e_;
                                    _c='';
                                    Q,s_,Pa=0,1,#U-1;
                                    ea=M[30199]or y(6512,30199,57905)
                                else
                                    if Xa[31589]==63 then
                                        ea=M[28531]or y(33202,28531,23191)
                                        continue
                                    elseif Xa[31589]==87 then
                                        ea=M[28355]or y(1821,28355,75013)
                                        continue
                                    elseif Xa[31589]==207 then
                                        ea=M[22328]or y(5891,22328,41169)
                                        continue
                                    else
                                        ea=M[23963]or y(20114,23963,35052)
                                        continue
                                    end
                                    ea=M[-30720]or y(10232,-30720,39206)
                                end
                            else
                                if f_>28 then
                                    ea=M[-10657]or y(579,-10657,82378)
                                    continue
                                else
                                    ea=M[-16207]or y(41119,-16207,199)
                                    continue
                                end
                                ea=M[26208]or y(65198,26208,57460)
                            end
                        elseif ea<=52297 then
                            if ea>52086 then
                                if f_>62 then
                                    ea=M[-31286]or y(5452,-31286,94690)
                                    continue
                                else
                                    ea=M[27974]or y(55216,27974,68894)
                                    continue
                                end
                                ea=M[8066]or y(60041,8066,54679)
                            elseif ea<=51970 then
                                Cc,W,U=Xa[49807],Ib[sb+1],nil;
                                ea=8821
                            else
                                U=c-W+1;
                                ea=M[-19055]or y(11515,-19055,83441)
                            end
                        else
                            Cc=S(W)
                            if Cc~=nil and Cc.__iter~=nil then
                                ea=M[10716]or y(15837,10716,42551)
                                continue
                            elseif Ia(W)=='table'then
                                ea=M[-30968]or y(16788,-30968,77515)
                                continue
                            end
                            ea=M[-16117]or y(1456,-16117,73883)
                        end
                    elseif ea>=55533 then
                        if ea>56146 then
                            if ea>56408 then
                                _c,Q=W(U,e_);
                                e_=_c
                                if e_==nil then
                                    ea=M[29877]or y(7088,29877,83992)
                                else
                                    ea=28931
                                end
                            else
                                sb-=1;
                                Ib[sb]={[55927]=57,[42020]=E(Xa[42020],106),[9179]=E(Xa[9179],250),[31589]=0};
                                ea=M[-10126]or y(54303,-10126,51973)
                            end
                        elseif ea<55627 then
                            sb-=1;
                            Ib[sb]={[55927]=94,[42020]=E(Xa[42020],149),[9179]=E(Xa[9179],248),[31589]=0};
                            ea=M[-22633]or y(26125,-22633,88347)
                        elseif ea<=55627 then
                            Da=Da+Wa;
                            qa=Da
                            if Da~=Da then
                                ea=M[-26141]or y(15920,-26141,83940)
                            else
                                ea=M[12508]or y(54113,12508,40127)
                            end
                        else
                            if f_>72 then
                                ea=M[27090]or y(48205,27090,86588)
                                continue
                            else
                                ea=M[-32056]or y(32148,-32056,117180)
                                continue
                            end
                            ea=M[12746]or y(54273,12746,52015)
                        end
                    elseif ea>=54492 then
                        if ea>=55093 then
                            if ea<=55093 then
                                _c,Q=W(U,e_);
                                e_=_c
                                if e_==nil then
                                    ea=M[-18315]or y(52862,-18315,12708)
                                else
                                    ea=61671
                                end
                            else
                                if f_>50 then
                                    ea=M[12736]or y(20576,12736,125663)
                                    continue
                                else
                                    ea=M[8862]or y(27462,8862,127686)
                                    continue
                                end
                                ea=M[908]or y(21415,908,84621)
                            end
                        else
                            Cc,W,U,e_=Xa[17713],Xa[12361],L[Xa[42020]],nil;
                            e_=wc(U)=='boolean'
                            if(e_ and(U==Cc))~=W then
                                ea=M[-21140]or y(23342,-21140,124435)
                                continue
                            else
                                ea=M[-7587]or y(29896,-7587,94963)
                                continue
                            end
                            ea=M[13311]or y(47021,13311,10619)
                        end
                    elseif ea>54078 then
                        s_=s_..Aa(E(ka(Q,qa+1),ka(Pa,qa%#Pa+1)));
                        ea=M[-25662]or y(49874,-25662,91759)
                    else
                        c,sb,nb,j,hb=-1,1,na({},{__mode='vs'}),na({},{__mode='ks'}),false;
                        ea=M[-32091]or y(11293,-32091,37643)
                    end
                elseif ea<41249 then
                    if ea>=37171 then
                        if ea>39185 then
                            if ea<40352 then
                                if ea<=39470 then
                                    if f_>98 then
                                        ea=M[-591]or y(17509,-591,39776)
                                        continue
                                    else
                                        ea=M[-30069]or y(13084,-30069,92859)
                                        continue
                                    end
                                    ea=M[-12140]or y(54563,-12140,51209)
                                else
                                    if f_>175 then
                                        ea=M[-7908]or y(52884,-7908,55621)
                                        continue
                                    else
                                        ea=M[-7193]or y(45148,-7193,61087)
                                        continue
                                    end
                                    ea=M[25442]or y(4010,25442,61808)
                                end
                            elseif ea>=40678 then
                                if ea<=40678 then
                                    if Q==-2 then
                                        ea=M[-27683]or y(61706,-27683,96556)
                                        continue
                                    else
                                        ea=M[-26883]or y(51553,-26883,44514)
                                        continue
                                    end
                                    ea=M[-14720]or y(7508,-14720,32962)
                                else
                                    if f_>57 then
                                        ea=M[-5341]or y(56558,-5341,40718)
                                        continue
                                    else
                                        ea=M[-11842]or y(32683,-11842,108863)
                                        continue
                                    end
                                    ea=M[9615]or y(47259,9615,10113)
                                end
                            else
                                if f_>129 then
                                    ea=M[21844]or y(65482,21844,63089)
                                    continue
                                else
                                    ea=M[9880]or y(62567,9880,89193)
                                    continue
                                end
                                ea=M[-27156]or y(211,-27156,65113)
                            end
                        elseif ea>=38456 then
                            if ea<=38757 then
                                if ea>38466 then
                                    Cc=vc[Xa[9179]+1];
                                    Cc[3][Cc[2]]=L[Xa[42020]];
                                    ea=M[-27443]or y(37333,-27443,3907)
                                elseif ea<=38456 then
                                    if f_>69 then
                                        ea=M[-21045]or y(3530,-21045,62288)
                                        continue
                                    else
                                        ea=M[16248]or y(57497,16248,77599)
                                        continue
                                    end
                                    ea=M[-25724]or y(35978,-25724,29584)
                                else
                                    sb+=1;
                                    ea=M[16454]or y(59768,16454,54438)
                                end
                            else
                                Cc[17713]=W;
                                Xa[55927]=50;
                                ea=M[-27575]or y(18927,-27575,46901)
                            end
                        elseif ea<37181 then
                            e_=W-1;
                            ea=M[27168]or y(7549,27168,86331)
                        elseif ea>37181 then
                            if(Va>=0 and s_>Da)or((Va<0 or Va~=Va)and s_<Da)then
                                ea=M[10419]or y(9526,10419,39073)
                            else
                                ea=M[10164]or y(23920,10164,83376)
                            end
                        else
                            W[42692]=_c;
                            ea=M[14171]or y(29188,14171,78770)
                        end
                    elseif ea>35472 then
                        if ea<36203 then
                            if ea>35621 then
                                sb-=1;
                                Ib[sb]={[55927]=4,[42020]=E(Xa[42020],30),[9179]=E(Xa[9179],11),[31589]=0};
                                ea=M[17111]or y(54690,17111,51336)
                            else
                                sb+=Xa[59442];
                                ea=M[5070]or y(11399,5070,37805)
                            end
                        elseif ea<36293 then
                            W,U,e_=nb
                            if Ia(W)~='function'then
                                ea=M[18906]or y(56735,18906,87589)
                                continue
                            end
                            ea=M[-22351]or y(49158,-22351,93514)
                        elseif ea<=36293 then
                            if(Da>=0 and Pa>s_)or((Da<0 or Da~=Da)and Pa<s_)then
                                ea=M[21688]or y(57762,21688,56456)
                            else
                                ea=65048
                            end
                        else
                            Va=Pa
                            if s_~=s_ then
                                ea=M[25241]or y(39787,25241,11616)
                            else
                                ea=18379
                            end
                        end
                    elseif ea<=34327 then
                        if ea>34106 then
                            sb-=1;
                            Ib[sb]={[55927]=61,[42020]=E(Xa[42020],68),[9179]=E(Xa[9179],185),[31589]=0};
                            ea=M[32189]or y(18553,32189,47015)
                        elseif ea>33574 then
                            if f_>131 then
                                ea=M[7219]or y(39558,7219,41460)
                                continue
                            else
                                ea=M[21526]or y(56527,21526,45087)
                                continue
                            end
                            ea=M[3305]or y(55783,3305,51021)
                        elseif ea>33130 then
                            mc(Q,1,Pa,Cc,L);
                            ea=M[1114]or y(60240,1114,53982)
                        else
                            if(Wa>=0 and Da>Va)or((Wa<0 or Wa~=Wa)and Da<Va)then
                                ea=M[-23981]or y(34825,-23981,7453)
                            else
                                ea=54421
                            end
                        end
                    elseif ea>34706 then
                        Cc,W,U=Xa[42020],Xa[31589],Xa[17713];
                        e_=L[W];
                        L[Cc+1]=e_;
                        L[Cc]=e_[U];
                        sb+=1;
                        ea=M[-20278]or y(22839,-20278,83197)
                    else
                        W=_c;
                        ea=M[-32364]or y(48121,-32364,36728)
                        continue
                    end
                elseif ea>=44808 then
                    if ea>=47702 then
                        if ea>49778 then
                            if ea<=50021 then
                                _c,Q=W(U,e_);
                                e_=_c
                                if e_==nil then
                                    ea=46051
                                else
                                    ea=M[-15322]or y(50503,-15322,54312)
                                end
                            else
                                Cc=S(W)
                                if Cc~=nil and Cc.__iter~=nil then
                                    ea=M[-23314]or y(56858,-23314,57040)
                                    continue
                                elseif Ia(W)=='table'then
                                    ea=M[-32131]or y(28909,-32131,127107)
                                    continue
                                end
                                ea=M[4757]or y(52136,4757,90284)
                            end
                        elseif ea>49709 then
                            if f_>225 then
                                ea=M[10004]or y(31518,10004,91965)
                                continue
                            else
                                ea=M[21802]or y(45451,21802,58430)
                                continue
                            end
                            ea=M[29602]or y(20279,29602,44797)
                        elseif ea<48074 then
                            j[Xa]=nil;
                            sb+=1;
                            ea=M[24534]or y(49739,24534,15825)
                        elseif ea<=48074 then
                            L[Cc+2]=L[Cc+3];
                            sb+=Xa[59442];
                            ea=M[29523]or y(59700,29523,54498)
                        else
                            Cc,W=Xa[42020],Xa[9179];
                            U=W-1
                            if U==-1 then
                                ea=M[-28978]or y(4349,-28978,119823)
                                continue
                            else
                                ea=M[-10838]or y(26936,-10838,79389)
                                continue
                            end
                            ea=32202
                        end
                    elseif ea>45697 then
                        if ea>46051 then
                            Cc=S(W)
                            if Cc~=nil and Cc.__iter~=nil then
                                ea=M[-18273]or y(55888,-18273,8539)
                                continue
                            elseif Ia(W)=='table'then
                                ea=M[24725]or y(34600,24725,39795)
                                continue
                            end
                            ea=M[-20334]or y(26756,-20334,125855)
                        else
                            ea=M[-12966]or y(12502,-12966,120709)
                            continue
                        end
                    elseif ea>=45570 then
                        if ea<=45570 then
                            W,U,e_=X(W);
                            ea=M[19070]or y(59502,19070,67026)
                        else
                            if f_>123 then
                                ea=M[7564]or y(26543,7564,130299)
                                continue
                            else
                                ea=M[-21727]or y(29085,-21727,120688)
                                continue
                            end
                            ea=M[-27587]or y(28162,-27587,86312)
                        end
                    elseif ea>44808 then
                        mc(A[53899],1,W,Cc,L);
                        ea=M[-18406]or y(51043,-18406,14025)
                    else
                        e_=Pa;
                        ea=28927
                        continue
                    end
                elseif ea<=42471 then
                    if ea>41713 then
                        if ea<42430 then
                            sb-=1;
                            Ib[sb]={[55927]=129,[42020]=E(Xa[42020],75),[9179]=E(Xa[9179],254),[31589]=0};
                            ea=M[23709]or y(16702,23709,48356)
                        elseif ea>42430 then
                            if(Va>=0 and s_>Da)or((Va<0 or Va~=Va)and s_<Da)then
                                ea=M[20097]or y(61620,20097,94156)
                            else
                                ea=65474
                            end
                        else
                            L[Xa[31589]]=Xa[42020]==1;
                            sb+=Xa[9179];
                            ea=M[26625]or y(49943,26625,14877)
                        end
                    elseif ea<41483 then
                        if ea>41249 then
                            if Xa[31589]==189 then
                                ea=M[-28221]or y(37595,-28221,59637)
                                continue
                            else
                                ea=M[-8465]or y(10230,-8465,68211)
                                continue
                            end
                            ea=M[-2115]or y(62272,-2115,60142)
                        else
                            W,U,e_=X(W);
                            ea=M[-26645]or y(40450,-26645,43333)
                        end
                    elseif ea>41483 then
                        if f_>19 then
                            ea=M[18967]or y(19409,18967,77824)
                            continue
                        else
                            ea=M[13908]or y(32200,13908,104826)
                            continue
                        end
                        ea=M[5695]or y(58672,5695,55550)
                    else
                        Cc=vc[Xa[9179]+1];
                        L[Xa[42020]]=Cc[3][Cc[2]];
                        ea=M[-15492]or y(60045,-15492,54683)
                    end
                elseif ea<43081 then
                    if ea>42543 then
                        if(s_>=0 and Q>Pa)or((s_<0 or s_~=s_)and Q<Pa)then
                            ea=M[15394]or y(30912,15394,81446)
                        else
                            ea=26732
                        end
                    else
                        mc(Q,1,W,Cc+3,L);
                        L[Cc+2]=L[Cc+3];
                        sb+=Xa[59442];
                        ea=M[23821]or y(36371,23821,28953)
                    end
                elseif ea<43967 then
                    if(Q>=0 and e_>_c)or((Q<0 or Q~=Q)and e_<_c)then
                        ea=M[-22850]or y(54048,-22850,51726)
                    else
                        ea=62529
                    end
                elseif ea>43967 then
                    Cc=hc[Xa[17713]+1];
                    W=Cc[11337];
                    U=Fb(W);
                    L[Xa[42020]]=C(Cc,U);
                    Q,_c,e_=1,W,1;
                    ea=10983
                else
                    sb+=1;
                    ea=M[27578]or y(10135,27578,38557)
                end
            until ea==55073
        end
        return function(...)
            local qc,z,Xb,ub,_b,sa,yc,F,H,Jb,Lb;
            qc,Lb={},function(mb,n_,Sb)
                qc[Sb]=v(mb,45240)-v(n_,19490)
                return qc[Sb]
            end;
            _b=qc[-29214]or Lb(118897,43573,-29214)
            repeat
                if _b>31410 then
                    if _b>45315 then
                        _b=qc[1557]or Lb(53560,17380,1557)
                        continue
                    elseif _b>33418 then
                        z,Xb=Ec(Y(nc,yc,zc[21958],zc[59769],F))
                        if z[1]then
                            _b=qc[-11026]or Lb(32372,4530,-11026)
                            continue
                        else
                            _b=qc[7977]or Lb(114007,42863,7977)
                            continue
                        end
                        _b=qc[-3383]or Lb(79198,63129,-3383)
                    else
                        z,Xb=zc[48957]+1,sa.n-zc[48957];
                        F[54777]=Xb;
                        mc(sa,z,z+Xb-1,1,F[53899]);
                        _b=qc[-646]or Lb(30039,22734,-646)
                    end
                elseif _b<22274 then
                    if _b<=4245 then
                        return xa(ub,0)
                    else
                        ub,H=z[2],nil;
                        Jb=ub;
                        H=wc(Jb)=='string'
                        if H==false then
                            _b=qc[-30217]or Lb(56484,22840,-30217)
                            continue
                        end
                        _b=qc[8220]or Lb(50772,10869,8220)
                    end
                elseif _b<=28988 then
                    if _b>22274 then
                        return qb(z,2,Xb)
                    else
                        ub=wc(ub);
                        _b=qc[105]or Lb(5714,55927,105)
                    end
                else
                    sa,yc,F=tb(...),Fb(zc[15791]),{[53899]={},[54777]=0};
                    mc(sa,1,zc[48957],0,yc)
                    if zc[48957]<sa.n then
                        _b=qc[-23955]or Lb(101591,62919,-23955)
                        continue
                    end
                    _b=qc[-7503]or Lb(21814,30889,-7503)
                end
            until _b==20922
        end
    end
    return C(Za,k)
end)
local vb;
vb,I={[0]=0},function()
    vb[0]=vb[0]+1
    return{[3]=vb,[2]=vb[0]}
end;
wb=Oa
return(function()
    return wb(Mb(Fc'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'),{})
end)()(...)
