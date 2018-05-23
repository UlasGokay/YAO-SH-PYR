require,"yao.i";

window,33,wait=1;

// read out parfile
aoread,"ulas_sh_loop.par";

gsmagv = [6,7,8,9,10,11,12];
gainv  = [0.1,0.5,1.0,2.0];

strehlarray = array(0.,[2,numberof(gsmagv),numberof(gainv)]);

// loop on gsmag and gain
for (ii=1;ii<=numberof(gsmagv);ii++) {
  for (jj=1;jj<=numberof(gainv);jj++) {
    wfs(1).gsmag=gsmagv(ii);
    loop.gain=gainv(jj);

    aoinit,disp=1;
    aoloop,disp=1;
    go, all=1;
    
    strehlarray(ii,jj) = strehllp(0); // fill in result array
    
    window,33;
    fma;
    for (ll=1;ll<=ii;ll++) {
      plg,strehlarray(ll,),gainv,color=color;
      plp,strehlarray(ll,),gainv,color=color,symbol=4,size=0.6;
      ylims=limits()(3:4); ymax=ylims(2); yspace=(ylims(2)-ylims(1))/15.;
      plt,swrite(format="gsmag=%d",gsmagv(ll)),0.011,ymax-yspace*(ll-1), \
        justify="LT",tosys=1,color=-ll-4;
    }
    logxy,1,0;
    xytitles,"Loop Gain",swrite(format="Strehl @ %.2fmicrons",(*target.lambda)(0));
    window,0;
  }
 }
