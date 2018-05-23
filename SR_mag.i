require,"yao.i";

window,33,wait=1;

//SR calculation with ngsmag 
// read out parfile

aoread,"ulas_pyr.par"; //"SH_trial1.par"; //"ulas_pyr.par"; //

gsmagv = [8]; //[8,9,10,11,12]; //[8,9,10,11,12,13,14]; //[8]; 
n_gsmag = numberof(gsmagv)

strehlarray = array(0.,[1,n_gsmag]);

// loop on guide star magnitudes

for (i=1; i<=n_gsmag; i++) {
  
    wfs(1).gsmag=gsmagv(i);
    
    aoinit,disp=1;
    aoloop,disp=1;
    go, all=1;
    
    strehlarray(i) = strehllp(0); // fill in result array
    
    //window,33;
    //fma;
    for (j=1; j<=i; j++){
    plg,strehlarray(j),gsmagv(j),color=color;
    plp,strehlarray(j),gsmagv(j),color=color,symbol=4,size=0.6;
    write, file, gsmagv(j), strehlarray(j);
    close,file;
    //logxy,1,0;
    //xytitles,"mag",swrite(format="Strehl @ %.2fmicrons",(*target.lambda)(0));
    //window,0;
    }
 }
