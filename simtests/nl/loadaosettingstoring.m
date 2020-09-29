

ao=getao;

% QF
fprintf(['Loading QF \n']);
mnames = getidx(getfamily('F quad'));
setc(mnames,ao.QF.SetPoints(1:end-1));
setc('QR1',ao.QF.SetPoints(end));

% QD
fprintf(['Loading QD \n']);
mnames = getidx(getfamily('D quad'));
setc(mnames,ao.QD.SetPoints(1:end-1));
setc('YQ',ao.QD.SetPoints(end));

% VCM
fprintf(['Loading VCM \n']);
mnames = getidx(getfamily('VCM'));
setc(mnames(2:end),ao.VCM.SetPoints);

% dipoles
fprintf(['Loading BEND \n']);
mnames = getidx(getfamily('dipole'));
setc(mnames,ao.BEND.SetPoints(1:end-1));
setc('PDRec',ao.BEND.SetPoints(end));

% HH
fprintf(['Loading HH \n']);
mnames = getidx(getfamily('HH'));
setc(mnames,ao.HH.SetPoints(1:end-1));