function  setao(AO)
%SETAO - Set the MML Accelerator Object (AO)
%  setao(AO)
%  setao(FileName)
%  setao('') to browse for a file
%
%  INPUTS
%  1. AO - Accelerator Object structure or a filename where one is stored
%
%  See also getao, setad

if nargin < 1
    AO = '';
end

if iscell(AO)
    AO = cell2field(AO);
end

setappdata(0, 'AcceleratorObjects', AO);