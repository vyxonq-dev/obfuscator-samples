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

local z,zb,tb,Ja,yc,W=type,pairs,bit32.bxor,getmetatable
local Zb,ea,xa,Gb,ya,Sa,gb,n_,t_,J,Ub,i_,Db,N,Nb,wb,da,Pb,Xb,lb,zc,fb,ba,m,Tb,ha,G,Hb,ac,eb;
ba=(select);
wb=(function(...)
    return{[1]={...},[2]=ba('#',...)}
end);
ac=((function()
    local function ab(Ca,_c,Va)
        if _c>Va then
            return
        end
        return Ca[_c],ab(Ca,_c+1,Va)
    end
    return ab
end)());
zc,Zb=(string.gsub),(string.char);
Tb=(function(u_)
    u_=zc(u_,'[^ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/=]','')
    return(u_:gsub('.',function(Y)
        if(Y=='=')then
            return''
        end
        local R,Ec='',(('ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/'):find(Y)-1)
        for Aa=6,1,-1 do
            R=R..(Ec%2^Aa-Ec%2^(Aa-1)>0 and'1'or'0')
        end
        return R
    end):gsub('%d%d%d?%d?%d?%d?%d?%d?',function(g)
        if(#g~=8)then
            return''
        end
        local wa=0
        for Eb=1,8 do
            wa=wa+(g:sub(Eb,Eb)=='1'and 2^(8-Eb)or 0)
        end
        return Zb(wa)
    end))
end);
Nb,Sa,i_,J,ya,eb,m,Xb=string.unpack,string.sub,string.byte,bit32 .lshift,bit32 .rshift,bit32 .band,table.concat,{};
gb=(function(lc)
    local dc=Xb[lc]
    if dc then
        return dc
    end
    local ra,aa,jc,_a,Wb=J(1,11),J(1,5),1,{},''
    while jc<=#lc do
        local Yb=i_(lc,jc);
        jc=jc+1
        for Xa=1,8 do
            local Ma=nil
            if eb(Yb,1)~=0 then
                if jc<=#lc then
                    Ma=Sa(lc,jc,jc);
                    jc=jc+1
                end
            else
                if jc+1<=#lc then
                    local Fc=Nb('>I2',lc,jc);
                    jc=jc+2
                    local T,mc=#Wb-ya(Fc,5),eb(Fc,(aa-1))+3;
                    Ma=Sa(Wb,T,T+mc-1)
                end
            end
            Yb=ya(Yb,1)
            if Ma then
                _a[#_a+1]=Ma;
                Wb=Sa(Wb..Ma,-ra)
            end
        end
    end
    local Jb=m(_a);
    Xb[lc]=Jb
    return Jb
end)
local hb,Qa,O,Ga,P,ia,e_,b_,Da,pa,Ob,sc,X,yb,Ta,mb,ma,l_,hc,fa_,f_,La,Ka,d_,bb,Bc,ka,U,F,rc=type,pcall,error,tonumber,assert,select,setmetatable,string.format,string.unpack,string.sub,string.byte,string.char,table.move,table.pack,table.create,table.insert,table.concat,coroutine.create,coroutine.yield,coroutine.resume,coroutine.close,getfenv,bit32 .bor,bit32 .bxor,bit32 .band,bit32 .btest,bit32 .rshift,bit32 .lshift,bit32 .extract,{[63222]={},[58752]={},[7889]={{0,8,true},{3,2,false},{4,8,false},{4,3,false},{4,2,true},{3,4,true},{8,6,true},{8,2,true},{3,3,true},{8,5,true},{2,4,false},{4,8,false},{3,4,false},{4,2,false},{5,8,false},{4,8,true},{4,8,false},{5,8,false},{2,5,false},{5,8,false},{5,6,true},{2,5,false},{0,3,false},{4,4,true},{8,5,false},{8,6,true},{0,8,false},{2,10,false},{8,6,false},{4,10,true},{5,7,true},{0,2,false},{0,3,false},{4,8,false},{5,7,true},{3,7,false},{3,8,false},{4,8,false},{4,4,true},{5,3,true},{2,1,false},{3,2,false},{5,4,true},{8,1,false},{8,4,false},{5,8,true},{5,8,true},{5,4,true},{0,10,false},{4,3,false},{5,8,true},{0,7,false},{5,8,false},{5,8,false},{3,4,true},{2,2,false},{2,7,false},{4,8,false},{4,10,true},{0,7,false},{0,6,true},{8,3,false},{0,4,true},{0,4,false},{4,7,true},{2,5,false},{2,4,true},{4,4,true},{5,2,false},{8,4,true},{5,8,false},{8,8,true},{0,3,true},{0,3,false},{4,8,false},{8,8,false},{0,10,false},{4,8,false},{4,8,false},{4,8,false},{8,4,true},{4,8,false},{3,10,false},{8,7,true},{0,2,true},{8,5,true},{4,8,false},{3,5,true},{4,1,true},{5,8,false},{5,6,true},{4,4,false},{8,7,true},{4,1,true},{2,7,false},{3,4,true},{8,2,false},{4,4,true},{5,8,true},{3,7,false},{0,5,false},{4,8,false},{0,5,false},{4,2,false},{5,8,true},{4,8,false},{4,7,true},{3,8,true},{8,8,true},{4,10,false},{5,5,false},{0,5,false},{0,10,false},{2,8,true},{4,10,false},{0,7,true},{0,3,false},{4,3,true},{5,10,false},{5,7,false},{0,6,false},{5,8,false},{4,2,false},{0,8,true},{5,6,true},{5,8,true},{4,4,true},{3,6,false},{8,6,true},{4,8,false},{4,1,false},{2,5,false},{8,2,false},{4,8,false},{0,8,false},{4,4,false},{5,6,false},{4,8,false},{4,8,false},{4,9,false},{2,2,true},{4,8,false},{5,8,false},{4,10,true},{4,8,false},{8,7,true},{8,3,true},{4,8,false},{5,5,true},{5,8,false},{3,6,false},{4,8,false},{4,8,false},{4,8,false},{4,10,false},{5,1,true},{3,5,false},{2,5,false},{8,1,false},{5,2,false},{3,3,true},{3,3,true},{4,2,false},{8,1,false},{4,9,false},{5,8,false},{3,5,false},{2,8,false},{8,1,true},{5,4,true},{4,8,false},{0,8,true},{4,4,true},{2,10,true},{4,6,false},{3,1,false},{5,7,false},{8,10,true},{2,8,true},{3,8,true},{5,8,false},{8,7,false},{5,2,true},{3,6,false},{4,8,false},{4,2,false},{0,3,false},{5,7,true},{8,10,true},{8,8,false},{4,4,true},{8,6,false},{8,10,false},{8,7,true},{3,3,true},{3,2,true},{4,8,false},{4,4,true},{3,4,false},{8,7,true},{3,8,false},{8,1,true},{2,3,false},{0,3,false},{3,2,false},{8,5,true},{4,3,true},{4,8,false},{0,8,false},{0,5,false},{3,8,true},{4,9,false},{4,8,false},{0,8,false},{5,8,true},{4,8,false},{5,1,false},{3,2,true},{8,2,false},{8,8,false},{5,8,false},{8,8,false},{4,10,false},{8,5,true},{0,10,true},{2,2,false},{4,4,true},{5,6,true},{4,2,false},{0,5,true},{4,4,true},{5,5,false},{2,4,true},{4,9,false},{4,8,true},{3,5,false},{4,8,true},{3,3,true},{5,2,true},{5,5,false},{0,4,true},{0,7,true},{5,8,true},{5,1,false},{8,1,true},{5,5,true},{3,0,false},{4,5,true},{4,8,false},{8,1,true},{4,6,true},{2,7,true},{2,7,true},{3,8,true},{3,8,false},{2,5,true}}}
local rb=(function(pb)
    local Wa=rc[58752][pb]
    if Wa then
        return Wa
    end
    local M=1
    local function v()
        local fc,s_,D,Za,Ra,kc,C,nb,nc,a_,L,x,c,ua,ec,oc,za,Oa,Ab,db,j,w_,Pa,cc,Mb,A,Vb,sa,ta,h,o_,Gc;
        Vb,w_={},function(vc,Ea,Fb)
            Vb[Ea]=tb(vc,39151)-tb(Fb,59572)
            return Vb[Ea]
        end;
        x=Vb[-17487]or w_(166,-17487,42258)
        while x~=19573 do
            if x<33163 then
                if x>17360 then
                    if x>25804 then
                        if x>29482 then
                            if x>31140 then
                                if x<31183 then
                                    sa=Pa
                                    if ta~=ta then
                                        x=59703
                                    else
                                        x=21006
                                    end
                                elseif x>31183 then
                                    Ab,nc,x=db,nil,17091
                                else
                                    nb=Da('<d',pb,M);
                                    x,M=Vb[25877]or w_(99536,25877,25791),M+8
                                end
                            elseif x>=29827 then
                                if x>29827 then
                                    Mb,x=A,Vb[43]or w_(100165,43,51398)
                                else
                                    x,j=Vb[28763]or w_(98586,28763,17341),s_
                                end
                            elseif x<=29563 then
                                a_,x,Ra=za,5700,nil
                            else
                                sa=kc;
                                Gc=Ka(Gc,U(bb(sa,127),ta*7))
                                if not Bc(sa,128)then
                                    x=Vb[-23648]or w_(87668,-23648,555)
                                    continue
                                end
                                x=Vb[3778]or w_(103327,3778,36122)
                            end
                        elseif x<=28396 then
                            if x>=27275 then
                                if x>28111 then
                                    Pa=Pa+kc;
                                    sa=Pa
                                    if Pa~=Pa then
                                        x=Vb[10070]or w_(99180,10070,56056)
                                    else
                                        x=Vb[26981]or w_(102065,26981,11492)
                                    end
                                elseif x>27275 then
                                    x,kc=29774,d_(sa,154)
                                    continue
                                else
                                    cc=ec;
                                    nb=Ka(nb,U(bb(cc,127),L*7))
                                    if not Bc(cc,128)then
                                        x=Vb[-4782]or w_(20351,-4782,25605)
                                        continue
                                    end
                                    x=Vb[21121]or w_(6825,21121,64483)
                                end
                            elseif x>26400 then
                                a_=Da('B',pb,M);
                                M,x=M+1,53206
                            else
                                Za=sa
                                if s_~=s_ then
                                    x=40788
                                else
                                    x=16741
                                end
                            end
                        elseif x<28818 then
                            ua=ua+c;
                            L=ua
                            if ua~=ua then
                                x=Vb[-10427]or w_(60714,-10427,45332)
                            else
                                x=Vb[-5254]or w_(22330,-5254,20976)
                            end
                        elseif x>28818 then
                            Za=Da('<I4',pb,M);
                            x,M=44044,M+4
                        else
                            x,Za=17671,d_(Oa,154)
                            continue
                        end
                    elseif x<22926 then
                        if x<20604 then
                            if x<19107 then
                                if x>17671 then
                                    x,A=Vb[-19881]or w_(63792,-19881,63959),wb(nil)
                                else
                                    Oa=Za;
                                    ta=Ka(ta,U(bb(Oa,127),fc*7))
                                    if not Bc(Oa,128)then
                                        x=Vb[-1143]or w_(29196,-1143,62952)
                                        continue
                                    end
                                    x=Vb[7654]or w_(20524,7654,35651)
                                end
                            elseif x<=19107 then
                                x,za=27150,nil
                            else
                                x=Vb[-18822]or w_(47885,-18822,61193)
                                continue
                            end
                        elseif x<=22460 then
                            if x>=21006 then
                                if x>21006 then
                                    Oa[5559],x=kc[Oa[22300]+1],Vb[28898]or w_(14150,28898,59719)
                                else
                                    if(kc>=0 and Pa>ta)or((kc<0 or kc~=kc)and Pa<ta)then
                                        x=59703
                                    else
                                        x=Vb[6184]or w_(76407,6184,7915)
                                    end
                                end
                            else
                                nb=0;
                                x,ua,o_,c=2193,0,4,1
                            end
                        else
                            Gc=nc;
                            D,j=Ta(Gc),false;
                            x,Pa,ta,kc=31169,1,Gc,1
                        end
                    elseif x<25059 then
                        if x>24603 then
                            ec=o_
                            if c~=c then
                                x=Vb[-25660]or w_(24732,-25660,3447)
                            else
                                x=Vb[-32540]or w_(33214,-32540,58938)
                            end
                        elseif x>=23156 then
                            if x<=23156 then
                                oc=cc;
                                ua=Ka(ua,U(bb(oc,127),ec*7))
                                if not Bc(oc,128)then
                                    x=Vb[27114]or w_(107640,27114,19557)
                                    continue
                                end
                                x=Vb[28242]or w_(109775,28242,25072)
                            else
                                sa=Da('B',pb,M);
                                M,x=M+1,28111
                            end
                        else
                            Mb=Za
                            if Oa~=Oa then
                                x=Vb[-7758]or w_(26189,-7758,15287)
                            else
                                x=734
                            end
                        end
                    elseif x>25617 then
                        kc=kc+s_;
                        fc=kc
                        if kc~=kc then
                            x=Vb[10355]or w_(123257,10355,28432)
                        else
                            x=Vb[-3444]or w_(18178,-3444,59038)
                        end
                    elseif x>25109 then
                        fc=kc
                        if sa~=sa then
                            x=Vb[-31755]or w_(67982,-31755,30683)
                        else
                            x=53699
                        end
                    elseif x<=25059 then
                        fc=fc+Oa;
                        h=fc
                        if fc~=fc then
                            x=Vb[2434]or w_(79890,2434,455)
                        else
                            x=Vb[-25277]or w_(108683,-25277,7237)
                        end
                    else
                        Oa[5559],x=F(Oa[22300],0,16),Vb[8991]or w_(121349,8991,32128)
                    end
                elseif x>=7205 then
                    if x<=14412 then
                        if x>=10682 then
                            if x>13035 then
                                if x<=13531 then
                                    sa=sa+fc;
                                    Za=sa
                                    if sa~=sa then
                                        x=Vb[6599]or w_(111364,6599,30031)
                                    else
                                        x=Vb[26608]or w_(108423,26608,25419)
                                    end
                                else
                                    x,o_=Vb[22204]or w_(104564,22204,6383),c
                                    continue
                                end
                            elseif x>11167 then
                                ua[30895]=bb(ka(Za,8),255);
                                ua[43780]=bb(ka(Za,16),255);
                                ua[10092],x=bb(ka(Za,24),255),Vb[31542]or w_(127704,31542,15973)
                            elseif x<=10682 then
                                cc=Da('B',pb,M);
                                M,x=M+1,47493
                            else
                                return{[40384]=Ab,[15157]=a_,[47227]=C,[53665]=fc,[30105]=D,[40119]=''}
                            end
                        elseif x<=9888 then
                            if x<=8414 then
                                if x>7205 then
                                    s_,x=nil,3399
                                else
                                    A,x=wb(d_(nb,-209896248)),39346
                                    continue
                                end
                            else
                                h=Oa
                                if h==0 then
                                    x=Vb[-18181]or w_(102027,-18181,31853)
                                    continue
                                elseif h==5 then
                                    x=Vb[19536]or w_(30346,19536,53930)
                                    continue
                                elseif h==2 then
                                    x=Vb[-12311]or w_(114490,-12311,2206)
                                    continue
                                elseif h==4 then
                                    x=Vb[-23051]or w_(106352,-23051,65413)
                                    continue
                                end
                                x=Vb[-24640]or w_(71168,-24640,26371)
                            end
                        else
                            x,Za=58996,nil
                        end
                    elseif x>=16741 then
                        if x<=17091 then
                            if x<=16776 then
                                if x<=16741 then
                                    if(fc>=0 and sa>s_)or((fc<0 or fc~=fc)and sa<s_)then
                                        x=Vb[-466]or w_(66702,-466,5561)
                                    else
                                        x=35770
                                    end
                                else
                                    x,nc=Vb[-29916]or w_(121191,-29916,205),d_(Gc,-209896248)
                                    continue
                                end
                            else
                                Gc=0;
                                x,Pa,j,D=Vb[8607]or w_(123217,8607,32573),1,4,0
                            end
                        else
                            Za=fc;
                            Oa=bb(Za,255);
                            h=rc[7889][Oa+1];
                            Mb,A,nb=h[1],h[2],h[3];
                            ua={[35222]=Oa,[5559]=0,[23170]=0,[15647]=0,[56889]=0,[10092]=0,[22300]=0,[46636]=0,[30895]=0,[65398]=0,[45520]=0,[53892]=nil,[4601]=0,[43780]=0,[59588]=A};
                            mb(D,ua)
                            if Mb==5 then
                                x=Vb[-19652]or w_(107391,-19652,40603)
                                continue
                            elseif Mb==4 then
                                x=Vb[28863]or w_(5151,28863,45745)
                                continue
                            elseif Mb==3 then
                                x=Vb[-23594]or w_(32219,-23594,9717)
                                continue
                            end
                            x=Vb[-19393]or w_(129705,-19393,9812)
                        end
                    elseif x<15083 then
                        ec,x=nil,Vb[32137]or w_(9082,32137,31087)
                    elseif x<=15083 then
                        x,Oa=Vb[22214]or w_(7594,22214,46609),d_(h,154)
                        continue
                    else
                        if(Oa>=0 and fc>Za)or((Oa<0 or Oa~=Oa)and fc<Za)then
                            x=Vb[-3025]or w_(100062,-3025,36371)
                        else
                            x=Vb[7503]or w_(130408,7503,29183)
                        end
                    end
                elseif x>=3399 then
                    if x>=4784 then
                        if x<5777 then
                            if x>4784 then
                                C=Da('B',pb,M);
                                x,M=Vb[-3018]or w_(31526,-3018,41206),M+1
                            else
                                x,nb=40596,d_(ua,-209896248)
                                continue
                            end
                        elseif x>5777 then
                            o_,c=bb(ka(Za,8),16777215),nil;
                            c=if o_<8388608 then o_ else o_-16777216;
                            ua[4601],x=c,Vb[28057]or w_(9987,28057,50226)
                        else
                            if(c>=0 and ua>o_)or((c<0 or c~=c)and ua<o_)then
                                x=Vb[9658]or w_(34216,9658,59798)
                            else
                                x=14784
                            end
                        end
                    elseif x>4566 then
                        Mb,x=ac(A[1],1,A[2]),Vb[26995]or w_(130317,26995,36382)
                    elseif x>=4160 then
                        if x<=4160 then
                            x,A=Vb[22853]or w_(64284,22853,47799),wb(o_)
                            continue
                        else
                            ua=0;
                            L,c,o_,x=1,4,0,24628
                        end
                    else
                        x,fc=Vb[60]or w_(116763,60,13694),nil
                    end
                elseif x<734 then
                    if x>404 then
                        x,Oa[5559]=Vb[3894]or w_(17134,3894,50431),kc[Oa[4601]+1]
                    elseif x<=340 then
                        if x<=316 then
                            nb,x=nil,4566
                        else
                            Za=Za+h;
                            Mb=Za
                            if Za~=Za then
                                x=11167
                            else
                                x=734
                            end
                        end
                    else
                        cc,x=nil,Vb[532]or w_(127927,532,9619)
                    end
                elseif x<=2755 then
                    if x<=2193 then
                        if x>734 then
                            L=ua
                            if o_~=o_ then
                                x=Vb[8192]or w_(5902,8192,39688)
                            else
                                x=Vb[-15899]or w_(31544,-15899,9714)
                            end
                        else
                            if(h>=0 and Za>Oa)or((h<0 or h~=h)and Za<Oa)then
                                x=11167
                            else
                                x=Vb[3996]or w_(110607,3996,40448)
                            end
                        end
                    else
                        if(L>=0 and o_>c)or((L<0 or L~=L)and o_<c)then
                            x=Vb[24561]or w_(24483,24561,23592)
                        else
                            x=Vb[13745]or w_(61562,13745,36789)
                        end
                    end
                else
                    x,o_=62806,nil
                end
            elseif x<=47803 then
                if x<40788 then
                    if x<37734 then
                        if x>36336 then
                            if x<36776 then
                                A,x=wb'',Vb[-322]or w_(7364,-322,39567)
                                continue
                            elseif x<=36776 then
                                ua,o_=bb(ka(Mb,10),1023),bb(ka(Mb,0),1023);
                                Oa[15647]=kc[ua+1];
                                x,Oa[45520]=Vb[-918]or w_(19448,-918,52693),kc[o_+1]
                            else
                                x,A=Vb[10582]or w_(6174,10582,61433),nb
                                continue
                            end
                        elseif x>=35307 then
                            if x<35770 then
                                Mb=Oa[22300];
                                A,nb=ka(Mb,30),bb(ka(Mb,20),1023);
                                Oa[5559]=kc[nb+1];
                                Oa[65398]=A
                                if A==2 then
                                    x=Vb[9827]or w_(65610,9827,23162)
                                    continue
                                elseif A==3 then
                                    x=Vb[12239]or w_(112893,12239,30942)
                                    continue
                                end
                                x=Vb[-30323]or w_(31006,-30323,56463)
                            elseif x<=35770 then
                                Oa=D[Za];
                                h=Oa[59588]
                                if h==1 then
                                    x=Vb[-26046]or w_(28191,-26046,31855)
                                    continue
                                elseif h==0 then
                                    x=Vb[-32253]or w_(35508,-32253,59139)
                                    continue
                                elseif h==3 then
                                    x=Vb[-1242]or w_(112932,-1242,32596)
                                    continue
                                elseif h==4 then
                                    x=Vb[11653]or w_(10916,11653,45627)
                                    continue
                                elseif h==5 then
                                    x=Vb[25699]or w_(116589,25699,35470)
                                    continue
                                end
                                x=Vb[-24883]or w_(127286,-24883,21655)
                            else
                                fc,s_,x,sa=1,Gc,26400,1
                            end
                        elseif x>33163 then
                            c=o_;
                            ua[22300]=c;
                            mb(D,{});
                            x=Vb[20433]or w_(30224,20433,61340)
                        else
                            A,x=wb(nil),316
                        end
                    elseif x<=39814 then
                        if x<=39346 then
                            if x>=38854 then
                                if x<=38854 then
                                    x=Vb[31162]or w_(55981,31162,50982)
                                    continue
                                else
                                    x,Mb=Vb[-17872]or w_(127177,-17872,32858),ac(A[1],1,A[2])
                                end
                            else
                                if nb then
                                    x=Vb[12303]or w_(55782,12303,56526)
                                    continue
                                end
                                x=Vb[-27813]or w_(119049,-27813,35515)
                            end
                        elseif x<=39749 then
                            x=Vb[-1067]or w_(30865,-1067,49216)
                            continue
                        else
                            Za=sa
                            if s_~=s_ then
                                x=Vb[-13842]or w_(111036,-13842,29655)
                            else
                                x=45929
                            end
                        end
                    elseif x<=40497 then
                        if x>39815 then
                            oc=Da('B',pb,M);
                            x,M=Vb[17843]or w_(29487,17843,53215),M+1
                        else
                            x,Ra=41962,d_(C,154)
                            continue
                        end
                    else
                        ua=nb
                        if ua==0 then
                            x=Vb[-32265]or w_(25269,-32265,33551)
                            continue
                        else
                            x=Vb[-7727]or w_(73146,-7727,30326)
                            continue
                        end
                        x=Vb[-6800]or w_(12821,-6800,16650)
                    end
                elseif x<45562 then
                    if x>43740 then
                        if x<=44470 then
                            if x>44044 then
                                sa=sa+fc;
                                Za=sa
                                if sa~=sa then
                                    x=40788
                                else
                                    x=16741
                                end
                            else
                                fc,x=d_(Za,301095538),Vb[-1268]or w_(106768,-1268,7835)
                                continue
                            end
                        else
                            x,o_=Vb[13206]or w_(31006,13206,46808),d_(c,301095538)
                            continue
                        end
                    elseif x<=41962 then
                        if x<40986 then
                            sa,x=nil,62945
                        elseif x>40986 then
                            C,x,db=Ra,Vb[3288]or w_(127029,3288,17079),nil
                        else
                            db,x=d_(Ab,154),32167
                            continue
                        end
                    elseif x<=42434 then
                        D=D+Pa;
                        ta=D
                        if D~=D then
                            x=Vb[9293]or w_(20859,9293,24760)
                        else
                            x=63727
                        end
                    else
                        o_=o_+L;
                        ec=o_
                        if o_~=o_ then
                            x=Vb[-20792]or w_(50409,-20792,41442)
                        else
                            x=2755
                        end
                    end
                elseif x>=46151 then
                    if x<=47493 then
                        if x<=46986 then
                            if x<=46151 then
                                Mb,x=nil,Vb[-13473]or w_(76445,-13473,23438)
                            else
                                sa,x=d_(s_,-209896248),45562
                                continue
                            end
                        else
                            x,ec=Vb[-14308]or w_(23329,-14308,45559),d_(cc,154)
                            continue
                        end
                    else
                        A=Mb;
                        s_=Ka(s_,U(bb(A,127),h*7))
                        if not Bc(A,128)then
                            x=Vb[-10296]or w_(19026,-10296,57292)
                            continue
                        end
                        x=Vb[9266]or w_(117269,9266,6563)
                    end
                elseif x>=45929 then
                    if x>45929 then
                        x,kc=24603,nil
                    else
                        if(fc>=0 and sa>s_)or((fc<0 or fc~=fc)and sa<s_)then
                            x=36336
                        else
                            x=53830
                        end
                    end
                elseif x>45562 then
                    fc[Mb],x=v(),Vb[29265]or w_(59714,29265,39149)
                else
                    s_=sa;
                    fc=Ta(s_);
                    Za,Oa,x,h=1,s_,22926,1
                end
            elseif x>58364 then
                if x>61912 then
                    if x>=63727 then
                        if x<64886 then
                            if x<=63727 then
                                if(Pa>=0 and D>j)or((Pa<0 or Pa~=Pa)and D<j)then
                                    x=Vb[15170]or w_(25995,15170,21352)
                                else
                                    x=Vb[-1794]or w_(30257,-1794,54257)
                                end
                            else
                                Oa[5559],x=kc[Oa[23170]+1],Vb[1601]or w_(32366,1601,53375)
                            end
                        elseif x>64886 then
                            x,kc[Za]=Vb[2861]or w_(105781,2861,14411),Mb
                        else
                            A=Da('B',pb,M);
                            M,x=M+1,51531
                        end
                    elseif x<=62806 then
                        if x>61938 then
                            c=Da('<I4',pb,M);
                            x,M=Vb[-19793]or w_(125378,-19793,10840),M+4
                        else
                            Pa,x=d_(ta,-209896248),Vb[-9798]or w_(78097,-9798,138)
                            continue
                        end
                    else
                        s_=0;
                        Za,Oa,fc,x=4,1,0,58965
                    end
                elseif x>=59351 then
                    if x<61550 then
                        if x<=59351 then
                            x,s_=29827,nb
                            continue
                        else
                            x,Pa=Vb[-18961]or w_(81898,-18961,23961),nil
                        end
                    elseif x>61550 then
                        ta=0;
                        kc,s_,x,sa=0,1,Vb[-22738]or w_(59523,-22738,58607),4
                    else
                        A,x=nil,31183
                    end
                elseif x<=58996 then
                    if x<58965 then
                        ua=bb(ka(Mb,10),1023);
                        x,Oa[15647]=Vb[32613]or w_(114668,32613,37369),kc[ua+1]
                    elseif x>58965 then
                        Oa=Da('B',pb,M);
                        x,M=28818,M+1
                    else
                        h=fc
                        if Za~=Za then
                            x=Vb[13126]or w_(73537,13126,14480)
                        else
                            x=Vb[-9118]or w_(14720,-9118,36168)
                        end
                    end
                else
                    o_,x=nil,54250
                end
            elseif x>53206 then
                if x>55207 then
                    if x<=57909 then
                        if x>56766 then
                            ta=D
                            if j~=j then
                                x=Vb[2757]or w_(54845,2757,58878)
                            else
                                x=63727
                            end
                        else
                            h=Da('B',pb,M);
                            M,x=M+1,Vb[-5642]or w_(102299,-5642,13373)
                        end
                    else
                        x=Vb[15134]or w_(49742,15134,61869)
                        continue
                    end
                elseif x>54250 then
                    j,x=false,Vb[-3232]or w_(122753,-3232,12342)
                elseif x>53830 then
                    c=Da('c'..ua,pb,M);
                    x,M=14412,M+ua
                elseif x>53699 then
                    Oa,x=nil,Vb[-769]or w_(32716,-769,57809)
                else
                    if(s_>=0 and kc>sa)or((s_<0 or s_~=s_)and kc<sa)then
                        x=Vb[611]or w_(121013,611,42716)
                    else
                        x=Vb[-28642]or w_(1816,-28642,36917)
                    end
                end
            elseif x<=50529 then
                if x<=49600 then
                    if x>=48855 then
                        if x<=48855 then
                            Ab=Da('B',pb,M);
                            M,x=M+1,40986
                        else
                            ta=Pa;
                            kc=Ta(ta);
                            sa,fc,s_,x=1,1,ta,Vb[-22393]or w_(123037,-22393,13400)
                        end
                    else
                        if j then
                            x=Vb[-3567]or w_(119800,-3567,39876)
                            continue
                        else
                            x=Vb[17216]or w_(101393,17216,7316)
                            continue
                        end
                        x=Vb[-19906]or w_(122816,-19906,12535)
                    end
                elseif x<=50261 then
                    x,cc=Vb[-1722]or w_(114241,-1722,9358),d_(oc,154)
                    continue
                else
                    ua[30895]=bb(ka(Za,8),255);
                    o_=bb(ka(Za,16),65535);
                    ua[46636]=o_;
                    c=nil;
                    c=if o_<32768 then o_ else o_-65536;
                    ua[23170],x=c,Vb[12529]or w_(10313,12529,62964)
                end
            elseif x>=52615 then
                if x<=52615 then
                    x=Vb[17384]or w_(68305,17384,18680)
                    continue
                else
                    za,x=d_(a_,154),Vb[13594]or w_(99307,13594,20285)
                    continue
                end
            elseif x<=51531 then
                x,Mb=47803,d_(A,154)
                continue
            else
                Mb,x=nil,Vb[-23763]or w_(69729,-23763,25516)
            end
        end
    end
    local B=v();
    rc[58752][pb]=B
    return B
end)
local Fa=(function(Dc,uc)
    Dc=rb(Dc)
    local Lb=La()
    local function Bb(sb,ja)
        local E=(function(...)
            return{...},ia('#',...)
        end)
        local K;
        K=(function(oa,ib,xb)
            if ib>xb then
                return
            end
            return oa[ib],K(oa,ib+1,xb)
        end)
        local function na(Q,S,Ib,Sb)
            local la,ub,qb,y,k,ic,Cb,Kb,_b,Z,ob,tc,pc,Ac,vb,ca,Ba,q,H,r_,kb,bc,V,qa;
            q,Z={},function(jb,Qb,Ua)
                q[jb]=tb(Qb,57941)-tb(Ua,25792)
                return q[jb]
            end;
            qb=q[-10641]or Z(-10641,84262,37042)
            while qb~=48371 do
                if qb<36008 then
                    if qb<17974 then
                        if qb>10855 then
                            if qb>=13387 then
                                if qb>=17294 then
                                    if qb>17716 then
                                        if qb<=17881 then
                                            if ca>52 then
                                                qb=q[15426]or Z(15426,106831,62983)
                                                continue
                                            else
                                                qb=q[-23824]or Z(-23824,77398,33558)
                                                continue
                                            end
                                            qb=q[14305]or Z(14305,125141,237)
                                        else
                                            if ca>17 then
                                                qb=q[14622]or Z(14622,104567,32958)
                                                continue
                                            else
                                                qb=q[-11219]or Z(-11219,27691,27044)
                                                continue
                                            end
                                            qb=q[16142]or Z(16142,9930,31372)
                                        end
                                    elseif qb>17530 then
                                        V=V+_b;
                                        bc=V
                                        if V~=V then
                                            qb=q[-20121]or Z(-20121,30204,58196)
                                        else
                                            qb=q[-11454]or Z(-11454,116980,39278)
                                        end
                                    elseif qb>=17482 then
                                        if qb>17482 then
                                            V=V+_b;
                                            bc=V
                                            if V~=V then
                                                qb=q[13951]or Z(13951,38626,26012)
                                            else
                                                qb=24528
                                            end
                                        else
                                            ic[5559]=la;
                                            tc[35222],qb=75,q[5138]or Z(5138,4316,10486)
                                        end
                                    else
                                        ic=ja[tc[43780]+1];
                                        ic[2][ic[1]],qb=Q[tc[30895]],q[2791]or Z(2791,116061,58485)
                                    end
                                elseif qb<=16533 then
                                    if qb>14656 then
                                        la=Sb[58405];
                                        qb,qa=q[-12325]or Z(-12325,91941,64145),ic+la-1
                                    elseif qb>13387 then
                                        pc=false;
                                        Ba+=1
                                        if ca>126 then
                                            qb=q[9465]or Z(9465,39709,18200)
                                            continue
                                        else
                                            qb=q[-2153]or Z(-2153,23832,7604)
                                            continue
                                        end
                                        qb=q[5238]or Z(5238,111722,52012)
                                    else
                                        if not Q[tc[30895]]then
                                            qb=q[-982]or Z(-982,122301,63412)
                                            continue
                                        end
                                        qb=q[-13901]or Z(-13901,20312,25210)
                                    end
                                elseif qb<=16540 then
                                    if ca>234 then
                                        qb=q[-4377]or Z(-4377,98635,47472)
                                        continue
                                    else
                                        qb=q[-2593]or Z(-2593,39282,13312)
                                        continue
                                    end
                                    qb=q[17565]or Z(17565,122406,62176)
                                else
                                    Ba+=1;
                                    qb=q[32444]or Z(32444,98761,55689)
                                end
                            elseif qb<12360 then
                                if qb>=11709 then
                                    if qb>=11781 then
                                        if qb>11781 then
                                            y,Cb=ic[5559],tc[5559];
                                            Cb='\147\159\253\31\a'..Cb;
                                            k='';
                                            r_,V,qb,H=0,1,q[4740]or Z(4740,126743,35852),#y-1
                                        else
                                            qb,r_=q[21703]or Z(21703,5289,52963),r_..sc(d_(Ob(Cb,_b+1),Ob(k,_b%#k+1)))
                                        end
                                    else
                                        ic,la=nil,Q[tc[30895]];
                                        ic=hb(la)=='function'
                                        if not ic then
                                            qb=q[27337]or Z(27337,104269,47796)
                                            continue
                                        end
                                        qb=36172
                                    end
                                elseif qb<=11507 then
                                    if(_b>=0 and V>kb)or((_b<0 or _b~=_b)and V<kb)then
                                        qb=q[-31066]or Z(-31066,41126,22046)
                                    else
                                        qb=25991
                                    end
                                else
                                    ic,la,y=d_(tc[10092],18),d_(tc[30895],13),d_(tc[43780],167);
                                    Cb,k=la==0 and qa-ic or la-1,Q[ic];
                                    r_,H=E(k(K(Q,ic+1,ic+Cb)))
                                    if y==0 then
                                        qb=q[-13494]or Z(-13494,24208,56756)
                                        continue
                                    else
                                        qb=q[-16484]or Z(-16484,21416,1370)
                                        continue
                                    end
                                    qb=39862
                                end
                            elseif qb>=13104 then
                                if qb<=13264 then
                                    if qb>13104 then
                                        la,y,Cb=zb(la);
                                        qb=q[-7042]or Z(-7042,18978,59420)
                                    else
                                        return K(Q,ic,ic+Cb-1)
                                    end
                                else
                                    Ba+=tc[23170];
                                    qb=q[-18773]or Z(-18773,122833,62449)
                                end
                            elseif qb<=12360 then
                                k,r_=la(y,Cb);
                                Cb=k
                                if Cb==nil then
                                    qb=5377
                                else
                                    qb=q[-20507]or Z(-20507,6305,2105)
                                end
                            else
                                Ba+=1;
                                qb=q[19356]or Z(19356,111172,52606)
                            end
                        elseif qb<5025 then
                            if qb>=3372 then
                                if qb>4607 then
                                    if qb>4751 then
                                        _b=H
                                        if V~=V then
                                            qb=q[22484]or Z(22484,19487,25399)
                                        else
                                            qb=35175
                                        end
                                    else
                                        qb,Q[tc[30895]]=q[24029]or Z(24029,109072,50482),nil
                                    end
                                elseif qb>4445 then
                                    if(r_>=0 and Cb>k)or((r_<0 or r_~=r_)and Cb<k)then
                                        qb=q[-3669]or Z(-3669,120303,62887)
                                    else
                                        qb=64124
                                    end
                                elseif qb<=4117 then
                                    if qb>3372 then
                                        Cb,qb=H,q[7850]or Z(7850,126404,31865)
                                        continue
                                    else
                                        ic=ja[tc[43780]+1];
                                        qb,Q[tc[30895]]=q[5734]or Z(5734,123575,15951),ic[2][ic[1]]
                                    end
                                else
                                    Lb[tc[5559]]=Q[tc[43780]];
                                    Ba+=1;
                                    qb=q[20540]or Z(20540,90495,47127)
                                end
                            elseif qb<1109 then
                                if qb<=150 then
                                    if ca>2 then
                                        qb=q[-13180]or Z(-13180,12359,7768)
                                        continue
                                    else
                                        qb=q[-3667]or Z(-3667,125288,6653)
                                        continue
                                    end
                                    qb=q[3542]or Z(3542,102443,43243)
                                else
                                    qb,qa=q[-24234]or Z(-24234,6541,1250),ic+H-1
                                end
                            elseif qb>=1341 then
                                if qb<=1341 then
                                    tc=Ib[Ba];
                                    ca,qb=tc[35222],q[19875]or Z(19875,45090,32247)
                                else
                                    bc=V
                                    if kb~=kb then
                                        qb=q[-11007]or Z(-11007,125470,61488)
                                    else
                                        qb=q[6418]or Z(6418,129329,57172)
                                    end
                                end
                            else
                                qb,Cb=q[-671]or Z(-671,102698,60233),nil
                            end
                        elseif qb>=7089 then
                            if qb>8791 then
                                if qb>9334 then
                                    ic,la,y=tc[10092],tc[30895],tc[43780]-1
                                    if y==-1 then
                                        qb=q[3529]or Z(3529,2562,12052)
                                        continue
                                    end
                                    qb=q[2562]or Z(2562,38144,28346)
                                else
                                    kb=r_
                                    if H~=H then
                                        qb=q[-31219]or Z(-31219,114039,38511)
                                    else
                                        qb=q[-23379]or Z(-23379,101248,4343)
                                    end
                                end
                            elseif qb>=8585 then
                                if qb>8585 then
                                    if ca>155 then
                                        qb=q[-14967]or Z(-14967,25207,27750)
                                        continue
                                    else
                                        qb=q[-10108]or Z(-10108,111652,51251)
                                        continue
                                    end
                                    qb=q[-19495]or Z(-19495,14971,21787)
                                else
                                    ic=Ja(la)
                                    if ic~=nil and ic.__iter~=nil then
                                        qb=q[-964]or Z(-964,92275,40393)
                                        continue
                                    elseif z(la)=='table'then
                                        qb=q[-22122]or Z(-22122,152,1548)
                                        continue
                                    end
                                    qb=q[2679]or Z(2679,5012,42425)
                                end
                            elseif qb<=7089 then
                                Ba-=1;
                                qb,Ib[Ba]=q[6659]or Z(6659,7809,12865),{[35222]=133,[30895]=d_(tc[30895],29),[43780]=d_(tc[43780],149),[10092]=0}
                            else
                                if ca>15 then
                                    qb=q[19336]or Z(19336,126911,10760)
                                    continue
                                else
                                    qb=q[11755]or Z(11755,854,33965)
                                    continue
                                end
                                qb=q[-25860]or Z(-25860,10560,16386)
                            end
                        elseif qb<5824 then
                            if qb<=5025 then
                                ic,la=tc[30895],tc[43780];
                                y=la-1
                                if y==-1 then
                                    qb=q[22134]or Z(22134,23849,26458)
                                    continue
                                else
                                    qb=q[16118]or Z(16118,101601,54221)
                                    continue
                                end
                                qb=13104
                            else
                                qb=q[-31419]or Z(-31419,88993,39361)
                                continue
                            end
                        elseif qb>=6850 then
                            if qb<=6850 then
                                if Q[tc[30895]]then
                                    qb=q[-11311]or Z(-11311,108615,55722)
                                    continue
                                end
                                qb=q[-15581]or Z(-15581,125987,3299)
                            else
                                k,r_=la(y,Cb);
                                Cb=k
                                if Cb==nil then
                                    qb=q[-11216]or Z(-11216,106984,63914)
                                else
                                    qb=63462
                                end
                            end
                        else
                            Q[tc[43780]]=tc[10092]==1;
                            Ba+=tc[30895];
                            qb=q[5103]or Z(5103,93370,35932)
                        end
                    elseif qb>=27501 then
                        if qb>32166 then
                            if qb>=34158 then
                                if qb<34791 then
                                    if qb>34158 then
                                        qb,la[15647]=q[29969]or Z(29969,11843,29991),Cb
                                    else
                                        ic=S[tc[5559]+1];
                                        la=ic[40384];
                                        y=Ta(la);
                                        Q[tc[30895]]=Bb(ic,y);
                                        Cb,qb,r_,k=1,q[20975]or Z(20975,24732,20849),1,la
                                    end
                                elseif qb<=35175 then
                                    if qb<=34791 then
                                        Ba-=1;
                                        Ib[Ba],qb={[35222]=16,[30895]=d_(tc[30895],104),[43780]=d_(tc[43780],239),[10092]=0},q[-7998]or Z(-7998,13979,19131)
                                    else
                                        if(kb>=0 and H>V)or((kb<0 or kb~=kb)and H<V)then
                                            qb=q[-12134]or Z(-12134,5918,10808)
                                        else
                                            qb=q[11169]or Z(11169,115699,12117)
                                        end
                                    end
                                else
                                    if ca>184 then
                                        qb=q[27802]or Z(27802,4607,47146)
                                        continue
                                    else
                                        qb=q[15030]or Z(15030,101974,63245)
                                        continue
                                    end
                                    qb=q[-29909]or Z(-29909,22724,28926)
                                end
                            elseif qb<33050 then
                                if qb>32259 then
                                    la,y,Cb=zb(la);
                                    qb=q[-29265]or Z(-29265,35337,23764)
                                else
                                    if ca>138 then
                                        qb=q[17361]or Z(17361,46132,19556)
                                        continue
                                    else
                                        qb=q[-30517]or Z(-30517,3114,23566)
                                        continue
                                    end
                                    qb=q[10374]or Z(10374,121352,63178)
                                end
                            elseif qb<33350 then
                                ic,la=nil,d_(tc[46636],60601);
                                ic=if la<32768 then la else la-65536;
                                y=ic;
                                Cb=S[y+1];
                                k=Cb[40384];
                                r_=Ta(k);
                                Q[d_(tc[30895],148)]=Bb(Cb,r_);
                                V,qb,H,kb=k,4898,1,1
                            elseif qb>33350 then
                                if ca>197 then
                                    qb=q[1965]or Z(1965,120417,46950)
                                    continue
                                else
                                    qb=q[-8899]or Z(-8899,5122,51548)
                                    continue
                                end
                                qb=q[-6652]or Z(-6652,108216,64090)
                            else
                                la[5559]=y
                                if ic==2 then
                                    qb=q[-3758]or Z(-3758,50141,31219)
                                    continue
                                elseif ic==3 then
                                    qb=q[20492]or Z(20492,76750,43636)
                                    continue
                                end
                                qb=q[6041]or Z(6041,122895,11499)
                            end
                        elseif qb>28796 then
                            if qb<30889 then
                                if qb<=29531 then
                                    Cb,qb=H,q[15652]or Z(15652,103986,35519)
                                    continue
                                else
                                    if ca>165 then
                                        qb=q[24364]or Z(24364,108821,1472)
                                        continue
                                    else
                                        qb=q[11981]or Z(11981,135,60047)
                                        continue
                                    end
                                    qb=q[-9917]or Z(-9917,113071,53607)
                                end
                            elseif qb>=31204 then
                                if qb<=31204 then
                                    if tc[10092]==207 then
                                        qb=q[21741]or Z(21741,116580,63882)
                                        continue
                                    else
                                        qb=q[-9183]or Z(-9183,61859,26023)
                                        continue
                                    end
                                    qb=q[25353]or Z(25353,19367,26463)
                                else
                                    ic,la,qb,y=tc[65398],Ib[Ba+1],q[-21120]or Z(-21120,79206,33086),nil
                                end
                            else
                                la,y,Cb=ic.__iter(la);
                                qb=q[1160]or Z(1160,10252,31151)
                            end
                        elseif qb<=27835 then
                            if qb<27763 then
                                if qb<=27501 then
                                    X(r_,1,la,ic+3,Q);
                                    Q[ic+2]=Q[ic+3];
                                    Ba+=tc[23170];
                                    qb=q[30838]or Z(30838,7398,15520)
                                else
                                    Q[tc[30895]],qb=y[tc[15647]][tc[45520]],q[6718]or Z(6718,24999,14245)
                                end
                            elseif qb<=27763 then
                                la,qb=k,17482
                                continue
                            else
                                la,y,Cb=ob
                                if z(la)~='function'then
                                    qb=q[-22055]or Z(-22055,13630,53538)
                                    continue
                                end
                                qb=q[15145]or Z(15145,20149,6232)
                            end
                        elseif qb<=27928 then
                            if qb<=27867 then
                                X(Q,la,la+y-1,tc[22300],Q[ic]);
                                Ba+=1;
                                qb=q[8799]or Z(8799,9594,17436)
                            else
                                ic=tc[5559];
                                Q[tc[30895]]=Q[tc[10092]][ic];
                                Ba+=1;
                                qb=q[29716]or Z(29716,122937,14553)
                            end
                        else
                            ic=Ja(la)
                            if ic~=nil and ic.__iter~=nil then
                                qb=q[-32200]or Z(-32200,100341,34871)
                                continue
                            elseif z(la)=='table'then
                                qb=q[-4133]or Z(-4133,80622,35472)
                                continue
                            end
                            qb=q[20244]or Z(20244,868,20615)
                        end
                    elseif qb<=22394 then
                        if qb>20579 then
                            if qb>=21840 then
                                if qb>=21872 then
                                    if qb>21872 then
                                        Q[tc[10092]]=Ta(tc[22300]);
                                        Ba+=1;
                                        qb=q[-17687]or Z(-17687,97861,37245)
                                    else
                                        if ca>172 then
                                            qb=q[-7920]or Z(-7920,116297,20195)
                                            continue
                                        else
                                            qb=q[8135]or Z(8135,53090,28192)
                                            continue
                                        end
                                        qb=q[-21240]or Z(-21240,23326,30264)
                                    end
                                else
                                    r_[_b],qb=vb,q[12390]or Z(12390,110055,14860)
                                end
                            elseif qb<=21213 then
                                ic=tc[5559];
                                Q[tc[43780]]=Lb[ic]or rc[63222][ic];
                                Ba+=1;
                                qb=q[18673]or Z(18673,5675,10987)
                            else
                                if ca>160 then
                                    qb=q[-12524]or Z(-12524,4075,56755)
                                    continue
                                else
                                    qb=q[30984]or Z(30984,29374,30597)
                                    continue
                                end
                                qb=q[13040]or Z(13040,15760,23986)
                            end
                        elseif qb<19673 then
                            if qb>18619 then
                                k,r_=la[15647],tc[15647];
                                r_='\147\159\253\31\a'..r_;
                                H='';
                                V,_b,qb,kb=0,1,q[-13127]or Z(-13127,107212,61877),#k-1
                            elseif qb<=17974 then
                                qb,Q[tc[30895]]=q[-9443]or Z(-9443,41064,30064),y[tc[15647]]
                            else
                                if ca>196 then
                                    qb=q[6008]or Z(6008,26495,22157)
                                    continue
                                else
                                    qb=q[-30608]or Z(-30608,112941,46227)
                                    continue
                                end
                                qb=q[32093]or Z(32093,119996,62550)
                            end
                        elseif qb>=20265 then
                            if qb>20265 then
                                H,qb=y-1,q[-3397]or Z(-3397,93295,38468)
                            else
                                Cb=Cb+r_;
                                H=Cb
                                if Cb~=Cb then
                                    qb=q[23761]or Z(23761,126291,3187)
                                else
                                    qb=q[-26429]or Z(-26429,962,43864)
                                end
                            end
                        elseif qb>19673 then
                            H=Cb
                            if k~=k then
                                qb=q[6582]or Z(6582,108515,64419)
                            else
                                qb=q[7541]or Z(7541,25960,4606)
                            end
                        else
                            H=H+kb;
                            _b=H
                            if H~=H then
                                qb=q[-29307]or Z(-29307,123578,32668)
                            else
                                qb=q[-10052]or Z(-10052,107951,63886)
                            end
                        end
                    elseif qb<=24718 then
                        if qb>=23911 then
                            if qb>=24528 then
                                if qb>24528 then
                                    if tc[10092]==139 then
                                        qb=q[-12749]or Z(-12749,44507,22301)
                                        continue
                                    elseif tc[10092]==180 then
                                        qb=q[3526]or Z(3526,30144,21002)
                                        continue
                                    elseif tc[10092]==223 then
                                        qb=q[-22428]or Z(-22428,23884,26837)
                                        continue
                                    else
                                        qb=q[15402]or Z(15402,4676,47280)
                                        continue
                                    end
                                    qb=q[29986]or Z(29986,5247,11031)
                                else
                                    if(_b>=0 and V>kb)or((_b<0 or _b~=_b)and V<kb)then
                                        qb=q[1579]or Z(1579,22281,9921)
                                    else
                                        qb=52335
                                    end
                                end
                            else
                                if ca>39 then
                                    qb=q[-26673]or Z(-26673,88894,37960)
                                    continue
                                else
                                    qb=q[4669]or Z(4669,103929,43686)
                                    continue
                                end
                                qb=q[28995]or Z(28995,127698,3828)
                            end
                        elseif qb<=23128 then
                            if qb>22441 then
                                qb,V=q[-12118]or Z(-12118,6502,12717),V..sc(d_(Ob(r_,Ac+1),Ob(H,Ac%#H+1)))
                            else
                                Q[tc[30895]],qb=tc[5559],q[3830]or Z(3830,130425,7193)
                            end
                        else
                            Ba-=1;
                            qb,Ib[Ba]=q[-14622]or Z(-14622,128543,2359),{[35222]=147,[30895]=d_(tc[30895],92),[43780]=d_(tc[43780],83),[10092]=0}
                        end
                    elseif qb>=27032 then
                        if qb>27032 then
                            ic,la=tc[65398],tc[5559];
                            y=Lb[la]or rc[63222][la]
                            if ic==1 then
                                qb=q[-1473]or Z(-1473,4767,17089)
                                continue
                            elseif ic==2 then
                                qb=q[5158]or Z(5158,17764,1083)
                                continue
                            elseif ic==3 then
                                qb=q[22844]or Z(22844,14717,2997)
                                continue
                            end
                            qb=q[2753]or Z(2753,55260,24636)
                        else
                            r_[3]=r_[2][r_[1]];
                            r_[2]=r_;
                            r_[1]=3;
                            qb,ub[k]=q[997]or Z(997,121179,60132),nil
                        end
                    elseif qb<=24779 then
                        Ba-=1;
                        Ib[Ba],qb={[35222]=2,[30895]=d_(tc[30895],67),[43780]=d_(tc[43780],44),[10092]=0},q[11179]or Z(11179,15669,24013)
                    else
                        H,qb=H..sc(d_(Ob(k,bc+1),Ob(r_,bc%#r_+1))),q[-23091]or Z(-23091,127290,43771)
                    end
                elseif qb>50286 then
                    if qb>=59968 then
                        if qb<=62878 then
                            if qb<61749 then
                                if qb<=60926 then
                                    if qb>=60304 then
                                        if qb<=60304 then
                                            if ca>53 then
                                                qb=q[30687]or Z(30687,110962,51220)
                                                continue
                                            else
                                                qb=q[10309]or Z(10309,6985,47770)
                                                continue
                                            end
                                            qb=q[9702]or Z(9702,126537,265)
                                        else
                                            Ba-=1;
                                            Ib[Ba],qb={[35222]=207,[30895]=d_(tc[30895],151),[43780]=d_(tc[43780],148),[10092]=0},q[25873]or Z(25873,1302,9264)
                                        end
                                    elseif qb<=59968 then
                                        ic,la,y=tc[10092],tc[30895],tc[5559];
                                        Cb=Q[la];
                                        Q[ic+1]=Cb;
                                        Q[ic]=Cb[y];
                                        Ba+=1;
                                        qb=q[24022]or Z(24022,125923,1955)
                                    else
                                        la,y,Cb=zb(la);
                                        qb=q[13631]or Z(13631,83797,40150)
                                    end
                                elseif qb<=61172 then
                                    k={y(Q[ic+1],Q[ic+2])};
                                    X(k,1,la,ic+3,Q)
                                    if Q[ic+3]~=nil then
                                        qb=q[6656]or Z(6656,118187,23165)
                                        continue
                                    else
                                        qb=q[-25305]or Z(-25305,6904,8729)
                                        continue
                                    end
                                    qb=q[25111]or Z(25111,8508,31190)
                                else
                                    H=H+kb;
                                    _b=H
                                    if H~=H then
                                        qb=q[-14303]or Z(-14303,24210,29364)
                                    else
                                        qb=35175
                                    end
                                end
                            elseif qb<=62240 then
                                if qb<61990 then
                                    if qb<=61749 then
                                        Cb,k=la[5559],tc[5559];
                                        k='\147\159\253\31\a'..k;
                                        r_='';
                                        V,H,qb,kb=#Cb-1,0,q[24937]or Z(24937,16275,30251),1
                                    else
                                        Q[ic+2]=Q[ic+3];
                                        Ba+=tc[23170];
                                        qb=q[-16177]or Z(-16177,126285,3077)
                                    end
                                elseif qb<=61990 then
                                    Kb=bc[43780];
                                    vb=ub[Kb]
                                    if vb==nil then
                                        qb=q[32464]or Z(32464,96507,38842)
                                        continue
                                    end
                                    qb=21840
                                else
                                    if r_==-2 then
                                        qb=q[24503]or Z(24503,108050,54202)
                                        continue
                                    else
                                        qb=q[495]or Z(495,18600,23376)
                                        continue
                                    end
                                    qb=q[21182]or Z(21182,104331,43851)
                                end
                            elseif qb>62341 then
                                if(V>=0 and r_>H)or((V<0 or V~=V)and r_<H)then
                                    qb=q[31290]or Z(31290,9693,16341)
                                else
                                    qb=q[-19982]or Z(-19982,111622,54084)
                                end
                            else
                                Ba-=1;
                                qb,Ib[Ba]=q[9773]or Z(9773,117987,60579),{[35222]=153,[30895]=d_(tc[30895],172),[43780]=d_(tc[43780],125),[10092]=0}
                            end
                        elseif qb>=63843 then
                            if qb>=64124 then
                                if qb<64231 then
                                    V=Ib[Ba];
                                    Ba+=1;
                                    kb=V[30895]
                                    if kb==0 then
                                        qb=q[7043]or Z(7043,99005,61596)
                                        continue
                                    elseif kb==2 then
                                        qb=q[30851]or Z(30851,7756,319)
                                        continue
                                    end
                                    qb=q[11430]or Z(11430,19926,1178)
                                elseif qb<=64231 then
                                    qb,Cb=q[-4116]or Z(-4116,14655,62554),nil
                                else
                                    Ba-=1;
                                    qb,Ib[Ba]=q[-32078]or Z(-32078,109451,51019),{[35222]=215,[30895]=d_(tc[30895],118),[43780]=d_(tc[43780],183),[10092]=0}
                                end
                            elseif qb>63843 then
                                if ca>215 then
                                    qb=q[-14052]or Z(-14052,106096,59342)
                                    continue
                                else
                                    qb=q[8524]or Z(8524,17728,17775)
                                    continue
                                end
                                qb=q[-14397]or Z(-14397,81990,40704)
                            else
                                qb,la[45520]=q[-5816]or Z(-5816,122527,58971),k
                            end
                        elseif qb>=63462 then
                            if qb>=63626 then
                                if qb<=63626 then
                                    r_=r_+V;
                                    kb=r_
                                    if r_~=r_ then
                                        qb=q[7872]or Z(7872,3574,59376)
                                    else
                                        qb=q[-23647]or Z(-23647,79958,32933)
                                    end
                                else
                                    if ca>239 then
                                        qb=q[-27430]or Z(-27430,127191,23557)
                                        continue
                                    else
                                        qb=q[-26980]or Z(-26980,22211,5946)
                                        continue
                                    end
                                    qb=q[-22355]or Z(-22355,109621,52429)
                                end
                            else
                                if r_[1]>=tc[30895]then
                                    qb=q[-23448]or Z(-23448,15865,22630)
                                    continue
                                end
                                qb=q[-6523]or Z(-6523,28407,5575)
                            end
                        elseif qb>63192 then
                            Ba-=1;
                            Ib[Ba],qb={[35222]=78,[30895]=d_(tc[30895],22),[43780]=d_(tc[43780],146),[10092]=0},q[19124]or Z(19124,109275,50939)
                        else
                            la[15647]=Cb;
                            qb,k=42425,nil
                        end
                    elseif qb<53959 then
                        if qb<=51931 then
                            if qb<51640 then
                                if qb<=50935 then
                                    if qb<=50336 then
                                        Ba-=1;
                                        qb,Ib[Ba]=q[-3821]or Z(-3821,103924,46478),{[35222]=138,[30895]=d_(tc[30895],39),[43780]=d_(tc[43780],36),[10092]=0}
                                    else
                                        ic,la=tc[30895],tc[5559];
                                        qa=ic+6;
                                        y,Cb=Q[ic],nil;
                                        Cb=hb(y)=='function'
                                        if Cb then
                                            qb=q[-12475]or Z(-12475,75436,45765)
                                            continue
                                        else
                                            qb=q[-21905]or Z(-21905,75346,38272)
                                            continue
                                        end
                                        qb=q[-23377]or Z(-23377,124422,15040)
                                    end
                                else
                                    ic,la=nil,d_(tc[46636],43968);
                                    ic=if la<32768 then la else la-65536;
                                    y=ic;
                                    qb,Q[d_(tc[30895],201)]=q[-24151]or Z(-24151,125526,1392),y
                                end
                            elseif qb<51913 then
                                if ca>101 then
                                    qb=q[18756]or Z(18756,18591,808)
                                    continue
                                else
                                    qb=q[-8834]or Z(-8834,82118,45366)
                                    continue
                                end
                                qb=q[1550]or Z(1550,23126,30064)
                            elseif qb>51913 then
                                _b=H
                                if V~=V then
                                    qb=q[8313]or Z(8313,86216,43466)
                                else
                                    qb=43692
                                end
                            else
                                Q[tc[30895]],qb=y,q[-28232]or Z(-28232,45426,18010)
                            end
                        elseif qb<=52381 then
                            if qb<=52364 then
                                if qb<=52335 then
                                    H,qb=H..sc(d_(Ob(k,bc+1),Ob(r_,bc%#r_+1))),q[-25663]or Z(-25663,43198,25265)
                                else
                                    _b={[3]=Q[V[43780]],[1]=3};
                                    _b[2]=_b;
                                    y[H],qb=_b,q[-4303]or Z(-4303,36179,31517)
                                end
                            else
                                if ca>75 then
                                    qb=q[7202]or Z(7202,17912,26010)
                                    continue
                                else
                                    qb=q[-14240]or Z(-14240,121402,10271)
                                    continue
                                end
                                qb=q[32407]or Z(32407,119551,61079)
                            end
                        else
                            if ca>110 then
                                qb=q[15154]or Z(15154,56749,26843)
                                continue
                            else
                                qb=q[30761]or Z(30761,13205,7895)
                                continue
                            end
                            qb=q[-14944]or Z(-14944,117844,58222)
                        end
                    elseif qb<58413 then
                        if qb<=55350 then
                            if qb>54801 then
                                if tc[10092]==8 then
                                    qb=q[-21047]or Z(-21047,130173,20067)
                                    continue
                                elseif tc[10092]==111 then
                                    qb=q[13441]or Z(13441,125709,30368)
                                    continue
                                elseif tc[10092]==195 then
                                    qb=q[-18128]or Z(-18128,74396,39145)
                                    continue
                                elseif tc[10092]==205 then
                                    qb=q[16531]or Z(16531,109818,38318)
                                    continue
                                else
                                    qb=q[3454]or Z(3454,110365,56248)
                                    continue
                                end
                                qb=q[28470]or Z(28470,109563,51099)
                            elseif qb<=53959 then
                                k,r_=fa_(ob[tc],y,Q[ic+1],Q[ic+2])
                                if not k then
                                    qb=q[29327]or Z(29327,79166,37968)
                                    continue
                                end
                                qb=q[-1748]or Z(-1748,67974,40051)
                            else
                                bc=Ib[Ba];
                                Ba+=1;
                                Ac=bc[30895]
                                if Ac==0 then
                                    qb=q[-24110]or Z(-24110,1161,18094)
                                    continue
                                elseif Ac==1 then
                                    qb=q[17510]or Z(17510,117339,20776)
                                    continue
                                elseif Ac==2 then
                                    qb=q[-25593]or Z(-25593,125683,13258)
                                    continue
                                end
                                qb=q[12257]or Z(12257,87419,41608)
                            end
                        elseif qb<=55741 then
                            qb,ic,la=11871,Ib[Ba],nil
                        else
                            k,r_=la[15647],tc[15647];
                            r_='\147\159\253\31\a'..r_;
                            H='';
                            kb,_b,V,qb=#k-1,1,0,2510
                        end
                    elseif qb<59099 then
                        if qb>58535 then
                            qb,y=q[29421]or Z(29421,122639,57300),r_
                            continue
                        elseif qb>58413 then
                            k,qb=V,63843
                            continue
                        else
                            if ca>23 then
                                qb=q[-21974]or Z(-21974,24564,1274)
                                continue
                            else
                                qb=q[6576]or Z(6576,91203,36995)
                                continue
                            end
                            qb=q[26010]or Z(26010,121285,61949)
                        end
                    elseif qb>=59167 then
                        if qb>59167 then
                            if ca>153 then
                                qb=q[5386]or Z(5386,113297,62733)
                                continue
                            else
                                qb=q[5892]or Z(5892,3444,53075)
                                continue
                            end
                            qb=q[-3584]or Z(-3584,3208,11338)
                        else
                            X(Sb[4988],1,la,ic,Q);
                            qb=q[28358]or Z(28358,5462,13424)
                        end
                    else
                        O(r_);
                        qb=q[26266]or Z(26266,74489,43340)
                    end
                elseif qb>=42438 then
                    if qb<=45468 then
                        if qb>=43692 then
                            if qb>44266 then
                                if qb<=45139 then
                                    if ca>107 then
                                        qb=q[25290]or Z(25290,97931,33885)
                                        continue
                                    else
                                        qb=q[10356]or Z(10356,102568,52613)
                                        continue
                                    end
                                    qb=q[-14924]or Z(-14924,119918,60200)
                                else
                                    r_[_b],qb=ja[bc[43780]+1],q[-3009]or Z(-3009,127843,17552)
                                end
                            elseif qb>=44148 then
                                if qb<=44148 then
                                    Ba+=tc[23170];
                                    qb=q[14353]or Z(14353,105427,47091)
                                else
                                    k,r_=la(y,Cb);
                                    Cb=k
                                    if Cb==nil then
                                        qb=q[11843]or Z(11843,11166,14800)
                                    else
                                        qb=q[-12246]or Z(-12246,4978,58191)
                                    end
                                end
                            elseif qb>43692 then
                                bc=V
                                if kb~=kb then
                                    qb=q[23828]or Z(23828,33209,14103)
                                else
                                    qb=11507
                                end
                            else
                                if(kb>=0 and H>V)or((kb<0 or kb~=kb)and H<V)then
                                    qb=q[-18317]or Z(-18317,99323,6363)
                                else
                                    qb=q[-7312]or Z(-7312,128247,35933)
                                end
                            end
                        elseif qb>43334 then
                            if qb>43390 then
                                la,y,Cb=ic.__iter(la);
                                qb=q[-3814]or Z(-3814,57203,17739)
                            else
                                if ca>142 then
                                    qb=q[-11903]or Z(-11903,85729,41086)
                                    continue
                                else
                                    qb=q[19138]or Z(19138,121770,57148)
                                    continue
                                end
                                qb=q[-27305]or Z(-27305,19962,28060)
                            end
                        elseif qb<=42804 then
                            if qb<42579 then
                                kb=kb+bc;
                                Ac=kb
                                if kb~=kb then
                                    qb=q[8849]or Z(8849,76398,34644)
                                else
                                    qb=q[14399]or Z(14399,119144,65162)
                                end
                            elseif qb>42579 then
                                vb={[1]=Kb,[2]=Q};
                                ub[Kb],qb=vb,q[-13662]or Z(-13662,123318,51795)
                            else
                                if not pc then
                                    qb=q[-23815]or Z(-23815,64198,30614)
                                    continue
                                end
                                qb=14656
                            end
                        else
                            if ca>38 then
                                qb=q[9551]or Z(9551,14601,5359)
                                continue
                            else
                                qb=q[-3039]or Z(-3039,32677,26058)
                                continue
                            end
                            qb=q[72]or Z(72,14148,19070)
                        end
                    elseif qb<=47015 then
                        if qb<=46513 then
                            if qb>46460 then
                                if ca>133 then
                                    qb=q[13301]or Z(13301,116107,5794)
                                    continue
                                else
                                    qb=q[-31098]or Z(-31098,40311,25086)
                                    continue
                                end
                                qb=q[-29811]or Z(-29811,96857,38265)
                            elseif qb>45828 then
                                la,y,Cb=ub
                                if z(la)~='function'then
                                    qb=q[-27453]or Z(-27453,92138,38523)
                                    continue
                                end
                                qb=q[21998]or Z(21998,1141,44613)
                            elseif qb<=45524 then
                                Ba+=1;
                                qb=q[-22251]or Z(-22251,113896,56490)
                            else
                                Ba-=1;
                                Ib[Ba],qb={[35222]=184,[30895]=d_(tc[30895],104),[43780]=d_(tc[43780],56),[10092]=0},q[-11718]or Z(-11718,96930,38500)
                            end
                        elseif qb<=46849 then
                            qa,Ba,ub,ob,qb,pc=-1,1,e_({},{__mode='vs'}),e_({},{__mode='ks'}),42579,false
                        else
                            Cb,qb=la-1,q[-23321]or Z(-23321,26419,14070)
                        end
                    elseif qb>48193 then
                        if qb>48930 then
                            Kb={[3]=Q[bc[43780]],[1]=3};
                            Kb[2]=Kb;
                            qb,r_[_b]=q[25637]or Z(25637,99540,4443),Kb
                        else
                            if tc[10092]==53 then
                                qb=q[-19814]or Z(-19814,75447,45604)
                                continue
                            else
                                qb=q[-31847]or Z(-31847,28195,7050)
                                continue
                            end
                            qb=q[11337]or Z(11337,125966,3272)
                        end
                    elseif qb<=48098 then
                        if qb<=47663 then
                            tc[35222]=107;
                            Ba+=1;
                            qb=q[8302]or Z(8302,23959,32175)
                        else
                            qb,Cb=q[-30936]or Z(-30936,129506,35911),qa-ic+1
                        end
                    else
                        if ca>121 then
                            qb=q[5901]or Z(5901,45359,9949)
                            continue
                        else
                            qb=q[15159]or Z(15159,114775,14005)
                            continue
                        end
                        qb=q[-8805]or Z(-8805,123628,16038)
                    end
                elseif qb<38564 then
                    if qb>=36352 then
                        if qb<=37636 then
                            if qb<=37331 then
                                if qb>=37149 then
                                    if qb<=37149 then
                                        la,y,Cb=ic.__iter(la);
                                        qb=q[-28148]or Z(-28148,10192,61949)
                                    else
                                        if ca>16 then
                                            qb=q[1658]or Z(1658,130094,48206)
                                            continue
                                        else
                                            qb=q[-26786]or Z(-26786,45259,21867)
                                            continue
                                        end
                                        qb=q[-14912]or Z(-14912,104166,43680)
                                    end
                                else
                                    if tc[10092]==133 then
                                        qb=q[-10652]or Z(-10652,82518,50704)
                                        continue
                                    else
                                        qb=q[-3903]or Z(-3903,19375,24724)
                                        continue
                                    end
                                    qb=q[8917]or Z(8917,104214,43568)
                                end
                            else
                                ic=Ja(la)
                                if ic~=nil and ic.__iter~=nil then
                                    qb=q[-13627]or Z(-13627,23515,27554)
                                    continue
                                elseif z(la)=='table'then
                                    qb=q[-19778]or Z(-19778,10867,61590)
                                    continue
                                end
                                qb=q[1617]or Z(1617,14151,56759)
                            end
                        elseif qb>38308 then
                            qb,y[H]=q[11628]or Z(11628,119986,33662),ja[V[43780]+1]
                        else
                            ic=tc[5559];
                            Q[tc[10092]][ic]=Q[tc[30895]];
                            Ba+=1;
                            qb=q[10181]or Z(10181,17777,25617)
                        end
                    elseif qb>36172 then
                        if qb<=36304 then
                            Q[tc[30895]],qb=Q[tc[43780]],q[-18557]or Z(-18557,121644,63462)
                        else
                            f_(r_);
                            qb,ob[k]=q[-2209]or Z(-2209,21971,58366),nil
                        end
                    elseif qb>=36045 then
                        if qb>36045 then
                            Ba+=tc[23170];
                            qb=q[29089]or Z(29089,123276,14662)
                        else
                            ob[tc]=nil;
                            Ba+=1;
                            qb=q[24653]or Z(24653,1932,23366)
                        end
                    else
                        Ba+=tc[23170];
                        qb=q[31295]or Z(31295,112015,54599)
                    end
                elseif qb>=40166 then
                    if qb<=42307 then
                        if qb>41734 then
                            Ac=kb
                            if _b~=_b then
                                qb=q[-28703]or Z(-28703,114686,7620)
                            else
                                qb=q[18832]or Z(18832,99216,44050)
                            end
                        elseif qb<40655 then
                            if ca>33 then
                                qb=q[-15487]or Z(-15487,21564,11665)
                                continue
                            else
                                qb=q[10763]or Z(10763,14089,52426)
                                continue
                            end
                            qb=q[-20324]or Z(-20324,107980,50566)
                        elseif qb<=40655 then
                            k,qb=k..sc(d_(Ob(y,kb+1),Ob(Cb,kb%#Cb+1))),q[11824]or Z(11824,7183,24848)
                        else
                            r_[3]=r_[2][r_[1]];
                            r_[2]=r_;
                            r_[1]=3;
                            qb,ub[k]=q[-1683]or Z(-1683,127371,40067),nil
                        end
                    elseif qb<=42406 then
                        ic,la=tc[30895],tc[43780]-1
                        if la==-1 then
                            qb=q[-7970]or Z(-7970,14958,62310)
                            continue
                        end
                        qb=59167
                    else
                        r_,H=la[45520],tc[45520];
                        H='\147\159\253\31\a'..H;
                        V='';
                        _b,qb,bc,kb=#r_-1,42307,1,0
                    end
                elseif qb>=39155 then
                    if qb>=39862 then
                        if qb<=39862 then
                            X(r_,1,H,ic,Q);
                            qb=q[31244]or Z(31244,109862,52704)
                        else
                            qb,y=q[-20607]or Z(-20607,17902,24096),qa-la+1
                        end
                    else
                        if(bc>=0 and kb>_b)or((bc<0 or bc~=bc)and kb<_b)then
                            qb=q[3733]or Z(3733,6235,29095)
                        else
                            qb=q[-15300]or Z(-15300,109592,38709)
                        end
                    end
                elseif qb>38564 then
                    la,y,Cb=ub
                    if z(la)~='function'then
                        qb=q[-22519]or Z(-22519,113394,36075)
                        continue
                    end
                    qb=q[-11405]or Z(-11405,2836,22679)
                else
                    O'';
                    qb=q[-3722]or Z(-3722,107965,56924)
                end
            end
        end
        return function(...)
            local qc,Ya,Rb,Ha,va,gc,wc,Na,I,cb,Ia;
            Ia,Ya=function(Cc,p,xc)
                Ya[p]=tb(xc,8654)-tb(Cc,55541)
                return Ya[p]
            end,{};
            Ha=Ya[-16200]or Ia(51538,-16200,37162)
            while Ha~=67 do
                if Ha>=37581 then
                    if Ha<43018 then
                        if Ha>37581 then
                            Rb,va,wc=yb(...),Ta(sb[15157]),{[4988]={},[58405]=0};
                            X(Rb,1,sb[47227],0,va)
                            if sb[47227]<Rb.n then
                                Ha=Ya[-17314]or Ia(1620,-17314,79473)
                                continue
                            end
                            Ha=Ya[14259]or Ia(55598,14259,34859)
                        else
                            Na,Ha=hb(Na),Ya[28942]or Ia(10499,28942,82588)
                        end
                    elseif Ha>43018 then
                        Na,cb=I[2],nil;
                        qc=Na;
                        cb=hb(qc)=='string'
                        if cb==false then
                            Ha=Ya[4657]or Ia(41330,4657,77210)
                            continue
                        end
                        Ha=Ya[29555]or Ia(3930,29555,92357)
                    else
                        I,gc=E(Qa(na,va,sb[53665],sb[30105],wc))
                        if I[1]then
                            Ha=Ya[28065]or Ia(32636,28065,67839)
                            continue
                        else
                            Ha=Ya[-27165]or Ia(45256,-27165,78871)
                            continue
                        end
                        Ha=13541
                    end
                elseif Ha<29020 then
                    if Ha>13541 then
                        I,gc=sb[47227]+1,Rb.n-sb[47227];
                        wc[58405]=gc;
                        X(Rb,I,I+gc-1,1,wc[4988]);
                        Ha=Ya[30690]or Ia(28091,30690,97430)
                    else
                        Ha=Ya[10212]or Ia(6841,10212,58177)
                        continue
                    end
                elseif Ha<=29020 then
                    return O(Na,0)
                else
                    return K(I,2,gc)
                end
            end
        end
    end
    return Bb(Dc,uc)
end)
local ga;
ga,yc={[0]=0},function()
    ga[0]=ga[0]+1
    return{[1]=ga[0],[2]=ga}
end;
W=Fa
return(function()
    return W(gb(Tb'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'),{})
end)()(...)
