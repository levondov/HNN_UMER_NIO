qf=1.790;
qd=1.790;


ao=getao;

ao.QF.SetPoints(1:end-1) = qf;
ao.QD.SetPoints(1:end-1) = qd;

setao(ao);
umerlat_oct;
plottwiss