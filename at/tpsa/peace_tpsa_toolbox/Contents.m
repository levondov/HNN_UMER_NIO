% Truncated Power Series Algebra% TPSA Toolbox Version 1.0%% Author: Chang, Ho-Ping (also written as Ho-Ping Chang or Peace Chang)% National Synchrotron Radiation Research Center% 101 Hsin-Ann Road, Hsinchu Science-Based Industrial Park% Hsinchu 30077, Taiwan% E-mail (new): peace@nsrrc.org.tw% E-mail (old): peace@srrc.gov.tw%% Created Date: 11-Dec-2002% Updated Date:%  12-May-2003%  03-Jun-2003%  23-Jun-2003%% Terminology:% Object Oriented Programming (OOP)% Truncated Power Series Algebra (TPSA)% Truncated Power Series (TPS): The basic class of TPSA.% One-Step Index Pointer (OSIP): The nervous system of TPSA.%% References:% 1. Duane Hanselman and Bruce Littlefield, "Mastering MATLAB 6", Prentice Hall, ISBN 0-13-019468-9, 2001.% 2. Peace Chang, "Practice of the Truncated Power Series Algebra by the OOP in MATLAB".% 2. Peace Chang, "Practice of the Truncated Power Series Algebra by the OOP in MATLAB".%     (See the TPSA_Note.doc file in MATLAB-toolbox\TPSA\Document directory.)% 3. MATLAB-toolbox\TPSA\Document\TPSAatNSRRCpeace.ppt% 4. MATLAB-toolbox\TPSA\Document\TPSA_MATLAB.doc% 5. The M file, OSIP.m, in TPSA directory gives the usage of OSIP package.% 6. The M file, TPSA.m, in TPSA directory gives the usage of TPS class.%% TPSA:% >whatsnew tpsa - display the Readme.m file for the TPSA toolbox% >info tpsa - show you the Readme.m file for the TPSA toolbox% >doc TPSA - show you the Contents.m and TPSA.m in TPSA directory% >helpwin TPSA - open the Contents.m and TPSA.m files in TPSA% >methods TPS - to see how many methods or functions in TPSA/@TPS% % OSIP function-list in TPSA/OSIP% OSIP_Nerve --- generate the nerves OSIP for TPSA% OSIP_MonomialsBeginIndex --- get the beginning index of monomials% OSIP_MonomialsEndedIndex --- get the ended index of monomials% OSIP_TaylorExpanCoeOfFuns --- generate the Taylor expansion coefficients% OSIP_NumberOfMonomials --- get total number of monomials% OSIP_PowerVector2Monomial --- get the monomial-index of specified powervector% OSIP_MasterIndices --- get the indices of "master-formula"%% TPS function-list in TPSA/@TPS% methods TPS --- List functions in TPSA/@TPS% TPS --- constructor of the TPS class% SetTPS --- set the data of a TPS% GetTPS --- get the data of a TPS% display --- display TPS data% VariableOfTPS --- generate one variable of TPS% VariablesOfTPS --- generate variables of TPS% NonZeroMinOrderTPS --- get information of non-zero terms% uminus --- (-tps)% plus --- (tps+tps)% minus --- (tps-tps)% mtimes --- (tps*tps)% InverseTPS --- (1/tps)% mrdivide --- (tps/tps)% pow --- pow(tps,n)% sqrt --- sqrt(tps)% log --- log(tps) == ln(tps)% log10 --- log10(tps) == log(tps)/log(10)% sinTPS --- used for sin(tps) and cos(tps)% cosTPS --- used for sin(tps) and cos(tps)% sin --- sin(tps)% cos --- cos(tps)% tan --- tan(tps) == sin(tps)/cos(tps)% cot --- cot(tps) == cos(tps)/sin(tps)% sec --- sec(tps) == 1/cos(tps)% csc --- csc(tps) == 1/sin(tps)% exp --- exp(tps)% sinh --- sinh(tps) == (exp(tps)-exp(-tps))/2% cosh --- cosh(tps) == (exp(tps)+exp(-tps))/2% HomogeneousTPS --- extract the n-order homogeneous from a TPS% IntegralTPS --- integrate a TPS vs. x_i% DerivativeTPS --- differential TPS vs. x_i% PoissonBracket --- calculate the PoissonBracket of TPS p and q% ConcatenateTPSbyVPS --- Concatenate a TPS by a TPS-vector (VPS)% ConcatenateTPSbyMatrix --- Concatenate a TPS by a Matrix (eg. linear part of a VPS)% ConcatenateVPSbyMatrix --- Concatenate a VPS by a Matrix% BCH --- apply BCH theorem up to n-PB% TPS2VPSbyLieTransformation --- calculate the SingleLieTaylor Map (in VPS form) of a TPS% DepritLie2VPS --- Convert DepritLie to VPS form% InverseDepritLie --- take the inverse of a DepritLie% InverseSymplecticLie --- take inverse of a SymplecticLie% JacobianMatrixOfVPS --- take the Jacobian matriix of a VPS% LinearSquareMatrixOfVPS --- table the linear square matrix of a VPS% LineIntegralDiagonalTPS --- line-integral a TPS by the diagonal way% LineIntegralDiagonalVPS --- line-integral a VPS by the diagonal way% Matrix2VPS --- convert a matrix to the VPS form% NoteOfVPS2DepritLie --- a tool to calculate the nonlinear part of DepritLie from VPS% SymplecticLie2DepritLie --- convert SymplecticLie to DepritLie% SymplecticLieIntegrator --- integrate one SymplecticLie and a TPS% SymplecticLieTimes --- a SymplecticLie times another SymplecticLie% TPS2DepritLie --- convert a TPS to a DepritLie% TPS2ndOrderMapMatrix --- obtain the 2nd-order map of a TPS in matrix form% TPS2SymplecticLie --- convert a TPS to a SymplecticLie% VPS2DepritLie --- convert a VPS to a DepritLie% VPS2SingleLieTPS --- used for VPS2DepritLie to calculate the nonlinear part% VPS2SymplecticLie --- convert a VPS to a SymplecticLie%==============================================================% Copyright 2003, Peace Chang%==============================================================%