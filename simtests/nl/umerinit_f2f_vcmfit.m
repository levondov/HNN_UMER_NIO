function umerinit_f2f_vcmfit()
%UMERINIT - MML initialization program for University of Maryland accelerator


%==========================
% Accelerator Family Fields
%==========================
% FamilyName            BPMx, HCM, etc
% Position              m, magnet center  (often overwritten in updateatindex)
% CommonNames           Shortcut name for each element
% FitParams             List of fit parameters for model (PS eff, PS, L eff, L)


% NOTES
%

% Clear the AO 
setao([]); 


%%%%%%%%%%%%%%%
%  BPMx/BPMy  %
%%%%%%%%%%%%%%%

% BPMx, N = 14
BPMcell = {
'RC1'
'RC2'
'RC3'
'RC4'
'RC5'
'RC6'
'RC7'
'RC8'
'RC9'
'RC10'
'RC11'
'RC12'
'RC13'
'RC14'
'RC15'
'RC16'
'RC17'
'RC18'
};

AO.BPM.FamilyName  = 'BPM';
AO.BPM.Position    = 0.32:0.64:0.64*18;
AO.BPM.CommonNames = BPMcell;
AO.BPM.Gains = ones(length(BPMcell),2); % x,y
AO.BPM.Rolls = zeros(length(BPMcell),2); %x,y
AO.BPM.MisAlign = zeros(length(BPMcell),2);

% HH
HHcell= {
'HH1'
'HH2'
'HH3'
'HH4'
'HH5'
'HH6'
'HH7'
'HH8'
'HH9'
'HH10'
'H11'
'HH12'
'HH13'
'HH14'
'HH15'
'HH16'
'HH17'
'HH18'
};

% eff PS , PS , eff L, L
FitParamHH = [
   1   0.0000505   1   0.064
   1   0.0000505   1   0.064
   1   0.0000505   1   0.064
   1   0.0000505   1   0.064
   1   0.0000505   1   0.064
   1   0.0000505   1   0.064
   1   0.0000505   1   0.064
   1   0.0000505   1   0.064
   1   0.0000505   1   0.064
   1   0.0000505   1   0.064
   1   0.0000505   1   0.064
   1   0.0000505   1   0.064
   1   0.0000505   1   0.064
   1   0.0000505   1   0.064
   1   0.0000505   1   0.064
   1   0.0000505   1   0.064
   1   0.0000505   1   0.064   
   1   0.0000505   1   0.064      
];

AO.HH.FamilyName  = 'HH';
AO.HH.Position    = 0:0.64:0.64*18;
AO.HH.CommonNames = HHcell; % same as channel names
AO.HH.FitParams = FitParamHH;
AO.HH.Rolls = zeros(length(HHcell),1); % x,y
AO.HH.MisAlign = zeros(length(HHcell),2);
AO.HH.SetPoints = [csvread('hh.csv');0.0,0.0];

% VCM
VCMcell= {
'RSV1'
'RSV2'
'RSV3'
'RSV4'
'RSV5'
'RSV6'
'RSV7'
'RSV8'
'RSV9'
'RSV10'
'RSV11'
'RSV12'
'RSV13'
'RSV14'
'RSV15'
'RSV16'
'RSV17'
'RSV18'
};

% eff PS , PS , eff L, L
FitParamVCM = [
   1   0.0000685   1   0.0380
   1   0.0000685   1   0.0380
   1   0.0000685   1   0.0380
   1   0.0000685   1   0.0380
   1   0.0000685   1   0.0380
   1   0.0000685   1   0.0380
   1   0.0000685   1   0.0380
   1   0.0000685   1   0.0380
   1   0.0000685   1   0.0380
   1   0.0000685   1   0.0380
   1   0.0000685   1   0.0380
   1   0.0000685   1   0.0380
   1   0.0000685   1   0.0380
   1   0.0000685   1   0.0380
   1   0.0000685   1   0.0380
   1   0.0000685   1   0.0380
   1   0.0000685   1   0.0380
   1   0.0000685   1   0.0380   
];

AO.VCM.FamilyName  = 'VCM';
AO.VCM.Position    = 0:0.64:0.64*18;
AO.VCM.CommonNames = VCMcell; % same as channel names
AO.VCM.FitParams = FitParamVCM;
AO.VCM.Rolls = zeros(length(VCMcell),1); % x,y
AO.VCM.MisAlign = zeros(length(VCMcell),2);
AO.VCM.SetPoints = [
    0.2492
   -0.8343
    0.0833
   -0.0941
    0.4469
    0.4690
    0.1436
    0.0988
   -0.1407
   -0.2870
    0.3889
    0.1843
    0.8040
    0.0059
    0.1511
   -0.4961
   -0.4110
    0.2153];


%%%%%%%%%%%%%%%
% Quadrupoles %
%%%%%%%%%%%%%%%

% QF, N = 36
QFcell = {
'QR3'
'QR5'
'QR7'
'QR9'
'QR11'
'QR13'
'QR15'
'QR17'
'QR19'
'QR21'
'QR23'
'QR25'
'QR27'
'QR29'
'QR31'
'QR33'
'QR35'
'QR37'
'QR39'
'QR41'
'QR43'
'QR45'
'QR47'
'QR49'
'QR51'
'QR53'
'QR55'
'QR57'
'QR59'
'QR61'
'QR63'
'QR65'
'QR67'
'QR69'
'QR71'
'QR1'
};

% eff PS , PS , eff L, L
FitParamQF = [
   0.693730062806438   0.036080000000000   1.099654120132369   0.046500000000000
   0.693730062806438   0.036080000000000   1.207173821864883   0.046500000000000
   0.693730062806438   0.036080000000000   1.235838224398191   0.046500000000000
   0.693730062806438   0.036080000000000   1.137573921963527   0.046500000000000
   0.693730062806438   0.036080000000000   1.076631465186062   0.046500000000000
   0.693730062806438   0.036080000000000   1.159351978078296   0.046500000000000
   0.693730062806438   0.036080000000000   1.173132455586443   0.046500000000000
   0.693730062806438   0.036080000000000   1.165559765651866   0.046500000000000
   0.693730062806438   0.036080000000000   1.169533927095058   0.046500000000000
   0.693730062806438   0.036080000000000   1.261440293825151   0.046500000000000
   0.693730062806438   0.036080000000000   1.186941839363920   0.046500000000000
   0.693730062806438   0.036080000000000   1.175948009293625   0.046500000000000
   0.693730062806438   0.036080000000000   1.213004522473014   0.046500000000000
   0.693730062806438   0.036080000000000   1.145276363774914   0.046500000000000
   0.693730062806438   0.036080000000000   1.106742920610443   0.046500000000000
   0.693730062806438   0.036080000000000   1.144651497174351   0.046500000000000
   0.693730062806438   0.036080000000000   1.206790865388268   0.046500000000000
   0.693730062806438   0.036080000000000   1.238048691468683   0.046500000000000
   0.693730062806438   0.036080000000000   1.189568263341488   0.046500000000000
   0.693730062806438   0.036080000000000   1.132156953367437   0.046500000000000
   0.693730062806438   0.036080000000000   1.203965497027807   0.046500000000000
   0.693730062806438   0.036080000000000   1.183446909676609   0.046500000000000
   0.693730062806438   0.036080000000000   1.140912711382879   0.046500000000000
   0.693730062806438   0.036080000000000   1.163095621321370   0.046500000000000
   0.693730062806438   0.036080000000000   1.189606821804012   0.046500000000000
   0.693730062806438   0.036080000000000   1.151375836441506   0.046500000000000
   0.693730062806438   0.036080000000000   1.184786527281108   0.046500000000000
   0.693730062806438   0.036080000000000   1.255988081518470   0.046500000000000
   0.693730062806438   0.036080000000000   1.221833760682590   0.046500000000000
   0.693730062806438   0.036080000000000   1.183567770011812   0.046500000000000
   0.693730062806438   0.036080000000000   1.221142333676286   0.046500000000000
   0.693730062806438   0.036080000000000   1.227372815218598   0.046500000000000
   0.693730062806438   0.036080000000000   1.144556032339879   0.046500000000000
   0.693730062806438   0.036080000000000   1.200843131163870   0.046500000000000
   0.693730062806438   0.036080000000000   1.173651488901723   0.046500000000000
   0.627825669912040   0.010100000000000   1.399862802973434   0.054000000000000
];

AO.QF.FamilyName  = 'QF';
AO.QF.Position    = .24:.32:.32*36;
AO.QF.CommonNames = QFcell; % same as channel names
AO.QF.FitParams = FitParamQF;
AO.QF.MisAlign = zeros(36,2);
AO.QF.Rolls = zeros(36,1);
AO.QF.SetPoints = [
   1.653226500574732
   1.653226500574732
   1.653226500574732
   1.653226500574732
   1.225983786543065
   1.976170630909515
   1.826000000000000
   1.037947664386050
   2.034390742413482
   1.630103319779710
   1.653226500574732
   1.653226500574732
   1.653226500574732
   1.653226500574732
   1.653226500574732
   1.653226500574732
   1.653226500574732
   1.653226500574732
   1.653226500574732
   1.653226500574732
   1.653226500574732
   1.653226500574732
   1.653226500574732
   1.653226500574732
   1.653226500574732
   1.653226500574732
   1.653226500574732
   1.653226500574732
   1.653226500574732
   1.653226500574732
   1.653226500574732
   1.653226500574732
   1.653226500574732
   1.653226500574732
   2.499929731578563
   5.999999998311588];



% QD, N = 36
QDcell = {
'QR2'
'QR4'
'QR6'
'QR8'
'QR10'
'QR12'
'QR14'
'QR16'
'QR18'
'QR20'
'QR22'
'QR24'
'QR26'
'QR28'
'QR30'
'QR32'
'QR34'
'QR36'
'QR38'
'QR40'
'QR42'
'QR44'
'QR46'
'QR48'
'QR50'
'QR52'
'QR54'
'QR56'
'QR58'
'QR60'
'QR62'
'QR64'
'QR66'
'QR68'
'QR70'
'YQ'
};

% eff PS , PS , eff L, L
FitParamQD = [
   0.703523777845919   0.036080000000000   1.232344529632411   0.046500000000000
   0.703523777845919   0.036080000000000   1.211963945974647   0.046500000000000
   0.703523777845919   0.036080000000000   1.175703597362138   0.046500000000000
   0.703523777845919   0.036080000000000   1.203161586761653   0.046500000000000
   0.703523777845919   0.036080000000000   1.237823056982128   0.046500000000000
   0.703523777845919   0.036080000000000   1.251500287335069   0.046500000000000
   0.703523777845919   0.036080000000000   1.224580045110366   0.046500000000000
   0.703523777845919   0.036080000000000   1.290422643274407   0.046500000000000
   0.703523777845919   0.036080000000000   1.181096780648581   0.046500000000000
   0.703523777845919   0.036080000000000   1.254328897546964   0.046500000000000
   0.703523777845919   0.036080000000000   1.173306225221602   0.046500000000000
   0.703523777845919   0.036080000000000   1.154186483393466   0.046500000000000
   0.703523777845919   0.036080000000000   1.209648638495197   0.046500000000000
   0.703523777845919   0.036080000000000   1.170205948687350   0.046500000000000
   0.703523777845919   0.036080000000000   1.283371999586151   0.046500000000000
   0.703523777845919   0.036080000000000   1.333631613963344   0.046500000000000
   0.703523777845919   0.036080000000000   1.292684670653893   0.046500000000000
   0.703523777845919   0.036080000000000   1.162565510290177   0.046500000000000
   0.703523777845919   0.036080000000000   1.248316521937803   0.046500000000000
   0.703523777845919   0.036080000000000   1.253587076963335   0.046500000000000
   0.703523777845919   0.036080000000000   1.174734945021608   0.046500000000000
   0.703523777845919   0.036080000000000   1.197688729766632   0.046500000000000
   0.703523777845919   0.036080000000000   1.240664479897132   0.046500000000000
   0.703523777845919   0.036080000000000   1.197612935322071   0.046500000000000
   0.703523777845919   0.036080000000000   1.225309874793045   0.046500000000000
   0.703523777845919   0.036080000000000   1.161446333123303   0.046500000000000
   0.703523777845919   0.036080000000000   1.178139142689721   0.046500000000000
   0.703523777845919   0.036080000000000   1.182124921720728   0.046500000000000
   0.703523777845919   0.036080000000000   1.160944166284607   0.046500000000000
   0.703523777845919   0.036080000000000   1.163252154596075   0.046500000000000
   0.703523777845919   0.036080000000000   1.216338025604396   0.046500000000000
   0.703523777845919   0.036080000000000   1.139138391372939   0.046500000000000
   0.703523777845919   0.036080000000000   1.170525171691929   0.046500000000000
   0.703523777845919   0.036080000000000   1.182322272169648   0.046500000000000
   0.703523777845919   0.036080000000000   1.271018375403492   0.046500000000000
   1.056042121991972   0.011100000000000   0.807794127542416   0.054000000000000
];

AO.QD.FamilyName  = 'QD';
AO.QD.Position    = .08:.32:.32*36;
AO.QD.CommonNames = QDcell;
AO.QD.FitParams = FitParamQD;
AO.QD.MisAlign = zeros(36,2); AO.QD.MisAlign(36,1) = 0.01389;
AO.QD.Rolls = zeros(36,1);
AO.QD.SetPoints = [
   1.609847824856066
   1.609847824856066
   1.609847824856066
   1.609847824856066
   1.821676518043241
   2.422341340890855
   1.637902940588410
   1.826000000000000
   2.181200816129209
   2.499987076021678
   1.609847824856066
   1.609847824856066
   1.609847824856066
   1.609847824856066
   1.609847824856066
   1.609847824856066
   1.609847824856066
   1.609847824856066
   1.609847824856066
   1.609847824856066
   1.609847824856066
   1.609847824856066
   1.609847824856066
   1.609847824856066
   1.609847824856066
   1.609847824856066
   1.609847824856066
   1.609847824856066
   1.609847824856066
   1.609847824856066
   1.609847824856066
   1.609847824856066
   1.609847824856066
   1.609847824856066
   1.698224198958112
   5.146983754822735];

% BEND, N = 36
BENDcell = {
'D1'
'D2'
'D3'
'D4'
'D5'
'D6'
'D7'
'D8'
'D9'
'D10'
'D11'
'D12'
'D13'
'D14'
'D15'
'D16'
'D17'
'D18'
'D19'
'D20'
'D21'
'D22'
'D23'
'D24'
'D25'
'D26'
'D27'
'D28'
'D29'
'D30'
'D31'
'D32'
'D33'
'D34'
'D35'
'PD'
};
% eff PS , PS , eff L, L
FitParamD = [
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   1.096350286489209   0.000521600000000   0.793674363441281   0.044370000000000
   0.831338549337712   0.000038200000000   1.779898374380934   0.044000000000000
];

AO.BEND.FamilyName  = 'BEND';
AO.BEND.Position    = .16:.32:.32*36;
AO.BEND.CommonNames = BENDcell; % same as channel names
AO.BEND.FitParams = FitParamD;
AO.BEND.MisAlign = zeros(36,2); AO.BEND.MisAlign(36,1) = 0.01389;
AO.BEND.Rolls = zeros(36,1);
AO.BEND.SetPoints = [
   2.488806000000000
   2.510484000000000
   2.424191000000000
   2.568044000000000
   2.555026000000000
   2.547162000000000
   2.481842000000000
   2.626407000000000
   2.465096000000000
   2.702143000000000
   2.357719000000000
   2.476071000000000
   2.286978000000000
   2.437085000000000
   2.467705000000000
   2.335201000000000
   2.436915000000000
   2.500000000000000
   2.395600000000000
   2.553100000000000
   2.051800000000000
   2.579600000000000
   2.128430000000000
   2.453199000000000
   2.267544000000000
   2.534940000000000
   2.241243000000000
   2.584816000000000
   2.318767000000000
   2.294862000000000
   2.575053000000000
   2.493582000000000
   2.611794000000000
   2.361000000000000
   1.747578000000000
  14.330045999999999];

% O, N = 7
Ocell = {
'OC1'
'OC2'
'OC3'
'OC4'
'OC5'
'OC6'
'OC7'
};

% eff PS , PS , eff L, L
FitParamO = [
   1   50   1   0.0357
   1   50   1   0.0357
   1   50   1   0.0357
   1   50   1   0.0357
   1   50   1   0.0357
   1   50   1   0.0357
   1   50   1   0.0357
];

AO.O.FamilyName  = 'O';
AO.O.Position    = [];
AO.O.CommonNames = Ocell;
AO.O.FitParams = FitParamO;
AO.O.MisAlign = zeros(7,2);
AO.O.Rolls = zeros(7,1);
AO.O.SetPoints = zeros(7,1);


% setup AO object
setao(AO);
