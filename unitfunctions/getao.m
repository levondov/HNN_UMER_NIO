function  AO = getao(FileName)
%GETAO - returns the AcceleratorObject (AO)
%  AO = getao(FileName)
%
%  If FileName = 'Archive', then the AO and AD are saved to the 
%                default directory under the data root
%  If FileName = a string beside 'Archive', then the AO and AD are saved  
%                to that string name

AO = getappdata(0, 'AcceleratorObjects');

% if isempty(AO)
%     warning('AcceleratorObject not initialized');
%     return;
% end
