function tlslattice
% TLS 2003 lattice file is generated for loco.
% Peace Chang, Dec 17, 2002.
% M.H. Wang, January 06,2003
% Peace Chang, January 06, 2003
% Peace Chang, January 15, 2009
% Peace Chang, March 25, 2009
% Peace Chang, May 14, 2009

% Physics parameters
PP.pi               = 3.1415926535897932384626433;
PP.CLight           = 299792458; % speed of light [m/s]
PP.q_e              = 1.6021892e-19; % electron charge magnitude = 1.6021892(46)e-19 coulomb
PP.e_massMeV        = 0.5110034; % 0.5110034(14) MeV/c^2
PP.mass_e           = 9.109534e-31; % 9.109534(47)e-28 g
PP.p_massMeV        = 938.2796; % 938.2796(27) MeV/c^2
PP.mass_p           = 1.6726485e-21; % 1.6726485(86)e-24 g
PP.eV2erg           = 1.6021892e-12;
PP.GeV2joule        = 1.6021892e-10;
PP.GeV2TeslaMeter   = PP.GeV2joule;
PP.e_particle       = -1; % charge of electron
PP.p_particle       = 1;

%BRho = sqrt(Energy^2-PP.e_massMeV^2*1.0e-6)*(PP.GeV2TeslaMeter/PP.CLight/PP.q_e);

global FAMLIST THERING
Energy = 1.5e9;
%Brho = getbrho(Energy); % 2009/03/23
Brho = sqrt(Energy^2*1.0e-18-PP.e_massMeV^2*1.0e-6)*(PP.GeV2TeslaMeter/PP.CLight/PP.q_e);

FAMLIST = cell(0);

L0 = 1.20e+002;	      % design length [m]
C0 =   299792458;     % speed of light [m/s]
HarmNumber = 200;

disp('   Loading TLS magnet lattice');
% AP = aperture('AP', [-0.05, 0.05, -0.05, 0.05],'AperturePass');
% Vaccum chamber size
AP  =  aperture('AP', [-0.038, 0.038, -0.018, 0.018],'AperturePass');

% Screen monitor and other marks like SEPTUMEXT ,R3DCCT, R3SCRP, R3EXE 
START = marker('START', 'IdentityPass');
INJ_POINT = marker('INJ_POINT', 'IdentityPass');
SCN1 = marker('SCN1', 'IdentityPass');
SCN2 = marker('SCN2', 'IdentityPass');
R1SCN1 = SCN1;
R2SCN1 = SCN1;
R2VCU = marker('R2VCU', 'IdentityPass');
R3VCU = marker('R3VCU', 'IdentityPass');
R3SCN1 = SCN1;
R3DCCT = marker('R3DCCT', 'IdentityPass'); % Current Transformer
R3EXE = marker('R3EXE', 'IdentityPass'); % Excited Electrode
R4SCRP = marker('R4SCRP', 'IdentityPass'); % Scraper 01/15/2009
R4SCN1 = SCN1;
R5SCN1 = SCN1;
R6SCN1 = SCN1;

% Four kickers 
% KICK =  corrector('KICK',0.0,[0 0],'CorrectorPass');
KICK = marker('KICK', 'IdentityPass');
R6KICM1 = KICK;
R6KICM2 = KICK;
R1KICM3 = KICK;
R1KICM4 = KICK;

% EPBMs
%EPBM = corrector('VCOR', 'IdentityPass');
EPBM = marker('EPBM', 'IdentityPass');
R3EPBM1 = EPBM;
%R3VC2 =  EPBM;
R3EPBM3 = EPBM;
R3EPBM4 = EPBM;

% Vertical Corrector #48
VCOR = corrector('VCOR',0.0,[0 0],'CorrectorPass');
R1VC0 = VCOR; %corrector('VCOR5',0.0,[0 0],'CorrectorPass');
R1VC0A = VCOR; %corrector('VCOR5',0.0,[0 0],'CorrectorPass');
R1VC1 = VCOR; %corrector('VCOR2',0.0,[0 0],'CorrectorPass');
R1VCSD1 = VCOR; %corrector('VCOR3',0.0,[0 0],'CorrectorPass');
R1VC2 = VCOR; %corrector('VCOR1',0.0,[0 0],'CorrectorPass');
R1VCSD2 = VCOR; %corrector('VCOR3',0.0,[0 0],'CorrectorPass');
R1VC3A = VCOR; %corrector('VCOR4',0.0,[0 0],'CorrectorPass');
R1VC3 = VCOR; %corrector('VCOR2',0.0,[0 0],'CorrectorPass');
R2VC1 = VCOR; %corrector('VCOR2',0.0,[0 0],'CorrectorPass');
R2VC1A = VCOR; %corrector('VCOR2',0.0,[0 0],'CorrectorPass');
R2VCSD1 = VCOR; %corrector('VCOR3',0.0,[0 0],'CorrectorPass');
R2VC2 = VCOR; %corrector('VCOR1',0.0,[0 0],'CorrectorPass');
R2VCSD2 = VCOR; %corrector('VCOR3',0.0,[0 0],'CorrectorPass');
R2VC3A = VCOR; %corrector('VCOR4',0.0,[0 0],'CorrectorPass');
R2VC3 = VCOR; %corrector('VCOR2',0.0,[0 0],'CorrectorPass');
R2VC4 = VCOR; %corrector('VCOR7',0.0,[0 0],'CorrectorPass');
R3VC0 = VCOR; %corrector('VCOR8',0.0,[0 0],'CorrectorPass');
R3VC1 = VCOR; %corrector('VCOR2',0.0,[0 0],'CorrectorPass');
R3VC1A = VCOR; %corrector('VCOR2',0.0,[0 0],'CorrectorPass');
R3VCSD1 = VCOR; %corrector('VCOR3',0.0,[0 0],'CorrectorPass');
R3VC2 = VCOR; %corrector('VCOR1',0.0,[0 0],'CorrectorPass');
R3VCSD2 = VCOR; %corrector('VCOR3',0.0,[0 0],'CorrectorPass');
R3VC3 = VCOR; %corrector('VCOR1',0.0,[0 0],'CorrectorPass');
R4VC0 = VCOR; % 01/15/2009
R4VC1 = VCOR; %corrector('VCOR1',0.0,[0 0],'CorrectorPass');
R4VCSD1 = VCOR; %corrector('VCOR3',0.0,[0 0],'CorrectorPass');
R4VC2 = VCOR; %corrector('VCOR1',0.0,[0 0],'CorrectorPass');
R4VCSD2 = VCOR; %corrector('VCOR3',0.0,[0 0],'CorrectorPass');
R4VC3A = VCOR; %corrector('VCOR4',0.0,[0 0],'CorrectorPass');
R4VC3 = VCOR; %corrector('VCOR1',0.0,[0 0],'CorrectorPass');
R4VC4 = VCOR; %corrector('VCOR2',0.0,[0 0],'CorrectorPass');
R5VC0 = VCOR; %corrector('VCOR2',0.0,[0 0],'CorrectorPass');
R5VC1 = VCOR; %corrector('VCOR1',0.0,[0 0],'CorrectorPass');
R5VC1A = VCOR; %corrector('VCOR2',0.0,[0 0],'CorrectorPass');
R5VCSD1 = VCOR; %corrector('VCOR3',0.0,[0 0],'CorrectorPass');
R5VC2 = VCOR; %corrector('VCOR1',0.0,[0 0],'CorrectorPass');
R5VCSD2 = VCOR; %corrector('VCOR3',0.0,[0 0],'CorrectorPass');
R5VC3A = VCOR; %corrector('VCOR4',0.0,[0 0],'CorrectorPass');
R5VC3 = VCOR; %corrector('VCOR2',0.0,[0 0],'CorrectorPass');
R5VC4 = VCOR; %corrector('VCOR9',0.0,[0 0],'CorrectorPass');
R6VC0 = VCOR; %corrector('VCOR7',0.0,[0 0],'CorrectorPass');
R6VC1 = VCOR; %corrector('VCOR2',0.0,[0 0],'CorrectorPass');
R6VC1A = VCOR; %corrector('VCOR2',0.0,[0 0],'CorrectorPass');
R6VCSD1 = VCOR; %corrector('VCOR3',0.0,[0 0],'CorrectorPass');
R6VC2 = VCOR; %corrector('VCOR1',0.0,[0 0],'CorrectorPass');
R6VCSD2 = VCOR; %corrector('VCOR3',0.0,[0 0],'CorrectorPass');
R6VC3 = VCOR; %corrector('VCOR1',0.0,[0 0],'CorrectorPass');
%R6VC4   =  VCOR;
R6VC5 = VCOR; %corrector('VCOR6',0.0,[0 0],'CorrectorPass');

% Horizontal Corrector
HCOR =  corrector('HCOR',0.0,[0 0],'CorrectorPass');
R1HC0 = HCOR; %corrector('HCOR5',0.0,[0 0],'CorrectorPass');
R1HC0A = HCOR; %corrector('HCOR5',0.0,[0 0],'CorrectorPass');
R1HC1 = HCOR; %corrector('HCOR1',0.0,[0 0],'CorrectorPass');
R1HC1A = HCOR; %corrector('HCOR2',0.0,[0 0],'CorrectorPass');
R1HCSF1 = HCOR; %corrector('HCOR3',0.0,[0 0],'CorrectorPass');
R1HCSF2 = HCOR; %corrector('HCOR3',0.0,[0 0],'CorrectorPass');
R1HC2 = HCOR; %corrector('HCOR1',0.0,[0 0],'CorrectorPass');
R1HC2A = HCOR; %corrector('HCOR4',0.0,[0 0],'CorrectorPass');
R1HC3 = HCOR; %corrector('HCOR2',0.0,[0 0],'CorrectorPass');
R1HCU = marker('EPU_UP_HC', 'IdentityPass');
%R1HCU   =  HCOR;
%R2HCU   =  HCOR;
R2HCU = marker('EPU_DN_HC', 'IdentityPass');
R2HC0 = HCOR; %corrector('HCOR2',0.0,[0 0],'CorrectorPass');
R2HC1 = HCOR; %corrector('HCOR1',0.0,[0 0],'CorrectorPass');
R2HC1A = HCOR; %corrector('HCOR2',0.0,[0 0],'CorrectorPass');
R2HCSF1 = HCOR; %corrector('HCOR3',0.0,[0 0],'CorrectorPass');
R2HCSF2 = HCOR; %corrector('HCOR3',0.0,[0 0],'CorrectorPass');
R2HC2 = HCOR; %corrector('HCOR1',0.0,[0 0],'CorrectorPass');
R2HC2A = HCOR; %corrector('HCOR4',0.0,[0 0],'CorrectorPass');
R2HC3 = HCOR; %corrector('HCOR2',0.0,[0 0],'CorrectorPass');
R3HC0 = HCOR; %corrector('HCOR2',0.0,[0 0],'CorrectorPass');
R3HC1 = HCOR; %corrector('HCOR1',0.0,[0 0],'CorrectorPass');
R3HC1A = HCOR; %corrector('HCOR2',0.0,[0 0],'CorrectorPass');
R3HCSF1 = HCOR; %corrector('HCOR3',0.0,[0 0],'CorrectorPass');
R3HCSF2 = HCOR; %corrector('HCOR3',0.0,[0 0],'CorrectorPass');
R3HC2 = HCOR; %corrector('HCOR1',0.0,[0 0],'CorrectorPass');
R3HC3 = HCOR; % 01/15/2009
R4HC0 = HCOR; % 01/15/2009
R4HC0A = HCOR; % 01/15/2009
R4HC1 = HCOR; %corrector('HCOR1',0.0,[0 0],'CorrectorPass');
R4HCSF1 = HCOR; %corrector('HCOR3',0.0,[0 0],'CorrectorPass');
R4HCSF2 = HCOR; %corrector('HCOR3',0.0,[0 0],'CorrectorPass');
R4HC2A = HCOR; %corrector('HCOR4',0.0,[0 0],'CorrectorPass');
R4HC2 = HCOR; %corrector('HCOR1',0.0,[0 0],'CorrectorPass');
R4HC3 = HCOR; %corrector('HCOR2',0.0,[0 0],'CorrectorPass');
%R4WHVC  =  HCOR;
%R5WHVC  =  HCOR;
R5HC0 = HCOR; %corrector('HCOR2',0.0,[0 0],'CorrectorPass');
R5HC1 = HCOR; %corrector('HCOR1',0.0,[0 0],'CorrectorPass');
R5HC1A = HCOR; %corrector('HCOR2',0.0,[0 0],'CorrectorPass');
R5HCSF1 = HCOR; %corrector('HCOR3',0.0,[0 0],'CorrectorPass');
R5HCSF2 = HCOR; %corrector('HCOR3',0.0,[0 0],'CorrectorPass');
R5HC2A = HCOR; %corrector('HCOR4',0.0,[0 0],'CorrectorPass');
R5HC2 = HCOR; %corrector('HCOR1',0.0,[0 0],'CorrectorPass');
R5HC3 = HCOR; %corrector('HCOR2',0.0,[0 0],'CorrectorPass');
R6HC0 = HCOR; %corrector('HCOR2',0.0,[0 0],'CorrectorPass');
R6HC1 = HCOR; %corrector('HCOR1',0.0,[0 0],'CorrectorPass');
R6HC1A = HCOR; %corrector('HCOR2',0.0,[0 0],'CorrectorPass');
R6HCSF1 = HCOR; %corrector('HCOR3',0.0,[0 0],'CorrectorPass');
R6HCSF2 = HCOR; %corrector('HCOR3',0.0,[0 0],'CorrectorPass');
R6HC2 = HCOR; %corrector('HCOR1',0.0,[0 0],'CorrectorPass');
%R6HC2A = HCOR; % 01/15/2009
%R6HC3   =  HCOR;
R6HC4 = HCOR; %corrector('HCOR6',0.0,[0 0],'CorrectorPass');

% BPM
%BPM = monitor('BPM','IdentityPass');
BPM  =  marker('BPM','IdentityPass');
R1BPM0 = BPM;
R1BPM1 = BPM;
R1BPM2 = BPM;
R1BPM3 = BPM;
R1BPM4 = BPM;
R1BPM5 = BPM;
R1BPM6 = BPM;
R1BPM7 = BPM;
R1BPM8 = BPM;
R1BPM9 = BPM;
R2BPM0 = BPM;
R2BPM1 = BPM;
R2BPM2 = BPM;
R2BPM3 = BPM;
R2BPM4 = BPM;
R2BPM5 = BPM;
R2BPM6 = BPM;
R2BPM7 = BPM;
R2BPM8 = BPM;
R2BPM9 = BPM;
R3BPM0 = BPM;
R3BPM1 = BPM;
R3BPM2 = BPM;
R3BPM3 = BPM;
R3BPM4 = BPM;
R3BPM4A = BPM;
R3BPM5A = BPM;
R3BPM5 = BPM;
R3BPM6 = BPM;
R3BPM7 = BPM;
R3BPM8 = BPM;
R4BPM0 = BPM; % 01/15/2009
R4BPM1 = BPM;
R4BPM2 = BPM;
R4BPM3 = BPM;
R4BPM4 = BPM;
R4BPM5 = BPM;
R4BPM6 = BPM;
R4BPM7 = BPM;
R4BPM8 = BPM;
R4BPM9 = BPM;
R5BPM0 = BPM;
R5BPM1 = BPM;
R5BPM2 = BPM;
R5BPM3 = BPM;
R5BPM4 = BPM;
R5BPM5 = BPM;
R5BPM6 = BPM;
R5BPM7 = BPM;
R5BPM8 = BPM;
R5BPM9 = BPM;
R6BPM0 = BPM;
R6BPM1 = BPM;
R6BPM2 = BPM;
R6BPM3 = BPM;
R6BPM4 = BPM;
R6BPM5 = BPM;
R6BPM6 = BPM;
R6BPM7 = BPM;

% Voltage: 3.2 e6 if only one cavity is used
L0 = 1.20e+002;	                % design length [m]
C0 =   299792458; 		% speed of light [m/s]
%R4RFCAV1 = rfcavity('R4RFCAV1', 0.3, 4e+5, HarmNumber*C0/L0, HarmNumber, 'CavityPass');
%R4RFCAV2 = rfcavity('R4RFCAV2', 0.3, 4e+5, HarmNumber*C0/L0, HarmNumber, 'CavityPass');
%R4RFCAV1 = drift('RFCAV', 0.3, 'DriftPass');
%R4RFCAV2 = R4RFCAV1;
% Voltage: 1.6e6
RSRFCAV = rfcavity('RSRFCAV1', 0.6, 4e+5, HarmNumber*C0/L0, HarmNumber, 'CavityPass');

% Standard Cell Drifts
% R1
R1D1A = drift('R1D1A', 0.643354, 'DriftPass');
R1D1AB = drift('R1D1AB', 0.174646, 'DriftPass');
R1D1BC = drift('R1D1BC', 0.282, 'DriftPass');
R1D1CD = drift('R1D1CD', 0.3, 'DriftPass');
R1D1DE = drift('R1D1DE', 0.095, 'DriftPass');
R1D1EF = drift('R1D1EF', 0.0475, 'DriftPass');
R1D1FG = drift('R1D1FG', 0.0475, 'DriftPass');
R1D1GH = drift('R1D1GH', 0.097, 'DriftPass');
R1D1HI = drift('R1D1HI', 0.298, 'DriftPass');
R1D1IJ = drift('R1D1IJ', 0.272, 'DriftPass');
R1D1JK = drift('R1D1JK', 0.143, 'DriftPass');
R1D6A = drift('R1D6A', 0.14, 'DriftPass');
R1D6B = drift('R1D6B', 0.455, 'DriftPass');
R1D6BA = drift('R1D6BA', 0.182, 'DriftPass');
R1D6BB = drift('R1D6BB', 0.273, 'DriftPass');
R1D23 = drift('R1D23', 0.235, 'DriftPass');
R1D23A = drift('R1D23A', 0.145, 'DriftPass');
R1D23B = drift('R1D23B', 0.09, 'DriftPass');
R1D27A = drift('R1D27A', 0.09, 'DriftPass');
R1D27B = drift('R1D27B', 0.135, 'DriftPass');
R1D28A = drift('R1D28A', 0.13, 'DriftPass');
R1D29A = drift('R1D29A', 0.765, 'DriftPass');
R1D29AA = drift('R1D29AA', 0.385, 'DriftPass');
R1D29AB = drift('R1D29AB', 0.097, 'DriftPass');
R1D29B = drift('R1D29B', 0.14, 'DriftPass');
R1U10DA = drift('R1U10DA', 0.395, 'DriftPass');
R1U10DB = drift('R1U10DB', 0.148, 'DriftPass');
R1U10S = drift('R1U10S', 1.037, 'DriftPass');
R1APU_D = drift('APUDS', 0.812, 'DriftPass');
% R2
R2APU_D = drift('APUDS', 0.812, 'DriftPass');
R2U10S = drift('R2U10S', 1.037, 'DriftPass');
R2U10DA = drift('R2U10DA', 0.148, 'DriftPass');
R2U10DB = drift('R2U10DB', 0.395, 'DriftPass');
R2D1A = drift('R2D1A', 0.62, 'DriftPass');
R2D1AA = drift('R2D1AA', 0.097, 'DriftPass');
R2D1AB = drift('R2D1AB', 0.09, 'DriftPass');
R2D1B = drift('R2D1B', 0.585, 'DriftPass');
R2D1BA = drift('R2D1BA', 0.112, 'DriftPass'); % 01/15/2009
R2D1BB = drift('R2D1BB', 0.473, 'DriftPass'); % 01/15/2009
R2D6 = drift('R2D6', 0.595, 'DriftPass');
R2D6A = drift('R2D6A', 0.325, 'DriftPass');
R2D6B = drift('R2D6B', 0.27, 'DriftPass');

R2D12A = drift('R2D12A', 0.0695, 'DriftPass'); % 05/14/2009
R2D12B = drift('R2D12B', 0.0705, 'DriftPass'); % 05/14/2009
R2D13 = drift('R2D13', 0.381, 'DriftPass'); % 05/14/2009
R2D13A = drift('R2D13A', 0.243, 'DriftPass'); % 05/14/2009
R2D13B = drift('R2D13B', 0.138, 'DriftPass'); % 05/14/2009
R2D14 = drift('R2D14', 0.401, 'DriftPass'); % 05/14/2009
R2D14A = drift('R2D14A', 0.17, 'DriftPass'); % 05/14/2009
R2D14B = drift('R2D14B', 0.231, 'DriftPass'); % 05/14/2009

R2D23 = drift('R2D23', 0.235, 'DriftPass');
R2D23A = drift('R2D23A', 0.115, 'DriftPass');
R2D23B = drift('R2D23B', 0.12, 'DriftPass');
R2D24A = drift('R2D24A', 0.0625, 'DriftPass');
R2D24B = drift('R2D24B', 0.2975, 'DriftPass');
R2D27A = drift('R2D27A', 0.09, 'DriftPass');
R2D27B = drift('R2D27B', 0.135, 'DriftPass');
R2D28A = drift('R2D28A', 0.13, 'DriftPass');
R2D29 = drift('R2D29', 0.541, 'DriftPass'); % 01/15/2009
R2U5D = drift('R2U5D', 0.535, 'DriftPass');
R2U5DA = drift('R2U5DA', 0.34, 'DriftPass');
R2U5DB = drift('R2U5DB', 0.195, 'DriftPass');
R2U5S = drift('R2U5S', 1.95, 'DriftPass');
% R3
R3U5S = drift('R3U5S', 1.95, 'DriftPass');
R3U5D = drift('R3U5D', 0.825, 'DriftPass');
R3U5DA = drift('R3U5DA', 0.25, 'DriftPass');
R3U5DAA = drift('R3U5DAA', 0.17, 'DriftPass');
R3U5DAB = drift('R3U5DAB', 0.08, 'DriftPass');
R3U5DB = drift('R3U5DB', 0.575, 'DriftPass');
R3D1 = drift('R3D1', 0.831, 'DriftPass');
R3D6H = drift('R3D6H', 0.2975, 'DriftPass');
R3D6 = drift('R3D6', 0.595, 'DriftPass');
R3D6A = drift('R3D6A', 0.325, 'DriftPass');
R3D6B = drift('R3D6B', 0.27, 'DriftPass');
R3D13A = drift('R3D13A', 0.355, 'DriftPass');
R3D13B = drift('R3D13B', 0.123, 'DriftPass');
R3D13C = drift('R3D13C', 0.33, 'DriftPass');
R3D14 = drift('R3D14', 0.132, 'DriftPass');
R3D15 = drift('R3D15', 0.39, 'DriftPass');
R3D16A = drift('R3D16A', 0.295, 'DriftPass');
R3D16B = drift('R3D16B', 0.198, 'DriftPass');
R3D17A = drift('R3D17A', 0.435, 'DriftPass');
R3D17B = drift('R3D17B', 0.132, 'DriftPass');
R3D17C = drift('R3D17C', 0.15, 'DriftPass');
R3D27 = drift('R3D27', 0.208, 'DriftPass'); % 01/15/2009
R3D28 = drift('R3D28', 0.291, 'DriftPass'); % 01/15/2009
R3D29 = drift('R3D29', 0.952, 'DriftPass'); % 01/15/2009
R3D30 = drift('R3D30', 0.7, 'DriftPass'); % 01/15/2009
R3D30A = drift('R3D30A', 0.35, 'DriftPass'); % 01/15/2009
R3D30B = drift('R3D30B', 0.35, 'DriftPass'); % 01/15/2009
R3D31 = drift('R3D31', 0.249, 'DriftPass'); % 01/15/2009
% R4
R4D1A = drift('R4D1A', 0.719 , 'DriftPass'); % 01/15/2009
R4D1B = drift('R4D1B', 0.1125, 'DriftPass'); % 01/15/2009
R4D2A = drift('R4D2A', 0.2635, 'DriftPass'); % 01/15/2009
R4D2B = drift('R4D2B', 0.257, 'DriftPass'); % 01/15/2009
SW6UD = drift('SW6UD', 0.16, 'DriftPass'); % 01/15/2009
SW6DD = drift('SW6DD', 0.16, 'DriftPass'); % 01/15/2009
R4D3 = drift('R4D3', 0.175, 'DriftPass'); % 01/15/2009
R4D4 = drift('R4D4', 0.115, 'DriftPass'); % 01/15/2009
R4D5 = drift('R4D5', 0.078, 'DriftPass'); % 01/15/2009
R4D6A = drift('R4D6A', 0.325, 'DriftPass'); % 01/15/2009
R4D6B = drift('R4D6B', 0.27, 'DriftPass'); % 01/15/2009
R4D23 = drift('R4D23', 0.235, 'DriftPass');
R4D23A = drift('R4D23A', 0.115, 'DriftPass');
R4D23B = drift('R4D23B', 0.12, 'DriftPass');
R4D29 = drift('R4D29', 0.63, 'DriftPass');
R4D30 = drift('R4D30', 0.15, 'DriftPass');
R4D31 = drift('R4D31', 0.21, 'DriftPass');
% WIG half-space (W20 Half-length)
WGHDS = drift('WGHDS', 1.495, 'DriftPass'); 
R4WGHDS = WGHDS; 
R5WGHDS = WGHDS;
% R5
R5D1A = drift('R5D1A', 0.21, 'DriftPass');
R5D1B = drift('R5D1B', 0.15, 'DriftPass');
R5D1C = drift('R5D1C', 0.92, 'DriftPass');
R5D6A = drift('R5D6A', 0.322, 'DriftPass');
R5D6B = drift('R5D6B', 0.273, 'DriftPass');
R5D13A = drift('R5D13A', 0.399, 'DriftPass'); % 01/15/2009
R5D13B = drift('R5D13B', 0.466, 'DriftPass'); % 01/15/2009
R5D13BA = drift('R5D13BA', 0.111, 'DriftPass'); % 01/15/2009
R5DCCTD = drift('R5DCCTD', 0.165, 'DriftPass'); % 01/15/2009
R5D13BB = drift('R5D13BB', 0.025, 'DriftPass'); % 01/15/2009
R5D14 = drift('R5D14', 0.075, 'DriftPass'); % 01/15/2009
R5D15 = drift('R5D15', 0.33, 'DriftPass'); % 01/15/2009
R5D23 = drift('R5D23', 0.235, 'DriftPass');
R5D23A = drift('R5D23A', 0.145, 'DriftPass');
R5D23B = drift('R5D23B', 0.09, 'DriftPass');
R5D27 = drift('R5D27', 0.09, 'DriftPass');
R5D28A = drift('R5D28A', 0.135, 'DriftPass');
R5D28B = drift('R5D28B', 0.1625, 'DriftPass');
R5D28C = drift('R5D28C', 0.1275, 'DriftPass');
% R6
R6D1 = drift('R6D1', 0.255, 'DriftPass');
R6D6 = drift('R6D6', 0.595, 'DriftPass');
R6D6A = drift('R6D6A', 0.325, 'DriftPass');
R6D6B = drift('R6D6B', 0.27, 'DriftPass');
R6D12A = drift('R6D12A', 0.0695, 'DriftPass'); % 01/15/2009
R6D12B = drift('R6D12B', 0.0705, 'DriftPass'); % 01/15/2009
R6D13 = drift('R6D13', 0.381, 'DriftPass'); % 01/15/2009
R6D13A = drift('R6D13A', 0.243, 'DriftPass'); % 01/15/2009
R6D13B = drift('R6D13B', 0.138, 'DriftPass'); % 01/15/2009
R6D14 = drift('R6D14', 0.401, 'DriftPass'); % 01/15/2009
R6D14A = drift('R6D14A', 0.17, 'DriftPass'); % 01/15/2009
R6D14B = drift('R6D14B', 0.231, 'DriftPass'); % 01/15/2009
R6D27 = drift('R6D27', 0.415, 'DriftPass');
R6D28 = drift('R6D28', 0.445, 'DriftPass');
R6D29 = drift('R6D29', 0.15, 'DriftPass');
R6D30 = drift('R6D30', 0.89, 'DriftPass');
R6D31 = drift('R6D31', 1.1, 'DriftPass');
R6D31A = drift('R6D31A', 0.685, 'DriftPass');
R6D31B = drift('R6D31B', 0.415, 'DriftPass');
% RX
RXD1 = drift('RXD1', 2.775, 'DriftPass');
RXD2 = drift('RXD2', 0.135, 'DriftPass');
RXD3 = drift('RXD3', 0.09 , 'DriftPass');
RXD4 = drift('RXD4', 0.15, 'DriftPass');
RXD5 = drift('RXD5', 0.15, 'DriftPass');
RXD6 = drift('RXD6', 0.595, 'DriftPass');
RXD7 = drift('RXD7', 0.105, 'DriftPass');
RXD8 = drift('RXD8', 0.33, 'DriftPass');
RXD9 = drift('RXD9', 0.36, 'DriftPass');
RXD10 = drift('RXD10', 0.18, 'DriftPass');
RXD11 = drift('RXD11', 0.36, 'DriftPass');
RXD12 = drift('RXD12', 0.14, 'DriftPass');
RXD13 = drift('RXD13', 0.76, 'DriftPass');
RXD13A = drift('RXD13A' , 0.435 ,'DriftPass'); % 01/15/2009
RXD13B = drift('RXD13B' , 0.325 ,'DriftPass'); % 01/15/2009
RXD14 = drift('RXD14', 0.135, 'DriftPass');
RXD15 = drift('RXD15', 0.375, 'DriftPass');
RXD16 = drift('RXD16', 0.645, 'DriftPass');
RXD16U = drift('RXD16U', 0.54, 'DriftPass');
RXD16D = drift('RXD16D', 0.105, 'DriftPass');
RXD17 = drift('RXD17', 0.625, 'DriftPass');
RXD17U = drift('RXD17U', 0.24, 'DriftPass');
RXD17D = drift('RXD17D', 0.385, 'DriftPass');
RXD17A = drift('RXD17A' , 0.19 ,'DriftPass'); % 01/15/2009
RXD17B = drift('RXD17B' , 0.435 ,'DriftPass'); % 01/15/2009
RXD18 = drift('RXD18', 0.14, 'DriftPass');
RXD19 = drift('RXD19', 0.44, 'DriftPass');
RXD20 = drift('RXD20', 0.1, 'DriftPass');
RXD21 = drift('RXD21', 0.36, 'DriftPass');
RXD22 = drift('RXD22', 0.435,'DriftPass');
RXD23 = drift('RXD23', 0.235, 'DriftPass');
RXD24 = drift('RXD24', 0.36, 'DriftPass');
RXD25 = drift('RXD25', 0.14, 'DriftPass');
RXD26 = drift('RXD26', 0.16, 'DriftPass');
RXD27 = drift('RXD27', 0.22, 'DriftPass');
RXD28 = drift('RXD28', 0.295, 'DriftPass');
RXD28A = drift('RXD28A', 0.135, 'DriftPass');
RXD28B = drift('RXD28B', 0.16, 'DriftPass');
RXD29 = drift('RXD29', 2.485, 'DriftPass');
RXD29A = drift('RXD29A', 1.02, 'DriftPass');
RXD29B = drift('RXD29B', 0.2625, 'DriftPass');
RXD29C = drift('RXD29C', 0.8025, 'DriftPass');
RXD29D = drift('RXD29D', 0.4, 'DriftPass');

% Insertion devices
% Super-conducting Wave-Length Shifter SWLS
SWLSD = drift('SWLSD', 0.2, 'DriftPass');
SWLSLD = SWLSD;
SWLSRD = SWLSD;
% SWLS
SWLS.device = {'SWLSMPS'};
SWLS.Parameter = [0 25 50 75 100 125 150 175 200 225 250 260 261]; % Current
SWLS.PeakField = [0.000000 1.245164 1.856044 2.414862 2.916582 3.415849 ...
                  3.906895 4.365579 4.825984 5.290268 5.758334 5.944600 6.0];
SWLS.NumberOfPoles = 3;
SWLS.NumberOfEndPoles = 1;
SWLS.PoleWidth = 0.2;
% SWLS peak field (B0) obtained from the I-B curve of SWLS with driving current
SWLSMPS = 215; % Amp
if (SWLSMPS < SWLS.Parameter(1)) | (SWLSMPS > SWLS.Parameter(end))
    error('Current is out of rang [minimum(%f) maximum(%f)].', ...
    SWLS.Parameter(1), SWLS.Parameter(end));
end
SWLS.Field = interp1(SWLS.Parameter,SWLS.PeakField,SWLSMPS,'linear');
SWLSB0 = SWLS.Field;
SWLSEB0 = -SWLSB0/2;
SWLSK = SWLSB0/Brho;
SWLSEK = SWLSEB0/Brho;
SWLSP = [0.309*SWLSK*0.04 0.809*SWLSK*0.04 SWLSK*0.02];
SWLSEP = [0.309*SWLSEK*0.04 0.809*SWLSEK*0.04 SWLSEK*0.02];
% slices of poles
%------------------------------------------------------------------------------
%SWLSEA = drift('SWLS', 0.04, 'DriftPass'); % 0.309*K0*0.5 (half-pole)
%SWLSEB = SWLSEA; % 0.809*K0*0.5 (half-pole)
%SWLSEC = drift('SWLS', 0.02, 'DriftPass'); % 1.0*K0*0.5 (half-pole)
%SWLSA = SWLSEA; % 0.309*K0 (full-pole)
%SWLSB = SWLSEB; % 0.809*K0 (full-pole)
%SWLSC = SWLSEC; % 1.0*K0 (full-pole)
%------------------------------------------------------------------------------
SWLSEA = rbend('SWLS', 0.04, SWLSEP(1), SWLSEP(1)/2, SWLSEP(1)/2, 0, 'BendLinearPass');
SWLSEB = rbend('SWLS', 0.04, SWLSEP(2), SWLSEP(2)/2, SWLSEP(2)/2, 0, 'BendLinearPass');
SWLSEC = rbend('SWLS', 0.02, SWLSEP(3), SWLSEP(3)/2, SWLSEP(3)/2, 0, 'BendLinearPass');
SWLSA  = rbend('SWLS', 0.04, SWLSP(1),  SWLSP(1)/2,  SWLSP(1)/2, 0, 'BendLinearPass');
SWLSB  = rbend('SWLS', 0.04, SWLSP(2),  SWLSP(2)/2,  SWLSP(2)/2, 0, 'BendLinearPass');
SWLSC  = rbend('SWLS', 0.02, SWLSP(3),  SWLSP(3)/2,  SWLSP(3)/2, 0, 'BendLinearPass');

% Elliptical Polarization Undulator EPU
EPU4USVC = marker('EPU', 'IdentityPass');
EPU4USHC = EPU4USVC;
EPU4DSHC = EPU4USVC;
EPU4DSVC = EPU4USVC;
%
EPU56UD = drift('EPU56D', 0.141, 'DriftPass');
EPU56D = drift('EPU56D', 4.006, 'DriftPass');
EPU56DD = EPU56UD;
% Undulator EPU56
% [PE NE P1 N1 P2 N P] = [1/4 -3/4 1 -1 1 -1 1]
EPU56.device = {'EPU4GAP'};
EPU56.Parameter = [17 18 20 23 28 35 50 70 110 160 230]; % Gap (or Phase)
EPU56.PeakField = [0.69915008 0.69915008 0.62564473 0.52931217 0.39986535 ...
                   0.26945240 0.11531039 0.03683968 0.00373228 0.00000000 ...
		   0.00000000];
EPU56.NumberOfPoles = 133;
EPU56.NumberOfEndPoles = 2;
EPU56.Mode = 0;
EPU56.Type = 'EPID';
EPU56.Symmetry = 0; % Phase ?
EPU56.PoleWidth = 0.028;
EPU56.PeriodLength = 2*EPU56.PoleWidth;
% Driving gap
EPU4.Gap = 30; % mm
if (EPU4GAP < EPU56.Parameter(1)) | (EPU4GAP > EPU56.Parameter(end))
    error('Gap is out of rang [minimum(%f) maximum(%f)].', ...
    EPU56.Parameter(1), EPU56.Parameter(end));
end
EPU56.Field = interp1(EPU56.Parameter,EPU56.PeakField,EPU4GAP,'linear');
EPU56B0 = EPU56.Field;
EPU56PB0 = EPU56B0/4;
EPU56NB0 = -EPU56B0*3/4;
EPU56K = EPU56B0/Brho;
EPU56PK = EPU56PB0/Brho;
EPU56NK = EPU56NB0/Brho;
EPU56P = [0.309*EPU56K*0.0056 0.809*EPU56K*0.0056 EPU56K*0.0028];
EPU56PP = [0.309*EPU56PK*0.0056 0.809*EPU56PK*0.0056 EPU56PK*0.0028];
EPU56NP = [0.309*EPU56NK*0.0056 0.809*EPU56NK*0.0056 EPU56NK*0.0028];
EPU56N = -EPU56P;
% slices of poles
%------------------------------------------------------------------------------
%EPU56PEA = drift('EPU56', 0.0056, 'DriftPass'); % 0.309 PE_K0max
%EPU56PEB = EPU56PEA; % 0.809 PE_K0max
%EPU56PEC = drift('EPU56', 0.0028, 'DriftPass'); % 1.000 PE_K0max
%EPU56NEA = EPU56PEA; % 0.309 NE_K0max
%EPU56NEB = EPU56NEA; % 0.809 NE_K0max
%EPU56NEC = EPU56PEC; % 1.000 NE_K0max
%EPU56P1A = EPU56PEA; % 0.309 P1_K0max
%EPU56P1B = EPU56P1A; % 0.809 P1_K0max
%EPU56P1C = EPU56PEC; % 1.000 P1_K0max
%EPU56N1A = EPU56PEA; % 0.309 N1_K0max
%EPU56N1B = EPU56N1A; % 0.809 N1_K0max
%EPU56N1C = EPU56PEC; % 1.000 N1_K0max
%EPU56P2A = EPU56PEA; % 0.309 P2_K0max
%EPU56P2B = EPU56P2A; % 0.809 P2_K0max
%EPU56P2C = EPU56PEC; % 1.000 P2_K0max
%EPU56NA  = EPU56PEA; % 0.309 N_K0max
%EPU56NB  = EPU56NA; % 0.809 N_K0max
%EPU56NC  = EPU56PEC; % 1.000 N_K0max
%EPU56PA  = EPU56PEA; % 0.309 P_K0max
%EPU56PB  = EPU56PA; % 0.809 P_K0max
%EPU56PC  = EPU56PEC; % 1.000 P_K0max
%------------------------------------------------------------------------------
EPU56PEA = rbend('EPU56', 0.0056, EPU56PP(1), EPU56PP(1)/2, EPU56PP(1)/2, 0, 'BendLinearPass');
EPU56PEB = rbend('EPU56', 0.0056, EPU56PP(2), EPU56PP(2)/2, EPU56PP(2)/2, 0, 'BendLinearPass');
EPU56PEC = rbend('EPU56', 0.0028, EPU56PP(3), EPU56PP(3)/2, EPU56PP(3)/2, 0, 'BendLinearPass');
EPU56NEA = rbend('EPU56', 0.0056, EPU56NP(1), EPU56NP(1)/2, EPU56NP(1)/2, 0, 'BendLinearPass');
EPU56NEB = rbend('EPU56', 0.0056, EPU56NP(2), EPU56NP(2)/2, EPU56NP(2)/2, 0, 'BendLinearPass');
EPU56NEC = rbend('EPU56', 0.0028, EPU56NP(3), EPU56NP(3)/2, EPU56NP(3)/2, 0, 'BendLinearPass');
EPU56P1A = rbend('EPU56', 0.0056, EPU56P(1),  EPU56P(1)/2,  EPU56P(1)/2, 0, 'BendLinearPass');
EPU56P1B = rbend('EPU56', 0.0056, EPU56P(2),  EPU56P(2)/2,  EPU56P(2)/2, 0, 'BendLinearPass');
EPU56P1C = rbend('EPU56', 0.0028, EPU56P(3),  EPU56P(3)/2,  EPU56P(3)/2, 0, 'BendLinearPass');
EPU56N1A = rbend('EPU56', 0.0056, EPU56N(1),  EPU56N(1)/2,  EPU56N(1)/2, 0, 'BendLinearPass');
EPU56N1B = rbend('EPU56', 0.0056, EPU56N(2),  EPU56N(2)/2,  EPU56N(2)/2, 0, 'BendLinearPass');
EPU56N1C = rbend('EPU56', 0.0028, EPU56N(3),  EPU56N(3)/2,  EPU56N(3)/2, 0, 'BendLinearPass');
EPU56P2A = rbend('EPU56', 0.0056, EPU56P(1),  EPU56P(1)/2,  EPU56P(1)/2, 0, 'BendLinearPass');
EPU56P2B = rbend('EPU56', 0.0056, EPU56P(2),  EPU56P(2)/2,  EPU56P(2)/2, 0, 'BendLinearPass');
EPU56P2C = rbend('EPU56', 0.0028, EPU56P(3),  EPU56P(3)/2,  EPU56P(3)/2, 0, 'BendLinearPass');
EPU56NA  = rbend('EPU56', 0.0056, EPU56N(1),  EPU56N(1)/2,  EPU56N(1)/2, 0, 'BendLinearPass');
EPU56NB  = rbend('EPU56', 0.0056, EPU56N(2),  EPU56N(2)/2,  EPU56N(2)/2, 0, 'BendLinearPass');
EPU56NC  = rbend('EPU56', 0.0028, EPU56N(3),  EPU56N(3)/2,  EPU56N(3)/2, 0, 'BendLinearPass');
EPU56PA  = rbend('EPU56', 0.0056, EPU56P(1),  EPU56P(1)/2,  EPU56P(1)/2, 0, 'BendLinearPass');
EPU56PB  = rbend('EPU56', 0.0056, EPU56P(2),  EPU56P(2)/2,  EPU56P(2)/2, 0, 'BendLinearPass');
EPU56PC  = rbend('EPU56', 0.0028, EPU56P(3),  EPU56P(3)/2,  EPU56P(3)/2, 0, 'BendLinearPass');

% R2-IASW6 In-Arc Super-conducting Wiggler (IASWB)
IASWBHC1 = marker('IASWBHC1', 'IdentityPass'); % 05/14/2009
IASWBHC2 = marker('IASWBHC2', 'IdentityPass'); % 05/14/2009
IASWBD = drift('IASWBD', 0.488, 'DriftPass'); % 05/14/2009
% Super-Conducting Multi-Pole Wiggler IASW6 (16 pole, anti-symmetry)
IASWB.device = {'IASWBMPS'}; % setting
IASWB.Parameter = [0 10.0406 11.9611 12.7613 13.7216 14.8418 15.9621 16.4422 ...
                   17.8826 18.6828 19.483 20.4432 49.8906 100.463 200.328 ...
		   250.412 262.904 276.187 288.83]; % Current
IASWB.PeakField = [0 0.5013 0.5577 0.5768 0.5998 0.6234 0.6461 0.6553 0.6812 ...
                   0.695 0.708 0.7214 1.0981 1.6089 2.5348 2.9927 3.1 3.22 ...
		   3.3397];
IASWB.NumberOfPoles = 32;
IASWB.NumberOfEndPoles = 1;
IASWB.Mode = 0;
IASWB.Type = 'AGID';
IASWB.Symmetry = 0;
IASWB.PoleWidth = 0.0305;
IASWB.PeriodLength = 2*IASWB.PoleWidth;
% Driving current
%IASWBMPS = 255; % Amp
IASWBMPS = 0; % Amp
if (IASWBMPS < IASWB.Parameter(1)) | (IASWBMPS > IASWB.Parameter(end))
    error('Current is out of rang [minimum(%f) maximum(%f)].', ...
    IASWB.Parameter(1), IASWB.Parameter(end));
end
IASWB.Field = interp1(IASWB.Parameter,IASWB.PeakField,IASWBMPS,'linear');
IASWBB0 = IASWB.Field;
IASWBEB0 = IASWBB0*(125325/501300);
IASWB2B0 = IASWBB0*(375975/501300);
IASWBK = IASWBB0/Brho;
IASWBEK = IASWBEB0/Brho;
IASWB2K = IASWB2B0/Brho;
IASWBP = [0.309*IASWBK*0.0061 0.809*IASWBK*0.0061 IASWBK*0.00305];
IASWBEP = [0.309*IASWBEK*0.0061 0.809*IASWBEK*0.0061 IASWBEK*0.00305];
IASWB2P = [0.309*IASWB2K*0.0061 0.809*IASWB2K*0.0061 IASWB2K*0.00305];
IASWBN = -IASWBP;
IASWBEN = -IASWBEP;
IASWB2N = -IASWB2P;
% slices of poles
%------------------------------------------------------------------------------
IASWBPEA = rbend('IASWB', 0.0061,  IASWBEP(1), IASWBEP(1)/2, IASWBEP(1)/2, 0, 'BendLinearPass');
IASWBPEB = rbend('IASWB', 0.0061,  IASWBEP(2), IASWBEP(2)/2, IASWBEP(2)/2, 0, 'BendLinearPass');
IASWBPEC = rbend('IASWB', 0.00305, IASWBEP(3), IASWBEP(3)/2, IASWBEP(3)/2, 0, 'BendLinearPass');
IASWBNEA = rbend('IASWB', 0.0061,  IASWBEN(1), IASWBEN(1)/2, IASWBEN(1)/2, 0, 'BendLinearPass');
IASWBNEB = rbend('IASWB', 0.0061,  IASWBEN(2), IASWBEN(2)/2, IASWBEN(2)/2, 0, 'BendLinearPass');
IASWBNEC = rbend('IASWB', 0.00305, IASWBEN(3), IASWBEN(3)/2, IASWBEN(3)/2, 0, 'BendLinearPass');
IASWBP2A = rbend('IASWB', 0.0061,  IASWB2P(1), IASWB2P(1)/2, IASWB2P(1)/2, 0, 'BendLinearPass');
IASWBP2B = rbend('IASWB', 0.0061,  IASWB2P(2), IASWB2P(2)/2, IASWB2P(2)/2, 0, 'BendLinearPass');
IASWBP2C = rbend('IASWB', 0.00305, IASWB2P(3), IASWB2P(3)/2, IASWB2P(3)/2, 0, 'BendLinearPass');
IASWBN2A = rbend('IASWB', 0.0061,  IASWB2N(1), IASWB2N(1)/2, IASWB2N(1)/2, 0, 'BendLinearPass');
IASWBN2B = rbend('IASWB', 0.0061,  IASWB2N(2), IASWB2N(2)/2, IASWB2N(2)/2, 0, 'BendLinearPass');
IASWBN2C = rbend('IASWB', 0.00305, IASWB2N(3), IASWB2N(3)/2, IASWB2N(3)/2, 0, 'BendLinearPass');
IASWBPA  = rbend('IASWB', 0.0061,  IASWBP(1),  IASWBP(1)/2,  IASWBP(1)/2,  0, 'BendLinearPass');
IASWBPB  = rbend('IASWB', 0.0061,  IASWBP(2),  IASWBP(2)/2,  IASWBP(2)/2,  0, 'BendLinearPass');
IASWBPC  = rbend('IASWB', 0.00305, IASWBP(3),  IASWBP(3)/2,  IASWBP(3)/2,  0, 'BendLinearPass');
IASWBNA  = rbend('IASWB', 0.0061,  IASWBN(1),  IASWBN(1)/2,  IASWBN(1)/2,  0, 'BendLinearPass');
IASWBNB  = rbend('IASWB', 0.0061,  IASWBN(2),  IASWBN(2)/2,  IASWBN(2)/2,  0, 'BendLinearPass');
IASWBNC  = rbend('IASWB', 0.00305, IASWBN(3),  IASWBN(3)/2,  IASWBN(3)/2,  0, 'BendLinearPass');

% U5 Undulator
U5.device = {'U5GAP'};
U5.Parameter = [14 18 19 20 22 25 27 30 35 40 45 50 60 70 120 230 250]; % Gap
U5.PeakField = [0.91533720 0.67329090 0.63140240 0.58600030 0.51216510 ...
                0.41593170 0.36989030 0.30280650 0.22158930 0.15936110 ...
		0.11580370 0.08483674 0.04426467 0.02305669 0.00103300 ...
		0.00000000 0.00000000];
U5.NumberOfPoles = 156;
U5.NumberOfEndPoles = 2;
U5.Mode = 0;
U5.Type = 'AGID';
U5.Symmetry = 0;
U5.PoleWidth = 0.025;
U5.PeriodLength = 2*U5.PoleWidth;
% Driving gap
U5GAP = 25; % mm
if (U5GAP < U5.Parameter(1)) | (U5GAP > U5.Parameter(end))
    error('Gap is out of rang [minimum(%f) maximum(%f)].', ...
    U5.Parameter(1), U5.Parameter(end));
end
U5.Field = interp1(U5.Parameter,U5.PeakField,U5GAP,'linear');
%[PE N1 P2 NN PN N2 P1 NE] = [56/916 -32/61 58/61 -1 1 -58/61 32/61 -56/918]
U5B0 = U5.Field;
U5PEB0 = U5B0*56/916; % U5NEB0 = -U5PEB0;
U5P1B0 = U5B0*32/61; % U5N1B0 = -U5P1B0;
U5P2B0 = U5B0*58/61; % U5N2B0 = -U5P2B0;
U5K = U5B0/Brho;
U5PEK = U5PEB0/Brho;
U5P1K = U5P1B0/Brho;
U5P2K = U5P2B0/Brho;
U5P = [0.309*U5K*0.005 0.809*U5K*0.005 U5K*0.0025];
U5PEP = [0.309*U5PEK*0.005 0.809*U5PEK*0.005 U5PEK*0.0025];
U5P1P = [0.309*U5P1K*0.005 0.809*U5P1K*0.005 U5P1K*0.0025];
U5P2P = [0.309*U5P2K*0.005 0.809*U5P2K*0.005 U5P2K*0.0025];
U5N = -U5P;
U5NEP = -U5PEP;
U5N1P = -U5P1P;
U5N2P = -U5P2P;
% slices of poles
%------------------------------------------------------------------------------
%U5PEA = drift('U5', 0.0050, 'DriftPass');
%U5PEB = U5PEA;
%U5PEC = drift('U5', 0.0025, 'DriftPass');
%U5N1A = U5PEA;
%U5N1B = U5N1A;
%U5N1C = U5PEC;
%U5P2A = U5PEA;
%U5P2B = U5P2A;
%U5P2C = U5PEC;
%U5NNA = U5PEA;
%U5NNB = U5NNA;
%U5NNC = U5PEC;
%U5PNA = U5PEA;
%U5PNB = U5PNA;
%U5PNC = U5PEC;
%U5N2A = U5PEA;
%U5N2B = U5N2A;
%U5N2C = U5PEC;
%U5P1A = U5PEA;
%U5P1B = U5P1A;
%U5P1C = U5PEC;
%U5NEA = U5PEA;
%U5NEB = U5NEA;
%U5NEC = U5PEC;
%------------------------------------------------------------------------------
U5PEA = rbend('U5', 0.005 , U5PEP(1), U5PEP(1)/2, U5PEP(1)/2, 0, 'BendLinearPass');
U5PEB = rbend('U5', 0.005 , U5PEP(2), U5PEP(2)/2, U5PEP(2)/2, 0, 'BendLinearPass');
U5PEC = rbend('U5', 0.0025, U5PEP(3), U5PEP(3)/2, U5PEP(3)/2, 0, 'BendLinearPass');
U5NEA = rbend('U5', 0.005 , U5NEP(1), U5NEP(1)/2, U5NEP(1)/2, 0, 'BendLinearPass');
U5NEB = rbend('U5', 0.005 , U5NEP(2), U5NEP(2)/2, U5NEP(2)/2, 0, 'BendLinearPass');
U5NEC = rbend('U5', 0.0025, U5NEP(3), U5NEP(3)/2, U5NEP(3)/2, 0, 'BendLinearPass');
U5P1A = rbend('U5', 0.005 , U5P1P(1), U5P1P(1)/2, U5P1P(1)/2, 0, 'BendLinearPass');
U5P1B = rbend('U5', 0.005 , U5P1P(2), U5P1P(2)/2, U5P1P(2)/2, 0, 'BendLinearPass');
U5P1C = rbend('U5', 0.0025, U5P1P(3), U5P1P(3)/2, U5P1P(3)/2, 0, 'BendLinearPass');
U5N1A = rbend('U5', 0.005 , U5N1P(1), U5N1P(1)/2, U5N1P(1)/2, 0, 'BendLinearPass');
U5N1B = rbend('U5', 0.005 , U5N1P(2), U5N1P(2)/2, U5N1P(2)/2, 0, 'BendLinearPass');
U5N1C = rbend('U5', 0.0025, U5N1P(3), U5N1P(3)/2, U5N1P(3)/2, 0, 'BendLinearPass');
U5P2A = rbend('U5', 0.005 , U5P2P(1), U5P2P(1)/2, U5P2P(1)/2, 0, 'BendLinearPass');
U5P2B = rbend('U5', 0.005 , U5P2P(2), U5P2P(2)/2, U5P2P(2)/2, 0, 'BendLinearPass');
U5P2C = rbend('U5', 0.0025, U5P2P(3), U5P2P(3)/2, U5P2P(3)/2, 0, 'BendLinearPass');
U5N2A = rbend('U5', 0.005 , U5N2P(1), U5N2P(1)/2, U5N2P(1)/2, 0, 'BendLinearPass');
U5N2B = rbend('U5', 0.005 , U5N2P(2), U5N2P(2)/2, U5N2P(2)/2, 0, 'BendLinearPass');
U5N2C = rbend('U5', 0.0025, U5N2P(3), U5N2P(3)/2, U5N2P(3)/2, 0, 'BendLinearPass');
U5PNA = rbend('U5', 0.005 , U5P(1),   U5P(1)/2,   U5P(1)/2,   0, 'BendLinearPass');
U5PNB = rbend('U5', 0.005 , U5P(2),   U5P(2)/2,   U5P(2)/2,   0, 'BendLinearPass');
U5PNC = rbend('U5', 0.0025, U5P(3),   U5P(3)/2,   U5P(3)/2,   0, 'BendLinearPass');
U5NNA = rbend('U5', 0.005 , U5N(1),   U5N(1)/2,   U5N(1)/2,   0, 'BendLinearPass');
U5NNB = rbend('U5', 0.005 , U5N(2),   U5N(2)/2,   U5N(2)/2,   0, 'BendLinearPass');
U5NNC = rbend('U5', 0.0025, U5N(3),   U5N(3)/2,   U5N(3)/2,   0, 'BendLinearPass');

% SW6 Super-conducting Wiggler (32 poles)
SW6HC1 = marker('SW6HC1', 'IdentityPass'); % 01/15/2009
SW6HC2 = marker('SW6HC2', 'IdentityPass'); % 01/15/2009
SW6D = drift('SW6D', 0.96, 'DriftPass'); % 01/15/2009
% Super-Conducting Multi-Pole Wiggler SW6 (32 poles, anti-symmetry)
SW6.device = {'SMPW6MPS'}; % setting
SW6.Parameter = [0 10 20 30 40 50 60 70 80 90 105 125 145 165 185 205 225 ...
                 245 265 285]; % Current
SW6.PeakField = [0 0.448 0.699 0.848 0.976 1.091 1.202 1.303 1.402 1.499 ...
                 1.64 1.823 2.002 2.179 2.355 2.529 2.702 2.875 3.046 3.216];
SW6.NumberOfPoles = 32;
SW6.NumberOfEndPoles = 1;
SW6.Mode = 0;
SW6.Type = 'AGID';
SW6.Symmetry = 0;
SW6.PoleWidth = 0.03;
SW6.PeriodLength = 2*SW6.PoleWidth;
% Driving current
SMPW6MPS = 285; % Amp
if (SMPW6MPS < SW6.Parameter(1)) | (SMPW6MPS > SW6.Parameter(end))
    error('Current is out of rang [minimum(%f) maximum(%f)].', ...
    SW6.Parameter(1), SW6.Parameter(end));
end
SW6.Field = interp1(SW6.Parameter,SW6.PeakField,SMPW6MPS,'linear');
SW6B0 = SW6.Field;
SW6EB0 = SW6B0*(57/448);
SW62B0 = SW6B0*(270/448);
SW6K = SW6B0/Brho;
SW6EK = SW6EB0/Brho;
SW62K = SW62B0/Brho;
SW6P = [0.309*SW6K*0.006 0.809*SW6K*0.006 SW6K*0.003];
SW6EP = [0.309*SW6EK*0.006 0.809*SW6EK*0.006 SW6EK*0.003];
SW62P = [0.309*SW62K*0.006 0.809*SW62K*0.006 SW62K*0.003];
SW6N = -SW6P;
SW6EN = -SW6EP;
SW62N = -SW62P;
% slices of poles
%------------------------------------------------------------------------------
%SW6PEA = drift('SW6', 0.006, 'DriftPass'); % 01/15/2009
%SW6PEB = SW6PEA; % 01/15/2009
%SW6PEC = drift('SW6', 0.003, 'DriftPass'); % 01/15/2009
%SW6NEA = SW6PEA; % 01/15/2009
%SW6NEB = SW6PEA; % 01/15/2009
%SW6NEC = SW6PEC; % 01/15/2009
%SW6P2A = SW6PEA; % 01/15/2009
%SW6P2B = SW6PEA; % 01/15/2009
%SW6P2C = SW6PEC; % 01/15/2009
%SW6N2A = SW6PEA; % 01/15/2009
%SW6N2B = SW6PEA; % 01/15/2009
%SW6N2C = SW6PEC; % 01/15/2009
%SW6PA = SW6PEA; % 01/15/2009
%SW6PB = SW6PEA; % 01/15/2009
%SW6PC = SW6PEC; % 01/15/2009
%SW6NA = SW6PEA; % 01/15/2009
%SW6NB = SW6PEA; % 01/15/2009
%SW6NC = SW6PEC; % 01/15/2009
%------------------------------------------------------------------------------
SW6PEA = rbend('SW6', 0.006, SW6EP(1), SW6EP(1)/2, SW6EP(1)/2, 0, 'BendLinearPass');
SW6PEB = rbend('SW6', 0.006, SW6EP(2), SW6EP(2)/2, SW6EP(2)/2, 0, 'BendLinearPass');
SW6PEC = rbend('SW6', 0.003, SW6EP(3), SW6EP(3)/2, SW6EP(3)/2, 0, 'BendLinearPass');
SW6NEA = rbend('SW6', 0.006, SW6EN(1), SW6EN(1)/2, SW6EN(1)/2, 0, 'BendLinearPass');
SW6NEB = rbend('SW6', 0.006, SW6EN(2), SW6EN(2)/2, SW6EN(2)/2, 0, 'BendLinearPass');
SW6NEC = rbend('SW6', 0.003, SW6EN(3), SW6EN(3)/2, SW6EN(3)/2, 0, 'BendLinearPass');
SW6P2A = rbend('SW6', 0.006, SW62P(1), SW62P(1)/2, SW62P(1)/2, 0, 'BendLinearPass');
SW6P2B = rbend('SW6', 0.006, SW62P(2), SW62P(2)/2, SW62P(2)/2, 0, 'BendLinearPass');
SW6P2C = rbend('SW6', 0.003, SW62P(3), SW62P(3)/2, SW62P(3)/2, 0, 'BendLinearPass');
SW6N2A = rbend('SW6', 0.006, SW62N(1), SW62N(1)/2, SW62N(1)/2, 0, 'BendLinearPass');
SW6N2B = rbend('SW6', 0.006, SW62N(2), SW62N(2)/2, SW62N(2)/2, 0, 'BendLinearPass');
SW6N2C = rbend('SW6', 0.003, SW62N(3), SW62N(3)/2, SW62N(3)/2, 0, 'BendLinearPass');
SW6PA  = rbend('SW6', 0.006, SW6P(1),  SW6P(1)/2,  SW6P(1)/2,  0, 'BendLinearPass');
SW6PB  = rbend('SW6', 0.006, SW6P(2),  SW6P(2)/2,  SW6P(2)/2,  0, 'BendLinearPass');
SW6PC  = rbend('SW6', 0.003, SW6P(3),  SW6P(3)/2,  SW6P(3)/2,  0, 'BendLinearPass');
SW6NA  = rbend('SW6', 0.006, SW6N(1),  SW6N(1)/2,  SW6N(1)/2,  0, 'BendLinearPass');
SW6NB  = rbend('SW6', 0.006, SW6N(2),  SW6N(2)/2,  SW6N(2)/2,  0, 'BendLinearPass');
SW6NC  = rbend('SW6', 0.003, SW6N(3),  SW6N(3)/2,  SW6N(3)/2,  0, 'BendLinearPass');

% Wiggler W20
RXWD1 = drift('WIG', 0.0945, 'DriftPass');
RXWD2 = drift('WIG', 0.0505, 'DriftPass');
W20CENTER = marker('WIG', 'IdentityPass'); % 01/15/2009
R4ENDHC = marker('WIG', 'IdentityPass');
R5ENDHC = R4ENDHC;
% W20 wiggler
W20.device = {'W20GAP'};
W20.Parameter = [22 22.3 26 30 35 40 45 50 60 70 80 90 100 110 120 130 140 ...
                 150 160 170 180 190 200 210 220 230]; % Gap
W20.PeakField = [1.85800442 1.83999121 1.63038117 1.42944175 1.22988308 ...
                 1.07126800 0.94573509 0.84357756 0.68074448 0.56165399 ...
		 0.46678419 0.39248674 0.33061181 0.28011830 0.23751561 ...
		 0.20211365 0.17175343 0.14642083 0.12460224 0.10633915 ...
		 0.09061517 0.07733557 0.06599265 0.05631031 0.04809014 ...
		 0.04107413];
W20.NumberOfPoles = 27;
W20.NumberOfEndPoles = 2;
W20.Mode = 0; % sin/cos (kappa_1nx, kappa_2nx)
W20.Type = 'AGID';
W20.Symmetry = 1;
W20.PoleWidth = 0.1; % Unit: meter, 0.1 meter = 10 cm
W20.PeriodLength = 2*W20.PoleWidth;
% Driving gap (which is fixed to be 22.5 mm)
W20GAP = 22.5;
if (W20GAP < W20.Parameter(1)) | (W20GAP > W20.Parameter(end))
    error('Gap is out of rang [minimum(%f) maximum(%f)].', ...
    W20.Parameter(1), W20.Parameter(end));
end
W20.Field = interp1(W20.Parameter,W20.PeakField,W20GAP,'linear');
% W20 Gap = 22.5 mm
% (P1,P2,PX,PC) K0max = 0.3175   -1.1770    1.8287   -1.8265 T
% [P1 P2 PX PC] = [1/6 -2/3 1 -1] = [0.3048 -1.2191 1.8287 -1.8287]
% Peak field of W20 (T)
%W20B22p5 = 1.8288;
W20B22p5 = W20.Field;
%W20B22p5 = 0.0;
W20B22p5P1 = W20B22p5/6;
W20B22p5P2 = -W20B22p5*2/3;
% Br == Brho = 5.0;
W20K22p5 = W20B22p5/Brho;
W20K22p5P1 = W20B22p5P1/Brho;
W20K22p5P2 = W20B22p5P2/Brho;
W20ABC22p5 = [0.309*W20K22p5*0.02 0.809*W20K22p5*0.02 W20K22p5*0.01];
W20ABC22p5P1 = [0.309*W20K22p5P1*0.02 0.809*W20K22p5P1*0.02 W20K22p5P1*0.01];
W20ABC22p5P2 = [0.309*W20K22p5P2*0.02 0.809*W20K22p5P2*0.02 W20K22p5P2*0.01];
W20ABC22p5PX = W20ABC22p5;
W20ABC22p5PC = -W20ABC22p5;
%2*sum(W20ABC22p5P1)+2*sum(W20ABC22p5P2)+12*sum(W20ABC22p5PX)+11*sum(W20ABC22p5PC)
% W20DP = rbend('DP', L, Angle (rad), e1 (rad), e2 (rad), K, 'BendLinearPass');
%W20B22p5P1(1) = W20B22p5P1(1)-0.01;
% slices of poles
%------------------------------------------------------------------------------
W20AB = drift('W20', 0.02, 'DriftPass');
W20CD = drift('W20', 0.01, 'DriftPass');
%
RXWP1A = W20AB; % 0.309 K0max
RXWP1B = W20AB; % 0.809 K0max
RXWP1C = W20CD; % 1.000 K0max
% RXWP2:ID_PL,L=0.100000,TILT=0;& K0max = Bmax/B0_rho = 0.275438 1/M
RXWP2A = W20AB; % 0.309 K0max
RXWP2B = W20AB; % 0.809 K0max
RXWP2C = W20CD; % 1.000 K0max
% RXWPX:ID_PL,L=0.100000,TILT=0;& K0max=Bmax/B0_rho = -0.42833456 1/M
RXWPXA = W20AB; % 0.309 K0max
RXWPXB = W20AB; % 0.809 K0max
RXWPXC = W20CD; % 1.000 K0max
% RXWPC:ID_PL,L=0.100000,TILT=0;& K0max = Bmax/B0_rho = 0.42833456 1/M
RXWPCA = W20AB; % 0.309 K0max
RXWPCB = W20AB; % 0.809 K0max
RXWPCC = W20CD; % 1.000 K0max
%------------------------------------------------------------------------------
W20P1A = rbend('W20', 0.02, W20ABC22p5P1(1), W20ABC22p5P1(1)/2, W20ABC22p5P1(1)/2, 0, 'BendLinearPass');
W20P1B = rbend('W20', 0.02, W20ABC22p5P1(2), W20ABC22p5P1(2)/2, W20ABC22p5P1(2)/2, 0, 'BendLinearPass');
W20P1C = rbend('W20', 0.01, W20ABC22p5P1(3), W20ABC22p5P1(3)/2, W20ABC22p5P1(3)/2, 0, 'BendLinearPass');
W20P2A = rbend('W20', 0.02, W20ABC22p5P2(1), W20ABC22p5P2(1)/2, W20ABC22p5P2(1)/2, 0, 'BendLinearPass');
W20P2B = rbend('W20', 0.02, W20ABC22p5P2(2), W20ABC22p5P2(2)/2, W20ABC22p5P2(2)/2, 0, 'BendLinearPass');
W20P2C = rbend('W20', 0.01, W20ABC22p5P2(3), W20ABC22p5P2(3)/2, W20ABC22p5P2(3)/2, 0, 'BendLinearPass');
W20PXA = rbend('W20', 0.02, W20ABC22p5PX(1), W20ABC22p5PX(1)/2, W20ABC22p5PX(1)/2, 0, 'BendLinearPass');
W20PXB = rbend('W20', 0.02, W20ABC22p5PX(2), W20ABC22p5PX(2)/2, W20ABC22p5PX(2)/2, 0, 'BendLinearPass');
W20PXC = rbend('W20', 0.01, W20ABC22p5PX(3), W20ABC22p5PX(3)/2, W20ABC22p5PX(3)/2, 0, 'BendLinearPass');
W20PCA = rbend('W20', 0.02, W20ABC22p5PC(1), W20ABC22p5PC(1)/2, W20ABC22p5PC(1)/2, 0, 'BendLinearPass');
W20PCB = rbend('W20', 0.02, W20ABC22p5PC(2), W20ABC22p5PC(2)/2, W20ABC22p5PC(2)/2, 0, 'BendLinearPass');
W20PCC = rbend('W20', 0.01, W20ABC22p5PC(3), W20ABC22p5PC(3)/2, W20ABC22p5PC(3)/2, 0, 'BendLinearPass');
%

% U9 Undulator
U9UD = drift('U9D', 0.235, 'DriftPass');
U9UDA = drift('U9D', 0.053, 'DriftPass');
U9UDB = drift('U9D', 0.182, 'DriftPass');
U9D = drift('U9D', 4.5, 'DriftPass');
U9DD = drift('U9D', 0.27, 'DriftPass');
U9DDA = drift('U9D', 0.195, 'DriftPass');
U9DDB = drift('U9D', 0.075, 'DriftPass');
% Undulator U9
% [NE P1 N2 PN NN P2 N1 PE] = [-2147/12802 8855/12802 -125/128 1 -1 125/128 -8855/12802 2147/12802]
U9.device = {'U9GAP'};
U9.Parameter = [18 19 20 21 22 24 26 28 30 32 34 36 38 42 46 50 54 60 70 ...
                80 100 220 230]; % Gap
U9.PeakField = [1.28021150 1.28021150 1.21708700 1.15863990 1.10385940 ...
                1.00499390 0.91819627 0.84152641 0.77290514 0.71158841 ...
		0.65633119 0.60639290 0.56080759 0.48108067 0.41400438 ...
		0.35693640 0.30817691 0.24765390 0.17248560 0.12025689 ...
		0.05841128 0.00077322 0.00000000];
U9.NumberOfPoles = 100;
U9.NumberOfEndPoles = 2;
U9.Mode = 1;
U9.Type = 'AGID';
U9.Symmetry = 0;
U9.PoleWidth = 0.045;
U9.PeriodLength = 2*U9.PoleWidth;
% Driving gap
U9GAP = 30; % mm
if (U9GAP < U9.Parameter(1)) | (U9GAP > U9.Parameter(end))
    error('Gap is out of rang [minimum(%f) maximum(%f)].', ...
    U9.Parameter(1), U9.Parameter(end));
end
U9.Field = interp1(U9.Parameter,U9.PeakField,U9GAP,'linear');
% [NE P1 N2 PN NN P2 N1 PE] = [-2147/12802 8855/12802 -125/128 1 -1 125/128 -8855/12802 2147/12802]
U9B0 = U9.Field;
U9PEB0 = U9B0*(2147/12802); % U9NEB0 = -U9PEB0;
U9P1B0 = U9B0*(8855/12802); % U9N1B0 = -U9P1B0;
U9P2B0 = U9B0*(125/128); % U9N2B0 = -U9P2B0;
U9K = U9B0/Brho;
U9PEK = U9PEB0/Brho;
U9P1K = U9P1B0/Brho;
U9P2K = U9P2B0/Brho;
U9P = [0.309*U9K*0.009 0.809*U9K*0.009 U9K*0.0045];
U9PEP = [0.309*U9PEK*0.009 0.809*U9PEK*0.009 U9PEK*0.0045];
U9P1P = [0.309*U9P1K*0.009 0.809*U9P1K*0.009 U9P1K*0.0045];
U9P2P = [0.309*U9P2K*0.009 0.809*U9P2K*0.009 U9P2K*0.0045];
U9N = -U9P;
U9NEP = -U9PEP;
U9N1P = -U9P1P;
U9N2P = -U9P2P;
% slices of poles
%------------------------------------------------------------------------------
%U9NEA = drift('U9', 0.009, 'DriftPass'); % 0.309 K0max
%U9NEB = U9NEA; % 0.809 K0max
%U9NEC = drift('U9', 0.0045, 'DriftPass'); % 1.000 K0max
%U9PEA = U9NEA; % 0.309 K0max
%U9PEB = U9PEA; % 0.809 K0max
%U9PEC = U9NEC; % 1.000 K0max
%U9N1A = U9NEA; % 0.309 K0max
%U9N1B = U9N1A; % 0.809 K0max
%U9N1C = U9NEC; % 1.000 K0max
%U9P1A = U9PEA; % 0.309 K0max
%U9P1B = U9P1A; % 0.809 K0max
%U9P1C = U9NEC; % 1.000 K0max
%U9N2A = U9PEA; % 0.309 K0max
%U9N2B = U9N2A; % 0.809 K0max
%U9N2C = U9NEC; % 1.000 K0max
%U9P2A = U9PEA; % 0.309 K0max
%U9P2B = U9P2A; % 0.809 K0max
%U9P2C = U9NEC; % 1.000 K0max
%U9NNA = U9PEA; % 0.309 K0max
%U9NNB = U9NNA; % 0.809 K0max
%U9NNC = U9NEC; % 1.000 K0max
%U9PNA = U9PEA; % 0.309 K0max
%U9PNB = U9PNA; % 0.809 K0max
%U9PNC = U9NEC; % 1.000 K0max
%------------------------------------------------------------------------------
U9PEA = rbend('U9', 0.009 , U9PEP(1), U9PEP(1)/2, U9PEP(1)/2, 0, 'BendLinearPass');
U9PEB = rbend('U9', 0.009 , U9PEP(2), U9PEP(2)/2, U9PEP(2)/2, 0, 'BendLinearPass');
U9PEC = rbend('U9', 0.0045, U9PEP(3), U9PEP(3)/2, U9PEP(3)/2, 0, 'BendLinearPass');
U9NEA = rbend('U9', 0.009 , U9NEP(1), U9NEP(1)/2, U9NEP(1)/2, 0, 'BendLinearPass');
U9NEB = rbend('U9', 0.009 , U9NEP(2), U9NEP(2)/2, U9NEP(2)/2, 0, 'BendLinearPass');
U9NEC = rbend('U9', 0.0045, U9NEP(3), U9NEP(3)/2, U9NEP(3)/2, 0, 'BendLinearPass');
U9P1A = rbend('U9', 0.009 , U9P1P(1), U9P1P(1)/2, U9P1P(1)/2, 0, 'BendLinearPass');
U9P1B = rbend('U9', 0.009 , U9P1P(2), U9P1P(2)/2, U9P1P(2)/2, 0, 'BendLinearPass');
U9P1C = rbend('U9', 0.0045, U9P1P(3), U9P1P(3)/2, U9P1P(3)/2, 0, 'BendLinearPass');
U9N1A = rbend('U9', 0.009 , U9N1P(1), U9N1P(1)/2, U9N1P(1)/2, 0, 'BendLinearPass');
U9N1B = rbend('U9', 0.009 , U9N1P(2), U9N1P(2)/2, U9N1P(2)/2, 0, 'BendLinearPass');
U9N1C = rbend('U9', 0.0045, U9N1P(3), U9N1P(3)/2, U9N1P(3)/2, 0, 'BendLinearPass');
U9P2A = rbend('U9', 0.009 , U9P2P(1), U9P2P(1)/2, U9P2P(1)/2, 0, 'BendLinearPass');
U9P2B = rbend('U9', 0.009 , U9P2P(2), U9P2P(2)/2, U9P2P(2)/2, 0, 'BendLinearPass');
U9P2C = rbend('U9', 0.0045, U9P2P(3), U9P2P(3)/2, U9P2P(3)/2, 0, 'BendLinearPass');
U9N2A = rbend('U9', 0.009 , U9N2P(1), U9N2P(1)/2, U9N2P(1)/2, 0, 'BendLinearPass');
U9N2B = rbend('U9', 0.009 , U9N2P(2), U9N2P(2)/2, U9N2P(2)/2, 0, 'BendLinearPass');
U9N2C = rbend('U9', 0.0045, U9N2P(3), U9N2P(3)/2, U9N2P(3)/2, 0, 'BendLinearPass');
U9PNA = rbend('U9', 0.009 , U9P(1),   U9P(1)/2,   U9P(1)/2,   0, 'BendLinearPass');
U9PNB = rbend('U9', 0.009 , U9P(2),   U9P(2)/2,   U9P(2)/2,   0, 'BendLinearPass');
U9PNC = rbend('U9', 0.0045, U9P(3),   U9P(3)/2,   U9P(3)/2,   0, 'BendLinearPass');
U9NNA = rbend('U9', 0.009 , U9N(1),   U9N(1)/2,   U9N(1)/2,   0, 'BendLinearPass');
U9NNB = rbend('U9', 0.009 , U9N(2),   U9N(2)/2,   U9N(2)/2,   0, 'BendLinearPass');
U9NNC = rbend('U9', 0.0045, U9N(3),   U9N(3)/2,   U9N(3)/2,   0, 'BendLinearPass');

% IASW6 In-Arc Super-conducting Wiggler
IASW6HC1 = marker('IASW6HC1', 'IdentityPass'); % 01/15/2009
IASW6HC2 = marker('IASW6HC2', 'IdentityPass'); % 01/15/2009
IASW6D = drift('IASW6D', 0.488, 'DriftPass'); % 01/15/2009
% Super-Conducting Multi-Pole Wiggler IASW6 (16 pole, anti-symmetry)
IASW6.device = {'IASW6MPS'}; % setting  (===> IASWAMPS ???)
IASW6.Parameter = [0 10.0406 11.9611 12.7613 13.7216 14.8418 15.9621 16.4422 ...
                   17.8826 18.6828 19.483 20.4432 49.8906 100.463 200.328 ...
		   250.412 262.904 276.187 288.83]; % Current
IASW6.PeakField = [0 0.5013 0.5577 0.5768 0.5998 0.6234 0.6461 0.6553 0.6812 ...
                   0.695 0.708 0.7214 1.0981 1.6089 2.5348 2.9927 3.1 3.22 ...
		   3.3397];
IASW6.NumberOfPoles = 32;
IASW6.NumberOfEndPoles = 1;
IASW6.Mode = 0;
IASW6.Type = 'AGID';
IASW6.Symmetry = 0;
IASW6.PoleWidth = 0.0305;
IASW6.PeriodLength = 2*IASW6.PoleWidth;
% Driving current
IASW6MPS = 255; % Amp
if (IASW6MPS < IASW6.Parameter(1)) | (IASW6MPS > IASW6.Parameter(end))
    error('Current is out of rang [minimum(%f) maximum(%f)].', ...
    IASW6.Parameter(1), IASW6.Parameter(end));
end
IASW6.Field = interp1(IASW6.Parameter,IASW6.PeakField,IASW6MPS,'linear');
IASW6B0 = IASW6.Field;
IASW6EB0 = IASW6B0*(125325/501300);
IASW62B0 = IASW6B0*(375975/501300);
IASW6K = IASW6B0/Brho;
IASW6EK = IASW6EB0/Brho;
IASW62K = IASW62B0/Brho;
IASW6P = [0.309*IASW6K*0.0061 0.809*IASW6K*0.0061 IASW6K*0.00305];
IASW6EP = [0.309*IASW6EK*0.0061 0.809*IASW6EK*0.0061 IASW6EK*0.00305];
IASW62P = [0.309*IASW62K*0.0061 0.809*IASW62K*0.0061 IASW62K*0.00305];
IASW6N = -IASW6P;
IASW6EN = -IASW6EP;
IASW62N = -IASW62P;
% slices of poles
%------------------------------------------------------------------------------
%IASW6PEA = drift('IASW6', 0.0061, 'DriftPass'); % 01/15/2009
%IASW6PEB = SW6PEA; % 01/15/2009
%IASW6PEC = drift('IASW6', 0.00305, 'DriftPass'); % 01/15/2009
%IASW6NEA = IASW6PEA; % 01/15/2009
%IASW6NEB = IASW6PEA; % 01/15/2009
%IASW6NEC = IASW6PEC; % 01/15/2009
%IASW6P2A = IASW6PEA; % 01/15/2009
%IASW6P2B = IASW6PEA; % 01/15/2009
%IASW6P2C = IASW6PEC; % 01/15/2009
%IASW6N2A = IASW6PEA; % 01/15/2009
%IASW6N2B = IASW6PEA; % 01/15/2009
%IASW6N2C = IASW6PEC; % 01/15/2009
%IASW6PA  = IASW6PEA; % 01/15/2009
%IASW6PB  = IASW6PEA; % 01/15/2009
%IASW6PC  = IASW6PEC; % 01/15/2009
%IASW6NA  = IASW6PEA; % 01/15/2009
%IASW6NB  = IASW6PEA; % 01/15/2009
%IASW6NC  = IASW6PEC; % 01/15/2009
%------------------------------------------------------------------------------
IASW6PEA = rbend('IASW6', 0.0061,  IASW6EP(1), IASW6EP(1)/2, IASW6EP(1)/2, 0, 'BendLinearPass');
IASW6PEB = rbend('IASW6', 0.0061,  IASW6EP(2), IASW6EP(2)/2, IASW6EP(2)/2, 0, 'BendLinearPass');
IASW6PEC = rbend('IASW6', 0.00305, IASW6EP(3), IASW6EP(3)/2, IASW6EP(3)/2, 0, 'BendLinearPass');
IASW6NEA = rbend('IASW6', 0.0061,  IASW6EN(1), IASW6EN(1)/2, IASW6EN(1)/2, 0, 'BendLinearPass');
IASW6NEB = rbend('IASW6', 0.0061,  IASW6EN(2), IASW6EN(2)/2, IASW6EN(2)/2, 0, 'BendLinearPass');
IASW6NEC = rbend('IASW6', 0.00305, IASW6EN(3), IASW6EN(3)/2, IASW6EN(3)/2, 0, 'BendLinearPass');
IASW6P2A = rbend('IASW6', 0.0061,  IASW62P(1), IASW62P(1)/2, IASW62P(1)/2, 0, 'BendLinearPass');
IASW6P2B = rbend('IASW6', 0.0061,  IASW62P(2), IASW62P(2)/2, IASW62P(2)/2, 0, 'BendLinearPass');
IASW6P2C = rbend('IASW6', 0.00305, IASW62P(3), IASW62P(3)/2, IASW62P(3)/2, 0, 'BendLinearPass');
IASW6N2A = rbend('IASW6', 0.0061,  IASW62N(1), IASW62N(1)/2, IASW62N(1)/2, 0, 'BendLinearPass');
IASW6N2B = rbend('IASW6', 0.0061,  IASW62N(2), IASW62N(2)/2, IASW62N(2)/2, 0, 'BendLinearPass');
IASW6N2C = rbend('IASW6', 0.00305, IASW62N(3), IASW62N(3)/2, IASW62N(3)/2, 0, 'BendLinearPass');
IASW6PA  = rbend('IASW6', 0.0061,  IASW6P(1),  IASW6P(1)/2,  IASW6P(1)/2,  0, 'BendLinearPass');
IASW6PB  = rbend('IASW6', 0.0061,  IASW6P(2),  IASW6P(2)/2,  IASW6P(2)/2,  0, 'BendLinearPass');
IASW6PC  = rbend('IASW6', 0.00305, IASW6P(3),  IASW6P(3)/2,  IASW6P(3)/2,  0, 'BendLinearPass');
IASW6NA  = rbend('IASW6', 0.0061,  IASW6N(1),  IASW6N(1)/2,  IASW6N(1)/2,  0, 'BendLinearPass');
IASW6NB  = rbend('IASW6', 0.0061,  IASW6N(2),  IASW6N(2)/2,  IASW6N(2)/2,  0, 'BendLinearPass');
IASW6NC  = rbend('IASW6', 0.00305, IASW6N(3),  IASW6N(3)/2,  IASW6N(3)/2,  0, 'BendLinearPass');

%Standard Cell Dipoles
%PI = 3.14159265358979;
%BBANGLE = PI/9;
BBANGLE = pi/9;

% Bending magnets
BEND = rbend('BEND',1.22, BBANGLE, BBANGLE/2, BBANGLE/2, -0.367013, 'BendLinearPass');
HDM = rbend('HDM', 0.61, BBANGLE/2, BBANGLE/4, BBANGLE/4, -0.367013, 'BendLinearPass');

%Standard Cell Quadrupoles
Q1 = quadrupole('QD1', 0.35, -1.49732, 'QuadLinearPass');
Q2 = quadrupole('QF1', 0.35, 2.8575, 'QuadLinearPass');
Q3 = quadrupole('QD2', 0.24, -1.17713, 'QuadLinearPass');
Q4 = quadrupole('QF2', 0.35, 2.79352, 'QuadLinearPass');

%
R1QD1 = Q1;
R2QD1 = Q1;
R3QD1 = Q1;
R4QD1 = Q1;
R5QD1 = Q1;
R6QD1 = Q1;
%
R1QF2 = Q2;
R2QF2 = Q2;
R3QF2 = Q2;
R4QF2 = Q2;
R5QF2 = Q2;
R6QF2 = Q2;
%
R1QD3 = Q3;
R2QD3 = Q3;
R3QD3 = Q3;
R4QD3 = Q3;
R5QD3 = Q3;
R6QD3 = Q3;
%
R1QF4 = Q4;
R2QF4 = Q4;
R3QF4 = Q4;
R4QF4 = Q4;
R5QF4 = Q4;
R6QF4 = Q4;
%
R1QF5 = Q4;
R2QF5 = Q4;
R3QF5 = Q4;
R4QF5 = Q4;
R5QF5 = Q4;
R6QF5 = Q4;
%
R1QD6 = Q3;
R2QD6 = Q3;
R3QD6 = Q3;
R4QD6 = Q3;
R5QD6 = Q3;
R6QD6 = Q3;
%
R1QF7 = Q2;
R2QF7 = Q2;
R3QF7 = Q2;
R4QF7 = Q2;
R5QF7 = Q2;
R6QF7 = Q2;
%
R1QD8 = Q1;
R2QD8 = Q1;
R3QD8 = Q1;
R4QD8 = Q1;
R5QD8 = Q1;
R6QD8 = Q1;
% Skew Quadrupole
SQ = marker('SQ', 'IdentityPass');
%SQ = quadrupole('SQ'  , 0.1,  0.0 ,'QuadLinearPass');
%SQ = drift('SQ', 0.1, 'DriftPass');
% RSQ = quadrupole('RSQ', 0.1,  0.0 ,'QuadLinearPass');

R1SQ1 = SQ;
R2SQ0 = SQ;
R2SQ1 = SQ;
R2SQ2 = SQ;
R4SQ1 = SQ;
R5SQ1 = SQ;
R5SQ2 = SQ;
R6SQ1 = SQ;
R6SQ2 = SQ;


% Standard Cell Sextupoles (K2/2)???
SF = sextupole('SF', 0.06, 34.7347, 'StrMPoleSymplectic4Pass'); 
SD = sextupole('SD', 0.06, -39.3149, 'StrMPoleSymplectic4Pass');
%
R1SF1 = SF;
R1SF2 = SF;
R2SF1 = SF;
R2SF2 = SF;
R3SF1 = SF;
R3SF2 = SF;
R4SF1 = SF;
R4SF2 = SF;
R5SF1 = SF;
R5SF2 = SF;
R6SF1 = SF;
R6SF2 = SF;
%
R1SD1 = SD;
R1SD2 = SD;
R2SD1 = SD;
R2SD2 = SD;
R3SD1 = SD;
R3SD2 = SD;
R4SD1 = SD;
R4SD2 = SD;
R5SD1 = SD;
R5SD2 = SD;
R6SD1 = SD;
R6SD2 = SD;

% Sub-beam-line
% SWLS
SWLS = [SWLSEA SWLSEB SWLSEC SWLSEC SWLSEB SWLSEA ...
        SWLSA SWLSB SWLSC SWLSC SWLSB SWLSA ...
        SWLSEA SWLSEB SWLSEC SWLSEC SWLSEB SWLSEA];
% EPU56 Undulator
R1EPU = [EPU56PEA EPU56PEB EPU56PEC EPU56PEC EPU56PEB EPU56PEA ... %
         EPU56NEA EPU56NEB EPU56NEC EPU56NEC EPU56NEB EPU56NEA ... %
         EPU56P1A EPU56P1B EPU56P1C EPU56P1C EPU56P1B EPU56P1A ... %
         EPU56N1A EPU56N1B EPU56N1C EPU56N1C EPU56N1B EPU56N1A ... % 
         EPU56P2A EPU56P2B EPU56P2C EPU56P2C EPU56P2B EPU56P2A ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... % 10
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... % 20
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... % 30
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... % 40
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... % 50
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... % 60
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC];
R2EPU = [EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... % 70
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... % 80
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... % 90
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... % 100
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... % 110
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... % 120
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56PA EPU56PB EPU56PC EPU56PC EPU56PB EPU56PA ... %
         EPU56NA EPU56NB EPU56NC EPU56NC EPU56NB EPU56NA ... %
         EPU56P2A EPU56P2B EPU56P2C EPU56P2C EPU56P2B EPU56P2A ... %
         EPU56N1A EPU56N1B EPU56N1C EPU56N1C EPU56N1B EPU56N1A ... % 130
         EPU56P1A EPU56P1B EPU56P1C EPU56P1C EPU56P1B EPU56P1A ... %
         EPU56NEA EPU56NEB EPU56NEC EPU56NEC EPU56NEB EPU56NEA ... %
         EPU56PEA EPU56PEB EPU56PEC EPU56PEC EPU56PEB EPU56PEA];
% R2 In-Arc Super-conducting Wiggler IASWB at the front of R2DM2
IASWB = [IASWBPEA IASWBPEB IASWBPEC IASWBPEC IASWBPEB IASWBPEA ... %1
         IASWBN2A IASWBN2B IASWBN2C IASWBN2C IASWBN2B IASWBN2A ... %2
         IASWBPA IASWBPB IASWBPC IASWBPC IASWBPB IASWBPA ... %3
         IASWBNA IASWBNB IASWBNC IASWBNC IASWBNB IASWBNA ... %4
         IASWBPA IASWBPB IASWBPC IASWBPC IASWBPB IASWBPA ... %5
         IASWBNA IASWBNB IASWBNC IASWBNC IASWBNB IASWBNA ... %6
         IASWBPA IASWBPB IASWBPC IASWBPC IASWBPB IASWBPA ... %7
         IASWBNA IASWBNB IASWBNC IASWBNC IASWBNB IASWBNA ... %8
         IASWBPA IASWBPB IASWBPC IASWBPC IASWBPB IASWBPA ... %9
         IASWBNA IASWBNB IASWBNC IASWBNC IASWBNB IASWBNA ... %10
         IASWBPA IASWBPB IASWBPC IASWBPC IASWBPB IASWBPA ... %11
         IASWBNA IASWBNB IASWBNC IASWBNC IASWBNB IASWBNA ... %12
         IASWBPA IASWBPB IASWBPC IASWBPC IASWBPB IASWBPA ... %13
         IASWBNA IASWBNB IASWBNC IASWBNC IASWBNB IASWBNA ... %14
         IASWBP2A IASWBP2B IASWBP2C IASWBP2C IASWBP2B IASWBP2A ... %15
         IASWBNEA IASWBNEB IASWBNEC IASWBNEC IASWBNEB IASWBNEA]; %16
% Undulator U5
R2U5 = [U5PEA U5PEB U5PEC U5PEC U5PEB U5PEA ... %1
        U5N1A U5N1B U5N1C U5N1C U5N1B U5N1A ... %1
        U5P2A U5P2B U5P2C U5P2C U5P2B U5P2A ... %2
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %2
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %3
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %3
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %4
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %4
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %5
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %5
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %6
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %6
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %7
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %7
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %8
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %8
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %9
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %9
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %10
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %10
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %11
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %11
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %12
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %12
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %13
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %13
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %14
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %14
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %15
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %15
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %16
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %16
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %17
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %17
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %18
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %18
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %19
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %19
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %20
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %20
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %21
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %21
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %22
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %22
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %23
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %23
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %24
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %24
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %25
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %25
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %26
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %26
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %27
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %27
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %28
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %28
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %29
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %29
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %30
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %30
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %31
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %31
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %32
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %32
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %33
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %33
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %34
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %34
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %35
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %35
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %36
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %36
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %37
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %37
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %38
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %38
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %39
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA];
R3U5 = [U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %40
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %40
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %41
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %41
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %42
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %42
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %43
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %43
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %44
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %44
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %45
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %45
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %46
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %46
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %47
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %47
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %48
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %48
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %49
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %49
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %50
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %50
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %51
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %51
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %52
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %52
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %53
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %53
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %54
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %54
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %55
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %55
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %56
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %56
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %57
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %57
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %58
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %58
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %59
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %59
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %60
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %60
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %61
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %61
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %62
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %62
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %63
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %63
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %64
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %64
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %65
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %65
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %66
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %66
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %67
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %67
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %68
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %68
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %69
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %69
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %70
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %70
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %71
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %71
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %72
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %72
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %73
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %73
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %74
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %74
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %75
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %75
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %76
        U5NNA U5NNB U5NNC U5NNC U5NNB U5NNA ... %76
        U5PNA U5PNB U5PNC U5PNC U5PNB U5PNA ... %77
        U5N2A U5N2B U5N2C U5N2C U5N2B U5N2A ... %77
        U5P1A U5P1B U5P1C U5P1C U5P1B U5P1A ... %78
        U5NEA U5NEB U5NEC U5NEC U5NEB U5NEA];
% Super-conducting Wiggler SW6 at the down stream of SRF
R4SW6 = [SW6PEA SW6PEB SW6PEC SW6PEC SW6PEB SW6PEA ... %1
         SW6N2A SW6N2B SW6N2C SW6N2C SW6N2B SW6N2A ... %2
         SW6PA SW6PB SW6PC SW6PC SW6PB SW6PA ... %3
         SW6NA SW6NB SW6NC SW6NC SW6NB SW6NA ... %4
         SW6PA SW6PB SW6PC SW6PC SW6PB SW6PA ... %5
         SW6NA SW6NB SW6NC SW6NC SW6NB SW6NA ... %6
         SW6PA SW6PB SW6PC SW6PC SW6PB SW6PA ... %7
         SW6NA SW6NB SW6NC SW6NC SW6NB SW6NA ... %8
         SW6PA SW6PB SW6PC SW6PC SW6PB SW6PA ... %9
         SW6NA SW6NB SW6NC SW6NC SW6NB SW6NA ... %10
         SW6PA SW6PB SW6PC SW6PC SW6PB SW6PA ... %11
         SW6NA SW6NB SW6NC SW6NC SW6NB SW6NA ... %12
         SW6PA SW6PB SW6PC SW6PC SW6PB SW6PA ... %13
         SW6NA SW6NB SW6NC SW6NC SW6NB SW6NA ... %14
         SW6PA SW6PB SW6PC SW6PC SW6PB SW6PA ... %15
         SW6NA SW6NB SW6NC SW6NC SW6NB SW6NA ... %16
         SW6PA SW6PB SW6PC SW6PC SW6PB SW6PA ... %17
         SW6NA SW6NB SW6NC SW6NC SW6NB SW6NA ... %18
         SW6PA SW6PB SW6PC SW6PC SW6PB SW6PA ... %19
         SW6NA SW6NB SW6NC SW6NC SW6NB SW6NA ... %20
         SW6PA SW6PB SW6PC SW6PC SW6PB SW6PA ... %21
         SW6NA SW6NB SW6NC SW6NC SW6NB SW6NA ... %22
         SW6PA SW6PB SW6PC SW6PC SW6PB SW6PA ... %23
         SW6NA SW6NB SW6NC SW6NC SW6NB SW6NA ... %24
         SW6PA SW6PB SW6PC SW6PC SW6PB SW6PA ... %25
         SW6NA SW6NB SW6NC SW6NC SW6NB SW6NA ... %26
         SW6PA SW6PB SW6PC SW6PC SW6PB SW6PA ... %27
         SW6NA SW6NB SW6NC SW6NC SW6NB SW6NA ... %28
         SW6PA SW6PB SW6PC SW6PC SW6PB SW6PA ... %29
         SW6NA SW6NB SW6NC SW6NC SW6NB SW6NA ... %30
         SW6P2A SW6P2B SW6P2C SW6P2C SW6P2B SW6P2A ... %31
         SW6NEA SW6NEB SW6NEC SW6NEC SW6NEB SW6NEA]; %32
% Wiggler W20
R4WIG = [RXWP1A RXWP1B RXWP1C RXWP1C RXWP1B RXWP1A ... %1
         RXWP2A RXWP2B RXWP2C RXWP2C RXWP2B RXWP2A ... %2
         RXWPXA RXWPXB RXWPXC RXWPXC RXWPXB RXWPXA ... %3
         RXWPCA RXWPCB RXWPCC RXWPCC RXWPCB RXWPCA ... %4
         RXWPXA RXWPXB RXWPXC RXWPXC RXWPXB RXWPXA ... %5
         RXWPCA RXWPCB RXWPCC RXWPCC RXWPCB RXWPCA ... %6
         RXWPXA RXWPXB RXWPXC RXWPXC RXWPXB RXWPXA ... %7
         RXWPCA RXWPCB RXWPCC RXWPCC RXWPCB RXWPCA ... %8
         RXWPXA RXWPXB RXWPXC RXWPXC RXWPXB RXWPXA ... %9
         RXWPCA RXWPCB RXWPCC RXWPCC RXWPCB RXWPCA ... %10
         RXWPXA RXWPXB RXWPXC RXWPXC RXWPXB RXWPXA ... %11
         RXWPCA RXWPCB RXWPCC RXWPCC RXWPCB RXWPCA ... %12
         RXWPXA RXWPXB RXWPXC RXWPXC RXWPXB RXWPXA ... %13
         RXWPCA RXWPCB RXWPCC]; %14
R5WIG = [RXWPCC RXWPCB RXWPCA ... %14
         RXWPXA RXWPXB RXWPXC RXWPXC RXWPXB RXWPXA ... %15
         RXWPCA RXWPCB RXWPCC RXWPCC RXWPCB RXWPCA ... %16
         RXWPXA RXWPXB RXWPXC RXWPXC RXWPXB RXWPXA ... %17
         RXWPCA RXWPCB RXWPCC RXWPCC RXWPCB RXWPCA ... %18
         RXWPXA RXWPXB RXWPXC RXWPXC RXWPXB RXWPXA ... %19
         RXWPCA RXWPCB RXWPCC RXWPCC RXWPCB RXWPCA ... %20
         RXWPXA RXWPXB RXWPXC RXWPXC RXWPXB RXWPXA ... %21
         RXWPCA RXWPCB RXWPCC RXWPCC RXWPCB RXWPCA ... %22
         RXWPXA RXWPXB RXWPXC RXWPXC RXWPXB RXWPXA ... %23
         RXWPCA RXWPCB RXWPCC RXWPCC RXWPCB RXWPCA ... %24
         RXWPXA RXWPXB RXWPXC RXWPXC RXWPXB RXWPXA ... %25
         RXWP2A RXWP2B RXWP2C RXWP2C RXWP2B RXWP2A ... %26
         RXWP1A RXWP1B RXWP1C RXWP1C RXWP1B RXWP1A];
R4W20 = [W20P1A W20P1B W20P1C W20P1C W20P1B W20P1A ... %1
         W20P2A W20P2B W20P2C W20P2C W20P2B W20P2A ... %2
         W20PXA W20PXB W20PXC W20PXC W20PXB W20PXA ... %3
         W20PCA W20PCB W20PCC W20PCC W20PCB W20PCA ... %4
         W20PXA W20PXB W20PXC W20PXC W20PXB W20PXA ... %5
         W20PCA W20PCB W20PCC W20PCC W20PCB W20PCA ... %6
         W20PXA W20PXB W20PXC W20PXC W20PXB W20PXA ... %7
         W20PCA W20PCB W20PCC W20PCC W20PCB W20PCA ... %8
         W20PXA W20PXB W20PXC W20PXC W20PXB W20PXA ... %9
         W20PCA W20PCB W20PCC W20PCC W20PCB W20PCA ... %10
         W20PXA W20PXB W20PXC W20PXC W20PXB W20PXA ... %11
         W20PCA W20PCB W20PCC W20PCC W20PCB W20PCA ... %12
         W20PXA W20PXB W20PXC W20PXC W20PXB W20PXA ... %13
         W20PCA W20PCB W20PCC]; %14
R5W20 = [W20PCC W20PCB W20PCA ... %14
         W20PXA W20PXB W20PXC W20PXC W20PXB W20PXA ... %15
         W20PCA W20PCB W20PCC W20PCC W20PCB W20PCA ... %16
         W20PXA W20PXB W20PXC W20PXC W20PXB W20PXA ... %17
         W20PCA W20PCB W20PCC W20PCC W20PCB W20PCA ... %18
         W20PXA W20PXB W20PXC W20PXC W20PXB W20PXA ... %19
         W20PCA W20PCB W20PCC W20PCC W20PCB W20PCA ... %20
         W20PXA W20PXB W20PXC W20PXC W20PXB W20PXA ... %21
         W20PCA W20PCB W20PCC W20PCC W20PCB W20PCA ... %22
         W20PXA W20PXB W20PXC W20PXC W20PXB W20PXA ... %23
         W20PCA W20PCB W20PCC W20PCC W20PCB W20PCA ... %24
         W20PXA W20PXB W20PXC W20PXC W20PXB W20PXA ... %25
         W20P2A W20P2B W20P2C W20P2C W20P2B W20P2A ... %26
         W20P1A W20P1B W20P1C W20P1C W20P1B W20P1A];
% U9 Undulator
R5U9 = [U9NEA U9NEB U9NEC U9NEC U9NEB U9NEA ... %
        U9P1A U9P1B U9P1C U9P1C U9P1B U9P1A ... %
        U9N2A U9N2B U9N2C U9N2C U9N2B U9N2A ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... % 10
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... % 20
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... % 30
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... % 40
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA]; % 50
R6U9 = [U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... % 60
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... % 70
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... % 80
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... % 90
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9PNA U9PNB U9PNC U9PNC U9PNB U9PNA ... %
        U9NNA U9NNB U9NNC U9NNC U9NNB U9NNA ... %
        U9P2A U9P2B U9P2C U9P2C U9P2B U9P2A ... %
        U9N1A U9N1B U9N1C U9N1C U9N1B U9N1A ... %
        U9PEA U9PEB U9PEC U9PEC U9PEB U9PEA];
% In-Arc Super-conducting Wiggler IASW6 at the front of R6DM2
IASW6 = [IASW6PEA IASW6PEB IASW6PEC IASW6PEC IASW6PEB IASW6PEA ... %1
         IASW6N2A IASW6N2B IASW6N2C IASW6N2C IASW6N2B IASW6N2A ... %2
         IASW6PA IASW6PB IASW6PC IASW6PC IASW6PB IASW6PA ... %3
         IASW6NA IASW6NB IASW6NC IASW6NC IASW6NB IASW6NA ... %4
         IASW6PA IASW6PB IASW6PC IASW6PC IASW6PB IASW6PA ... %5
         IASW6NA IASW6NB IASW6NC IASW6NC IASW6NB IASW6NA ... %6
         IASW6PA IASW6PB IASW6PC IASW6PC IASW6PB IASW6PA ... %7
         IASW6NA IASW6NB IASW6NC IASW6NC IASW6NB IASW6NA ... %8
         IASW6PA IASW6PB IASW6PC IASW6PC IASW6PB IASW6PA ... %9
         IASW6NA IASW6NB IASW6NC IASW6NC IASW6NB IASW6NA ... %10
         IASW6PA IASW6PB IASW6PC IASW6PC IASW6PB IASW6PA ... %11
         IASW6NA IASW6NB IASW6NC IASW6NC IASW6NB IASW6NA ... %12
         IASW6PA IASW6PB IASW6PC IASW6PC IASW6PB IASW6PA ... %13
         IASW6NA IASW6NB IASW6NC IASW6NC IASW6NB IASW6NA ... %14
         IASW6P2A IASW6P2B IASW6P2C IASW6P2C IASW6P2B IASW6P2A ... %15
         IASW6NEA IASW6NEB IASW6NEC IASW6NEC IASW6NEB IASW6NEA]; %16
% R1 Section
R1SWLS = [SWLSLD SWLSD SWLSRD];
R1 = [R1D1A INJ_POINT SCN1 R1D1AB R1HC0 R1D1BC R1KICM3 ... % 
      R1D1CD R1VC0 R1D1DE R1BPM0 R1D1EF SWLS ... % 
      R1D1FG R1BPM1 R1D1GH R1VC0A R1D1HI R1KICM4 ... % 
      R1D1IJ R1HC0A R1D1JK R1QD1 RXD4 R1HC1 RXD5 R1QF2 ... % 
      R1D6A SCN2 R1D6BA R1VC1 R1HC1A R1D6BB ... % 
      R1QD3 RXD7 R1BPM2 RXD8 BEND RXD9 R1SD1 R1VCSD1 R1SD1 ... % 
      RXD10 R1BPM3 RXD11 R1QF4 RXD12 ... % 
      R1SF1 R1HCSF1 R1SF1 RXD13 R1BPM4 RXD14 R1VC2 ... % 
      RXD15 BEND RXD16 R1BPM5 RXD17 ... % 01/15/2009
      R1SF2 R1HCSF2 R1SF2 RXD18 R1QF5 RXD19 R1BPM6 RXD20 ... % 
      R1SD2 R1VCSD2 R1SD2 RXD21 ... % 
      BEND RXD22 R1QD6 R1D23A R1HC2A R1VC3A R1D23B R1BPM7 ... % 
      RXD24 R1QF7 RXD25 R1HC2 ... % 
      RXD26 R1QD8 R1D27A R1BPM8 R1D27B R1HC3 R1VC3 ... % 
      R1D28A R1SCN1 RXD28B R1BPM9];
S12 = [R1D29AA EPU4USVC R1D29AB EPU4USHC ... % 
       EPU56D EPU4DSHC R2D1AA EPU4DSVC R2D1AB];
EPU = [R1D29AA EPU4USVC R1D29AB EPU4USHC ... % 
       EPU56UD R1EPU R2EPU EPU56DD ... % 
       EPU4DSHC R2D1AA EPU4DSVC R2D1AB];
R2 = [R2BPM0 R2D1BA R2SQ0 R2D1BB ... % 
      R2HC0 R2VC1 RXD2 R2BPM1 RXD3 R2QD1 RXD4 R2HC1 RXD5 ... % 
      R2QF2 R2D6A R2VC1A R2HC1A R2D6B R2QD3 RXD7 R2BPM2 ... % 
      RXD8 BEND RXD9 R2SD1 R2VCSD1 R2SD1 RXD10 R2BPM3 RXD11 R2QF4 ... %
      R2D12A R2BPM4 R2D12B R2SF1 R2HCSF1 R2SF1 R2D13A R2D13B ... % 05/14/2009 
      IASWB R2D14A R2VC2 R2D14B ... % 05/14/2009
      BEND RXD16 R2BPM5 RXD17A R2SQ2 RXD17B ... % 
      R2SF2 R2HCSF2 R2SF2 RXD18 R2QF5 RXD19 R2BPM6 RXD20 R2SD2 R2VCSD2 R2SD2 RXD21 BEND RXD22 R2QD6 ... % 
      R2D23A R2VC3A R2HC2A R2D23B R2BPM7 R2D24A R2VCU R2D24B R2QF7 RXD25 R2HC2 RXD26 R2QD8 ... % 
      R2D27A R2BPM8 R2D27B R2HC3 R2VC3 R2D28A R2SCN1 RXD28B R2BPM9 R2U5D];
S23 = [R2U5S R3U5S];
U5 = [R2U5 R3U5];
R3 = [R3U5DAA R3VC0 R3U5DAB R3BPM0 R3U5DB R3HC0 R3VC1 RXD2 R3BPM1 RXD3 R3QD1 RXD4 R3HC1 RXD5 ... % 
      R3QF2 R3D6A R3VC1A R3HC1A R3D6B R3QD3 RXD7 R3BPM2 RXD8 BEND RXD9 ... % 
      R3SD1 R3VCSD1 R3SD1 RXD10 R3BPM3 RXD11 R3QF4 RXD12 R3SF1 R3HCSF1 R3SF1 R3D13A R3BPM4 R3D13B ... % 
      R3EPBM1 R3D13C R3VC2 R3D14 R3BPM4A R3D15 BEND ... % (EPBM)
      R3D16A R3BPM5A R3D16B R3EPBM3 R3D17A R3EPBM4 ... % (EPBM)
      R3D17B R3BPM5 R3D17C R3SF2 R3HCSF2 R3SF2 RXD18 R3QF5 RXD19 R3BPM6 RXD20 R3SD2 R3VCSD2 R3SD2 ... % 
      RXD21 BEND RXD22 R3QD6 RXD23 R3BPM7 RXD24 R3QF7 RXD25 R3HC2 ... % 
      RXD26 R3QD8]; % 01/15/2009
S34 = [R3D27 R3BPM8 RXD28 R3VC3 R3HC3 R3D29 R3D30A RSRFCAV R3D30B R3D31 ... % 01/15/2009
      R4D1A R4BPM0 R4D1B R4VC0 R4HC0 R4D2A R4SCRP R4D2B SW6HC1 SW6UD R4SW6 SW6DD SW6HC2 ... % 01/15/2009
      R4D3 R4HC0A R4VC1 R4D4 R4BPM1 R4D5]; % 01/15/2009
R4 = [R4QD1 RXD4 R4HC1 RXD5 R4QF2 R4D6A R4SQ1 R4D6B R4QD3 RXD7 R4BPM2 RXD8 BEND RXD9 ... % 
      R4SD1 R4VCSD1 R4SD1 RXD10 R4BPM3 RXD11 R4QF4 RXD12 R4SF1 R4HCSF1 R4SF1 RXD13 R4BPM4 RXD14 ... % 
      R4VC2 RXD15 BEND RXD16 R4BPM5 RXD17 R4SF2 R4HCSF2 R4SF2 RXD18 R4QF5 ... % 
      RXD19 R4BPM6 RXD20 R4SD2 R4VCSD2 R4SD2 RXD21 BEND RXD22 ... % 
      R4QD6 R4D23A R4VC3A R4HC2A R4D23B R4BPM7 ... % 
      RXD24 R4QF7 RXD25 R4HC2 RXD26 R4QD8 RXD27 R4BPM8 RXD28A R4SCN1 ... % 
      RXD28B R4VC3 R4D29 R4HC3 R4VC4 R4D30 R4BPM9]; 
S45 = [R4D31 WGHDS WGHDS R5D1A];
WDS = [R4D31 RXWD1 R4ENDHC RXWD2 R4WIG R5WIG RXWD2 R5ENDHC RXWD1 R5D1A];
WIG = [R4D31 RXWD1 R4ENDHC RXWD2 R4W20 R5W20 RXWD2 R5ENDHC RXWD1 R5D1A];
R5 = [R5BPM0 R5D1B R5HC0 R5VC0 R5D1C R5VC1 RXD2 R5BPM1 RXD3 R5QD1 RXD4 ... % 
      R5HC1 RXD5 R5QF2 R5D6A R5VC1A R5HC1A R5D6B R5QD3 ... % 
      RXD7 R5BPM2 RXD8 BEND RXD9 R5SD1 R5VCSD1 R5SD1 ... % 
      RXD10 R5BPM3 RXD11 R5QF4 RXD12 R5SF1 R5HCSF1 R5SF1 R5D13A R5SQ1 R5D13B ... % 
      R5VC2 R5D14 R5BPM4 R5D15 BEND RXD16 R5BPM5 RXD17A R5SQ2 ... % 
      RXD17B R5SF2 R5HCSF2 R5SF2 RXD18 R5QF5 RXD19 R5BPM6 RXD20 R5SD2 R5VCSD2 R5SD2 RXD21 BEND RXD22 ... % 
      R5QD6 R5D23A R5HC2A R5VC3A R5D23B R5BPM7 RXD24 R5QF7 ... % 
      RXD25 R5HC2 RXD26 R5QD8 ... % 
      R5D27 R5BPM8 R5D28A R5VC3 R5HC3 R5D28B R5SCN1 R5D28C R5BPM9];
S56 = [U9UDA R5VC4 U9UDB U9D U9DDA R6VC0 U9DDB];
R56U9 = [U9UDA R5VC4 U9UDB R5U9 R6U9 U9DDA R6VC0 U9DDB];
R6 = [R6BPM0 R6D1 R6VC1 R6HC0 RXD2 R6BPM1 RXD3 ... % 
      R6QD1 RXD4 R6HC1 RXD5 R6QF2 R6D6A R6VC1A R6HC1A R6D6B R6QD3 ... % 
      RXD7 R6BPM2 RXD8 BEND RXD9 R6SD1 R6VCSD1 R6SD1 ... % 
      RXD10 R6BPM3 RXD11 R6QF4 R6D12A R6BPM4 R6D12B ... % 01/15/2009 
      R6SF1 R6HCSF1 R6SF1 R6D13A R6D13B ... % 01/15/2009
      IASW6 R6D14A R6VC2 R6D14B BEND RXD16 R6BPM5 RXD17A R6SQ2 ... % 01/15/2009
      RXD17B R6SF2 R6HCSF2 R6SF2 RXD18 R6QF5 RXD19 R6BPM6 RXD20 R6SD2 R6VCSD2 R6SD2 RXD21 ... % 
      BEND RXD22 R6QD6 RXD23 R6BPM7 RXD24 R6QF7 RXD25 R6HC2 RXD26 R6QD8 ... % 
      R6D27 R6KICM1 R6D28 R6VC3 R6D29 R6SCN1 R6D30 R6KICM2 ... % 
      R6D31A R6VC5 R6HC4 R6D31B];

%RING = [START R1 EPU/S12 R2 U5 R3 R4 WIG/WDS/S45 R5 R56U9 R6];
RING = [START R1 EPU R2 U5 R3 S34 R4 WIG R5 R56U9 R6]; % 01/15/2009

buildlat(RING);


% Newer AT versions requires 'Energy' to be an AT field
THERING = setcellstruct(THERING, 'Energy', 1:length(THERING), Energy);

clear global FAMLIST 

% LOSSFLAG is not global in AT1.3
evalin('base','clear LOSSFLAG');   % Unfortunately it will come back
